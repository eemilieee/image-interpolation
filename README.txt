	Programul efectueaza modificari la nivelul pixelilor unei imagini
cu scopul aplicarii a doua operatii specifice: redimensionarea si rotirea.

	Acestea sunt implementate prin intermediul a doua metode de interpolare
insumand mai multe functii, dupa cum urmeaza:

	~ interpolarea proximala, ce determina cel mai apropiat pixel apartinand
imaginii initiale ce ii corespunde noului pixel din imaginea finala;

	- proximal_2x2: functia realizeaza marirea unei imagini alb-negru
avand 4 pixeli astfel:

		* se determina noile dimensiuni ale imaginii conform distantei dintre
pixeli (acestia aflandu-se la distanta egala unii de altii);

		* noua imagine se "imparte" in patru blocuri de dimensiuni egale,
copiindu-se in cadrul fiecarui bloc valoarea pixelului ce ii revine
din imaginea veche;

	- proximal_2x2_RGB: functia realizeaza marirea unei imagini color
avand 4 pixeli aplicandu-se functia precedenta asupra fiecarui canal de culoare;
la sfarsit, cele 3 matrice ce reprezinta canalele de culoare se concateneaza
pentru a obtine imaginea finala;

	- proximal_coef: functia calculeaza coeficientii specifici de interpolare
pentru un set de 4 puncte vecine;

	- proximal_resize: functia realizeaza marirea unei imagini alb-negru
pe cazul general astfel:

		* se determina factorii de scalare, pe baza carora se construieste
matricea de transformare geometrica necesara redimensionarii;

		* pentru fiecare punct din imaginea rezultata se aplica inversa
matricei de transformare pentru a afla coordonatele punctului corespunzator din
imaginea initiala;

		* intrucat coordonatele obtinute nu sunt intotdeauna intregi, valorile
lor sunt aproximate la cel mai apropiat intreg (determinandu-se in acest mod
cel mai apropiat pixel necesar interpolarii);

		* dupa aducerea punctului calculat in sistemul de coordonate dorit
se determina valoarea pixelului corespunzator imaginii initiale si se plaseaza
in cadrul fotografiei finale;

	- proximal_resize_RGB: functia realizeaza marirea unei imagini color
pe cazul general aplicandu-se functia precedenta asupra fiecarui canal de culoare;
la sfarsit, cele 3 matrice ce reprezinta canalele de culoare se concateneaza
pentru a obtine imaginea finala;

	- proximal_rotate: functia realizeaza rotirea unei imagini alb-negru
cu un anumit numar de radiani astfel:

		* se construieste matricea de transformare geometrica specifica;

		* pentru fiecare punct din imaginea rezultata se aplica inversa
matricei de transformare pentru a afla coordonatele punctului corespunzator din
imaginea initiala;

		* punctul nou determinat se trece in sistemul de coordonate dorit;

		* se verifica daca punctul apartine zonei fotografiei initiale;
in caz contrar pixelul din imaginea finala va fi negru;

		* daca coordonatele pixelului calculat sunt valide, se determina cele
4 puncte inconjuratoare si coeficientii de interpolare; pe baza acestora
se calculeaza valoarea pixelului corespunzator in imaginea finala;

	- proximal_rotate_RGB: functia realizeaza rotirea unei imagini color
cu un anumit numar de radiani aplicandu-se functia precedenta asupra fiecarui
canal de culoare; la sfarsit, cele 3 matrice ce reprezinta canalele de culoare
se concateneaza pentru a obtine imaginea finala;

	~ interpolarea bicubica, ce utilizeaza 16 vecini pentru a determina
valoarea interpolata;

	- fx: functia aproximeaza derivata dupa x a functiei f(x, y);

	- fy: functia aproximeaza derivata dupa y a functiei f(x, y);

	- fxy: functia aproximeaza derivata dupa x si y a functiei f(x, y);

	- precalc_d: functia determina derivatele dx, dy, dxy pentru fiecare punct
al imaginii;

	- bicubic_coef: functia calculeaza coeficientii specifici de interpolare
pentru un set de 4 puncte vecine;

	- bicubic_resize: functia realizeaza marirea unei imagini alb-negru
pe cazul general astfel:

		* se determina factorii de scalare, pe baza carora se construieste
matricea de transformare geometrica necesara redimensionarii;

		* pentru fiecare punct din imaginea rezultata se aplica inversa
matricei de transformare pentru a afla coordonatele punctului corespunzator din
imaginea initiala;

		* coordonatele punctului nou determinat sunt aduse in sistemul
de coordonate dorit;

		* se determina cele 4 puncte cele mai apropiate de punctul calculat
anterior (care il inconjoara) si coeficientii de interpolare in
functie de acestea;

		* se trece punctul aflat in patratul unitate si se calculeaza
cu ajutorul acestuia valoarea punctului corespunzator din cadrul imaginii noi;

	- bicubic_resize_RGB: functia realizeaza marirea unei imagini color
pe cazul general aplicandu-se functia precedenta asupra fiecarui canal de culoare;
la sfarsit, cele 3 matrice ce reprezinta canalele de culoare se concateneaza
pentru a obtine imaginea finala.


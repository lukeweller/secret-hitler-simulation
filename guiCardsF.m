function guiCardsF(handles,numFascistCards,numLiberalCards,placeFlipCounter)
 hold off;
 cla(handles.gameBoard1)
 hold on;
 
 

 axes(handles.gameBoard1)
 
 axis off
 liberal = imread('Board_2.png');
 for iCnt = 1:3
     
     liberal(:,:,iCnt) = flipud(liberal(:,:,iCnt));
 end
 
 image(liberal);
 
 
 axis ([0,1200,0,900])

 fascist = imread('Board_1.png');
 for iCnt = 1:3
     
     fascist(:,:,iCnt) = flipud(fascist(:,:,iCnt));
 end
 image([0,1200],[450,900],fascist);
 axis ([0,1200,0,900])
 
 
 
 

 
 facistcard = imread('Facist_card.png');
 for iCnt = 1:3
     
     facistcard(:,:,iCnt) = flipud(facistcard(:,:,iCnt));
 end 
 
 %numFacistCards = 6;
 
 switch numFascistCards
    case 1
        image([112,272],[565,786],facistcard);
    case 2 
        image([112,272],[565,786],facistcard);
        image([276,436],[565,786],facistcard);
    case 3
        image([112,272],[565,786],facistcard);
        image([276,436],[565,786],facistcard);
        image([440,600],[565,786],facistcard);
    case 4
        image([112,272],[565,786],facistcard);
        image([276,436],[565,786],facistcard);
        image([440,600],[565,786],facistcard);
        image([604,764],[565,786],facistcard);
    case 5
        image([112,272],[565,786],facistcard);
        image([276,436],[565,786],facistcard);  
        image([440,600],[565,786],facistcard);
        image([604,764],[565,786],facistcard);
        image([768,928],[565,786],facistcard);
    case 6
        image([112,272],[565,786],facistcard);
        image([276,436],[565,786],facistcard);  
        image([440,600],[565,786],facistcard);
        image([604,764],[565,786],facistcard);
        image([768,928],[565,786],facistcard);
        image([932,1092],[565,786],facistcard);
 end
 
 
 
 
 
 liberalcard = imread('Liberal_card.png');
 for iCnt = 1:3
     
     liberalcard(:,:,iCnt) = flipud(liberalcard(:,:,iCnt));
 end 
 
 %numLiberalCards = 3;
 
 switch numLiberalCards
    case 1
        image([200,358],[118,335],liberalcard);
    case 2 
        image([200,358],[118,335],liberalcard);
        image([362,520],[118,335],liberalcard);
    case 3
        image([200,358],[118,335],liberalcard);
        image([362,520],[118,335],liberalcard);
        image([524,682],[118,335],liberalcard);
    case 4
        image([200,358],[118,335],liberalcard);
        image([362,520],[118,335],liberalcard);
        image([524,682],[118,335],liberalcard);
        image([686,844],[118,335],liberalcard);
    case 5
        image([200,358],[118,335],liberalcard);
        image([362,520],[118,335],liberalcard);
        image([524,682],[118,335],liberalcard);
        image([686,844],[118,335],liberalcard);
        image([848,1006],[118,335],liberalcard);
 end
 
 
 
 
 
 [flipdot,map,alpha] = imread('dot.png');
 
 switch placeFlipCounter
     case 0
         image([414,447],[69,102],flipdot,'AlphaData',alpha);
     case 1
         image([524,557],[69,102],flipdot,'AlphaData',alpha);
     case 2
         image([634,667],[69,102],flipdot,'AlphaData',alpha);
     case 3
         image([744,777],[69,102],flipdot,'AlphaData',alpha);
 end
 hold off
 axis off
function varargout = secretHitlerTool(varargin)
% SECRETHITLERTOOL MATLAB code for secretHitlerTool.fig
%      SECRETHITLERTOOL, by itself, creates a new SECRETHITLERTOOL or raises the existing
%      singleton*.
%
%      H = SECRETHITLERTOOL returns the handle to a new SECRETHITLERTOOL or the handle to
%      the existing singleton*.
%
%      SECRETHITLERTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECRETHITLERTOOL.M with the given input arguments.
%
%      SECRETHITLERTOOL('Property','Value',...) creates a new SECRETHITLERTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before secretHitlerTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to secretHitlerTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help secretHitlerTool

% Last Modified by GUIDE v2.5 25-Apr-2017 21:02:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @secretHitlerTool_OpeningFcn, ...
                   'gui_OutputFcn',  @secretHitlerTool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before secretHitlerTool is made visible.
function secretHitlerTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to secretHitlerTool (see VARARGIN)

% Choose default command line output for secretHitlerTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes secretHitlerTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

myData = guidata(handles.figure1);
myData.oneGame = false;
guidata(handles.figure1,myData);

hold on

 axes(handles.gameBoard1)
 title('');
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
 
 % guiCardsF(handles);
 axis off

 

 
 
% --- Outputs from this function are returned to the command line.
function varargout = secretHitlerTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in graphCheckbox.
function graphCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to graphCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of graphCheckbox


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numGamesText_Callback(hObject, eventdata, handles)
% hObject    handle to numGamesText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numGamesText as text
%        str2double(get(hObject,'String')) returns contents of numGamesText as a double


% --- Executes during object creation, after setting all properties.
function numGamesText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numGamesText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if handles.fullGameButton.Value == 1
    gameType = 1;
elseif handles.resultsButton.Value == 1
    gameType = 2;
else 
    gameType = 3;
end

switch gameType
    
    case 1
        myData = guidata(handles.figure1);
        [myData.gameCnt, myData.fascistwin, myData.hitCount, myData.hitDead] = singlegameLoopF(handles);
        
        myData.oneGame = true;
        
        guidata(handles.figure1,myData);
        myData = guidata(handles.figure1);
        if(handles.graphPopup.Value == 1)
            names = {'Liberals','Fascists'};
            data = {myData.gameCnt-myData.fascistwin myData.fascistwin};
            colors = [0 0 1; 1 0 0];
            colors2 = [];
            names2 = {};
            track = 0;
            for iCnt = 1:2
                if data{iCnt} == 0
                   
                else
                    track = track + 1;
                    names2{track} = names{iCnt};
                    colors2(track,1:3) = colors(iCnt,1:3)
                end
            end
            pie(handles.gameGraph,[myData.gameCnt-myData.fascistwin myData.fascistwin])
            title(handles.gameGraph,'Win Percentage');
            legend(handles.gameGraph,names2)
            colormap(colors2)
        end
        
           if(handles.graphPopup.Value == 2)
             names = {'Hitler Elected', 'Hitler Killed', 'Card Fascist Win', 'Card Liberal Win'};
            data = {myData.hitCount, myData.hitDead, myData.fascistwin-myData.hitCount, myData.gameCnt-myData.fascistwin-myData.hitDead};
            names2 = {};
            track = 0;
            colors = [0 1 0; 0 1 1; 1 0 0; 0 0 1];
            colors2 = [];
            for iCnt = 1:4
                if data{iCnt} == 0
                    
                    
                else
                    track = track +1;
                    names2{track} = names{iCnt};
                    colors2(track,1:3) = colors(iCnt,1:3);
                end
            end
            pie(handles.gameGraph, [myData.hitCount, myData.hitDead, myData.fascistwin-myData.hitCount, myData.gameCnt-myData.fascistwin-myData.hitDead]); 
            legend(handles.gameGraph,names2)
            colormap(colors2)
        end        
    case 2
        myData = guidata(handles.figure1);
        [myData.gameCnt, myData.fascistwin, myData.hitCount, myData.hitDead] = turnLoopF(handles);
        
        myData.oneGame = true;
        
        guidata(handles.figure1,myData);
        myData = guidata(handles.figure1);
        if(handles.graphPopup.Value == 1)
               names = {'Liberals','Fascists'};
            data = {myData.gameCnt-myData.fascistwin myData.fascistwin};
            colors = [0 0 1; 1 0 0];
            colors2 = [];
            names2 = {};
            track = 0;
            for iCnt = 1:2
                if data{iCnt} == 0
                   
                else
                    track = track + 1;
                    names2{track} = names{iCnt};
                    colors2(track,1:3) = colors(iCnt,1:3)
                end
            end
            
            pie(handles.gameGraph,[myData.gameCnt-myData.fascistwin myData.fascistwin])
            title(handles.gameGraph,'Win Percentage');
            legend(handles.gameGraph,names2)
            colormap(colors2)
        end
        if(handles.graphPopup.Value == 2)
             names = {'Hitler Elected', 'Hitler Killed', 'Card Fascist Win', 'Card Liberal Win'};
            data = {myData.hitCount, myData.hitDead, myData.fascistwin-myData.hitCount, myData.gameCnt-myData.fascistwin-myData.hitDead};
            names2 = {};
            track = 0;
            colors = [0 1 0; 0 1 1; 1 0 0; 0 0 1];
            colors2 = [];
            for iCnt = 1:4
                if data{iCnt} == 0
                    
                    
                else
                    track = track +1;
                    names2{track} = names{iCnt};
                    colors2(track,1:3) = colors(iCnt,1:3);
                end
            end
            pie(handles.gameGraph, [myData.hitCount, myData.hitDead, myData.fascistwin-myData.hitCount, myData.gameCnt-myData.fascistwin-myData.hitDead]); 
            legend(handles.gameGraph,names2)
            colormap(colors2)
        end
    case 3
        turnLoopF(handles);
end

handles.text15.Visible = 'on';
handles.graphPopup.Visible = 'on';
handles.graphCheckbox.Visible = 'on'

% --- Executes on button press in fullGameButton.
function fullGameButton_Callback(hObject, eventdata, handles)
% hObject    handle to fullGameButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fullGameButton


% --- Executes on button press in resultsButton.
function resultsButton_Callback(hObject, eventdata, handles)
% hObject    handle to resultsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of resultsButton


% --- Executes on button press in noneButton.
function noneButton_Callback(hObject, eventdata, handles)
% hObject    handle to noneButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noneButton


% --- Executes on selection change in p1pop.
function p1pop_Callback(hObject, eventdata, handles)
% hObject    handle to p1pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns p1pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from p1pop


% --- Executes during object creation, after setting all properties.
function p1pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p1pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in p2pop.
function p2pop_Callback(hObject, eventdata, handles)
% hObject    handle to p2pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns p2pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from p2pop


% --- Executes during object creation, after setting all properties.
function p2pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p2pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in p3pop.
function p3pop_Callback(hObject, eventdata, handles)
% hObject    handle to p3pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns p3pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from p3pop


% --- Executes during object creation, after setting all properties.
function p3pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p3pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in graphPopup.
function graphPopup_Callback(hObject, eventdata, handles)
% hObject    handle to graphPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graphPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graphPopup
myData = guidata(handles.figure1);
if(handles.graphPopup.Value == 1)
     names = {'Liberals','Fascists'};
            data = {myData.gameCnt-myData.fascistwin myData.fascistwin};
            colors = [0 0 1; 1 0 0];
            colors2 = [];
            names2 = {};
            track = 0;
            for iCnt = 1:2
                if data{iCnt} == 0
                   
                else
                    track = track + 1;
                    names2{track} = names{iCnt};
                    colors2(track,1:3) = colors(iCnt,1:3)
                end
            end
    pie(handles.gameGraph,[myData.gameCnt-myData.fascistwin myData.fascistwin]);
    title(handles.gameGraph,'Win Percentage');
    legend(handles.gameGraph,names2)
    colormap(colors2)
end

   if(handles.graphPopup.Value == 2)
             names = {'Hitler Elected', 'Hitler Killed', 'Card Fascist Win', 'Card Liberal Win'};
            data = {myData.hitCount, myData.hitDead, myData.fascistwin-myData.hitCount, myData.gameCnt-myData.fascistwin-myData.hitDead};
            names2 = {};
            track = 0;
            colors = [0 1 0; 0 1 1; 1 0 0; 0 0 1];
            colors2 = [];
            for iCnt = 1:4
                if data{iCnt} == 0
                    
                    
                else
                    track = track +1;
                    names2{track} = names{iCnt};
                    colors2(track,1:3) = colors(iCnt,1:3);
                end
            end
            pie(handles.gameGraph, [myData.hitCount, myData.hitDead, myData.fascistwin-myData.hitCount, myData.gameCnt-myData.fascistwin-myData.hitDead]); 
            legend(handles.gameGraph,names2)
            colormap(colors2)
end

% --- Executes during object creation, after setting all properties.
function graphPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graphPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in p5pop.
function p5pop_Callback(hObject, eventdata, handles)
% hObject    handle to p5pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns p5pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from p5pop


% --- Executes during object creation, after setting all properties.
function p5pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p5pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in p4pop.
function p4pop_Callback(hObject, eventdata, handles)
% hObject    handle to p4pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns p4pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from p4pop


% --- Executes during object creation, after setting all properties.
function p4pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p4pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function delayText_Callback(hObject, eventdata, handles)
% hObject    handle to delayText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delayText as text
%        str2double(get(hObject,'String')) returns contents of delayText as a double



% --- Executes during object creation, after setting all properties.
function delayText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delayText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

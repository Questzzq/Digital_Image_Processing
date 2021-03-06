function varargout = ui(varargin)
% UI MATLAB code for ui.fig
%      UI, by itself, creates a new UI or raises the existing
%      singleton*.
%
%      H = UI returns the handle to a new UI or the handle to
%      the existing singleton*.
%
%      UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UI.M with the given input arguments.
%
%      UI('Property','Value',...) creates a new UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ui

% Last Modified by GUIDE v2.5 24-May-2019 02:18:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ui_OpeningFcn, ...
                   'gui_OutputFcn',  @ui_OutputFcn, ...
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


% --- Executes just before ui is made visible.
function ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ui (see VARARGIN)

% Choose default command line output for ui
global D1;
global D0;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% set(handles.axes1,'visible','off')
% set(handles.axes2,'visible','off')
set(handles.axes1,'Color',[0.678 0.922 1.0])%æ?èæ¯é¢è²æè¿éæ¯èè²
set(handles.axes2,'Color',[0.678 0.922 1.0])%æ?èæ¯é¢è²æè¿éæ¯èè²
set(handles.axes3,'Color',[0.678 0.922 1.0])%æ?èæ¯é¢è²æè¿éæ¯èè²
set(handles.axes4,'Color',[0.678 0.922 1.0])%æ?èæ¯é¢è²æè¿éæ¯èè²
set(handles.axes1,'xTick',[]);
set(handles.axes1,'yTick',[]);
set(handles.axes2,'xTick',[]);
set(handles.axes2,'yTick',[]);
set(handles.axes3,'xTick',[]);
set(handles.axes3,'yTick',[]);
set(handles.axes4,'xTick',[]);
set(handles.axes4,'yTick',[]);
% handles.axes2.XAxis.Visible ='Off';
% handles.axes2.YAxis.Visible ='Off';
% handles.axes1.XAxis.Visible ='Off';
% handles.axes1.YAxis.Visible ='Off';

% --- Outputs from this function are returned to the command line.
function varargout = ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global D1;
global D0;
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% f = imread('2.jpeg');%åå¾è·¯å¾
global f
size(f)
[M,N,~] = size(f); %fä¸ºå«åªå¾å?F = fftshift(fft2(f)); % å¾åé¢å
F1=log(1+abs(F));
% figure(1);imshow(F1,[]);
% title('åå¾çè°±');
% figure;plot(abs(F(M/2+1,:))); % xæ¹åæ¨ªæªçº?% figure;plot(abs(F(:,N/2+1))); % yæ¹åæªçº¿

% æé?né¶å·´ç¹æ²å¹é·æ³¢å¨ï¼å¯ä»¥ä¿®æ¹D0ånè·å¾æ´å¥½çææã?
% u = 0:(M-1);
% v = 0:(N-1);
% [V,U] = meshgrid(v,u);
% D0 = 10;
% n = 2;
% v0 = 113;
% v1 = 145;
% D1 = abs(V-v0);
% D2 = abs(V-v1);
% H = 1./(1+(D0^2./(D1.*D2)).^n); 
% figure;imshow(H,[])
% G = fftshift(F.*H);
% g = real(ifft2(G));

% æé?né¶å·´ç¹æ²å¹é·æ³¢å¨ï¼å¯ä»¥ä¿®æ¹D0ånè·å¾æ´å¥½çææã?
% u = 0:(M-1);
% v = 0:(N-1);
% [V,U] = meshgrid(v,u);
% D0 = 10;
% n = 21;
% v0 = 160;
% v1 = 170;
% D1 = abs(U-v0);
% D2 = abs(U-v1);
% H = 1./(1+(D0^2./(D1.*D2)).^n); 
% figure;imshow(H,[])
flt = ones(size(f));
r = min(M,N)/12;
rx1 =M/2
ry1 =N/2
for i = 1:M
    for j = 1:N
          if((i-rx1)^2>=D1*D1&&(j-ry1)^2<=D0*D0)
              flt(i,j) = 0;
          end
    end
end
% figure(2);imshow(flt,[]);
% title('é·æ³¢å¸¦é?æ»¤æ³¢å?);
% æ»¤æ³¢
% G = fftshift(g.*H);
G = ifftshift(F.*flt);
g = real(ifft2(G));
% figure(3);
% subplot(1,2,1); imshow(f,[]);
% title('åå¾');
% subplot(1,2,2),imshow(g,[]);
% title('å¤çåçå?);
axes(handles.axes1);
imshow(f,'InitialMagnification','fit');
axes(handles.axes2);
imshow(g,[],'InitialMagnification','fit');
axes(handles.axes3);
imshow(flt,'InitialMagnification','fit');
axes(handles.axes4);
imshow(F1,[],'InitialMagnification','fit');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global f
[filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.tif';'*.jpeg';'*.*'},'è½½å¥å¾å');
   if isequal(filename,0)|isequal(pathname,0)
      errordlg('æ²¡æéä¸­æä»¶','åºé');
   return;
   else 
   file=[pathname,filename];
   end
f = imread(file);
axes(handles.axes1);
imshow(f);
title(date,'color','r');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global D0;
input = get(handles.edit2,'String'); %get teh input from the edit text field
D0 = str2num(input); %change from string to number
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global D1;
input = get(handles.edit3,'String'); %get teh input from the edit text field
D1 = str2num(input); %change from string to number

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

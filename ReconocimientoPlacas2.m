function varargout = ReconocimientoPlacas2(varargin)
% RECONOCIMIENTOPLACAS2 MATLAB code for ReconocimientoPlacas2.fig
%      RECONOCIMIENTOPLACAS2, by itself, creates a new RECONOCIMIENTOPLACAS2 or raises the existing
%      singleton*.
%
%      H = RECONOCIMIENTOPLACAS2 returns the handle to a new RECONOCIMIENTOPLACAS2 or the handle to
%      the existing singleton*.
%
%      RECONOCIMIENTOPLACAS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONOCIMIENTOPLACAS2.M with the given input arguments.
%
%      RECONOCIMIENTOPLACAS2('Property','Value',...) creates a new RECONOCIMIENTOPLACAS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReconocimientoPlacas2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReconocimientoPlacas2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReconocimientoPlacas2

% Last Modified by GUIDE v2.5 24-Nov-2018 23:00:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReconocimientoPlacas2_OpeningFcn, ...
                   'gui_OutputFcn',  @ReconocimientoPlacas2_OutputFcn, ...
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


% --- Executes just before ReconocimientoPlacas2 is made visible.
function ReconocimientoPlacas2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReconocimientoPlacas2 (see VARARGIN)

% Choose default command line output for ReconocimientoPlacas2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ReconocimientoPlacas2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global P;
global PL;
global n;
global nL;
global T;
global TL;
global l;
global lL;
global net;
global netL;

n=10;
zero=reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
uno=reshape([0,0,1,0,0;0,1,1,0,0;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0;0,1,1,1,0]',1,30);
dos=reshape([0,1,1,1,0;1,0,0,0,1;0,0,0,1,0;0,0,1,0,0;0,1,0,0,0;1,1,1,1,1]',1,30);
tres=reshape([0,0,1,1,0;0,1,0,0,1;0,0,0,1,0;0,0,0,0,1;0,1,0,0,1;0,0,1,1,0]',1,30);
cuatro=reshape([0,1,0,0,1;0,1,0,0,1;0,1,0,0,1;0,1,1,1,1;0,0,0,0,1;0,0,0,0,1]',1,30);
cinco=reshape([1,1,1,1,1;1,0,0,0,0;1,1,1,1,0;0,0,0,0,1;0,0,0,0,1;1,1,1,1,0]',1,30);
seis=reshape([0,1,1,1,1;1,0,0,0,0;1,1,1,1,0;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
siete=reshape([1,1,1,1,1;0,0,0,0,1;0,0,0,1,0;0,0,1,0,0;0,1,0,0,0;1,0,0,0,0]',1,30);
ocho=reshape([0,1,1,1,0;1,0,0,0,1;0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
nueve=reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0;0,0,0,0,1;0,1,1,1,0]',1,30);

P=[zero;uno;dos;tres;cuatro;cinco;seis;siete;ocho;nueve]';
d = (0:length(P(1,:))-1)';
T = de2bi(d)';

net=newff(P,T,[30,15,4]);%msereg , 'trainrp','learngdm','msereg'
net.divideFcn = '';
net.trainParam.max_fail=10;
net.trainParam.min_grad=1*10^-70;
net.trainParam.epochs = 200;
net.trainParam.lr=0.8;
net.trainParam.mc=0.3;
net = train(net,P,T);

l{1,1}=zero;
l{1,2}='0';
l{2,1}=uno;
l{2,2}='1';
l{3,1}=dos;
l{3,2}='2';
l{4,1}=tres;
l{4,2}='3';
l{5,1}=cuatro;
l{5,2}='4';
l{6,1}=cinco;
l{6,2}='5';
l{7,1}=seis;
l{7,2}='6';
l{8,1}=7;
l{8,2}='7';
l{9,1}=ocho;
l{9,2}='8';
l{10,1}=nueve;
l{10,2}='9';
set(handles.popupmenu2,'String',{'0';'1';'2';'3';'4';'5';'6';'7';'8';'9'});

        set(handles.checkbox91,'Value',P(1,1));
        set(handles.checkbox92,'Value',P(2,1));
        set(handles.checkbox93,'Value',P(3,1));
        set(handles.checkbox94,'Value',P(4,1));
        set(handles.checkbox95,'Value',P(5,1));
        set(handles.checkbox96,'Value',P(6,1));
        set(handles.checkbox97,'Value',P(7,1));
        set(handles.checkbox98,'Value',P(8,1));
        set(handles.checkbox99,'Value',P(9,1));
        set(handles.checkbox100,'Value',P(10,1));
        set(handles.checkbox101,'Value',P(11,1));
        set(handles.checkbox102,'Value',P(12,1));
        set(handles.checkbox103,'Value',P(13,1));
        set(handles.checkbox104,'Value',P(14,1));
        set(handles.checkbox105,'Value',P(15,1));
        set(handles.checkbox106,'Value',P(16,1));
        set(handles.checkbox107,'Value',P(17,1));
        set(handles.checkbox108,'Value',P(18,1));
        set(handles.checkbox109,'Value',P(19,1));
        set(handles.checkbox110,'Value',P(20,1));
        set(handles.checkbox111,'Value',P(21,1));
        set(handles.checkbox112,'Value',P(22,1));
        set(handles.checkbox113,'Value',P(23,1));
        set(handles.checkbox114,'Value',P(24,1));
        set(handles.checkbox115,'Value',P(25,1));
        set(handles.checkbox116,'Value',P(26,1));
        set(handles.checkbox117,'Value',P(27,1));
        set(handles.checkbox118,'Value',P(28,1));
        set(handles.checkbox119,'Value',P(29,1));
        set(handles.checkbox120,'Value',P(30,1));
%/////////////////////////////////////////////////////////////////////////
        
        
nL = 26;
A = reshape([1,1,1,1,1;1,0,0,0,1;1,1,1,1,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1]',1,30);
B = reshape([1,1,1,1,1;1,0,0,1,0;1,1,1,0,0;1,0,1,0,0;1,0,0,1,0;1,1,1,1,1]',1,30);
C = reshape([1,1,1,1,1;1,0,0,0,0;1,0,0,0,0;1,0,0,0,0;1,0,0,0,0;1,1,1,1,1]',1,30);
D = reshape([1,1,0,0,0;1,0,1,0,0;1,0,0,1,0;1,0,0,0,1;1,0,0,0,1;1,1,1,1,1]',1,30);
E = reshape([1,1,1,1,1;1,0,0,0,0;1,1,1,1,1;1,0,0,0,0;1,0,0,0,0;1,1,1,1,1]',1,30);
F = reshape([1,1,1,1,1;1,0,0,0,0;1,1,1,1,1;1,0,0,0,0;1,0,0,0,0;1,0,0,0,0]',1,30);
G = reshape([1,1,1,1,1;1,0,0,0,1;1,0,0,0,0;1,1,1,1,1;1,0,0,0,1;1,1,1,1,1]',1,30);
H = reshape([1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,1,1,1,1;1,0,0,0,1;1,0,0,0,1]',1,30);
I = reshape([1,1,1,1,1;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0;1,1,1,1,1]',1,30);
J = reshape([1,1,1,1,1;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0;1,1,1,0,0]',1,30);
K = reshape([1,0,0,0,1;1,0,0,1,0;1,0,1,0,0;1,0,1,0,0;1,0,0,1,0;1,0,0,0,1]',1,30);
L = reshape([1,0,0,0,0;1,0,0,0,0;1,0,0,0,0;1,0,0,0,0;1,0,0,0,0;1,1,1,1,1]',1,30);
M = reshape([1,0,0,0,1;1,1,0,1,1;1,0,1,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1]',1,30);
N = reshape([1,0,0,0,1;1,0,0,0,1;1,1,0,0,1;1,0,1,0,1;1,0,0,1,1;1,0,0,0,1]',1,30);
O = reshape([1,1,1,1,1;1,1,0,0,1;1,0,1,0,1;1,0,1,0,1;1,0,0,1,1;1,1,1,1,1]',1,30);
P1 = reshape([1,1,1,1,1;1,0,0,0,1;1,0,0,0,1;1,1,1,1,1;1,0,0,0,0;1,0,0,0,0]',1,30);
Q = reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,1,0,1;0,1,1,1,0;0,0,0,0,1]',1,30);
R = reshape([1,1,1,1,1;1,0,0,0,1;1,1,1,1,1;1,0,1,0,0;0,0,0,1,0;0,0,0,0,1]',1,30);
S = reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,0;0,1,1,1,0;1,0,0,0,1;1,1,1,1,0]',1,30);
T1 = reshape([1,1,1,1,1;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0]',1,30);
U = reshape([1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
V = reshape([1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,0,1,0;0,0,1,0,0]',1,30);
W = reshape([1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,1,0,1;1,1,0,1,1;1,0,0,0,1]',1,30);
X = reshape([1,0,0,0,1;0,1,0,1,0;0,0,1,0,0;0,0,1,0,0;0,1,0,1,0;1,0,0,0,1]',1,30);
Y = reshape([1,0,0,0,1;0,1,0,1,0;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0;0,0,1,0,0]',1,30);
Z = reshape([1,1,1,1,1;1,0,0,1,1;0,0,0,1,0;0,0,1,0,0;1,1,0,0,1;1,1,1,1,1]',1,30);

%L  ****Aqui también agreguen sus letras***
PL = [A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P1;Q;R;S;T1;U;V;W;X;Y;Z]';
dL = (0:length(PL(1,:))-1)'; 
TL = de2bi(dL)';

netL=newff(PL,TL,[50,20,4]);%msereg , 'trainrp','learngdm','msereg'
netL.divideFcn = '';
netL.trainParam.max_fail=10;
netL.trainParam.min_grad=1*10^-70;
netL.trainParam.epochs = 200;
netL.trainParam.lr=0.8;
netL.trainParam.mc=0.3;
netL = train(netL,PL,TL);

lL{1,1}=A;
lL{1,2} = 'A';
lL{2,1} = B;
lL{2,2} = 'B';
lL{3,1} = C;
lL{3,2} = 'C';
lL{4,1} = D;
lL{4,2} = 'D';
lL{5,1} = E;
lL{5,2} = 'E';
lL{6,1} = F;
lL{6,2} = 'F';
lL{7,1} = G;
lL{7,2} = 'G';
lL{8,1} = H;
lL{8,2} = 'H';
lL{9,1} = I;
lL{9,2} = 'I';
lL{10,1} = J;
lL{10,2} = 'J';
lL{11,1} = K;
lL{11,2} = 'K';
lL{12,1} = L;
lL{12,2} = 'L';
lL{13,1} = M;
lL{13,2} = 'M';
lL{14,1} = N;
lL{14,2} = 'N';
lL{15,1} = O;
lL{15,2} = 'O';
lL{16,1} = P1;
lL{16,2} = 'P';
lL{17,1} = Q;
lL{17,2} = 'Q';
lL{18,1} = R;
lL{18,2} = 'R';
lL{19,1} = S;
lL{19,2} = 'S';
lL{20,1} = T1;
lL{20,2} = 'T';
lL{21,1} = U;
lL{21,2} = 'U';
lL{22,1} = V;
lL{22,2} = 'V';
lL{23,1} = W;
lL{23,2} = 'W';
lL{24,1} = X;
lL{24,2} = 'X';
lL{25,1} = Y;
lL{25,2} = 'Y';
lL{26,1} = Z;
lL{26,2} = 'Z';
%g{n+1}=str{1};

%MODIFICAR AQUI!!!!
%Agregar sus letras al final

set(handles.popupmenu1,'String',{'A';'B';'C';'D';'E';'F';'G';'H';'I';'J';'K';'L';'M';'N';'O';'P';'Q';'R';'S';'T';'U';'V';'W';'X';'Y';'Z'});
        set(handles.checkbox1,'Value',PL(1,1));
        set(handles.checkbox2,'Value',PL(2,1));
        set(handles.checkbox3,'Value',PL(3,1));
        set(handles.checkbox4,'Value',PL(4,1));
        set(handles.checkbox5,'Value',PL(5,1));
        set(handles.checkbox6,'Value',PL(6,1));
        set(handles.checkbox7,'Value',PL(7,1));
        set(handles.checkbox8,'Value',PL(8,1));
        set(handles.checkbox9,'Value',PL(9,1));
        set(handles.checkbox10,'Value',PL(10,1));
        set(handles.checkbox11,'Value',PL(11,1));
        set(handles.checkbox12,'Value',PL(12,1));
        set(handles.checkbox13,'Value',PL(13,1));
        set(handles.checkbox14,'Value',PL(14,1));
        set(handles.checkbox15,'Value',PL(15,1));
        set(handles.checkbox16,'Value',PL(16,1));
        set(handles.checkbox17,'Value',PL(17,1));
        set(handles.checkbox18,'Value',PL(18,1));
        set(handles.checkbox19,'Value',PL(19,1));
        set(handles.checkbox20,'Value',PL(20,1));
        set(handles.checkbox21,'Value',PL(21,1));
        set(handles.checkbox22,'Value',PL(22,1));
        set(handles.checkbox23,'Value',PL(23,1));
        set(handles.checkbox24,'Value',PL(24,1));
        set(handles.checkbox25,'Value',PL(25,1));
        set(handles.checkbox26,'Value',PL(26,1));
        set(handles.checkbox27,'Value',PL(27,1));
        set(handles.checkbox28,'Value',PL(28,1));
        set(handles.checkbox29,'Value',PL(29,1));
        set(handles.checkbox30,'Value',PL(30,1));
        
        
        
        
        
% --- Outputs from this function are returned to the command line.
function varargout = ReconocimientoPlacas2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox181.
function checkbox181_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox181 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox181


% --- Executes on button press in checkbox182.
function checkbox182_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox182 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox182


% --- Executes on button press in checkbox183.
function checkbox183_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox183 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox183


% --- Executes on button press in checkbox184.
function checkbox184_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox184 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox184


% --- Executes on button press in checkbox185.
function checkbox185_Callback(~, eventdata, handles)
% hObject    handle to checkbox185 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox185


% --- Executes on button press in checkbox186.
function checkbox186_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox186 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox186


% --- Executes on button press in checkbox187.
function checkbox187_Callback(~, eventdata, handles)
% hObject    handle to checkbox187 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox187


% --- Executes on button press in checkbox188.
function checkbox188_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox188 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox188


% --- Executes on button press in checkbox189.
function checkbox189_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox189 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox189


% --- Executes on button press in checkbox190.
function checkbox190_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox190 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox190


% --- Executes on button press in checkbox191.
function checkbox191_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox191 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox191


% --- Executes on button press in checkbox192.
function checkbox192_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox192 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox192


% --- Executes on button press in checkbox193.
function checkbox193_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox193 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox193


% --- Executes on button press in checkbox194.
function checkbox194_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox194 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox194


% --- Executes on button press in checkbox195.
function checkbox195_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox195 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox195


% --- Executes on button press in checkbox196.
function checkbox196_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox196 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox196


% --- Executes on button press in checkbox197.
function checkbox197_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox197 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox197


% --- Executes on button press in checkbox198.
function checkbox198_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox198 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox198


% --- Executes on button press in checkbox199.
function checkbox199_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox199 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox199


% --- Executes on button press in checkbox200.
function checkbox200_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox200


% --- Executes on button press in checkbox201.
function checkbox201_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox201 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox201


% --- Executes on button press in checkbox202.
function checkbox202_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox202 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox202


% --- Executes on button press in checkbox203.
function checkbox203_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox203 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox203


% --- Executes on button press in checkbox204.
function checkbox204_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox204 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox204


% --- Executes on button press in checkbox205.
function checkbox205_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox205 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox205


% --- Executes on button press in checkbox206.
function checkbox206_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox206 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox206


% --- Executes on button press in checkbox207.
function checkbox207_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox207 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox207


% --- Executes on button press in checkbox208.
function checkbox208_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox208 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox208


% --- Executes on button press in checkbox209.
function checkbox209_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox209 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox209


% --- Executes on button press in checkbox210.
function checkbox210_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox210 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox210


% --- Executes on button press in checkbox151.
function checkbox151_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox151 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox151


% --- Executes on button press in checkbox152.
function checkbox152_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox152 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox152


% --- Executes on button press in checkbox153.
function checkbox153_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox153 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox153


% --- Executes on button press in checkbox154.
function checkbox154_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox154 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox154


% --- Executes on button press in checkbox155.
function checkbox155_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox155 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox155


% --- Executes on button press in checkbox156.
function checkbox156_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox156 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox156


% --- Executes on button press in checkbox157.
function checkbox157_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox157 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox157


% --- Executes on button press in checkbox158.
function checkbox158_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox158 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox158


% --- Executes on button press in checkbox159.
function checkbox159_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox159 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox159


% --- Executes on button press in checkbox160.
function checkbox160_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox160 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox160


% --- Executes on button press in checkbox161.
function checkbox161_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox161 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox161


% --- Executes on button press in checkbox162.
function checkbox162_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox162 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox162


% --- Executes on button press in checkbox163.
function checkbox163_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox163 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox163


% --- Executes on button press in checkbox164.
function checkbox164_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox164 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox164


% --- Executes on button press in checkbox165.
function checkbox165_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox165 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox165


% --- Executes on button press in checkbox166.
function checkbox166_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox166 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox166


% --- Executes on button press in checkbox167.
function checkbox167_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox167 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox167


% --- Executes on button press in checkbox168.
function checkbox168_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox168 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox168


% --- Executes on button press in checkbox169.
function checkbox169_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox169 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox169


% --- Executes on button press in checkbox170.
function checkbox170_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox170 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox170


% --- Executes on button press in checkbox171.
function checkbox171_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox171 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox171


% --- Executes on button press in checkbox172.
function checkbox172_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox172 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox172


% --- Executes on button press in checkbox173.
function checkbox173_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox173 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox173


% --- Executes on button press in checkbox174.
function checkbox174_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox174 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox174


% --- Executes on button press in checkbox175.
function checkbox175_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox175 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox175


% --- Executes on button press in checkbox176.
function checkbox176_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox176 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox176


% --- Executes on button press in checkbox177.
function checkbox177_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox177 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox177


% --- Executes on button press in checkbox178.
function checkbox178_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox178 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox178


% --- Executes on button press in checkbox179.
function checkbox179_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox179 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox179


% --- Executes on button press in checkbox180.
function checkbox180_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox180


% --- Executes on button press in checkbox121.
function checkbox121_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox121 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox121


% --- Executes on button press in checkbox122.
function checkbox122_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox122 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox122


% --- Executes on button press in checkbox123.
function checkbox123_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox123 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox123


% --- Executes on button press in checkbox124.
function checkbox124_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox124 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox124


% --- Executes on button press in checkbox125.
function checkbox125_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox125 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox125


% --- Executes on button press in checkbox126.
function checkbox126_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox126 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox126


% --- Executes on button press in checkbox127.
function checkbox127_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox127 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox127


% --- Executes on button press in checkbox128.
function checkbox128_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox128 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox128


% --- Executes on button press in checkbox129.
function checkbox129_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox129 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox129


% --- Executes on button press in checkbox130.
function checkbox130_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox130 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox130


% --- Executes on button press in checkbox131.
function checkbox131_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox131 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox131


% --- Executes on button press in checkbox132.
function checkbox132_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox132 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox132


% --- Executes on button press in checkbox133.
function checkbox133_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox133 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox133


% --- Executes on button press in checkbox134.
function checkbox134_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox134 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox134


% --- Executes on button press in checkbox135.
function checkbox135_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox135 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox135


% --- Executes on button press in checkbox136.
function checkbox136_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox136 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox136


% --- Executes on button press in checkbox137.
function checkbox137_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox137 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox137


% --- Executes on button press in checkbox138.
function checkbox138_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox138 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox138


% --- Executes on button press in checkbox139.
function checkbox139_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox139 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox139


% --- Executes on button press in checkbox140.
function checkbox140_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox140 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox140


% --- Executes on button press in checkbox141.
function checkbox141_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox141 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox141


% --- Executes on button press in checkbox142.
function checkbox142_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox142 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox142


% --- Executes on button press in checkbox143.
function checkbox143_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox143 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox143


% --- Executes on button press in checkbox144.
function checkbox144_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox144 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox144


% --- Executes on button press in checkbox145.
function checkbox145_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox145 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox145


% --- Executes on button press in checkbox146.
function checkbox146_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox146 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox146


% --- Executes on button press in checkbox147.
function checkbox147_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox147 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox147


% --- Executes on button press in checkbox148.
function checkbox148_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox148 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox148


% --- Executes on button press in checkbox149.
function checkbox149_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox149 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox149


% --- Executes on button press in checkbox150.
function checkbox150_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox150 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox150


% --- Executes on button press in checkbox91.
function checkbox91_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox91


% --- Executes on button press in checkbox92.
function checkbox92_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox92


% --- Executes on button press in checkbox93.
function checkbox93_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox93


% --- Executes on button press in checkbox94.
function checkbox94_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox94


% --- Executes on button press in checkbox95.
function checkbox95_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox95


% --- Executes on button press in checkbox96.
function checkbox96_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox96


% --- Executes on button press in checkbox97.
function checkbox97_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox97


% --- Executes on button press in checkbox98.
function checkbox98_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox98


% --- Executes on button press in checkbox99.
function checkbox99_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox99


% --- Executes on button press in checkbox100.
function checkbox100_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox100


% --- Executes on button press in checkbox101.
function checkbox101_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox101 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox101


% --- Executes on button press in checkbox102.
function checkbox102_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox102 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox102


% --- Executes on button press in checkbox103.
function checkbox103_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox103


% --- Executes on button press in checkbox104.
function checkbox104_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox104


% --- Executes on button press in checkbox105.
function checkbox105_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox105


% --- Executes on button press in checkbox106.
function checkbox106_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox106 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox106


% --- Executes on button press in checkbox107.
function checkbox107_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox107 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox107


% --- Executes on button press in checkbox108.
function checkbox108_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox108 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox108


% --- Executes on button press in checkbox109.
function checkbox109_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox109


% --- Executes on button press in checkbox110.
function checkbox110_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox110 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox110


% --- Executes on button press in checkbox111.
function checkbox111_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox111


% --- Executes on button press in checkbox112.
function checkbox112_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox112 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox112


% --- Executes on button press in checkbox113.
function checkbox113_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox113


% --- Executes on button press in checkbox114.
function checkbox114_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox114 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox114


% --- Executes on button press in checkbox115.
function checkbox115_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox115 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox115


% --- Executes on button press in checkbox116.
function checkbox116_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox116 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox116


% --- Executes on button press in checkbox117.
function checkbox117_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox117 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox117


% --- Executes on button press in checkbox118.
function checkbox118_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox118 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox118


% --- Executes on button press in checkbox119.
function checkbox119_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox119 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox119


% --- Executes on button press in checkbox120.
function checkbox120_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox120 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox120


% --- Executes on button press in checkbox61.
function checkbox61_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox61


% --- Executes on button press in checkbox62.
function checkbox62_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox62


% --- Executes on button press in checkbox63.
function checkbox63_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox63


% --- Executes on button press in checkbox64.
function checkbox64_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox64


% --- Executes on button press in checkbox65.
function checkbox65_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox65


% --- Executes on button press in checkbox66.
function checkbox66_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox66


% --- Executes on button press in checkbox67.
function checkbox67_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox67


% --- Executes on button press in checkbox68.
function checkbox68_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox68


% --- Executes on button press in checkbox69.
function checkbox69_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox69


% --- Executes on button press in checkbox70.
function checkbox70_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox70


% --- Executes on button press in checkbox71.
function checkbox71_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox71


% --- Executes on button press in checkbox72.
function checkbox72_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox72


% --- Executes on button press in checkbox73.
function checkbox73_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox73


% --- Executes on button press in checkbox74.
function checkbox74_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox74


% --- Executes on button press in checkbox75.
function checkbox75_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox75


% --- Executes on button press in checkbox76.
function checkbox76_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox76


% --- Executes on button press in checkbox77.
function checkbox77_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox77


% --- Executes on button press in checkbox78.
function checkbox78_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox78


% --- Executes on button press in checkbox79.
function checkbox79_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox79


% --- Executes on button press in checkbox80.
function checkbox80_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox80


% --- Executes on button press in checkbox81.
function checkbox81_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox81


% --- Executes on button press in checkbox82.
function checkbox82_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox82


% --- Executes on button press in checkbox83.
function checkbox83_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox83


% --- Executes on button press in checkbox84.
function checkbox84_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox84


% --- Executes on button press in checkbox85.
function checkbox85_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox85


% --- Executes on button press in checkbox86.
function checkbox86_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox86


% --- Executes on button press in checkbox87.
function checkbox87_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox87


% --- Executes on button press in checkbox88.
function checkbox88_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox88


% --- Executes on button press in checkbox89.
function checkbox89_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox89


% --- Executes on button press in checkbox90.
function checkbox90_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox90


% --- Executes on button press in checkbox31.
function checkbox31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox31


% --- Executes on button press in checkbox32.
function checkbox32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox32


% --- Executes on button press in checkbox33.
function checkbox33_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox33


% --- Executes on button press in checkbox34.
function checkbox34_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox34


% --- Executes on button press in checkbox35.
function checkbox35_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox35


% --- Executes on button press in checkbox36.
function checkbox36_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox36


% --- Executes on button press in checkbox37.
function checkbox37_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox37


% --- Executes on button press in checkbox38.
function checkbox38_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox38


% --- Executes on button press in checkbox39.
function checkbox39_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox39


% --- Executes on button press in checkbox40.
function checkbox40_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox40


% --- Executes on button press in checkbox41.
function checkbox41_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox41


% --- Executes on button press in checkbox42.
function checkbox42_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox42


% --- Executes on button press in checkbox43.
function checkbox43_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox43


% --- Executes on button press in checkbox44.
function checkbox44_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox44


% --- Executes on button press in checkbox45.
function checkbox45_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox45


% --- Executes on button press in checkbox46.
function checkbox46_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox46


% --- Executes on button press in checkbox47.
function checkbox47_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox47


% --- Executes on button press in checkbox48.
function checkbox48_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox48


% --- Executes on button press in checkbox49.
function checkbox49_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox49


% --- Executes on button press in checkbox50.
function checkbox50_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox50


% --- Executes on button press in checkbox51.
function checkbox51_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox51


% --- Executes on button press in checkbox52.
function checkbox52_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox52


% --- Executes on button press in checkbox53.
function checkbox53_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox53


% --- Executes on button press in checkbox54.
function checkbox54_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox54


% --- Executes on button press in checkbox55.
function checkbox55_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox55


% --- Executes on button press in checkbox56.
function checkbox56_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox56


% --- Executes on button press in checkbox57.
function checkbox57_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox57


% --- Executes on button press in checkbox58.
function checkbox58_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox58


% --- Executes on button press in checkbox59.
function checkbox59_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox59


% --- Executes on button press in checkbox60.
function checkbox60_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox60


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox20


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22


% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox23


% --- Executes on button press in checkbox24.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox24


% --- Executes on button press in checkbox25.
function checkbox25_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox25


% --- Executes on button press in checkbox26.
function checkbox26_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox26


% --- Executes on button press in checkbox27.
function checkbox27_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox27


% --- Executes on button press in checkbox28.
function checkbox28_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox28


% --- Executes on button press in checkbox29.
function checkbox29_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox29


% --- Executes on button press in checkbox30.
function checkbox30_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox30


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global l;
global lL;
global n;
global nL;
global P;
global PL;
temp=get(hObject,{'String','Value'});
temp=temp{1}{temp{2}};
for i=1:nL
    if strcmp(lL{i,2},temp)
        set(handles.checkbox1,'Value',PL(1,i));
        set(handles.checkbox2,'Value',PL(2,i));
        set(handles.checkbox3,'Value',PL(3,i));
        set(handles.checkbox4,'Value',PL(4,i));
        set(handles.checkbox5,'Value',PL(5,i));
        set(handles.checkbox6,'Value',PL(6,i));
        set(handles.checkbox7,'Value',PL(7,i));
        set(handles.checkbox8,'Value',PL(8,i));
        set(handles.checkbox9,'Value',PL(9,i));
        set(handles.checkbox10,'Value',PL(10,i));
        set(handles.checkbox11,'Value',PL(11,i));
        set(handles.checkbox12,'Value',PL(12,i));
        set(handles.checkbox13,'Value',PL(13,i));
        set(handles.checkbox14,'Value',PL(14,i));
        set(handles.checkbox15,'Value',PL(15,i));
        set(handles.checkbox16,'Value',PL(16,i));
        set(handles.checkbox17,'Value',PL(17,i));
        set(handles.checkbox18,'Value',PL(18,i));
        set(handles.checkbox19,'Value',PL(19,i));
        set(handles.checkbox20,'Value',PL(20,i));
        set(handles.checkbox21,'Value',PL(21,i));
        set(handles.checkbox22,'Value',PL(22,i));
        set(handles.checkbox23,'Value',PL(23,i));
        set(handles.checkbox24,'Value',PL(24,i));
        set(handles.checkbox25,'Value',PL(25,i));
        set(handles.checkbox26,'Value',PL(26,i));
        set(handles.checkbox27,'Value',PL(27,i));
        set(handles.checkbox28,'Value',PL(28,i));
        set(handles.checkbox29,'Value',PL(29,i));
        set(handles.checkbox30,'Value',PL(30,i));
    end
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global l;
global n;
global P;
temp=get(hObject,{'String','Value'});
temp=temp{1}{temp{2}};
for i=1:n
    if strcmp(l{i,2},temp)
        set(handles.checkbox91,'Value',P(1,i));
        set(handles.checkbox92,'Value',P(2,i));
        set(handles.checkbox93,'Value',P(3,i));
        set(handles.checkbox94,'Value',P(4,i));
        set(handles.checkbox95,'Value',P(5,i));
        set(handles.checkbox96,'Value',P(6,i));
        set(handles.checkbox97,'Value',P(7,i));
        set(handles.checkbox98,'Value',P(8,i));
        set(handles.checkbox99,'Value',P(9,i));
        set(handles.checkbox100,'Value',P(10,i));
        set(handles.checkbox101,'Value',P(11,i));
        set(handles.checkbox102,'Value',P(12,i));
        set(handles.checkbox103,'Value',P(13,i));
        set(handles.checkbox104,'Value',P(14,i));
        set(handles.checkbox105,'Value',P(15,i));
        set(handles.checkbox106,'Value',P(16,i));
        set(handles.checkbox107,'Value',P(17,i));
        set(handles.checkbox108,'Value',P(18,i));
        set(handles.checkbox109,'Value',P(19,i));
        set(handles.checkbox110,'Value',P(20,i));
        set(handles.checkbox111,'Value',P(21,i));
        set(handles.checkbox112,'Value',P(22,i));
        set(handles.checkbox113,'Value',P(23,i));
        set(handles.checkbox114,'Value',P(24,i));
        set(handles.checkbox115,'Value',P(25,i));
        set(handles.checkbox116,'Value',P(26,i));
        set(handles.checkbox117,'Value',P(27,i));
        set(handles.checkbox118,'Value',P(28,i));
        set(handles.checkbox119,'Value',P(29,i));
        set(handles.checkbox120,'Value',P(30,i));
    end
end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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

% --- Executes on button press in boton.
function boton_Callback(hObject, eventdata, handles)
% hObject    handle to boton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global netL;
global Placa;
Placa =' ';
z(1,1)=get(handles.checkbox1,'Value');
z(1,2)=get(handles.checkbox2,'Value');
z(1,3)=get(handles.checkbox3,'Value');
z(1,4)=get(handles.checkbox4,'Value');
z(1,5)=get(handles.checkbox5,'Value');
z(2,1)=get(handles.checkbox6,'Value');
z(2,2)=get(handles.checkbox7,'Value');
z(2,3)=get(handles.checkbox8,'Value');
z(2,4)=get(handles.checkbox9,'Value');
z(2,5)=get(handles.checkbox10,'Value');
z(3,1)=get(handles.checkbox11,'Value');
z(3,2)=get(handles.checkbox12,'Value');
z(3,3)=get(handles.checkbox13,'Value');
z(3,4)=get(handles.checkbox14,'Value');
z(3,5)=get(handles.checkbox15,'Value');
z(4,1)=get(handles.checkbox16,'Value');
z(4,2)=get(handles.checkbox17,'Value');
z(4,3)=get(handles.checkbox18,'Value');
z(4,4)=get(handles.checkbox19,'Value');
z(4,5)=get(handles.checkbox20,'Value');
z(5,1)=get(handles.checkbox21,'Value');
z(5,2)=get(handles.checkbox22,'Value');
z(5,3)=get(handles.checkbox23,'Value');
z(5,4)=get(handles.checkbox24,'Value');
z(5,5)=get(handles.checkbox25,'Value');
z(6,1)=get(handles.checkbox26,'Value');
z(6,2)=get(handles.checkbox27,'Value');
z(6,3)=get(handles.checkbox28,'Value');
z(6,4)=get(handles.checkbox29,'Value');
z(6,5)=get(handles.checkbox30,'Value');
z=z';
p={reshape(z,30,1)};
%reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
y=sim(netL,p);
y{1,:}
abs(round(y{1,:}))
salida=bi2de(abs(round(y{1,:}))')
if salida<=25
    if salida==0
        Placa = [Placa,'A']
    end
    
    if salida==1
        Placa = [Placa,'B']
    end
    
    if salida==2
        Placa = [Placa,'C']
    end
    
    if salida==3
        Placa = [Placa,'D']
    end
    
    if salida==4
        Placa = [Placa,'E']
    end
    
    if salida==5
        Placa = [Placa,'F']
    end
    if salida==6
        Placa = [Placa,'G']
    end
    if salida==7
        Placa = [Placa,'H']
    end
    if salida==8
        Placa = [Placa,'I']
    end
    if salida==9
        Placa = [Placa,'J']
    end
    if salida==10
        Placa = [Placa,'K']
    end
    if salida==11
        Placa = [Placa,'L']
    end
    if salida==12
        Placa = [Placa,'M']
    end
    if salida==13
        Placa = [Placa,'N']
    end
    if salida==14
        Placa = [Placa,'O']
    end
    if salida==15
        Placa = [Placa,'P']
    end
    if salida==16
        Placa = [Placa,'Q']
    end
    if salida==17
        Placa = [Placa,'R']
    end
    if salida==18
        Placa = [Placa,'S']
    end
    if salida==19
        Placa = [Placa,'T']
    end
    if salida==20
        Placa = [Placa,'U']
    end
    if salida==21
        Placa = [Placa,'V']
    end 
    if salida==22
        Placa = [Placa,'W']
    end 
    if salida==23
        Placa = [Placa,'X']
    end 
    if salida==24
        Placa = [Placa,'Y']
    end 
    if salida==25
        Placa = [Placa,'Z']
    end 
else
    Placa = 'desconocido'
   
    
    
end

        z2(1,1)=get(handles.checkbox31,'Value');
        z2(2,1)=get(handles.checkbox32,'Value');
        z2(3,1)=get(handles.checkbox33,'Value');
        z2(4,1)=get(handles.checkbox34,'Value');
        z2(5,1)=get(handles.checkbox35,'Value');
        z2(6,1)=get(handles.checkbox36,'Value');
        z2(7,1)=get(handles.checkbox37,'Value');
        z2(8,1)=get(handles.checkbox38,'Value');
        z2(9,1)=get(handles.checkbox39,'Value');
        z2(10,1)=get(handles.checkbox40,'Value');
        z2(11,1)=get(handles.checkbox41,'Value');
        z2(12,1)=get(handles.checkbox42,'Value');
        z2(13,1)=get(handles.checkbox43,'Value');
        z2(14,1)=get(handles.checkbox44,'Value');
        z2(15,1)=get(handles.checkbox45,'Value');
        z2(16,1)=get(handles.checkbox46,'Value');
        z2(17,1)=get(handles.checkbox47,'Value');
        z2(18,1)=get(handles.checkbox48,'Value');
        z2(19,1)=get(handles.checkbox49,'Value');
        z2(20,1)=get(handles.checkbox50,'Value');
        z2(21,1)=get(handles.checkbox51,'Value');
        z2(22,1)=get(handles.checkbox52,'Value');
        z2(23,1)=get(handles.checkbox53,'Value');
        z2(24,1)=get(handles.checkbox54,'Value');
        z2(25,1)=get(handles.checkbox55,'Value');
        z2(26,1)=get(handles.checkbox56,'Value');
        z2(27,1)=get(handles.checkbox57,'Value');
        z2(28,1)=get(handles.checkbox58,'Value');
        z2(29,1)=get(handles.checkbox59,'Value');
        z2(30,1)=get(handles.checkbox60,'Value');
z2=z2';
p={reshape(z2,30,1)};
%reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
y=sim(netL,p);
y{1,:}
abs(round(y{1,:}))
salida=bi2de(abs(round(y{1,:}))')
if salida<=25
    if salida==0
        Placa = [Placa,'A']
    end
    
    if salida==1
        Placa = [Placa,'B']
    end
    
    if salida==2
        Placa = [Placa,'C']
    end
    
    if salida==3
        Placa = [Placa,'D']
    end
    
    if salida==4
        Placa = [Placa,'E']
    end
    
    if salida==5
        Placa = [Placa,'F']
    end
    if salida==6
        Placa = [Placa,'G']
    end
    if salida==7
        Placa = [Placa,'H']
    end
    if salida==8
        Placa = [Placa,'I']
    end
    if salida==9
        Placa = [Placa,'J']
    end
    if salida==10
        Placa = [Placa,'K']
    end
    if salida==11
        Placa = [Placa,'L']
    end
    if salida==12
        Placa = [Placa,'M']
    end
    if salida==13
        Placa = [Placa,'N']
    end
    if salida==14
        Placa = [Placa,'O']
    end
    if salida==15
        Placa = [Placa,'P']
    end
    if salida==16
        Placa = [Placa,'Q']
    end
    if salida==17
        Placa = [Placa,'R']
    end
    if salida==18
        Placa = [Placa,'S']
    end
    if salida==19
        Placa = [Placa,'T']
    end
    if salida==20
        Placa = [Placa,'U']
    end
    if salida==21
        Placa = [Placa,'V']
    end 
    if salida==22
        Placa = [Placa,'W']
    end 
    if salida==23
        Placa = [Placa,'X']
    end 
    if salida==24
        Placa = [Placa,'Y']
    end 
    if salida==25
        Placa = [Placa,'Z']
    end 
else
    Placa = 'desconocido'
   
end

        z3(1,1)=get(handles.checkbox61,'Value');
        z3(2,1)=get(handles.checkbox62,'Value');
        z3(3,1)=get(handles.checkbox63,'Value');
        z3(4,1)=get(handles.checkbox64,'Value');
        z3(5,1)=get(handles.checkbox65,'Value');
        z3(6,1)=get(handles.checkbox66,'Value');
        z3(7,1)=get(handles.checkbox67,'Value');
        z3(8,1)=get(handles.checkbox68,'Value');
        z3(9,1)=get(handles.checkbox69,'Value');
        z3(10,1)=get(handles.checkbox70,'Value');
        z3(11,1)=get(handles.checkbox71,'Value');
        z3(12,1)=get(handles.checkbox72,'Value');
        z3(13,1)=get(handles.checkbox73,'Value');
        z3(14,1)=get(handles.checkbox74,'Value');
        z3(15,1)=get(handles.checkbox75,'Value');
        z3(16,1)=get(handles.checkbox76,'Value');
        z3(17,1)=get(handles.checkbox77,'Value');
        z3(18,1)=get(handles.checkbox78,'Value');
        z3(19,1)=get(handles.checkbox79,'Value');
        z3(20,1)=get(handles.checkbox80,'Value');
        z3(21,1)=get(handles.checkbox81,'Value');
        z3(22,1)=get(handles.checkbox82,'Value');
        z3(23,1)=get(handles.checkbox83,'Value');
        z3(24,1)=get(handles.checkbox84,'Value');
        z3(25,1)=get(handles.checkbox85,'Value');
        z3(26,1)=get(handles.checkbox86,'Value');
        z3(27,1)=get(handles.checkbox87,'Value');
        z3(28,1)=get(handles.checkbox88,'Value');
        z3(29,1)=get(handles.checkbox89,'Value');
        z3(30,1)=get(handles.checkbox90,'Value');
z3=z3';
p={reshape(z3,30,1)};
%reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
y=sim(netL,p);
y{1,:}
abs(round(y{1,:}))
salida=bi2de(abs(round(y{1,:}))')
if salida<=25
    if salida==0
        Placa = [Placa,'A']
    end
    
    if salida==1
        Placa = [Placa,'B']
    end
    
    if salida==2
        Placa = [Placa,'C']
    end
    
    if salida==3
        Placa = [Placa,'D']
    end
    
    if salida==4
        Placa = [Placa,'E']
    end
    
    if salida==5
        Placa = [Placa,'F']
    end
    if salida==6
        Placa = [Placa,'G']
    end
    if salida==7
        Placa = [Placa,'H']
    end
    if salida==8
        Placa = [Placa,'I']
    end
    if salida==9
        Placa = [Placa,'J']
    end
    if salida==10
        Placa = [Placa,'K']
    end
    if salida==11
        Placa = [Placa,'L']
    end
    if salida==12
        Placa = [Placa,'M']
    end
    if salida==13
        Placa = [Placa,'N']
    end
    if salida==14
        Placa = [Placa,'O']
    end
    if salida==15
        Placa = [Placa,'P']
    end
    if salida==16
        Placa = [Placa,'Q']
    end
    if salida==17
        Placa = [Placa,'R']
    end
    if salida==18
        Placa = [Placa,'S']
    end
    if salida==19
        Placa = [Placa,'T']
    end
    if salida==20
        Placa = [Placa,'U']
    end
    if salida==21
        Placa = [Placa,'V']
    end 
    if salida==22
        Placa = [Placa,'W']
    end 
    if salida==23
        Placa = [Placa,'X']
    end 
    if salida==24
        Placa = [Placa,'Y']
    end 
    if salida==25
        Placa = [Placa,'Z']
    end 
else
    Placa = 'desconocido'
   
end



global net;
z4(1,1)=get(handles.checkbox91,'Value');
z4(1,2)=get(handles.checkbox92,'Value');
z4(1,3)=get(handles.checkbox93,'Value');
z4(1,4)=get(handles.checkbox94,'Value');
z4(1,5)=get(handles.checkbox95,'Value');
z4(2,1)=get(handles.checkbox96,'Value');
z4(2,2)=get(handles.checkbox97,'Value');
z4(2,3)=get(handles.checkbox98,'Value');
z4(2,4)=get(handles.checkbox99,'Value');
z4(2,5)=get(handles.checkbox100,'Value');
z4(3,1)=get(handles.checkbox101,'Value');
z4(3,2)=get(handles.checkbox102,'Value');
z4(3,3)=get(handles.checkbox103,'Value');
z4(3,4)=get(handles.checkbox104,'Value');
z4(3,5)=get(handles.checkbox105,'Value');
z4(4,1)=get(handles.checkbox106,'Value');
z4(4,2)=get(handles.checkbox107,'Value');
z4(4,3)=get(handles.checkbox108,'Value');
z4(4,4)=get(handles.checkbox109,'Value');
z4(4,5)=get(handles.checkbox110,'Value');
z4(5,1)=get(handles.checkbox111,'Value');
z4(5,2)=get(handles.checkbox112,'Value');
z4(5,3)=get(handles.checkbox113,'Value');
z4(5,4)=get(handles.checkbox114,'Value');
z4(5,5)=get(handles.checkbox115,'Value');
z4(6,1)=get(handles.checkbox116,'Value');
z4(6,2)=get(handles.checkbox117,'Value');
z4(6,3)=get(handles.checkbox118,'Value');
z4(6,4)=get(handles.checkbox119,'Value');
z4(6,5)=get(handles.checkbox120,'Value');
z4=z4';
q={reshape(z4,30,1)};
%reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
w=sim(net,q);
w{1,:}
abs(round(w{1,:}))
salida=bi2de(abs(round(w{1,:}))')
if salida<=9
    Placa = [Placa,'-',num2str(salida)]
else
    Placa = 'desconocido'
end

        z5(1,1)=get(handles.checkbox121,'Value');
        z5(2,1)=get(handles.checkbox122,'Value');
        z5(3,1)=get(handles.checkbox123,'Value');
        z5(4,1)=get(handles.checkbox124,'Value');
        z5(5,1)=get(handles.checkbox125,'Value');
        z5(6,1)=get(handles.checkbox126,'Value');
        z5(7,1)=get(handles.checkbox127,'Value');
        z5(8,1)=get(handles.checkbox128,'Value');
        z5(9,1)=get(handles.checkbox129,'Value');
        z5(10,1)=get(handles.checkbox130,'Value');
        z5(11,1)=get(handles.checkbox131,'Value');
        z5(12,1)=get(handles.checkbox132,'Value');
        z5(13,1)=get(handles.checkbox133,'Value');
        z5(14,1)=get(handles.checkbox134,'Value');
        z5(15,1)=get(handles.checkbox135,'Value');
        z5(16,1)=get(handles.checkbox136,'Value');
        z5(17,1)=get(handles.checkbox137,'Value');
        z5(18,1)=get(handles.checkbox138,'Value');
        z5(19,1)=get(handles.checkbox139,'Value');
        z5(20,1)=get(handles.checkbox140,'Value');
        z5(21,1)=get(handles.checkbox141,'Value');
        z5(22,1)=get(handles.checkbox142,'Value');
        z5(23,1)=get(handles.checkbox143,'Value');
        z5(24,1)=get(handles.checkbox144,'Value');
        z5(25,1)=get(handles.checkbox145,'Value');
        z5(26,1)=get(handles.checkbox146,'Value');
        z5(27,1)=get(handles.checkbox147,'Value');
        z5(28,1)=get(handles.checkbox148,'Value');
        z5(29,1)=get(handles.checkbox149,'Value');
        z5(30,1)=get(handles.checkbox150,'Value');

z5=z5';
q={reshape(z5,30,1)};
%reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
w=sim(net,q);
w{1,:}
abs(round(w{1,:}))
salida=bi2de(abs(round(w{1,:}))')
if salida<=9
    Placa = [Placa,num2str(salida)]
else
    Placa = 'desconocido'
end

        z6(1,1)=get(handles.checkbox151,'Value');
        z6(2,1)=get(handles.checkbox152,'Value');
        z6(3,1)=get(handles.checkbox153,'Value');
        z6(4,1)=get(handles.checkbox154,'Value');
        z6(5,1)=get(handles.checkbox155,'Value');
        z6(6,1)=get(handles.checkbox156,'Value');
        z6(7,1)=get(handles.checkbox157,'Value');
        z6(8,1)=get(handles.checkbox158,'Value');
        z6(9,1)=get(handles.checkbox159,'Value');
        z6(10,1)=get(handles.checkbox160,'Value');
        z6(11,1)=get(handles.checkbox161,'Value');
        z6(12,1)=get(handles.checkbox162,'Value');
        z6(13,1)=get(handles.checkbox163,'Value');
        z6(14,1)=get(handles.checkbox164,'Value');
        z6(15,1)=get(handles.checkbox165,'Value');
        z6(16,1)=get(handles.checkbox166,'Value');
        z6(17,1)=get(handles.checkbox167,'Value');
        z6(18,1)=get(handles.checkbox168,'Value');
        z6(19,1)=get(handles.checkbox169,'Value');
        z6(20,1)=get(handles.checkbox170,'Value');
        z6(21,1)=get(handles.checkbox171,'Value');
        z6(22,1)=get(handles.checkbox172,'Value');
        z6(23,1)=get(handles.checkbox173,'Value');
        z6(24,1)=get(handles.checkbox174,'Value');
        z6(25,1)=get(handles.checkbox175,'Value');
        z6(26,1)=get(handles.checkbox176,'Value');
        z6(27,1)=get(handles.checkbox177,'Value');
        z6(28,1)=get(handles.checkbox178,'Value');
        z6(29,1)=get(handles.checkbox179,'Value');
        z6(30,1)=get(handles.checkbox180,'Value');

z6=z6';
q={reshape(z6,30,1)};
%reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
w=sim(net,q);
w{1,:}
abs(round(w{1,:}))
salida=bi2de(abs(round(w{1,:}))')
if salida<=9
    Placa = [Placa,num2str(salida),'-']
else
    Placa = 'desconocido'
end



        z7(1,1)=get(handles.checkbox181,'Value');
        z7(2,1)=get(handles.checkbox182,'Value');
        z7(3,1)=get(handles.checkbox183,'Value');
        z7(4,1)=get(handles.checkbox184,'Value');
        z7(5,1)=get(handles.checkbox185,'Value');
        z7(6,1)=get(handles.checkbox186,'Value');
        z7(7,1)=get(handles.checkbox187,'Value');
        z7(8,1)=get(handles.checkbox188,'Value');
        z7(9,1)=get(handles.checkbox189,'Value');
        z7(10,1)=get(handles.checkbox190,'Value');
        z7(11,1)=get(handles.checkbox191,'Value');
        z7(12,1)=get(handles.checkbox192,'Value');
        z7(13,1)=get(handles.checkbox193,'Value');
        z7(14,1)=get(handles.checkbox194,'Value');
        z7(15,1)=get(handles.checkbox195,'Value');
        z7(16,1)=get(handles.checkbox196,'Value');
        z7(17,1)=get(handles.checkbox197,'Value');
        z7(18,1)=get(handles.checkbox198,'Value');
        z7(19,1)=get(handles.checkbox199,'Value');
        z7(20,1)=get(handles.checkbox200,'Value');
        z7(21,1)=get(handles.checkbox201,'Value');
        z7(22,1)=get(handles.checkbox202,'Value');
        z7(23,1)=get(handles.checkbox203,'Value');
        z7(24,1)=get(handles.checkbox204,'Value');
        z7(25,1)=get(handles.checkbox205,'Value');
        z7(26,1)=get(handles.checkbox206,'Value');
        z7(27,1)=get(handles.checkbox207,'Value');
        z7(28,1)=get(handles.checkbox208,'Value');
        z7(29,1)=get(handles.checkbox209,'Value');
        z7(30,1)=get(handles.checkbox210,'Value');
z7=z7';
p={reshape(z7,30,1)};
%reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
y=sim(netL,p);
y{1,:}
abs(round(y{1,:}))
salida=bi2de(abs(round(y{1,:}))')
if salida<=25
    if salida==0
        Placa = [Placa,'A']
    end
    
    if salida==1
        Placa = [Placa,'B']
    end
    
    if salida==2
        Placa = [Placa,'C']
    end
    
    if salida==3
        Placa = [Placa,'D']
    end
    
    if salida==4
        Placa = [Placa,'E']
    end
    
    if salida==5
        Placa = [Placa,'F']
    end
    if salida==6
        Placa = [Placa,'G']
    end
    if salida==7
        Placa = [Placa,'H']
    end
    if salida==8
        Placa = [Placa,'I']
    end
    if salida==9
        Placa = [Placa,'J']
    end
    if salida==10
        Placa = [Placa,'K']
    end
    if salida==11
        Placa = [Placa,'L']
    end
    if salida==12
        Placa = [Placa,'M']
    end
    if salida==13
        Placa = [Placa,'N']
    end
    if salida==14
        Placa = [Placa,'O']
    end
    if salida==15
        Placa = [Placa,'P']
    end
    if salida==16
        Placa = [Placa,'Q']
    end
    if salida==17
        Placa = [Placa,'R']
    end
    if salida==18
        Placa = [Placa,'S']
    end
    if salida==19
        Placa = [Placa,'T']
    end
    if salida==20
        Placa = [Placa,'U']
    end
    if salida==21
        Placa = [Placa,'V']
    end 
    if salida==22
        Placa = [Placa,'W']
    end 
    if salida==23
        Placa = [Placa,'X']
    end 
    if salida==24
        Placa = [Placa,'Y']
    end 
    if salida==25
        Placa = [Placa,'Z']
    end 
else
    Placa = 'desconocido'
   
end
if length(Placa)>10
    Placa= 'Desconocido'
end 

set(handles.edit1,'String',Placa);


        
        


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global net;
z(1,1)=get(handles.checkbox91,'Value');
z(1,2)=get(handles.checkbox92,'Value');
z(1,3)=get(handles.checkbox93,'Value');
z(1,4)=get(handles.checkbox94,'Value');
z(1,5)=get(handles.checkbox95,'Value');
z(2,1)=get(handles.checkbox96,'Value');
z(2,2)=get(handles.checkbox97,'Value');
z(2,3)=get(handles.checkbox98,'Value');
z(2,4)=get(handles.checkbox99,'Value');
z(2,5)=get(handles.checkbox100,'Value');
z(3,1)=get(handles.checkbox101,'Value');
z(3,2)=get(handles.checkbox102,'Value');
z(3,3)=get(handles.checkbox103,'Value');
z(3,4)=get(handles.checkbox104,'Value');
z(3,5)=get(handles.checkbox105,'Value');
z(4,1)=get(handles.checkbox106,'Value');
z(4,2)=get(handles.checkbox107,'Value');
z(4,3)=get(handles.checkbox108,'Value');
z(4,4)=get(handles.checkbox109,'Value');
z(4,5)=get(handles.checkbox110,'Value');
z(5,1)=get(handles.checkbox111,'Value');
z(5,2)=get(handles.checkbox112,'Value');
z(5,3)=get(handles.checkbox113,'Value');
z(5,4)=get(handles.checkbox114,'Value');
z(5,5)=get(handles.checkbox115,'Value');
z(6,1)=get(handles.checkbox116,'Value');
z(6,2)=get(handles.checkbox117,'Value');
z(6,3)=get(handles.checkbox118,'Value');
z(6,4)=get(handles.checkbox119,'Value');
z(6,5)=get(handles.checkbox120,'Value');
z=z';
q={reshape(z,30,1)};
%reshape([0,1,1,1,0;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;1,0,0,0,1;0,1,1,1,0]',1,30);
w=sim(net,q);
w{1,:}
abs(round(w{1,:}))
salida=bi2de(abs(round(w{1,:}))')
if salida<=9
    set(handles.edit2,'String',salida);
else
    set(handles.edit2,'String','desconocido');
end

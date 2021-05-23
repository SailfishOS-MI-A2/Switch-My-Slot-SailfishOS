# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.27
# 

Name:       Switch-My-Slot

# >> macros
# << macros

Summary:    Switch My Slot
Version:    0.3
Release:    3
Group:      Qt/Qt
License:    MIT
URL:        https://github.com/SailfishOS-MI-A2/Switch-My-Slot-SailfishOS
Source0:    %{name}-%{version}.tar.bz2
Source100:  Switch-My-Slot.yaml
Requires:   sailfishsilica-qt5 >= 0.10.9
Requires:   pyotherside-qml-plugin-python3-qt5
BuildRequires:  pkgconfig(sailfishapp) >= 1.0.2
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  desktop-file-utils

%description
Switch My Slot is a SailfishOS app that helps you switch between android system A & system B slots if you are dualbooting with Android OS on an Android A/B device. This app saves you from the hassle of needing to use ssh/terminal/twrp while wanting to switch to another Android slot.


%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qmake5 

make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake5_install

# >> install post
# << install post

desktop-file-install --delete-original       \
  --dir %{buildroot}%{_datadir}/applications             \
   %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_bindir}
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
# >> files
# << files

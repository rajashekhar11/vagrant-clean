for VIRTUAL_MACHINE in $(vboxmanage list vms | cut -d '"' -f3 | sed 's/{//' | sed 's/}//'); do vboxmanage controlvm "$VIRTUAL_MACHINE" poweroff; done
for VIRTUAL_MACHINE in $(vboxmanage list vms | cut -d '"' -f3 | sed 's/{//' | sed 's/}//'); do vboxmanage unregistervm "$VIRTUAL_MACHINE" --delete; done
for i in $(vboxmanage list hostonlyifs|awk '/^Name/ {print $2}'); do vboxmanage hostonlyif remove  $i; done
for i in $(vboxmanage list dhcpservers|awk '/^NetworkName/ {print $2}'); do vboxmanage dhcpserver remove --netname $i; done

Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2333B361656
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791039435; cv=none; b=hW9dXjAHMKetxVDXEwJq7LZ1fj+FjrR5OG0NDlhkBkDdHH1PLGxzNjPKDjcGr0vrhRXWUxvY85FM/F6fnL0zzFPXaSLevK+XLWk7IFdfq3dkuX3LTr0uiAdbprezlwWo8UMrEQ33AXV/0sRWfzL0ePGi5izm0v8PON6TISKYHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791039435; c=relaxed/simple;
	bh=4lW/BssFmNITl/QT8rVYhFtSHEp3mpgUMAyeNv+oPt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E0qiU3inE6NcCC5TbTl6gxqWugpPTOLq8qG5X2uxM5rJV1bxXFyGGI1dK4dUJmXHtwBO8MuV//fuOBA7OYbn9SJYNfdHkd+/lgEHMR9xdj6RTLtKcD6Qo42QV9SCkWrudnhl5SrTEblsHw5QwVdlduTCEPpKUsCJHyBeygRN0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grothesque.org; spf=pass smtp.mailfrom=grothesque.org; dkim=pass (4096-bit key) header.d=grothesque.org header.i=@grothesque.org header.b=vX741BGg; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grothesque.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grothesque.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=grothesque.org header.i=@grothesque.org header.b="vX741BGg"
Received: from dia.uberspace.de (dia.uberspace.de [185.26.156.221])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id BDCC6180C0C
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 16:57:02 +0200 (CEST)
Received: (qmail 8386 invoked by uid 989); 3 Oct 2026 14:57:02 -0000
Authentication-Results: dia.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by dia.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sat, 03 Oct 2026 16:57:01 +0200
From: Christoph Groth <christoph@grothesque.org>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org
Subject: e1000e: I219-V RX CRC errors on ThinkPad P14s Gen6 Intel; disabling
 K1 restores throughput
Date: Sat, 03 Oct 2026 16:56:26 +0200
Message-ID: <87v77ial45.fsf@grothesque.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Rspamd-Bar: ---
X-Rspamd-Report: SIGNED_PGP(-2) MIME_GOOD(-0.2) BAYES_HAM(-1.246969)
X-Rspamd-Score: -3.446969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=grothesque.org; s=uberspace;
	h=from:to:cc:subject:date;
	bh=4lW/BssFmNITl/QT8rVYhFtSHEp3mpgUMAyeNv+oPt0=;
	b=vX741BGgH//yFAHdBwp/7itX42TSowBi0OSO6OfoQvC6GUQrZn4GOtbt3sQ96FPZd/dzebKrbN
	VK5R9jVUEFnVH8tYVkJ7aAO7HN4kXTVnxzA3s3zAUVV45lmGqpC5zPELLmDXFaRZ7SmJwYzJl0ow
	FBOH6C2bDjjo3E2C810JIP9CZb6G3R99wYznLn/8VwHoIt2Ymg6EDatzFB79L4MZEoDnSxomzO7L
	CiS2P9muTs+oC6UedS9yB0ZXk2G3Dsuy51YysaBQLNbQtrYUYf4AvxTFqCFzChE7PYejLr5eZav9
	fkHGDruB3/UORwOfq5OYD2XaJP0Hj1gkKiHP1ECGnbbwN304nZu7kg3iTVmg4VMG0tHBfH3uchQ8
	ruH0NS0GSJy0kXM9P2wX6s4E0FJygxKJraFI8Ni2ST8S0g8xCq9ddUrCV/DJpAdv3BxycnGWUXE4
	r/lCO7SLwIT1Ej9sUFA6RfJKgqOYV+fcm5CoEIM3PWl7Y/YJkV0Vvb8LZfaIuU6ad5Eh0w5SZI+p
	tgx/TiGluP+djaE/FzzESkB5U4B3DIaEFz8Uptad0jlFB+qi08ZWUPfum4Sin1spOR1ie9PRvYOk
	AE3ntzLDN5BCd5wP9Rqynp5wekwBo9vWf+wWKQOt4kw7Y3GIQhvA6s3Kw3ODRMPbuSWPZTrdVaRO
	o=

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I noticed that wired Ethernet throughput from WAN is much lower than
expected on my new ThinkPad P14s Gen6 Intel.  The culprit seems to be
CRC errors.  This is with current firmware.  I updated everything one or
two weeks ago.

Executing =E2=80=98ethtool --set-priv-flags enp0s31f6 disable-k1 on=E2=80=
=99 works
around the problem.  There could be a relation to commit 578294b8b60d
that re-enabled K1 by default.

See below for a shell session demonstrating the problem by downloading
data for 30 seconds.  With K1 enabled, the transfer generated 125 CRC
errors while receiving 156 MiB; with K1 disabled, the error counter
remained unchanged while receiving 2547 MiB (i.e. a 16-fold faster
download).  The following has been recorded using a freshly booted
current Debian testing live system.

I=E2=80=99ve been observing the same problem with different recent kernel
versions, different network cables, routers, and networks.  I also had
the opportunity to reproduce the problem with a second identical
computer.

Cheers
Christoph

=2D---------------------------------------------------------------

root@debian:~# uname -a
Linux debian 7.2.6+deb14-amd64 #1 SMP PREEMPT_DYNAMIC Debian 7.2.6-1 (2026-=
09-16) x86_64 GNU/Linux
root@debian:~# ethtool --show-priv-flags enp0s31f6
Private flags for enp0s31f6:
s0ix-enabled: on
disable-k1  : off
root@debian:~# ip -s -s link show dev enp0s31f6
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel sta=
te UP mode DEFAULT group default qlen 1000
    link/ether [hidden] brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast
         26981     189      0       0       0      72
    RX errors:  length    crc   frame    fifo overrun
                     0      0       0       0       0
    TX:  bytes packets errors dropped carrier collsns
         10442      89      0       0       0       0
    TX errors: aborted   fifo  window heartbt transns
                     0      0       0       0       2
    altname enx[hidden]
root@debian:~# curl --max-time 30 -o /dev/null http://test-debit.free.fr/10=
485760.rnd
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Curr=
ent
                                 Dload  Upload  Total   Spent   Left   Speed
  1 10.00G   1 153.9M   0      0  5.28M      0   32:18   00:29   31:49  5.5=
8M
curl: (28) Operation timed out after 30000 milliseconds with 163226929 out =
of 10737418240 bytes received
root@debian:~# ip -s -s link show dev enp0s31f6
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel sta=
te UP mode DEFAULT group default qlen 1000
    link/ether [hidden] brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast
     171179576  112998    250       0       0      96
    RX errors:  length    crc   frame    fifo overrun
                     0    125       0       0       0
    TX:  bytes packets errors dropped carrier collsns
       1102954   15430      0       0       0       0
    TX errors: aborted   fifo  window heartbt transns
                     0      0       0       0       2
    altname enx[hidden]
root@debian:~# ethtool --set-priv-flags enp0s31f6 disable-k1 on
root@debian:~# ethtool --show-priv-flags enp0s31f6
Private flags for enp0s31f6:
s0ix-enabled: on
disable-k1  : on
root@debian:~# curl --max-time 30 -o /dev/null http://test-debit.free.fr/10=
485760.rnd
  % Total    % Received % Xferd  Average Speed  Time    Time    Time   Curr=
ent
                                 Dload  Upload  Total   Spent   Left   Speed
 23 10.00G  23  2.38G   0      0 84.23M      0   02:01   00:29   01:32 104.=
7M
curl: (28) Operation timed out after 30000 milliseconds with 2670737217 out=
 of 10737418240 bytes received
root@debian:~# ip -s -s link show dev enp0s31f6
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel sta=
te UP mode DEFAULT group default qlen 1000
    link/ether [hidden] brd ff:ff:ff:ff:ff:ff
    RX:  bytes packets errors dropped  missed   mcast
    2972820757 1958686    250       0       0     122
    RX errors:  length    crc   frame    fifo overrun
                     0    125       0       0       0
    TX:  bytes packets errors dropped carrier collsns
      13144890  187359      0       0       0       0
    TX errors: aborted   fifo  window heartbt transns
                     0      0       0       0       4
    altname enx[hidden]

=2D---------------------------------------------------------------

Information from /sys/class/dmi/id/:
sys_vendor: LENOVO
product_name: 21QTS28200
product_version: ThinkPad P14s Gen 6
board_name: 21QTS28200
bios_vendor: LENOVO
bios_version: R2WET44W (1.26 )
bios_date: 06/30/2026

Information about the Ethernet adapter:
# lspci -nnvv -s 00:1f.6
00:1f.6 Ethernet controller [0200]: Intel Corporation Ethernet Connection (=
24) I219-V [8086:57a1]
	Subsystem: Lenovo Device [17aa:512b]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin D routed to IRQ 128
	IOMMU group: 17
	Region 0: Memory at af780000 (32-bit, non-prefetchable) [size=3D128K]
	Capabilities: [c8] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA PME(D0+,D1-,D2-,D3hot+,D3col=
d+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D1 PME-
	Capabilities: [d0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
		Address: 00000000fee00318  Data: 0000
	Kernel driver in use: e1000e
	Kernel modules: e1000e

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJNBAEBCgA3FiEEP6x58QAOdlLG0jena2rszJGp28QFAmrBF5oZHGNocmlzdG9w
aEBncm90aGVzcXVlLm9yZwAKCRBrauzMkanbxNEsD/9fPmeCISF8DOUMRIwhP1/x
AqCi8Pes2Lxhv9KAoqiyKOc7spP2KbUzSsZ/StPPiknlKc7w1sxnWGycm01OnBFw
WIoK5hQ2bmpJrwXaqHbzbbzha2G+nQUokz+HOZdNtUaSo17mi+4v8NSSHysjrCr2
R4oAy6xu/dVG+7TYZzXnqTOiAuPZJ91hSJUOY8r/CJ5+5+2qnxq2B3B0uNABvVgv
tqNhOdHtPOQn3Bmfrk5pQS8l2Sz6tcyHeR0P3AAfsTpthCQKakuMqvGQHdjLkJHh
sEhOIxIYlNnpLWtsiaYp8choUZKETVXEUc6zK4ZdmzTWU2FYlG590ypiiZDZTsyX
u41f/ZIcQ9azo3a4+nwElKSYJBTtRCwC8QhOojzu9pmIZbcmzjsxO7ijhJdUbYFQ
IFktfQWNyP3QSVnKhuSqy0al6D+do/dHwDj49cDedcExV4erzudrwMvFM6ypKoAo
HJRZIntbQKGP1Q4mp5pkEyTs9aJ6kXn95dDAX7WSKPYdmCS760n6YnI+clAD4wMP
y0AeEOChL7yDaxDs9d3zlewQzDxEWp0N4y7od6cLxh4qkNbiqouy/J+Vf2i1Yt3T
0kc0FqgSAc+04VZUgLTG1iYEb1WkS+9q/fuuieK5EBR06yRnuOdFO782HqWxbpN+
BaP/qHE/r3Xjzupuo+p9BQ==
=XVWp
-----END PGP SIGNATURE-----
--=-=-=--

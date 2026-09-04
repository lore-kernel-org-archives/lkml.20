Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B03B4EB7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536827; cv=none; b=psRYaaoZGgISINebiZ6LdvQtBuaXebPF3E4L3WwK9EM2pXUmgVH5WctMPn9Xg8tLQkcKiRjJhRK4vinFF33OIECCIA5uLrzO3pnpDq81MGm//e4tQhvCEOYRYDGYtTivvwTY0eojDsrLuYhd3AyWzfNQGv8WjyL2ejz4l7ugMDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536827; c=relaxed/simple;
	bh=VVFCmtmfz+SYEMiORjBxj83dyg5xcHkkArf8lTxyLO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1cW9lUT8EFe+qixaTiW7+VfSXz2HwBPkiPl7TSxKnSqCGIbtuWRWz+IApTNCCiX5+t3Yj2vXYA8fKD4nxv7oC6pWbxI+E9CwVmzwUCnUk0BaK+Az5GjP1aykat9wc/G5+Q2jQzxXayXkfv/iG04WMR6B9vmQjTCbPfuFVZZBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyRLFSE7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyRLFSE7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d9db539a54so10365465ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788536825; x=1789141625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVrwlQNPXsOj1bi27nBa50e/+k3DZd6JTxIsei01NYM=;
        b=WyRLFSE7vL+L/ZJZFMkRtcM3NFOy4+NlIe28L++wErpP+p+t0+s8x+5MqdFk1iyn2H
         gFsoxMzxPOD7XE59EojaCc4hcDTMb2ZK4bugd4wDwJPA9j8n0Upt5RnTK2XJhfBp9rna
         0rgO3RvEFF2jq2nL7B9+NCbokSuP+rRbmaUAAmWdMGnu4UMqDrmC//Qcf5vB7Z7Khyht
         LJ/XkGZnDabRwBBQMZhrbolz6oqxbCBwzXZnJle8McLE5QDFuDEhnk7tL10QV+yA5Kkl
         DeanJcDzhIpzsfOg2Z5tyvuxSbt7zI+sWh/I32+DWC0nlCoZh6b8Sp0ECAqe+fXCHTYt
         7u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536825; x=1789141625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVrwlQNPXsOj1bi27nBa50e/+k3DZd6JTxIsei01NYM=;
        b=U6FX6IKEG4YeQwKDZo2alUNgJYyYHsosgAwKUkMkdFzN7DaVxD1xSUZ10owT0GgGpg
         hWfCv0UY0K9k70CXmpp8tt6BJVxYDIYapi1YoHGSXMbKyudWbJgaKfSGrtvyJWW133+7
         UmULfKiDRl+V28r6c4iXVX0dBert0wdiVWTZP+cX8VyMm8wB5+sGUC5JyAAesAmiWf2l
         708a1agz6mHKItGs+xaw2467hZYJp/xmYrpybZ4bkb3wDmPB4S6ZK88v2QKvBHReHi0U
         6PW2/o/NO8Rne96JN9T2la0ogCE2zQ2EJ/Lah0oIoIwdm+tzK6f8ntkRB68js5mBf+j6
         1BXA==
X-Forwarded-Encrypted: i=1; AKwUvBy25KNcAhVIMryZr3lbxlAVYtmXHgQUNBAmYgcybBqNM4SD2a1mgpmXIldjKqWUUtHkSsnIqWfZog0RH8g=@vger.kernel.org
X-Gm-Message-State: AFuF++no1c09j/X02312IPgQt8opidUhcihfQ2/46o2fsTATd25ZI5QN
	qBx9RfReUpwZ8zuJqZ+40+FwcsNfHnPBWZcK1VaXAF6oJfqC5+g7hG2ydOlBfI8/tlE=
X-Gm-Gg: AYBFou2ilny9n8LwwebNgYUrhptvDcUeMIiZCRVTs7/EhGsxvNa9IalwT+2BruxMl3b
	5EbhD7AKN+0VMYYHJsYwhnvPbyznGanW57Womt7uYiTUJ93fkLXBZESuMx61OA19s42f7dlNb8G
	0/DCzbJEFz/P7f3/hBZVeZx7SqqRw7vAo4iJ8WBzesEy+ZsY2yUHwpoowFn2ouwWxvKwkvvCy97
	r66zqOyRU90v5V5GdKB8+mWcYJYI/suNkHaVhW4MKGv2pdkvr1Gi7g93bouCFRaGFnT4U6vJUQt
	uHdlg2ROkKCIdVUxfxjRydDCSwWEZDpsCVgAK6CE+qkZ0du+4mSBTQ0Q0kYzOA55rE8W67sDIwA
	3cMNa81q2yHTcUTBmht1cMF3q89RQrj4RQaB2xCjikQqfdbUvTEVDhhh+2CqWbqtr+odqX8OGXC
	DqO57AEx/QRKRvLr7LBNt3taGb+BO6klriaMBcV3bmS5j7VYd0yfLV/fgkR0292Ls2WFwHCQwjz
	JjkBArJKyGzFTb12VYX6TBDO5l0bihQFygS7kZa8zWhX1kruledrhvR5iCT3qyY3jxwVQ25fAWZ
	7P1VCMVzx328QQSyLjMZW35G
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr12239834a91.4.1788536824194;
        Fri, 04 Sep 2026 08:47:04 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm11283600a91.10.2026.09.04.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:47:03 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Sat,  5 Sep 2026 00:46:52 +0900
Message-ID: <20260904154652.65709-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Summary
=3D=3D=3D=3D=3D=3D=3D

On an AMD X870E system with an onboard ASMedia ASM4242 USB4/Thunderbolt hos=
t controller (PCI ID 1b21:2426), a specific USB Bulk-Only-Transport optical=
 drive (HL-DT-ST BD-RE BU40N, running "OmniDrive" third-party firmware) rel=
iably fails during sustained large writes (optical disc burning, i.e. SCSI =
WRITE(10) with large multi-block data-out phases) when connected through th=
is controller's ports. The Bulk-OUT data-stage URB completes with -EPROTO a=
fter transferring only part of the requested data, at an unpredictable byte=
 offset, well before completion.

The exact same physical cable, adapter, and drive succeed 100% of the time =
(byte-perfect, verified via SHA-1 against known-good reference images) on e=
very other USB controller in the same machine (a separate 10Gbps Type-C hos=
t path/controller, the chipset's own rear USB-A ports, and a front-panel Ty=
pe-C port). A second, completely different USB mass-storage device (an inte=
rnal DVD-RAM drive, HL-DT-ST DVDRAM GUD1N, attached via an unrelated ASMedi=
a USB-to-SATA bridge dongle) succeeds 100% of the time on the same problem =
controller/port that fails for the BU40N drive.

Read operations (large Bulk-IN transfers, e.g. ripping discs with the same =
drive through the same controller) have never failed in several days of pri=
or use. The failure has so far only been observed with this device/controll=
er combination during sustained higher-rate DVD+RW recording workloads. Bul=
k-OUT is necessary for the observed failure, but is not by itself sufficien=
t: CD-R and 2x DVD-RAM writes on the same device/controller combination com=
pleted successfully (see test matrix below).

I patched a local kernel to add ASM4242's PCI ID to the existing XHCI_ASMED=
IA_MODIFY_FLOWCONTROL quirk (currently only applied to PCI_DEVICE_ID_ASMEDI=
A_1042A_XHCI) as a plausible hypothesis, confirmed via dmesg that the quirk=
 was actually applied, and re-ran the exact same test: no improvement -- id=
entical failure signature. That specific hypothesis is therefore ruled out;=
 I'm reporting the raw data in case it's useful to someone who knows this c=
ontroller/quirk code better than I do.


System information
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Motherboard: MSI MPG X870E EDGE TI WIFI (MS-7E59), BIOS version 1.A82 (20=
26-03-17). Latest vendor BIOS available at time of writing is 7E59v1A90 (20=
26-05-25) -- not yet tested, see "Current understanding / open question" be=
low.
- CPU: AMD Ryzen 7 9800X3D
- Kernel: gentoo-sources-7.2.2 (essentially vanilla kernel.org 7.2.2 with G=
entoo's minimal patch set), custom-built, CONFIG_USB_XHCI_PCI=3Dy (built-in=
, not a module)
- uname -r: 7.2.2-gentoo-rikka
- IOMMU: AMD-Vi enabled, iommu=3D default (Translated domain type, lazy DMA=
 TLB invalidation), not explicitly tuned

Kernel tested: gentoo-sources 7.2.2 (all data above, including the usbmon c=
apture). Reproduced with the same userspace-visible failure signature on va=
nilla Linux 7.2.3 (sys-kernel/vanilla-sources-7.2.3, i.e. plain upstream ke=
rnel.org source, no Gentoo or other distro patches, CONFIG_LOCALVERSION set=
 to a distinct value only for identification): same device (BU40N), same bu=
s 6/ASM4242 port, same cdrecord invocation, same cdrecord/SG-level failure =
signature (resid=3D23552, SCSI status 0x0), this time at ~52 MB into the wr=
ite. usbmon was not re-captured for this run, so I can't yet confirm the un=
derlying URB-level mechanism (-EPROTO at the same point) is identical on 7.=
2.3, only that the symptom cdrecord sees is. The 7.2.2->7.2.3 changelog con=
tains no commits touching xhci, xhci-pci, any USB host controller code, ASM=
edia, or usb-storage quirks, so this result is expected, but is included as=
 direct confirmation rather than an inference from the changelog alone.


Hardware topology
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  $ lspci -nnk -s 77:00.0
  77:00.0 USB controller [0c03]: ASMedia Technology Inc. ASM4242 USB 3.2 xH=
CI Controller [1b21:2426] (rev 01)
          Subsystem: ASMedia Technology Inc. ASM4242 USB 3.2 xHCI Controller
          Kernel driver in use: xhci_hcd
          Kernel modules: xhci_pci

  $ lspci -nnk -s 78:00.0
  78:00.0 USB controller [0c03]: ASMedia Technology Inc. ASM4242 USB 4 / Th=
underbolt 3 Host Router [1b21:2425] (rev 01)
          Kernel driver in use: thunderbolt
          Kernel modules: thunderbolt

77:00.0 is the xHCI function handling USB 3.x traffic on the two USB4-capab=
le rear ports; 78:00.0 is the same physical chip's Thunderbolt/USB4 router =
function. Two rear-panel USB-C ports (the board's "USB-C 40G" ports, confir=
med by the board vendor's own port labeling) are wired to this controller a=
s usb6-1 and usb6-2 in Linux's enumeration. This is a third-party (non-Inte=
l) discrete USB4/TB3 host controller, not part of the CPU or chipset silico=
n.

Boot-time xhci_hcd log for this controller:

  xhci_hcd 0000:77:00.0: xHCI Host Controller
  xhci_hcd 0000:77:00.0: new USB bus registered, assigned bus number 6
  xhci_hcd 0000:77:00.0: hcc params 0x0200ef81 hci version 0x120 quirks 0x0=
000000200000010
  xhci_hcd 0000:77:00.0: Host supports USB 3.2 Enhanced SuperSpeed
  usb usb6: We don't know the algorithms for LPM for this host, disabling L=
PM.

Decoded quirks 0x0000000200000010 (bit numbers per current drivers/usb/host=
/xhci.h):

  - bit 4  XHCI_SPURIOUS_SUCCESS -- set generically for any controller with=
 hci_version > 0x96 (xhci.c, not ASMedia-specific)
  - bit 33 XHCI_DEFAULT_PM_RUNTIME_ALLOW -- set generically for any control=
ler with hci_version >=3D 0x120 (xhci-pci.c, not ASMedia-specific)

drivers/usb/host/xhci-pci.c's ASMedia-specific quirk table has no entry at =
all for PCI device ID 0x2426 (ASM4242). Every other ASMedia xHCI device ID =
the driver knows about -- 0x1042, 0x1142, 0x1242, 0x2142, 0x3042, 0x3242 --=
 has at least one dedicated quirk (XHCI_NO_64BIT_SUPPORT, XHCI_ASMEDIA_MODI=
FY_FLOWCONTROL, XHCI_BROKEN_STREAMS, XHCI_RESET_ON_RESUME, in various combi=
nations). ASM4242, being newer, is currently treated as a fully generic/unt=
uned xHCI 1.0+ controller.


Devices involved
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Failing device: physically an HL-DT-ST BD-RE BP71N (a slimline BD-RE drive,=
 MT1959-based controller) that has been cross-flashed to "OmniDrive v1.0.4"=
 third-party firmware built on a BU40N donor image -- a well-known communit=
y re-flash for this MT1959-family hardware (BP71N and the retail BU40N are =
the same underlying board/chipset; OmniDrive unlocks raw disc-image dumping=
 and other features). Post-flash, the drive identifies itself over SCSI INQ=
UIRY as "HL-DT-ST BD-RE BU40N 1.00", which is why it's referred to as "BU40=
N" throughout this report -- anyone trying to reproduce this should be awar=
e the reporting drive is not a stock retail BU40N, it's a re-flashed BP71N,=
 though the two are believed to be hardware-identical. The failing commands=
 are standard MMC WRITE(10), but because the firmware is non-stock, a firmw=
are-specific interaction cannot currently be ruled out.

Connected via a USB enclosure/bridge, specifically a Logitec LBD-PWB6U3ZCSW=
H external Type-C BD/DVD drive enclosure (Logitec is a Japanese peripheral =
vendor, unrelated to Logitech):

  Product: LBD USB Device
  Manufacturer: Logitec
  idVendor=3D0789, idProduct=3D0308
  bInterfaceClass=3D8 (Mass Storage), bInterfaceSubClass=3D6 (SCSI), bInter=
faceProtocol=3D80 (Bulk-Only Transport)
  Endpoints: 1x Bulk IN (0x81), 1x Bulk OUT (0x02), wMaxPacketSize=3D0x0400=
, bMaxBurst=3D15 (both directions)
  BOS SuperSpeed capability: wSpeedsSupported=3D0x000e (Full/High/SuperSpee=
d -- Low Speed only bit not set)
  Self-powered, MaxPower declared 8mA

Working comparison device: HL-DT-ST DVDRAM GUD1N (an internal drive normall=
y used over SATA, tested here externally via a USB-to-SATA bridge dongle), =
also DVD+-RW/DVD-RAM capable:

  Manufacturer: Ugreen
  usb-storage quirk match: vid 174c pid 55aa (ASMedia-family SATA bridge ch=
ipset), quirks=3D0x400000


Reproduction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Software: cdrtools (Schily) cdrecord 3.02a09 (ProDVD build). Example comman=
d used throughout (DVD+RW media, single-track .iso data write, no audio -- =
this class of bug is unrelated to CD-DA/audio-track handling):

  cdrecord dev=3D/dev/sgN speed=3D8 -v driveropts=3Dburnfree -data "<3.9GB =
PS2 disc image>.iso"

cdrecord itself reports the write mode explicitly, so "SAO" below is taken =
directly from its output rather than assumed:

  Starting to write CD/DVD/BD at speed 8 in real SAO mode for single sessio=
n.

Every failure has the same signature reported by cdrecord/the SG driver:

  cdrecord: I/O error. write_g1: scsi sendcmd: retryable error
  CDB:  2A 00 00 00 <LBA:4B> 00 00 10 00      (WRITE(10), 16 blocks =3D 327=
68 bytes)
  status: 0x0 (GOOD STATUS)
  resid: 23552

32768 - 23552 =3D 9216 -- i.e. only 9216 of the requested 32768 bytes were =
actually transferred. cdrecord reports a SCSI status byte of 0x0 together w=
ith a non-zero residual count and a transport error; this does not represen=
t successful completion of the command. Failures have occurred at wildly di=
fferent points in the write: as little as ~350 KB in, as much as ~64 MB in,=
 over six independent attempts -- there is no fixed offset, no fixed LBA, s=
trongly arguing against a fixed media defect or fixed-LBA/content trigger.


Controlled-variable test matrix
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

All burns below wrote either DVD+RW media, a blank CD-R, or DVD-RAM media, =
with known-good disc images (PS1/PS2 titles) whose SHA-1 was independently =
verified against redump.org reference hashes both before and, on success, a=
fter burning. "Bus" numbers are this system's Linux USB bus enumeration.

 1. BU40N, DVD+RW (cdrecord, SAO), original bundled Type-C cable, bus 6 por=
t 1 (ASM4242), SuperSpeed -> FAIL (~26 MB)

 2. BU40N, DVD+RW speed=3D6 instead of 8, same cable, bus 6 port 1 (ASM4242=
), SuperSpeed -> FAIL, faster (~0.35 MB)

 3. BU40N, DVD+RW (usbmon capture, see below), same cable, bus 6 port 1 (AS=
M4242), SuperSpeed -> FAIL (~64 MB)

 4. BU40N, CD-R (cdrdao, SAO, mixed-mode data+audio), same cable, bus 6 por=
t 1 (ASM4242), SuperSpeed -> OK, byte-perfect (both a --simulate dry run an=
d a real burn)

 5. BU40N, DVD-RAM (cdrecord, random-access write, forced to 2x by media/dr=
ive), same cable, bus 6 port 1 (ASM4242), SuperSpeed -> OK, byte-perfect, 1=
.39 GB, 17.5 min

 6. BU40N, DVD+RW, 3rd-party Type-C->USB-A cable via a USB 2.0 High-Speed-o=
nly hub, rear USB-A (via hub, not ASM4242), High-Speed -> OK, byte-perfect

 7. BU40N, DVD+RW, same 3rd-party cable direct, rear USB-A (not ASM4242), S=
uperSpeed -> OK, byte-perfect

 8. BU40N, DVD+RW, same cable + USB-A->Type-C adapter, bus 6 port 1 (ASM424=
2), SuperSpeed -> FAIL (~21 MB)

 9. BU40N, DVD+RW, same cable+adapter, front-panel Type-C (not ASM4242), Su=
perSpeed -> OK, byte-perfect

10. BU40N, DVD+RW, same cable+adapter, bus 6 port 1 (ASM4242) again, SuperS=
peed -> FAIL, reproduced (~20 MB)

11. BU40N, DVD+RW with connector flipped 180 degrees, same cable+adapter, b=
us 6 port 1 (ASM4242), SuperSpeed -> FAIL (~9 MB) -- rules out a single-pin=
/orientation-specific contact fault

12. BU40N, DVD+RW, same cable+adapter, bus 6 port 2 (ASM4242, 2nd port), Su=
perSpeed -> FAIL (~21 MB) -- rules out "just this one physical port"

13. BU40N, DVD+RW, same cable+adapter, separate USB-C 10G controller (not A=
SM4242), SuperSpeed -> OK, byte-perfect

14. BU40N, DVD+RW, original bundled cable (the one from test #1), separate =
USB-C 10G controller (not ASM4242), SuperSpeed -> OK, byte-perfect -- the o=
riginally-suspected cable was never actually at fault

15. GUD1N, DVD+RW (same physical disc as tests #1-3 and #6-14), Ugreen USB-=
SATA bridge, separate USB-C 10G controller, SuperSpeed -> OK, byte-perfect

16. GUD1N, DVD+RW (same physical disc), same bridge, bus 6 port 1 (ASM4242)=
 -- the exact port that fails for BU40N, SuperSpeed -> OK, byte-perfect -- =
same media/workload, same problem port, different drive+bridge stack

Tests 4 and 5 are the important negative controls: the same device, the sam=
e cable, and the same problem controller/port, but a different media type a=
nd write mode, both completed without error. This is evidence that neither =
the device nor the controller is unconditionally broken for writes -- whate=
ver is going wrong is specific to some property of the higher-rate, real-ti=
me DVD+RW recording (SAO) workload that CD-R recording (also SAO, but a low=
er data rate) and DVD-RAM (random-access, no real-time constraint) don't sh=
are.

Test 16 holds media and host port fixed while swapping the drive: the same =
physical DVD+RW disc (confirmed via matching sector count in -media-info) u=
sed in the DVD+RW tests above, on the same bus 6/ASM4242 port, with the fai=
ling drive+bridge -- BU40N behind the Logitec 0789:0308 bridge -- replaced =
by a different drive behind a different bridge -- GUD1N behind an Ugreen/AS=
Media-174c:55aa bridge -- and it succeeds. This is *not* a single-variable =
substitution: both the optical drive and its USB bridge chipset changed tog=
ether, so this result alone cannot separate "something about the BU40N driv=
e itself" from "something about the Logitec 0789:0308 bridge" as the necess=
ary ingredient on the device side. What it does establish, combined with te=
st 5 (BU40N itself succeeding at a different, non-SAO write mode on the sam=
e port/controller), is that "this port/controller" alone is not sufficient =
to cause the fault -- some property of the {BU40N, Logitec bridge} pair, to=
gether with the DVD+RW SAO write mode, is also required. Exactly what that =
property is -- and whether it belongs to the drive or the bridge -- is stil=
l open; none of these have been isolated yet.

Read-only workloads (large sequential Bulk-IN, i.e. disc dumping/ripping wi=
th this same drive through this same controller) have been run successfully=
 many times over several days prior to this investigation -- the fault has =
only ever been observed on writes.


usbmon capture: exact failure mechanism
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

usbmon (/sys/kernel/debug/usb/usbmon/6u) was captured across a live failure=
 (test #3 above). Reconstructing the Bulk-Only-Transport command/data/statu=
s sequence (Bo =3D bulk-out on this device's endpoint 2, Bi =3D bulk-in on =
endpoint 1):

Two immediately preceding, fully successful WRITE(10) commands (16 blocks /=
 32768 bytes each), shown for contrast -- CBW sent, full 32768-byte data st=
age transferred, CSW with residue=3D0 and status=3D0 returned:

  S Bo:6:004:2 -115 31 =3D 55534243 db0b0000 00800000 00000a2a 00000080 500=
00010 00000000 000000
      <- CBW, tag db0b0000, LBA=3D0x8050, 16 blocks
  C Bo:6:004:2 0 31 >
  S Bo:6:004:2 -115 32768 =3D 00000000 00000000 ...
      <- data-out stage begins
  C Bo:6:004:2 0 32768 >
      <- completes in full
  S Bi:6:004:1 -115 13 <
  C Bi:6:004:1 0 13 =3D 55534253 db0b0000 00000000 00
      <- CSW: "USBS", tag matches, residue=3D0, status=3D0 (success)

  S Bo:6:004:2 -115 31 =3D 55534243 dc0b0000 00800000 00000a2a 00000080 600=
00010 00000000 000000
      <- next CBW, LBA=3D0x8060
  C Bo:6:004:2 0 31 >
  S Bo:6:004:2 -115 32768 =3D 00000020 60606060 00801474 be60c23e ...
  C Bo:6:004:2 0 32768 >
  S Bi:6:004:1 -115 13 <
  C Bi:6:004:1 0 13 =3D 55534253 dc0b0000 00000000 00
      <- again residue=3D0

The failing command immediately after:

  S Bo:6:004:2 -115 31 =3D 55534243 dd0b0000 00800000 00000a2a 00000080 700=
00010 00000000 000000
      <- CBW, tag dd0b0000, LBA=3D0x8070 (matches cdrecord's failing CDB ex=
actly)
  C Bo:6:004:2 0 31 >
      <- CBW itself transmits fine
  S Bo:6:004:2 -115 32768 =3D 28cc113f 98f95a3f 9acc113f 00000000 10000000 =
0b001400 01000000 00000000
      <- data-out stage begins
  C Bo:6:004:2 -71 9216 >
      <- completes with -EPROTO after only 9216 of 32768 bytes

32768 - 9216 =3D 23552, exactly matching the resid cdrecord/SG reported. Th=
e Bulk-OUT data-stage URB itself is torn down mid-transfer with -EPROTO; th=
ere is no CSW for this command at all -- this is a real transport-layer fai=
lure on the OUT direction, not a device politely reporting a short/partial =
write via a normal CSW.

Immediately following the -71, the driver performs port-level recovery (hub=
 port status/feature requests on the root hub, device 1) -- this is what pr=
oduces the "usb 6-1: reset SuperSpeed USB device" line seen in dmesg. The r=
eset is initiated by usb-storage's own error-recovery path reacting to the =
-EPROTO, not something visibly flagged by xhci_hcd itself before that point=
 -- no xhci_hcd-level error/warning is printed anywhere near the failure (I=
 checked journalctl -k with sub-second precision across the exact failure w=
indow both times).

The same capture also contains four earlier Bulk-IN URB completions with -3=
2 (-EPIPE, endpoint STALL), all of which were recovered transparently by us=
b-storage without the error surfacing to cdrecord. Their relationship, if a=
ny, to the later fatal Bulk-OUT -EPROTO is currently unknown.


Hypothesis tested and falsified: XHCI_ASMEDIA_MODIFY_FLOWCONTROL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Given ASM4242 has zero ASMedia-specific quirks applied, and the name of the=
 existing XHCI_ASMEDIA_MODIFY_FLOWCONTROL quirk (currently gated to PCI_DEV=
ICE_ID_ASMEDIA_1042A_XHCI only, calling usb_asmedia_modifyflowcontrol() whi=
ch writes ASMedia's own ASMT_FLOWCTL_ADDR vendor register via PCI config sp=
ace at controller reset/resume time -- see drivers/usb/host/pci-quirks.c) s=
ounded like a plausible match for a "loses data under sustained OUT through=
put" symptom, I patched a local kernel to test it:

  --- a/drivers/usb/host/xhci-pci.c
  +++ b/drivers/usb/host/xhci-pci.c
  @@
   #define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
   #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
  +#define PCI_DEVICE_ID_ASMEDIA_4242_XHCI			0x2426
  @@
   	if (pdev->vendor =3D=3D PCI_VENDOR_ID_ASMEDIA &&
  -		pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
  +		(pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_1042A_XHCI ||
  +		 pdev->device =3D=3D PCI_DEVICE_ID_ASMEDIA_4242_XHCI))
   		xhci->quirks |=3D XHCI_ASMEDIA_MODIFY_FLOWCONTROL;

Built and booted a separate kernel (distinct CONFIG_LOCALVERSION, so the kn=
own-good kernel remained untouched/bootable in parallel via GRUB). Confirme=
d via dmesg the quirk actually took effect before testing:

  xhci_hcd 0000:77:00.0: hcc params 0x0200ef81 hci version 0x120 quirks 0x0=
000000210000010

(quirks value gained bit 28, 0x10000000, exactly XHCI_ASMEDIA_MODIFY_FLOWCO=
NTROL -- this bit has no other setter anywhere in the tree, so this is unam=
biguous confirmation the patched code path ran).

Re-ran the identical test (test #3/#8's exact configuration: BU40N, bus 6 p=
ort 1, same cdrecord invocation). Result: identical failure, resid=3D23552,=
 this time at ~33 MB. No improvement whatsoever.

Conclusion: XHCI_ASMEDIA_MODIFY_FLOWCONTROL does not address this issue. Wh=
atever causes this ASM4242/device interoperability failure, it is not the s=
ame class of problem that quirk fixes for the ASM1042A.


Current understanding / open question
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Symptom boundary established via controlled substitution across device, cab=
le, adapter, connector orientation, port, and host controller (see matrix a=
bove), refined further by the media/write-mode negative controls (tests 4-5=
):

The failure has so far only been observed with this device/controller combi=
nation during sustained higher-rate DVD+RW recording workloads (SAO real-ti=
me mode). Bulk-OUT direction is necessary for the observed failure, but is =
not by itself sufficient: CD-R (also SAO, lower data rate) and DVD-RAM (ran=
dom-access, no real-time constraint) writes on the exact same device/cable/=
controller/port completed successfully every time. Cable, adapter, and USB-=
C connector orientation have all been positively ruled out through direct s=
ubstitution. The ASM4242 controller path has been shown to be a necessary c=
ondition (BU40N behind the same drive+bridge succeeds on every other contro=
ller tested). The "device" side has only been substituted as a unit -- BU40=
N plus its Logitec 0789:0308 bridge, swapped for GUD1N plus an unrelated Ug=
reen/ASMedia-174c:55aa bridge -- so while something about that pairing is n=
ecessary (removing it, while holding the controller/port fixed, eliminates =
the fault), whether that something belongs to the BU40N drive itself or to =
the Logitec bridge chipset has not been isolated. Neither the controller no=
r the {BU40N, Logitec bridge} pairing is unconditionally broken for all wri=
tes (see the CD-R/DVD-RAM negative controls above).

I don't have the expertise to go further than this without more knowledge o=
f either the ASM4242 xHCI silicon/firmware internals, or of what's differen=
t about the transfer cadence/timing of a real-time DVD+RW SAO write versus =
CD-R SAO or DVD-RAM writes, or of what's unusual about this particular devi=
ce's Bulk-OUT endpoint behavior that a "more standard" mass-storage bridge =
(the ASMedia-SATA-bridge-based GUD1N setup, which succeeds on the identical=
 controller) doesn't trigger. Firmware/BIOS updates for the board and for t=
he ASM4242 chip itself exist and are newer than what's currently installed,=
 but I have not yet tested them (would need to move to Windows for the ASM4=
242-specific firmware updater tool). I'm filing this now because the usbmon=
 data and the controlled-variable matrix seemed worth recording regardless =
of whether the eventual fix turns out to be firmware-side.

Happy to test further patches, gather more usbmon captures, or provide the =
full raw usbmon binary capture if useful.


Data available on request
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

  - Full usbmon text capture spanning the failure shown above
  - lsusb -v for both the Logitec/BU40N bridge and the Ugreen/GUD1N bridge
  - Full dmesg/journalctl -k boot log for both the unpatched and patched ke=
rnel
  - The two-line kernel patch described above (trivial, included in full ab=
ove)

Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693223D7F0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881926; cv=none; b=MhnI4ETi6oOyv/RtOSOr4fV4UzIKWl3GcHLL12VblpfD+WFrN6hfJ2GS96zazinkRoIDuDqiTfUnRaMVoSi5sutoFK7vOruq5bPRGks6LNJAy918+O7vLVoTCQBFDwtz5Bi75JnhF0Q2aC01NysYm4m+egt3zeg5Qc+kOgPP0EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881926; c=relaxed/simple;
	bh=MZxs18QuqMxTqhr3i9ZFeoIy6F2zwLs8fy77XzN8oi4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=e7BcMXIkbPSfpq9yTSCXiEpyKBBywh2hS9YChUJdcOnrcbWbYVXciTIV9pWCDLufSoauxlzzvfc/LHEfOLfAr85vEAFdAqItYxtzabWmLr5V8SUWI+gTFgBNcJezA6B/aph8v+Pw29AKe5FUuzNfxtujkfsPVdjNYgZEVEjv4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb6a8c61deso223463a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881923; x=1788486723;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBQmwHzHvpUVjSLASbBEHCNfT2w3Qx8nTTI95YgWCvE=;
        b=mYwGG3nZjqjZDVqChxZJjDzgOAYCYE1r8qA5u64HsTCHyIL4F4yZKxZJwIsDc5czax
         6ct7pehiVLHFg31HRWv8Dp7jD+wnh4azdtzngoK0dP/r0v/gUQIcOA7BHtsdDAyOfe3P
         TmP4xWJPdlSkjjjyl9K6dkH+HrJmSrKjOtlzFBYDKtLwut6p17H6KsP1tIpPkWd+vUsa
         kW5WW2atJj6LdW8KT/33lQyxClH206qBuMA0AGGQ+SwGDADxWKDoNHzQgSYpsTf+QWdy
         BtEsnB0rW74DKkZRIIMmf28Vxy2RnQaOkDQXpeIC4gBi9Ga1thRbgGl7XR15VnlacBjk
         DXwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhwUKoXcWHAse25rj7HGf/oMC/QB/3LBpr9eXbgTJrt4pZqyGf/8qHkTxPUvO3HCfwUnjzN2gYHB2LaeU=@vger.kernel.org
X-Gm-Message-State: AFuF++lr9aBHbGBD3GVNm75C4r564Wy8UGzp1NomB7QkcmrPDaB/KXQL
	Tyhl9fUJYkq50eG39tGtVMYRdBdf5hsJsVvU9UJOEZKO1kXu5MFb1v71u39Y8IWYWPq+/DNLWAw
	ugwb//+WdyeOpASgmNfxM3Rvd7RrzJUl/D4kBEgFHSKXc12wsClCQhuvA1b4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1a08:b0:6b0:19bc:fd14 with SMTP id
 006d021491bc7-6b1c674b4c4mr3068767eaf.32.1787881923463; Thu, 27 Aug 2026
 18:52:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:52:03 -0700
In-Reply-To: <20260828012840.12003-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a90e9c3.27659fcc.2ceef7.0017.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in keyspan_break_ctl
From: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

0737418240 ms ovfl timer
[    4.533726][    T1] kvm_amd: CPU 0 isn't AMD or Hygon
[    4.533777][    T1] clocksource: tsc: mask: 0xffffffffffffffff max_cycle=
s: 0x257a472b559, max_idle_ns: 440795210424 ns
[    4.546396][    T1] clocksource: Switched to clocksource tsc
[    4.591367][    T1] Initialise system trusted keyrings
[    4.596578][    T1] workingset: timestamp_bits=3D40 (anon: 35) max_order=
=3D20 bucket_order=3D0 (anon: 0)
[    4.602197][    T1] DLM installed
[    4.605411][    T1] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    4.611459][    T1] NFS: Registering the id_resolver key type
[    4.611575][    T1] Key type id_resolver registered
[    4.611583][    T1] Key type id_legacy registered
[    4.611770][    T1] nfs4filelayout_init: NFSv4 File Layout Driver Regist=
ering...
[    4.611848][    T1] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Drive=
r Registering...
[    4.614137][    T1] smbdirect: subsystem loading...
[    4.619280][    T1] smbdirect: subsystem loaded
[    4.655793][    T1] Key type cifs.spnego registered
[    4.656089][    T1] Key type cifs.idmap registered
[    4.659755][    T1] ntfs3: Enabled Linux POSIX ACLs support
[    4.659769][    T1] ntfs3: Read-only LZX/Xpress compression included
[    4.660173][    T1] jffs2: version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-20=
06 Red Hat, Inc.
[    4.662629][    T1] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    4.662796][    T1] QNX4 filesystem 0.2.3 registered.
[    4.662873][    T1] qnx6: QNX6 filesystem 1.0.0 registered.
[    4.663840][    T1] fuse: init (API version 7.46)
[    4.666275][    T1] orangefs_debugfs_init: called with debug mask: :none=
: :0:
[    4.666952][    T1] orangefs_init: module version upstream loaded
[    4.668066][    T1] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
[    4.680640][    T1] SGI XFS with ACLs, security attributes, realtime, sc=
rub, repair, quota, no debug enabled
[    4.697494][    T1] 9p: Installing v9fs 9p2000 file system support
[    4.698237][    T1] NILFS version 2 loaded
[    4.698245][    T1] befs: version: 0.9.3
[    4.699153][    T1] ocfs2: Registered cluster interface o2cb
[    4.699837][    T1] ocfs2: Registered cluster interface user
[    4.700945][    T1] OCFS2 User DLM kernel interface loaded
[    4.721036][    T1] gfs2: GFS2 installed
[    4.735695][    T1] ceph: loaded (mds proto 32)
[    4.751130][    T1] NET: Registered PF_ALG protocol family
[    4.755936][    T1] async_tx: api initialized (async)
[    4.757614][    T1] Key type asymmetric registered
[    4.757659][    T1] Asymmetric key parser 'x509' registered
[    4.757668][    T1] Asymmetric key parser 'pkcs8' registered
[    4.757677][    T1] Key type pkcs7_test registered
[    4.758462][    T1] Block layer SCSI generic (bsg) driver version 0.4 lo=
aded (major 239)
[    4.759983][    T1] io scheduler mq-deadline registered
[    4.759995][    T1] io scheduler kyber registered
[    4.760450][    T1] io scheduler bfq registered
[    4.762124][    T1] raid6: skipped pq benchmark and selected avx512x4
[    4.831401][    T1] ACPI: \_SB_.GSIE: Enabled at IRQ 20
[    4.840657][    T1] pcieport 0000:00:04.0: PME: Signaling with IRQ 25
[    4.845928][    T1] pcieport 0000:00:04.0: AER: enabled with IRQ 26
[    4.853866][    T1] input: Power Button as /devices/platform/LNXPWRBN:00=
/input/input0
[    4.861878][    T1] ACPI: button: Power Button [PWRF]
[    5.205533][    T1] ioatdma: Intel(R) QuickData Technology Driver 5.00
[    5.236632][    T1] ACPI: \_SB_.GSIF: Enabled at IRQ 21
[    5.287166][    T1] ACPI: \_SB_.GSIH: Enabled at IRQ 23
[    5.394772][  T410] kworker/u33:5 (410) used greatest stack depth: 26904=
 bytes left
[    5.618133][    T1] N_HDLC line discipline registered with maxframe=3D40=
96
[    5.618638][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing enab=
led
[    5.628392][    T1] 00:04: ttyS0 I/O:0x3f8 (irq =3D 4, base_baud =3D 115=
200) is a 16550A
[    5.666492][    T1] Non-volatile memory driver v1.3
[    5.677041][    T1] usbcore: registered new interface driver xillyusb
[    5.681588][    T1] ACPI: bus type drm_connector registered
[    5.687468][    T1] [drm] Initialized vgem 1.0.0 for vgem on minor 0
[    5.688230][    T1] usbcore: registered new interface driver udl
[    5.689052][    T1] [drm] pci: virtio-vga detected at 0000:00:01.0
[    5.689126][    T1] virtio-pci 0000:00:01.0: vgaarb: deactivate vga cons=
ole
[    5.712847][    T1] Console: switching to colour dummy device 80x25
[    5.714016][    T1] [drm] features: -virgl +edid -resource_blob -host_vi=
sibl
** replaying previous printk message **
[    5.714016][    T1] [drm] features: -virgl +edid -resource_blob -host_vi=
sible
[    5.714024][    T1] [drm] features: -context_init -blob_alignment
[    5.720795][    T1] [drm] number of scanouts: 1
[    5.720830][    T1] [drm] number of cap sets: 0
[    5.723674][    T1] ------------[ cut here ]------------
[    5.723682][    T1] [PLANE:36:plane-1] pixel format with alpha exposed b=
ut blend mode not setup
[    5.723689][    T1] WARNING: drivers/gpu/drm/drm_mode_config.c:872 at dr=
m_mode_config_validate+0xfb4/0x1be0, CPU#3: swapper/0/1
[    5.752112][    T1] Modules linked in:
[    5.754097][    T1] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    5.759300][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    5.765067][    T1] RIP: 0010:drm_mode_config_validate+0xfbb/0x1be0
[    5.768677][    T1] Code: 00 49 8b 57 18 48 89 f8 48 c1 e8 03 0f b6 04 2=
8 84 c0 74 08 3c 03 0f 8e 00 0b 00 00 48 8d 3d dc 0b 7e 0b 41 8b b7 c8 00 0=
0 00 <67> 48 0f b9 3a e9 fa fd ff ff 48 8b 5c 24 20 e8 51 a9 39 fc 48 8d
[    5.781701][    T1] RSP: 0000:ffffc90000047908 EFLAGS: 00010246
[    5.786225][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000=
0000000000000
[    5.791549][    T1] RDX: ffff888022b16a80 RSI: 0000000000000024 RDI: fff=
fffff915039a0
[    5.796761][    T1] RBP: dffffc0000000000 R08: 0000000000000001 R09: 000=
0000000000000
[    5.802379][    T1] R10: 0000000000000001 R11: 0000000000000000 R12: fff=
fed10050cca23
[    5.808023][    T1] R13: ffffed10050cca24 R14: 0000000000000001 R15: fff=
f888028665028
[    5.813516][    T1] FS:  0000000000000000(0000) GS:ffff8880d5e69000(0000=
) knlGS:0000000000000000
[    5.819373][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.823373][    T1] CR2: 0000000000000000 CR3: 000000000eb96000 CR4: 000=
0000000352ef0
[    5.828276][    T1] Call Trace:
[    5.830076][    T1]  <TASK>
[    5.831609][    T1]  ? queue_work_on+0xf7/0x1e0
[    5.833995][    T1]  drm_dev_register+0x56e/0x7b0
[    5.836779][    T1]  ? aperture_remove_conflicting_pci_devices+0x138/0x1=
e0
[    5.841510][    T1]  virtio_gpu_probe+0x271/0x360
[    5.844677][    T1]  virtio_dev_probe+0x6a2/0xbe0
[    5.847879][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    5.851682][    T1]  ? kernfs_create_link+0x1bd/0x240
[    5.855438][    T1]  ? kernfs_put+0x3f/0x60
[    5.858337][    T1]  ? sysfs_do_create_link_sd+0xbb/0x140
[    5.861896][    T1]  ? sysfs_create_link+0x68/0xc0
[    5.865146][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    5.869125][    T1]  really_probe+0x241/0xa60
[    5.872221][    T1]  __driver_probe_device+0x210/0x460
[    5.875556][    T1]  ? _raw_spin_unlock_irqrestore+0x52/0x80
[    5.879441][    T1]  driver_probe_device+0x4a/0x140
[    5.882613][    T1]  __driver_attach+0x21f/0x5b0
[    5.885544][    T1]  ? __pfx___driver_attach+0x10/0x10
[    5.889254][    T1]  bus_for_each_dev+0x13e/0x1d0
[    5.892667][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    5.896503][    T1]  ? bus_add_driver+0x2b5/0x5b0
[    5.899777][    T1]  bus_add_driver+0x305/0x5b0
[    5.902865][    T1]  driver_register+0x1e2/0x360
[    5.905606][    T1]  ? __pfx_virtio_gpu_driver_init+0x10/0x10
[    5.909247][    T1]  virtio_gpu_driver_init+0xc9/0x170
[    5.913026][    T1]  do_one_initcall+0x11c/0x6f0
[    5.916255][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    5.920145][    T1]  ? kernel_init_freeable+0x4ca/0x7b0
[    5.923843][    T1]  kernel_init_freeable+0x6ea/0x7b0
[    5.927728][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.931341][    T1]  kernel_init+0x21/0x1e0
[    5.934214][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.937631][    T1]  ret_from_fork+0x730/0xd60
[    5.940687][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[    5.944325][    T1]  ? __switch_to+0x800/0x10f0
[    5.947527][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.950877][    T1]  ret_from_fork_asm+0x1a/0x30
[    5.954045][    T1]  </TASK>
[    5.956005][    T1] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    5.957489][    T1] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    5.957489][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    5.967407][    T1] Call Trace:
[    5.967407][    T1]  <TASK>
[    5.967407][    T1]  dump_stack_lvl+0x100/0x190
[    5.967407][    T1]  vpanic+0x553/0x970
[    5.967407][    T1]  ? __pfx_vpanic+0x10/0x10
[    5.967407][    T1]  panic+0xd1/0xe0
[    5.967407][    T1]  ? __pfx_panic+0x10/0x10
[    5.967407][    T1]  check_panic_on_warn.cold+0x19/0x34
[    5.967407][    T1]  ? drm_mode_config_validate+0xfb4/0x1be0
[    5.997431][    T1]  __warn.cold+0x191/0x318
[    5.997431][    T1]  __report_bug+0x30f/0x440
[    5.997431][    T1]  ? drm_mode_config_validate+0xfb4/0x1be0
[    6.007541][    T1]  ? __pfx___report_bug+0x10/0x10
[    6.007541][    T1]  ? __pfx___might_resched+0x10/0x10
[    6.017426][    T1]  ? schedule_timeout+0x161/0x280
[    6.017426][    T1]  report_bug_entry+0xe2/0x290
[    6.017426][    T1]  ? drm_mode_config_validate+0xfbb/0x1be0
[    6.017426][    T1]  handle_bug+0x1cd/0x2a0
[    6.017426][    T1]  exc_invalid_op+0x17/0x50
[    6.017426][    T1]  asm_exc_invalid_op+0x1a/0x20
[    6.037494][    T1] RIP: 0010:drm_mode_config_validate+0xfbb/0x1be0
[    6.037494][    T1] Code: 00 49 8b 57 18 48 89 f8 48 c1 e8 03 0f b6 04 2=
8 84 c0 74 08 3c 03 0f 8e 00 0b 00 00 48 8d 3d dc 0b 7e 0b 41 8b b7 c8 00 0=
0 00 <67> 48 0f b9 3a e9 fa fd ff ff 48 8b 5c 24 20 e8 51 a9 39 fc 48 8d
[    6.047452][    T1] RSP: 0000:ffffc90000047908 EFLAGS: 00010246
[    6.057557][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000=
0000000000000
[    6.057557][    T1] RDX: ffff888022b16a80 RSI: 0000000000000024 RDI: fff=
fffff915039a0
[    6.067476][    T1] RBP: dffffc0000000000 R08: 0000000000000001 R09: 000=
0000000000000
[    6.067476][    T1] R10: 0000000000000001 R11: 0000000000000000 R12: fff=
fed10050cca23
[    6.077450][    T1] R13: ffffed10050cca24 R14: 0000000000000001 R15: fff=
f888028665028
[    6.087490][    T1]  ? drm_mode_config_validate+0xf76/0x1be0
[    6.087490][    T1]  ? queue_work_on+0xf7/0x1e0
[    6.087490][    T1]  drm_dev_register+0x56e/0x7b0
[    6.097451][    T1]  ? aperture_remove_conflicting_pci_devices+0x138/0x1=
e0
[    6.097451][    T1]  virtio_gpu_probe+0x271/0x360
[    6.097451][    T1]  virtio_dev_probe+0x6a2/0xbe0
[    6.107563][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    6.107563][    T1]  ? kernfs_create_link+0x1bd/0x240
[    6.117437][    T1]  ? kernfs_put+0x3f/0x60
[    6.117437][    T1]  ? sysfs_do_create_link_sd+0xbb/0x140
[    6.117437][    T1]  ? sysfs_create_link+0x68/0xc0
[    6.127500][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    6.127500][    T1]  really_probe+0x241/0xa60
[    6.127500][    T1]  __driver_probe_device+0x210/0x460
[    6.137430][    T1]  ? _raw_spin_unlock_irqrestore+0x52/0x80
[    6.137430][    T1]  driver_probe_device+0x4a/0x140
[    6.137430][    T1]  __driver_attach+0x21f/0x5b0
[    6.147409][    T1]  ? __pfx___driver_attach+0x10/0x10
[    6.147409][    T1]  bus_for_each_dev+0x13e/0x1d0
[    6.147409][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    6.157491][    T1]  ? bus_add_driver+0x2b5/0x5b0
[    6.157491][    T1]  bus_add_driver+0x305/0x5b0
[    6.157491][    T1]  driver_register+0x1e2/0x360
[    6.167427][    T1]  ? __pfx_virtio_gpu_driver_init+0x10/0x10
[    6.167427][    T1]  virtio_gpu_driver_init+0xc9/0x170
[    6.167427][    T1]  do_one_initcall+0x11c/0x6f0
[    6.177501][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    6.177501][    T1]  ? kernel_init_freeable+0x4ca/0x7b0
[    6.177501][    T1]  kernel_init_freeable+0x6ea/0x7b0
[    6.177501][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.177501][    T1]  kernel_init+0x21/0x1e0
[    6.197435][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.197435][    T1]  ret_from_fork+0x730/0xd60
[    6.197435][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[    6.207486][    T1]  ? __switch_to+0x800/0x10f0
[    6.207486][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.207486][    T1]  ret_from_fork_asm+0x1a/0x30
[    6.217426][    T1]  </TASK>
[    6.217426][    T1] Kernel Offset: disabled
[    6.217426][    T1] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=3D<nil>)
AR=3D'ar'
CC=3D'gcc'
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_ENABLED=3D'1'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
CXX=3D'g++'
GCCGO=3D'gccgo'
GO111MODULE=3D'auto'
GOAMD64=3D'v1'
GOARCH=3D'amd64'
GOAUTH=3D'netrc'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOCACHEPROG=3D''
GODEBUG=3D''
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFIPS140=3D'off'
GOFLAGS=3D''
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build1871275757=3D/tmp/go-build -gno-record-gc=
c-switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.26.0'
GOWORK=3D''
PKG_CONFIG=3D'pkg-config'

git status (err=3D<nil>)
HEAD detached at 614e416a2c3
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D614e416a2c34ab81eb2b80817ccfa47c00429056 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260824-135806"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D614e416a2c34ab81eb2b80817ccfa47c00429056 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260824-135806"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D614e416a2c34ab81eb2b80817ccfa47c00429056 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260824-135806"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"614e416a2c34ab81eb2b80817ccfa47c00=
429056\"
/usr/bin/ld: /tmp/ccmsqNe1.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D10df3579580000


Tested on:

commit:         1b78070a Merge tag 'net-7.3-rc1' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8c5c3949d762a91=
f
dashboard link: https://syzkaller.appspot.com/bug?extid=3D473d7477c523b41d4=
046
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D13b8f4155800=
00


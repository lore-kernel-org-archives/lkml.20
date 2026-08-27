Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D169936494B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787799365; cv=none; b=szVofV6DI3mOlTbXhQTA3sa7knCvrJ1WF1/tpWcYTEjYLoHrJhLW9yUArPOJGHJdYlxS3saRJC5BnJi8xpUFLfJBAnHsr8BIUUUhBgN266D+YvNTfB+VPhZYD2cLmWxV6cLfkSz/TSW2ZHVKS1/CAEQ1u0kErZ3W/fkaajeL1fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787799365; c=relaxed/simple;
	bh=AUSWQpjABADNB5vIziCtQ3p/+sp+VZ324CWv2S24Yrw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XgwOLsr0uBXajyk5kfbtz4XXHA3qI49rZ71rx+wpZvfGQT8yZZMFZfxDDpKWOB9zlj1Q5JCjCvjl1tXijVO9SyjJl/iKVti7mS3Pgeo4S1inqxTPu4qlkDD07Gk+trEJZHvOWcksMh1ThHDMtyWSvST7H+ZpA0pJciIs0VJS6a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-464e69965b8so1089867fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799362; x=1788404162;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dDhVJIOjOD8DGN9heTSr6ItpIl51S8i0fB3RJl8YNjk=;
        b=DzVs4cabFKCJTRKUTzRJcL2jZoKDndh2Xi0T8lldEFsS76d1T0ShU2IH/sT7hi3qqa
         bkhThY/AApCTmh7s7ddI3gbFSyYLR2k7LnrEBwj+GxKuDRffJAg07yZZqLDx7Guq3JGe
         s0L1pEiW4fL7y6qJ0DeyypAHNRC4ZftDHCI6+6crone1u2cq4a8gltkl76yd65O+Za/f
         pvB+y50S1WHEAX62vQ/9xkC6gFS+DgSBWcdQfhe39WxU99885SHJRFHF1nicPTbmYGbf
         kYlPUKVWmQIAXkQGA0KBrhh86Re2Ehx9RGHdhq4hjMOx0CU8g7jFa8ciwpxYlfvL2lvu
         mtwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYHX0rK+r/lsJaVBrZKgUdjTBtnBc/XxLTfC/5tmzGXPTXmkiiDw3dm0PUiJsVi8vZyoiOwZzy7PLaV30=@vger.kernel.org
X-Gm-Message-State: AFuF++lv4cK0lifMawwJzp++lwc2l3XG26X+OGp9a7HUdECkebmwe5nV
	NqJ1rj094V2rINuGMtJX+QnOLd/TpNSMhjVqsbq9R2hhc/mNKlT1ai0la2p8JTfx7o+kySgJ8Rr
	e2nhKP2EOeZORdwD2P66YmIC67licoUAk5HC/pNk1P3mUWuH5zY5fX2qOH/o=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2e8e:b0:6b0:31d0:5fc9 with SMTP id
 006d021491bc7-6b1b000b6e8mr2584357eaf.7.1787799362624; Wed, 26 Aug 2026
 19:56:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 19:56:02 -0700
In-Reply-To: <20260827015311.12682-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8fa742.4d659fcc.734b4.0007.GAE@google.com>
Subject: Re: [syzbot] [bpf?] general protection fault in btf_type_show
From: syzbot <syzbot+37b56485bbbf90ad8489@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

0] (64MB)
[    4.567255][    T1] ACPI: bus type thunderbolt registered
[    4.571676][    T1] RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters=
, 10737418240 ms ovfl timer
[    4.712224][    T1] kvm_amd: CPU 1 isn't AMD or Hygon
[    4.712289][    T1] clocksource: tsc: mask: 0xffffffffffffffff max_cycle=
s: 0x257a472b559, max_idle_ns: 440795210424 ns
[    4.723080][    T1] clocksource: Switched to clocksource tsc
[    4.769903][    T1] Initialise system trusted keyrings
[    4.771469][    T1] workingset: timestamp_bits=3D40 (anon: 35) max_order=
=3D20 bucket_order=3D0 (anon: 0)
[    4.782355][    T1] DLM installed
[    4.788684][    T1] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    4.797661][    T1] NFS: Registering the id_resolver key type
[    4.797817][    T1] Key type id_resolver registered
[    4.797827][    T1] Key type id_legacy registered
[    4.798151][    T1] nfs4filelayout_init: NFSv4 File Layout Driver Regist=
ering...
[    4.798274][    T1] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Drive=
r Registering...
[    4.803524][    T1] smbdirect: subsystem loading...
[    4.815913][    T1] smbdirect: subsystem loaded
[    4.838963][    T1] Key type cifs.spnego registered
[    4.839248][    T1] Key type cifs.idmap registered
[    4.843752][    T1] ntfs3: Enabled Linux POSIX ACLs support
[    4.843767][    T1] ntfs3: Read-only LZX/Xpress compression included
[    4.844171][    T1] jffs2: version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-20=
06 Red Hat, Inc.
[    4.849521][    T1] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    4.849798][    T1] QNX4 filesystem 0.2.3 registered.
[    4.849911][    T1] qnx6: QNX6 filesystem 1.0.0 registered.
[    4.851532][    T1] fuse: init (API version 7.46)
[    4.856255][    T1] orangefs_debugfs_init: called with debug mask: :none=
: :0:
[    4.857870][    T1] orangefs_init: module version upstream loaded
[    4.859486][    T1] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
[    4.873365][    T1] SGI XFS with ACLs, security attributes, realtime, sc=
rub, repair, quota, no debug enabled
[    4.882267][    T1] 9p: Installing v9fs 9p2000 file system support
[    4.883084][    T1] NILFS version 2 loaded
[    4.883096][    T1] befs: version: 0.9.3
[    4.884100][    T1] ocfs2: Registered cluster interface o2cb
[    4.885087][    T1] ocfs2: Registered cluster interface user
[    4.887781][    T1] OCFS2 User DLM kernel interface loaded
[    4.910089][    T1] gfs2: GFS2 installed
[    4.926852][    T1] ceph: loaded (mds proto 32)
[    4.938722][    T1] NET: Registered PF_ALG protocol family
[    4.944425][    T1] async_tx: api initialized (async)
[    4.947567][    T1] Key type asymmetric registered
[    4.947642][    T1] Asymmetric key parser 'x509' registered
[    4.947651][    T1] Asymmetric key parser 'pkcs8' registered
[    4.947662][    T1] Key type pkcs7_test registered
[    4.948254][    T1] Block layer SCSI generic (bsg) driver version 0.4 lo=
aded (major 239)
[    4.959622][    T1] io scheduler mq-deadline registered
[    4.959643][    T1] io scheduler kyber registered
[    4.960021][    T1] io scheduler bfq registered
[    4.960791][    T1] raid6: skipped pq benchmark and selected avx512x4
[    5.000642][    T1] ACPI: \_SB_.GSIE: Enabled at IRQ 20
[    5.008282][    T1] pcieport 0000:00:04.0: PME: Signaling with IRQ 25
[    5.022665][    T1] pcieport 0000:00:04.0: AER: enabled with IRQ 26
[    5.030510][    T1] input: Power Button as /devices/platform/LNXPWRBN:00=
/input/input0
[    5.031822][    T1] ACPI: button: Power Button [PWRF]
[    5.411719][    T1] ioatdma: Intel(R) QuickData Technology Driver 5.00
[    5.457084][    T1] ACPI: \_SB_.GSIF: Enabled at IRQ 21
[    5.508969][    T1] ACPI: \_SB_.GSIH: Enabled at IRQ 23
[    5.900182][    T1] N_HDLC line discipline registered with maxframe=3D40=
96
[    5.901075][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing enab=
led
[    5.909262][    T1] 00:04: ttyS0 I/O:0x3f8 (irq =3D 4, base_baud =3D 115=
200) is a 16550A
[    5.964523][    T1] Non-volatile memory driver v1.3
[    5.975391][    T1] usbcore: registered new interface driver xillyusb
[    5.982154][    T1] ACPI: bus type drm_connector registered
[    5.989648][    T1] [drm] Initialized vgem 1.0.0 for vgem on minor 0
[    5.990270][    T1] usbcore: registered new interface driver udl
[    5.992839][    T1] [drm] pci: virtio-vga detected at 0000:00:01.0
[    5.993007][    T1] virtio-pci 0000:00:01.0: vgaarb: deactivate vga cons=
ole
[    6.017037][    T1] Console: switching to colour dummy device 80x25
[    6.019213][    T1] [drm] features: -virgl +edid -resource_blob -host_vi=
sible
[    6.019231][=20
** replaying previous printk message **
[    6.019231][    T1] [drm] features: -context_init -blob_alignment
[    6.025829][    T1] [drm] number of scanouts: 1
[    6.025865][    T1] [drm] number of cap sets: 0
[    6.029842][    T1] ------------[ cut here ]------------
[    6.029854][    T1] [PLANE:36:plane-1] pixel format with alpha exposed b=
ut blend mode not setup
[    6.029861][    T1] WARNING: drivers/gpu/drm/drm_mode_config.c:872 at dr=
m_mode_config_validate+0xfb4/0x1be0, CPU#2: swapper/0/1
[    6.061997][    T1] Modules linked in:
[    6.064261][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    6.070691][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    6.078075][    T1] RIP: 0010:drm_mode_config_validate+0xfbb/0x1be0
[    6.082440][    T1] Code: 00 49 8b 57 18 48 89 f8 48 c1 e8 03 0f b6 04 2=
8 84 c0 74 08 3c 03 0f 8e 00 0b 00 00 48 8d 3d ec 61 7e 0b 41 8b b7 c8 00 0=
0 00 <67> 48 0f b9 3a e9 fa fd ff ff 48 8b 5c 24 20 e8 01 e5 39 fc 48 8d
[    6.096218][    T1] RSP: 0000:ffffc90000047908 EFLAGS: 00010246
[    6.099910][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000=
0000000000000
[    6.104920][    T1] RDX: ffff8880273a67c0 RSI: 0000000000000024 RDI: fff=
fffff915052c0
[    6.110226][    T1] RBP: dffffc0000000000 R08: 0000000000000001 R09: 000=
0000000000000
[    6.116916][    T1] R10: 0000000000000001 R11: 0000000000000000 R12: fff=
fed1004f49023
[    6.122713][    T1] R13: ffffed1004f49024 R14: 0000000000000001 R15: fff=
f888027a48028
[    6.128117][    T1] FS:  0000000000000000(0000) GS:ffff8880d5d6a000(0000=
) knlGS:0000000000000000
[    6.134099][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.138978][    T1] CR2: 0000000000000000 CR3: 000000000eb96000 CR4: 000=
0000000352ef0
[    6.143685][    T1] Call Trace:
[    6.145773][    T1]  <TASK>
[    6.147340][    T1]  ? queue_work_on+0xd7/0x1e0
[    6.149798][    T1]  drm_dev_register+0x56e/0x7b0
[    6.152299][    T1]  ? aperture_remove_conflicting_pci_devices+0x138/0x1=
e0
[    6.156137][    T1]  virtio_gpu_probe+0x271/0x360
[    6.159302][    T1]  virtio_dev_probe+0x6a2/0xbe0
[    6.162577][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    6.166687][    T1]  ? kernfs_create_link+0x1bd/0x240
[    6.170072][    T1]  ? kernfs_put+0x3f/0x60
[    6.172900][    T1]  ? sysfs_do_create_link_sd+0xbb/0x140
[    6.176855][    T1]  ? sysfs_create_link+0x68/0xc0
[    6.179819][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    6.183189][    T1]  really_probe+0x241/0xa60
[    6.185957][    T1]  __driver_probe_device+0x210/0x460
[    6.189219][    T1]  ? _raw_spin_unlock_irqrestore+0x52/0x80
[    6.192389][    T1]  driver_probe_device+0x4a/0x140
[    6.195943][    T1]  __driver_attach+0x21f/0x5b0
[    6.199182][    T1]  ? __pfx___driver_attach+0x10/0x10
[    6.202648][    T1]  bus_for_each_dev+0x13e/0x1d0
[    6.205679][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    6.208681][    T1]  ? bus_add_driver+0x2b5/0x5b0
[    6.211758][    T1]  bus_add_driver+0x305/0x5b0
[    6.214657][    T1]  driver_register+0x1e2/0x360
[    6.217563][    T1]  ? __pfx_virtio_gpu_driver_init+0x10/0x10
[    6.221754][    T1]  virtio_gpu_driver_init+0xc9/0x170
[    6.225188][    T1]  do_one_initcall+0x11c/0x6f0
[    6.228719][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    6.232297][    T1]  ? kernel_init_freeable+0x4ca/0x7b0
[    6.236427][    T1]  kernel_init_freeable+0x6ea/0x7b0
[    6.239858][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.242779][    T1]  kernel_init+0x21/0x1e0
[    6.245219][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.248172][    T1]  ret_from_fork+0x730/0xd60
[    6.250865][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[    6.254420][    T1]  ? __switch_to+0x800/0x10f0
[    6.257968][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.261119][    T1]  ret_from_fork_asm+0x1a/0x30
[    6.264119][    T1]  </TASK>
[    6.265934][    T1] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    6.267938][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    6.267938][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    6.267938][    T1] Call Trace:
[    6.267938][    T1]  <TASK>
[    6.287547][    T1]  dump_stack_lvl+0x100/0x190
[    6.287547][    T1]  vpanic+0x553/0x970
[    6.287547][    T1]  ? __pfx_vpanic+0x10/0x10
[    6.287547][    T1]  panic+0xd1/0xe0
[    6.297598][    T1]  ? __pfx_panic+0x10/0x10
[    6.297598][    T1]  check_panic_on_warn.cold+0x19/0x34
[    6.297598][    T1]  ? drm_mode_config_validate+0xfb4/0x1be0
[    6.307492][    T1]  __warn.cold+0x191/0x318
[    6.307492][    T1]  __report_bug+0x30f/0x440
[    6.307492][    T1]  ? drm_mode_config_validate+0xfb4/0x1be0
[    6.307492][    T1]  ? __pfx___report_bug+0x10/0x10
[    6.317574][    T1]  ? __pfx___might_resched+0x10/0x10
[    6.317574][    T1]  ? schedule_timeout+0x161/0x280
[    6.317574][    T1]  report_bug_entry+0xe2/0x290
[    6.327541][    T1]  ? drm_mode_config_validate+0xfbb/0x1be0
[    6.327541][    T1]  handle_bug+0x1cd/0x2a0
[    6.327541][    T1]  exc_invalid_op+0x17/0x50
[    6.327541][    T1]  asm_exc_invalid_op+0x1a/0x20
[    6.337559][    T1] RIP: 0010:drm_mode_config_validate+0xfbb/0x1be0
[    6.337559][    T1] Code: 00 49 8b 57 18 48 89 f8 48 c1 e8 03 0f b6 04 2=
8 84 c0 74 08 3c 03 0f 8e 00 0b 00 00 48 8d 3d ec 61 7e 0b 41 8b b7 c8 00 0=
0 00 <67> 48 0f b9 3a e9 fa fd ff ff 48 8b 5c 24 20 e8 01 e5 39 fc 48 8d
[    6.347488][    T1] RSP: 0000:ffffc90000047908 EFLAGS: 00010246
[    6.347488][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000=
0000000000000
[    6.347488][    T1] RDX: ffff8880273a67c0 RSI: 0000000000000024 RDI: fff=
fffff915052c0
[    6.347488][    T1] RBP: dffffc0000000000 R08: 0000000000000001 R09: 000=
0000000000000
[    6.367557][    T1] R10: 0000000000000001 R11: 0000000000000000 R12: fff=
fed1004f49023
[    6.367557][    T1] R13: ffffed1004f49024 R14: 0000000000000001 R15: fff=
f888027a48028
[    6.377557][    T1]  ? drm_mode_config_validate+0xf76/0x1be0
[    6.377557][    T1]  ? queue_work_on+0xd7/0x1e0
[    6.377557][    T1]  drm_dev_register+0x56e/0x7b0
[    6.387488][    T1]  ? aperture_remove_conflicting_pci_devices+0x138/0x1=
e0
[    6.387488][    T1]  virtio_gpu_probe+0x271/0x360
[    6.387488][    T1]  virtio_dev_probe+0x6a2/0xbe0
[    6.397590][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    6.397590][    T1]  ? kernfs_create_link+0x1bd/0x240
[    6.397590][    T1]  ? kernfs_put+0x3f/0x60
[    6.407511][    T1]  ? sysfs_do_create_link_sd+0xbb/0x140
[    6.407511][    T1]  ? sysfs_create_link+0x68/0xc0
[    6.407511][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    6.407511][    T1]  really_probe+0x241/0xa60
[    6.417623][    T1]  __driver_probe_device+0x210/0x460
[    6.417623][    T1]  ? _raw_spin_unlock_irqrestore+0x52/0x80
[    6.417623][    T1]  driver_probe_device+0x4a/0x140
[    6.427481][    T1]  __driver_attach+0x21f/0x5b0
[    6.427481][    T1]  ? __pfx___driver_attach+0x10/0x10
[    6.427481][    T1]  bus_for_each_dev+0x13e/0x1d0
[    6.427481][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    6.427481][    T1]  ? bus_add_driver+0x2b5/0x5b0
[    6.427481][    T1]  bus_add_driver+0x305/0x5b0
[    6.427481][    T1]  driver_register+0x1e2/0x360
[    6.447489][    T1]  ? __pfx_virtio_gpu_driver_init+0x10/0x10
[    6.447489][    T1]  virtio_gpu_driver_init+0xc9/0x170
[    6.447489][    T1]  do_one_initcall+0x11c/0x6f0
[    6.447489][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    6.447489][    T1]  ? kernel_init_freeable+0x4ca/0x7b0
[    6.447489][    T1]  kernel_init_freeable+0x6ea/0x7b0
[    6.447489][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.467481][    T1]  kernel_init+0x21/0x1e0
[    6.467481][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.467481][    T1]  ret_from_fork+0x730/0xd60
[    6.467481][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[    6.477554][    T1]  ? __switch_to+0x800/0x10f0
[    6.477554][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.477554][    T1]  ret_from_fork_asm+0x1a/0x30
[    6.487531][    T1]  </TASK>
[    6.487531][    T1] Kernel Offset: disabled
[    6.487531][    T1] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build1831899048=3D/tmp/go-build -gno-record-gc=
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
HEAD detached at 1e72964b011
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260817-123423"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260817-123423"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D1e72964b0111319984575e60f266d1fa0a98abb5 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260817-123423"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"1e72964b0111319984575e60f266d1fa0a=
98abb5\"
/usr/bin/ld: /tmp/ccxPxrYX.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D10b01979580000


Tested on:

commit:         73e3f071 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc2d3e2a7997c1d5=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3D37b56485bbbf90ad8=
489
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D14ff8d495800=
00


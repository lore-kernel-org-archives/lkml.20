Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E333A6E2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787795526; cv=none; b=YDpNF/7JzjHZeUjvqiPvTwBoGTuSKpyH8q/WbxJRgO4NvSeuS88QRd/eO1m4njLD7FXhiY3TVbNJo+N2FMCclTte/W4hntzDgdlsnF2l9HNm3o2lGdeODQgnxwoH1YsFP5oMPM25rmXkWIjRtHmlP5bUlkS6wwIG6mh69jxMWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787795526; c=relaxed/simple;
	bh=Z3dJrfN+7whSbAUcK9nYuUNqmN5nKb0PIhzCyTU1r2Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=G4Lq8eSQ4fQYlDsTnBaPQaG/7O9/ivdj0kqJsR+O9BKBUoqLwfveZyr8Elyh8sSAp9P45OlHiKv3UWxk2mJKDTJ30/HP0KAsNFpG6yJmLt4uHCLcZLuEAGc9i89i94wIk7LHMgkouqKD1YCr7lFy5AMpFTo9MyS3GfBPyUIdADg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d9206f8so1244239b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787795523; x=1788400323;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A2wrl4l5FU6QMXo2RUhhcyrnkT1JWu2KKUXmi+RfHwU=;
        b=Tmee10LrGy1ykiqP7w99mBSouUT8REmyJaH1E9B/jt44tNwEgSu8ALR/h+ffOmNu54
         lmqqAtOPnk/xjQEvXLhqpwqOK1+heFoRmmo15Jh1yWiLEZzkGQjydWZFp/PfbqicYgxI
         5YLoIfcCSkVdeJHZ8Hp0BvMpmAll2XGjQ6mU8QS0aO5+b9pJIwm0pRKbrAWb8gR3sg+7
         rdLMc0sKOIc61gyB7derfqpEIZbKC3TgkiadJ3I8hwaZ6CSsJ9TrUPjYX/SmkSlFqQ8S
         rkOEcSY3NBx9xJxrK9hzezMfSpC8sb4MrHS0lZNjdIkQuMVLB94sE8JL/6CzMdIOx85y
         4pDA==
X-Forwarded-Encrypted: i=1; AHgh+RrEHosabmT6uSf+Nll3RDv5VhaVe5R9Zjs4dhyj5bTU+PCQZW8t25BPd06mJTcZE0vrK1b33K3bIJ6MeG0=@vger.kernel.org
X-Gm-Message-State: AFuF++mHwKa7YQ7yy4aIuFzwngsAWotq71tHZu8hsHvkLg/5UIJ6a5r/
	cOIA8tI+C4+XklLjt0SrV+WI6N6xjhtNJJu12n0OpHvkk4eJ15t06rcm5npQp71NT3IKhFEK8vv
	oXVNlplKR4Eyn+y3vLMMgi2DEfa2850AcKkigAEGvb1d7NHDlNKnFUfqNkNA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:22a3:b0:49b:33c8:4b75 with SMTP id
 5614622812f47-4b366910400mr13603778b6e.5.1787795523608; Wed, 26 Aug 2026
 18:52:03 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:52:03 -0700
In-Reply-To: <20260826233812.10722-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f9843.1d9ded08.62e62.00c3.GAE@google.com>
Subject: Re: [syzbot] [bpf?] general protection fault in btf_type_show
From: syzbot <syzbot+37b56485bbbf90ad8489@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

   T1] RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters, 10737418240 ms=
 ovfl timer
[    4.474934][    T1] kvm_amd: CPU 1 isn't AMD or Hygon
[    4.474993][    T1] clocksource: tsc: mask: 0xffffffffffffffff max_cycle=
s: 0x257a472b559, max_idle_ns: 440795210424 ns
[    4.484335][    T1] clocksource: Switched to clocksource tsc
[    4.526975][    T1] Initialise system trusted keyrings
[    4.528327][    T1] workingset: timestamp_bits=3D40 (anon: 35) max_order=
=3D20 bucket_order=3D0 (anon: 0)
[    4.535686][    T1] DLM installed
[    4.542852][    T1] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    4.550466][    T1] NFS: Registering the id_resolver key type
[    4.550700][    T1] Key type id_resolver registered
[    4.550712][    T1] Key type id_legacy registered
[    4.551060][    T1] nfs4filelayout_init: NFSv4 File Layout Driver Regist=
ering...
[    4.551182][    T1] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Drive=
r Registering...
[    4.555844][    T1] smbdirect: subsystem loading...
[    4.562500][    T1] smbdirect: subsystem loaded
[    4.575870][    T1] Key type cifs.spnego registered
[    4.576074][    T1] Key type cifs.idmap registered
[    4.579587][    T1] ntfs3: Enabled Linux POSIX ACLs support
[    4.579598][    T1] ntfs3: Read-only LZX/Xpress compression included
[    4.579808][    T1] jffs2: version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-20=
06 Red Hat, Inc.
[    4.581620][    T1] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    4.581778][    T1] QNX4 filesystem 0.2.3 registered.
[    4.581850][    T1] qnx6: QNX6 filesystem 1.0.0 registered.
[    4.582643][    T1] fuse: init (API version 7.46)
[    4.584530][    T1] orangefs_debugfs_init: called with debug mask: :none=
: :0:
[    4.585189][    T1] orangefs_init: module version upstream loaded
[    4.586040][    T1] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
[    4.597245][    T1] SGI XFS with ACLs, security attributes, realtime, sc=
rub, repair, quota, no debug enabled
[    4.604106][    T1] 9p: Installing v9fs 9p2000 file system support
[    4.604734][    T1] NILFS version 2 loaded
[    4.604744][    T1] befs: version: 0.9.3
[    4.605658][    T1] ocfs2: Registered cluster interface o2cb
[    4.606687][    T1] ocfs2: Registered cluster interface user
[    4.607437][    T1] OCFS2 User DLM kernel interface loaded
[    4.618862][    T1] gfs2: GFS2 installed
[    4.627883][    T1] ceph: loaded (mds proto 32)
[    4.650286][    T1] NET: Registered PF_ALG protocol family
[    4.654591][    T1] async_tx: api initialized (async)
[    4.657652][    T1] Key type asymmetric registered
[    4.661111][    T1] Asymmetric key parser 'x509' registered
[    4.661175][    T1] Asymmetric key parser 'pkcs8' registered
[    4.661197][    T1] Key type pkcs7_test registered
[    4.661884][    T1] Block layer SCSI generic (bsg) driver version 0.4 lo=
aded (major 239)
[    4.663457][    T1] io scheduler mq-deadline registered
[    4.663468][    T1] io scheduler kyber registered
[    4.663778][    T1] io scheduler bfq registered
[    4.664888][    T1] raid6: skipped pq benchmark and selected avx512x4
[    4.700668][    T1] ACPI: \_SB_.GSIE: Enabled at IRQ 20
[    4.707226][    T1] pcieport 0000:00:04.0: PME: Signaling with IRQ 25
[    4.709647][    T1] pcieport 0000:00:04.0: AER: enabled with IRQ 26
[    4.716102][    T1] input: Power Button as /devices/platform/LNXPWRBN:00=
/input/input0
[    4.717363][    T1] ACPI: button: Power Button [PWRF]
[    5.035886][    T1] ioatdma: Intel(R) QuickData Technology Driver 5.00
[    5.061462][    T1] ACPI: \_SB_.GSIF: Enabled at IRQ 21
[    5.093788][    T1] ACPI: \_SB_.GSIH: Enabled at IRQ 23
[    5.400353][    T1] N_HDLC line discipline registered with maxframe=3D40=
96
[    5.401481][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing enab=
led
[    5.411938][    T1] 00:04: ttyS0 I/O:0x3f8 (irq =3D 4, base_baud =3D 115=
200) is a 16550A
[    5.448672][    T1] Non-volatile memory driver v1.3
[    5.457263][    T1] usbcore: registered new interface driver xillyusb
[    5.459532][    T1] ACPI: bus type drm_connector registered
[    5.463504][    T1] [drm] Initialized vgem 1.0.0 for vgem on minor 0
[    5.463734][    T1] usbcore: registered new interface driver udl
[    5.465228][    T1] [drm] pci: virtio-vga detected at 0000:00:01.0
[    5.465324][    T1] virtio-pci 0000:00:01.0: vgaarb: deactivate vga cons=
ole
[    5.492574][    T1] Console: switching to colour dummy device 80x25
[    5.495090][    T1] [drm] features: -virgl +edid -resource_blob -host_vi=
sible
[
** replaying previous printk message **
[    5.495105][    T1] [drm] features: -context_init -blob_alignment
[    5.501365][    T1] [drm] number of scanouts: 1
[    5.501399][    T1] [drm] number of cap sets: 0
[    5.504207][    T1] ------------[ cut here ]------------
[    5.504216][    T1] [PLANE:36:plane-1] pixel format with alpha exposed b=
ut blend mode not setup
[    5.504223][    T1] WARNING: drivers/gpu/drm/drm_mode_config.c:872 at dr=
m_mode_config_validate+0xfb4/0x1be0, CPU#2: swapper/0/1
[    5.533001][    T1] Modules linked in:
[    5.535247][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    5.540434][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    5.546862][    T1] RIP: 0010:drm_mode_config_validate+0xfbb/0x1be0
[    5.550664][    T1] Code: 00 49 8b 57 18 48 89 f8 48 c1 e8 03 0f b6 04 2=
8 84 c0 74 08 3c 03 0f 8e 00 0b 00 00 48 8d 3d ec 61 7e 0b 41 8b b7 c8 00 0=
0 00 <67> 48 0f b9 3a e9 fa fd ff ff 48 8b 5c 24 20 e8 01 e5 39 fc 48 8d
[    5.563050][    T1] RSP: 0000:ffffc90000047908 EFLAGS: 00010246
[    5.566897][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000=
0000000000000
[    5.571446][    T1] RDX: ffff888027bd2f40 RSI: 0000000000000024 RDI: fff=
fffff915052c0
[    5.575765][    T1] RBP: dffffc0000000000 R08: 0000000000000001 R09: 000=
0000000000000
[    5.579893][    T1] R10: 0000000000000001 R11: 0000000000000000 R12: fff=
fed1005000c23
[    5.584354][    T1] R13: ffffed1005000c24 R14: 0000000000000001 R15: fff=
f888028006028
[    5.588750][    T1] FS:  0000000000000000(0000) GS:ffff8880d5d6a000(0000=
) knlGS:0000000000000000
[    5.593478][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.597618][    T1] CR2: 0000000000000000 CR3: 000000000eb96000 CR4: 000=
0000000352ef0
[    5.602523][    T1] Call Trace:
[    5.604635][    T1]  <TASK>
[    5.606449][    T1]  ? queue_work_on+0xd7/0x1e0
[    5.609586][    T1]  drm_dev_register+0x56e/0x7b0
[    5.612951][    T1]  ? aperture_remove_conflicting_pci_devices+0x138/0x1=
e0
[    5.617963][    T1]  virtio_gpu_probe+0x271/0x360
[    5.620957][    T1]  virtio_dev_probe+0x6a2/0xbe0
[    5.623804][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    5.627271][    T1]  ? kernfs_create_link+0x1bd/0x240
[    5.630371][    T1]  ? kernfs_put+0x3f/0x60
[    5.633541][    T1]  ? sysfs_do_create_link_sd+0xbb/0x140
[    5.637163][    T1]  ? sysfs_create_link+0x68/0xc0
[    5.640484][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    5.643796][    T1]  really_probe+0x241/0xa60
[    5.646731][    T1]  __driver_probe_device+0x210/0x460
[    5.649805][    T1]  ? _raw_spin_unlock_irqrestore+0x52/0x80
[    5.654757][    T1]  driver_probe_device+0x4a/0x140
[    5.657837][    T1]  __driver_attach+0x21f/0x5b0
[    5.660733][    T1]  ? __pfx___driver_attach+0x10/0x10
[    5.664174][    T1]  bus_for_each_dev+0x13e/0x1d0
[    5.666795][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    5.669565][    T1]  ? bus_add_driver+0x2b5/0x5b0
[    5.672088][    T1]  bus_add_driver+0x305/0x5b0
[    5.674770][    T1]  driver_register+0x1e2/0x360
[    5.677613][    T1]  ? __pfx_virtio_gpu_driver_init+0x10/0x10
[    5.680910][    T1]  virtio_gpu_driver_init+0xc9/0x170
[    5.683760][    T1]  do_one_initcall+0x11c/0x6f0
[    5.686221][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    5.689018][    T1]  ? kasan_unpoison+0x43/0x60
[    5.691592][    T1]  ? kernel_init_freeable+0x4ca/0x7b0
[    5.694601][    T1]  kernel_init_freeable+0x6ea/0x7b0
[    5.697334][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.699993][    T1]  kernel_init+0x21/0x1e0
[    5.702344][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.705326][    T1]  ret_from_fork+0x730/0xd60
[    5.708154][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[    5.710993][    T1]  ? __switch_to+0x800/0x10f0
[    5.713506][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.716058][    T1]  ret_from_fork_asm+0x1a/0x30
[    5.718608][    T1]  </TASK>
[    5.720210][    T1] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    5.720947][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    5.720947][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    5.730940][    T1] Call Trace:
[    5.730940][    T1]  <TASK>
[    5.730940][    T1]  dump_stack_lvl+0x100/0x190
[    5.730940][    T1]  vpanic+0x553/0x970
[    5.740939][    T1]  ? __pfx_vpanic+0x10/0x10
[    5.740939][    T1]  panic+0xd1/0xe0
[    5.740939][    T1]  ? __pfx_panic+0x10/0x10
[    5.740939][    T1]  check_panic_on_warn.cold+0x19/0x34
[    5.750951][    T1]  ? drm_mode_config_validate+0xfb4/0x1be0
[    5.750951][    T1]  __warn.cold+0x191/0x318
[    5.750951][    T1]  __report_bug+0x30f/0x440
[    5.750951][    T1]  ? drm_mode_config_validate+0xfb4/0x1be0
[    5.760949][    T1]  ? __pfx___report_bug+0x10/0x10
[    5.760949][    T1]  ? __pfx___might_resched+0x10/0x10
[    5.760949][    T1]  ? schedule_timeout+0x161/0x280
[    5.760949][    T1]  report_bug_entry+0xe2/0x290
[    5.770967][    T1]  ? drm_mode_config_validate+0xfbb/0x1be0
[    5.770967][    T1]  handle_bug+0x1cd/0x2a0
[    5.770967][    T1]  exc_invalid_op+0x17/0x50
[    5.780911][    T1]  asm_exc_invalid_op+0x1a/0x20
[    5.780911][    T1] RIP: 0010:drm_mode_config_validate+0xfbb/0x1be0
[    5.780911][    T1] Code: 00 49 8b 57 18 48 89 f8 48 c1 e8 03 0f b6 04 2=
8 84 c0 74 08 3c 03 0f 8e 00 0b 00 00 48 8d 3d ec 61 7e 0b 41 8b b7 c8 00 0=
0 00 <67> 48 0f b9 3a e9 fa fd ff ff 48 8b 5c 24 20 e8 01 e5 39 fc 48 8d
[    5.790950][    T1] RSP: 0000:ffffc90000047908 EFLAGS: 00010246
[    5.801075][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000=
0000000000000
[    5.801075][    T1] RDX: ffff888027bd2f40 RSI: 0000000000000024 RDI: fff=
fffff915052c0
[    5.801075][    T1] RBP: dffffc0000000000 R08: 0000000000000001 R09: 000=
0000000000000
[    5.810970][    T1] R10: 0000000000000001 R11: 0000000000000000 R12: fff=
fed1005000c23
[    5.810970][    T1] R13: ffffed1005000c24 R14: 0000000000000001 R15: fff=
f888028006028
[    5.820978][    T1]  ? drm_mode_config_validate+0xf76/0x1be0
[    5.820978][    T1]  ? queue_work_on+0xd7/0x1e0
[    5.820978][    T1]  drm_dev_register+0x56e/0x7b0
[    5.830989][    T1]  ? aperture_remove_conflicting_pci_devices+0x138/0x1=
e0
[    5.830989][    T1]  virtio_gpu_probe+0x271/0x360
[    5.830989][    T1]  virtio_dev_probe+0x6a2/0xbe0
[    5.841011][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    5.841011][    T1]  ? kernfs_create_link+0x1bd/0x240
[    5.841011][    T1]  ? kernfs_put+0x3f/0x60
[    5.841011][    T1]  ? sysfs_do_create_link_sd+0xbb/0x140
[    5.850976][    T1]  ? sysfs_create_link+0x68/0xc0
[    5.850976][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    5.850976][    T1]  really_probe+0x241/0xa60
[    5.850976][    T1]  __driver_probe_device+0x210/0x460
[    5.860978][    T1]  ? _raw_spin_unlock_irqrestore+0x52/0x80
[    5.860978][    T1]  driver_probe_device+0x4a/0x140
[    5.860978][    T1]  __driver_attach+0x21f/0x5b0
[    5.870986][    T1]  ? __pfx___driver_attach+0x10/0x10
[    5.870986][    T1]  bus_for_each_dev+0x13e/0x1d0
[    5.870986][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    5.870986][    T1]  ? bus_add_driver+0x2b5/0x5b0
[    5.880995][    T1]  bus_add_driver+0x305/0x5b0
[    5.880995][    T1]  driver_register+0x1e2/0x360
[    5.880995][    T1]  ? __pfx_virtio_gpu_driver_init+0x10/0x10
[    5.890955][    T1]  virtio_gpu_driver_init+0xc9/0x170
[    5.890955][    T1]  do_one_initcall+0x11c/0x6f0
[    5.890955][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    5.890955][    T1]  ? kasan_unpoison+0x43/0x60
[    5.900962][    T1]  ? kernel_init_freeable+0x4ca/0x7b0
[    5.900962][    T1]  kernel_init_freeable+0x6ea/0x7b0
[    5.900962][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.910965][    T1]  kernel_init+0x21/0x1e0
[    5.910965][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.910965][    T1]  ret_from_fork+0x730/0xd60
[    5.910965][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[    5.910965][    T1]  ? __switch_to+0x800/0x10f0
[    5.910965][    T1]  ? __pfx_kernel_init+0x10/0x10
[    5.910965][    T1]  ret_from_fork_asm+0x1a/0x30
[    5.910965][    T1]  </TASK>
[    5.930931][    T1] Kernel Offset: disabled
[    5.930931][    T1] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build2460156341=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/cc0Q5SV6.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D13945625580000


Tested on:

commit:         73e3f071 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc2d3e2a7997c1d5=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3D37b56485bbbf90ad8=
489
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1213e9795800=
00


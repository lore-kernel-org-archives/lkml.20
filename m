Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574F3DA5DC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168008; cv=none; b=gDZ3hyFNy7sFYnGcN+QRGWM3oUQbSWdPb3UGxHEkVbSy/qqNOBXMY0ckLyS3M1W/romLDCvJZxKVn5+w1JBrxiHiH/zj1zkbEAQdxAtn3hTPcDkOCJeQoz9OVLnEZYtmWblTRN0ADWWl1IzNxYIaqvai7/KJNhwoen16lGg5pT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168008; c=relaxed/simple;
	bh=2SidLHFI+ak6X+qJdLdIFSBA41nDA14HQdnGzAh2RlE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W6wA4jnxnKP/PaU+nuK3q6S1THg277jn9OJfTu/FDhvuKmfYOQEuTbfR00xYzlULw9IRtMXox8zp2F2a36wHr3N6olyfSSW/3M1SE/AwiNTpMrfpHoBIiiq5XlALBpfER1XedlJWS4Mu/3w7we4Pw1/fDSlqkTKYAqpv5RV2qzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6b73b3920so2916753a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168005; x=1788772805;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQ5IDqaCLH5ez7ExTWlv5WX2dednnHHTstnZQHPnFH8=;
        b=c/miz39PkA2zKm5plnm34EAR584f7ekV+6zVn3AqhV6h0wAHYIhI40yKrBX7UfiIHW
         IimPQTLLun4cMLUh4oaPMXKqa2b56mftJDV2+ydvctxDXflqM1n71MIYW2gmKxhR/QRF
         QYC5R+bhKfOmjhuN4Ag3bN0oSXStIX9rcFsi8u7oSXiVLR1eDXYe5t+yaapS4tZdzICU
         q6+QqBRsW3opDHMj9xTDOWX8JHTfOD0bi4fIcm73tdvm5v6DVaVqc+Ag4Oi4KTBjl87x
         bfGFAJZZWywT4a7G1aI42+vof4bkaoOvBq/WYqEx6pZXWDiVjX2tGMrIjTX0Qbp5zGov
         MhKg==
X-Forwarded-Encrypted: i=1; AHgh+RqWRao024UuxhrnL5CEHgDS0IeTWR3DoJgz6ODTHI/5FtrGcJK0GBnp/1arhcfy4O9PinJkwo7DjD3sXLs=@vger.kernel.org
X-Gm-Message-State: AFuF++k0mQQFFBgxP+dzCJ310/y54Dr8x7q81iSGmE5ss4xRQ9YEw7iR
	gTY/53Xyj8QNvyjtTSF/XSd4bxlfM6i1l5SCT5KnJ8jyeNIjgYN88oX9UzSXz736RBG+xOjfo+N
	BVrpH7Mj0iy1k0T5tC+d+IcdTwq5GpcflpgEcjj/1+t0lm9ZH9JkuQFRP4nI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:d857:0:b0:6b1:bf3a:ed8a with SMTP id
 006d021491bc7-6b1c6600e73mr17601919eaf.14.1788168004717; Mon, 31 Aug 2026
 02:20:04 -0700 (PDT)
Date: Mon, 31 Aug 2026 02:20:04 -0700
In-Reply-To: <20260831084048.410424-1-junjie.cao@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a954744.7724083a.12295.0004.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] INFO: rcu detected stall in kernfs_fop_open (7)
From: syzbot <syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, davem@davemloft.net, edumazet@google.com, 
	gregkh@linuxfoundation.org, horms@kernel.org, jhs@mojatatu.com, 
	jiri@resnulli.us, junjie.cao@intel.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org, vinicius.gomes@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

[mem 0x000a0000-0x000bffff window]
[    4.028875][    T1] pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfef=
ff window]
[    4.033220][    T1] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    4.036737][    T1] PCI: CLS 0 bytes, default 64
[    4.038432][    T1] PCI-DMA: Using software bounce buffering for IO (SWI=
OTLB)
[    4.040165][    T1] software IO TLB: mapped [mem 0x00000000b4600000-0x00=
000000b8600000] (64MB)
[    4.043514][    T1] ACPI: bus type thunderbolt registered
[    4.053039][    T1] RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters=
, 10737418240 ms ovfl timer
[    4.056245][   T60] kworker/u8:1 (60) used greatest stack depth: 28144 b=
ytes left
[    4.056263][   T61] kworker/u8:1 (61) used greatest stack depth: 27696 b=
ytes left
[    4.087176][    T1] kvm_amd: CPU 1 isn't AMD or Hygon
[    4.088501][    T1] clocksource: tsc: mask: 0xffffffffffffffff max_cycle=
s: 0x1fb7086095e, max_idle_ns: 440795277026 ns
[    4.091902][    T1] clocksource: Switched to clocksource tsc
[    4.125123][   T76] kworker/u8:4 (76) used greatest stack depth: 27232 b=
ytes left
[    4.126234][   T80] kworker/u8:3 (80) used greatest stack depth: 26624 b=
ytes left
[    4.133748][    T1] Initialise system trusted keyrings
[    4.140237][    T1] workingset: timestamp_bits=3D40 (anon: 35) max_order=
=3D21 bucket_order=3D0 (anon: 0)
[    4.155583][    T1] DLM installed
[    4.162423][    T1] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    4.174374][    T1] NFS: Registering the id_resolver key type
[    4.174518][    T1] Key type id_resolver registered
[    4.174528][    T1] Key type id_legacy registered
[    4.174908][    T1] nfs4filelayout_init: NFSv4 File Layout Driver Regist=
ering...
[    4.175092][    T1] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Drive=
r Registering...
[    4.179203][    T1] smbdirect: subsystem loading...
[    4.191613][    T1] smbdirect: subsystem loaded
[    4.207305][    T1] Key type cifs.spnego registered
[    4.207587][    T1] Key type cifs.idmap registered
[    4.213246][    T1] ntfs3: Enabled Linux POSIX ACLs support
[    4.213275][    T1] ntfs3: Read-only LZX/Xpress compression included
[    4.213730][    T1] jffs2: version 2.2. (NAND) (SUMMARY)  =C2=A9 2001-20=
06 Red Hat, Inc.
[    4.215917][    T1] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    4.216209][    T1] QNX4 filesystem 0.2.3 registered.
[    4.216310][    T1] qnx6: QNX6 filesystem 1.0.0 registered.
[    4.218163][    T1] fuse: init (API version 7.46)
[    4.224565][    T1] orangefs_debugfs_init: called with debug mask: :none=
: :0:
[    4.225933][    T1] orangefs_init: module version upstream loaded
[    4.227030][    T1] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
[    4.239841][    T1] SGI XFS with ACLs, security attributes, realtime, qu=
ota, no debug enabled
[    4.248736][    T1] 9p: Installing v9fs 9p2000 file system support
[    4.249591][    T1] NILFS version 2 loaded
[    4.249600][    T1] befs: version: 0.9.3
[    4.251044][    T1] ocfs2: Registered cluster interface o2cb
[    4.253105][    T1] ocfs2: Registered cluster interface user
[    4.263937][    T1] OCFS2 User DLM kernel interface loaded
[    4.302028][    T1] gfs2: GFS2 installed
[    4.325876][    T1] ceph: loaded (mds proto 32)
[    4.350261][    T1] cryptd: max_cpu_qlen set to 1000
[    4.387051][    T1] NET: Registered PF_ALG protocol family
[    4.387424][    T1] async_tx: api initialized (async)
[    4.387479][    T1] Key type asymmetric registered
[    4.387520][    T1] Asymmetric key parser 'x509' registered
[    4.387530][    T1] Asymmetric key parser 'pkcs8' registered
[    4.387539][    T1] Key type pkcs7_test registered
[    4.389176][    T1] Block layer SCSI generic (bsg) driver version 0.4 lo=
aded (major 239)
[    4.391001][    T1] io scheduler mq-deadline registered
[    4.391015][    T1] io scheduler kyber registered
[    4.391571][    T1] io scheduler bfq registered
[    4.392067][    T1] raid6: skipped pq benchmark and selected avx2x4
[    4.429845][    T1] input: Power Button as /devices/platform/LNXPWRBN:00=
/input/input0
[    4.434169][    T1] ACPI: button: Power Button [PWRF]
[    4.440466][    T1] input: Sleep Button as /devices/platform/LNXSLPBN:00=
/input/input1
[    4.443845][    T1] ACPI: button: Sleep Button [SLPF]
[    4.492202][    T1] ioatdma: Intel(R) QuickData Technology Driver 5.00
[    4.545316][    T1] ACPI: \_SB_.LNKC: Enabled at IRQ 11
[    4.552843][    T1] virtio-pci 0000:00:03.0: virtio_pci: leaving for leg=
acy driver
[    4.607773][    T1] ACPI: \_SB_.LNKD: Enabled at IRQ 10
[    4.614492][    T1] virtio-pci 0000:00:04.0: virtio_pci: leaving for leg=
acy driver
[    4.676585][    T1] ACPI: \_SB_.LNKB: Enabled at IRQ 10
[    4.682990][    T1] virtio-pci 0000:00:06.0: virtio_pci: leaving for leg=
acy driver
[    4.727260][    T1] virtio-pci 0000:00:07.0: virtio_pci: leaving for leg=
acy driver
[    5.558377][    T1] N_HDLC line discipline registered with maxframe=3D40=
96
[    5.559546][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing enab=
led
[    5.574119][    T1] 00:02: ttyS0 I/O:0x3f8 (irq =3D 4, base_baud =3D 115=
200) is a 16550A
[    5.605595][    T1] 00:03: ttyS1 I/O:0x2f8 (irq =3D 3, base_baud =3D 115=
200) is a 16550A
[    5.628064][    T1] 00:04: ttyS2 I/O:0x3e8 (irq =3D 6, base_baud =3D 115=
200) is a 16550A
[    5.648098][    T1] 00:05: ttyS3 I/O:0x2e8 (irq =3D 7, base_baud =3D 115=
200) is a 16550A
[    5.688220][    T1] Non-volatile memory driver v1.3
[    5.733159][    T1] usbcore: registered new interface driver xillyusb
[    5.735138][    T1] ACPI: bus type drm_connector registered
[    5.748474][    T1] [drm] Initialized vgem 1.0.0 for vgem on minor 0
[    5.756447][    T1] ------------[ cut here ]------------
[    5.756502][    T1] [PLANE:35:plane-0] pixel format with alpha exposed b=
ut blend mode not setup
[    5.756521][    T1] WARNING: drivers/gpu/drm/drm_mode_config.c:873 at dr=
m_mode_config_validate+0x1c6a/0x1e60, CPU#0: swapper/0/1
[    5.785118][    T1] Modules linked in:
[    5.789695][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    5.799116][    T1] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 07/24/2026
[    5.809847][    T1] RIP: 0010:drm_mode_config_validate+0x1cab/0x1e60
[    5.816628][    T1] Code: 0f 85 ae 00 00 00 4d 8d 77 10 8b 6d 00 4c 89 f=
0 48 c1 e8 03 80 3c 18 00 74 08 4c 89 f7 e8 dd b2 cc fc 49 8b 16 4c 89 ef 8=
9 ee <67> 48 0f b9 3a eb 05 e8 89 9e 5e fc 49 bd 00 00 00 00 00 fc ff df
[    5.838674][    T1] RSP: 0000:ffffc90000067810 EFLAGS: 00010246
[    5.845420][    T1] RAX: 1ffff11004c8a408 RBX: dffffc0000000000 RCX: fff=
f88801ceaddc0
[    5.854061][    T1] RDX: ffff888026032380 RSI: 0000000000000023 RDI: fff=
fffff8ff26aa0
[    5.863036][    T1] RBP: 0000000000000023 R08: ffff8880239ccf6b R09: 1ff=
ff110047399ed
[    5.872017][    T1] R10: dffffc0000000000 R11: ffffed10047399ee R12: dff=
ffc0000000000
[    5.880270][    T1] R13: ffffffff8ff26aa0 R14: ffff888026452040 R15: fff=
f888026452030
[    5.888798][    T1] FS:  0000000000000000(0000) GS:ffff888125704000(0000=
) knlGS:0000000000000000
[    5.898155][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.905317][    T1] CR2: ffff88823ffff000 CR3: 000000000e33a000 CR4: 000=
00000003526f0
[    5.913991][    T1] Call Trace:
[    5.917285][    T1]  <TASK>
[    5.920539][    T1]  ? debugfs_create_file_full+0x3f/0x60
[    5.926297][    T1]  drm_dev_register+0x7c/0xd80
[    5.931608][    T1]  vkms_create+0x40d/0x4f0
[    5.936577][    T1]  ? __pfx_vkms_init+0x10/0x10
[    5.941934][    T1]  vkms_init+0x57/0x80
[    5.946295][    T1]  do_one_initcall+0x250/0x870
[    5.951406][    T1]  ? __pfx_vkms_init+0x10/0x10
[    5.956290][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    5.962347][    T1]  ? lapic_next_event+0x11/0x20
[    5.967732][    T1]  ? clockevents_program_event+0x491/0x630
[    5.973595][    T1]  ? __pfx___schedule+0x10/0x10
[    5.978930][    T1]  ? irqentry_exit+0x218/0x790
[    5.984090][    T1]  ? lockdep_hardirqs_on+0x7b/0x110
[    5.989508][    T1]  ? irqentry_exit+0x218/0x790
[    5.994552][    T1]  ? trace_irq_disable+0x3b/0x140
[    5.999974][    T1]  ? parameq+0x25/0x170
[    6.004878][    T1]  ? parameq+0x14d/0x170
[    6.009224][    T1]  ? parse_args+0x9c3/0xad0
[    6.014154][    T1]  ? rcu_is_watching+0x16/0xb0
[    6.019426][    T1]  do_initcall_level+0x10a/0x1a0
[    6.024854][    T1]  ? kernel_init+0x22/0x1d0
[    6.029487][    T1]  do_initcalls+0x59/0xa0
[    6.034077][    T1]  kernel_init_freeable+0x29d/0x3e0
[    6.039941][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.045132][    T1]  kernel_init+0x22/0x1d0
[    6.049797][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.055569][    T1]  ret_from_fork+0x514/0xb70
[    6.060573][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[    6.066057][    T1]  ? __switch_to+0xc89/0x1420
[    6.071718][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.077617][    T1]  ret_from_fork_asm+0x1a/0x30
[    6.082852][    T1]  </TASK>
[    6.086082][    T1] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    6.092792][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    6.092792][    T1] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 07/24/2026
[    6.092792][    T1] Call Trace:
[    6.092792][    T1]  <TASK>
[    6.092792][    T1]  vpanic+0x56d/0xa60
[    6.092792][    T1]  ? __pfx__printk+0x10/0x10
[    6.092792][    T1]  ? __pfx_vpanic+0x10/0x10
[    6.092792][    T1]  ? is_bpf_text_address+0x292/0x2b0
[    6.092792][    T1]  ? is_bpf_text_address+0x26/0x2b0
[    6.140129][    T1]  panic+0xc5/0xd0
[    6.140129][    T1]  ? __pfx_panic+0x10/0x10
[    6.140129][    T1]  ? ret_from_fork_asm+0x1a/0x30
[    6.140129][    T1]  __warn+0x315/0x4c0
[    6.140129][    T1]  ? drm_mode_config_validate+0x1c6a/0x1e60
[    6.140129][    T1]  ? drm_mode_config_validate+0x1c6a/0x1e60
[    6.140129][    T1]  __report_bug+0x276/0x570
[    6.140129][    T1]  ? look_up_lock_class+0x57/0x110
[    6.140129][    T1]  ? drm_mode_config_validate+0x1c6a/0x1e60
[    6.140129][    T1]  ? __pfx___report_bug+0x10/0x10
[    6.140129][    T1]  ? __pfx_inode_set_ctime_to_ts+0x10/0x10
[    6.140129][    T1]  ? seqcount_lockdep_reader_access+0xeb/0x100
[    6.140129][    T1]  ? ktime_get_coarse_real_ts64_mg+0x1be/0x1e0
[    6.140129][    T1]  report_bug_entry+0x19b/0x290
[    6.140129][    T1]  ? drm_mode_config_validate+0x1cab/0x1e60
[    6.140129][    T1]  ? drm_mode_config_validate+0x1cb0/0x1e60
[    6.140129][    T1]  handle_bug+0xce/0x200
[    6.140129][    T1]  exc_invalid_op+0x1a/0x50
[    6.240148][    T1]  asm_exc_invalid_op+0x1a/0x20
[    6.240148][    T1] RIP: 0010:drm_mode_config_validate+0x1cab/0x1e60
[    6.240148][    T1] Code: 0f 85 ae 00 00 00 4d 8d 77 10 8b 6d 00 4c 89 f=
0 48 c1 e8 03 80 3c 18 00 74 08 4c 89 f7 e8 dd b2 cc fc 49 8b 16 4c 89 ef 8=
9 ee <67> 48 0f b9 3a eb 05 e8 89 9e 5e fc 49 bd 00 00 00 00 00 fc ff df
[    6.240148][    T1] RSP: 0000:ffffc90000067810 EFLAGS: 00010246
[    6.240148][    T1] RAX: 1ffff11004c8a408 RBX: dffffc0000000000 RCX: fff=
f88801ceaddc0
[    6.240148][    T1] RDX: ffff888026032380 RSI: 0000000000000023 RDI: fff=
fffff8ff26aa0
[    6.240148][    T1] RBP: 0000000000000023 R08: ffff8880239ccf6b R09: 1ff=
ff110047399ed
[    6.240148][    T1] R10: dffffc0000000000 R11: ffffed10047399ee R12: dff=
ffc0000000000
[    6.240148][    T1] R13: ffffffff8ff26aa0 R14: ffff888026452040 R15: fff=
f888026452030
[    6.240148][    T1]  ? debugfs_create_file_full+0x3f/0x60
[    6.240148][    T1]  drm_dev_register+0x7c/0xd80
[    6.240148][    T1]  vkms_create+0x40d/0x4f0
[    6.340134][    T1]  ? __pfx_vkms_init+0x10/0x10
[    6.340134][    T1]  vkms_init+0x57/0x80
[    6.340134][    T1]  do_one_initcall+0x250/0x870
[    6.340134][    T1]  ? __pfx_vkms_init+0x10/0x10
[    6.340134][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    6.340134][    T1]  ? lapic_next_event+0x11/0x20
[    6.340134][    T1]  ? clockevents_program_event+0x491/0x630
[    6.340134][    T1]  ? __pfx___schedule+0x10/0x10
[    6.340134][    T1]  ? irqentry_exit+0x218/0x790
[    6.340134][    T1]  ? lockdep_hardirqs_on+0x7b/0x110
[    6.340134][    T1]  ? irqentry_exit+0x218/0x790
[    6.340134][    T1]  ? trace_irq_disable+0x3b/0x140
[    6.340134][    T1]  ? parameq+0x25/0x170
[    6.340134][    T1]  ? parameq+0x14d/0x170
[    6.340134][    T1]  ? parse_args+0x9c3/0xad0
[    6.340134][    T1]  ? rcu_is_watching+0x16/0xb0
[    6.340134][    T1]  do_initcall_level+0x10a/0x1a0
[    6.440160][    T1]  ? kernel_init+0x22/0x1d0
[    6.440160][    T1]  do_initcalls+0x59/0xa0
[    6.440160][    T1]  kernel_init_freeable+0x29d/0x3e0
[    6.440160][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.440160][    T1]  kernel_init+0x22/0x1d0
[    6.440160][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.440160][    T1]  ret_from_fork+0x514/0xb70
[    6.440160][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[    6.440160][    T1]  ? __switch_to+0xc89/0x1420
[    6.440160][    T1]  ? __pfx_kernel_init+0x10/0x10
[    6.440160][    T1]  ret_from_fork_asm+0x1a/0x30
[    6.440160][    T1]  </TASK>
[    6.440160][    T1] Kernel Offset: disabled
[    6.440160][    T1] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build106592319=3D/tmp/go-build -gno-record-gcc=
-switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
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
HEAD detached at fb8f743dc82
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dfb8f743dc82ba3a879228aa71ce09fdc570665d1 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20250724-140804"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"fb8f743dc82ba3a879228aa71ce09fdc57=
0665d1\"
/usr/bin/ld: /tmp/ccAow3F6.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D16824349580000


Tested on:

commit:         a8455260 ipvlan: unregister upper devices outside pnod..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.gi=
t
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd7588e5a39260ad=
2
dashboard link: https://syzkaller.appspot.com/bug?extid=3D19d01f6082ec61dd4=
5b2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D170c43495800=
00


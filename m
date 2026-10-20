Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520431;
	b=0D5LAOF6zd0GwIIphlAdCrCVXJ+KdcWhEPd4xmkzj/kp1I7iMWNJnoebt0A14/FRZBxL
	 MyKHyChaiGSrzByHaqg8CrsCzUIzmJXNevxjmBQhOO3FWBam8PNvyQOfeXZtKDBEcQPWP
	 3horYXMZh+KMmF9So7slFVntln+258p7LLIJTGU09HbWKEftkL6feKIe2V0nEkYSWNBdj
	 gzDKwtLOPo0pOBidID4H5AqN7UIIG3c67rMSPpgedDEMzCJv4gizWXG82LWqM00drGg70
	 P0C4aPZyLloyxu5KNQMD/BAIyc0WqlurzC6p1ovvXZQcz710udK8/yZ06KV5GnK3Wog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520431;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=SHm3lNj7Pvfb+cw41IZikmw0ICaWLgMwwg0/9x5rfJg=;
	b=Bhx/U28PVuF8e62arIG+fysd03g807rdlLGTPWjCDTOWYc7tI4yacWmKgTmwG0YC2xzC
	 3D3ZGcXe/BVPNu+haTkhWVR408gbS4yy51VVn+D5HEZTXP3a1Tu9LjHDR3AQHxcSl2xye
	 fO4dKpDJI1g9Kl23dZfxva966o2Uvnxn7wX1qtSu7O4RWWYXqroVIXuDimA8f/b3IjvSq
	 i5kiRtEYdoKtIGt65teF9SDvbzmniHmOXkZ+99WqyW5qtW51lR/ABmQ5Nsp/cPc9CONsG
	 AvoqgTAK8lt19L33wBqd95a7fb00fr1jEh81/O8oBGml/E8HIEeUU2xev+Lf0pJ04Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2A160A263C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE2A160A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab260600easo1370394b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520430; x=1793125230;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHm3lNj7Pvfb+cw41IZikmw0ICaWLgMwwg0/9x5rfJg=;
        b=QfQNtlcO/EoREo5+r48N6pnmLBjOko9CtC5UXWnMP50GVGTrn9rWyGwoa+0EE+KgN1
         j1nqx24WaqVBcCcw9sab8r/ORrKV7HrrZBoN+aqHLiKKKReGNm19DZZgcYCcqgQTHuyC
         34KtsuUs1YPPXQh1rXUBgWH9Bnsn2uMMel9go2w3mV5x2zBSfTwPTD7/BpQ03LXO4mBB
         hpQ25BOzLuxpg5nwgdoL7Bm831h6skwRqfuzJ2J64GUrcgghZ+ALaQtSw4Jpn2i4O8KF
         CXx1yjfA1h+0xoCwgDAhbs7R2Fx25xckZngrZNf0z6OOjmbS5YnTJcl3+hejzvpaXESD
         bISw==
X-Forwarded-Encrypted: i=1; AKwUvBzUu9CqAp1wJHmyfyQJDyqGoSow4buYMtidLZaTIm14BQoayyfEKSQsPCeh9Z33N5a9aJEYUL86BqEwMm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtxXvKjCn2kDVjjJwmG7uuSQSEm7iR+LasQAlPzI7LrB6aQGUz
	GTsSaSNBsgay920GNlje6vDV7AOSW3H9Tpg9E7ucLItBX7AR6Cy8iYo6lhzjUrjvq+EmNUHgNm2
	9NVgiNBBTEYuL4SkjDmyrg4UDm2QFu+1UVvfdd2/YhLI/m9tRGxeHc+pd4pA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1b8:b0:4f5:214:fb96 with SMTP id
 5614622812f47-54d974aec0fmr1886617b6e.42.1792520430038; Tue, 20 Oct 2026
 11:20:30 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:20:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad7b0ee.5c73e770.1a06c9.013b.GAE@google.com>
Subject: [syzbot] [mtd?] Internal error in mtd_read_oob_std
From: syzbot <syzbot+eaaabe90f486cb6f31b2@syzkaller.appspotmail.com>
To: joern@lazybastard.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2f2f7eeef8b0 Merge tag 'soc-fixes-7.3-3' of git://git.kern..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=12cfd20d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=644925403e5fc5f8
dashboard link: https://syzkaller.appspot.com/bug?extid=eaaabe90f486cb6f31b2
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15845da9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115c960d580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-2f2f7eee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0db2a9d79647/vmlinux-2f2f7eee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4415d93465b1/Image-2f2f7eee.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eaaabe90f486cb6f31b2@syzkaller.appspotmail.com

Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 3660 Comm: syz.2.17 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: linux,dummy-virt (DT)
pstate: 81402009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : __memcpy+0xc/0x44 arch/arm64/lib/memcpy.S:251
lr : phram_read+0x28/0x40 drivers/mtd/devices/phram.c:70
sp : ffff80008671b7c0
x29: ffff80008671b7c0 x28: f7f0000012970000 x27: 0000000000000000
x26: 0000000000003030 x25: 0000000000002000 x24: 0000000000000000
x23: 0000000000000000 x22: 0000000000000000 x21: ffff80008671b830
x20: ffff80008671b840 x19: 0000000000000044 x18: 00000000ffffffff
x17: ffff800083ab372d x16: ffff800083ab3708 x15: f9f0000006deb280
x14: ffff80008671b600 x13: f9f0000006deba1c x12: 0000550855e43902
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
x8 : 0000000000000000 x7 : dead000000000122 x6 : 0000000000000000
x5 : ffff8000c0000000 x4 : ffff80008671b8e4 x3 : ffff80008671b8e4
x2 : 0000000000000044 x1 : ffff8000c0000000 x0 : ffff80008671b8e4
Call trace:
 __memcpy+0xc/0x44 arch/arm64/lib/memcpy.S:250 (P)
 mtd_read_oob_std+0x84/0x9c drivers/mtd/mtdcore.c:1702
 mtd_read_oob+0x8c/0x15c drivers/mtd/mtdcore.c:1811
 mtd_read+0x68/0xc4 drivers/mtd/mtdcore.c:1603
 scan_header drivers/mtd/ftl.c:164 [inline]
 ftl_add_mtd+0xec/0x6a8 drivers/mtd/ftl.c:1017
 blktrans_notify_add drivers/mtd/mtd_blkdevs.c:464 [inline]
 blktrans_notify_add+0x50/0x74 drivers/mtd/mtd_blkdevs.c:456
 add_mtd_device+0x45c/0x7a8 drivers/mtd/mtdcore.c:828
 mtd_device_parse_register+0x294/0x35c drivers/mtd/mtdcore.c:1156
 register_device+0x104/0x260 drivers/mtd/devices/phram.c:162
 phram_setup+0x16c/0x2a0 drivers/mtd/devices/phram.c:324
 phram_param_call+0x60/0x84 drivers/mtd/devices/phram.c:349
 param_attr_store+0xa4/0x100 kernel/params.c:591
 module_attr_store+0x24/0x40 kernel/params.c:906
 sysfs_kf_write+0x7c/0x98 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x138/0x200 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x244/0x36c fs/read_write.c:687
 ksys_write+0x70/0x108 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x18/0x24 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x54/0x10c arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x1c/0x34 arch/arm64/kernel/syscall.c:140
 el0_svc+0x38/0x1fc arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:590
Code: d65f03c0 d503245f d503201f aa0003e3 (1d010443) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	d65f03c0 	ret
   4:	d503245f 	bti	c
   8:	d503201f 	nop
   c:	aa0003e3 	mov	x3, x0
* 10:	1d010443 	cpyp	[x3]!, [x1]!, x2! <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

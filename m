Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764495;
	b=tBA2GaVh+cIcCrdJOTZhQjbMUpawNTNd4/s2zavZWrKzsRlDt3HEDAAKDkdV/JU7P4TM
	 kMkRzUmLrwXac3oiQSM3zP6EDOHPbi63Tzju0LSfI1mYg++wjCLQ19xSgXCxDetdxaeTG
	 P35blaPx4ezpMV+kUmzBkWDe9P5OOEkW3KYFTSUZH0Xm4oQyl3CHah6iKdP/MW2rsEsw8
	 YaI8ofQYo2KS+OwAu4MnKWQea5CTES/qjRZEnDbVE1T6uBr3yJTufmDO8zDQMiuw+Pwae
	 Teb31WunjFAPAVxNiWFicVA7ziapVNyfqWB9BevJTK70uT2AdP57hgPQEZ18mYA4RrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764495;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=h1WANQ2w9UxZWMoCREmx4xN0hg8nq70qal3CpFfNp6o=;
	b=iKhAC3BhrSF+AX+c0JnRvfFU85tECriiv/wfAIw6HSX4rvWpPWDm3fpF6D0Y6uGy3+9h
	 asS6Fi7TgyxQRVQCG5Kn5xXiVLSa5d/911AbUORx025IlZ1focceFVeYQFxYrB3SJKZ/r
	 4fP5pAYwX9If2O5BH4ITYel3g8x+6v7J9kNHiCh+351vg2ZtRNQQxEbEnDtzhdvEH7qq+
	 Cy/XxYQGT2GY0o8PuFVKavG/KGRYsXry/2RbXmShzMJqrQsv1zSYP5Bs3Q3cIuXWLHeo6
	 2CqfI/HVPZLWwzXmCTqcOXZDu+zIV9Ej2n5Jpi0EZiJBs/ARItxTY8+hd9Ek+h9DunQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCC2606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCC2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-568249fbf5eso3275591b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764494; x=1795369294;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1WANQ2w9UxZWMoCREmx4xN0hg8nq70qal3CpFfNp6o=;
        b=1tsLn/FJC3WvgvoTjI5Q+Xywpn1D46stdM3Ez5Wrse3eoxDZNIpsk028wP4zHWIGm8
         aKP0Z4kbo5GVVH4Vf1i3ZdZrZfjs/+R9QJrOX7IUNYXx7bFQkcOZE8AmuGvCAuuMUiqg
         iJplclqymLkzkED80mb2zJEOequIk+NHfnGsUpzIIFazpDPrZWO7W+gKOjr+iHG8I9kD
         AN9vy/gzYbtnUVyCAFG+ec8lcBXTOC38AufOnTfYAlvSGaDmSdqIkSPRighEVGo1a5I0
         E3gH5up8W5vDPO+Dng8m9JAL81HVOPka9/HSjmW9YezQEdfKJZ+o4V/9wkGrIrt3gw4p
         22JA==
X-Gm-Message-State: APuU4Z9t4xp0LoLYcBoGLSUeTNtamQHSnCibKKOD4uFru1LSHFwJ+R0f
	knfyT5Ma+qlt4qTjRCxyg6sGys16NO8UV13BgEMfiXXRF+VK2mvBNkQtcfnHUGiJGXjNfY8wNLT
	/qC/vHdv1IdnZqhEXjpT+RcBDGH2I/M6SRUQ5y74YpTvcRh9AZxo7PKzVg+0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c48:b0:4c4:d8a0:2773 with SMTP id
 5614622812f47-56e637a00d5mr7067168b6e.32.1794764494262; Sun, 15 Nov 2026
 09:41:34 -0800 (PST)
Date: Sun, 15 Nov 2026 09:41:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9eece.920b2b3a.148c65.0031.GAE@google.com>
Subject: [syzbot] [raid?] WARNING in r1buf_pool_alloc
From: syzbot <syzbot+c0e700c08ee88f60e54d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, 
	magiclinan@didiglobal.com, song@kernel.org, syzkaller-bugs@googlegroups.com, 
	xiao@kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    23c62304dde2 Merge tag 'for-linus-7.4a-rc3-tag' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=142ac5be580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=c0e700c08ee88f60e54d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=178e7da1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162f644d580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-23c62304.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0f7bce229a50/vmlinux-23c62304.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7a152fd539c6/bzImage-23c62304.xz

AI-generated root cause summary:
When configuring a software RAID1 array via the SET_ARRAY_INFO ioctl,
md_set_array_info() in drivers/md/md.c does not validate the user-supplied
info->raid_disks value. When an array is initialized with an excessively large
raid_disks count (e.g. 0x8002 / 32,770), the resync initialization in
raid1_sync_request() invokes r1buf_pool_alloc() in drivers/md/raid1.c to
preallocate mempool buffers. r1buf_pool_alloc() attempts to allocate an array of
struct resync_pages via kmalloc_objs(..., conf->raid_disks * 2, ...) exceeding
KMALLOC_MAX_SIZE (4 MiB), which triggers the WARN_ON_ONCE_GFP check in
___kmalloc_large_node() in mm/slub.c.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=c0e700c08ee88f60e54d

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c0e700c08ee88f60e54d@syzkaller.appspotmail.com

md: resync of RAID array md0
------------[ cut here ]------------
1
WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x132/0x170 mm/slub.c:5459, CPU#2: md0_resync/6011
Modules linked in:
CPU: 2 UID: 0 PID: 6011 Comm: md0_resync Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:___kmalloc_large_node+0x132/0x170 mm/slub.c:5459
Code: db 0f 85 66 ff ff ff 45 31 e4 eb cb 48 81 ff 00 00 40 00 0f 86 07 ff ff ff 80 3d 51 7d d6 0f 00 75 0b c6 05 48 7d d6 0f 01 90 <0f> 0b 90 48 83 c4 08 31 c0 5b 5d 41 5c 41 5d 41 5e c3 cc cc cc cc
RSP: 0018:ffffc90003cf7608 EFLAGS: 00010246
RAX: ffffffff88996c0e RBX: 0000000000880220 RCX: 0000000000000000
RDX: 00000000ffffffff RSI: 0000000000000cc0 RDI: 0000000000880220
RBP: 0000000000000cc0 R08: 0000000000000000 R09: 0000000000000000
R10: ffffed100c6b000e R11: 0000000000000000 R12: 0000000000000cc0
R13: 00000000ffffffff R14: 0000000000880220 R15: ffffed10048c1435
FS:  0000000000000000(0000) GS:ffff8880d466c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055559223fa28 CR3: 000000000fd98000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __kmalloc_large_node_noprof+0x1c/0x70 mm/slub.c:5502
 __do_kmalloc_node mm/slub.c:5519 [inline]
 __kmalloc_noprof+0x5a3/0x840 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 r1buf_pool_alloc+0xfe/0xd90 drivers/md/raid1.c:181
 mempool_init_node+0x2f7/0x6f0 mm/mempool.c:272
 mempool_init_noprof+0x3a/0x50 mm/mempool.c:302
 init_resync drivers/md/raid1.c:2684 [inline]
 raid1_sync_request+0x1f5e/0x2ff0 drivers/md/raid1.c:2734
 md_do_sync.cold+0xf79/0x2946 drivers/md/md.c:9962
 md_thread+0x550/0x5d0 drivers/md/md.c:8732
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

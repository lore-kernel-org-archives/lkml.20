Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762954;
	b=HF2no19Cx+M/ZRbnxt/XA5hR4bSyqcXbH/5nagFjtJoa2ItqGo0TXU5yo9Qii9Xvht3O
	 gB+iW5hZGNKhsKIKY8NmHl9nhuYMLqn/qi1vCz/ua7WIB2lATD5H73VKO4Y7cwWwAX4L3
	 ONAMNRjGqLm8rbwsuDq6muFCUDTQLfZ7GCRkwQfD64vKPm18PmkmqpSLAL6/B9fTkwrk8
	 pGFMhHvaUNeco7vc1GvWbTgcZ+HF7cqC4LldlPwTU3AxyG+z0fUzljAhpOu8uF2vF6lcN
	 0JtgXngalbklS7K04U6r4VKy6Kw0AZ1gLi135PVX9fIRgOdk2EOvfooIwtRI292h+yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762954;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=ljm8bNNap3tvF9+jeCrN03t35kRNZ/yBqVC9j5iU6CA=;
	b=ie0c7/UrlS1k/ORzmREPqPw93XJ61SgH/Q9TqXoQ5wxkiVEGDEx70lld6N1kZmjmklpk
	 Ryisp7M3zfAKmfW2gAjC6Oxp5fwVmtdC9DJR2nHlRaykSyw7B1iH+9f0nxngxeg8EOE7R
	 KCu8GOcrDizIfu+YLb0wfuIWgtHVNaUFzoBecuYNNl31G1kjPPJLftugIlhaTcJOn2PQ6
	 NABZayfxpxPlIfjJ5lPYGcm4o4qdvKdD9yr9y2CFT4kdjFV8DbPtV7dISdZ5Qn1sPr82q
	 ztQceJviTXJ34DPjHivbgBrqXakwlhD44biEdGZ8zKavxnVAsn1JwIpYGSqOBt+YLIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8340B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f4612a1a5cso2374536b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762953; x=1793367753;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljm8bNNap3tvF9+jeCrN03t35kRNZ/yBqVC9j5iU6CA=;
        b=k6SMcV9QwSxCEuB+f8lNMoFsEyAGcSyhQ2tcK3+Mvl+ZxcSlu8kDYLGPCY0H2Ospbx
         GQ+a9lrEcr2Wt0Kx/1CGZsGTZU6qlQCJBe0ufU+3g3JP19f2CpMVlgOnRM7TiV+D4hwe
         rG+DDSfo+l7wimfPQzhLxFbLOADr4Z7ReoRuq/88XJ9D0QTrRVYe5z2wA0A2SE3RVuqt
         82b0ZQt4BCTGRbvcHtqW3sC11+gwlHIoC5yMQCkfXmEi6zsa5dG9mr4BVQ0080rFPQa1
         GBDrhXEXnZ/p8PtrpSsAKJ1O/M5PBN3ej87uxt1DfBVN1TcpV8PMqOdcOfURJw3DzAcu
         ZGXA==
X-Forwarded-Encrypted: i=1; AKwUvBxtZiLzf7nFsQ2TJCXWLZcvuj43jWxXTZ8QQGha68KJ4UfAwWM50/8a9R2Wnk88fy/bmAlkHQRO+GpHWk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZeMQ7ceip4u1mX71wkwBQ5hJ/xbp0xL9kwbRm2j2UVEpvKEqe
	dlqnSuwpKG2JneMUi7bg7fvXB0NusMeFzaVf+9uahwTmGdqBX8vgn8xCElufWxQmAO8MTnfhz5l
	K5u9Afuk2dAWCgj0iQDPuO/q6wBVCJFoDNQ7/eJM0lti64EBB6WXUgQiOOiM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c224:b0:53a:1c29:cb37 with SMTP id
 5614622812f47-557ee87e5edmr3000376b6e.38.1792762953518; Fri, 23 Oct 2026
 06:42:33 -0700 (PDT)
Date: Fri, 23 Oct 2026 06:42:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adb6449.5589765f.2780bb.0034.GAE@google.com>
Subject: [syzbot] [nvme?] WARNING in nvme_tcp_init_request
From: syzbot <syzbot+bdd7605037d64d5ccc10@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	sagi@grimberg.me, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2efb7a11f1aa Add linux-next specific files for 20261016
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1419283c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=129fca4e65ab9877
dashboard link: https://syzkaller.appspot.com/bug?extid=bdd7605037d64d5ccc10
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1219283c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1718d93e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cd996cff1b76/disk-2efb7a11.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/59577d58bd5a/vmlinux-2efb7a11.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a3dfa3b04143/bzImage-2efb7a11.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bdd7605037d64d5ccc10@syzkaller.appspotmail.com

nvme nvme0: creating 2 I/O queues.
nvme nvme0: mapped 2/0/0 default/read/poll queues.
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#1: syz-executor121/5622
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x132a/0x15a0 kernel/locking/mutex.c:821, CPU#1: syz-executor121/5622
Modules linked in:
CPU: 1 UID: 0 PID: 5622 Comm: syz-executor121 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x1331/0x15a0 kernel/locking/mutex.c:821
Code: b9 7a 91 48 c1 e8 03 0f b6 04 18 84 c0 0f 85 46 02 00 00 83 3d 93 fc 83 05 00 75 13 48 8d 3d c6 fa 86 05 48 c7 c6 c0 27 0d 8c <67> 48 0f b9 3a 90 e9 1d ee ff ff 90 0f 0b 90 e9 f0 f1 ff ff 90 0f
RSP: 0018:ffffc90003bdf1e0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffff88807e8a9f40
RDX: 0000000000000000 RSI: ffffffff8c0d27c0 RDI: ffffffff917db820
RBP: ffffc90003bdf378 R08: ffffffff917ab9e3 R09: 1ffffffff22f573c
R10: dffffc0000000000 R11: fffffbfff22f573d R12: ffff88807ed84460
R13: 0000000000000000 R14: 1ffff9200077be50 R15: 0000000000000000
FS:  000055557669a400(0000) GS:ffff888123b8b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcefd60ee9c CR3: 000000007ed68000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 nvme_tcp_init_request+0xbd/0x260 drivers/nvme/host/tcp.c:571
 blk_mq_init_request block/blk-mq.c:3596 [inline]
 blk_mq_alloc_rqs block/blk-mq.c:3664 [inline]
 blk_mq_alloc_map_and_rqs+0x66d/0x980 block/blk-mq.c:4137
 __blk_mq_alloc_map_and_rqs block/blk-mq.c:4155 [inline]
 __blk_mq_alloc_rq_maps block/blk-mq.c:4714 [inline]
 blk_mq_alloc_set_map_and_rqs+0x1a0/0x810 block/blk-mq.c:4745
 blk_mq_alloc_tag_set+0x8e5/0x1000 block/blk-mq.c:4929
 nvme_alloc_io_tag_set+0x36a/0x6f0 drivers/nvme/host/core.c:5103
 nvme_tcp_configure_io_queues drivers/nvme/host/tcp.c:2297 [inline]
 nvme_tcp_setup_ctrl+0xc6f/0x1670 drivers/nvme/host/tcp.c:2530
 nvme_tcp_create_ctrl+0xa59/0xf00 drivers/nvme/host/tcp.c:3123
 nvmf_create_ctrl drivers/nvme/host/fabrics.c:1361 [inline]
 nvmf_dev_write+0x24ca/0x2d90 drivers/nvme/host/fabrics.c:1408
 vfs_write+0x296/0xba0 fs/read_write.c:685
 ksys_write+0x150/0x270 fs/read_write.c:1036
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f86ccedd849
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffd35af4a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 6769666e6f632f2e RCX: 00007f86ccedd849
RDX: 000000000000003a RSI: 00002000000007c0 RDI: 0000000000000008
RBP: 0000000000000001 R08: 0000000000000006 R09: 0000000000000006
R10: 0000000000000006 R11: 0000000000000246 R12: 00007fffd35af618
R13: 431bde82d7b634db R14: 00007f86ccf70c40 R15: 0000000000000002
 </TASK>
----------------
Code disassembly (best guess):
   0:	b9 7a 91 48 c1       	mov    $0xc148917a,%ecx
   5:	e8 03 0f b6 04       	call   0x4b60f0d
   a:	18 84 c0 0f 85 46 02 	sbb    %al,0x246850f(%rax,%rax,8)
  11:	00 00                	add    %al,(%rax)
  13:	83 3d 93 fc 83 05 00 	cmpl   $0x0,0x583fc93(%rip)        # 0x583fcad
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d c6 fa 86 05 	lea    0x586fac6(%rip),%rdi        # 0x586fae9
  23:	48 c7 c6 c0 27 0d 8c 	mov    $0xffffffff8c0d27c0,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	e9 1d ee ff ff       	jmp    0xffffee52
  35:	90                   	nop
  36:	0f 0b                	ud2
  38:	90                   	nop
  39:	e9 f0 f1 ff ff       	jmp    0xfffff22e
  3e:	90                   	nop
  3f:	0f                   	.byte 0xf


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

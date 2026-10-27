Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102937;
	b=gjLt3kroTKbiaOwjL6eF7SGTXPmmDrIrKDmUI3Yz3/8IJIqVRXZi0YL1bMI99FjEZLN7
	 CaRB1PLht7VfEHt55liMRfraTrkq9TcH5XE1G/VtBpoppGIxX6E7S8zOUuY+6JDZr3xWT
	 EcaqgR2chgGIa+LVTND/mxaYv2wp5yrUnmbyNyO4kDkd3scXuZAhorKBje90aweDg/a7i
	 kQ8FBsSYjQSlhxEcP71WzdIvmMYjBWwEfvlwjXezfGwjqG9wIm4qDicv/LFEeFtn54Ebc
	 zCkLwY164K9Msk+GJvshSLDBcy7bd3WR7UkohGStHuR/l+QtZMK9N+1BolEWDOIu2gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102937;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=Q18CX9oERe+Qlw4qixuBq/UMhSXDXeDifeNedFR1kfQ=;
	b=Xv6YsZAZ9/PHORyDjLo31qL2CrYLTqLfL5ioOP1+DoIL69NlVI1z2/+n9fbC3SeatiNd
	 S9OpR4d0ZIYQfhqe74SC7m7ZLV4QZEwD2g9612bnftyL4nySaV1Ry1UdIGopTekHR0tBj
	 MZh6QXiZ7JMO8SnDjHGvL59/nBuFU7Qb/aEv4DzPxwKnts/b8AP0d8+q/QVKVQNES7ipe
	 SgvIgaJYFQeKRjFHrn7OpwijKIG4heMzaGXfeCoe587vIbLomq1IUJw7ttb1Rj3K0IWa7
	 +lcegxY+gG4+yUuZ6hWAxkJDJLY1LQ29XhlbtBSVG8F5zeHyVp0uhMT3pijZsqcDG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753DC606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753DC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-55bf11583d9so1256821b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102936; x=1793707736;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q18CX9oERe+Qlw4qixuBq/UMhSXDXeDifeNedFR1kfQ=;
        b=kvru2zGsHxAuL/YbP+6cQMwG5WV7mB4nOvRIpM4p6OyYyNPgOTszFjIOZrUd7uiynm
         VEa103aqdCMuYz3gqRK77QFZbuM1AKy39B8eKNfHVujh4PHRPniLvooH6Yq1hk7Yn2j6
         grbJuDu7KyQFUNmQzIq/6b81EtRBj8AbUPpj3nJ7q4mtEgfcpoVadG6NDihTje2MpU0B
         pKC0HgRmlZCqLTu+x696+Vgf49ZdXHnDm9UWLLY45U1tYfg2yT5ocluI2GNEr4YOStaN
         18p2Bi+OPIkXA6l3bpzoi5Rgs8yLB3NiBll8injdDGDLcAEEffBGLjI5x3asVroLI1XG
         vwfA==
X-Gm-Message-State: AFq9FYLHMwi9V4Swjs79mmpYGohZ2eMTGKk05pI6FlQPILdeBgq8wXwA
	TTy/mpR8EuWIYpOAvKzalDJvgDHmDDrv+rYroqFFTbLDxEw9A1s9E3oFzAUJnDdzkbg7ViqlxiD
	3iz65Jo7EpVp+HJbPhrjgQEI7fOJiF1sYMZ5ZQmFamPQ4HWLTg2Hi2Ww8mqk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b0f:b0:4b8:4703:db97 with SMTP id
 5614622812f47-55f8007381emr1104730b6e.32.1793102936306; Tue, 27 Oct 2026
 05:08:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:08:56 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae09458.f0fe5aea.79aa1.008d.GAE@google.com>
Subject: [syzbot] WARNING in d_make_discardable
From: syzbot <syzbot+2e3c70a51d4ac0f6bdd9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5b0764a53235 Merge tag 'drm-next-2026-10-21' of https://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15f3470d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6e9d69cbadaeb907
dashboard link: https://syzkaller.appspot.com/bug?extid=2e3c70a51d4ac0f6bdd9
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14089aa5580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2e3c70a51d4ac0f6bdd9@syzkaller.appspotmail.com

------------[ cut here ]------------
!(dentry->d_flags & DCACHE_PERSISTENT)
WARNING: fs/dcache.c:1063 at d_make_discardable+0x28e/0x2f0 fs/dcache.c:1063, CPU#3: syz-executor121/6123
Modules linked in:
CPU: 3 UID: 0 PID: 6123 Comm: syz-executor121 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:d_make_discardable+0x28e/0x2f0 fs/dcache.c:1063
Code: 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 0f b6 04 02 84 c0 74 04 3c 03 7e 5b 83 0b 40 e9 2e ff ff ff e8 93 c5 69 ff 90 <0f> 0b 90 e9 c8 fd ff ff e8 05 d8 e2 ff e9 14 fe ff ff 48 89 df e8
RSP: 0018:ffffc900036b7280 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88803d9b2680 RCX: 0000000000000001
RDX: ffff8880270e0000 RSI: ffffffff82a4457d RDI: ffff8880270e0000
RBP: 0000000000100080 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: dffffc0000000000 R14: ffff88803fc2e4e0 R15: ffff888046af5e80
FS:  00007ff6448646c0(0000) GS:ffff8880d47ba000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056251a682e28 CR3: 0000000038934000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __simple_recursive_removal+0x276/0x5c0 fs/libfs.c:625
 rpc_remove_client_dir+0xf0/0x140 net/sunrpc/rpc_pipe.c:898
 __rpc_clnt_remove_pipedir net/sunrpc/clnt.c:100 [inline]
 __rpc_clnt_remove_pipedir net/sunrpc/clnt.c:97 [inline]
 rpc_client_register+0x605/0x6f0 net/sunrpc/clnt.c:333
 rpc_new_client+0x977/0x1300 net/sunrpc/clnt.c:437
 rpc_create_xprt+0xd9/0x440 net/sunrpc/clnt.c:483
 rpc_create+0x46e/0x7f0 net/sunrpc/clnt.c:619
 nfs_create_rpc_client+0x6a1/0x8f0 fs/nfs/client.c:575
 nfs4_alloc_client+0x8f0/0xd70 fs/nfs/nfs4client.c:233
 nfs_get_client+0x87b/0x1230 fs/nfs/client.c:468
 nfs4_set_client+0x3f6/0x640 fs/nfs/nfs4client.c:757
 nfs4_init_server.isra.0+0x5ad/0xf60 fs/nfs/nfs4client.c:1002
 nfs4_create_server+0x185/0x2b0 fs/nfs/nfs4client.c:1051
 nfs4_try_get_tree+0x93/0x140 fs/nfs/nfs4super.c:228
 nfs_get_tree+0xa61/0x1450 fs/nfs/fs_context.c:1620
 vfs_get_tree+0x92/0x320 fs/super.c:1943
 fc_mount fs/namespace.c:1282 [inline]
 do_new_mount_fc fs/namespace.c:3910 [inline]
 do_new_mount fs/namespace.c:3986 [inline]
 path_mount+0x7d0/0x2850 fs/namespace.c:4337
 do_mount fs/namespace.c:4350 [inline]
 __do_sys_mount fs/namespace.c:4565 [inline]
 __se_sys_mount fs/namespace.c:4542 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:4542
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff64609d69a
Code: 48 c7 c2 d0 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff6448640d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffc99ea1760 RCX: 00007ff64609d69a
RDX: 00007ff646109053 RSI: 00007ff6448640e0 RDI: 00007ff644864120
RBP: 00007ff644864160 R08: 00007ff644864160 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff644864120
R13: 00007ff6448640e0 R14: 0000000000000003 R15: 0000000000000004
 </TASK>


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

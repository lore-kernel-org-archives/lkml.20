Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0049923507B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856762; cv=none; b=fHXNLfiep8FG014JJgVmWTRgianNvvLVa+g25HDO1W0W6pIGeeNnBkNZuWhuycF5cchXiQ9UNA6L787jlvZoRGvqQ19WLKB28wo1cWGi5CAXEBTrgZB99r0K8NQonNd4ujy0C5d2Zujn/15N05SXpCt+f6qu14ZTMZ0gju2YT1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856762; c=relaxed/simple;
	bh=g3kge71ub03QmZxyhlnVlBiSy0PKpsl0/Y87s/OWGSk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oj3r4rwO/pwlRlVYlx5Dc5tJS6nJaWsJoou/xOqCFquKEO1oKQQ3pTHVVD1AZXoF2QCC/rxuEiTjOFL0L5ahPAYfSe6Pfm8F4kK7SYrJsRa6rmsOAcw/6Had+7GX1RFfN0DkwYnnxXCvyqyV4RYESBljb8TBW38Q64nN5Y+kykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4959c49e054so12580b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856760; x=1788461560;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gj66d4qKwHlx3vH+We3DVfK9THRY5zP8t9i/Eh5rDD0=;
        b=II/jvDJsQ85+cJlmifgrH0hVcDbEXKCRtabwF4iiKPZ1ozcPRftb0UmoRNduYhdEyf
         /jTptthlIU34A4pwfbb0oi3in1SWj0G1HRIDcNMqfx4ChBEDh8/Vh8lmGeZttH/ZB0RZ
         Nf86id8h7v4tCFL6HK//i5QvAGoBiSoYu7v5dQ5VMt6NiTBwGkMkgVZOMSlsljFTd6ex
         Y8eLP4um8cXLqCFO9NDfqs/CnPTlRe5tbDsD1z0pe927xnH+RDACDy9CgpF9R7N56nYR
         l9kTMV5TPj5Q/+DaQ469UFICfxJbaLkmIR3L9Qn2uiujlZIYX95JojkFEnD4btz5dppQ
         3fSg==
X-Gm-Message-State: AFuF++nDohEQJavzF7An076oagaDYdU4Fs9d3SuCeYm7jXVh9UcsqLPk
	c1Wxat49kpH1Wp7HFExsNSsZKsJPqELmW9UISMWH7ZG5LL6b8Qt12g4ckpsotQfidQzIldJhcwc
	Fjs8Fqg3KBH1kH/b5Gh/Ye4sHbGCzJHqaw0WCkeYX8VdNEsC3ouIRvLnr9lQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f0b:b0:4ab:318c:6b38 with SMTP id
 5614622812f47-4b397f71712mr1140437b6e.1.1787856759955; Thu, 27 Aug 2026
 11:52:39 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:52:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a908777.1d9ded08.62e62.00da.GAE@google.com>
Subject: [syzbot] general protection fault in _wait_barrier
From: syzbot <syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1255d415580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=3fe892ea5fc292e1353f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d96979580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000024: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000120-0x0000000000000127]
CPU: 1 UID: 0 PID: 6010 Comm: syz-executor394 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:_wait_barrier+0x8d/0x700 drivers/md/raid1.c:1066
Code: 08 00 00 00 f3 c7 40 0c f3 f3 f3 f3 65 48 8b 05 31 1e 0e 0c 48 89 84 24 d0 00 00 00 31 c0 e8 ea 3f 91 f9 48 89 e8 48 c1 e8 03 <42> 80 3c 20 00 0f 85 11 06 00 00 4c 8b a3 20 01 00 00 4a 8d 04 ad
RSP: 0018:ffffc90003487290 EFLAGS: 00010206
RAX: 0000000000000024 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff888031924b00 RSI: ffffffff8879c1e6 RDI: 0000000000000000
RBP: 0000000000000120 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff81d66229 R12: dffffc0000000000
R13: 0000000000000000 R14: ffff88802750c000 R15: ffffc900034879d0
FS:  00007fe51d1166c0(0000) GS:ffff8880d5ca2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005599d4a2eb80 CR3: 0000000035c6b000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 wait_barrier drivers/md/raid1.c:1154 [inline]
 raid1_write_request drivers/md/raid1.c:1506 [inline]
 raid1_make_request+0x484/0x31a0 drivers/md/raid1.c:1696
 md_handle_request+0x824/0x1230 drivers/md/md.c:417
 md_submit_bio+0x1e9/0x350 drivers/md/md.c:458
 __submit_bio block/blk-core.c:681 [inline]
 __submit_bio+0x20e/0x3d0 block/blk-core.c:670
 __submit_bio_noacct block/blk-core.c:724 [inline]
 submit_bio_noacct_nocheck+0x736/0xc00 block/blk-core.c:792
 submit_bio_noacct+0xc93/0x2130 block/blk-core.c:925
 bio_await+0x1fa/0x240 block/bio.c:1580
 submit_bio_wait+0x19/0x60 block/bio.c:1598
 __blkdev_direct_IO_simple+0x4cb/0x8c0 block/fops.c:98
 blkdev_direct_IO+0xbee/0x2030 block/fops.c:429
 blkdev_direct_write block/fops.c:699 [inline]
 blkdev_write_iter+0x703/0xd30 block/fops.c:767
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_pwrite64 fs/read_write.c:794 [inline]
 __do_sys_pwrite64 fs/read_write.c:802 [inline]
 __se_sys_pwrite64 fs/read_write.c:799 [inline]
 __x64_sys_pwrite64+0x1eb/0x250 fs/read_write.c:799
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe51d1735de
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007fe51d116128 EFLAGS: 00000246 ORIG_RAX: 0000000000000012
RAX: ffffffffffffffda RBX: 00007fe51d1166c0 RCX: 00007fe51d1735de
RDX: 0000000000001000 RSI: 0000555588ed6000 RDI: 0000000000000005
RBP: 0000000000000021 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffffd0
R13: 0000000000000002 R14: 00007ffdb60faaa0 R15: 00007ffdb60fab88
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:_wait_barrier+0x8d/0x700 drivers/md/raid1.c:1066
Code: 08 00 00 00 f3 c7 40 0c f3 f3 f3 f3 65 48 8b 05 31 1e 0e 0c 48 89 84 24 d0 00 00 00 31 c0 e8 ea 3f 91 f9 48 89 e8 48 c1 e8 03 <42> 80 3c 20 00 0f 85 11 06 00 00 4c 8b a3 20 01 00 00 4a 8d 04 ad
RSP: 0018:ffffc90003487290 EFLAGS: 00010206

RAX: 0000000000000024 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff888031924b00 RSI: ffffffff8879c1e6 RDI: 0000000000000000
RBP: 0000000000000120 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff81d66229 R12: dffffc0000000000
R13: 0000000000000000 R14: ffff88802750c000 R15: ffffc900034879d0
FS:  00007fe51d1166c0(0000) GS:ffff8880d5ca2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005599d4a2eb80 CR3: 0000000035c6b000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	08 00                	or     %al,(%rax)
   2:	00 00                	add    %al,(%rax)
   4:	f3 c7 40 0c f3 f3 f3 	xrelease movl $0xf3f3f3f3,0xc(%rax)
   b:	f3
   c:	65 48 8b 05 31 1e 0e 	mov    %gs:0xc0e1e31(%rip),%rax        # 0xc0e1e45
  13:	0c
  14:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  1b:	00
  1c:	31 c0                	xor    %eax,%eax
  1e:	e8 ea 3f 91 f9       	call   0xf991400d
  23:	48 89 e8             	mov    %rbp,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	0f 85 11 06 00 00    	jne    0x646
  35:	4c 8b a3 20 01 00 00 	mov    0x120(%rbx),%r12
  3c:	4a                   	rex.WX
  3d:	8d                   	.byte 0x8d
  3e:	04 ad                	add    $0xad,%al


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

Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB42E7391
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760107; cv=none; b=jY7RSqBG1YzpcwbneMkGI7Qngxwvs/PoPtHIb+BKAfOAsgFOD/y4dPaMPGGmIrDqZN+PTE/k8wvbjl2iHcZ13hjEovsIl+Qh1szU/JlMTOz9/zMaq4PDtelMPalE5tEJr3mmsl9atXZyqEfqjEonhVWSw1sPDxShtLRm4SdlqNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760107; c=relaxed/simple;
	bh=fRS26Ur5jWVPNQ/rcZJ1N1Pte0FcrE5lSwCspQP3sW0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SFtJ/zJXDQ4Sb6Fc9Ysa8W5KJQ5dkyNSeqiQBcci+OiGvxeYZJkSO0Qtp6pHTPhvCANlgGdI1cmY/PrPqYq1irLKU5mFX6aGwgng0dzX1oMQGOgCzRQ46AUZ4DNoqSWbsMGXbkbDsRLqjnH5MgBYeX8IwqFoE9fu9Nmut8ULXS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4961058e787so184273b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760104; x=1788364904;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znwQLx4ttLCAahi4lYkTwRyA0+r8xuDmAlKgFKQsAFo=;
        b=e790kTHphvEgAzVasQQ+N3X1npPz618Ck0yJEGi7xepM5dAaDoMhNkXOzc+TEgChvr
         2xl02r0P9JFxkZTQD8pG7qUEtxPbO3iUs3C7OO3tfzE9VxPfDvfBIMgkyqmVcVzljGy0
         iI7zodPgiN3NoRfBJvHcLlXg7x2zR1HMC9FLeinsyeF/p6XHnKP3g6WinUO3z+6valvo
         efo9hjZy6uwihzkWDFxZi1qaw77Di/rZ+cdJ62VXeUS2LUvF1jspH+KV5umqHO5f6Sel
         5nQipZS+VYkf0CstT17dHEGFnGU9T1pf0Z54tTCN1EhYdRgAer9nFwjf0ws2fqJTDY4v
         //Lg==
X-Gm-Message-State: AFuF++l33jQFr5yLXkQZ5ZhCQkBjdmSAkR9lSMMcrynm2kmu0z1fo+md
	Ct3EGTe1U3Tj7X/Laqjq6x4DyhKTnrUkhnceJ83mjxQy/As++B+o5Vzcc3NePVUuLOF4aaokDea
	ZqDmwzkxfl7gN+4AhfW9Yib6jVHDIN/4pX5rdQy/wuVGiDS9MdDGjOQNuO1JLoQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3505:b0:493:a860:5809 with SMTP id
 5614622812f47-4b3668b1451mr8453659b6e.4.1787760104366; Wed, 26 Aug 2026
 09:01:44 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:01:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f0de8.1d9ded08.62e62.00b5.GAE@google.com>
Subject: [syzbot] [sound?] WARNING: ODEBUG bug in dummy_pcm_close
From: syzbot <syzbot+225231fce6755d40d078@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    66498c75b4f8 Merge tag 'dmaengine-7.3-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=123b9979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e9ce1d694820ba2b
dashboard link: https://syzkaller.appspot.com/bug?extid=225231fce6755d40d078
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b29415580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d0a47f9dd2f2/disk-66498c75.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9d5e64d02b84/vmlinux-66498c75.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f14557ff09c4/bzImage-66498c75.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+225231fce6755d40d078@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff8880213f7f20 object type: hrtimer hint: dummy_hrtimer_callback+0x0/0x150 sound/drivers/dummy.c:-1
WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230 lib/debugobjects.c:629, CPU#1: syz.0.66/5973
Modules linked in:
CPU: 1 UID: 0 PID: 5973 Comm: syz.0.66 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:debug_print_object+0x18a/0x230 lib/debugobjects.c:629
Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff e8 3d 70 4f fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 73 77 92 0b 48 83 c4 10 5b 41 5c
RSP: 0018:ffffc90003a37b70 EFLAGS: 00010246
RAX: 1ffffffff181f12c RBX: dffffc0000000000 RCX: 0000000000000000
RDX: ffffffff8c6d6340 RSI: ffffffff8c6d5dc0 RDI: ffffffff9084dfc0
RBP: ffffffff8c6d6340 R08: ffff8880213f7f20 R09: ffffffff8c0f8ba0
R10: dffffc0000000000 R11: ffffffff81b3d530 R12: 0000000000000000
R13: ffffffff9084dfc0 R14: ffff8880213f7f20 R15: ffffffff8c0f8960
FS:  000055557a276500(0000) GS:ffff888124df1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc4e5ef7d58 CR3: 000000007ed3e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1171 [inline]
 debug_check_no_obj_freed+0x2e3/0x450 lib/debugobjects.c:1201
 slab_free_hook mm/slub.c:2679 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x13e/0x650 mm/slub.c:6792
 dummy_pcm_close+0x9b/0xb0 sound/drivers/dummy.c:609
 snd_pcm_release_substream+0x313/0x490 sound/core/pcm_native.c:2793
 snd_pcm_release+0xb6/0x160 sound/core/pcm_native.c:2983
 __fput+0x418/0xa50 fs/file_table.c:512
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc4e4f9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc47a4ba18 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007fc4e5227da0 RCX: 00007fc4e4f9e0d9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007fc4e5227da0 R08: 00007fc4e5226038 R09: 0000000000000000
R10: 000000000003fdc0 R11: 0000000000000246 R12: 00000000000175a9
R13: 00007fc4e522609c R14: 000000000001729d R15: 00007fc4e5226090
 </TASK>
----------------
Code disassembly (best guess):
   0:	f8                   	clc
   1:	48 c1 e8 03          	shr    $0x3,%rax
   5:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
   9:	74 08                	je     0x13
   b:	4c 89 ff             	mov    %r15,%rdi
   e:	e8 3d 70 4f fd       	call   0xfd4f7050
  13:	4d 8b 0f             	mov    (%r15),%r9
  16:	4c 89 ef             	mov    %r13,%rdi
  19:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1e:	48 89 ea             	mov    %rbp,%rdx
  21:	44 89 e1             	mov    %r12d,%ecx
  24:	4d 89 f0             	mov    %r14,%r8
  27:	ff 34 24             	push   (%rsp)
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 83 c4 08          	add    $0x8,%rsp
  33:	ff 05 73 77 92 0b    	incl   0xb927773(%rip)        # 0xb9277ac
  39:	48 83 c4 10          	add    $0x10,%rsp
  3d:	5b                   	pop    %rbx
  3e:	41 5c                	pop    %r12


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

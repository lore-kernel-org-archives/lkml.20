Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049834A92CF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443133; cv=none; b=Q6KdEHBoUVcW9kQAITd2tTscF0dfuOJlGtEg05UwKLags/31W6P50n5H8UiZC0oXV+RNfVJ1MgOWCoKzUmPHRl/CWz0QhChV66DyIEOi96UcO+tLi0OjrY9WeNngmIbKEjf2wnxEUufiywuh8wgmYTzMlyosCAE6iEt8OR69uxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443133; c=relaxed/simple;
	bh=U1qUD1JlspM+/0VScVyrnqy6J6VGWp5drGgrhYzahwU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=o+sKiMa91EHzjfcdkShqLFnk+hEvYsAigVx6KuATsC6TPfyD5UMn85GiEJet1p5ocFUl3BmHnKnMuDHeiN6AeR/so5Yu+EiFNwOiyvjuEnzPb/MPMq4vAcZwbFnT7q/dGweg4duzfBAHsTcL0vYJBSRrsKQsCov3f/ZMovF9bfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f3.google.com with SMTP id 006d021491bc7-6b35c65f4cdso616776eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443122; x=1789047922;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ux0h7O80c2MsguYomaJsqTO7Vmta2Cp7foW2F/hmcg=;
        b=mQJY0Z4JpueHq3oTusVbJ3l4wNvYC9riglFqvm+FTd/koPvHnLgiaGSFs6CylpZVRt
         OVLY4AhOVAaye0JtfT92ufqn0xAc3vbQkRTK1zLoorV8StmUa1iev5wX6kBGsJpbPOYj
         iMPp8J1oPiBytTXc+2Kg2Wq1ZHd9ygKMF/+grzKhkxK36bnlMa1DypuRee4or7tkFfCG
         vQpe+autm60oJmKVGtcGMyQ9bsxl9xqgz3VdrJvTySBsdfU8+3tl7fXMk6FialMBJKI/
         P/0bt5UCuSglDpnzBmG0qqo3ANMUwBoN1LqC1Ir2dtCB7+bh4agbOfSswnb2U5PEuY8s
         /hqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtc6wzspGylg0uhye8iN4dQuFhk4Qi8m12OlhXwRRmBoYgzR8a/9KMFCihyxMG2tHw9VM+VWljDUIHOFI=@vger.kernel.org
X-Gm-Message-State: AFuF++kxI45rBh998inxGnBMoNR6H4PH8KaEMAYDbqKA5bYvLNHBDJ3R
	3OiX/J1TVH10ewtzte2O1uWbYqrWnTofazgNABV6FsQl3t5PFoV/iywP9dsgywDO5x1FCeAJIgS
	pfaheDq9/L7AXATMkSgMD0n+Bz4acmcuVG0PZQLBfO8GLIjFzvEASLhfrscg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f036:b0:6b3:61f7:b8bd with SMTP id
 006d021491bc7-6b47bcc23d5mr9085705eaf.1.1788443122659; Thu, 03 Sep 2026
 06:45:22 -0700 (PDT)
Date: Thu, 03 Sep 2026 06:45:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9979f2.0b659fcc.16ebfd.0004.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in native_smp_send_reschedule
From: syzbot <syzbot+8ce83fdb28edc2204e0d@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    08dbfad3f504 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13fa9379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=8ce83fdb28edc2204e0d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-08dbfad3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8c91bd969338/vmlinux-08dbfad3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c17b532c72dd/bzImage-08dbfad3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8ce83fdb28edc2204e0d@syzkaller.appspotmail.com

------------[ cut here ]------------
sched: Unexpected reschedule of offline CPU#3!
WARNING: arch/x86/kernel/apic/ipi.c:71 at native_smp_send_reschedule+0x4d/0x60 arch/x86/kernel/apic/ipi.c:71, CPU#2: kworker/u32:4/5842
Modules linked in:
CPU: 2 UID: 0 PID: 5842 Comm: kworker/u32:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: netns cleanup_net
RIP: 0010:native_smp_send_reschedule+0x4f/0x60 arch/x86/kernel/apic/ipi.c:71
Code: b0 c6 00 48 0f a3 2d a8 86 8e 0f 73 14 89 df be fd 00 00 00 5b 5d e9 a0 2a 01 00 90 0f 0b 90 eb c7 48 8d 3d 63 3f 91 0f 89 de <67> 48 0f b9 3a 5b 5d e9 05 b6 19 0a 0f 1f 44 00 00 90 90 90 90 90
RSP: 0018:ffffc9000617ee40 EFLAGS: 00010046
RAX: 0000000000000001 RBX: 0000000000000003 RCX: ffffffff81b69fa8
RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffffffff9147df30
RBP: 0000000000000003 R08: 0000000000000000 R09: fffffbfff228a4cb
R10: ffffffff9145265f R11: 0000000000000003 R12: 0000000000000004
R13: 1ffff92000c2fdcc R14: ffffc9000617ee80 R15: 0000000000000010
FS:  0000000000000000(0000) GS:ffff888096b67000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055a33142b090 CR3: 000000000eb96000 CR4: 0000000000350ef0
DR0: ffffffffffffffff DR1: 00000000000001f8 DR2: 0000000000000083
DR3: ffffffffefffff15 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 arch_smp_send_reschedule arch/x86/include/asm/smp.h:90 [inline]
 __resched_curr+0x2db/0x500 kernel/sched/core.c:1225
 wakeup_preempt+0xd0/0x400 kernel/sched/core.c:2301
 ttwu_do_activate+0x1ad/0x800 kernel/sched/core.c:3835
 ttwu_queue kernel/sched/core.c:4087 [inline]
 try_to_wake_up+0xcf0/0x1c90 kernel/sched/core.c:4425
 cpu_stop_queue_work+0x271/0x340 kernel/stop_machine.c:108
 stop_one_cpu_nowait+0xe8/0x160 kernel/stop_machine.c:387
 sched_balance_rq+0x317c/0x48b0 kernel/sched/fair.c:13661
 sched_balance_newidle kernel/sched/fair.c:14627 [inline]
 pick_task_fair+0xb6b/0x1e00 kernel/sched/fair.c:10073
 __pick_next_task+0x105/0x710 kernel/sched/core.c:6159
 pick_next_task kernel/sched/core.c:6257 [inline]
 __schedule+0x57f/0x6920 kernel/sched/core.c:7185
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7362
 schedule_timeout+0x1b2/0x280 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
 kthread_stop+0x18e/0x630 kernel/kthread.c:760
 rxrpc_unuse_local+0x107/0x140 net/rxrpc/local_object.c:409
 rxrpc_release_sock net/rxrpc/af_rxrpc.c:967 [inline]
 rxrpc_release+0x384/0x6a0 net/rxrpc/af_rxrpc.c:994
 __sock_release net/socket.c:735 [inline]
 sock_release+0x91/0x1c0 net/socket.c:763
 afs_close_socket+0x24b/0x410 fs/afs/rxrpc.c:154
 afs_net_exit+0x93/0x150 fs/afs/main.c:149
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x2ee/0xab0 net/core/net_namespace.c:253
 cleanup_net+0x499/0x920 net/core/net_namespace.c:706
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	b0 c6                	mov    $0xc6,%al
   2:	00 48 0f             	add    %cl,0xf(%rax)
   5:	a3 2d a8 86 8e 0f 73 	movabs %eax,0x8914730f8e86a82d
   c:	14 89
   e:	df be fd 00 00 00    	fistpll 0xfd(%rsi)
  14:	5b                   	pop    %rbx
  15:	5d                   	pop    %rbp
  16:	e9 a0 2a 01 00       	jmp    0x12abb
  1b:	90                   	nop
  1c:	0f 0b                	ud2
  1e:	90                   	nop
  1f:	eb c7                	jmp    0xffffffe8
  21:	48 8d 3d 63 3f 91 0f 	lea    0xf913f63(%rip),%rdi        # 0xf913f8b
  28:	89 de                	mov    %ebx,%esi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	5b                   	pop    %rbx
  30:	5d                   	pop    %rbp
  31:	e9 05 b6 19 0a       	jmp    0xa19b63b
  36:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop


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

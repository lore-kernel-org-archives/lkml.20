Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6837DAAE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792239825; cv=none; b=C5A8IeT0wJI2TabzTa7oFFoWAXXPNUukXcNQbG18zNs/fM+tJCSfE3xxb2qW+hUmVDA6eiBSB6I2yblmZA49EeJ7pi7QpiDmSKS3R+/GsdWMGJSEPvMYuMU9ZW1wtgcFJHBmAryl3CGXklhK+RRmP0HwAcVpaJGxtKNUcRYZE9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792239825; c=relaxed/simple;
	bh=VQoiidGEkSeLoAedeAV3+JNqkKjiV3m6K1l9jefAsys=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qfolEYe7NHA4oIcsIg2OVAHj2H26uS4UelGNOntL8h6M0LjuJD8IRZ0z/OcTtuo8zlZ5hNSCCVoMcQfSxRxj2z/qE0cM9QD4nm2aBzoQWZV/qjOWh2O5aVbu34e31dxVO55dyKnuyH9s72rm18MxKzUe/MtR291PG0C5r7EFKeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso792787b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792239822; x=1792844622;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oeMRQ2p+WY2dDeDgw5uB6oiXqGGUI3iVz3MemCeKcFg=;
        b=1NMoSGQ1/sPQWn9IdX9bDeLsl8bEuRZ3gw8snb/DgyCTNxg7+tnrNqe5bE32r+pztv
         vrUt63RaFz8Hjtyet6NWUDiKuX4kk0Ak9DbBwH9CQTDjFagIMtJwyepsV1dGmAr1fiUn
         YuZw5hScH13xNT4frHOZhzqEAQcqEYCV8SyHNtff+NNT8WMJvVJcGgsGB6xZ1SABuK8X
         e5jHW6kM/6ee5Y2om0lmG5tsiujtlVdmz6ppq6/p6BNMze1lrv4mVoZMXZ/+mPYiiwKb
         ENjoryXXin3+5Exp3tatzEvfViH5F4+yEws7MqPWzqrTsStju0vnv3L+vT1/LDMphQaw
         prHA==
X-Forwarded-Encrypted: i=1; AKwUvBxUZHGNujUHlBsQK5qaGiJFyodZlgoiAXS0LPv1UAp4Kjy6dQ/9hzrisoGg9bEysSxD+gNPbXZPThYJnkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtMf6Hg3sNjql7ynX2SmRNcoqEU2s8JanqSF0JFWg8y6cVlk0x
	InFvV68i4LsL6ONwOMT2e3KtEHchwHLQVx7BOr8AdDnBrGDl/Ixj69s9KXpnVflj4ncWxSmRmvl
	JVfH3fFn61nUlWzWwfobPnyDWWGvYzMHuFZlUhTAaY+2R6cw1dj8dOOuVjw4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6716:b0:4f9:6348:cd3b with SMTP id
 5614622812f47-53ccf4ee273mr2059000b6e.41.1792239822636; Sat, 17 Oct 2026
 05:23:42 -0700 (PDT)
Date: Sat, 17 Oct 2026 05:23:42 -0700
In-Reply-To: <6a6cd87b.2d659fcc.1d46f5.019c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad368ce.a6d1a155.34a93f.0014.GAE@google.com>
Subject: Re: [syzbot] [edac?] WARNING in mce_timer_fn
From: syzbot <syzbot+9d17de59c48d71bd6824@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, tony.luck@intel.com, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    70dd4ee72eb2 Merge tag 'pinctrl-v7.3-3' of git://git.kerne..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=114c8031580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=129d675874dbf896
dashboard link: https://syzkaller.appspot.com/bug?extid=9d17de59c48d71bd6824
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1391efd1580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9d17de59c48d71bd6824@syzkaller.appspotmail.com

------------[ cut here ]------------
cpu_t != t
WARNING: arch/x86/kernel/cpu/mce/core.c:1770 at mce_timer_fn+0x289/0x2e0 arch/x86/kernel/cpu/mce/core.c:1770, CPU#0: udevd/4970
Modules linked in:
CPU: 0 UID: 0 PID: 4970 Comm: udevd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:mce_timer_fn+0x289/0x2e0 arch/x86/kernel/cpu/mce/core.c:1770
Code: 59 00 4d 01 e4 4d 39 ec 4d 0f 47 e5 31 ff 4c 89 e6 e8 6b 40 59 00 4d 85 e4 0f 84 20 ff ff ff e9 f7 fe ff ff e8 b8 45 59 00 90 <0f> 0b 90 e9 cf fd ff ff 4c 89 f6 48 c7 c7 a0 ef bf 8f e8 60 dc 84
RSP: 0018:ffffc90000007c20 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8880b8223440 RCX: 0000000000000100
RDX: ffff88807cbccb00 RSI: ffffffff81b311b8 RDI: ffffffff8e6af920
RBP: ffff8880b8323440 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000100 R14: 1ffff92000000f8d R15: ffffffff81b30f30
FS:  00007fa1f48b4880(0000) GS:ffff888122946000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563a7ab14be0 CR3: 000000007be29000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 call_timer_fn+0x198/0x5f0 kernel/time/timer.c:1748
 expire_timers kernel/time/timer.c:1799 [inline]
 __run_timers+0x757/0xb00 kernel/time/timer.c:2374
 __run_timer_base kernel/time/timer.c:2386 [inline]
 __run_timer_base kernel/time/timer.c:2378 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2395
 run_timer_softirq+0x10/0x50 kernel/time/timer.c:2403
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0x16a/0x210 kernel/softirq.c:758
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:775
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:native_save_fl arch/x86/include/asm/irqflags.h:26 [inline]
RIP: 0010:arch_local_save_flags arch/x86/include/asm/irqflags.h:109 [inline]
RIP: 0010:arch_local_irq_save arch/x86/include/asm/irqflags.h:127 [inline]
RIP: 0010:lock_acquire kernel/locking/lockdep.c:5938 [inline]
RIP: 0010:lock_acquire+0x166/0x380 kernel/locking/lockdep.c:5899
Code: d5 00 00 00 65 8b 05 61 63 a6 13 85 c0 0f 85 c6 00 00 00 65 48 8b 05 91 1c a6 13 8b 90 a4 0b 00 00 85 d2 0f 85 b0 00 00 00 9c <8f> 04 24 fa 48 c7 c7 49 a7 4d 8e e8 6a 07 ed 09 45 89 e8 44 89 f6
RSP: 0018:ffffc90004e9f578 EFLAGS: 00000246
RAX: ffff88807cbccb00 RBX: 0000000000000000 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff81b9c261 RDI: fffffbfff1fbd8bc
RBP: ffffffff8fdec5e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000200 R11: 000000000000b9e5 R12: 0000000000000002
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 unwind_next_frame+0xd1/0x2090 arch/x86/kernel/unwind_orc.c:495
 __unwind_start+0x3cd/0x7e0 arch/x86/kernel/unwind_orc.c:787
 unwind_start arch/x86/include/asm/unwind.h:64 [inline]
 arch_stack_walk+0x73/0xf0 arch/x86/kernel/stacktrace.c:24
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x32f/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xb6/0x690 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x276/0x460 security/tomoyo/file.c:827
 security_inode_getattr+0x116/0x280 security/security.c:1895
 vfs_getattr fs/stat.c:259 [inline]
 vfs_fstat+0x4b/0xe0 fs/stat.c:281
 __do_sys_newfstat+0x8b/0x110 fs/stat.c:551
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa1f4111ad7
Code: 73 01 c3 48 8b 0d 21 f3 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 05 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 f1 f2 0d 00 f7 d8 64 89 02 b8
RSP: 002b:00007ffe5cd40ab8 EFLAGS: 00000206 ORIG_RAX: 0000000000000005
RAX: ffffffffffffffda RBX: 000000000000000d RCX: 00007fa1f4111ad7
RDX: 0000000000090800 RSI: 00007ffe5cd40ac0 RDI: 000000000000000d
RBP: 00007ffe5cd40ac0 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000206 R12: 00005592845d9170
R13: 00000000000000ff R14: 000055926871bbe0 R15: 00007ffe5cd40e10
 </TASK>
----------------
Code disassembly (best guess):
   0:	d5 00 00 00          	{rex2 0x0} add %al,(%rax)
   4:	65 8b 05 61 63 a6 13 	mov    %gs:0x13a66361(%rip),%eax        # 0x13a6636c
   b:	85 c0                	test   %eax,%eax
   d:	0f 85 c6 00 00 00    	jne    0xd9
  13:	65 48 8b 05 91 1c a6 	mov    %gs:0x13a61c91(%rip),%rax        # 0x13a61cac
  1a:	13
  1b:	8b 90 a4 0b 00 00    	mov    0xba4(%rax),%edx
  21:	85 d2                	test   %edx,%edx
  23:	0f 85 b0 00 00 00    	jne    0xd9
  29:	9c                   	pushf
* 2a:	8f 04 24             	pop    (%rsp) <-- trapping instruction
  2d:	fa                   	cli
  2e:	48 c7 c7 49 a7 4d 8e 	mov    $0xffffffff8e4da749,%rdi
  35:	e8 6a 07 ed 09       	call   0x9ed07a4
  3a:	45 89 e8             	mov    %r13d,%r8d
  3d:	44 89 f6             	mov    %r14d,%esi


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

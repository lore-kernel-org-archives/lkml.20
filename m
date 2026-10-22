Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691663;
	b=Q36tRKrs+J08jQb2g4hiHBlTu67IJNxGBWcCs58aLqtPO0nnmK0bYSeaJCcUS/AoPpDs
	 QfsSA1TJqhfoxMrwzDZZmk+VeoissieTvZuL/9TL6DPsyyLXWYZf1G438zcjNLReIisDu
	 i1F+qgi7dZUyrjf8SIXzbx9qgnjkawBSiNUkH4SrhHXkkd0X35U3k7LXk3fTyFsQfzn53
	 4XM9gNwkWzE1NzBL/ag1RqXZa9RTuAYYtPkBMKBFVsTmsFZjkvX9jB0AQeQwbuIP/4Vkd
	 FmkNG2flrXP/btM2nP5/82/kaZ+WDgJn5LtMlZCM+jIw4phkXmDt0W3KlgQcvzVRE+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691663;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Oi7XNv5mS/eWn1AgXBY0jczs/XkSA3CUHI3YcqfAaos=;
	b=OvMTIH5qFiU9NlBRAEzvK60HAt6BxI4T6RtStfX+VJ3qu6zoUeJ2r0PheCSyPCh40ApK
	 F192DoCrYsyj+auI0O0vj1LopPLNv0X9qYGDSCWtbngjvlSPmVWdxnDnaIjNsRdmJp5cb
	 YWyPrERq7IVCG/c0q7j/b2duqJPz4vJUt1ts/3I5CeOZfBhmVOGWR0m9bM6/6S0I3kvtN
	 k7g7Xu0Yo8ZWk7QShGj6+wf1giZ8Jktzgy27Gvb4iQG9aakoXGb149jwom28Xd7pnth0D
	 V6EXl8IXwVqPHL1rtGyGJBDuIaj+N+7KHNLoxExKBq6Ua6GeK9UbZtXXYeqCk7u8gzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F48606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71F48606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso148268b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691662; x=1793296462;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oi7XNv5mS/eWn1AgXBY0jczs/XkSA3CUHI3YcqfAaos=;
        b=eoAZ+kj0AjN5ldxd6HoTwXoPQA5iz1Wx1k8oeValvQheO2xma3mJvS5+Xe8J2k0PZc
         02uv8RUfglsedb+S4mWzhbh/BV3C9HzDFD/vdcU8mrQsLgcMJeciHFU9Hic79+2STKnT
         6HH5Oh2lGz56vsx1TqnaE7Jmtjhop1YP1Z33+FxEPa+VQL65B+srEYdWgjaEYyjeiJ1m
         e/UzUVF0skEEnQoFaD7ovAYdZzbI17kLu8WsOoVzCpxe5Rs1jSJC+He/9D2tjnc5xS29
         6UvKwOYpVaxFI6pyUkqlLmlxc1BSwfGQsDj8Qqj5KczNjiV7Jqf9DEkZimb/tQtHRgMa
         zvbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv4qgszwRmn9cbr/lCZtURKE6oO/SOS+3yxvYiP3zFviwjJqJfvi1kpZwl2Ogl2l81UZPbs7isZ8DnBrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpqMNf2yq86TvTF0PKEXelCkRyUM+wAjSbgGKKBJ6ef3yLulxm
	pYDX9Wdj61SMxuUUQW9k2w4yi2eYLIhPrsv+Nn27jEVQV42DYPRz4IC7RbVzWedZ82w6IAhpp47
	2/urozIVLobSN8MdGc0lluLwZAMBz/UUMCYmNkkuuACQg5D6+Ls6ee2OWTLA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2e43:b0:4fb:8469:fc4f with SMTP id
 5614622812f47-5535a770280mr4159625b6e.29.1792691662505; Thu, 22 Oct 2026
 10:54:22 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:54:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada4dce.3ebfcf67.79b0c.00a0.GAE@google.com>
Subject: [syzbot] [mm?] INFO: rcu detected stall in newfstat (4)
From: syzbot <syzbot+04923483cd73f0f718e7@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, brendan.jackman@linux.dev, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@kernel.org, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b88c841d1164 Merge tag 'input-for-v7.3-rc6' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=146d540d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=129d675874dbf896
dashboard link: https://syzkaller.appspot.com/bug?extid=04923483cd73f0f718e7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/79043a1c3fab/disk-b88c841d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ce311933da44/vmlinux-b88c841d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ac3d65b82833/bzImage-b88c841d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+04923483cd73f0f718e7@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P5590/3:b..l P4962/1:b..l P5806/1:b..l P5600/1:b..l P5601/1:b..l
rcu: 	(detected by 1, t=10852 jiffies, g=12029, q=787 ncpus=2)
task:syz-executor    state:R  running task     stack:21760 pid:5601  tgid:5601  ppid:5599   task_flags:0x400140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1259/0x6920 kernel/sched/core.c:7284
 preempt_schedule_irq+0x4e/0x90 kernel/sched/core.c:7606
 irqentry_exit_to_kernel_mode_preempt include/linux/irq-entry-common.h:468 [inline]
 irqentry_exit_to_kernel_mode include/linux/irq-entry-common.h:539 [inline]
 irqentry_exit+0x205/0xa10 kernel/entry/common.c:167
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:kasan_byte_accessible+0x18/0x30 mm/kasan/generic.c:212
Code: 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 48 b8 00 00 00 00 00 fc ff df 48 c1 ef 03 48 01 c7 0f b6 07 <3c> 07 0f 96 c0 e9 8e 24 57 09 66 66 2e 0f 1f 84 00 00 00 00 00 0f
RSP: 0018:ffffc900031e75a0 EFLAGS: 00000286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
RDX: 0000000000000000 RSI: ffffffff81b9b261 RDI: fffffbfff1fbd8b4
RBP: ffffffff8fdec5a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000200 R11: 0000000000018b70 R12: ffffffff81b9b261
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 __kasan_check_byte+0x13/0x50 mm/kasan/common.c:584
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire kernel/locking/lockdep.c:5916 [inline]
 lock_acquire+0x132/0x380 kernel/locking/lockdep.c:5899
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 unwind_next_frame+0xd1/0x2090 arch/x86/kernel/unwind_orc.c:495
 arch_stack_walk+0x94/0xf0 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 save_stack+0x162/0x1e0 mm/page_owner.c:183
 __reset_page_owner+0x84/0x190 mm/page_owner.c:338
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_noprof+0x2cc/0x840 mm/slub.c:5439
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
RIP: 0033:0x7f5c9b79c7e7
RSP: 002b:00007ffe84674818 EFLAGS: 00000206 ORIG_RAX: 0000000000000005
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f5c9b79c7e7
RDX: 0000000000000000 RSI: 00007ffe84674820 RDI: 0000000000000003
RBP: 00007ffe8467491c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000012253 R15: 00007ffe84674970
 </TASK>
task:syz-executor    state:R  running task     stack:23240 pid:5600  tgid:5600  ppid:5596   task_flags:0x400140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1259/0x6920 kernel/sched/core.c:7284
 preempt_schedule_irq+0x4e/0x90 kernel/sched/core.c:7606
 irqentry_exit_to_kernel_mode_preempt include/linux/irq-entry-common.h:468 [inline]
 irqentry_exit_to_kernel_mode include/linux/irq-entry-common.h:539 [inline]
 irqentry_exit+0x205/0xa10 kernel/entry/common.c:167
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:lock_acquire+0x5e/0x380 kernel/locking/lockdep.c:5947
Code: 05 cf 2e a6 13 83 f8 07 0f 87 da 00 00 00 48 0f a3 05 de f7 5d 10 0f 82 c9 02 00 00 8b 35 7e 29 5e 10 85 f6 0f 85 c7 00 00 00 <48> 8b 44 24 30 65 48 2b 05 6d 2e a6 13 0f 85 09 03 00 00 48 83 c4
RSP: 0018:ffffc90003baf918 EFLAGS: 00000206
RAX: 0000000000000046 RBX: 0000000000000000 RCX: 0000000000000200
RDX: 0000000000000000 RSI: ffffffff8e3bd310 RDI: ffffffff8c625580
RBP: ffffffff8fdec5a0 R08: 000000004fbfa448 R09: 0000000000000007
R10: 0000000000000200 R11: 0000000000000001 R12: 0000000000000002
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 unwind_next_frame+0xd1/0x2090 arch/x86/kernel/unwind_orc.c:495
 arch_stack_walk+0x94/0xf0 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 save_stack+0x162/0x1e0 mm/page_owner.c:183
 __reset_page_owner+0x84/0x190 mm/page_owner.c:338
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 kmem_cache_alloc_noprof+0x269/0x6a0 mm/slub.c:5010
 alloc_filename fs/namei.c:147 [inline]
 do_getname+0x35/0x390 fs/namei.c:187
 getname_flags fs/namei.c:230 [inline]
 class_filename_flags_constructor include/linux/fs.h:2589 [inline]
 user_path_at+0x26/0x60 fs/namei.c:3669
 do_mount fs/namespace.c:4322 [inline]
 __do_sys_mount fs/namespace.c:4543 [inline]
 __se_sys_mount fs/namespace.c:4520 [inline]
 __x64_sys_mount+0x1fb/0x310 fs/namespace.c:4520
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe36f99f44a
RSP: 002b:00007ffdfc81cdd8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fe36fa35586 RCX: 00007fe36f99f44a
RDX: 00007fe36fa3558b RSI: 00007fe36fa35586 RDI: 00007fe36fa3558b
RBP: 00007fe36fa35500 R08: 0000000000000000 R09: 00007fe36fc267b8
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fe36fa09668
R13: 00007fe36fa09640 R14: 00007ffdfc81d048 R15: 0000000000000000
 </TASK>
task:dhcpcd          state:R  running task     stack:27064 pid:5806  tgid:5806  ppid:5268   task_flags:0x400140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1259/0x6920 kernel/sched/core.c:7284
 preempt_schedule_notrace+0x57/0xd0 kernel/sched/core.c:7556
 preempt_schedule_notrace_thunk+0x16/0x30 arch/x86/entry/thunk.S:13
 rcu_is_watching+0x90/0xc0 kernel/rcu/tree.c:754
 trace_lock_release include/trace/events/lock.h:68 [inline]
 lock_release+0x24d/0x310 kernel/locking/lockdep.c:5954
 rcu_lock_release include/linux/rcupdate.h:319 [inline]
 rcu_read_unlock include/linux/rcupdate.h:880 [inline]
 class_rcu_destructor include/linux/rcupdate.h:1216 [inline]
 unwind_next_frame+0x3c3/0x2090 arch/x86/kernel/unwind_orc.c:495
 arch_stack_walk+0x94/0xf0 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 save_stack+0x162/0x1e0 mm/page_owner.c:183
 __reset_page_owner+0x84/0x190 mm/page_owner.c:338
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4683 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_node_track_caller_noprof+0x2da/0x870 mm/slub.c:5545
 kmalloc_reserve+0xe8/0x350 net/core/skbuff.c:637
 __alloc_skb+0x185/0x710 net/core/skbuff.c:715
 alloc_skb include/linux/skbuff.h:1384 [inline]
 alloc_skb_with_frags+0xdd/0x760 net/core/skbuff.c:6803
 sock_alloc_send_pskb+0x801/0x980 net/core/sock.c:3022
 unix_dgram_sendmsg+0x3c7/0x1810 net/unix/af_unix.c:2144
 unix_seqpacket_sendmsg+0x12a/0x1d0 net/unix/af_unix.c:2545
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:815 [inline]
 sock_write_iter+0x53a/0x5b0 net/socket.c:1266
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x1f8/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4487f58407
RSP: 002b:00007ffdf70f6870 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f4487ece780 RCX: 00007f4487f58407
RDX: 000000000000002a RSI: 00007ffdf70f68d0 RDI: 0000000000000005
RBP: 0000561ab88aa301 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffdf70f6d00
R13: 0000000000000016 R14: 00007ffdf70f7230 R15: 00007ffdf70f6de0
 </TASK>
task:klogd           state:R  running task     stack:25960 pid:4962  tgid:4962  ppid:1      task_flags:0x400100 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1259/0x6920 kernel/sched/core.c:7284
 preempt_schedule_irq+0x4e/0x90 kernel/sched/core.c:7606
 irqentry_exit_to_kernel_mode_preempt include/linux/irq-entry-common.h:468 [inline]
 irqentry_exit_to_kernel_mode include/linux/irq-entry-common.h:539 [inline]
 irqentry_exit+0x205/0xa10 kernel/entry/common.c:167
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:lock_acquire+0x5e/0x380 kernel/locking/lockdep.c:5947
Code: 05 cf 2e a6 13 83 f8 07 0f 87 da 00 00 00 48 0f a3 05 de f7 5d 10 0f 82 c9 02 00 00 8b 35 7e 29 5e 10 85 f6 0f 85 c7 00 00 00 <48> 8b 44 24 30 65 48 2b 05 6d 2e a6 13 0f 85 09 03 00 00 48 83 c4
RSP: 0018:ffffc9000385f440 EFLAGS: 00000206
RAX: 0000000000000046 RBX: 0000000000000000 RCX: 0000000000000200
RDX: 0000000000000000 RSI: ffffffff8e3bd310 RDI: ffffffff8c625580
RBP: ffffffff8fdec5a0 R08: 000000004fbfa448 R09: 0000000000000007
R10: 0000000000000200 R11: 0000000000000001 R12: 0000000000000002
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 unwind_next_frame+0xd1/0x2090 arch/x86/kernel/unwind_orc.c:495
 arch_stack_walk+0x94/0xf0 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 save_stack+0x162/0x1e0 mm/page_owner.c:183
 __reset_page_owner+0x84/0x190 mm/page_owner.c:338
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0x79f/0x10f0 mm/page_alloc.c:2962
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_kmalloc+0x8a/0xb0 mm/kasan/common.c:417
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_node_track_caller_noprof+0x33d/0x870 mm/slub.c:5545
 kmalloc_reserve+0xe8/0x350 net/core/skbuff.c:637
 __alloc_skb+0x185/0x710 net/core/skbuff.c:715
 alloc_skb include/linux/skbuff.h:1384 [inline]
 alloc_skb_with_frags+0xdd/0x760 net/core/skbuff.c:6803
 sock_alloc_send_pskb+0x801/0x980 net/core/sock.c:3022
 unix_dgram_sendmsg+0x3c7/0x1810 net/unix/af_unix.c:2144
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x48b/0x4e0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcefc3ab407
RSP: 002b:00007ffe305ea720 EFLAGS: 00000202 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 00007fcefc25bc80 RCX: 00007fcefc3ab407
RDX: 00000000000000a1 RSI: 00007ffe305ea860 RDI: 0000000000000003
RBP: 00007ffe305eac90 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000004000 R11: 0000000000000202 R12: 00007ffe305eaca8
R13: 00007ffe305ea860 R14: 0000000000000086 R15: 00007ffe305ea860
 </TASK>
task:syz-executor    state:R  running task     stack:22616 pid:5590  tgid:5590  ppid:5589   task_flags:0x400100 flags:0x00080800
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1259/0x6920 kernel/sched/core.c:7284
 preempt_schedule_common+0x3c/0xb0 kernel/sched/core.c:7463
 preempt_schedule_thunk+0x16/0x40 arch/x86/entry/thunk.S:12
 __local_bh_enable_ip+0x106/0x120 kernel/softirq.c:480
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:923 [inline]
 __dev_queue_xmit+0xa75/0x4a40 net/core/dev.c:4993
 dev_queue_xmit include/linux/netdevice.h:3464 [inline]
 neigh_resolve_output net/core/neighbour.c:1616 [inline]
 neigh_resolve_output+0x51f/0x8f0 net/core/neighbour.c:1596
 neigh_output include/net/neighbour.h:560 [inline]
 ip_finish_output2+0x851/0x2400 net/ipv4/ip_output.c:236
 __ip_finish_output.part.0+0x444/0x6f0 net/ipv4/ip_output.c:314
 __ip_finish_output net/ipv4/ip_output.c:302 [inline]
 ip_finish_output net/ipv4/ip_output.c:324 [inline]
 NF_HOOK_COND include/linux/netfilter.h:314 [inline]
 ip_output+0x39b/0xc10 net/ipv4/ip_output.c:437
 dst_output include/net/dst.h:471 [inline]
 ip_local_out+0x193/0x1f0 net/ipv4/ip_output.c:131
 __ip_queue_xmit+0x885/0x1f40 net/ipv4/ip_output.c:533
 __tcp_transmit_skb+0x3503/0x4f40 net/ipv4/tcp_output.c:1716
 tcp_transmit_skb net/ipv4/tcp_output.c:1734 [inline]
 tcp_write_xmit+0x1130/0x8470 net/ipv4/tcp_output.c:3062
 tcp_sendmsg_locked+0x2c02/0x4420 net/ipv4/tcp.c:1394
 tcp_sendmsg+0x2e/0x50 net/ipv4/tcp.c:1451
 inet_sendmsg+0xb9/0x140 net/ipv4/af_inet.c:865
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:815 [inline]
 sock_write_iter+0x4ea/0x5b0 net/socket.c:1266
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x1f8/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4dac559357
RSP: 002b:00007ffd050a5c90 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000555560ecd540 RCX: 00007f4dac559357
RDX: 0000000000049be8 RSI: 00007f4da97b6418 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000049be8
R13: 0000555560ee1ed0 R14: 00007ffd050a6270 R15: 00007f4da97b6418
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

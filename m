Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F271419A4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788135245; cv=none; b=blzHrZO8ssGBYffb2H+BV793boLnaZe6eXEAT6f3ofDTz6MSHAWbcnDGMOb8NUVn+Ff+wtwTDIVGpGM3teClYERCqhSZbHOBJwoPZXzaLlu8MhcUzN6I2A4/oYl4zOkVaeEXnw/qFsO4WU8jHdXq+8+IbOxtugT+RmH/d8f9Ue0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788135245; c=relaxed/simple;
	bh=4zrUzGUAYzwCTo2PeEbJTUL51taSmIvMZQZeYqNbs58=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hUG+e3S+q8Frq8t/wqO1e+vuQQX3ji+e82cej0TZuYvFLRTsR9cPE5ymV5tCBfQJrqT1LZNgErThhj7eIHUZOlolLqhmA4ACBZIVYf9Bp+5APOZA6dYdKNduYZYTGDb8KUT2YytAttXLq5FgmRxfZYWq7kwLAEs7r1PGus+fQgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d8d1b76so3154323b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788135243; x=1788740043;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fo0Hu+aws2U32FIHNxxrs9p4BPhWz3B2i9eKSeX1ugk=;
        b=VYBL8KwNRM4EJCpdqXlmwJ8jJb2QqmEkhoqLpyH9ue8Acr6q2u6dmAMLyXm2VEPlgl
         UE5ue5RvVwKTF9Hf1fn8sLHr4HeYjc3Th8fxYQbx0KpeCUJQaPkYmFeUs77d3F8H3MEv
         2W2LobCvB1umNd9svJ2hTDOr2Ug7arXPPJWKlkkfHRIBhfJsOrBj9NrUlBsTQ7sMsUZI
         w3EkpTaf6FOLgLHqQvdXPUQOD9JDJBrzpQCKYOdHr2gArso0hl6H7xmle1+LUfHOtXWE
         i2p9eL7E3IzufnpPRIMSvjthyijd4SEy7V80VBxobpOdSdA2C9579QaFCPmUmHxnHTrK
         LXqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaATwQPkAdS0i4Z2Gn2+c06XnyBhhaqy+YFcgHAWhyIt0wcJ0as3XIDmgXCVhpOBxftdVqus/9zJ4QelY=@vger.kernel.org
X-Gm-Message-State: AFuF++mZddlL3Z/91XrlPQKuhpHc8m2m7ZCL4twNCL9ExGZwh1oJLJzI
	ftpp119nMoE6cFYJY8e4S1WUd47c//AmPz+DrA5UvC/JyNp+bTg5pwa/G9DEfCCAB0U14g9KTDj
	0oVuKiv5Sw6sGVKI2rWM8L0JIX2DK4movRyyM6KvS+nI0e+lLcZys7EZfk0I=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b14:b0:4a0:cf55:3cf0 with SMTP id
 5614622812f47-4b398194062mr21156945b6e.9.1788135243028; Sun, 30 Aug 2026
 17:14:03 -0700 (PDT)
Date: Sun, 30 Aug 2026 17:14:03 -0700
In-Reply-To: <20260830235031.326993-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a94c74b.a8e469d2.cbf3.560d.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in keyspan_close
From: syzbot <syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in usb_hcd_link_urb_to_ep

list_add double add: new=ffff888024daf118, prev=ffff888024daf118, next=ffff88802b357078.
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:35!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 7594 Comm: syz.3.536 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__list_add_valid_or_report.cold+0x34/0x36 lib/list_debug.c:35
Code: eb ff 90 0f 0b 48 c7 c7 00 0d 62 8c e8 7a be eb ff 90 0f 0b 48 89 d9 4c 89 ea 48 89 ee 48 c7 c7 40 0f 62 8c e8 62 be eb ff 90 <0f> 0b 48 89 de 48 c7 c7 00 10 62 8c e8 50 be eb ff 90 0f 0b 48 89
RSP: 0018:ffffc900000078b8 EFLAGS: 00010086
RAX: 0000000000000058 RBX: ffff88802b357078 RCX: 0000000000000000
RDX: 0000000000000058 RSI: ffffffff81e9e1d9 RDI: fffff52000000f08
RBP: ffff888024daf118 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000102 R11: 0000000000000001 R12: ffff88802b357080
R13: ffff888024daf118 R14: 0000000000000000 R15: ffff888024daf118
FS:  00007f9d428ff6c0(0000) GS:ffff8880d5b64000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbabb227dac CR3: 000000003d2aa000 CR4: 0000000000352ef0
Call Trace:
 <IRQ>
 __list_add_valid include/linux/list.h:104 [inline]
 __list_add include/linux/list.h:169 [inline]
 list_add_tail include/linux/list.h:206 [inline]
 usb_hcd_link_urb_to_ep+0x220/0x3a0 drivers/usb/core/hcd.c:1154
 dummy_urb_enqueue+0x2b5/0x880 drivers/usb/gadget/udc/dummy_hcd.c:1310
 usb_hcd_submit_urb+0x268/0x2150 drivers/usb/core/hcd.c:1542
 usb_submit_urb+0x827/0x19b0 drivers/usb/core/urb.c:586
 keyspan_usa67_send_setup.isra.0+0x641/0x950 drivers/usb/serial/keyspan.c:2740
 usa67_glocont_callback+0x1bb/0x2a0 drivers/usb/serial/keyspan.c:1454
 __usb_hcd_giveback_urb+0x38e/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xdb2/0x3700 drivers/usb/gadget/udc/dummy_hcd.c:2019
 __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
 __hrtimer_run_queues+0x462/0x9c0 kernel/time/hrtimer.c:2124
 hrtimer_run_softirq+0x1ca/0x360 kernel/time/hrtimer.c:2141
 handle_softirqs+0x1e6/0x9d0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 invoke_softirq kernel/softirq.c:519 [inline]
 __irq_exit_rcu+0x194/0x210 kernel/softirq.c:767
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:784
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:lock_acquire+0x5e/0x380 kernel/locking/lockdep.c:5913
Code: 05 4f a1 a4 12 83 f8 07 0f 87 da 00 00 00 48 0f a3 05 5e d7 5d 0f 0f 82 c9 02 00 00 8b 35 fe 08 5e 0f 85 f6 0f 85 c7 00 00 00 <48> 8b 44 24 30 65 48 2b 05 ed a0 a4 12 0f 85 09 03 00 00 48 83 c4
RSP: 0018:ffffc9000dfbf6f0 EFLAGS: 00000206
RAX: 0000000000000046 RBX: 0000000000000000 RCX: 0000000000000200
RDX: 0000000000000000 RSI: ffffffff8e3c46cc RDI: ffffffff8c620c80
RBP: ffffffff8edec060 R08: 00000000c68d1768 R09: 0000000000000007
R10: 0000000000000200 R11: 0000000000000001 R12: 0000000000000002
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 unwind_next_frame+0xd1/0x2090 arch/x86/kernel/unwind_orc.c:495
 arch_stack_walk+0x94/0xf0 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x8e/0xc0 kernel/stacktrace.c:122
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5414 [inline]
 __kmalloc_noprof+0x32f/0x840 mm/slub.c:5439
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 tomoyo_realpath_from_path+0xb6/0x690 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_number_perm+0x23c/0x580 security/tomoyo/file.c:728
 security_file_ioctl+0xd3/0x230 security/security.c:2512
 __do_sys_ioctl fs/ioctl.c:591 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0xb7/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9d4199e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9d428ff028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f9d41c25fa0 RCX: 00007f9d4199e159
RDX: 0000000000000000 RSI: 0000000000005437 RDI: 0000000000000004
RBP: 00007f9d41a35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9d41c26038 R14: 00007f9d41c25fa0 R15: 00007ffc0da26608
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_add_valid_or_report.cold+0x34/0x36 lib/list_debug.c:35
Code: eb ff 90 0f 0b 48 c7 c7 00 0d 62 8c e8 7a be eb ff 90 0f 0b 48 89 d9 4c 89 ea 48 89 ee 48 c7 c7 40 0f 62 8c e8 62 be eb ff 90 <0f> 0b 48 89 de 48 c7 c7 00 10 62 8c e8 50 be eb ff 90 0f 0b 48 89
RSP: 0018:ffffc900000078b8 EFLAGS: 00010086
RAX: 0000000000000058 RBX: ffff88802b357078 RCX: 0000000000000000
RDX: 0000000000000058 RSI: ffffffff81e9e1d9 RDI: fffff52000000f08
RBP: ffff888024daf118 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000102 R11: 0000000000000001 R12: ffff88802b357080
R13: ffff888024daf118 R14: 0000000000000000 R15: ffff888024daf118
FS:  00007f9d428ff6c0(0000) GS:ffff8880d5b64000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbabb227dac CR3: 000000003d2aa000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	05 4f a1 a4 12       	add    $0x12a4a14f,%eax
   5:	83 f8 07             	cmp    $0x7,%eax
   8:	0f 87 da 00 00 00    	ja     0xe8
   e:	48 0f a3 05 5e d7 5d 	bt     %rax,0xf5dd75e(%rip)        # 0xf5dd774
  15:	0f
  16:	0f 82 c9 02 00 00    	jb     0x2e5
  1c:	8b 35 fe 08 5e 0f    	mov    0xf5e08fe(%rip),%esi        # 0xf5e0920
  22:	85 f6                	test   %esi,%esi
  24:	0f 85 c7 00 00 00    	jne    0xf1
* 2a:	48 8b 44 24 30       	mov    0x30(%rsp),%rax <-- trapping instruction
  2f:	65 48 2b 05 ed a0 a4 	sub    %gs:0x12a4a0ed(%rip),%rax        # 0x12a4a124
  36:	12
  37:	0f 85 09 03 00 00    	jne    0x346
  3d:	48                   	rex.W
  3e:	83                   	.byte 0x83
  3f:	c4                   	.byte 0xc4


Tested on:

commit:         08dbfad3 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=113a8349580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=5fabc1ae99ff40690d84
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14357379580000


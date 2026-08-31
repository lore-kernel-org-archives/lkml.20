Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4CF23EAB4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138125; cv=none; b=Ab+OPMGxMfghJNakFxD3KGzfgxY4kd6/TS1efFr+i41U3s72UmI3JhcNhcDfpj03s8fcnRXhciTGmUL3eabYAWelb2mVymXYA28l+HlXTGMg3yl/mufVO+7CNWxjOMDTIWCrL9FS+x5jhe2l7MaS2YXvGturabkTEwKH2i+hum0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138125; c=relaxed/simple;
	bh=oDa65quoB0iul9d26kRjEwz066/ne1iRsGPau5Tyi7E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=it1IbgsMbDJfpcw7FzFzHTAgU1M/5L0BTJUFn3qHwV58Me5lS9AajJ1s3LMQC2C5rfEsksJ6LPLEy6b2sXzdi8R0A9c6qj2tdUKfTlLh0An/KxhW+73z/R8pg3nXogfMF9dZVElxkhIpYe5HfkCrU42USmo8AuX3gixOXBk1Qrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b3319233c2so4184984b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788138123; x=1788742923;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JNGL+tbHLtF5rwhnJgoZWLL0n3CwxbYiWAl2PKM9+z8=;
        b=T+IL0VYhlBf52XXUT01/zUphI1i9rRSygj2mbNmk/rC3W3fLPckTLPFbPCEO2yQQW/
         FIb81xdpBkIIIU0iqBoegp4WZkjpau9FDknbhzD/8PhmiukV9RdYZOReoYEWceb1MV3b
         zsPIDrx/rbi4O5Zf9gWMKXKSW9jM1KZtoU3CQ2sv2ICFU/+nNWKmOjqvB0w780ulqxfk
         r/f2iY2EwnubsQEVqX9smTqJoJnmCR/aUNtwpjP4R0x34vhilO9XY90t9zjHchVESgU0
         H8ENjz6I6iOtsnMAwspz9mEDjxMfah+wR5jEIPNAzHwr3ijhbbEciTLcRhsU+jMlBV0a
         g4eQ==
X-Forwarded-Encrypted: i=1; AHgh+Rowjracls1IB4sVDmb+k3hUueREBO9kJVF+xYr85ItKi+Ex7DepDqE+tQffNFkpVqnGHwhVgIi/eKlDjL0=@vger.kernel.org
X-Gm-Message-State: AFuF++kjGLmEzF1cx905qwZbGyjx7j9H+51SOEk8kPia0tQlgEkjLzVb
	LdF8s6xyTcAsvVQIu+h64MTMMqqYAbqpHwlWREdFgrvxYa7fMXH/5JQkO1Gx+P+eFr6Yiim27oL
	sTW3rySWza3mBLrrRduJ6ZXrWTFdIKxgSBhO3EuiNEhv0laFXAHt7NrTQaR8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2208:b0:4b3:77da:2b9c with SMTP id
 5614622812f47-4b398196054mr25125458b6e.12.1788138122849; Sun, 30 Aug 2026
 18:02:02 -0700 (PDT)
Date: Sun, 30 Aug 2026 18:02:02 -0700
In-Reply-To: <20260831003832.330549-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a94d28a.4d659fcc.734b4.0040.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in keyspan_close
From: syzbot <syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in usb_hcd_link_urb_to_ep

list_add double add: new=ffff88803dbb4e18, prev=ffff88803dbb4e18, next=ffff888054867878.
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:35!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 8045 Comm: syz.3.731 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__list_add_valid_or_report.cold+0x34/0x36 lib/list_debug.c:35
Code: eb ff 90 0f 0b 48 c7 c7 00 0d 62 8c e8 7a be eb ff 90 0f 0b 48 89 d9 4c 89 ea 48 89 ee 48 c7 c7 40 0f 62 8c e8 62 be eb ff 90 <0f> 0b 48 89 de 48 c7 c7 00 10 62 8c e8 50 be eb ff 90 0f 0b 48 89
RSP: 0018:ffffc900006588b8 EFLAGS: 00010086
RAX: 0000000000000058 RBX: ffff888054867878 RCX: 0000000000000000
RDX: 0000000000000058 RSI: ffffffff81e9e1d9 RDI: fffff520000cb108
RBP: ffff88803dbb4e18 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000103 R11: 0000000000000001 R12: ffff888054867880
R13: ffff88803dbb4e18 R14: 0000000000000000 R15: ffff88803dbb4e18
FS:  00007ff211c5e6c0(0000) GS:ffff8880d5d64000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f348dc70050 CR3: 000000002dba6000 CR4: 0000000000352ef0
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
RIP: 0010:owner_on_cpu include/linux/sched.h:2338 [inline]
RIP: 0010:mutex_spin_on_owner+0xbb/0x2b0 kernel/locking/mutex.c:406
Code: 48 89 df e8 d7 f0 98 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 0f 85 c0 01 00 00 48 8b 03 48 83 e0 f8 48 39 c5 0f 85 24 01 00 00 <48> 8d 7d 34 48 89 f8 48 89 f9 48 c1 e8 03 83 e1 07 42 0f b6 04 38
RSP: 0018:ffffc90023b476b0 EFLAGS: 00000246
RAX: ffff888027e88000 RBX: ffff88802db3a150 RCX: ffffffff81e60db9
RDX: 0000000000000001 RSI: 0000000000000008 RDI: ffff88802db3a150
RBP: ffff888027e88000 R08: 0000000000000000 R09: ffffed1005b6742a
R10: ffff88802db3a157 R11: 0000000000000000 R12: ffffed10056b84b0
R13: ffff88802b5c2580 R14: 0000000000000000 R15: dffffc0000000000
 mutex_optimistic_spin kernel/locking/mutex.c:509 [inline]
 __mutex_lock_common kernel/locking/mutex.c:761 [inline]
 __mutex_lock+0x12c3/0x1bc0 kernel/locking/mutex.c:821
 tty_lock_interruptible+0x75/0xe0 drivers/tty/tty_mutex.c:27
 tty_open_by_driver drivers/tty/tty_io.c:2032 [inline]
 tty_open+0x5e7/0xe20 drivers/tty/tty_io.c:2093
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:996
 vfs_open+0x82/0x3f0 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x19fa/0x2440 fs/namei.c:5000
 do_file_open+0x20e/0x430 fs/namei.c:5029
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff210d9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff211c5e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007ff211025fa0 RCX: 00007ff210d9e159
RDX: 0000000000000002 RSI: 0000200000000400 RDI: ffffffffffffff9c
RBP: 00007ff210e35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff211026038 R14: 00007ff211025fa0 R15: 00007ffc38d9dfd8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_add_valid_or_report.cold+0x34/0x36 lib/list_debug.c:35
Code: eb ff 90 0f 0b 48 c7 c7 00 0d 62 8c e8 7a be eb ff 90 0f 0b 48 89 d9 4c 89 ea 48 89 ee 48 c7 c7 40 0f 62 8c e8 62 be eb ff 90 <0f> 0b 48 89 de 48 c7 c7 00 10 62 8c e8 50 be eb ff 90 0f 0b 48 89
RSP: 0018:ffffc900006588b8 EFLAGS: 00010086
RAX: 0000000000000058 RBX: ffff888054867878 RCX: 0000000000000000
RDX: 0000000000000058 RSI: ffffffff81e9e1d9 RDI: fffff520000cb108
RBP: ffff88803dbb4e18 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000103 R11: 0000000000000001 R12: ffff888054867880
R13: ffff88803dbb4e18 R14: 0000000000000000 R15: ffff88803dbb4e18
FS:  00007ff211c5e6c0(0000) GS:ffff8880d5d64000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f348dc70050 CR3: 000000002dba6000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	48 89 df             	mov    %rbx,%rdi
   3:	e8 d7 f0 98 00       	call   0x98f0df
   8:	48 89 d8             	mov    %rbx,%rax
   b:	48 c1 e8 03          	shr    $0x3,%rax
   f:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
  14:	0f 85 c0 01 00 00    	jne    0x1da
  1a:	48 8b 03             	mov    (%rbx),%rax
  1d:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  21:	48 39 c5             	cmp    %rax,%rbp
  24:	0f 85 24 01 00 00    	jne    0x14e
* 2a:	48 8d 7d 34          	lea    0x34(%rbp),%rdi <-- trapping instruction
  2e:	48 89 f8             	mov    %rdi,%rax
  31:	48 89 f9             	mov    %rdi,%rcx
  34:	48 c1 e8 03          	shr    $0x3,%rax
  38:	83 e1 07             	and    $0x7,%ecx
  3b:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax


Tested on:

commit:         08dbfad3 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17f68349580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=5fabc1ae99ff40690d84
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10fd7379580000


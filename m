Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD79D202C29
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751686; cv=none; b=Hb24OYbBpkE0Gvikp5iLbNmBSthuVrxyINGVpHVWZrw3LG8PH0Ykp1DX9quRVuHNCMLV0y2130MKeKZ/M4kh8qorVFQNeOLYeBePVJRuQimJxvBsemiRuEBpL8Aoj8leKyImkCtAUGVdkbdscPPm+n9nRvGjsYmcU6mFhZP9f94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751686; c=relaxed/simple;
	bh=OvBF/9Ta7XFsv+bIlEViYUIKZVq9jzWyT041tmx4yK8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KLUOp7E6ZN0m8cn7jCInt/33LpPGalEGhSUyaKtP1MU9rk5EjiKPn2coPxcGF6xiC+GtoITyHbBx6AE5leWkRklEgqi8UhrKXhfV5rfWn7OwIBf8KzLTGQmrBDXltN/PYwimidzOOn5M0MPWI3/gVi+Mn3ed8DWvpYYuJzy5Tc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e2db9914so4389765a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788751684; x=1789356484;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5acE/rB+8hP5Ojjgi1m4Jizbk24Y3VPuNS0WpCb5wHA=;
        b=Vi2h7aRyWX5MNDayg8cuSoduBmtfw39O41l2vKulNQ5r9IWvftYkZdkYdgqQaMmZB1
         RdQUvtl08TAqb7Nz/v1XYhb1LPKdGx6DFQ9N82u0+WKNhg6TxAf4AO7bHAjJyfzOfahe
         /iyg7T3/xZW8dq5IdtIJCuLDYGc7ffbS88KTqL7xcWpd7D3F8+ZnXxIbImRRZ/neRcVA
         G6btt54M8DzO9xwq9FVvsOcR7nblJ8HIKK1SGb1qUFSsbzBNBYaOJFTdsap25mumFg3h
         OTfcTeE9TnozUMZVDQRarM+pBF4Ui0ettgiYmhWtxKLoTFlJZ9ruxZVQbqDwL0bMzpA+
         SpXA==
X-Gm-Message-State: AFuF++n3HIzWMQL9sHUTbY+b+38L4nwWj3Mb6Ktu/g8b1D6D8z7vF/jo
	XsFRvfYTK2xR2jvZd7YAGIIkXAPpTCJV//Mo2DGa43JYwKWuvwrHX42+H0tpSpVXyN2ybdOLFEW
	MYRUbv+auSMFHnHy4AbLnOTqWcRbAVZZybMM24HBg7tVrDm27jGXC9UR2qQA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:7145:b0:6ba:5f65:6e5c with SMTP id
 006d021491bc7-6ba5f657d49mr1912952eaf.42.1788751683777; Sun, 06 Sep 2026
 20:28:03 -0700 (PDT)
Date: Sun, 06 Sep 2026 20:28:03 -0700
In-Reply-To: <OSZPR01MB9313C6A272CD4ACAD2097CF0B2B22@OSZPR01MB9313.jpnprd01.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e2f43.a6639fcc.23b8b0.000f.GAE@google.com>
Subject: Re: [syzbot] WARNING in usb_composite_setup_continue
From: syzbot <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tkdkei@outlook.jp
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in __fsg_is_set

configfs-gadget.g1 gadget.2: common->fsg is NULL in fsg_setup at 466
------------[ cut here ]------------
1
WARNING: drivers/usb/gadget/function/f_mass_storage.c:315 at __fsg_is_set.part.0.isra.0+0x2c/0x3a drivers/usb/gadget/function/f_mass_storage.c:315, CPU#0: syz-executor104/5934
Modules linked in:
CPU: 0 UID: 0 PID: 5934 Comm: syz-executor104 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:__fsg_is_set.part.0.isra.0+0x2c/0x3a drivers/usb/gadget/function/f_mass_storage.c:315
Code: 41 89 d4 55 48 89 f5 53 48 89 fb e8 9e f8 b6 00 48 8d bb d8 00 00 00 44 89 e1 48 89 ea 48 c7 c6 c0 82 dc 8c e8 25 61 eb ff 90 <0f> 0b 90 31 c0 5b 5d 41 5c e9 c6 f2 7b 0a e8 71 f8 b6 00 4c 89 e2
RSP: 0018:ffffc90000007a40 EFLAGS: 00010082
RAX: 0000000000000000 RBX: ffff88802b4f4c00 RCX: 0000000000000000
RDX: ffff888035554b00 RSI: ffffffff81404f89 RDI: fffff52000000f38
RBP: ffffffff8cdc9f60 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000101 R11: 0000000000000001 R12: 00000000000001d2
R13: ffff88805c34ace8 R14: 0000000000000000 R15: ffffc90000007de0
FS:  00007f788ec136c0(0000) GS:ffff888123b6f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f788dc10ff8 CR3: 000000002cb70000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 __fsg_is_set drivers/usb/gadget/function/f_mass_storage.c:864 [inline]
 fsg_setup.cold+0x38/0x4c drivers/usb/gadget/function/f_mass_storage.c:466
 composite_setup+0xad8/0x9290 drivers/usb/gadget/composite.c:2239
 configfs_composite_setup+0xfb/0x130 drivers/usb/gadget/configfs.c:1877
 dummy_timer+0x2039/0x3700 drivers/usb/gadget/udc/dummy_hcd.c:1951
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
RIP: 0010:unwind_next_frame+0xcb6/0x2090 arch/x86/kernel/unwind_orc.c:610
Code: 03 0f b6 04 02 4c 89 c2 83 e2 07 38 d0 7f 08 84 c0 0f 85 db 0d 00 00 0f b6 41 04 83 e0 0f 3c 09 0f 84 ef 0a 00 00 0f b6 41 05 <4c> 89 44 24 18 83 e0 07 3c 03 0f 84 cc 03 00 00 3c 04 0f 84 05 03
RSP: 0018:ffffc900035ef768 EFLAGS: 00000292
RAX: 0000000000000002 RBX: 0000000000000001 RCX: ffffffff9221d688
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000001
RBP: ffffc900035ef820 R08: ffffffff9221d68c R09: 0000000000000007
R10: 0000000000000200 R11: 000000000003e7cf R12: ffffc900035ef828
R13: ffffc900035ef7d8 R14: ffffc900035efeb0 R15: ffffc900035efc38
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
RIP: 0033:0x7f788ec4f93b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007f788ec130d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f788ec4f93b
RDX: 00007f788ec13148 RSI: 000000004008550c RDI: 0000000000000003
RBP: 000000008038550a R08: 0000000000000000 R09: 00007f788ec136c0
R10: 0000000000000008 R11: 0000000000000246 R12: 0000000072062152
R13: 00007f788ec13160 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	03 0f                	add    (%rdi),%ecx
   2:	b6 04                	mov    $0x4,%dh
   4:	02 4c 89 c2          	add    -0x3e(%rcx,%rcx,4),%cl
   8:	83 e2 07             	and    $0x7,%edx
   b:	38 d0                	cmp    %dl,%al
   d:	7f 08                	jg     0x17
   f:	84 c0                	test   %al,%al
  11:	0f 85 db 0d 00 00    	jne    0xdf2
  17:	0f b6 41 04          	movzbl 0x4(%rcx),%eax
  1b:	83 e0 0f             	and    $0xf,%eax
  1e:	3c 09                	cmp    $0x9,%al
  20:	0f 84 ef 0a 00 00    	je     0xb15
  26:	0f b6 41 05          	movzbl 0x5(%rcx),%eax
* 2a:	4c 89 44 24 18       	mov    %r8,0x18(%rsp) <-- trapping instruction
  2f:	83 e0 07             	and    $0x7,%eax
  32:	3c 03                	cmp    $0x3,%al
  34:	0f 84 cc 03 00 00    	je     0x406
  3a:	3c 04                	cmp    $0x4,%al
  3c:	0f                   	.byte 0xf
  3d:	84                   	.byte 0x84
  3e:	05                   	.byte 0x5
  3f:	03                   	.byte 0x3


Tested on:

commit:         edc15184 usb: typec: hd3ss3220: Add support for supply..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=11e84a15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec55b50193b453ea
dashboard link: https://syzkaller.appspot.com/bug?extid=a83a5a1ba9ff57935171
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.

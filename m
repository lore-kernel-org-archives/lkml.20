Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8ED53ECF7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196883; cv=none; b=hYfZdwi4L8eDOqGa0k9kSo4wPkwVSlpSL+a0HvYV459Y3WRF0d3mfoIMISdc4+MXahUfbtTG7TmjmEhkDCy1b/m7OPsRLkoV/9Uk60Dc9FQ/2lor1OwF2tZcVL6wC7NfhUCGHxE8h31re4zGnnnYNwoE6WRNf+83wOTbwPeXV3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196883; c=relaxed/simple;
	bh=G1AA7YrFL8xLT9b2T2uWEotop8fShiaKbqgPsIV9vaM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jg50x1aTN0KEWZgvGfXQLHFxtyiqT9ZSOjxpJI+76DD13CCs7x0Y2TSse7llaouoDJmstTIMxEu9zLQxrH2aG4pu7ex3hMWnCtSnlqYFqdFlH3ZThw63wbkWT7g8o4CNspJ10OXASF+AH77wwvdFE+PfDxoFdXTZZtvNtb48J98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f6.google.com with SMTP id 46e09a7af769-804795653f9so290204a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196880; x=1790801680;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o9p5Yjpo/SS1O7YZHoSOG4JjsPX0B2dN68tMlGrTFM=;
        b=uInMJUaCZCnWzUm4c7dsXKTazOFXUf76QIDb8oq7UVPaIw34wQWYOEZ/t/0TImnyFo
         l83rgjvk/20dWrECL6ohk74upRYHbiL6GHz9TNYU3uk7qYypYuow72IVvUVWXIs08CXh
         ZV0XWYf8u5kxHXZRJHHiZ/arZz9IzaOL1138gwyNW/zqgs//iauvkUnnlKWSxw6ba3So
         1/u0CvMMwN96DAVUBAnVBO9TJNy+27YmrKJ8oBzqnOI0h5jElT9LBX2c1FCLMJpAU9mO
         HztIBDj+pXgMSprXlpKMyFPwauWgYbjwQgSKD90cwei4f6tywJocmgsk+KfOWLndRbIm
         qRfg==
X-Gm-Message-State: AFuF++k+n0zCfyGOUN7mY/2xNiOKoFLwGR8jGr9IYRuQE5KZ4TDxpEuQ
	7rhXjsr6mJhL849aZmpakrZ91qIS400BmDlaejwOl5mJx8leTcpm8Vt1waazBNnuVc/5dgNiqrc
	vTdtK40P5GF2x1EtLZW4R0t21fI6VgqfIJb7+qbubbzF0iw56rSo/1V82/lDLlw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2910:b0:6ba:2d85:8f49 with SMTP id
 006d021491bc7-6d441995ecdmr424970eaf.65.1790196880023; Wed, 23 Sep 2026
 13:54:40 -0700 (PDT)
Date: Wed, 23 Sep 2026 13:54:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab43c90.7428d045.30104c.0005.GAE@google.com>
Subject: [syzbot] [kernel?] KCSAN: data-race in __mmput / copy_mm (4)
From: syzbot <syzbot+a4bf7413d2424fa6e235@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luto@kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fe2ec83746e5 Merge tag 'hid-for-linus-2026092202' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13895405580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=a4bf7413d2424fa6e235
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8d62b1e87101/disk-fe2ec837.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f842c0393d08/vmlinux-fe2ec837.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b8e7137bfc1e/bzImage-fe2ec837.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a4bf7413d2424fa6e235@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in __mmput / copy_mm

write to 0xffff8881046681f8 of 8 bytes by task 21217 on cpu 1:
 __list_del include/linux/list.h:241 [inline]
 __list_del_entry include/linux/list.h:264 [inline]
 list_del include/linux/list.h:275 [inline]
 __mmput+0xe2/0x1c0 kernel/fork.c:1198
 mmput+0x40/0x50 kernel/fork.c:1216
 exit_mm+0x113/0x1a0 kernel/exit.c:618
 do_exit+0x438/0x1510 kernel/exit.c:1000
 do_group_exit+0xfe/0x140 kernel/exit.c:1155
 get_signal+0xe07/0xf10 kernel/signal.c:3112
 arch_do_signal_or_restart+0x96/0x480 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x15d/0x8c0 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x212/0x360 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff888104668000 of 1728 bytes by task 3876 on cpu 0:
 dup_mm kernel/fork.c:1537 [inline]
 copy_mm+0xd6/0x340 kernel/fork.c:1595
 copy_process+0x108a/0x2350 kernel/fork.c:2310
 kernel_clone+0x1c0/0x5f0 kernel/fork.c:2769
 __do_sys_clone kernel/fork.c:2911 [inline]
 __se_sys_clone kernel/fork.c:2895 [inline]
 __x64_sys_clone+0x143/0x180 kernel/fork.c:2895
 x64_sys_call+0x2479/0x2550 arch/x86/include/generated/asm/syscalls_64.h:57
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 3876 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
==================================================================


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

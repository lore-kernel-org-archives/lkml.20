Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3B380FD8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162827; cv=none; b=OEpc0jAmqC77K8ryrGIkZXeU/5HyOSvNbNfxjjjtc4ZbYa3YU8f66lUonP9wn7HKoVro5ubnBvidEkfZUMBPZThEPy6MvTfCGEx8LH3rKVzQcnRnPCtIg/BXNRfh+4Tk0Dor6gIae/ER5qZC2nyp4khoE+TdStzPKPKUekqYNMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162827; c=relaxed/simple;
	bh=3MeGQwF3gUpdjM2xKnUG8PgRH5HJ8TquyxhNEaB1yls=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hWyPS/f6N8CJLmbPhsq/NI4y1XuRJ8txsXWmvhWMdRT0eKf8nATmFihG4lGHMpyGjO0Od85vMNq3k8g35FdADZms3yQdiupdVDENQWArqHkk04D91QVcfJyiKuqlGg/thpiiQHd1cN/jHI/VjCU8qJ8Ev7/dCXY97HPemv20P8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a41f46d629so72256b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162825; x=1792767625;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8vU9eG3N0gm3q3XnBKVktTduhhmN3KZoJgu5jBd7w4=;
        b=BP3lE7pD2dbXEagtyK56sMaaO2xZVaTS5WCjZo5itAmqLhY9WdkARL7TTtXWNAxzfK
         jAjBVKJ8BbV94u4U6rmqiUhnbpRj1yheL75hB2wVYREtUt5bEf7ZxOlAF9n1uTHGqGYR
         R0F1m1f4YVcdvQM/ieUAdiKsGRlBDnf03pwC5Wp64dqHtJ76g4oy7BVVuRIqpvIgmBqd
         MiNzc5mir/tLjj++UpdXOF9ZUlDAKr4lIitlwsUs0sRxVBSoTmcSGAzmUD8LZVs2D/Ih
         HdtIoPYEcWU8AqwY9g0+l+gZGGJz/7d7aBUo21uRwrnCm2C7BvjcVIe9myQDKLAc8TEv
         3uDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6ybsUiW5Ld8XUd+m8K1bHtZfI32TDcHGQ8aCS0/ACxzxnnZ7bKdXBaRuvNoHezPdFyevWRooNxas27+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4X2bHRvDz42PNafp3z1/5hIc+IRM1XNpgGp+J6+IUE9PeDGmV
	X5/LADtuTYEOEariUI/MJI/zJkcBrLP/tw6K3gbRM0N4YRh16b0fuSewsFtU82Ng9QHZIq8mX71
	iqq/jZL1PiuClz9SolkSm9TrObWib40wmoEQr9EyDxpey+RY4YBIygtewtL4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14c5:b0:4f4:6c04:8ac2 with SMTP id
 5614622812f47-50c50f2ec7amr17815187b6e.10.1792162824628; Fri, 16 Oct 2026
 08:00:24 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:00:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad23c08.7952420f.283480.0348.GAE@google.com>
Subject: [syzbot] [edac?] WARNING: ODEBUG bug in mcheck_cpu_init
From: syzbot <syzbot+553c9f2c5781192c2214@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, tony.luck@intel.com, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2f2f7eeef8b0 Merge tag 'soc-fixes-7.3-3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1703f701580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=553c9f2c5781192c2214
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bd6590603436/disk-2f2f7eee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8f022e6e4c47/vmlinux-2f2f7eee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e102a402b091/bzImage-2f2f7eee.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+553c9f2c5781192c2214@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: init active (active state 0) object: ffff8880b85234a0 object type: timer_list hint: mce_timer_fn+0x0/0x280 include/linux/highmem-internal.h:-1
WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230 lib/debugobjects.c:629, CPU#1: swapper/1/0
Modules linked in:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G S                  syzkaller #0 PREEMPT_{RT,(lazy)} 
Tainted: [S]=CPU_OUT_OF_SPEC
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:debug_print_object+0x18a/0x230 lib/debugobjects.c:629
Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff e8 7d b5 58 fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 a3 61 d7 0b 48 83 c4 10 5b 41 5c
RSP: 0000:ffffc900001d7c20 EFLAGS: 00010046
RAX: 1ffffffff16df3c0 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: ffffffff8bcc7540 RSI: ffffffff8bcc7140 RDI: ffffffff90bccee0
RBP: ffffffff8bcc7540 R08: ffff8880b85234a0 R09: ffffffff8b6fb180
R10: dffffc0000000000 R11: ffffffff81b2b680 R12: 0000000000000000
R13: ffffffff90bccee0 R14: ffff8880b85234a0 R15: ffffffff8b6f9e00
FS:  0000000000000000(0000) GS:ffff888124abb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000efb0000 CR4: 00000000003506b0
Call Trace:
 <TASK>
 __debug_object_init+0x224/0x350 lib/debugobjects.c:818
 debug_timer_init kernel/time/timer.c:788 [inline]
 debug_init kernel/time/timer.c:836 [inline]
 timer_init_key+0x41/0x2c0 kernel/time/timer.c:880
 __mcheck_cpu_setup_timer arch/x86/kernel/cpu/mce/core.c:2087 [inline]
 mcheck_cpu_init+0x3dc/0x600 arch/x86/kernel/cpu/mce/core.c:2262
 identify_cpu+0x1f2c/0x3940 arch/x86/kernel/cpu/common.c:2126
 identify_secondary_cpu+0xaa/0x160 arch/x86/kernel/cpu/common.c:2187
 ap_starting+0x9c/0x150 arch/x86/kernel/smpboot.c:190
 start_secondary+0x66/0x110 arch/x86/kernel/smpboot.c:280
 common_startup_64+0x13e/0x157
 </TASK>
----------------
Code disassembly (best guess):
   0:	f8                   	clc
   1:	48 c1 e8 03          	shr    $0x3,%rax
   5:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
   9:	74 08                	je     0x13
   b:	4c 89 ff             	mov    %r15,%rdi
   e:	e8 7d b5 58 fd       	call   0xfd58b590
  13:	4d 8b 0f             	mov    (%r15),%r9
  16:	4c 89 ef             	mov    %r13,%rdi
  19:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1e:	48 89 ea             	mov    %rbp,%rdx
  21:	44 89 e1             	mov    %r12d,%ecx
  24:	4d 89 f0             	mov    %r14,%r8
  27:	ff 34 24             	push   (%rsp)
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 83 c4 08          	add    $0x8,%rsp
  33:	ff 05 a3 61 d7 0b    	incl   0xbd761a3(%rip)        # 0xbd761dc
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

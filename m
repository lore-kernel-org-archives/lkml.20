Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75FC4562BF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248585; cv=none; b=myklb9XgZmy1OhCo/fJaGwmljaeAvx3nrvcFpsP4s75reKHqSvjvTDiZLiUL0gh0yZVWa3/l/6vpOo0sRUXz9zBsyxYCChrjym7F4kf4+cGmHL9L7CFM3GHR1OZVJMiATsuZOJeVDDHt6Cpk0LoGUTo7f4FGFzVVpVcW8AU1YS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248585; c=relaxed/simple;
	bh=kkwntoT2FHTLl7JrCquPIzFo/ZjRsZ1BK1C3oWd8+CQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FLJhCJmePLDy5N0UStp5BG5WDPGZigd5BGhKDf4XTDYHA8mc75PnQ6X0sN8G+2nht1t1M4nh7RH57HPq8Yv5J+nbjz+UVEJjnjXhrdDZW8+qusrTptwv38st9ZHRoyHn7BdEs2bptOOAVysRVCr493YbaC772lciDk3VkBjNXI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dbf4197so779394b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248582; x=1788853382;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tew7VBqWdhDnbze+5Spky+kmT6aJ8FrHZ2KzX0nElX0=;
        b=XPPbS8FaXblD6Urc6ByV7odAwV2rOS1b7eSrBpK9Vxrf6tykugElEnkyG7j5LFXPP6
         8p4WWbCG/5EiY3qPlS855YCT2Xuh8e8yNXwl+UTFS3vqUTSO7ZU1hfT74kVuUv2LYS4T
         9wfL0/nF2f5mVsujKkfTo+M1Jfm8XhdaCa35vzK8nv0AsBFtr3rGIwby+jJ8XTWrvbrC
         6EA0waUDz+RegqDeGQQ4u+dziHhP9G4yQl/0PlH0C0RHvmGKUw7ebLz5rYHdIHJrC+Gi
         tWxC9C5mU75wtCeQU9yeL2stO+Yy17YjRI6l4jUjRPMCrz5FX/4r3k4/Q1VDEHtGwmlN
         C25Q==
X-Gm-Message-State: AFuF++kKpBqPxzwME8/fjgPW5RG0NHpbsXRKLIgp+FpQq4zq6D8LLTI6
	FkMxZ58BHXUsCNJu3o9M6lAW/hN87VG2Ubnh7/TU3gEDLHsbaiYrLs1hzBie2TNEPSta0gtmAt5
	cdjM7NEvCspSJ/0495hRkdc6qJbZkrjUiaV3iktdOTTs5lIBATviWw7l+ZD0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c165:b0:4ab:3210:b31a with SMTP id
 5614622812f47-4b398253454mr35123663b6e.14.1788248582548; Tue, 01 Sep 2026
 00:43:02 -0700 (PDT)
Date: Tue, 01 Sep 2026 00:43:02 -0700
In-Reply-To: <7788086b-28f8-435a-a19d-e9ba7bd0e6c8n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a968206.99c12218.408a8.0003.GAE@google.com>
Subject: Re: [syzbot] [edac?] general protection fault in detach_timer (3)
From: syzbot <syzbot+edc6b57cbed1fb72d0f9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING: ODEBUG bug in mcheck_cpu_init

------------[ cut here ]------------
ODEBUG: init active (active state 0) object: ffff8880b87234a0 object type: timer_list hint: mce_timer_fn+0x0/0x280 include/linux/highmem-internal.h:-1
WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230 lib/debugobjects.c:629, CPU#1: swapper/1/0
Modules linked in:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:debug_print_object+0x18a/0x230 lib/debugobjects.c:629
Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff e8 5d fa 59 fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 83 7c d9 0a 48 83 c4 10 5b 41 5c
RSP: 0000:ffffc900001d7c20 EFLAGS: 00010046
RAX: 1ffffffff16df350 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: ffffffff8bcc2c40 RSI: ffffffff8bcc2840 RDI: ffffffff8fbc29e0
RBP: ffffffff8bcc2c40 R08: ffff8880b87234a0 R09: ffffffff8b6fae00
R10: dffffc0000000000 R11: ffffffff81b25c80 R12: 0000000000000000
R13: ffffffff8fbc29e0 R14: ffff8880b87234a0 R15: ffffffff8b6f9a80
FS:  0000000000000000(0000) GS:ffff888125ce1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000dfb0000 CR4: 00000000003506b0
Call Trace:
 <TASK>
 __debug_object_init+0x224/0x350 lib/debugobjects.c:818
 debug_timer_init kernel/time/timer.c:788 [inline]
 debug_init kernel/time/timer.c:836 [inline]
 timer_init_key+0x41/0x2c0 kernel/time/timer.c:880
 __mcheck_cpu_setup_timer arch/x86/kernel/cpu/mce/core.c:2087 [inline]
 mcheck_cpu_init+0x3dc/0x600 arch/x86/kernel/cpu/mce/core.c:2269
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
   e:	e8 5d fa 59 fd       	call   0xfd59fa70
  13:	4d 8b 0f             	mov    (%r15),%r9
  16:	4c 89 ef             	mov    %r13,%rdi
  19:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1e:	48 89 ea             	mov    %rbp,%rdx
  21:	44 89 e1             	mov    %r12d,%ecx
  24:	4d 89 f0             	mov    %r14,%r8
  27:	ff 34 24             	push   (%rsp)
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 83 c4 08          	add    $0x8,%rsp
  33:	ff 05 83 7c d9 0a    	incl   0xad97c83(%rip)        # 0xad97cbc
  39:	48 83 c4 10          	add    $0x10,%rsp
  3d:	5b                   	pop    %rbx
  3e:	41 5c                	pop    %r12


Tested on:

commit:         3abea627 x86/mce: Shutdown polling timer on teardown p..
git tree:       https://github.com/yutao-intel/linux.git fix-edac-v2
console output: https://syzkaller.appspot.com/x/log.txt?x=127e8779580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e618aabdc2dca7e6
dashboard link: https://syzkaller.appspot.com/bug?extid=edc6b57cbed1fb72d0f9
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.

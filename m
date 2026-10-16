Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3235CB76
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183125; cv=none; b=Howc7n5nirLCwyxuezbJtJrCx3+r46XjTydVfwBQfHfddf10vWFK64NFToSCkzQnd7VeEhjYIdXnYN63qdHI8v8G2zi9t/6seJBzZFMKomMmiAKV8eYvX0Gb/2ENlLe+cu1+XLpqMRXaZBsz4VOqJcKyh+QtWw9b4XsC7r6PLwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183125; c=relaxed/simple;
	bh=3Lhri/9i3TNtw9R/Tcbw/mOjoERB6hK1pH191CCiSzM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eCc67AbcupoXkj/m9c1VTAQyJyHlmn/5w6wge1e1eErEg7I6WFFe3IDh772DjSyjNx9IS2NV3gamM/KxwdGtOloJ7hvGJk582/m9siIiWmGuVm5xoiX9TYYvMT7oXkrSuMIWh6d2f5mvJrFYryYVU/d7QB8MwP29dcDOd3Me3y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea4c979030so597706b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792183123; x=1792787923;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AY8LAWcYNYyJyH/2TYt4cmd1InLt2Z9ePL5WuUaiwao=;
        b=uFuLVfg+PXsLpmFPGd6qbcctws+CSb/w5m95kIl8YtDow03OgTCUllKaIIDl+s0QoD
         +NupcpA5wIvZzQIthD+v9ZrgnMNrdASPlOMtobbXkEoSelSILJyM9StjHGdDNDLn3FJJ
         DSbyn7AtADDLTDyYXMswPnZfZtVHY/02raF0ubNS67GYceild5PDVb4JATOPNvmBvxPf
         uEPQT/8jTytDO4jB1aynXUOX4p4YYmDvksEjDIu9dMfAKK+6rSpnWyupe27xNKJiOKJc
         AaxvF1RElYGTdKNj4yMhRxNSKzktRGtDTBUEwKdlQS3/SQVeddPmhKV3wDo0SVS7bw2l
         wavA==
X-Forwarded-Encrypted: i=1; AKwUvBzw6Ah/BQQA99Y5Xp+gfwfqlvKrncQj5HtwsgbpZPFiyRtOtAFDwnzJ4iC9Y4hcf4zEp1HbHlJlEp3Cw3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFiY7d6F/9N5IldeJUmnhUaNzfVs9vqnKkvUmEWXRf7Eovk5Md
	Yd3bOiGxR7Pzcpu4NO5ae2YOJrh8f4MO8XPY3wSYXkC9L2MwmvzBOhO/L939YxyJVdNbvbZ9M1D
	9yLOaO+OPBoVJ++JgZql1X3K98tRD8MCtaIODEUXEaxAx01v7dTpmraUj314=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3509:b0:4d7:17d5:6c9b with SMTP id
 5614622812f47-53cc1ef9b0cmr725570b6e.9.1792183123019; Fri, 16 Oct 2026
 13:38:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:38:43 -0700
In-Reply-To: <6ad27bcb.6814cce4.34c49f.000b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad28b52.a6d1a155.34a93f.0005.GAE@google.com>
Subject: Re: [syzbot] [greybus?] WARNING: ODEBUG bug in gb_operation_sync_timeout
From: syzbot <syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com>
To: elder@kernel.org, gregkh@linuxfoundation.org, 
	greybus-dev-bounces@lists.linaro.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    2f2f7eeef8b0 Merge tag 'soc-fixes-7.3-3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a0d18e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ccb65e03706547e
dashboard link: https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=172ff571580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1333e971580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-2f2f7eee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5c84d55442c9/vmlinux-2f2f7eee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/45a44266fe39/bzImage-2f2f7eee.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com

greybus greybus1: 0/0:0: synchronous operation id 0x0003 of type 0x14 failed: -71
------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff8880353040d0 object type: timer_list hint: gb_operation_timeout+0x0/0x110 drivers/greybus/operation.c:1265
WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230 lib/debugobjects.c:629, CPU#0: kworker/u4:7/180
Modules linked in:
CPU: 0 UID: 0 PID: 180 Comm: kworker/u4:7 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: greybus1:0 gb_operation_work
RIP: 0010:debug_print_object+0x18a/0x230 lib/debugobjects.c:629
Code: f8 48 c1 e8 03 80 3c 18 00 74 08 4c 89 ff e8 cd 97 4c fd 4d 8b 0f 4c 89 ef 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f0 ff 34 24 <67> 48 0f b9 3a 48 83 c4 08 ff 05 73 bf 8c 0c 48 83 c4 10 5b 41 5c
RSP: 0018:ffffc90001a2f780 EFLAGS: 00010246
RAX: 1ffffffff181f08c RBX: dffffc0000000000 RCX: 0000000000000000
RDX: ffffffff8c6df740 RSI: ffffffff8c6df1c0 RDI: ffffffff9185c030
RBP: ffffffff8c6df740 R08: ffff8880353040d0 R09: ffffffff8c0f97c0
R10: dffffc0000000000 R11: ffffffff81b3f760 R12: 0000000000000000
R13: ffffffff9185c030 R14: ffff8880353040d0 R15: ffffffff8c0f8460
FS:  0000000000000000(0000) GS:ffff88808b0b4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5280b524c0 CR3: 000000000fb48000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1171 [inline]
 debug_check_no_obj_freed+0x2e3/0x450 lib/debugobjects.c:1201
 slab_free_hook mm/slub.c:2679 [inline]
 slab_free mm/slub.c:6509 [inline]
 kmem_cache_free+0xfd/0x650 mm/slub.c:6636
 gb_operation_sync_timeout+0x1c7/0x270 drivers/greybus/operation.c:1172
 gb_operation_sync include/linux/greybus/operation.h:203 [inline]
 gb_svc_pwrmon_rail_count_get drivers/greybus/svc.c:137 [inline]
 gb_svc_pwrmon_debugfs_init drivers/greybus/svc.c:772 [inline]
 gb_svc_debugfs_init drivers/greybus/svc.c:827 [inline]
 gb_svc_hello drivers/greybus/svc.c:875 [inline]
 gb_svc_request_handler+0x902/0x1300 drivers/greybus/svc.c:1276
 gb_operation_request_handle drivers/greybus/operation.c:243 [inline]
 gb_operation_work+0xe1/0x960 drivers/greybus/operation.c:280
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	f8                   	clc
   1:	48 c1 e8 03          	shr    $0x3,%rax
   5:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
   9:	74 08                	je     0x13
   b:	4c 89 ff             	mov    %r15,%rdi
   e:	e8 cd 97 4c fd       	call   0xfd4c97e0
  13:	4d 8b 0f             	mov    (%r15),%r9
  16:	4c 89 ef             	mov    %r13,%rdi
  19:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1e:	48 89 ea             	mov    %rbp,%rdx
  21:	44 89 e1             	mov    %r12d,%ecx
  24:	4d 89 f0             	mov    %r14,%r8
  27:	ff 34 24             	push   (%rsp)
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 83 c4 08          	add    $0x8,%rsp
  33:	ff 05 73 bf 8c 0c    	incl   0xc8cbf73(%rip)        # 0xc8cbfac
  39:	48 83 c4 10          	add    $0x10,%rsp
  3d:	5b                   	pop    %rbx
  3e:	41 5c                	pop    %r12


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

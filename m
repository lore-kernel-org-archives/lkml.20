Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506822;
	b=knhSzYcHi1Ud5cgocZUgB6wYOm/KTx0kiI5xkup2aA/SMVYCriE4ngq0vSbbBOWc4nqW
	 +96Zto26rOxN+LrX0FVIdd0DVkvujvr7oX6iPLF4wNGldM87FBv9Pl6/of/jw4IBr0VCn
	 qjfVToTx1t29RJ1Ej9o56W0R8+xESgG3s6FBjmqlSmnmaLe7r5tS7aw1L5/UET+sZlgM8
	 9Xs2Ro65Eu2+pNtzYO8l4iR7+59tfoO7Ddnkf54cIJFlsrgoY1OD5yNn/ooumsmRKL0BC
	 xMYnDwRDE4ZBp63SFqaRuD/TxaSTdoexfcecbmVZBACOfCe3IQQ04lLQn3uQ2Y2Bl6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506822;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=5k5yhn0VmTXKeRBJWIm7k2IXEUpSUMCZ2YdMJhwf2m8=;
	b=QcTVxx0+M61oHpttXH0Y1VEyeU8OA9rNVSiaHs7b/1qlNY3uwkG4lFmQPC94k7TE1UGC
	 sZsSROl9TEyuOENHAn+IH/j+Ptbg+yZf1yyIQIdxzMCVwZ3wfHpwsUOQhkKMSCRI5+VDr
	 GN0esTvbMCOSx6a+9iEYVwZ69KWSjsZhzwYO1WjHHtzJQx/rEf39HfXIjG0lmrDF5yCep
	 wYCFBUhv3vA7PmrciuC+WlRD33kreRIG7dzF0NIuCsgtiB/iQY1rfo20cr+ihJIUxK8ns
	 H4C9CfqvuYATfjk2nUQbb3J8sYS3wKVGsAZFxGPS7BuyZhjIm67joTBpB19FR4ob7Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FC1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-81c1dde0219so5621076a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506821; x=1793111621;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5k5yhn0VmTXKeRBJWIm7k2IXEUpSUMCZ2YdMJhwf2m8=;
        b=D8S7I6dfH++fLnS+bKLzzpjXsfXEDz8ltWbuMuval5zRMTPcagb3IgviBrPnEWoYwO
         MXsTA49s+5WtigDWkrIPqL4T+c7iDBQmlUVE6rAcHjiErALz7VonHYm/F6daO/ja7x7e
         B6ZfpM+2dzEus9WpXuqK5wB40WiFE+kWL54+J424jiZGWBXzXlHdTERXHJWmc74uaGh2
         6XiXCLQ/n8/zsa+qunQqafq1OvPdXsZhI71ErQRzBKw2cyjhPYJHnnWlqUMtTVYyOVej
         aIKWCL7lefCF03RXwyW21Lfmn9OkXs0muxUhFPxaHNx1iwqWI710PrRf2eTDRU7uVMfA
         Oxmw==
X-Forwarded-Encrypted: i=1; AKwUvBwASbn8yNKV7tE+FE4dfBkGwWZSrA6A5fP250CXI0MKuYBbh1uSv8+DDiuJLXAC3qIIr37rntJ1mDNs3y8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVpN6ERQL/lI25Pn0luwBsipEnEujBau7MyE8aBw5mNNoF39Q7
	9XaZWa68FFY6LKLDwnuXLiepKX2qqkh7pE8Qo1H1V5+S0YdO9q26m8aaxoga/j621bn8YAGp7vt
	/jQ9UyiHFPihyK7hqznZMErCyHLBimXQ64wkuOJR3htPkRzPZ9JkGdwAEaAs=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2207:b0:4f5:77f:5 with SMTP id
 5614622812f47-53cd14eb3fbmr8311002b6e.41.1792506821602; Tue, 20 Oct 2026
 07:33:41 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:33:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad77bc5.3270bda1.2a227.0001.GAE@google.com>
Subject: [syzbot] [greybus?] WARNING: ODEBUG bug in gb_operation_put
From: syzbot <syzbot+61464b62b688791cc24c@syzkaller.appspotmail.com>
To: elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    893584e7e390 Merge tag 'usb-serial-7.4-rc1' of ssh://gitol..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15d65da9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f0127eb11110629
dashboard link: https://syzkaller.appspot.com/bug?extid=61464b62b688791cc24c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17d7c621580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12828121580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7fc735ea948d/disk-893584e7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/546995671e2c/vmlinux-893584e7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54ff06887775/bzImage-893584e7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+61464b62b688791cc24c@syzkaller.appspotmail.com

greybus greybus1: 0/0:0: synchronous operation id 0x0003 of type 0x14 failed: -71
------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff88811ce2bad8 object type: timer_list hint: gb_operation_timeout+0x0/0xe0 drivers/greybus/operation.c:1211
WARNING: lib/debugobjects.c:629 at debug_print_object+0x198/0x2b0 lib/debugobjects.c:629, CPU#1: kworker/u8:1/33
Modules linked in:
CPU: 1 UID: 0 PID: 33 Comm: kworker/u8:1 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Workqueue: greybus1:0 gb_operation_work
RIP: 0010:debug_print_object+0x1a5/0x2b0 lib/debugobjects.c:629
Code: b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 4f 48 8d 3d f8 be 37 08 41 56 48 8b 14 ed 40 cf d2 87 4c 89 e6 <67> 48 0f b9 3a 58 83 05 d2 16 33 08 01 48 83 c4 18 5b 5d 41 5c 41
RSP: 0018:ffffc90000237868 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffc90000237950 RCX: 0000000000000000
RDX: ffffffff87d2ce80 RSI: ffffffff87d2ca20 RDI: ffffffff8b1aa8a0
RBP: 0000000000000003 R08: ffff88811ce2bad8 R09: ffffffff87ad4ea0
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffff87d2ca20
R13: ffffffff87ad4ee0 R14: ffffffff861dd740 R15: ffffc90000237968
FS:  0000000000000000(0000) GS:ffff8882684d7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f27a5b70220 CR3: 00000001176ce000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1171 [inline]
 debug_check_no_obj_freed+0x4da/0x630 lib/debugobjects.c:1201
 slab_free_hook mm/slub.c:2679 [inline]
 slab_free mm/slub.c:6509 [inline]
 kmem_cache_free+0x398/0x650 mm/slub.c:6636
 _gb_operation_destroy drivers/greybus/operation.c:682 [inline]
 kref_put include/linux/kref.h:65 [inline]
 gb_operation_put+0x1b2/0x3c0 drivers/greybus/operation.c:694
 gb_operation_sync_timeout+0x193/0x220 drivers/greybus/operation.c:1172
 gb_operation_sync include/linux/greybus/operation.h:203 [inline]
 gb_svc_pwrmon_rail_count_get drivers/greybus/svc.c:137 [inline]
 gb_svc_pwrmon_debugfs_init drivers/greybus/svc.c:772 [inline]
 gb_svc_debugfs_init drivers/greybus/svc.c:827 [inline]
 gb_svc_hello drivers/greybus/svc.c:875 [inline]
 gb_svc_request_handler+0x515/0x1250 drivers/greybus/svc.c:1276
 gb_operation_request_handle drivers/greybus/operation.c:243 [inline]
 gb_operation_work+0xb7/0x990 drivers/greybus/operation.c:280
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	lcall  (bad)
   8:	df 48 89             	fisttps -0x77(%rax)
   b:	fa                   	cli
   c:	48 c1 ea 03          	shr    $0x3,%rdx
  10:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  14:	75 4f                	jne    0x65
  16:	48 8d 3d f8 be 37 08 	lea    0x837bef8(%rip),%rdi        # 0x837bf15
  1d:	41 56                	push   %r14
  1f:	48 8b 14 ed 40 cf d2 	mov    -0x782d30c0(,%rbp,8),%rdx
  26:	87
  27:	4c 89 e6             	mov    %r12,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	58                   	pop    %rax
  30:	83 05 d2 16 33 08 01 	addl   $0x1,0x83316d2(%rip)        # 0x8331709
  37:	48 83 c4 18          	add    $0x18,%rsp
  3b:	5b                   	pop    %rbx
  3c:	5d                   	pop    %rbp
  3d:	41 5c                	pop    %r12
  3f:	41                   	rex.B


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

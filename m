Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281122;
	b=IgG5eu/oLUZdDyK8JetGaE/fVbjT7/mnmQyw+UbGbu/BLet1+HIuMUubpAGmzvGv2D0V
	 tMLrDXuD7mrka7OquMaqJpSdK+24G6eDiE9dYS1DkHkCr50KeR0qCv10HKfvnd6qJtBc8
	 JmSdRYlUSQwzzMTU3mk5hMSl5bhvPBq58b9HaxSVwjTRr+4EOG+14xkKzVImWbDG1uEW+
	 +zkfZcPJ07HWAWxowCTH90qzF6Pk5aMANwAuimG17WaCP704kGDFiT5Ys90CoM/N93M6B
	 RBm1gqPkK3JVpfEIHAqybocwOOHlybZD0lwRXhZp8rbzA2Y2Uvee4hiWKaD4CE0zfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281122;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=sDVeiRDeiSS1j+gt5p+yJjcaKxTQtcrhUFgeEvI6Upk=;
	b=U5gOn7xxIKHuUsQwOLz364rU16Gc7ydRz43fox5DQrtgq4hSxWwKhRwgPZZ5yzsaNNb7
	 tBI6WZAttYT32itKNrQ1tLlI0Qghf/aFKmifieLy7CKJ57aZQSVVWVmS2lvf7EgFD48u6
	 RqE0h7F5tEMeajQCs9wVGlNQfAMlRcgnBqyeYxzFR/GtEaTRokeVCm/BqncMpE4TWA7Bd
	 ODmgaqEGcg1fGkltCcQVpwkdGjbQrVEUWcQ1QixES0KDR5fvXqLO+aqt8eW9lOYsuSKms
	 cT4HlJyoHVPPtfRY81s6aCRYcltMSc3XSEtWeMtC4u8Vx2UlUx3VWI+fY6U7gMMFEow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA80606AADA
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA80606AADA
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54213290993so1897027b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281121; x=1793885921;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDVeiRDeiSS1j+gt5p+yJjcaKxTQtcrhUFgeEvI6Upk=;
        b=iCteasd6qDszCPuvDSIufAX3gpxiY+kJhe/0wz42Xz1ytQ5aOXiBoMlT+SqGdN51d6
         H4ajqszUoixORev7/nfprJhoRlwHjD2WE1yEJfBLt5Fx/UVLHFL7yYKW7ZxkQksJ6HPi
         PvhRfOVloZWPOeAJ4+QIltNN6yWjuRn/scAZB95gaqINvzOtz20S3unva5+uKdqvY9Tx
         cCFcgMVoLrvemCdRgS+/UcWCEza1C6e4aHppSdsnPvVbLRKydgIzmwB9bYL7BSPZ8reM
         6BtRAUgVFhD8OcL0k5ucFXbv+7UxnXeVcARp4v7Wm5wacsOv0299GLYoF9+YqDgzvlon
         CPbw==
X-Gm-Message-State: AFq9FYIkisDinjuSTxh3VEsCnbHr6XeXBGvaHcHw2dMMtorMJbFokkQu
	8RLx1E0DpwFmVyyzov9FPO6p7fihsBWf/ObZtQcKkzJznCoF56ie6O4SfBAFkK6S3hkooJj4Xme
	iwDcTheRkbtwgkhLKa0BjwfvZvmbRyQSPfDWyZVMbz2qSPGZJ6Q5A1FI24d4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c236:b0:4cb:f21c:a795 with SMTP id
 5614622812f47-563a264a36dmr3649885b6e.29.1793281121671; Thu, 29 Oct 2026
 06:38:41 -0700 (PDT)
Date: Thu, 29 Oct 2026 06:38:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae34c61.bc88765f.313a3f.00b3.GAE@google.com>
Subject: [syzbot] [kernel?] general protection fault in __cpuhp_state_remove_instance
From: syzbot <syzbot+08318698e045b4b85f51@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    330517c63aa9 Merge tag 'char-misc-7.4-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13561459580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b03c85f3988bfcd5
dashboard link: https://syzkaller.appspot.com/bug?extid=08318698e045b4b85f51
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1062d695580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15236fcd580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-330517c6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ecb230491807/vmlinux-330517c6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ace3132a7acc/bzImage-330517c6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+08318698e045b4b85f51@syzkaller.appspotmail.com

md: array md0 already has disks!
md/raid:md0: not clean -- starting background reconstruction
raid456_cpu_up_prepare: failed memory allocation for cpu0
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 6024 Comm: syz.0.22 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__hlist_del include/linux/list.h:1045 [inline]
RIP: 0010:hlist_del include/linux/list.h:1059 [inline]
RIP: 0010:__cpuhp_state_remove_instance+0x227/0x5f0 kernel/cpu.c:2573
Code: 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 78 03 00 00 48 b8 00 00 00 00 00 fc ff df 4c 8b 65 08 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 4c 03 00 00 49 89 1c 24 48 85 db 74 28 e8 51 1f
RSP: 0018:ffffc90003c7f890 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81c9fb54 RDI: ffff8880287a8440
RBP: ffff8880287a8438 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffffffffffffffff R14: 0000000000000004 R15: 0000000000000003
FS:  00007fcd283f56c0(0000) GS:ffff8880d45b4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b30324228 CR3: 0000000037605000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 cpuhp_state_remove_instance include/linux/cpuhotplug.h:480 [inline]
 raid5_free_percpu drivers/md/raid5.c:7541 [inline]
 free_conf+0x238/0x710 drivers/md/raid5.c:7554
 setup_conf+0xd80/0x2a20 drivers/md/raid5.c:7885
 raid5_run+0x1260/0x1670 drivers/md/raid5.c:8129
 md_run+0xc2f/0x2510 drivers/md/md.c:6779
 do_md_run+0x36/0x660 drivers/md/md.c:6880
 md_ioctl+0x27e6/0x36c0 drivers/md/md.c:8515
 blkdev_ioctl+0x5ad/0x6f0 block/ioctl.c:798
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcd2759f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fcd283f5028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fcd27825fa0 RCX: 00007fcd2759f559
RDX: 0000000000000000 RSI: 00000000400c0930 RDI: 0000000000000003
RBP: 00007fcd27636b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fcd27826038 R14: 00007fcd27825fa0 R15: 00007ffd1d32f288
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__hlist_del include/linux/list.h:1045 [inline]
RIP: 0010:hlist_del include/linux/list.h:1059 [inline]
RIP: 0010:__cpuhp_state_remove_instance+0x227/0x5f0 kernel/cpu.c:2573
Code: 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 78 03 00 00 48 b8 00 00 00 00 00 fc ff df 4c 8b 65 08 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 4c 03 00 00 49 89 1c 24 48 85 db 74 28 e8 51 1f
RSP: 0018:ffffc90003c7f890 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff81c9fb54 RDI: ffff8880287a8440
RBP: ffff8880287a8438 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffffffffffffffff R14: 0000000000000004 R15: 0000000000000003
FS:  00007fcd283f56c0(0000) GS:ffff8880d44b4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcd283d3ff8 CR3: 0000000037605000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	00 fc                	add    %bh,%ah
   2:	ff                   	lcall  (bad)
   3:	df 48 89             	fisttps -0x77(%rax)
   6:	fa                   	cli
   7:	48 c1 ea 03          	shr    $0x3,%rdx
   b:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   f:	0f 85 78 03 00 00    	jne    0x38d
  15:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1c:	fc ff df
  1f:	4c 8b 65 08          	mov    0x8(%rbp),%r12
  23:	4c 89 e2             	mov    %r12,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 4c 03 00 00    	jne    0x380
  34:	49 89 1c 24          	mov    %rbx,(%r12)
  38:	48 85 db             	test   %rbx,%rbx
  3b:	74 28                	je     0x65
  3d:	e8                   	.byte 0xe8
  3e:	51                   	push   %rcx
  3f:	1f                   	(bad)


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

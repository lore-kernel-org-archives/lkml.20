Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793557529;
	b=dnLXNPZoQWgzT/wvWNRDZ9+5mnGHE5y4asqmWcYxMLMsCSBMZieoT5VldgLqakWvKpxe
	 kekEQ1LZhCjwb7qP8A97239edvCYWLiW5Ssv65evqVGS6LostsISuWd2xvMy7PagC35VB
	 mudRC9cMzesIjUDKxEGYaiX528I5p7AeoLXYzNPK7KpkEuJEi6GkJuruCtgZYXQ366ZPk
	 46Z6POmiYiX3w03t5N+19wzuLFuTT8iwZWhdga2Fd3DYDhZ6lMCvKqApPB0dgSQBn7L0o
	 8vpVQ0lgnL1Qos4fjOmx9Fg6SLY0S+D/7gQNDNoqZu+o/cHrFxtfjX6EkE0Tz5slGiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557529;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=/0Lr19vplzCZOi4BIjIOhosAo/z3alkdeJXutRk7xYU=;
	b=nJ0eGVMiYfpUIroQNlXMXaYK2KpS5lbpzLhrS7/5lmwTGiGf8f+A7YSUUGJ11GH33U68
	 t6cIemOE3I3a35Jrdso9h5ZfjGNJDZhh7hCQtCrULxnFLyhJMSoZX0vvgepgwR/iA7Ka2
	 1ZoNL2UGITfaaVDB9rMpe0MxzIP275bR1UtLeiEjEgKaNV7D406ganfBD7bBQTFO1EAd7
	 MYjQioK+dBKTQYb7dD8B0+GKpQl/f14dVPUOINpf0m2ZjpmCV12uSL+ReJnTjFJc3XHPa
	 vYroUpZRvZ3u/R4S7C70lQJKFKLymV6GaD9L7GYVbFJ6hoqF8nOivaqrzRc6yeguGoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C24606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C24606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2d1eb484aso3142675b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793557528; x=1794162328;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0Lr19vplzCZOi4BIjIOhosAo/z3alkdeJXutRk7xYU=;
        b=rBOfT15S/YBIYuKctC19E4UgwggJtdUfn7/V+bkL7Jfc0EL1aiDzxxQs0ljQ7VYoIP
         zC/rAA58WvRj8c9kVmMNVkWRrhsyMaya/EH2j8+3hAQ8r+9XetH60ysX9MTKI8plBZLs
         +34ytBdv+Y4/OJDNGbJIYqIfeFJpPF4kmVTp7mGXDZB2N//5TdnyaoJ41kTHadt9jK32
         9XuvQzL4AA/RtQWeWPuq+GRV75dP5qZnw25Fbsl7XN22j6ao6Z9YjHJuv4ZcuLdTm6wb
         aqLfGH2rGGs0YNMGFqUCeBNYVKZy8lwz/Bgkq9/2q5tjxidbtXZGwTzd43dzSUTohff1
         eiWw==
X-Forwarded-Encrypted: i=1; AKwUvBzSN8wPw5ZoAOTtVo+T1wgfW4O/O7U+CFs1D7GHGnkgac1B7nybfRF28kIM0ZgL+GKczMWTcNXOwtH5azI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzIckizplRpAp9cEuemV3vdldROGPfBBiZL/JNRu1gx11ZlA4/
	VQLIAJljRut0gNJUMTAFlgJxBHiyoiMLOSsniv2nOAHKltIyy2oFEW3HodnA3PyNJtzVc9xDF1D
	9dKIkGo1GmrcXmOSrWwfCQF5imYwOEGsJlp2wCNcqgFiY5yzBDmf5Rx7sxvQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2c6:b0:557:4340:4d47 with SMTP id
 5614622812f47-5640ddc4293mr5175214b6e.35.1793557528456; Sun, 01 Nov 2026
 10:25:28 -0800 (PST)
Date: Sun, 01 Nov 2026 10:25:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae78418.6552420f.2a0efc.005a.GAE@google.com>
Subject: [syzbot] [io-uring?] WARNING in io_sq_thread_stop
From: syzbot <syzbot+675af112519ca34f5502@syzkaller.appspotmail.com>
To: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bd5c762ac051 Merge tag 'scsi-misc' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=176b0981580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27aa0e260943f70b
dashboard link: https://syzkaller.appspot.com/bug?extid=675af112519ca34f5502
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1096ccb1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1496ccb1580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/63d7454ecf30/disk-bd5c762a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/07607d1cf7ed/vmlinux-bd5c762a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2eb94eb9d0af/bzImage-bd5c762a.xz

The issue was bisected to:

commit 22d9db9fd64a493525d692b32c556875b7254665
Author: Jens Axboe <axboe@kernel.dk>
Date:   Fri Oct 30 13:27:28 2026 +0000

    io_uring/sqpoll: don't attach to a thread that is canceling

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1024562d580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1224562d580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1424562d580000

AI-generated root cause summary:
When an io_uring SQPOLL thread terminates prematurely (e.g., due to a fatal
signal), io_sq_thread() sets the IO_SQ_THREAD_SHOULD_STOP bit in sqd->state
before exiting. Later, when the ring is cleaned up during io_ring_exit_work(),
io_put_sq_data() calls io_sq_thread_stop(), which checks
WARN_ON_ONCE(test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)) under the
assumption that the stop bit is not yet set. This causes a benign WARN_ON_ONCE
to trigger; subsequent cleanup proceeds normally without leaking memory or
corrupting state.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=675af112519ca34f5502

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+675af112519ca34f5502@syzkaller.appspotmail.com
Fixes: 22d9db9fd64a ("io_uring/sqpoll: don't attach to a thread that is canceling")

------------[ cut here ]------------
test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)
WARNING: io_uring/sqpoll.c:88 at io_sq_thread_stop+0x17e/0x1a0 io_uring/sqpoll.c:88, CPU#0: kworker/u8:2/48
Modules linked in:
CPU: 0 UID: 0 PID: 48 Comm: kworker/u8:2 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Workqueue: iou_exit io_ring_exit_work
RIP: 0010:io_sq_thread_stop+0x17e/0x1a0 io_uring/sqpoll.c:88
Code: c6 05 cb df e9 0b 01 48 c7 c7 a0 da ea 8b be 26 00 00 00 48 c7 c2 e0 da ea 8b e8 dd 05 ce fc e9 4f ff ff ff e8 e3 d8 f2 fc 90 <0f> 0b 90 e9 e1 fe ff ff e8 d5 d8 f2 fc 90 0f 0b 90 e9 6e ff ff ff
RSP: 0018:ffffc90000ba7890 EFLAGS: 00010293
RAX: ffffffff84d5061d RBX: ffff888030ac3400 RCX: ffff888022291f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10061586ab R12: 0000000000000001
R13: 0000000000000000 R14: ffff888030ac3550 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888124718000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055556aef1340 CR3: 000000003f44e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 io_put_sq_data+0x8a/0x150 io_uring/sqpoll.c:105
 io_sq_thread_finish+0x1fd/0x240 io_uring/sqpoll.c:130
 io_ring_ctx_free+0x2d/0x5e0 io_uring/io_uring.c:2322
 io_ring_exit_work+0x5b1/0x640 io_uring/io_uring.c:2658
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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

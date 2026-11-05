Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860291;
	b=YeDOHcwb/FUstb9jjxc/MBApmvNxOysphvotORZWo6oiB+EnhGsaP+9WEF7rrp6rXpio
	 bx3XmNoGiPBdNsm22h7O72eGn+SuVglzeIp6eY1R8c3r76Ou4QdzC6Favxy0XJ4cAqteI
	 UKxJXtUnZu1Wc/4P0BgjFOIvj7EPZwredUi28EKJHFkKXgP+81DfGYGltXgAvftsrbVNf
	 YzrDvjLm7SmCIMBe9cTGBJE1OX8zMbWykLGlfwHfOOpeTfmjtxvX/P+rkHqHjAlf2ODAs
	 bAYgu3NuPSiZEdqmnD2kd5fKHz40QcLukAIoamq0gDXZQTSKVnFGc/FPViSqu2LddQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860291;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=D6s83uRLvWaDuibFiKgkLxq0xYjS1L45DJwLaob00q4=;
	b=GTONlZKn/q0nfiFBXaCEX0/9sqRAsweTyjIUnuIttVT3G/ZVpcQyJrMSFu3xycRkrAk2
	 Dn7vW53HXFBr+Dn9Wguu+kL4zeosJrAnh8Ivz/pX6WOFRoISWM0lCaybm10C4n9Sm76k1
	 zHTesvhZc7s1PxAnwfcNABsT5qegVts8XVLv7ygtCpxNm0rdTSGp6jiMC+KrRbPpBPTxx
	 lD9NE68L3YcSVcbs2rpdlGmGw+Kxj0/OwAMU3wOcm9hG9nzIevzQW2LswkBWXZxSbPGG6
	 j5vokGkFl4q91d7+c1f3PyrwXkUalSDIw7UE0yU9a96A9umhyTETtgb7TKdK6iV1hXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8D1606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC8D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4f3f1adebb0so566814b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793860289; x=1794465089;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6s83uRLvWaDuibFiKgkLxq0xYjS1L45DJwLaob00q4=;
        b=duEtanDVBwEb0rmcISWik3kixduI26ccdW/vwMy+Y6eFLuht0Cj1b1nP02872tRfzE
         cAA/sLxgEG4tUQ3CbZdfl8V1G8q/6eucjijxnOcheOJL74AObG0bx4pQ2wDAzdIU5msb
         x/bckewnp5U4Sfw0sJC8CJdVHVD3LJWUomkMRl8zKwgHVwvBkgRUsZtEc+4wlejw+85/
         5A2Y88R6myrs4CZCApnmaEwS8HY/chviJ88dAOYCddJQa0mW57MySh2DI1o76zBo69Ld
         MNNuiw3w70kDVvVuNWOkT+X/ynbY+sTRCeOKtmxWmaL9UfSz76hwYKFKIR4XtBmRmSwg
         aflA==
X-Forwarded-Encrypted: i=1; AKwUvBxfNM4DYWVzch9JotTLvi2d/bIBWW5rHKgcSvfdb62/KILNKCHsH8k/93/7+LI5Hxgqi+PjRK9C06MaVt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u0jYQ5E6U8KTOeTMi2hH0/BY81UYO8EohjSm316lf5atPU+gy
	+plopncmuuIOqyDkM9eKrrKz4eFMdtcAqTG180sjQnzb+753sEgHhyreR/rN6kPlUI/l4dTODPa
	0auDy2MyyO0jKw3KgTbOvA0LWwBMefc4M4bvaFhdlMDv2fwKVhj8BWNugkdQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f88:b0:4f5:c4b9:dbfa with SMTP id
 5614622812f47-5640ddc160amr12936941b6e.48.1793860289651; Wed, 04 Nov 2026
 22:31:29 -0800 (PST)
Date: Wed, 04 Nov 2026 22:31:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec22c1.21d05368.325ed5.0005.GAE@google.com>
Subject: [syzbot] [io-uring?] WARNING in io_put_sq_data
From: syzbot <syzbot+9f32706bfd7c4ff81434@syzkaller.appspotmail.com>
To: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    36aad21d50d1 Merge tag 'ksmbd-for-7.4-rc1-part2' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13ebf981580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd712e5dbce1d1a0
dashboard link: https://syzkaller.appspot.com/bug?extid=9f32706bfd7c4ff81434
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-36aad21d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f5ef884eedc9/vmlinux-36aad21d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e4771aa5ca4/bzImage-36aad21d.xz

AI-generated root cause summary:
In io_uring/sqpoll.c, io_sq_thread() sets the IO_SQ_THREAD_SHOULD_STOP bit on
sqd->state when the SQPOLL thread terminates (e.g., due to a fatal signal) to
prevent new rings from attaching during cancelation. However,
io_sq_thread_stop() still contains an assertion
WARN_ON_ONCE(test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)) under the earlier
invariant that only io_sq_thread_stop() ever sets this bit when rings release
their references. When the ring is subsequently torn down during process
cleanup, io_put_sq_data() calls io_sq_thread_stop() on the already-stopped sqd,
tripping the warning.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=9f32706bfd7c4ff81434

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9f32706bfd7c4ff81434@syzkaller.appspotmail.com

------------[ cut here ]------------
test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)
WARNING: io_uring/sqpoll.c:88 at io_sq_thread_stop+0x18b/0x1c0 io_uring/sqpoll.c:88, CPU#2: kworker/u33:12/1172
Modules linked in:
CPU: 2 UID: 0 PID: 1172 Comm: kworker/u33:12 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: iou_exit io_ring_exit_work
RIP: 001qemu-system-x86_64: warning: 9p: degraded performance: a reasonable high msize should be chosen on client/guest side (chosen msize is <= 8192). See https://wiki.qemu.org/Documentation/9psetup#msize for details.
Code: 48 c7 c2 c0 cc 80 8c be 25 00 00 00 48 c7 c7 20 cd 80 8c c6 05 29 56 22 0d 01 e8 f0 3f b8 fc e9 12 ff ff ff e8 36 a9 dd fc 90 <0f> 0b 90 e9 c8 fe ff ff e8 28 a9 dd fc 90 0f 0b 90 e9 3c ff ff ff
RSP: 0000:ffffc90006627a28 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888052edb400 RCX: 0000000000000000
RDX: ffff888022a90000 RSI: ffffffff852ffcea RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000001
R10: ffff888052edb51f R11: 0000000000000000 R12: ffff888052edb518
R13: 0000000000000000 R14: ffff88806ebfe4e0 R15: ffff888052edafc0
FS:  0000000000000000(0000) GS:ffff888095481000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000057f2b470 CR3: 000000004f385000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 io_put_sq_data io_uring/sqpoll.c:105 [inline]
 io_put_sq_data+0xb0/0x100 io_uring/sqpoll.c:100
 io_sq_thread_finish+0x252/0x320 io_uring/sqpoll.c:130
 io_ring_ctx_free io_uring/io_uring.c:2322 [inline]
 io_ring_exit_work+0x40a/0x9f5 io_uring/io_uring.c:2658
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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

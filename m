Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633785;
	b=sQIY1B1Y8f2omInvcDVfvqqQ/AoUoUGL8F6cYLdc34qLphkiRXNvcwLNC+01KGPK4Etw
	 YjBz2s88TX9RSl2DY5weWopymtLlxhRFgqpNMh2wWEhojiDJtmpUMbcvzJydL/qnmeTj6
	 3agj9ETlZ+E3q1fWy0Zdbmb2UTcLmUf6C4ftjf5hN2reLx1Z+wLFVWCQrNID6sSpl2kog
	 i9PogoOvk6G349dicWlaBRA2snllp2I60CXrAI4rymP2AQVct2kS6Wn7AOQ81HpOPWoOs
	 PferZlBdiUvbzaUCLkDVrUfZ+clSDNTJwxy8NEA2mslDRIUw0d72EPBK2LSqwVketGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633785;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=JssOmerse6tIPNiF9hOfYFsHOXG2slRdb88lB5aCnO4=;
	b=DDD99pjNiuYjurwLNJAg0kFEEG7jWprU43da01SAtV5Pqr3JSXHmx9TaUW8Ry1sxtsxM
	 yfIRUndWLtuIfoXJ3QxASjkXSr35sThcaKDaxxMGmilZ0/UDeduAGEzzhMMSZ6qb64jD8
	 hjUwo07zJ88QssiZSa+IEdrqfttqvmx3hT/xNjRlD+jp6XiSVjjMz8NdYftT3oMbkZ015
	 hvyULEuHVGVki1UkkSK2EjBgj87wHQwOUvWEi6uhLY4e6Z8YBQLq+H94SDcAMBvubzTgE
	 GB5RW5DU//C0YXY42FrELzq3e2N7d6uSkA4EqUNg22gV68cSIMqPRoxVKtuU13G1ToQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD599606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD599606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2d1eb484aso1772415b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792633784; x=1793238584;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JssOmerse6tIPNiF9hOfYFsHOXG2slRdb88lB5aCnO4=;
        b=KMyKKHiQhTrQG6MR517iN3LGd15yyIGvV5q+YdU9zgcGXcZnGhBFdhp2lxD+ahUmFL
         nT0+YCHw5rzkhXIyGzCFcBztRwN5vM19qxCUBp/kOgh3YYRYmqDGo4/BIQnPlCaNUAOf
         kXih350ewGhvWyxU/9Mc5Gvl2qWqE5hdUfcZ4Az33vgKsgOZt1jMGZOtXAFe2oMOspEC
         Qqa56wWkr7njKxqy0zxJtVdSpWJw4b9g+aCxC2g6o2dMudjk8McPc2FsHhOWxbFvvokk
         MphlDRslalU+OC3KPKj4WxsPxqGpdW1NzZQiGxSbnzik2Y+Na3dZppeJe50B0OhOoA4t
         hWNg==
X-Forwarded-Encrypted: i=1; AKwUvBx9aonwN2jCZ4pdlXFNtYECIa5BxWP5yV0CN9Y8nCEngVeXJBF4F40mvHUaSJEECKcdlpJVTUttIcLQem0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9nqn+bK2XyyYIIXGZU20/2izkkVGNxpuf10VrEv22uPzPbfYY
	p5ZlU4tKrBBYdJ9nxs+izSkjZx2f0Hqeoy1KgPSLXCQW0Uit6pVa879siysSx7RB1HQQ2GUj93V
	IEGrS1+H+7mrUEl2uyheTG36BRThRJkjMZGV99j2+db1SmemhOGIlcGuuTho=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1687:b0:4eb:b0b9:2dbe with SMTP id
 5614622812f47-5535700ff21mr2591872b6e.27.1792633783759; Wed, 21 Oct 2026
 18:49:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:49:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad96bb7.d1c214cc.659fa.0082.GAE@google.com>
Subject: [syzbot] [mm?] KCSAN: data-race in _copy_to_iter / _copy_to_iter (3)
From: syzbot <syzbot+68c0534b26fbda7ed84f@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a804c5742bff Merge tag 'lsm-pr-20261016' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=170e93cd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0a09745349d136e
dashboard link: https://syzkaller.appspot.com/bug?extid=68c0534b26fbda7ed84f
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/171f09113e28/disk-a804c574.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0f8812b149fb/vmlinux-a804c574.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6349a85938ab/bzImage-a804c574.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+68c0534b26fbda7ed84f@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in _copy_to_iter / _copy_to_iter

write to 0xffff88810d40b000 of 1024 bytes by task 12 on cpu 1:
 memcpy_to_iter lib/iov_iter.c:77 [inline]
 iterate_bvec include/linux/iov_iter.h:123 [inline]
 iterate_and_advance2 include/linux/iov_iter.h:306 [inline]
 iterate_and_advance include/linux/iov_iter.h:330 [inline]
 _copy_to_iter+0x605/0xea0 lib/iov_iter.c:197
 copy_page_to_iter+0x174/0x210 lib/iov_iter.c:374
 copy_folio_to_iter include/linux/uio.h:204 [inline]
 shmem_file_read_iter+0x29c/0x4a0 mm/shmem.c:3391
 lo_rw_aio+0x6a6/0x760 drivers/block/loop.c:-1
 do_req_filebacked drivers/block/loop.c:-1 [inline]
 loop_handle_cmd drivers/block/loop.c:1949 [inline]
 loop_process_work+0x569/0xac0 drivers/block/loop.c:1984
 loop_workfn+0x31/0x40 drivers/block/loop.c:2008
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x53f/0xa10 kernel/workqueue.c:3479
 worker_thread+0x569/0x750 kernel/workqueue.c:3560
 kthread+0x223/0x270 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

read to 0xffff88810d40b000 of 512 bytes by task 13858 on cpu 0:
 instrument_copy_to_user include/linux/instrumented.h:130 [inline]
 copy_to_user_iter lib/iov_iter.c:24 [inline]
 iterate_ubuf include/linux/iov_iter.h:30 [inline]
 iterate_and_advance2 include/linux/iov_iter.h:302 [inline]
 iterate_and_advance include/linux/iov_iter.h:330 [inline]
 _copy_to_iter+0x130/0xea0 lib/iov_iter.c:197
 copy_page_to_iter+0x174/0x210 lib/iov_iter.c:374
 copy_folio_to_iter include/linux/uio.h:204 [inline]
 filemap_read+0x3f8/0xad0 mm/filemap.c:2875
 blkdev_read_iter+0x21e/0x2d0 block/fops.c:838
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x699/0x7c0 fs/read_write.c:574
 ksys_read+0xdc/0x1a0 fs/read_write.c:716
 __do_sys_read fs/read_write.c:725 [inline]
 __se_sys_read fs/read_write.c:723 [inline]
 __x64_sys_read+0x40/0x50 fs/read_write.c:723
 x64_sys_call+0x2135/0x2550 arch/x86/include/generated/asm/syscalls_64.h:1
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 13858 Comm: udevd Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
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

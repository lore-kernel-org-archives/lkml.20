Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642819;
	b=cdNNiffmsSjvRpud7q/eaLz4KpKcJspT+bNtLVDO5E6KXKEf/mtpdrkJhKZtOcf2D8Um
	 Xvhxi5gkjqIRZVVq3JXIV0POUUWJ4gedOHAitUN15oEj9MUtx8xlZX1eLIwIZBP6WkIoT
	 iM/C8NmrNbenEV2FTDqrR+HXuOwUY6vc+nFuKMLqA+MSKH9c4pilpqQVDYlxlRy5s/bul
	 XM42iKbk1eVH/H630ffWnF1KegP11QCyI67Q+Ew0IVMGLCIP34NsnprQKcpO2zk/yAAND
	 eu3j3NuK4H0dtJ3+jcVRT6FZBI48e4w6Pgj85qx6dasc63dIRI39H3wNQmvpWFuDtwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642819;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=r4DsVmhEAhzMsYDrOpx+P90QR124Jp6lr98wj7KvrTk=;
	b=QjEEA1UhZj7TiTIP0PHT2WaFVnuqibH/7qC8dxhIU7SLgV+9DKXxo1sngLxdFVFoWOX5
	 ZTqoMYj6kjJN4XDn2wYvwVS3yhfNtLWGFfPFM8GAAfPZxfHwO7d+jTzgUW6xhbuefJY0f
	 dBSpNq/osVRLLYa3pWp1L4yVqob2K+WKrMW09Q8MDZz87ABiq+7qnKRCCYq7lfgHQuO9V
	 8ChM1r2nAwlt7yufT8wKrZ/VX8YtGX1rlBGhgDCCEMkBxzUcOr3u7d0Tb7AbMb3Uv15Sc
	 1agMl07IfjfR3H5I4JAQBzDrHOppd4/7R3PIO7gevR1Hk1Hk5wQvQeFp9ZDi4pBYSjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21BF606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D21BF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab8b4887d4so1220725b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642818; x=1795247618;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r4DsVmhEAhzMsYDrOpx+P90QR124Jp6lr98wj7KvrTk=;
        b=P19whcjV5KFAQ8HRvUcV0CDfqwGFQt9lbkGJnAlmdmc1n3+POn05URnJ0UuUr702gS
         kCsxLRIEFYxaUSUPLRy/SOVIQV0uYTU1YdvoqSEn+oi0H+M2NTIkNLxd5QhRuJuH5DTn
         06+m9DC3s1qE/oUg4NGRGEkRbZiPi0H9xkfEyTZ1Sy8DCwAUqR6jWRjjglD0jns9wxlr
         WSdIIrMAgkDQBxZm3Rv8POJ7+09ZfjXNEEXLiL1xRD+4ofQ9Ml15OxwOe8PDbqWXdChm
         MfR8BKboCYmYEqC3kTcJ8X0rVuBqeB8XKJnbmGPnjxUbkQWq0YeSV/avQe99GzrTt4uz
         OQ7Q==
X-Forwarded-Encrypted: i=1; AL+hErGfnRWncsClBKSqSQtorWprASjswqf2luzJHD6/tb/ptA4Jpf+LgNYroMYJmN6HrXyGX1+QucRZr2chSWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ot42upJifxhwK7MZWqzoq2grm/Kj4K1N1oc/00oTrT74RIh2U
	SgJECQrKF+OGHQ8fSXbfalgAW19ARhy4NVIkCEr39rskvdpajTNW9tlPVaHnIBOAN+ppQkL1A66
	OF7d+UDrzGsb66+PU8g0CJeUSWbOZFqMxLnZDx1ZAP3Jv5DQ8HOo+z+RheAY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:320d:b0:4d6:90f3:74b1 with SMTP id
 5614622812f47-56e650088a6mr3675079b6e.49.1794642817893; Fri, 13 Nov 2026
 23:53:37 -0800 (PST)
Date: Fri, 13 Nov 2026 23:53:37 -0800
In-Reply-To: <6a88e8f5.91706f20.16b6e3.02ad.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af81381.7750847f.3ad41e.0031.GAE@google.com>
Subject: Re: [syzbot] [block?] WARNING in blk_mq_dispatch_rq_list
From: syzbot <syzbot+49b69d460fb5134ee1d7@syzkaller.appspotmail.com>
To: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    ad3fc05c7e65 arm64: suspend: Only track cpuidle context fo..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11a6964d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e8e6c1701ad8af2
dashboard link: https://syzkaller.appspot.com/bug?extid=49b69d460fb5134ee1d7
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14809bed580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+49b69d460fb5134ee1d7@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: block/blk-mq.c:2131 at blk_mq_dispatch_rq_list+0x960/0x13a8 block/blk-mq.c:2131, CPU#1: kworker/1:1H/4531
Modules linked in:
CPU: 1 UID: 0 PID: 4531 Comm: kworker/1:1H Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Workqueue: kblockd blk_mq_run_work_fn
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : blk_mq_dispatch_rq_list+0x960/0x13a8 block/blk-mq.c:2131
lr : blk_mq_dispatch_rq_list+0x960/0x13a8 block/blk-mq.c:2131
sp : ffff800099cf77e0
x29: ffff800099cf78c0 x28: 0000000000000000 x27: ffff0000c8f66880
x26: 1fffe00019214142 x25: ffff0000c90a0a48 x24: ffff0000c8f66800
x23: dfff800000000000 x22: ffff0000c90a0a10 x21: ffff800099cf7a48
x20: ffff800099cf7a40 x19: ffff0000c8f66948 x18: 0000000000000000
x17: 0000000000000001 x16: 0000000100000000 x15: ffff80008b586000
x14: ffff80008bdbe7b0 x13: 0000000000000002 x12: 0000000000000000
x11: 0000000000000000 x10: ffff70001339ef12 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff80008b769280 x4 : 0000000000000000 x3 : 0000000000000010
x2 : 0000000000000000 x1 : ffff0000d25c5880 x0 : 0000000000000000
Call trace:
 blk_mq_dispatch_rq_list+0x960/0x13a8 block/blk-mq.c:2131 (P)
 __blk_mq_sched_dispatch_requests+0x250/0x10e8 block/blk-mq-sched.c:299
 blk_mq_sched_dispatch_requests+0xa8/0x158 block/blk-mq-sched.c:329
 blk_mq_run_work_fn+0x214/0x2e4 block/blk-mq.c:2556
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
irq event stamp: 156
hardirqs last  enabled at (155): [<ffff80008697a49c>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:219 [inline]
hardirqs last  enabled at (155): [<ffff80008697a49c>] _raw_spin_unlock_irq+0x30/0x80 kernel/locking/spinlock.c:229
hardirqs last disabled at (156): [<ffff800086954060>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:484
softirqs last  enabled at (0): [<ffff800080302e10>] copy_process+0x12d4/0x35a0 kernel/fork.c:2267
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: block/blk.h:723 at req_ref_put_and_test block/blk.h:723 [inline], CPU#1: kworker/1:1H/4531
WARNING: block/blk.h:723 at blk_mq_free_request+0x190/0x210 block/blk-mq.c:849, CPU#1: kworker/1:1H/4531
Modules linked in:
CPU: 1 UID: 0 PID: 4531 Comm: kworker/1:1H Tainted: G        W           syzkaller #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Workqueue: kblockd blk_mq_run_work_fn
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : req_ref_put_and_test block/blk.h:723 [inline]
pc : blk_mq_free_request+0x190/0x210 block/blk-mq.c:849
lr : req_ref_put_and_test block/blk.h:723 [inline]
lr : blk_mq_free_request+0x190/0x210 block/blk-mq.c:849
sp : ffff800099cf7730
x29: ffff800099cf7730 x28: ffff70001339ef0c x27: ffff0000c90a0a00
x26: ffff0000d25c5880 x25: 1fffe00019214143 x24: 1fffe00019214160
x23: dfff800000000000 x22: dfff800000000000 x21: ffff0000c90a0a9c
x20: 000000000000007f x19: ffff0000c90a0a00 x18: 0000000000000000
x17: 0000000000000001 x16: 0000000100000000 x15: ffff80008b586000
x14: 00000000001addca x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: ffff600019214154 x9 : 0000000000000000
x8 : 0000000000000000 x7 : ffff800081839f14 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000818151e0
x2 : 000000000000007f x1 : ffff0000d25c5880 x0 : 0000000000000000
Call trace:
 req_ref_put_and_test block/blk.h:723 [inline] (P)
 blk_mq_free_request+0x190/0x210 block/blk-mq.c:849 (P)
 __blk_mq_end_request+0x32c/0x434 block/blk-mq.c:-1
 blk_mq_end_request+0x68/0x8c block/blk-mq.c:1169
 blk_mq_dispatch_rq_list+0x410/0x13a8 block/blk-mq.c:2153
 __blk_mq_sched_dispatch_requests+0x250/0x10e8 block/blk-mq-sched.c:299
 blk_mq_sched_dispatch_requests+0xa8/0x158 block/blk-mq-sched.c:329
 blk_mq_run_work_fn+0x214/0x2e4 block/blk-mq.c:2556
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
irq event stamp: 186
hardirqs last  enabled at (185): [<ffff800080562850>] seqcount_lockdep_reader_access+0x7c/0xf8 include/linux/seqlock.h:75
hardirqs last disabled at (186): [<ffff800086954060>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:484
softirqs last  enabled at (178): [<ffff8000800204f4>] __do_softirq+0x14/0x20 kernel/softirq.c:703
softirqs last disabled at (159): [<ffff8000800204f4>] __do_softirq+0x14/0x20 kernel/softirq.c:703
---[ end trace 0000000000000000 ]---

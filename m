Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346805;
	b=lYm7Z/yhoP2QuQRNtHYiBxHk1C4XhWbObuIazQT2dYvdgUeoGtGYSwRiAeK04bUNq3x0
	 0lAt5PRLTSFyCT1tPCJocsfSZuLtpEJselg0w6qcd0bcBEFs6JZtb6SW1uyS/wlZrgKdg
	 +7SHyNIBG6sxEyFCNA4IDOs1kyEoTb9G8ac0DtGUVkRgTKFYnD6FBsNnbex37UdaPq/5p
	 H2u01yTQCgO4XX32aYNDQWAj5BQ3vswBnY7CeFNa+SNDHsy70P2WBPg+YFaEBhHnKVfSG
	 F5efzuGpMQNm3DugbbK4FpUa6l8ZFeVUjbbNGrguRjKJLrudnqxoBGjDzf8LWbBYSfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346805;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=b/hH1ZYDaLcFHp1qq1sRgIlCyf+H/Yra0xvbhbI5H7M=;
	b=STM3cwYp+0780EPAL7Ex2w98svuXoyiuNzRL1edw6RcAT9lB1dJna9jPl8ykCx3Rl9SC
	 oLrrEr6WpD9ml/Arxrun3Tg2M14N+QhUqUXOiCTyvTtfcdnIk8kcBtxJRLnI/aCXx03zc
	 sIkrB/ZV97CS7iN3vga8qRzppjLYyJv3cqjgi8qSkW1nI8zbMlaT+SdKxtITflRWgDiC/
	 B+ENigmVd7jHSgge4U2Xw/vOQEwAfTIVojnQXyPqfsW9+qbuF6tg296bwvKvWcmlkZ4RV
	 gHUmD+IVPqjJjPlXmWNblfP0T4/1RIUhQlBZyQLBEwgVyh//xWN49DDGyQWxnVpmhZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9292606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9292606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-547ae874949so3212804b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346804; x=1794951604;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b/hH1ZYDaLcFHp1qq1sRgIlCyf+H/Yra0xvbhbI5H7M=;
        b=TdUUtk4FtMh1rZ52/MNaNFFpAALioeokIXZaeBXhDGJJZYI+MynPmCd2g2+3G1utsw
         BfS7BgkeLKm56eXty3Uv2sEQLcx+YWvYhViaVpJN1UmJw9vOq7KMN2ADVFYilUB1bV9L
         iRbZNvTZCRBAgzGNQz4oVyY3ZsMp03EdH2aXaE02s7iD8X+fX7czRbB+oOkvVwQVJEhU
         J9Nwq1nl4ycQmiO9VbgbeOCSnAkA7FaperlrYvzBYwHZLPV2kLpAweAnfFUF10zrVHln
         AV6AyNdKQTmLrj8vGVr196XUAErA+cbj1rfQPIHSPQnCHxexwFsSZ9qdJXZQ/GS39VEE
         N87w==
X-Gm-Message-State: APuU4Z8ShprRPWFaGz8POkaCpZ9keLxHFVnY0He2VKpCK4zhX6kpiv4T
	Y3UkHAl03inQQ0KNR/CIcTG0GqT4iecxdknyPuwHFrOozFNmj59suaFlJsstEvpG3yQTyPpcZ0E
	1g44/6qmQClSQE4sl3a7jg5cHxVUYbHPuNucOCLebdNO5M/taG1aYWY3Qo9o=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1924:b0:4d6:93c3:1af4 with SMTP id
 5614622812f47-56b973fcd68mr216455b6e.63.1794346803823; Tue, 10 Nov 2026
 13:40:03 -0800 (PST)
Date: Tue, 10 Nov 2026 13:40:03 -0800
In-Reply-To: <20261110171412.287522-1-timo.joannin@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af38f33.17ff5aea.1b027f.019c.GAE@google.com>
Subject: Re: [syzbot] possible deadlock in wg_ratelimiter_uninit
From: syzbot <syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	timo.joannin@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in inet_shutdown

block nbd0: Receive control failed (result -32)
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kworker/u9:0/53 is trying to acquire lock:
ffff888079910fa0 (sk_lock-AF_INET){+.+.}-{0:0}, at: lock_sock include/net/sock.h:1717 [inline]
ffff888079910fa0 (sk_lock-AF_INET){+.+.}-{0:0}, at: inet_shutdown+0x6a/0x390 net/ipv4/af_inet.c:911

but task is already holding lock:
ffff88807468d668 (&nsock->tx_lock){+.+.}-{4:4}, at: recv_work+0x1cff/0x1e30 drivers/block/nbd.c:1029

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #6 (&nsock->tx_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
       nbd_queue_rq+0x373/0xff0 drivers/block/nbd.c:1207
       blk_mq_dispatch_rq_list+0x499/0x1990 block/blk-mq.c:2141
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xd36/0x1580 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x167/0x2f0 block/blk-mq.c:2556
       process_one_work kernel/workqueue.c:3495 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #5 (&cmd->lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       nbd_queue_rq+0xc1/0xff0 drivers/block/nbd.c:1199
       blk_mq_dispatch_rq_list+0x499/0x1990 block/blk-mq.c:2141
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xd36/0x1580 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x167/0x2f0 block/blk-mq.c:2556
       process_one_work kernel/workqueue.c:3495 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #4 (set->srcu){.+.+}-{0:0}:
       srcu_lock_sync include/linux/srcu.h:261 [inline]
       __synchronize_srcu+0xca/0x2f0 kernel/rcu/srcutree.c:1662
       elevator_switch+0x1e8/0x7b0 block/elevator.c:576
       elevator_change+0x2fa/0x480 block/elevator.c:681
       elevator_set_default+0x375/0x440 block/elevator.c:754
       blk_register_queue+0x404/0x4f0 block/blk-sysfs.c:992
       __add_disk+0x6b8/0xdb0 block/genhd.c:531
       add_disk_fwnode+0x100/0x3a0 block/genhd.c:600
       add_disk include/linux/blkdev.h:799 [inline]
       nbd_dev_add+0x733/0xb60 drivers/block/nbd.c:2026
       nbd_init+0x168/0x1f0 drivers/block/nbd.c:2743
       do_one_initcall+0x250/0x870 init/main.c:1419
       do_initcall_level+0x10a/0x1a0 init/main.c:1481
    


Tested on:

commit:         067c5c24 Merge tag 'page_alloc-for-7.4-rc2' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=119221a1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d44b06612b68f56
dashboard link: https://syzkaller.appspot.com/bug?extid=72fceb8393e04ce876d9
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=113f2fa5580000


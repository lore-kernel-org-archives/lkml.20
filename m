Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707EC226D05
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787799664; cv=none; b=rk4qO/Ae6SAilaNNG0Au2oV2m8q++TvKL1yO6xcMHE9U4CVJ+ruUPyfZf6sgx0RF29XzafRLnAqUzx6KQOywtQ3YhWXv7Ddna2ExYe9N/NAK0epi8gxhWzXioJ415HiPst0f1+ReO3sRz/fkfhk5IOatfnQ4NOsKcwkyCpP8nxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787799664; c=relaxed/simple;
	bh=7eUzJnFJoXDOaM9Nst85ClwftpfrAaobisDXNW8rHKY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ci4qviyxNyNtT1fzgmo8+yIK9TVuEhGCkJlWDHWYcy86Qnt10lGcRBmBuNabsW3B21vco9hEReSNR9jH3HmorJARn+gkjZa6GOoryzQyto1SiY+6Wn6teIn+dLZFEVvRBsbVH37mY3aaDgSM70dbmhJT0v06i6sfg3Z2/+YUfzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4959c49e054so1723285b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799662; x=1788404462;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fl7E7i7GHkn3bnTNtFKNvU4d3Nyr9vdhmZ1Dnl09SkQ=;
        b=VXmNrusAwB7Atc/c1CypxY7dlQagtRbXXOJTxmmraOYFNC5btq5FTw+spDNAX7O7/k
         ikqDEV9AuUo4ZuwKYVvZhlYh+LarT7M/aGHyUmOJGflMw1FsQqINLVBWsoZNaALXX9kQ
         itDIATGN+PxSXTJUlvg/WuqI+evzUwi77900HxlAWJjuIAHzFp81U9exLep6XVQqfUqH
         xxT7CHXXZCJ/5MRIrWKb7F27gLvD/w8AZxdktk+kUGsi1mK45SCKe7VI3igBEm0yMol9
         5NrSP/Fg9TFNjCggBf0SkeL5Rip/ZjzdDZfKzlO2BGo4Qft9f0kKUThRt6z8B+1+Rj3l
         7i4w==
X-Forwarded-Encrypted: i=1; AHgh+Rps/oNS49v04mNe335tzvdRiZKuiHqI5rBOaKrYuJr4bx0RU+8eqmDUzYeyU4honOVQKjrQ7zRTJW5GUM4=@vger.kernel.org
X-Gm-Message-State: AFuF++mwrY22xochh+pXEj+NUjlgQ7vEW4YG7/rsuAw3pWd+ihOCwQ5n
	Ka2cSuPHmYbRFndOuRdvzQjiskekWXYkUKCG5EunARqPf66/7buxQFvyTlTq6q+WNopaWbP9ElF
	y4C3EYjYr7NdRverUhh3PAxOrYIYym66aEbcQGAe9OZST4yRpLeahMQ/BHcI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fd3:b0:4b3:880a:f08a with SMTP id
 5614622812f47-4b3880b1addmr141832b6e.15.1787799662266; Wed, 26 Aug 2026
 20:01:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 20:01:02 -0700
In-Reply-To: <20260826224944.1592-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8fa86e.27659fcc.2ceef7.000c.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING: locking bug in tcp_tsq_handler
From: syzbot <syzbot+2d770620059281e225a4@syzkaller.appspotmail.com>
To: edumazet@google.com, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in tcp_tsq_handler

------------[ cut here ]------------
!lockdep_sock_is_held(sk) && debug_locks
WARNING: ./include/net/sock.h:1799 at sock_owned_by_me include/net/sock.h:1799 [inline], CPU#0: kworker/0:0/9
WARNING: ./include/net/sock.h:1799 at sock_owned_by_user include/net/sock.h:1812 [inline], CPU#0: kworker/0:0/9
WARNING: ./include/net/sock.h:1799 at tcp_tsq_handler+0x1a6/0x200 net/ipv4/tcp_output.c:1292, CPU#0: kworker/0:0/9
Modules linked in:
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: wg-crypt-wg0 wg_packet_tx_worker
RIP: 0010:sock_owned_by_me include/net/sock.h:1799 [inline]
RIP: 0010:sock_owned_by_user include/net/sock.h:1812 [inline]
RIP: 0010:tcp_tsq_handler+0x1a6/0x200 net/ipv4/tcp_output.c:1292
Code: 00 97 96 01 e8 fb 15 79 f7 be 02 00 00 00 eb 0a e8 ef 15 79 f7 be 01 00 00 00 4c 89 ff e8 a2 7f 8e fa eb d0 e8 db 15 79 f7 90 <0f> 0b 90 e9 fd fe ff ff 44 89 f9 80 e1 07 80 c1 03 38 c1 0f 8c 07
RSP: 0018:ffffc90000007bb0 EFLAGS: 00010246
RAX: ffffffff8a4e9ad5 RBX: ffff88805ab935d0 RCX: ffff88801defddc0
RDX: 0000000000000100 RSI: 0000000000000100 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000100 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52000000f64 R12: dffffc0000000000
R13: ffffc90000007c20 R14: ffff88805ab93400 R15: ffff88805ab93400
FS:  0000000000000000(0000) GS:ffff888124ce0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe3b037048 CR3: 000000000eb48000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 tcp_tsq_workfn+0x384/0x410 net/ipv4/tcp_output.c:1325
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 bh_worker+0x451/0x870 kernel/workqueue.c:3773
 tasklet_action+0xc/0x70 kernel/softirq.c:997
 handle_softirqs+0x226/0x860 kernel/softirq.c:645
 do_softirq+0x77/0xd0 kernel/softirq.c:546
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x100/0x140 kernel/softirq.c:473
 wg_socket_send_skb_to_peer+0x16b/0x1d0 drivers/net/wireguard/socket.c:183
 wg_packet_create_data_done drivers/net/wireguard/send.c:251 [inline]
 wg_packet_tx_worker+0x1c8/0x7e0 drivers/net/wireguard/send.c:276
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         73e3f071 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15425625580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22381429a4c2735a
dashboard link: https://syzkaller.appspot.com/bug?extid=2d770620059281e225a4
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10bb399e580000


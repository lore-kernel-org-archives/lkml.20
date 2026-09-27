Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4656037205D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790511544; cv=none; b=UlbKCmuFexPNRhY6YQUjafM+It/1Lsr0i6WLYzkNngtnFwkIaPxhHw2wW7bVS3FXpcfV5fX/MT1hfLRxFk5uwatoLQECzyc1bJK3a2IKcdE4m1VKpTpksaGTwps8g5hlP0tPzrqxD6joNABp7hqz7WvzBwh+HBfq9Zmq+KS6MRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790511544; c=relaxed/simple;
	bh=a8n1E2/lMVF1zqBZxT6CmOyrlFh/Zu9ZIDll06CmaEM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JRkXirgl9i3TBV036oxgOXKbBTS7cde6no05kTA9UhTb3KmH0V0GSGAD6+s6Ls1T6mW162UzRukNjqQAA4qQZZ9aOm5UFYAh5Hdw5uwPjc7n9fARkzRxOQMOVnUhPeJ1RTnb+uj7AM3DJRkBn7XK59ngAwrtSCuZ1NCCQx5uKVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28dbf4197so4667949b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790511542; x=1791116342;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gCTWLbJQ8Ce/a5WTqLJ7RH9q86LaM3ig7/K74TA/OjE=;
        b=eisKI+zGojS9dGBG0VBSxmesCCyzD4zCflMl5RGloo/zVes10zKQydRZudLlHBEkme
         PSic8vsk0FlBgfnZ6v/zjd2fQGyB7LkeQEDeYjUcTiIKCMbI9+x//IPUtid2aQ0VwDJF
         sBhrlYaqjVcIs8/7Sr8vT5qFtbj7AaOJZ1DntYLZpXHL1sAEn07LNCZluyHA/HzLBfgT
         tSRBNRhUnt36VzWUyd8JdnWN/HdEV/gljnbjjT1pGN/waqEl36AhfL+1lg0jQdPs/neY
         vwhKvpFSfv1L9nOwe0IXBEVpLjIWZ+F+la6FWemehYKNzYfohFHqJOOd8BlD9ACoyq8O
         nznA==
X-Forwarded-Encrypted: i=1; AKwUvByqBjOGqL0FAcBmrVJpHz8KaUCZfHNM2h/eTaoj0oZsboGDtj5eaaQNmlqj/avd1SFolREJcFVjBN7qAnc=@vger.kernel.org
X-Gm-Message-State: AFuF++n89owGbwDdpeIGePOK5M+l1qxLxyCXdS8rt9xLHJQo6aIBIGUZ
	Fq7eWoGzu9nHuLZeYxtKvEAyixDa+Pp+KRkef6yFOZpTLiyJq2m8q/SW9EVowSAmHT2GWkQ9Z5T
	sPB0jJqf5+VTsoq6qwfhifsCjmP767aGh6vO4W+8jGMfOi1I166a50GLH5X0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:eca:b0:4c3:bc6a:a328 with SMTP id
 5614622812f47-4d72df6fcebmr10064801b6e.31.1790511542277; Sun, 27 Sep 2026
 05:19:02 -0700 (PDT)
Date: Sun, 27 Sep 2026 05:19:02 -0700
In-Reply-To: <arkFzpbQnWICoJDt@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab909b6.e548f532.1ca396.003c.GAE@google.com>
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in rxrpc_destroy_all_connections
 (2)
From: syzbot <syzbot+89001660f14fb7684c83@syzkaller.appspotmail.com>
To: azpijr@gmail.com, davem@davemloft.net, dhowells@redhat.com, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
kernel BUG in rxrpc_destroy_all_connections

rxrpc: AF_RXRPC: proc conn 7f4 cid fba44d28 state 7 ref 1 act 0 flags 2 cache_empty 1 calls 0000000000000000 0000000000000000 0000000000000000 0000000000000000 bundle ffff88802d3d1000
rxrpc: Assertion failed
------------[ cut here ]------------
kernel BUG at net/rxrpc/conn_object.c:506!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 3 UID: 0 PID: 5762 Comm: kworker/u32:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: netns cleanup_net
RIP: 0010:rxrpc_destroy_all_connections.cold+0x12/0x34f net/rxrpc/conn_object.c:506
Code: ff 90 0f 0b e8 6e a7 99 00 48 c7 c7 20 73 5d 8d e8 72 be af ff 90 0f 0b e8 5a a7 99 00 48 c7 c7 20 73 5d 8d e8 5e be af ff 90 <0f> 0b e8 46 a7 99 00 48 c7 c7 60 78 5d 8d e8 4a be af ff 4c 89 e7
RSP: 0018:ffffc9000443f928 EFLAGS: 00010286
RAX: 0000000000000017 RBX: ffff888054ab4000 RCX: 0000000000000000
RDX: 0000000000000017 RSI: ffffffff81ea2579 RDI: fffff52000887f16
RBP: ffff888054ab4064 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff888054ab4098
R13: ffff888054ab3e70 R14: ffff888054ab4078 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d5e52000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe0fcd74e9c CR3: 0000000035950000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 rxrpc_exit_net+0x7b/0xc0 net/rxrpc/net_ns.c:113
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x2ee/0xab0 net/core/net_namespace.c:253
 cleanup_net+0x499/0x920 net/core/net_namespace.c:706
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:rxrpc_destroy_all_connections.cold+0x12/0x34f net/rxrpc/conn_object.c:506
Code: ff 90 0f 0b e8 6e a7 99 00 48 c7 c7 20 73 5d 8d e8 72 be af ff 90 0f 0b e8 5a a7 99 00 48 c7 c7 20 73 5d 8d e8 5e be af ff 90 <0f> 0b e8 46 a7 99 00 48 c7 c7 60 78 5d 8d e8 4a be af ff 4c 89 e7
RSP: 0018:ffffc9000443f928 EFLAGS: 00010286
RAX: 0000000000000017 RBX: ffff888054ab4000 RCX: 0000000000000000
RDX: 0000000000000017 RSI: ffffffff81ea2579 RDI: fffff52000887f16
RBP: ffff888054ab4064 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff888054ab4098
R13: ffff888054ab3e70 R14: ffff888054ab4078 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d5e52000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe0fcd74e9c CR3: 0000000035950000 CR4: 0000000000352ef0


Tested on:

commit:         a7bfaba4 ipv6: fix prefix route expiry in modify_prefi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13e06605580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=89001660f14fb7684c83
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124d5315580000


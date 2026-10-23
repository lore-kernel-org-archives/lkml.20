Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782053;
	b=FwJ4h1EXvH8mTXL0Q2rlknzA74VJH9DZseqOunLAxCAPUTd9AEaZHDzZE6iGvFlXvdJu
	 rsKoSp7gog+sVsz4g8DeW+b05vDrPGk/9IEoJM7F8CMm02vcsDCfnCB2vglvGB/TDY/tN
	 YGg2pVZW3RN01LPjnkw5cVIvLHPZ2aY3iQYFAK+cuJ5OY8CrGid9PHePZ89AyE5jlrRRj
	 NlGAo0zYypmMHHhI3tt3fJqu4PvdFSlnNU0EDbCrl02IPbUJDS7GXkWjeXhPnvzo+yIOn
	 MEuSkDkpKUFVK9+gIUyiCp1q2t87PtPYgxiwDZAOjb/T2B7cvGtZERyYOqeGuxgeFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782053;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=ypskTyf/rTFIdElsne8kBI5ZkSZ1ilBW16848j0mABI=;
	b=nKIzxkIglKxcC9v5dPJmqQmjctQIlyyTdCEVH8r8MrIDLFKe/B62a9ArOLS6Ra6qyh3C
	 OEucylp5/cpAZ/CE9DZy+cQDxUCwqRALzZDIijU+RYsG5l9rW8EkIxDmGokHWaZzOEtts
	 Y8SBmCBnw0Ib+nJ9l6eZvXR43HPOswOGDi2rhu9xq47y9o/YfBIb+W/i71jcClueBzVD5
	 s+tbK+qOMyKqDmSX5BTVuK//lPF2NNNld8Y4KVHQvA8vivehhBJ7s27HrKKvTo1PbZvaJ
	 aICa/dp283rBRU1CW/QkJKHDW/x8zwXkGCCnlJ/9JagCqjfZEeGoMmytT8fNk279p5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577DC606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dc57e2a3f2so1914134b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782038; x=1793386838;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypskTyf/rTFIdElsne8kBI5ZkSZ1ilBW16848j0mABI=;
        b=ODvD4GVK0PqzsQI5Cm4sUKahuUfDE6MTN2zucn78FiQG1rl9udytZ1pq8G3VquBFNW
         gFuoJXVemSncdXAaBlFG/aLtY06kQlsF00X7EeYyjhvS8grGwU6lM0DibCjEft37Kwq3
         vKcEMN9A1DxFNiKVmk7qvOHQmzQ6ZRDoxlqAvT6kowX/HZLNYgRlaYCmv0b9WF9TfgSK
         AbcdLKOHKRCBcqYFVAsWcaASJfrHeiThXaHicLfU3XdZ8In+J027KrkPfgQJDlAQZ82P
         CRQRqur34VCvc1FLdX22FUEDBMKV8K361Kd7Oh9FoYMwvZf9HcHICpu5wzv8Pwi74A/h
         BFEA==
X-Forwarded-Encrypted: i=1; AKwUvByz+bGyW3Kx+DXEtMFHC2JZr01mTfsFy6qIsbJY8gCb2/+RolRMGxISP/ej1c5xzj8ZklUW+hlpqG0iXpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIIyMDa97lT9o94XbGJ064/UY7sGJ4xf7/ZOnvOPk/hMZwhliK
	7rTZN+dH9hcDoM5y8qOdhcFEFH+dF18MGxST7usS12RGxXrtW11W9GNZuoFhkjGyRGEiB4qBAr/
	0Wd1F6/01SiE0XmxgYjo1qfXwzf5j8I33ELLRlDsANj4uhMmjetjJPwiPI/k=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1521:b0:4c3:9892:96c3 with SMTP id
 5614622812f47-55c00261ca8mr87453b6e.22.1792782038333; Fri, 23 Oct 2026
 12:00:38 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:00:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adbaed6.67317f00.38c4bc.001b.GAE@google.com>
Subject: [syzbot] [net?] WARNING in nsim_fib_event_nb (2)
From: syzbot <syzbot+751b587577d0ebca10f2@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d8674294aefe Merge git://git.kernel.org/pub/scm/linux/kern..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14b756d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=97c5d7b57925a2ec
dashboard link: https://syzkaller.appspot.com/bug?extid=751b587577d0ebca10f2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b756d1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11828f15580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b49acf0cec9/disk-d8674294.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2d7502d8747e/vmlinux-d8674294.xz
kernel image: https://storage.googleapis.com/syzbot-assets/706ef88ff29f/bzImage-d8674294.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+751b587577d0ebca10f2@syzkaller.appspotmail.com

------------[ cut here ]------------
i != fen6_info->nsiblings
WARNING: drivers/net/netdevsim/fib.c:831 at nsim_fib6_event_init drivers/net/netdevsim/fib.c:831 [inline], CPU#0: syz.0.157/6279
WARNING: drivers/net/netdevsim/fib.c:831 at nsim_fib6_prepare_event drivers/net/netdevsim/fib.c:947 [inline], CPU#0: syz.0.157/6279
WARNING: drivers/net/netdevsim/fib.c:831 at nsim_fib_event_schedule_work drivers/net/netdevsim/fib.c:1003 [inline], CPU#0: syz.0.157/6279
WARNING: drivers/net/netdevsim/fib.c:831 at nsim_fib_event_nb+0x1029/0x11d0 drivers/net/netdevsim/fib.c:1043, CPU#0: syz.0.157/6279
Modules linked in:
CPU: 0 UID: 0 PID: 6279 Comm: syz.0.157 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:nsim_fib6_event_init drivers/net/netdevsim/fib.c:831 [inline]
RIP: 0010:nsim_fib6_prepare_event drivers/net/netdevsim/fib.c:947 [inline]
RIP: 0010:nsim_fib_event_schedule_work drivers/net/netdevsim/fib.c:1003 [inline]
RIP: 0010:nsim_fib_event_nb+0x1029/0x11d0 drivers/net/netdevsim/fib.c:1043
Code: eb 0d 4d 89 fd e8 b7 c5 6c fa be 01 00 00 00 48 89 df e8 5a 38 85 fd 4d 89 ef 4c 8b 6c 24 20 e9 4a f3 ff ff e8 98 c5 6c fa 90 <0f> 0b 90 e9 db fa ff ff 89 e9 80 e1 07 80 c1 03 38 c1 0f 8c df f0
RSP: 0018:ffffc900047bef10 EFLAGS: 00010293
RAX: ffffffff875b59a8 RBX: 0000000000000002 RCX: ffff888079770000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000001
RBP: ffffc900047bf0a0 R08: ffff88805c0bb02f R09: 1ffff1100b817605
R10: dffffc0000000000 R11: ffffed100b817606 R12: dffffc0000000000
R13: 0000000000000000 R14: 0000000000000001 R15: ffff88802c792000
FS:  00007f334ba076c0(0000) GS:ffff888123ad0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f334ba06ff8 CR3: 000000007a5b2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 notifier_call_chain+0x1a5/0x3d0 kernel/notifier.c:85
 atomic_notifier_call_chain+0xda/0x180 kernel/notifier.c:223
 call_fib_notifiers+0x31/0x60 net/core/fib_notifier.c:36
 call_fib6_multipath_entry_notifiers+0xf5/0x160 net/ipv6/ip6_fib.c:428
 ip6_route_multipath_add net/ipv6/route.c:5542 [inline]
 inet6_rtm_newroute+0x14f5/0x1a30 net/ipv6/route.c:5664
 rtnetlink_rcv_msg+0x802/0xc00 net/core/rtnetlink.c:7163
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2572
 netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1361
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1916
 sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
 __sock_sendmsg net/socket.c:818 [inline]
 ____sys_sendmsg+0x54e/0x850 net/socket.c:2715
 ___sys_sendmsg+0x2a5/0x360 net/socket.c:2769
 __sys_sendmmsg+0x273/0x4d0 net/socket.c:2858
 __do_sys_sendmmsg net/socket.c:2885 [inline]
 __se_sys_sendmmsg net/socket.c:2882 [inline]
 __x64_sys_sendmmsg+0xa0/0xc0 net/socket.c:2882
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f334ab9e1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f334ba07028 EFLAGS: 00000246 ORIG_RAX: 0000000000000133
RAX: ffffffffffffffda RBX: 00007f334ae26090 RCX: 00007f334ab9e1d9
RDX: 04000000000001f2 RSI: 0000200000000000 RDI: 0000000000000004
RBP: 00007f334ac35888 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000000000fc R11: 0000000000000246 R12: 0000000000000000
R13: 00007f334ae26128 R14: 00007f334ae26090 R15: 00007ffd96688aa8
 </TASK>


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

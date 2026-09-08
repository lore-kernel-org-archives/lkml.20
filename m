Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C52721D591
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830549; cv=none; b=DIqVEORQuQeuDWUCRR0o8gwAiCWGvcPMW35p1grcgNm8LBZalUGFmb+0yn3PvNVdeswQXK5ig+QhwErSksGZ0aprgqY2G8Owadw3Nisegvr3ZMZZVaCitg+ZfFAebz+63IoRb0CM+FB7uS5leKsqXC2KXrQQ0ZKLrdrG+SshnlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830549; c=relaxed/simple;
	bh=R7m97Z4su70199iviH1B6aHHbKHy8atNme2W48hHtYc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bmKDQXqYeYygBk4MhziWgiBsdNKCMC8e0BHgpsFp2mRHDOt+xY2vsA/3NUirCFm6SyTdQzVVeAskY2dMKegvSDXIsgLDVcSj2joeIAXJKAT5LA7OpkHf/6L8KCfWxuBExF3eaAmO6V8DMs5fDxjun0KwciHt5jGQgxWmBpRrC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-464e69965b8so6698299fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830544; x=1789435344;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0qwms+4/n9qGPn8Y9FUfibz56sFXWc4CXcMb0GB4gc=;
        b=ZZ/XJk+x9NInwC6fTHZxh7ZtzybWnQbUzKutDv0lctKy/xIbI/FGnpkfvL2TvevCWa
         ZojoRattugj9wcE0Qo5jNXT771T+74srMcDOmh8P7LmBKEI+ZpiNyhYAUw12NvqP+/yz
         cXwVWJYOn+W7olGWCHakuJSdo1uCCFcjUIqBhWsGbNNG2RCPHWxnFj2RlHjvX95V9lqf
         gfv1+igWh0baxVRTUVfM1AGhYy7SFuUFPP5GmfGazXC1eK/SSepuGqq8E9PJwDv4++Pc
         GmYEsTBOxQlZQUPNy4tZi423kir1z+JD4hb1Rka2AT5cSLr+FTsbgL7mwhXZJPGWiFpI
         H5NQ==
X-Gm-Message-State: AFuF++kNyLugBV4xmCpbEsUrvYD74fti7j86gStFkMR/9girkm/gwGvc
	+Xj/SrQi6qBXK7Ylb8xAAQleUDQwZhIH92BamncTHrKlvqox9UwiL7gyjyPYC4A2Fd7V2AZPaaH
	NcmhbLSNnMmWPrQub5XbMpaRYuA3qLRL2H/nBhFFySxaZWjMBgY2WRjBQrzQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1996:b0:6ba:2e82:35a7 with SMTP id
 006d021491bc7-6ba2e8238c3mr4270443eaf.28.1788830543872; Mon, 07 Sep 2026
 18:22:23 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:22:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f634f.6e6c5f9e.28f11f.0004.GAE@google.com>
Subject: [syzbot] WARNING in mac80211_hwsim_get_tx_rate
From: syzbot <syzbot+847847e76c6983a5b3dd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    df2908090cda Linux 7.3-rc2
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=106f4af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=847847e76c6983a5b3dd
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c13125580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+847847e76c6983a5b3dd@syzkaller.appspotmail.com

------------[ cut here ]------------
c->control.rates[0].idx < 0
WARNING: ./include/net/mac80211.h:3413 at ieee80211_get_tx_rate include/net/mac80211.h:3413 [inline], CPU#3: syz-executor172/6032
WARNING: ./include/net/mac80211.h:3413 at mac80211_hwsim_get_tx_rate+0x1b3/0x210 drivers/net/wireless/virtual/mac80211_hwsim_main.c:1335, CPU#3: syz-executor172/6032
Modules linked in:
CPU: 3 UID: 0 PID: 6032 Comm: syz-executor172 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:ieee80211_get_tx_rate include/net/mac80211.h:3413 [inline]
RIP: 0010:mac80211_hwsim_get_tx_rate+0x1b3/0x210 drivers/net/wireless/virtual/mac80211_hwsim_main.c:1335
Code: 80 3c 02 00 75 6c 48 8b 43 08 48 8d 54 6d 00 48 8d 1c 90 e8 bf e7 a9 fa 48 89 d8 5b 5d 41 5c e9 83 4d 71 04 e8 ae e7 a9 fa 90 <0f> 0b 90 31 db eb e2 e8 61 22 1d fb e9 e8 fe ff ff e8 b7 22 1d fb
RSP: 0018:ffffc90003ed70d8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88803656d068 RCX: 0000000000000402
RDX: ffff88802b10cb00 RSI: ffffffff87622962 RDI: ffff88802b10cb00
RBP: ffffffffffffffff R08: 0000000000000001 R09: 0000000000000000
R10: 00000000000000ff R11: 0000000000000000 R12: ffff8880551d0f40
R13: ffff88803638970b R14: ffff8880551d7bc8 R15: 0000000000000064
FS:  0000555584784400(0000) GS:ffff8880d5e5d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f97934f4eb8 CR3: 000000003f0f4000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 mac80211_hwsim_write_tsf+0x89/0x460 drivers/net/wireless/virtual/mac80211_hwsim_main.c:1617
 mac80211_hwsim_tx_frame_no_nl+0x12c/0x1830 drivers/net/wireless/virtual/mac80211_hwsim_main.c:1913
 mac80211_hwsim_tx+0xf43/0x29d0 drivers/net/wireless/virtual/mac80211_hwsim_main.c:2276
 drv_tx net/mac80211/driver-ops.h:38 [inline]
 ieee80211_tx_frags+0x5c9/0xa70 net/mac80211/tx.c:1753
 __ieee80211_tx+0x145/0x5b0 net/mac80211/tx.c:1808
 ieee80211_tx+0x336/0x460 net/mac80211/tx.c:1991
 ieee80211_xmit+0x30f/0x3e0 net/mac80211/tx.c:2083
 ieee80211_monitor_start_xmit+0xf09/0x12b0 net/mac80211/tx.c:2486
 __netdev_start_xmit include/linux/netdevice.h:5429 [inline]
 netdev_start_xmit include/linux/netdevice.h:5438 [inline]
 xmit_one net/core/dev.c:3937 [inline]
 dev_hard_start_xmit+0x121/0x760 net/core/dev.c:3953
 __dev_queue_xmit+0x1bbf/0x4970 net/core/dev.c:4926
 dev_queue_xmit include/linux/netdevice.h:3461 [inline]
 packet_xmit+0x243/0x310 net/packet/af_packet.c:277
 packet_snd net/packet/af_packet.c:3111 [inline]
 packet_sendmsg+0x30bc/0x4ef0 net/packet/af_packet.c:3143
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x48b/0x4e0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd5261b7f57
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffffd9355c0 EFLAGS: 00000202 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 0000555584784400 RCX: 00007fd5261b7f57
RDX: 0000000000000021 RSI: 00007ffffd935650 RDI: 0000000000000003
RBP: 00007ffffd935620 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 000000000000000a
R13: 0000000000000003 R14: 0000000000000026 R15: 00007fd5261f104e
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

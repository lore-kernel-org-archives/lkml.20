Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A44EDCA0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613068; cv=none; b=qS1hbT9s1oZ+GTRJOh5ejcNjb+uDNng0Y6KvEFySHI72cGtOphUNYdBbE6bYzFdOxsyTbwdmUtztliW9apabMMlc5GkmID4/YtwmkoWbScsjeTNTD4XEuQWNZdzh+wnzdH3gyRuu3eWSJy2Tuo9AAvu82PTo9nMu1iXxt+rX15w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613068; c=relaxed/simple;
	bh=hJORlPKe/qjP5nweZkXXy0ga9p7ZgSvHvqjlOCePXQs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=U/Ul7iLeFH+eLW/LVqPWlhFQHVH3T5b7d7/OmGBU/helpcFPW+6aStTBri8b20t8OfDvQ7BuOnz4wVjdlakQWDcIzG90qZBaCFvSlS6DiuiifT9nD/8FJS2tqXAQGV4jGo8dU5vOHTwFLJwz7qVZkWHa8OyGDwXBwnHv6yitbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28deb7ee3so5797860b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613066; x=1791217866;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XEiIlHoIV8sKwF49JucIzNjRrGcEiBBt1pez98CAgrs=;
        b=jvvU76HmR8FUkQPZ6BHEW6if+Hn1Dgv23uICY8UQHSlLTP4fQBusHOLfGJc5JOE41Y
         5TMEnQ+htikUQigZAx7E2J8zSmwa+jImqhzHolUqK8hRno8RTqAf3ivwPSp/FMeh7HWA
         Tbo4cr4T//rPA8OnJhRa+F0GfHfDb6aa1jeKh+rq6Y04m1sr9tuJoyb/C2xmvReRDbVL
         BMiL9sDuQWj4Y6hw5U9Xx+GVLJjFmYUtdM1iVKdxeKBQ8E3t3GhvLkiOB4xdK8t4AC64
         yR2xZCjOxhhU7Oj9SuM1MCVcTlZaHCWMaaFTrY1Th0r/rvGvMnun/OCca6Hyl7q5AWcp
         wckQ==
X-Forwarded-Encrypted: i=1; AKwUvBySD/KKrJmkEDQGzB5vUCDqHUSnU0XZbtpFD5/r9GD0HBJ0OBTtf7Ca8lVzlq2c5PySaRRdrcWyuVYvQ1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nfsPnFm3CLdxV8glzhl6LCPiQnNUXPMTAkNn92Rkd4MJGyt6B0
	i00H9/nF3tUQif52pOd8lr6qc0GDKjGczJR2mDKXgVoMbtr0+bryqIe+SIy3q+qSMQpNhogPT7e
	aNQBirrgjM6wHW0mWCoB82tL0JOk2oCripSV2vokUQmIWUtqtoKhZzGMLgFM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1582:b0:4c6:a5e8:c792 with SMTP id
 5614622812f47-4d72df6c84cmr12886521b6e.41.1790613065950; Mon, 28 Sep 2026
 09:31:05 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:31:05 -0700
In-Reply-To: <20260928151742.GA536483@shredder>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aba9649.69bd487b.a6f8c.0001.GAE@google.com>
Subject: Re: [syzbot] BUG: Address fc00:: on device lo is missing its host route.
From: syzbot <syzbot+ded267b328e950a7c0c4@syzkaller.appspotmail.com>
To: idosch@nvidia.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for syz_tun to become free. Usage count = 10
ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_hold include/linux/netdevice.h:4557 [inline]
     dst_init+0xbc/0x42c net/core/dst.c:52
     dst_alloc+0x118/0x15c net/core/dst.c:94
     rt_dst_alloc+0x4c/0x240 net/ipv4/route.c:1681
     __mkroute_output net/ipv4/route.c:2684 [inline]
     ip_route_output_key_hash_rcu+0x108c/0x1c20 net/ipv4/route.c:2904
     ip_route_output_key_hash+0x180/0x2a0 net/ipv4/route.c:2734
     __ip_route_output_key include/net/route.h:169 [inline]
     ip_route_output_flow+0x3c/0x158 net/ipv4/route.c:2961
     ip_route_output_key include/net/route.h:179 [inline]
     geneve_link_config+0x16c/0x544 drivers/net/geneve.c:2397
     geneve_newlink+0xa60/0xcd0 drivers/net/geneve.c:2456
     rtnl_newlink_create+0x294/0x6b8 net/core/rtnetlink.c:3974
     __rtnl_newlink net/core/rtnetlink.c:4103 [inline]
     rtnl_newlink+0xfe4/0x138c net/core/rtnetlink.c:4220
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7137
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2575
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7164
     netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1364
     netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1919
     sock_sendmsg_nosec net/socket.c:800 [inline]
     __sock_sendmsg+0xc8/0x17c net/socket.c:815

ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_tracker_alloc include/linux/netdevice.h:4540 [inline]
     netdev_get_by_index+0x84/0xdc net/core/dev.c:1049
     fib6_nh_init+0x258/0x14f0 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     ip6_route_add+0x8c/0x1b4 net/ipv6/route.c:3966
     addrconf_prefix_route+0x1f4/0x2b8 net/ipv6/addrconf.c:2504
     addrconf_add_linklocal+0x238/0x378 net/ipv6/addrconf.c:3337
     addrconf_addr_gen+0x27c/0x2dc net/ipv6/addrconf.c:-1
     addrconf_init_auto_addrs+0x390/0x764 net/ipv6/addrconf.c:-1
     addrconf_notify+0x774/0xbbc net/ipv6/addrconf.c:3776
     notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3271
     rtnl_changelink net/core/rtnetlink.c:3910 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4081 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4220

ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_tracker_alloc include/linux/netdevice.h:4540 [inline]
     netdev_get_by_index+0x84/0xdc net/core/dev.c:1049
     fib6_nh_init+0x258/0x14f0 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     addrconf_f6i_alloc+0x1e4/0x3b4 net/ipv6/route.c:4721
     ipv6_add_addr+0x484/0xdb0 net/ipv6/addrconf.c:1132
     addrconf_add_linklocal+0x1e0/0x378 net/ipv6/addrconf.c:3335
     addrconf_addr_gen+0x27c/0x2dc net/ipv6/addrconf.c:-1
     addrconf_init_auto_addrs+0x390/0x764 net/ipv6/addrconf.c:-1
     addrconf_notify+0x774/0xbbc net/ipv6/addrconf.c:3776
     notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3271
     rtnl_changelink net/core/rtnetlink.c:3910 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4081 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4220

ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_tracker_alloc include/linux/netdevice.h:4540 [inline]
     netdev_get_by_index+0x84/0xdc net/core/dev.c:1049
     fib6_nh_init+0x258/0x14f0 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     ip6_route_add+0x8c/0x1b4 net/ipv6/route.c:3966
     addrconf_add_mroute+0x14c/0x1d0 net/ipv6/addrconf.c:2568
     addrconf_add_dev+0xe4/0x188 net/ipv6/addrconf.c:2586
     addrconf_dev_config net/ipv6/addrconf.c:3508 [inline]
     addrconf_init_auto_addrs+0x304/0x764 net/ipv6/addrconf.c:3596
     addrconf_notify+0x774/0xbbc net/ipv6/addrconf.c:3776
     notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3271
     rtnl_changelink net/core/rtnetlink.c:3910 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4081 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4220
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7137

ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_tracker_alloc include/linux/netdevice.h:4540 [inline]
     netdev_get_by_index+0x84/0xdc net/core/dev.c:1049
     fib6_nh_init+0x258/0x14f0 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     ip6_route_add+0x8c/0x1b4 net/ipv6/route.c:3966
     addrconf_prefix_route+0x1f4/0x2b8 net/ipv6/addrconf.c:2504
     fixup_permanent_addr net/ipv6/addrconf.c:3627 [inline]
     addrconf_permanent_addr+0x590/0x80c net/ipv6/addrconf.c:3663
     addrconf_notify+0x664/0xbbc net/ipv6/addrconf.c:3730
     notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3271
     rtnl_changelink net/core/rtnetlink.c:3910 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4081 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4220
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7137
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2575

ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_hold include/linux/netdevice.h:4557 [inline]
     fib_check_nh_nongw net/ipv4/fib_semantics.c:1290 [inline]
     fib_check_nh+0x9a0/0x15a8 net/ipv4/fib_semantics.c:1310
     fib_create_info+0x1428/0x2184 net/ipv4/fib_semantics.c:1530
     fib_table_insert+0xa4/0x12bc net/ipv4/fib_trie.c:1212
     fib_magic+0x26c/0x344 net/ipv4/fib_frontend.c:1147
     fib_add_ifaddr+0x330/0x500 net/ipv4/fib_frontend.c:1191
     fib_netdev_event+0x35c/0x49c net/ipv4/fib_frontend.c:1529
     notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3271
     rtnl_changelink net/core/rtnetlink.c:3910 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4081 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4220
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7137
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2575
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7164

ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_hold include/linux/netdevice.h:4557 [inline]
     fib_check_nh_nongw net/ipv4/fib_semantics.c:1290 [inline]
     fib_check_nh+0x9a0/0x15a8 net/ipv4/fib_semantics.c:1310
     fib_create_info+0x1428/0x2184 net/ipv4/fib_semantics.c:1530
     fib_table_insert+0xa4/0x12bc net/ipv4/fib_trie.c:1212
     fib_magic+0x26c/0x344 net/ipv4/fib_frontend.c:1147
     fib_add_ifaddr+0x2e0/0x500 net/ipv4/fib_frontend.c:1184
     fib_netdev_event+0x35c/0x49c net/ipv4/fib_frontend.c:1529
     notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3271
     rtnl_changelink net/core/rtnetlink.c:3910 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4081 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4220
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7137
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2575
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7164

ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_tracker_alloc include/linux/netdevice.h:4540 [inline]
     netdev_get_by_index+0x84/0xdc net/core/dev.c:1049
     fib6_nh_init+0x258/0x14f0 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     addrconf_f6i_alloc+0x1e4/0x3b4 net/ipv6/route.c:4721
     ipv6_add_addr+0x484/0xdb0 net/ipv6/addrconf.c:1132
     inet6_addr_add+0x29c/0x784 net/ipv6/addrconf.c:3074
     inet6_rtm_newaddr+0x73c/0xa54 net/ipv6/addrconf.c:5098
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7137
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2575
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7164
     netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1364
     netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1919
     sock_sendmsg_nosec net/socket.c:800 [inline]
     __sock_sendmsg+0xc8/0x17c net/socket.c:815
     __sys_sendto+0x250/0x328 net/socket.c:2281
     __do_sys_sendto net/socket.c:2288 [inline]
     __se_sys_sendto net/socket.c:2284 [inline]
     __arm64_sys_sendto+0xec/0x10c net/socket.c:2284
     __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
     invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49

ref_tracker: netdev@00000000ef132b95 has 1/9 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4528 [inline]
     netdev_tracker_alloc+0x68/0xb4 include/linux/netdevice.h:4540
     fib_create_info+0x15cc/0x2184 net/ipv4/fib_semantics.c:1524
     fib_table_insert+0xa4/0x12bc net/ipv4/fib_trie.c:1212
     fib_magic+0x26c/0x344 net/ipv4/fib_frontend.c:1147
     fib_add_ifaddr+0x114/0x500 net/ipv4/fib_frontend.c:1169
     fib_inetaddr_event+0x114/0x1c0 net/ipv4/fib_frontend.c:1483
     notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:85
     blocking_notifier_call_chain+0x70/0xa0 kernel/notifier.c:380
     __inet_insert_ifa+0x87c/0xa74 net/ipv4/devinet.c:566
     inet_rtm_newaddr+0xba4/0x1140 net/ipv4/devinet.c:1001
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7137
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2575
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7164
     netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1364
     netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1919
     sock_sendmsg_nosec net/socket.c:800 [inline]
     __sock_sendmsg+0xc8/0x17c net/socket.c:815



Tested on:

commit:         e8e60d3d Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11777315580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=375776a45e10c065
dashboard link: https://syzkaller.appspot.com/bug?extid=ded267b328e950a7c0c4
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15c0f605580000


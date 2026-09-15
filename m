Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878A933ADAE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476968; cv=none; b=OivZxelDCb20tDA1A5ESftEar0GBHbWPXMSMklRfQt/FuNkguB+R7mu1faJRHCIZMz9r6Fi6jgeTe+CL0ZnLRH0aBFud2zEOqiO2Hd0X37nfrAFVVV34mkur21nGFJZ90NF7irm/8sAFM2WJJJK5P3QbHVJ5qeus+/zEeiKPKIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476968; c=relaxed/simple;
	bh=WyK3qfCYVwBLGdFs3VTdvafel1kmMakRsv5Mipt/Rcg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Zi4szWtW47298GqHXfQ2yjA7ik++H4J4teC6no6igoOMlIHxV32e6RR/5+7YAtdlgbYbDgGISs7LbLjmDDvJ8VfulJEPw/fmegu+i4sOGsZCaJzb5sGK9VPs++UdlCZsd8aE6fvQjPHwPabqJKoQZX2LIAbAwUrjc3Snubclcsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28deb7ee3so6715376b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476963; x=1790081763;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fmAAwEFgiC49wV4oq4lzhUqDF+3uIzwKbpVBZ1VHgEw=;
        b=Xii/TriP+JnckUGqpkx85pSEkDb1W6Lm56DwDBVV3mnC5Xe+X8Ca+m/8W2C0JBENvh
         vPUEDfpCSsXPRQPZc3O0EwTSuC9fEhE7PuPW0ncsUHcFC4f/tTu1NXfmS42VmppJco1R
         CHcz7VeZRUJIQtGHtbmjLHEYDLlbdvty5K0pTbcLQym0xq7G1zZpr+P1Ebpsx0lfleFe
         6zxBnzWoXF92jOEPwJ0UkWq9Kc6kKcNWpsuzwfOy4nJ+9hphWp54JXdEJbfY/AqgFH7e
         bY41ztqPunRmrPq/2Ldrvo4XQZfOoaB1MG/EX1KeV8fjUjFy5k0OiSWSz9Z6ochJGXrw
         31Zw==
X-Gm-Message-State: AFuF++mXuDCJz5zwCUyROrlc7aFrDanDJ+VEduyovLxoZp0jZYRlaSv7
	0JlsnMRPFSt7LJUG22OxVcLvm5l2+80xs/g6l+FZSYBfn/KgXs/DFNnbGPjUHKxPVzUEMkNT2Wo
	PCz6FaHx2YpRalkGc7YI4tqFmuLYcpQjLGqPEW+QFZHo72FPYvHCFeSA3UFg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1250:b0:4b2:98a3:a567 with SMTP id
 5614622812f47-4c7b34d5c7fmr4642876b6e.4.1789476963244; Tue, 15 Sep 2026
 05:56:03 -0700 (PDT)
Date: Tue, 15 Sep 2026 05:56:03 -0700
In-Reply-To: <0d52ff78-4135-4761-a54a-d80ecfe1d88e@I-love.SAKURA.ne.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa94063.a211d2ce.1a5198.02ac.GAE@google.com>
Subject: Re: [syzbot] [net?] unregister_netdevice: waiting for DEV to become
 free (9)
From: syzbot <syzbot+e2af46126e0644cbebdd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for netdevsim2 to become free. Usage count = 2
ref_tracker: netdev@00000000163a43c1 has 1/1 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4541 [inline]
     netdev_tracker_alloc include/linux/netdevice.h:4553 [inline]
     netdev_get_by_index+0x84/0xdc net/core/dev.c:1049
     fib6_nh_init+0x258/0x1514 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     addrconf_f6i_alloc+0x1e4/0x3b4 net/ipv6/route.c:4718
     ipv6_add_addr+0x484/0xdb0 net/ipv6/addrconf.c:1132
     addrconf_add_linklocal+0x1e0/0x378 net/ipv6/addrconf.c:3335
     addrconf_addr_gen+0x27c/0x2dc net/ipv6/addrconf.c:-1
     addrconf_init_auto_addrs+0x390/0x764 net/ipv6/addrconf.c:-1
     addrconf_notify+0x774/0xbbc net/ipv6/addrconf.c:3776
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215

Call trace for netdevsim2[1] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     rx_queue_add_kobject net/core/net-sysfs.c:1236 [inline]
     net_rx_queue_update_kobjects+0x108/0x67c net/core/net-sysfs.c:1301
     register_queue_kobjects net/core/net-sysfs.c:2093 [inline]
     netdev_register_kobject+0x210/0x328 net/core/net-sysfs.c:2344
     register_netdevice+0xd74/0x14c0 net/core/dev.c:11503
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
     device_add+0x6cc/0x9e0 drivers/base/core.c:3776
     device_register+0x28/0x38 drivers/base/core.c:3858
     nsim_bus_dev_new drivers/net/netdevsim/bus.c:468 [inline]
     new_device_store+0x2c4/0x58c drivers/net/netdevsim/bus.c:191
     bus_attr_store+0x80/0xa4 drivers/base/bus.c:172
Call trace for netdevsim2[2] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     netdev_queue_add_kobject net/core/net-sysfs.c:1973 [inline]
     netdev_queue_update_kobjects+0x158/0x5f0 net/core/net-sysfs.c:2035
     register_queue_kobjects net/core/net-sysfs.c:2098 [inline]
     netdev_register_kobject+0x24c/0x328 net/core/net-sysfs.c:2344
     register_netdevice+0xd74/0x14c0 net/core/dev.c:11503
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
     device_add+0x6cc/0x9e0 drivers/base/core.c:3776
     device_register+0x28/0x38 drivers/base/core.c:3858
     nsim_bus_dev_new drivers/net/netdevsim/bus.c:468 [inline]
     new_device_store+0x2c4/0x58c drivers/net/netdevsim/bus.c:191
     bus_attr_store+0x80/0xa4 drivers/base/bus.c:172
Call trace for netdevsim2[3] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold+0x38/0xf4 include/linux/netdevice.h:4569
     register_netdevice+0xf4c/0x14c0 net/core/dev.c:11527
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
     device_add+0x6cc/0x9e0 drivers/base/core.c:3776
     device_register+0x28/0x38 drivers/base/core.c:3858
     nsim_bus_dev_new drivers/net/netdevsim/bus.c:468 [inline]
     new_device_store+0x2c4/0x58c drivers/net/netdevsim/bus.c:191
     bus_attr_store+0x80/0xa4 drivers/base/bus.c:172
     sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
Call trace for netdevsim2[4] +3 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:674 [inline]
     netdevice_event+0x424/0x7c0 drivers/infiniband/core/roce_gid_mgmt.c:822
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     register_netdevice+0x1018/0x14c0 net/core/dev.c:11541
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
     device_add+0x6cc/0x9e0 drivers/base/core.c:3776
     device_register+0x28/0x38 drivers/base/core.c:3858
Call trace for netdevsim2[5] +3 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:675 [inline]
     netdevice_event+0x4b0/0x7c0 drivers/infiniband/core/roce_gid_mgmt.c:822
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     register_netdevice+0x1018/0x14c0 net/core/dev.c:11541
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
     device_add+0x6cc/0x9e0 drivers/base/core.c:3776
     device_register+0x28/0x38 drivers/base/core.c:3858
Call trace for netdevsim2[6] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     neigh_parms_alloc+0x140/0x474 net/core/neighbour.c:1773
     inetdev_init+0x110/0x4a8 net/ipv4/devinet.c:280
     inetdev_event+0x248/0x1184 net/ipv4/devinet.c:1590
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     register_netdevice+0x1018/0x14c0 net/core/dev.c:11541
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
Call trace for netdevsim2[7] -7 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     dev_put include/linux/netdevice.h:4604 [inline]
     netdevice_event_work_handler+0xfc/0x26c drivers/infiniband/core/roce_gid_mgmt.c:652
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[8] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     inetdev_init+0x174/0x4a8 net/ipv4/devinet.c:286
     inetdev_event+0x248/0x1184 net/ipv4/devinet.c:1590
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     register_netdevice+0x1018/0x14c0 net/core/dev.c:11541
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
     device_add+0x6cc/0x9e0 drivers/base/core.c:3776
Call trace for netdevsim2[9] -7 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     dev_put include/linux/netdevice.h:4604 [inline]
     netdevice_event_work_handler+0x17c/0x26c drivers/infiniband/core/roce_gid_mgmt.c:653
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[10] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     neigh_parms_alloc+0x140/0x474 net/core/neighbour.c:1773
     ipv6_add_dev+0x380/0x1024 net/ipv6/addrconf.c:403
     addrconf_notify+0x400/0xbbc net/ipv6/addrconf.c:3686
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     register_netdevice+0x1018/0x14c0 net/core/dev.c:11541
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
Call trace for netdevsim2[11] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     ipv6_add_dev+0x3e8/0x1024 net/ipv6/addrconf.c:411
     addrconf_notify+0x400/0xbbc net/ipv6/addrconf.c:3686
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     register_netdevice+0x1018/0x14c0 net/core/dev.c:11541
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
     device_add+0x6cc/0x9e0 drivers/base/core.c:3776
Call trace for netdevsim2[12] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     udp_tunnel_nic_register net/ipv4/udp_tunnel_nic.c:852 [inline]
     udp_tunnel_nic_netdevice_event+0x93c/0x1444 net/ipv4/udp_tunnel_nic.c:933
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     register_netdevice+0x1018/0x14c0 net/core/dev.c:11541
     nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1072 [inline]
     nsim_create+0x944/0xcf4 drivers/net/netdevsim/netdev.c:1154
     __nsim_dev_port_add+0x59c/0x95c drivers/net/netdevsim/dev.c:1434
     nsim_dev_port_add_all+0x50/0x114 drivers/net/netdevsim/dev.c:1495
     nsim_drv_probe+0x780/0xa1c drivers/net/netdevsim/dev.c:1656
     nsim_bus_probe+0x20/0x30 drivers/net/netdevsim/bus.c:420
     call_driver_probe drivers/base/dd.c:-1 [inline]
     really_probe+0x29c/0x800 drivers/base/dd.c:706
     __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
     driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
     __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
     bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
     __device_attach+0x248/0x390 drivers/base/dd.c:1098
     device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
     bus_probe_device+0x58/0x120 drivers/base/bus.c:620
     device_add+0x6cc/0x9e0 drivers/base/core.c:3776
     device_register+0x28/0x38 drivers/base/core.c:3858
Call trace for netdevsim2[13] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     netdev_work_enqueue+0x148/0x2b0 net/core/netdev_work.c:40
     __netdev_work_core_sched+0x2c/0x3c net/core/netdev_work.c:109
     netif_rx_mode_queue net/core/dev_addr_lists.c:1337 [inline]
     __dev_set_rx_mode+0x188/0x314 net/core/dev_addr_lists.c:1376
     dev_set_rx_mode+0x60/0x84 net/core/dev_addr_lists.c:1393
     __dev_open+0x54c/0x76c net/core/dev.c:1732
     __dev_change_flags+0x294/0x698 net/core/dev.c:9812
     netif_change_flags+0x80/0x15c net/core/dev.c:9877
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
     netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1345
     netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1900
     sock_sendmsg_nosec+0x88/0x138 net/socket.c:810
Call trace for netdevsim2[14] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     qdisc_alloc+0x43c/0x7bc net/sched/sch_generic.c:1030
     qdisc_create_dflt+0x9c/0x570 net/sched/sch_generic.c:1053
     attach_one_default_qdisc+0xb0/0x194 net/sched/sch_generic.c:1219
     netdev_for_each_tx_queue include/linux/netdevice.h:2754 [inline]
     attach_default_qdiscs net/sched/sch_generic.c:1237 [inline]
     dev_activate+0x250/0xc4c net/sched/sch_generic.c:1296
     __dev_open+0x554/0x76c net/core/dev.c:1733
     __dev_change_flags+0x294/0x698 net/core/dev.c:9812
     netif_change_flags+0x80/0x15c net/core/dev.c:9877
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
     netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1345
     netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1900
     sock_sendmsg_nosec+0x88/0x138 net/socket.c:810
Call trace for netdevsim2[15] +3 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:674 [inline]
     netdevice_event+0x424/0x7c0 drivers/infiniband/core/roce_gid_mgmt.c:822
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
     netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1345
     netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1900
     sock_sendmsg_nosec+0x88/0x138 net/socket.c:810
Call trace for netdevsim2[16] +3 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:675 [inline]
     netdevice_event+0x4b0/0x7c0 drivers/infiniband/core/roce_gid_mgmt.c:822
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
     netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1345
     netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1900
     sock_sendmsg_nosec+0x88/0x138 net/socket.c:810
Call trace for netdevsim2[17] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     dev_get_by_index+0x1ac/0x308 net/core/dev.c:1024
     netdev_get_by_index+0x34/0xdc net/core/dev.c:1047
     fib6_nh_init+0x258/0x1514 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     ip6_route_add+0x8c/0x1b4 net/ipv6/route.c:3966
     addrconf_add_mroute+0x14c/0x1d0 net/ipv6/addrconf.c:2568
     addrconf_add_dev+0xe4/0x188 net/ipv6/addrconf.c:2586
     addrconf_dev_config net/ipv6/addrconf.c:3508 [inline]
     addrconf_init_auto_addrs+0x304/0x764 net/ipv6/addrconf.c:3596
     addrconf_notify+0x774/0xbbc net/ipv6/addrconf.c:3776
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
     netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1345
Call trace for netdevsim2[18] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     dev_get_by_index+0x1ac/0x308 net/core/dev.c:1024
     netdev_get_by_index+0x34/0xdc net/core/dev.c:1047
     fib6_nh_init+0x258/0x1514 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     addrconf_f6i_alloc+0x1e4/0x3b4 net/ipv6/route.c:4718
     ipv6_add_addr+0x484/0xdb0 net/ipv6/addrconf.c:1132
     addrconf_add_linklocal+0x1e0/0x378 net/ipv6/addrconf.c:3335
     addrconf_addr_gen+0x27c/0x2dc net/ipv6/addrconf.c:-1
     addrconf_init_auto_addrs+0x390/0x764 net/ipv6/addrconf.c:-1
     addrconf_notify+0x774/0xbbc net/ipv6/addrconf.c:3776
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
Call trace for netdevsim2[19] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     addr_event+0x288/0x408 drivers/infiniband/core/roce_gid_mgmt.c:870
     inet6addr_event+0xa4/0xd8 drivers/infiniband/core/roce_gid_mgmt.c:903
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     atomic_notifier_call_chain+0xf0/0x1ac kernel/notifier.c:223
     inet6addr_notifier_call_chain+0x30/0x40 net/ipv6/addrconf_core.c:108
     ipv6_add_addr+0xb28/0xdb0 net/ipv6/addrconf.c:1193
     addrconf_add_linklocal+0x1e0/0x378 net/ipv6/addrconf.c:3335
     addrconf_addr_gen+0x27c/0x2dc net/ipv6/addrconf.c:-1
     addrconf_init_auto_addrs+0x390/0x764 net/ipv6/addrconf.c:-1
     addrconf_notify+0x774/0xbbc net/ipv6/addrconf.c:3776
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
Call trace for netdevsim2[20] -2 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     dev_put include/linux/netdevice.h:4604 [inline]
     update_gid_event_work_handler+0x88/0x118 drivers/infiniband/core/roce_gid_mgmt.c:834
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[21] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     dev_get_by_index+0x1ac/0x308 net/core/dev.c:1024
     netdev_get_by_index+0x34/0xdc net/core/dev.c:1047
     fib6_nh_init+0x258/0x1514 net/ipv6/route.c:3615
     ip6_route_info_create_nh+0x13c/0x98c net/ipv6/route.c:3914
     ip6_route_add+0x8c/0x1b4 net/ipv6/route.c:3966
     addrconf_prefix_route+0x1f4/0x2b8 net/ipv6/addrconf.c:2504
     addrconf_add_linklocal+0x238/0x378 net/ipv6/addrconf.c:3337
     addrconf_addr_gen+0x27c/0x2dc net/ipv6/addrconf.c:-1
     addrconf_init_auto_addrs+0x390/0x764 net/ipv6/addrconf.c:-1
     addrconf_notify+0x774/0xbbc net/ipv6/addrconf.c:3776
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     __dev_notify_flags+0x288/0x438 net/core/dev.c:9853
     netif_change_flags+0xd0/0x15c net/core/dev.c:9882
     do_setlink+0xc28/0x31e8 net/core/rtnetlink.c:3266
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
Call trace for netdevsim2[22] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     netdev_work_dequeue+0x1c4/0x264 net/core/netdev_work.c:61
     __netdev_work_core_cancel+0x2c/0x3c net/core/netdev_work.c:115
     netif_rx_mode_sync+0x24/0x5c net/core/dev_addr_lists.c:1410
     do_setlink+0x96c/0x31e8 net/core/rtnetlink.c:3520
     rtnl_changelink net/core/rtnetlink.c:3905 [inline]
     __rtnl_newlink net/core/rtnetlink.c:4076 [inline]
     rtnl_newlink+0xf44/0x138c net/core/rtnetlink.c:4215
     rtnetlink_rcv_msg+0x66c/0x9bc net/core/rtnetlink.c:7132
     netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2556
     rtnetlink_rcv+0x28/0x38 net/core/rtnetlink.c:7159
     netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
     netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1345
     netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1900
     sock_sendmsg_nosec+0x88/0x138 net/socket.c:810
Call trace for netdevsim2[23] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     netdev_work_enqueue+0x148/0x2b0 net/core/netdev_work.c:40
     __netdev_work_core_sched+0x2c/0x3c net/core/netdev_work.c:109
     netif_rx_mode_queue net/core/dev_addr_lists.c:1337 [inline]
     __dev_set_rx_mode+0x188/0x314 net/core/dev_addr_lists.c:1376
     __dev_mc_add+0xc4/0x10c net/core/dev_addr_lists.c:1002
     dev_mc_add+0x2c/0x3c net/core/dev_addr_lists.c:1016
     igmp6_group_added+0x1d0/0x430 net/ipv6/mcast.c:681
     __ipv6_dev_mc_inc+0x7d0/0x9e4 net/ipv6/mcast.c:973
     ipv6_dev_mc_inc+0x2c/0x3c net/ipv6/mcast.c:982
     addrconf_join_solict+0xec/0x170 net/ipv6/addrconf.c:2262
     addrconf_dad_begin net/ipv6/addrconf.c:4135 [inline]
     addrconf_dad_work+0x1ec/0xfe8 net/ipv6/addrconf.c:4263
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[24] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     netdev_work_proc+0xbc/0x6fc net/core/netdev_work.c:152
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[25] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     netdev_work_proc+0x328/0x6fc net/core/netdev_work.c:164
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[26] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     netdev_work_proc+0x520/0x6fc net/core/netdev_work.c:174
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[27] +2 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dst_init+0x6c/0x438 net/core/dst.c:52
     dst_alloc+0x118/0x15c net/core/dst.c:94
     ip6_dst_alloc+0x38/0xc8 net/ipv6/route.c:342
     icmp6_dst_alloc+0x6c/0x260 net/ipv6/route.c:3346
     mld_sendpack+0x668/0xfec net/ipv6/mcast.c:1859
     mld_send_cr net/ipv6/mcast.c:2171 [inline]
     mld_ifc_work+0x76c/0x9e4 net/ipv6/mcast.c:2711
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[28] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     ___neigh_create+0xc08/0x2340 net/core/neighbour.c:661
     __neigh_create+0x80/0xa4 net/core/neighbour.c:740
     ip6_finish_output2+0xedc/0x1b68 net/ipv6/ip6_output.c:130
     __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
     ip6_finish_output+0x230/0x618 net/ipv6/ip6_output.c:221
     NF_HOOK_COND include/linux/netfilter.h:314 [inline]
     ip6_output+0x2d0/0x644 net/ipv6/ip6_output.c:248
     dst_output include/net/dst.h:470 [inline]
     NF_HOOK+0x14c/0x464 include/linux/netfilter.h:325
     mld_sendpack+0x7f4/0xfec net/ipv6/mcast.c:1870
     mld_send_cr net/ipv6/mcast.c:2171 [inline]
     mld_ifc_work+0x76c/0x9e4 net/ipv6/mcast.c:2711
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[29] -6 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     dst_destroy+0x100/0x2cc net/core/dst.c:115
     dst_destroy_rcu+0x20/0x30 net/core/dst.c:133
     rcu_do_batch+0x36c/0xbb8 kernel/rcu/tree.c:2654
Call trace for netdevsim2[30] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dst_init+0x6c/0x438 net/core/dst.c:52
     dst_alloc+0x118/0x15c net/core/dst.c:94
     ip6_dst_alloc+0x38/0xc8 net/ipv6/route.c:342
     icmp6_dst_alloc+0x6c/0x260 net/ipv6/route.c:3346
     ndisc_send_skb+0x3e4/0x162c net/ipv6/ndisc.c:492
     ndisc_send_ns+0xd8/0x168 net/ipv6/ndisc.c:672
     addrconf_dad_work+0x77c/0xfe8 net/ipv6/addrconf.c:4318
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[31] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     ___neigh_create+0xc08/0x2340 net/core/neighbour.c:661
     __neigh_create+0x80/0xa4 net/core/neighbour.c:740
     ip6_finish_output2+0xedc/0x1b68 net/ipv6/ip6_output.c:130
     __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
     ip6_finish_output+0x230/0x618 net/ipv6/ip6_output.c:221
     NF_HOOK_COND include/linux/netfilter.h:314 [inline]
     ip6_output+0x2d0/0x644 net/ipv6/ip6_output.c:248
     dst_output include/net/dst.h:470 [inline]
     NF_HOOK include/linux/netfilter.h:325 [inline]
     ndisc_send_skb+0xc18/0x162c net/ipv6/ndisc.c:513
     ndisc_send_ns+0xd8/0x168 net/ipv6/ndisc.c:672
     addrconf_dad_work+0x77c/0xfe8 net/ipv6/addrconf.c:4318
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[32] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dst_init+0x6c/0x438 net/core/dst.c:52
     dst_alloc+0x118/0x15c net/core/dst.c:94
     ip6_dst_alloc+0x38/0xc8 net/ipv6/route.c:342
     icmp6_dst_alloc+0x6c/0x260 net/ipv6/route.c:3346
     mld_sendpack+0x668/0xfec net/ipv6/mcast.c:1859
     mld_send_initial_cr+0x238/0x2fc net/ipv6/mcast.c:2288
     ipv6_mc_dad_complete+0x74/0x170 net/ipv6/mcast.c:2296
     addrconf_dad_completed+0x530/0x9e4 net/ipv6/addrconf.c:4376
     addrconf_dad_work+0x8a4/0xfe8 net/ipv6/addrconf.c:-1
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[33] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dst_init+0x6c/0x438 net/core/dst.c:52
     dst_alloc+0x118/0x15c net/core/dst.c:94
     ip6_dst_alloc+0x38/0xc8 net/ipv6/route.c:342
     icmp6_dst_alloc+0x6c/0x260 net/ipv6/route.c:3346
     ndisc_send_skb+0x3e4/0x162c net/ipv6/ndisc.c:492
     ndisc_send_rs+0x378/0x504 net/ipv6/ndisc.c:724
     addrconf_dad_completed+0x580/0x9e4 net/ipv6/addrconf.c:4396
     addrconf_dad_work+0x8a4/0xfe8 net/ipv6/addrconf.c:-1
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[34] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     ___neigh_create+0xc08/0x2340 net/core/neighbour.c:661
     __neigh_create+0x80/0xa4 net/core/neighbour.c:740
     ip6_finish_output2+0xedc/0x1b68 net/ipv6/ip6_output.c:130
     __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
     ip6_finish_output+0x230/0x618 net/ipv6/ip6_output.c:221
     NF_HOOK_COND include/linux/netfilter.h:314 [inline]
     ip6_output+0x2d0/0x644 net/ipv6/ip6_output.c:248
     dst_output include/net/dst.h:470 [inline]
     NF_HOOK include/linux/netfilter.h:325 [inline]
     ndisc_send_skb+0xc18/0x162c net/ipv6/ndisc.c:513
     ndisc_send_rs+0x378/0x504 net/ipv6/ndisc.c:724
     addrconf_dad_completed+0x580/0x9e4 net/ipv6/addrconf.c:4396
     addrconf_dad_work+0x8a4/0xfe8 net/ipv6/addrconf.c:-1
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[35] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dst_init+0x6c/0x438 net/core/dst.c:52
     dst_alloc+0x118/0x15c net/core/dst.c:94
     ip6_dst_alloc+0x38/0xc8 net/ipv6/route.c:342
     icmp6_dst_alloc+0x6c/0x260 net/ipv6/route.c:3346
     mld_sendpack+0x668/0xfec net/ipv6/mcast.c:1859
     mld_send_initial_cr+0x238/0x2fc net/ipv6/mcast.c:2288
     mld_dad_work+0x40/0x1d8 net/ipv6/mcast.c:2311
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[36] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     linkwatch_add_event net/core/link_watch.c:131 [inline]
     linkwatch_fire_event+0x13c/0x238 net/core/link_watch.c:324
     netif_carrier_off+0x9c/0x114 net/sched/sch_generic.c:657
     nsim_stop+0x90/0x3fc drivers/net/netdevsim/netdev.c:551
     __dev_close_many+0x2f4/0x648 net/core/dev.c:1798
     netif_close_many+0x1d8/0x51c net/core/dev.c:1824
     netif_close_many_and_unlock+0x38/0x15c net/core/dev.c:12425
     unregister_netdevice_many_notify+0x5a4/0x176c net/core/dev.c:12495
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[37] -3 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     neigh_destroy+0x328/0x57c net/core/neighbour.c:937
     neigh_release include/net/neighbour.h:459 [inline]
     neigh_cleanup_and_release+0x130/0x46c net/core/neighbour.c:121
     neigh_flush_one+0x348/0x3d0 net/core/neighbour.c:415
     neigh_flush_dev+0x12c/0x1d4 net/core/neighbour.c:433
     __neigh_ifdown+0xb0/0x57c net/core/neighbour.c:466
     neigh_ifdown+0x2c/0x40 net/core/neighbour.c:489
     rt6_disable_ip+0x55c/0x588 net/ipv6/route.c:5047
     addrconf_ifdown+0x134/0x11b4 net/ipv6/addrconf.c:3889
     addrconf_notify+0x29c/0xbbc net/ipv6/addrconf.c:-1
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     netif_close_many+0x368/0x51c net/core/dev.c:1829
     netif_close_many_and_unlock+0x38/0x15c net/core/dev.c:12425
     unregister_netdevice_many_notify+0x5a4/0x176c net/core/dev.c:12495
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
Call trace for netdevsim2[38] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     addr_event+0x288/0x408 drivers/infiniband/core/roce_gid_mgmt.c:870
     inet6addr_event+0xa4/0xd8 drivers/infiniband/core/roce_gid_mgmt.c:903
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     atomic_notifier_call_chain+0xf0/0x1ac kernel/notifier.c:223
     inet6addr_notifier_call_chain+0x30/0x40 net/ipv6/addrconf_core.c:108
     addrconf_ifdown+0xa48/0x11b4 net/ipv6/addrconf.c:4014
     addrconf_notify+0x29c/0xbbc net/ipv6/addrconf.c:-1
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     netif_close_many+0x368/0x51c net/core/dev.c:1829
     netif_close_many_and_unlock+0x38/0x15c net/core/dev.c:12425
     unregister_netdevice_many_notify+0x5a4/0x176c net/core/dev.c:12495
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
Call trace for netdevsim2[39] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     __qdisc_destroy+0x214/0x640 net/sched/sch_generic.c:1126
     qdisc_put+0x90/0x120 net/sched/sch_generic.c:1150
     dev_shutdown+0x2fc/0x368 net/sched/sch_generic.c:1515
     unregister_netdevice_many_notify+0xc08/0x176c net/core/dev.c:12519
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[40] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:674 [inline]
     netdevice_event+0x424/0x7c0 drivers/infiniband/core/roce_gid_mgmt.c:822
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     unregister_netdevice_many_notify+0xf24/0x176c net/core/dev.c:12532
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[41] +1 at
     __dev_hold include/linux/netdevice.h:4527 [inline]
     netdev_hold include/linux/netdevice.h:4569 [inline]
     dev_hold include/linux/netdevice.h:4592 [inline]
     netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:675 [inline]
     netdevice_event+0x4b0/0x7c0 drivers/infiniband/core/roce_gid_mgmt.c:822
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     unregister_netdevice_many_notify+0xf24/0x176c net/core/dev.c:12532
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[42] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     neigh_parms_release+0x14c/0x204 net/core/neighbour.c:1812
     inetdev_destroy net/ipv4/devinet.c:335 [inline]
     inetdev_event+0x590/0x1184 net/ipv4/devinet.c:1655
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     unregister_netdevice_many_notify+0xf24/0x176c net/core/dev.c:12532
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[43] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     in_dev_finish_destroy+0xa0/0x1ac net/ipv4/devinet.c:258
     in_dev_put include/linux/inetdevice.h:290 [inline]
     inetdev_destroy net/ipv4/devinet.c:338 [inline]
     inetdev_event+0x5e0/0x1184 net/ipv4/devinet.c:1655
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     unregister_netdevice_many_notify+0xf24/0x176c net/core/dev.c:12532
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[44] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     neigh_parms_release+0x14c/0x204 net/core/neighbour.c:1812
     addrconf_ifdown+0xe14/0x11b4 net/ipv6/addrconf.c:4043
     addrconf_notify+0x29c/0xbbc net/ipv6/addrconf.c:-1
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     unregister_netdevice_many_notify+0xf24/0x176c net/core/dev.c:12532
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[45] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     in6_dev_finish_destroy+0xc8/0x1e0 net/ipv6/addrconf_core.c:176
     in6_dev_put include/net/addrconf.h:426 [inline]
     addrconf_ifdown+0xe64/0x11b4 net/ipv6/addrconf.c:4045
     addrconf_notify+0x29c/0xbbc net/ipv6/addrconf.c:-1
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     unregister_netdevice_many_notify+0xf24/0x176c net/core/dev.c:12532
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[46] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     dev_put include/linux/netdevice.h:4604 [inline]
     udp_tunnel_nic_unregister net/ipv4/udp_tunnel_nic.c:915 [inline]
     udp_tunnel_nic_netdevice_event+0xf34/0x1444 net/ipv4/udp_tunnel_nic.c:944
     notifier_call_chain+0x1a4/0x624 kernel/notifier.c:85
     raw_notifier_call_chain+0x3c/0x50 kernel/notifier.c:453
     call_netdevice_notifiers_info+0xb8/0x120 net/core/dev.c:2275
     call_netdevice_notifiers_extack net/core/dev.c:2313 [inline]
     call_netdevice_notifiers net/core/dev.c:2327 [inline]
     unregister_netdevice_many_notify+0xf24/0x176c net/core/dev.c:12532
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[47] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     rx_queue_release+0x128/0x1b4 net/core/net-sysfs.c:1160
     kobject_cleanup lib/kobject.c:689 [inline]
     kobject_release lib/kobject.c:720 [inline]
     kref_put include/linux/kref.h:65 [inline]
     kobject_put+0x1dc/0x4b8 lib/kobject.c:737
     net_rx_queue_update_kobjects+0x5bc/0x67c net/core/net-sysfs.c:1317
     remove_queue_kobjects net/core/net-sysfs.c:2148 [inline]
     netdev_unregister_kobject+0xe8/0x39c net/core/net-sysfs.c:2304
     unregister_netdevice_many_notify+0x123c/0x176c net/core/dev.c:12565
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[48] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     netdev_queue_release+0x68/0xec net/core/net-sysfs.c:1910
     kobject_cleanup lib/kobject.c:689 [inline]
     kobject_release lib/kobject.c:720 [inline]
     kref_put include/linux/kref.h:65 [inline]
     kobject_put+0x1dc/0x4b8 lib/kobject.c:737
     netdev_queue_update_kobjects+0x510/0x5f0 net/core/net-sysfs.c:2052
     remove_queue_kobjects net/core/net-sysfs.c:2149 [inline]
     netdev_unregister_kobject+0xf8/0x39c net/core/net-sysfs.c:2304
     unregister_netdevice_many_notify+0x123c/0x176c net/core/dev.c:12565
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[49] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     unregister_netdevice_many_notify+0x1450/0x176c net/core/dev.c:12585
     unregister_netdevice_many net/core/dev.c:12603 [inline]
     unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12404
     unregister_netdevice include/linux/netdevice.h:3492 [inline]
     nsim_destroy+0x248/0x5f8 drivers/net/netdevsim/netdev.c:1198
     __nsim_dev_port_del+0x13c/0x1ec drivers/net/netdevsim/dev.c:1472
     nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1486 [inline]
     nsim_dev_reload_destroy+0x13c/0x210 drivers/net/netdevsim/dev.c:1710
     nsim_dev_reload_down+0x9c/0xd0 drivers/net/netdevsim/dev.c:963
     devlink_reload+0x19c/0x64c net/devlink/dev.c:462
     devlink_pernet_pre_exit+0x1ac/0x30c net/devlink/core.c:578
     ops_pre_exit_list net/core/net_namespace.c:161 [inline]
     ops_undo_list+0x158/0x81c net/core/net_namespace.c:235
     cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[50] -1 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     __linkwatch_run_queue+0x538/0x79c net/core/link_watch.c:246
     linkwatch_event+0x58/0x68 net/core/link_watch.c:314
     process_one_work+0x850/0x1154 kernel/workqueue.c:3391
Call trace for netdevsim2[51] -2 at
     __dev_put include/linux/netdevice.h:4515 [inline]
     netdev_put include/linux/netdevice.h:4579 [inline]
     fib_nh_common_release+0x5c/0x268 net/ipv4/fib_semantics.c:204
     fib6_nh_release+0x1f8/0x20c net/ipv6/route.c:3740
     fib6_info_destroy_rcu+0xc8/0x20c net/ipv6/ip6_fib.c:177
     rcu_do_batch+0x36c/0xbb8 kernel/rcu/tree.c:2654
balance as of netdevsim2[51] is 1


Tested on:

commit:         5445d641 arm64: Don't read GMID_EL1 when MTE is disabled
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1554fdf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=e2af46126e0644cbebdd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16fd9901580000


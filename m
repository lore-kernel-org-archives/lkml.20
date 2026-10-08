Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9923ACA4B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432704; cv=none; b=IgZSctrxtcz0ZTmw2cjm4bYlKryoUosrtDDYS1/xzexM6qVoUSuDd+oF6Hhl/N4IC8q24ii9jEcoQ9z+BywU7r7muqJFn2X4Eg87CcIc/KDwuSxSSeDEcNBE6U9UpXXJaQLzKW5GJVdkPfxvj3hqT/Squ2+S2gBfeqqJrZauir8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432704; c=relaxed/simple;
	bh=qVAkxgdh/G5U3vm1BP7YXjq5X6bxNyh4PiAPpL5bkJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=B9QUggN7dfnNZgPVot/hPSd6uySm8//nZGt3sIeoCeQkeSIR3NbJWOuT21dtE2+GECIXnSb1zM5AlhrIQU3PnzYyZSc1J8L750FDl+3PBKa1ChN7Juh911PwhHYh0PxX49gAzH4i9K0Ercw15USOgDqcGrwPxf6PCwp/aH++J0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JISp4qgM; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JISp4qgM"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so229768a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791432702; x=1792037502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8VFR6D6ebFNgdbFt4EuG+XkogkiZPMDN26ihda2G5Y=;
        b=JISp4qgMwwCjhs5kGz04FDSsVWsXn2hYGaQ4tiGi9+Tx/X80HpYoO5SACQ8IIin/S7
         PU3FuNDi8sf5mO9OFHjorhZFVeVbY2CTF+ZZqmjTgNst1YPwqGXZ/SPpcbWfoX05SPiI
         r5stsAQ9job4ycdgh5YLthBIW7JaXweBbPkrZAvYTW7iIVG+sYaFQSSBOz/6qe+LuH/o
         tVYDTy6oArOBJqXzW+K9n+Lst/3uAtqYUfotRRqT831pId2mzIfp4sqlynE86QVvvmWC
         paQizXMnlh4kEF0+mgihhlLhdMcOikk7vZwyQd8/1wRUzOUImDtyQ8QgNeyZKhzteLTa
         xoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432702; x=1792037502;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8VFR6D6ebFNgdbFt4EuG+XkogkiZPMDN26ihda2G5Y=;
        b=1i2jkLBFGczbtSftqTQeS8cjSTzgWfwloL9IQT7vbrrdhqi7zw7rwrENwenUDZLHWj
         zjNT2uL9DWKH6msSxZIgwEDOiL+GrETEo0nWXufQJ4Cyz+TJxjiZlqbcyUVLxfGLeiGq
         ehBRu2N+Al8RO7Unyz/vDHJ249L4f8nw2rQcQpJEIM+g9scpD1ZX4DhAhbxYrl4RIq0X
         kB+jRQveMEY8hrPZ60Th3w1PmYzrUhfZkIjrojrrxseBI/pke23Ib+2olBk9oFyRSwf6
         AlknLVzqu+lPE57fAhsP7zkBo62TRwYtYojdS8C7vB5Bid2HcEAE243N///m3XJPKLC6
         H0WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDQb1KEUIOmYynrY/hEuncSjd7Xef2ZO7lrkkqZzCXaPutxXFeJvib6l24rHpEVHzvLz8cwy7W14bEwy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc167Tip/1jcCa1e+wEE/ZJS1k28LXSMbxcKJ2kfEiq8XyiPZ5
	cNNj1UFGqiRxave/6YtYid55wvz1V6QuFf/pHhnYiqHIbcab9FCE3TWN
X-Gm-Gg: AYBFou391lE5hjXCxGDCyJjXdT9AVsGdF++zPSkEqZBCEHG5hCji7m2HKRqWM6rt/OU
	mjtG3l/JD7PrC82K4jiPEqzpXJzTLTgp3XGB9iUmitspiVQGTqvAVJ1JdLp8Nuxdv5a3RdlmU/I
	mgNwdyrEbkqQJy96sER/QzYooY+PaIbvnylQ5+9IU0RERgZYyGVCHM6fdVORWUOQwkQeiCCdD2T
	zq6CutR5DBpFjNZ0qkDcrKYzn1p5Z/3hFAG5CtgJ25U+t3qWILBRR/Bi+6V0/yvLGtCRd2V8Njr
	ErmBTZ+euJzBXrL9wL51yBH6+JAJNgiQKnUfzKhK+Ep4qfYOaTYsgTPW9oaSugiqMYjm/mQymS7
	On7cbx3w8fgO5sP9U/QhSge/tZfGs50nsp5ov5l89gfhfJVXDY8hI39YBu/UnH90oZJkxB4f/IB
	ANqhqqtSAskQP1xyAtnKs88M6ufxicJIfDHUQSTrHzUrE9homnI6xvE/GgqhAO6vEdWck=
X-Received: by 2002:a17:90b:2d50:b0:3a4:930e:6c35 with SMTP id 98e67ed59e1d1-3aadff48864mr691084a91.4.1791432701701;
        Wed, 07 Oct 2026 21:11:41 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a4dbaa8csm3396151a91.4.2026.10.07.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 21:11:41 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] Bluetooth: 6lowpan: Drain RCU readers on registration failure
Date: Thu,  8 Oct 2026 12:11:35 +0800
Message-Id: <pm-bluetooth-objects-candidate-0230-v4-fd2c82b141a5bc3c5841@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A lowpan_btle_dev is embedded in its net_device allocation and must
remain alive until readers of bt_6lowpan_devices have left their RCU
sections. setup_netdev() publishes it before registration, but its
error path only unlinks it before calling free_netdev().

If a second controller's registration fails while multicast is sent
on an existing 6LoWPAN interface, send_mcast_pkt() can already have
selected the new entry. It reads entry->netdev before checking which
interface owns it. An early failure, such as allocating the device's
name node, leaves NETREG_UNINITIALIZED, so free_netdev() releases the
storage immediately.

The following ordering frees the selected entry before the reader
loads its netdev field:

  Adapter creation (controller B)       Multicast on controller A
  setup_netdev()
    list_add_rcu()
                                       rcu_read_lock()
                                       select B's entry
    lowpan_register_netdev() fails
    list_del_rcu()
    free_netdev()
                                       read entry->netdev
                                       rcu_read_unlock()

Removing the list node does not wait for that reader, and
devices_lock does not serialize the multicast reader. The subsequent
field load is a use-after-free, reported by KASAN in bt_xmit().

Wait for an RCU grace period after dropping devices_lock and before
free_netdev(). This keeps the failed adapter allocated until traversals
that could have selected it complete. The callback is already sleepable,
and the wait happens outside the list spinlock.

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in bt_xmit+0x1d06/0x21e0
    Read of size 8 at addr ffff88810ef45030 by task python3/556

    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? bt_xmit+0x1d06/0x21e0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? bt_xmit+0x1d06/0x21e0
     kasan_report+0xe0/0x110
     ? bt_xmit+0x1d06/0x21e0
     bt_xmit+0x1d06/0x21e0
     ? __pfx_bt_xmit+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_acquire+0x17b/0x2f0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_is_held_type+0x8f/0x100
     ? dev_hard_start_xmit+0x187/0x660
     ? __pfx_bt_xmit+0x10/0x10
     dev_hard_start_xmit+0x187/0x660
     sch_direct_xmit+0x153/0x850
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_sch_direct_xmit+0x10/0x10
     ? do_raw_spin_lock+0x130/0x270
     ? __pfx_do_raw_spin_lock+0x10/0x10
     ? lock_is_held_type+0x8f/0x100
     __dev_queue_xmit+0x3111/0x3aa0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? look_up_lock_class+0x59/0x130
     ? register_lock_class+0x41/0x790
     ? __pfx___dev_queue_xmit+0x10/0x10
     ? __lock_acquire+0x466/0x2260
     ? find_held_lock+0x2b/0x80
     ? ___neigh_create+0x1690/0x2540
     ? __local_bh_enable_ip+0xa6/0x120
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lockdep_hardirqs_on_prepare+0xea/0x1a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_acquire+0x17b/0x2f0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? find_held_lock+0x2b/0x80
     ? ip6_finish_output2+0x8be/0x1840
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? neigh_connected_output+0x39f/0x4e0
     ? srso_alias_return_thunk+0x5/0xfbef5
     neigh_connected_output+0x33f/0x4e0
     ip6_finish_output2+0x8be/0x1840
     ip6_finish_output+0x424/0xd50
     ip6_output+0x210/0x640
     ? __pfx_ip6_mr_output+0x10/0x10
     ip6_local_out+0x193/0x1c0
     ip6_send_skb+0xfb/0x3e0
     udp_v6_send_skb+0x6e1/0x1180
     udpv6_sendmsg+0x1f9b/0x2a00
     ? get_random_u32+0xaf/0x640
     ? __pfx_udpv6_sendmsg+0x10/0x10
     ? lock_release+0xc8/0x280
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lockdep_hardirqs_on_prepare+0xea/0x1a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __local_bh_enable_ip+0xa6/0x120
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_udpv6_sendmsg+0x10/0x10
     ? inet6_sendmsg+0xff/0x140
     inet6_sendmsg+0xff/0x140
     __sys_sendto+0x320/0x470
     ? __pfx___sys_sendto+0x10/0x10
     ? exc_page_fault+0x5c/0xc0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? handle_mm_fault+0x12e/0x580
     __x64_sys_sendto+0xe5/0x1c0
     ? lockdep_hardirqs_on_prepare+0xea/0x1a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    Allocated by task 502:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kvmalloc_node_noprof+0x353/0x930
     alloc_netdev_mqs+0xa0/0x1250
     chan_ready_cb+0x198/0x1110
     l2cap_recv_frame+0x6dc0/0x8830
     l2cap_recv_acldata+0xe9f/0x10e0
     hci_rx_work+0x5a6/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 502:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     free_netdev+0x6ca/0x8f0
     chan_ready_cb+0xd91/0x1110
     l2cap_recv_frame+0x6dc0/0x8830
     l2cap_recv_acldata+0xe9f/0x10e0
     hci_rx_work+0x5a6/0xf00
     process_one_work+0x908/0x19c0
     worker_thread+0x65c/0xe40
     kthread+0x34f/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff88810ef44000
                                                                which
                                belongs to the cache kmalloc-8k of size
                                8192
    The buggy address is located 4144 bytes inside of
                                                                freed
                                8192-byte region [ffff88810ef44000,
                                ffff88810ef46000)

    The buggy address belongs to the physical page:
        page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0
    pfn:0x10ef40
    head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
    flags: 0x200000000000040(head|node=0|zone=2)
    page_type: f5(slab)
        raw: 0200000000000040 ffff888100043180 dead000000000100
    dead000000000122
        raw: 0000000000000000 0000000000020002 00000000f5000000
    0000000000000000
        head: 0200000000000040 ffff888100043180 dead000000000100
    dead000000000122
        head: 0000000000000000 0000000000020002 00000000f5000000
    0000000000000000
        head: 0200000000000003 fffffffffffffe01 00000000ffffffff
    00000000ffffffff
        head: ffff88810ef41a80 0000000000000000 00000000ffffffff
    0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff88810ef44f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ffff88810ef44f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
    >ffff88810ef45000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                         ^
     ffff88810ef45080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
     ffff88810ef45100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
    ==================================================================
    Disabling lock debugging due to kernel taint

Fixes: 5857d1dbae7d ("Bluetooth: 6lowpan: Fix possible race")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index 836add41f5d16f1df81042cbf9ba9b927e883eb8..0f6a45509d71c20bd556ad987e05f2fa1b0ab26b 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -706,6 +706,7 @@ static int setup_netdev(struct l2cap_chan *chan, struct lowpan_btle_dev **dev)
 		spin_lock(&devices_lock);
 		list_del_rcu(&(*dev)->list);
 		spin_unlock(&devices_lock);
+		synchronize_rcu();
 		free_netdev(netdev);
 		goto out;
 	}

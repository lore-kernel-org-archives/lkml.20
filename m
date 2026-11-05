Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921816;
	b=5bQzWP581ImGf3aXRdLBwM1TfYKZVfE7IYQV4F1JdcANS5sdGqy2ZA6vh68FLE+TIMRh
	 76KiUbHV6jHjh73dWty78gYpmddWtPJKyNVTx5DtxOoL8r+dj+UaoEnGi4pqdSyyqhIOf
	 II2LbhtPQ3YQVkathoLCdkjeMOshoTRvkmZdpJ8jdC+bLM5+/oywtb8zuxpWCW1HtZpln
	 gTBshfC99N+Lyex0raY7+sIQc97RsIBjhH57EnQuYPtzFapf96NueJSkCsiRO3fA4Cmiv
	 9Qw8GlMo0P0JR0GGzCeFqcPKu/dcZxP7+QoSDPzt2vc0830PL7+1rku6GFfCkBnLvLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kw5CN/zDZGWnUvpMh1iN95EXdgWyNQnX+yLpTBLlMQs=;
	b=WJ6jcIc/rZnglQ55xqp+qjSnoMmVB/pkWFBnOZvb4ZWig1zMzL2E6BgULNU+WgFU2nrB
	 3Min3UL+2+vn3sd69zlXctXAFeJpNzf+hq3i/by+TnNWQNVGPBZHmcO+K8E1JHpOTfVc0
	 aMrchU+Gbqsti2WFLZv3lPQvIGEMrrJ0xvHal9KTAXJUE0FLZ1Uu/vhmM26tN6ffTJa/n
	 DeEEqT+5hFnKKihGA8V5Caoo4TTM9BsUUfMg0aXo64FHvJ8/fZTNyhTPw94CgPVeQdvwh
	 uwboyFObim15gyBFXc4lHC35s1AMhREKxfJTzC24QgF0iZF9oujp5escgdf2qdySepA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOXgTQnJ;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244EF606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 244EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOXgTQnJ
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f3c895a0eso6691585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921814; x=1794526614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kw5CN/zDZGWnUvpMh1iN95EXdgWyNQnX+yLpTBLlMQs=;
        b=mOXgTQnJ8JXx+VRFug0fpaMJkBkZPbuzt/hFAfflNhVYYKmdPfXZaKd1CONjec4GFc
         08NqGdCJpEEx++ZOSEBYeJQQBhhL56SsMZcfH/TaKxf4X5HF0GS0pp62oeZVBOF8hbVF
         chHKblA8sH3BAJ1ZnQ3Ag779Z6CjQD1UoaW98V8R7+gokP5GA+3k3jHqCbPCtR1OnL3V
         FepYt1+Kz1aIxeoPJgg9uSqPspxs5TVuq6BnnSlxY/9tkwskJGM8q/rVpZL3Mg5j2Kzy
         W1Qp3kz2jonmM7PbcqkpyXd7m7gAvscdMXIuJ97Vvn0Bo32NlAEz2N4W6BIZPAvLZUFV
         wbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921814; x=1794526614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kw5CN/zDZGWnUvpMh1iN95EXdgWyNQnX+yLpTBLlMQs=;
        b=TA8GDcOBgz/fW3rp0dqzWjMqsFL2sjk6zzR2BT+xUMvaTOuUUy1hySM4HgztKqpHIB
         CE4PTP1Yji5QngJK7JWSEHJRb08OEDOuGFneazrE7xNZqWKynNZCBERy+vZE8DEMcm7X
         N6u7R9Akkbw4P7+AggGeuOMQ+fBfPUFEe270cxiBnOWC0AHKOGy5E0KEFi3muZN6ZM0u
         E5ISezJIGyHYX/i8AeANQuoGr2laCHlPqjW1/X+zYjUcRWdYnAZaxb/J/Lg+OeCPp19S
         EVKX255+8m9/dcgh8IHYUriPDU4VddsVKVguFJmJWT4jV19l3Fn/NSIg3NLN9Ap6b+ao
         hFlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5ONAdZIyoO8USo9kNhjOfMmlYXClqD0OJjBY+gstapP0XBrtPj7rBwY22eGjGifmFTuj3LcmIe1XyBrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CWFo0fL8Uk90Q7fz4vnVUVm21nqwKDNOjz4T8NWdSy07UEnQ9
	1kaPfMy+dwVzGZ7ne0nx0qcaZzcsD8zTvADeyV61m722wAdybO4u9R4S
X-Gm-Gg: AYBFou2aGKRjExD4wH4wkUbhD4wISuTM3xNB+AHlM+NsU/9bbVbnsNzJFxreav5nV2p
	qql0eufxKmCWciUuMjXe/bVYMNImn3L82cwMeiXvKGXu73UX33ADVJELBUk9J5EZA8dHReGktfC
	jRMZ0DPDwsyMOaNzYBNDNiOYBvmu96mXNhLswWVwNpYefxsNiclNM1FcA/2vbzZaKuGizKFtxsW
	n7lp+/K+gYJsqpekeF40Co1WagX6KebmVjD8PnnDVKVPIQA+AFiu7x1JIugj12YGJrwZKiJuknR
	ZUxzrVZbZ6XOJFGsq8y/FRHbzavZsP17znmmyNiNyNjlJ71lLL6CytZN4yAKrYlnr9z/5ZYM5GT
	o5R5Y1taALGkJ9djheHu4oUTMROErRWvHX4wxZkqQsNERjUCPV1ZV7oOP3Ekd2VvfKSYKw4zd7F
	9tYQa1q+EJ2ZmpJcrarKjJGM3rnXS32Q/jmiWMekaknA3psyWWkzq+vmMzS+jIAYyjSqLSDo6vX
	/V9I41kb04Hk7d5lWLGUIP//mXhOqCr9U6++T0AB1yjE87pvzHs7nz31QXnFg4wgmQp2J/Spa0+
	xjPaPsn4cGp+PTCdexAPzACY785XMAUANEcmTdoWfWfGpLMPeKxFqqR21uk=
X-Received: by 2002:a05:620a:4011:b0:93f:5717:e7bf with SMTP id af79cd13be357-945f3501802mr135221885a.46.1793921813943;
        Thu, 05 Nov 2026 15:36:53 -0800 (PST)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f58c1bdasm7732985a.2.2026.11.05.15.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:36:53 -0800 (PST)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	luoqing <luoqing@kylinos.cn>,
	Florian Westphal <fw@strlen.de>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] RDMA/core: slab-use-after-free in iwpm_mapping_error_cb
Date: Thu,  5 Nov 2026 18:36:39 -0500
Message-ID: <20261105233640.1667884-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in _raw_spin_lock_irqsave

This report is in the IWPM request path in
drivers/infiniband/core/iwpm_msg.c, reached through an SIW RDMA-CM listen.

on commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d (2026-11-03, 7.4.0-rc1)

To help trigger the bug more reliably, we applied a minimal diagnostic patch
that only adds delays and print statements.

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/14982f04cdb92f49d184d4a557a7f645

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[  185.163150] ==================================================================
[  185.163167] BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave (./include/linux/instrumented.h:112 ./include/linux/atomic/atomic-instrumented.h:1300 ./include/asm-generic/qspinlock.h:112 ./include/linux/spinlock.h:188 ./include/linux/spinlock_api_smp.h:156 kernel/locking/spinlock.c:181)
[  185.163192] Write of size 4 at addr ffff8881105178a8 by task iwpm_uaf_repro/326
[  185.163202]
[  185.163224] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  185.163231] Call Trace:
[  185.163240]  <TASK>
[  185.163246]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[  185.163262]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[  185.163290]  kasan_report (mm/kasan/report.c:595)
[  185.163327]  _raw_spin_lock_irqsave (./include/linux/instrumented.h:112 ./include/linux/atomic/atomic-instrumented.h:1300 ./include/asm-generic/qspinlock.h:112 ./include/linux/spinlock.h:188 ./include/linux/spinlock_api_smp.h:156 kernel/locking/spinlock.c:181)
[  185.163365]  up (kernel/locking/semaphore.c:225)
[  185.163399]  iwpm_mapping_error_cb (drivers/infiniband/core/iwpm_msg.c:830)
[  185.163424]  netlink_dump (net/netlink/af_netlink.c:2359)
[  185.163478]  __netlink_dump_start (net/netlink/af_netlink.c:2474)
[  185.163490]  rdma_nl_rcv (./include/linux/netlink.h:341 drivers/infiniband/core/netlink.c:190 drivers/infiniband/core/netlink.c:239 drivers/infiniband/core/netlink.c:259)
[  185.163565]  netlink_unicast (net/netlink/af_netlink.c:1335 net/netlink/af_netlink.c:1361)
[  185.163578]  netlink_sendmsg (net/netlink/af_netlink.c:1920)
[  185.163625]  __sock_sendmsg (net/socket.c:800 net/socket.c:818)
[  185.163634]  ____sys_sendmsg (net/socket.c:2715)
[  185.163675]  ___sys_sendmsg (net/socket.c:2769)
[  185.163731]  __x64_sys_sendmsg (net/socket.c:2801 net/socket.c:2806 net/socket.c:2804 net/socket.c:2804)
[  185.163784]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[  185.163795]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[  185.163878] RIP: 0033:0x7f3882776e4d
[  185.163896] Code: 28 89 54 24 1c 48 89 74 24 10 89 7c 24 08 e8 ca ee ff ff 8b 54 24 1c 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 44 24 08 e8 fe ee ff ff 48
All code
========
   0:	28 89 54 24 1c 48    	sub    %cl,0x481c2454(%rcx)
   6:	89 74 24 10          	mov    %esi,0x10(%rsp)
   a:	89 7c 24 08          	mov    %edi,0x8(%rsp)
   e:	e8 ca ee ff ff       	call   0xffffffffffffeedd
  13:	8b 54 24 1c          	mov    0x1c(%rsp),%edx
  17:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  1c:	41 89 c0             	mov    %eax,%r8d
  1f:	8b 7c 24 08          	mov    0x8(%rsp),%edi
  23:	b8 2e 00 00 00       	mov    $0x2e,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 33                	ja     0x65
  32:	44 89 c7             	mov    %r8d,%edi
  35:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  3a:	e8 fe ee ff ff       	call   0xffffffffffffef3d
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 33                	ja     0x3b
   8:	44 89 c7             	mov    %r8d,%edi
   b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  10:	e8 fe ee ff ff       	call   0xffffffffffffef13
  15:	48                   	rex.W
[  185.163909] RSP: 002b:00007f3881d8a620 EFLAGS: 00000293 ORIG_RAX: 000000000000002e
[  185.163932] RAX: ffffffffffffffda RBX: 00007f3881d8a688 RCX: 00007f3882776e4d
[  185.163945] RDX: 0000000000000000 RSI: 00007f3881d8a680 RDI: 0000000000000004
[  185.163967] RBP: 00007f3881d8a6c0 R08: 0000000000000000 R09: 00007f3881d8b700
[  185.163978] R10: 0000000000000000 R11: 0000000000000293 R12: 00000000000000b3
[  185.163988] R13: 00007ffd06f50dc0 R14: 00007f3881d8a664 R15: 00007f3881d8a680
[  185.164008]  </TASK>
[  185.164014]
[  185.164019] Allocated by task 324 on cpu 0 at 184.443436s:
[  185.164033]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[  185.164049]  __kasan_kmalloc (mm/kasan/common.c:409 mm/kasan/common.c:426)
[  185.164063]  iwpm_get_nlmsg_request (./include/linux/slab.h:991 ./include/linux/slab.h:1312 drivers/infiniband/core/iwpm_util.c:313)
[  185.164082]  iwpm_add_mapping (drivers/infiniband/core/iwpm_msg.c:168)
[  185.164094]  iw_cm_map (drivers/infiniband/core/iwcm.c:537)
[  185.164110]  iw_cm_listen (drivers/infiniband/core/iwcm.c:580)
[  185.164126]  rdma_listen (drivers/infiniband/core/cma.c:2694 drivers/infiniband/core/cma.c:3988)
[  185.164140]  cma_listen_on_dev (drivers/infiniband/core/cma.c:2757)
[  185.164157]  cma_add_one (drivers/infiniband/core/cma.c:5445)
[  185.164172]  add_client_context (drivers/infiniband/core/device.c:755)
[  185.164191]  enable_device_and_get (drivers/infiniband/core/device.c:1375)
[  185.164208]  ib_register_device (drivers/infiniband/core/device.c:1503)
[  185.164225]  siw_newlink (drivers/infiniband/sw/siw/siw_main.c:71 drivers/infiniband/sw/siw/siw_main.c:433)
[  185.164243]  nldev_newlink (drivers/infiniband/core/nldev.c:1859)
[  185.164267]  netlink_unicast (net/netlink/af_netlink.c:1335 net/netlink/af_netlink.c:1361)
[  185.164274]  netlink_sendmsg (net/netlink/af_netlink.c:1920)
[  185.164283]  __sock_sendmsg (net/socket.c:800 net/socket.c:818)
[  185.164290]  ____sys_sendmsg (net/socket.c:2715)
[  185.164299]  ___sys_sendmsg (net/socket.c:2769)
[  185.164309]  __x64_sys_sendmsg (net/socket.c:2801 net/socket.c:2806 net/socket.c:2804 net/socket.c:2804)
[  185.164318]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[  185.164328]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[  185.164336]
[  185.164339] Freed by task 324 on cpu 0 at 184.947212s:
[  185.164346]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[  185.164354]  kasan_save_free_info (mm/kasan/generic.c:584)
[  185.164365]  __kasan_slab_free (mm/kasan/common.c:264 mm/kasan/common.c:296)
[  185.164374]  kfree (./include/linux/kasan.h:235 mm/slub.c:2780 mm/slub.c:6630 mm/slub.c:6923)
[  185.164382]  iwpm_add_mapping (drivers/infiniband/core/iwpm_msg.c:217)
[  185.164390]  iw_cm_map (drivers/infiniband/core/iwcm.c:537)
[  185.164400]  iw_cm_listen (drivers/infiniband/core/iwcm.c:580)
[  185.164410]  rdma_listen (drivers/infiniband/core/cma.c:2694 drivers/infiniband/core/cma.c:3988)
[  185.164418]  cma_listen_on_dev (drivers/infiniband/core/cma.c:2757)
[  185.164428]  cma_add_one (drivers/infiniband/core/cma.c:5445)
[  185.164438]  add_client_context (drivers/infiniband/core/device.c:755)
[  185.164449]  enable_device_and_get (drivers/infiniband/core/device.c:1375)
[  185.164459]  ib_register_device (drivers/infiniband/core/device.c:1503)
[  185.164470]  siw_newlink (drivers/infiniband/sw/siw/siw_main.c:71 drivers/infiniband/sw/siw/siw_main.c:433)
[  185.164481]  nldev_newlink (drivers/infiniband/core/nldev.c:1859)
[  185.164499]  netlink_unicast (net/netlink/af_netlink.c:1335 net/netlink/af_netlink.c:1361)
[  185.164505]  netlink_sendmsg (net/netlink/af_netlink.c:1920)
[  185.164513]  __sock_sendmsg (net/socket.c:800 net/socket.c:818)
[  185.164520]  ____sys_sendmsg (net/socket.c:2715)
[  185.164529]  ___sys_sendmsg (net/socket.c:2769)
[  185.164538]  __x64_sys_sendmsg (net/socket.c:2801 net/socket.c:2806 net/socket.c:2804 net/socket.c:2804)
[  185.164547]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[  185.164556]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[  185.164563]
[  185.164566] The buggy address belongs to the object at ffff888110517880
[  185.164566]  which belongs to the cache kmalloc-64 of size 64
[  185.164574] The buggy address is located 40 bytes inside of
[  185.164574]  freed 64-byte region [ffff888110517880, ffff8881105178c0)
[  185.164583]
[  185.164586] The buggy address belongs to the physical page:

Best,
Shuangpeng

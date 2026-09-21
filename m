Received: from mail-qk2-f27.google.com (mail-qk2-f27.google.com [74.125.230.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C327333344A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961655; cv=none; b=P8cxMTdv6+7P2nJ9dIQMbL4E0w92yYtgW9PUnpH5SH2EaeLmuqSRvAqjrAK0a/nV4QWfrnkERVsjOgyT5uV7iwYpJ4HbbbsDMsxYCi7rpyftuGroWOEYUh5eHcLp6zvnoy/BsVgJq/tLAY4uVyugI4swQ8VQkbyJ6juTcXelBjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961655; c=relaxed/simple;
	bh=WZqsK7BablMg3uJYAL8SiTAmrliVfgZmKZ5qsVpYP6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0wzPHoE6zpA6Nk1yvAmPVJJqBTUC4rn7uTjTlWKz2oWlUcE15f58Z62hyaZCYYblrTj/KlZJKsLzxf/7OlgGfgS9bYGWFVxhuaLZbPNOcohPW/IU2IqjtoLtdcGqxT8qld7ES7dSEf6vYt/ySZtBSxgXKZw17bRlhOLPVICXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrvVLd+w; arc=none smtp.client-ip=74.125.230.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrvVLd+w"
Received: by mail-qk2-f27.google.com with SMTP id af79cd13be357-939ca12ab70so320153085a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961652; x=1790566452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EzaPtthhhqRzlEoVTWSoFvonGQWTcr1AilXJoZMQT/A=;
        b=IrvVLd+wjYHYcyC0zRM1HV+gPEs35Chff2MnTrh+Tikt6cj1xS0OJg5sYow+aVKsfW
         wPliTM2yxKUBVrCEfiriGQMLtjRrjdwSCyovtMqbVkET3YLaiVGh06muYqaE17c/ROx6
         /bHAknD9+t72Cb+NO1K7CROiP3MMy1BtyaFf3I4Hw8WCib2yuy9/LRbepe1x/oMkWdRv
         7+rcRiQhQRlM2mivrKTGCOqHFy+jTbNggr17ThZTAwMCUz1l9mnTcyjHn3sWzFfBc7fH
         Fqy4nLKkFvSPlkHXo4/fE93mH33t0FbVXhQQ8Whhw24AO3pdVG/VHSyC2fiVFXB8bmt5
         OO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961652; x=1790566452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzaPtthhhqRzlEoVTWSoFvonGQWTcr1AilXJoZMQT/A=;
        b=mtFuu6rH9TlmVzlIeSqtMplLLNgK4sSPIu/lY5YF0QlhDM44YURSoDSmQQoHa1L3as
         DUm6UelaAKtLWcNPBRqXVbQ4tAIiF+o9la/BzuU2Oo8amMRfJYQXFOeQbUMuITP66w3X
         CSNO1r/H93ARcLknr05irTrrBKQQqH+/2BdoPtqFSFzG+sm84dfRBYD3VZFroREBXj9A
         YxhMAEfLxpoGRfQflLq4HKJiTOEIxrXHw9P0/JYloC7xozj5LbRL5FUfuDPNUwSsUz8T
         HpHN+v3csTYT1iUlhes7EGf92EsrLQzKFE13tRviHtJ6YDsJ6/8FluOL5xb65jOf4+/l
         nCOA==
X-Forwarded-Encrypted: i=1; AKwUvBzAiQrieWn6xn9/LOI0CF2rhMtu5bHeZ2fH+jIkqU8BMYmiXhokvGGWOtca6MokNspC0BSyIgM80qoZYTE=@vger.kernel.org
X-Gm-Message-State: AFuF++lidKSnUOVfMUXNfbFMWjo56Mc/3RACxlhg2bFRD0xIZgT1pb1b
	hY1BH/axSfNKM9qSzTgnuGNyV5p7QaRocJC7+KIK5dAFAi88UHjFy8bK
X-Gm-Gg: AYBFou2TCnNi3E6A3kKhkXUxsPHvffZLjWlh5ucb3GNeUOJDIL5E4m/FfWKCFXb3waX
	EdKmAUu3c2FZnNgdqEdOR85ANOjWSjRfprASQC6qtAodWTwUM7w3sK7CBSEvf0Ozf3DK0MWVL7o
	VEW88nTSZANeQbi9ZaF33f0i+o6rHaCKHT4DGm8HGqeKoduG1UZy4Hs6dWHKvPohXnKaR1zld3n
	BQvKrNgbeyJ3Gu5kUOejBk342Hg47X3kjKEXYB96uOcP8GYA62rhV5+AMJGRe2SJj76I5p5/bdc
	U7B2F+Lu4h2kadMRaOepDo5Ps59+oGda0WpWx7vFpRxEVHUNt1vK0xnbtr2i7dIXdSnZybnuREX
	OggEwjUMGaJ8RrY5FVndqTLFPGBjbRzh/qxgHugnuUngKxpXlqEo9b2KL/TEmaExKh4YPSXfIiE
	8YE1Xd1901bONd4FxH0hDUPfkoPbGL+euHunlCPozNAHu6cgvtt9hTsTiuDH0STGfKEkMZsyXEM
	r5mhbzvdzzs7mU7RX4UI3/3GBcH
X-Received: by 2002:a05:620a:600c:b0:939:a834:98f2 with SMTP id af79cd13be357-93bf5524001mr917952985a.15.1789961651826;
        Sun, 20 Sep 2026 20:34:11 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93beda707c2sm549277685a.16.2026.09.20.20.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:34:11 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] RDMA/rtrs-clt: race between close_work submission and synchronous close
Date: Sun, 20 Sep 2026 23:33:36 -0400
Message-ID: <20260921033339.1320291-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in rtrs_clt_stop_and_destroy_conns

on commit: 93f51579e7df248780214094418f205253383cc5 (2026-09-20)

To help trigger the bug more reliably, we applied a minimal diagnostic patch
that only adds delays and print statements.

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/1b0782d283051b34df6548d387be90a6

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[   86.996512] ==================================================================
[   86.996866] BUG: KASAN: slab-use-after-free in rtrs_clt_stop_and_destroy_conns (./include/linux/instrumented.h:82 ./include/linux/atomic/atomic-instrumented.h:32 drivers/infiniband/ulp/rtrs/rtrs-clt.c:2237)
[   86.996866] Read of size 4 at addr ffff8881038672fc by task kworker/0:0/9
[   86.996866]
[   86.999871] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   86.999871] Workqueue: rtrs_client_wq rtrs_clt_close_work
[   86.999871] Call Trace:
[   87.001599]  <TASK>
[   87.001599]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[   87.001599]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[   87.001599]  kasan_report (mm/kasan/report.c:595)
[   87.001599]  kasan_check_range (mm/kasan/generic.c:? mm/kasan/generic.c:200)
[   87.001599]  rtrs_clt_stop_and_destroy_conns (./include/linux/instrumented.h:82 ./include/linux/atomic/atomic-instrumented.h:32 drivers/infiniband/ulp/rtrs/rtrs-clt.c:2237)
[   87.001599]  rtrs_clt_close_work (drivers/infiniband/ulp/rtrs/rtrs-clt.c:2364)
[   87.001599]  process_scheduled_works (kernel/workqueue.c:3396 kernel/workqueue.c:3479)
[   87.001599]  worker_thread (kernel/workqueue.c:3560)
[   87.001599]  kthread (kernel/kthread.c:436)
[   87.001599]  ret_from_fork (arch/x86/kernel/process.c:158)
[   87.001599]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
[   87.001599]  </TASK>
[   87.001599]
[   87.001599] Allocated by task 1 on cpu 1 at 34.840929s:
[   87.001599]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[   87.001599]  __kasan_kmalloc (mm/kasan/common.c:398 mm/kasan/common.c:415)
[   87.001599]  alloc_path (./include/linux/slab.h:991 ./include/linux/slab.h:1312 drivers/infiniband/ulp/rtrs/rtrs-clt.c:1544)
[   87.001599]  rtrs_clt_open (drivers/infiniband/ulp/rtrs/rtrs-clt.c:2870)
[   87.001599]  rnbd_clt_map_device (drivers/block/rnbd/rnbd-clt.c:1268 drivers/block/rnbd/rnbd-clt.c:1551)
[   87.001599]  rnbd_clt_map_device_store (drivers/block/rnbd/rnbd-clt-sysfs.c:612)
[   87.001599]  kernfs_fop_write_iter (fs/kernfs/file.c:345)
[   87.001599]  vfs_write (fs/read_write.c:595 fs/read_write.c:687)
[   87.001599]  ksys_write (fs/read_write.c:739)
[   87.001599]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[   87.001599]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   87.001599]
[   87.001599] Freed by task 1 on cpu 1 at 56.591404s:
[   87.001599]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[   87.001599]  kasan_save_free_info (mm/kasan/generic.c:584)
[   87.001599]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
[   87.001599]  kfree (./include/linux/kasan.h:235 mm/slub.c:2748 mm/slub.c:6508 mm/slub.c:6801)
[   87.001599]  kobject_put (lib/kobject.c:689 lib/kobject.c:720 ./include/linux/kref.h:65 lib/kobject.c:737)
[   87.001599]  rtrs_clt_close (drivers/infiniband/ulp/rtrs/rtrs-clt.c:2933)
[   87.001599]  free_sess (drivers/block/rnbd/rnbd-clt.c:754 drivers/block/rnbd/rnbd-clt.c:766)
[   87.001599]  rnbd_clt_put_dev (drivers/block/rnbd/rnbd-clt.c:48 drivers/block/rnbd/rnbd-clt.c:61)
[   87.001599]  rnbd_clt_unmap_device (drivers/block/rnbd/rnbd-clt.c:1703)
[   87.001599]  rnbd_clt_unmap_dev_store (drivers/block/rnbd/rnbd-clt-sysfs.c:334)
[   87.001599]  kernfs_fop_write_iter (fs/kernfs/file.c:345)
[   87.001599]  vfs_write (fs/read_write.c:595 fs/read_write.c:687)
[   87.001599]  ksys_write (fs/read_write.c:739)
[   87.001599]
[   87.001599] Last potentially related work creation:
[   87.001599]  kasan_save_stack (mm/kasan/common.c:57)
[   87.001599]  kasan_record_aux_stack (mm/kasan/generic.c:556)
[   87.001599]  insert_work (kernel/workqueue.c:2272)
[   87.001599]  __queue_work (kernel/workqueue.c:2448)
[   87.001599]  queue_work_on (kernel/workqueue.c:2501)
[   87.001599]  rtrs_clt_close_conns (./include/linux/workqueue.h:700 drivers/infiniband/ulp/rtrs/rtrs-clt.c:1967)
[   87.001599]  rtrs_clt_rdma_cm_handler (drivers/infiniband/ulp/rtrs/rtrs-clt.c:2063)
[   87.001599]  cma_cm_event_handler (drivers/infiniband/core/cma.c:2181)
[   87.001599]  cma_process_remove (drivers/infiniband/core/cma.c:5313 drivers/infiniband/core/cma.c:5346)
[   87.001599]  cma_remove_one (drivers/infiniband/core/cma.c:5453)
[   87.001599]  remove_client_context (drivers/infiniband/core/device.c:810)
[   87.001599]  disable_device (drivers/infiniband/core/device.c:1325)
[   87.001599]  __ib_unregister_device (drivers/infiniband/core/device.c:1571)
[   87.001599]  ib_unregister_device_and_put (drivers/infiniband/core/device.c:1636)
[   87.001599]  nldev_dellink (drivers/infiniband/core/nldev.c:1902)
[   87.001599]  rdma_nl_rcv (drivers/infiniband/core/netlink.c:? drivers/infiniband/core/netlink.c:239 drivers/infiniband/core/netlink.c:259)
[   87.001599]  netlink_unicast (net/netlink/af_netlink.c:1338 net/netlink/af_netlink.c:1364)
[   87.001599]  netlink_sendmsg (net/netlink/af_netlink.c:1919)
[   87.001599]  __sock_sendmsg (net/socket.c:800 net/socket.c:815)
[   87.001599]  __sys_sendto (net/socket.c:2281)
[   87.001599]  __x64_sys_sendto (net/socket.c:2288 net/socket.c:2284 net/socket.c:2284)
[   87.001599]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[   87.001599]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   87.001599]
[   87.001599] The buggy address belongs to the object at ffff888103867000
[   87.001599]  which belongs to the cache kmalloc-2k of size 2048
[   87.001599] The buggy address is located 764 bytes inside of
[   87.001599]  freed 2048-byte region [ffff888103867000, ffff888103867800)
[   87.001599] ==================================================================


Best,
Shuangpeng

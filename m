Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C9848C8DC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045108; cv=none; b=QSUBBYCWZLHlzdL7ZopDoR/sxJrTo/0Br+dioQYdFoZ28GYlyyO6oLfs++1iE6TtmJVN4i5tYBbg4t8D+4qOSrfMGHkJ5gDdgBb06ehsoYy/wUAoGN8YXliVEyKbXEOPb/NLAx0sxFe+1pp9VSSx6m6Dj/tdcfqpA6/ahm1kpkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045108; c=relaxed/simple;
	bh=1lAU43YWVdr5DDXvmYDk056t5S5n1HW3hiJrh30a2s4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=emEfQPpfxhY8kdtFCQjBfJ0NgNkkJKs8M7hujlMa9ERSXwlsTNM93Lr317f/RCAMvuiGpPtXX0H+1aDDDxAoKD1taTR5mik+lJ2p+yn8GtAaZhSoXLEqoa0x2MxPqZsHpxXCwjHt0oo1Yf+F55O5NszBMfk8QfLg8+W1kZjK6fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5fBV13o; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5fBV13o"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso45711295e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792045099; x=1792649899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AYy87NBCVnHsw0Sw6rkQhtJDHEE+dUu5u4tUQ3Od5eM=;
        b=L5fBV13oLMob9/GWFm2qHx8BhKI6OZd4cYMwgQ7RqnBJlFRlni6t30Nrz20d0hhKhD
         Ti4YJRFWDL9SRtkD7N9W6ghgzCGp6w2hEq0KUe6dDNtczIqxgc+txu7qfR3PaFijE8c7
         cw89ddIl28EnPIwUVYdLyeg24eI5cE2DG7fdApHHItHbk/ILR7JbibJef3zjzfVurRIl
         I7X/gjswq8kJoaSXd4oGevSqu2hSaglaiJQPpaVLDL5nBRzXqKgZEN14EtRFd49T0z++
         SK/YvDjiNTEybWySf/KC+VzAFwoe7Xb/wy2mGXPnkpKk6Lcus6ui8/UHhb0YaDnwRDxV
         bxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045099; x=1792649899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYy87NBCVnHsw0Sw6rkQhtJDHEE+dUu5u4tUQ3Od5eM=;
        b=1j+gHWd1JymyohtsWArx4w1RCsA/GICeeQntDtQ7EaQDbuRarT1UIhSOPJuWz6ksUd
         W9zCDO1XNUt2XNLRL9oN40Ib837FG7KuZYqL/pY6p/6aMlc4Uaa/ZF5MLIjbzyLWV5FH
         +8ulRGcTVZXL7xQrup3ACHDurFZZkwZBwiXRSC5fzEsM2bTCCITC2tNELcVrhP4tCKQ+
         FRhG9gPH6uKULK3D6I+dK3C4ggVk3AEIm7zTD61OT4hSV5Bp7tggGQqIb/fmh2aO1G7Z
         vZqA3CML6pxuwNoKoykruj8LbyRdiePoK2EtTdzIsV61nEWZsE0xi5w/ZteG78u98u4N
         WbRw==
X-Forwarded-Encrypted: i=1; AKwUvBx5gsMK+wdmQQZ2xeZTXVeIS2suYZL2MY2/xx+weRDIVX3H8LrR8WbKtg0CW+TZOvt9wgZuz0trdr8NLfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrPK9othuNLfHfkn4GmfrGcl0TlMEKcp1ahU7ZFDXV0w46DkGO
	zMdUzw9EQ2TNVkOsyAyv69D+ztZzzvTQfdlf0vhiliVmpQ2ejctxIREqgIUDJUPw
X-Gm-Gg: AYBFou0ShYv+bt3XdwL2Fwq6Xi4xYw9tFJ5teIxhIHOzNcs7RThgFIKZOhFkKDsnae6
	b7OVFb4ihWlRQHwjyk5uGmzO6qo0jKHa2Zq4WNo49MTODQgeoMWZnZ1RrzHoxNbT+PP99veGB6t
	u7xnAdELR7mczVezFdoLC2dyhTvPvVoznaPidmJQPkLonlkNX1WgSarulxrIkABfC1jrmYbyeLf
	COnrri5Gcypzc0ZONRFxK7poBywF5PKmRm9kXdmbEX6CjRyblm0YTedhjLmaSOq8VfbLDgS+VUp
	q+sNc+1XX2a2AGI5pkP7+hudkQWWePTXS15oybZcDeBrs4XW3QDRC8i42tNwGlPuyNJ1GqO2IGF
	hmAo6eGdStOodOIvEtOLtHwoyJTRTxyZ4PZfGa1ufGKZsKB8tO6GZc5+nurWaYkLQgPfsmxlwjr
	k6ynwT/9VOyAUf1P/YbqV+5UBvfMx8CEuCcedrJmlBpL8/tQW5WGs08F62gr8ZQ/A1aLIWucywF
	73qD+Cko+28052Qtl22XKLjiok8CFNqSA3QRVAHsWW8NAybBe1QdjEzCj6pY8VRs5n8cLuWqNZ0
	z8kCMH+Ftvu9uSdNyP1WgLDJj3MdLGry5Q21dHcuXQpJxx89Pkzw9pNMLpr6PZHewEr1NFnSW3D
	anQ==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr329784855e9.15.1792045098660;
        Wed, 14 Oct 2026 23:18:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67b125sm33020125e9.3.2026.10.14.23.18.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 23:18:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>
Cc: David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	ceph-devel@vger.kernel.org,
	netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] ceph: uninitialized err causes buffered read use-after-free
Date: Thu, 15 Oct 2026 08:18:05 +0200
Message-Id: <20261015061805.3366-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An ordinary unencrypted CephFS buffered read triggers a slab
use-after-free on v7.3-rc5.

ceph_netfs_issue_read() leaves err uninitialized on the successful
non-sparse path:

        ceph_osdc_start_request(req->r_osdc, req);
out:
        ceph_osdc_put_request(req);
        if (err) {
                subreq->error = err;
                netfs_read_subreq_terminated(subreq);
        }

CONFIG_INIT_STACK_ALL_ZERO masks this bug. With
CONFIG_INIT_STACK_ALL_PATTERN=y, err is 0xaaaaaaaa and the failure is
deterministic. The function terminates the subrequest immediately after
submitting it. The real OSD completion later accesses the freed iterator.
KASAN reports a use-after-free in iter_folioq_get_pages(), followed by
an oops in the ceph-msgr worker.

Commit ee4cdf7ba857a894ad1650d6ab77669cbbfa329e ("netfs: Speed up
buffered reading") changed "int err = 0" to "int err". Current
mainline 0fcb05b72344f40806cbe810de8872f1698bf053 still has this.

Assisted-by: LLM

Reproducer:

        sync
        echo 3 > /proc/sys/vm/drop_caches
        sha256sum /mnt/ceph/payload

This triggered on the first read. sha256sum returned an all-zero digest
before KASAN reported the UAF.

Test setup:

        Linux v7.3-rc5 (5a956dde5526), arm64 QEMU virt
        Clang 22.1.8
        CONFIG_CEPH_FS=y
        CONFIG_KASAN=y
        CONFIG_KASAN_GENERIC=y
        CONFIG_INIT_STACK_ALL_PATTERN=y
        Ceph 18.2.7, single-node local cluster
        4 MiB regular file, inline data and encryption disabled

I have not tested a fix.

KASAN report:

[  679.342179] BUG: KASAN: slab-use-after-free in iter_folioq_get_pages+0x35c/0x4e8
[  679.343240] Read of size 1 at addr fff00000cf20cd00 by task kworker/1:0/23

[  679.344183] CPU: 1 UID: 0 PID: 23 Comm: kworker/1:0 Not tainted 7.3.0-rc5-ceph-ab #1 PREEMPTLAZY 
[  679.344388] Hardware name: linux,dummy-virt (DT)
[  679.344629] Workqueue: ceph-msgr ceph_con_workfn
[  679.345870] Call trace:
[  679.346009]  show_stack+0x14/0x1c (C)
[  679.346228]  __dump_stack+0x24/0x30
[  679.346302]  dump_stack_lvl+0x50/0x64
[  679.346356]  print_address_description+0x94/0x204
[  679.346395]  print_report+0x64/0x7c
[  679.346431]  kasan_report+0xb0/0x104
[  679.346475]  __asan_report_load1_noabort+0x1c/0x24
[  679.346514]  iter_folioq_get_pages+0x35c/0x4e8
[  679.346552]  __iov_iter_get_pages_alloc+0x534/0x708
[  679.346590]  iov_iter_get_pages2+0x20/0x38
[  679.346627]  ceph_msg_data_next+0x3f8/0x8bc
[  679.346666]  read_partial_msg_data+0x150/0x2c0
[  679.346704]  ceph_con_v1_try_read+0x1894/0x3a6c
[  679.346745]  ceph_con_workfn+0x144/0x628
[  679.346790]  process_scheduled_works+0x59c/0xa70
[  679.346833]  worker_thread+0x864/0xd60
[  679.346869]  kthread+0x2a4/0x370
[  679.346908]  ret_from_fork+0x10/0x20

[  679.347153] Allocated by task 2006:
[  679.347279]  kasan_save_track+0x3c/0x70
[  679.347342]  kasan_save_alloc_info+0x3c/0x48
[  679.347378]  __kasan_kmalloc+0x80/0x94
[  679.347410]  __kmalloc_noprof+0x1cc/0x318
[  679.347444]  mempool_kmalloc+0x18/0x20
[  679.347492]  rolling_buffer_bulk_load_from_ra+0x160/0xb08
[  679.347534]  netfs_readahead+0x2bc/0x420
[  679.347570]  read_pages+0xc4/0x6e0
[  679.347602]  page_cache_ra_unbounded+0x37c/0x41c
[  679.347634]  page_cache_ra_order+0x144/0x1b8
[  679.347666]  page_cache_sync_ra+0x384/0x548
[  679.347698]  filemap_get_pages+0x20c/0x100c
[  679.347733]  filemap_read+0x26c/0x8f0
[  679.347766]  generic_file_read_iter+0x7c/0x2f8
[  679.347801]  ceph_read_iter+0x304/0x9a4
[  679.347849]  vfs_read+0x424/0x6f0
[  679.347887]  ksys_read+0xa8/0x128
[  679.347920]  __arm64_sys_read+0x7c/0x8c
[  679.347953]  invoke_syscall+0x6c/0x174
[  679.347989]  do_el0_svc+0xfc/0x178
[  679.348024]  el0_svc+0x20/0x54
[  679.348058]  el0t_64_sync_handler+0x7c/0x120
[  679.348092]  el0t_64_sync+0x154/0x158

[  679.348188] Freed by task 87:
[  679.348215]  kasan_save_track+0x3c/0x70
[  679.348248]  kasan_save_free_info+0x50/0x64
[  679.348282]  __kasan_slab_free+0x54/0x80
[  679.348313]  kfree+0xe4/0x324
[  679.348344]  mempool_kfree+0xc/0x14
[  679.348436]  mempool_free+0x80/0x94
[  679.348495]  rolling_buffer_clear+0x19c/0x1fc
[  679.348554]  netfs_free_request+0x424/0x4c4
[  679.348591]  process_scheduled_works+0x59c/0xa70
[  679.348625]  worker_thread+0x864/0xd60
[  679.348657]  kthread+0x2a4/0x370
[  679.348713]  ret_from_fork+0x10/0x20

[  679.348872] The buggy address belongs to the object at fff00000cf20cc00
                which belongs to the cache kmalloc-512 of size 512
[  679.348980] The buggy address is located 256 bytes inside of
                freed 512-byte region [fff00000cf20cc00, fff00000cf20ce00)

[  679.349127] The buggy address belongs to the physical page:
[  679.349814] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10f20c
[  679.350061] head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[  679.350132] flags: 0x8000000000000040(head|zone=2)
[  679.350391] page_type: f5(slab)
[  679.350758] raw: 8000000000000040 fff00000c0001c80 dead000000000100 dead000000000122
[  679.350848] raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
[  679.350919] head: 8000000000000040 fff00000c0001c80 dead000000000100 dead000000000122
[  679.350952] head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
[  679.350984] head: 8000000000000002 ffffc1ffc33c8301 00000000ffffffff 00000000ffffffff
[  679.351015] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
[  679.351067] page dumped because: kasan: bad access detected

[  679.351168] Memory state around the buggy address:
[  679.351366]  fff00000cf20cc00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  679.351435]  fff00000cf20cc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  679.351508] >fff00000cf20cd00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  679.351554]                    ^
[  679.351669]  fff00000cf20cd80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  679.351712]  fff00000cf20ce00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  679.351768] ==================================================================
[  679.368513] Disabling lock debugging due to kernel taint
[  679.368720] ==================================================================
[  679.368770] BUG: KASAN: slab-use-after-free in iter_folioq_get_pages+0x22c/0x4e8
[  679.368859] Read of size 8 at addr fff00000cf20cc08 by task kworker/1:0/23

[  679.369145] CPU: 1 UID: 0 PID: 23 Comm: kworker/1:0 Tainted: G    B               7.3.0-rc5-ceph-ab #1 PREEMPTLAZY 
[  679.369267] Tainted: [B]=BAD_PAGE
[  679.369300] Hardware name: linux,dummy-virt (DT)
[  679.369347] Workqueue: ceph-msgr ceph_con_workfn
[  679.369459] Call trace:
[  679.369532]  show_stack+0x14/0x1c (C)
[  679.369716]  __dump_stack+0x24/0x30
[  679.369835]  dump_stack_lvl+0x50/0x64
[  679.369884]  print_address_description+0x94/0x204
[  679.369929]  print_report+0x64/0x7c
[  679.369970]  kasan_report+0xb0/0x104
[  679.370015]  __asan_report_load8_noabort+0x1c/0x24
[  679.370058]  iter_folioq_get_pages+0x22c/0x4e8
[  679.370101]  __iov_iter_get_pages_alloc+0x534/0x708
[  679.370146]  iov_iter_get_pages2+0x20/0x38
[  679.370217]  ceph_msg_data_next+0x3f8/0x8bc
[  679.370285]  read_partial_msg_data+0x150/0x2c0
[  679.370330]  ceph_con_v1_try_read+0x1894/0x3a6c
[  679.370376]  ceph_con_workfn+0x144/0x628
[  679.370455]  process_scheduled_works+0x59c/0xa70
[  679.370541]  worker_thread+0x864/0xd60
[  679.370582]  kthread+0x2a4/0x370
[  679.370625]  ret_from_fork+0x10/0x20

[  679.370927] Allocated by task 2006:
[  679.370997]  kasan_save_track+0x3c/0x70
[  679.371047]  kasan_save_alloc_info+0x3c/0x48
[  679.371088]  __kasan_kmalloc+0x80/0x94
[  679.371125]  __kmalloc_noprof+0x1cc/0x318
[  679.371196]  mempool_kmalloc+0x18/0x20
[  679.371328]  rolling_buffer_bulk_load_from_ra+0x160/0xb08
[  679.371422]  netfs_readahead+0x2bc/0x420
[  679.371591]  read_pages+0xc4/0x6e0
[  679.371674]  page_cache_ra_unbounded+0x37c/0x41c
[  679.371828]  page_cache_ra_order+0x144/0x1b8
[  679.371927]  page_cache_sync_ra+0x384/0x548
[  679.372084]  filemap_get_pages+0x20c/0x100c
[  679.372126]  filemap_read+0x26c/0x8f0
[  679.372165]  generic_file_read_iter+0x7c/0x2f8
[  679.372210]  ceph_read_iter+0x304/0x9a4
[  679.372291]  vfs_read+0x424/0x6f0
[  679.372485]  ksys_read+0xa8/0x128
[  679.372656]  __arm64_sys_read+0x7c/0x8c
[  679.372778]  invoke_syscall+0x6c/0x174
[  679.372883]  do_el0_svc+0xfc/0x178
[  679.372930]  el0_svc+0x20/0x54
[  679.373056]  el0t_64_sync_handler+0x7c/0x120
[  679.373127]  el0t_64_sync+0x154/0x158

[  679.373329] Freed by task 87:
[  679.373404]  kasan_save_track+0x3c/0x70
[  679.373545]  kasan_save_free_info+0x50/0x64
[  679.373627]  __kasan_slab_free+0x54/0x80
[  679.373708]  kfree+0xe4/0x324
[  679.373851]  mempool_kfree+0xc/0x14
[  679.373932]  mempool_free+0x80/0x94
[  679.373977]  rolling_buffer_clear+0x19c/0x1fc
[  679.374016]  netfs_free_request+0x424/0x4c4
[  679.374098]  process_scheduled_works+0x59c/0xa70
[  679.374152]  worker_thread+0x864/0xd60
[  679.374262]  kthread+0x2a4/0x370
[  679.374346]  ret_from_fork+0x10/0x20

[  679.374511] The buggy address belongs to the object at fff00000cf20cc00
                which belongs to the cache kmalloc-512 of size 512
[  679.374553] The buggy address is located 8 bytes inside of
                freed 512-byte region [fff00000cf20cc00, fff00000cf20ce00)

[  679.374628] The buggy address belongs to the physical page:
[  679.374750] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10f20c
[  679.374847] head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[  679.374995] flags: 0x8000000000000040(head|zone=2)
[  679.375143] page_type: f5(slab)
[  679.375218] raw: 8000000000000040 fff00000c0001c80 dead000000000100 dead000000000122
[  679.375325] raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
[  679.375419] head: 8000000000000040 fff00000c0001c80 dead000000000100 dead000000000122
[  679.375540] head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
[  679.375578] head: 8000000000000002 ffffc1ffc33c8301 00000000ffffffff 00000000ffffffff
[  679.375653] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
[  679.375714] page dumped because: kasan: bad access detected

[  679.375817] Memory state around the buggy address:
[  679.375965]  fff00000cf20cb00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  679.376070]  fff00000cf20cb80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  679.376137] >fff00000cf20cc00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  679.376205]                       ^
[  679.376353]  fff00000cf20cc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  679.376460]  fff00000cf20cd00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  679.376564] ==================================================================
[  679.388802] Unable to handle kernel paging request at virtual address 007d0011c000000b
[  679.388969] Mem abort info:
[  679.389004]   ESR = 0x0000000096000004
[  679.389106]   EC = 0x25: DABT (current EL), IL = 32 bits
[  679.389269]   SET = 0, FnV = 0
[  679.389348]   EA = 0, S1PTW = 0
[  679.389410]   FSC = 0x04: level 0 translation fault
[  679.389534] Data abort info:
[  679.389579]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[  679.389620]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  679.389677]   GCS = 0, Overlay = 0, DirtyBit = 0
[  679.389877] [007d0011c000000b] address between user and kernel address ranges
[  679.390302] Internal error: Oops: 0000000096000004 [#1]  SMP
[  679.415322] CPU: 1 UID: 0 PID: 23 Comm: kworker/1:0 Tainted: G    B               7.3.0-rc5-ceph-ab #1 PREEMPTLAZY 
[  679.415899] Tainted: [B]=BAD_PAGE
[  679.416223] Hardware name: linux,dummy-virt (DT)
[  679.416471] Workqueue: ceph-msgr ceph_con_workfn
[  679.416940] pstate: 61402005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[  679.417345] pc : iter_folioq_get_pages+0x284/0x4e8
[  679.417616] lr : iter_folioq_get_pages+0x22c/0x4e8
[  679.417878] sp : ffff8000821075f0
[  679.418090] x29: ffff800082107690 x28: 03ec008e00000057 x27: 03ec008e00000057
[  679.418750] x26: fff00000cf20cc08 x25: ffff8000821077b8 x24: 0000000000000000
[  679.419288] x23: 0000000000000000 x22: fff00000cf20cc08 x21: 0000000000001000
[  679.419768] x20: dfff800000000000 x19: 0000000000001000 x18: fff00000c759dd10
[  679.420338] x17: ffffffffffffffff x16: 0000000000000000 x15: 0000000000000001
[  679.420888] x14: 1ffff000103d6398 x13: 0000000000000000 x12: 0000000000000000
[  679.421533] x11: ffff7000103d6399 x10: 0000000000001000 x9 : 0000000000000000
[  679.422133] x8 : 007d8011c000000b x7 : 0000000000000000 x6 : 0000000000000000
[  679.422661] x5 : 0000000000000000 x4 : ffff800082777bb0 x3 : ffff800080076f1c
[  679.423233] x2 : 0000000000000001 x1 : 0000000000000008 x0 : 0000000000000001
[  679.423846] Call trace:
[  679.424312]  iter_folioq_get_pages+0x284/0x4e8 (P)
[  679.424632]  __iov_iter_get_pages_alloc+0x534/0x708
[  679.424930]  iov_iter_get_pages2+0x20/0x38
[  679.425164]  ceph_msg_data_next+0x3f8/0x8bc
[  679.425458]  read_partial_msg_data+0x150/0x2c0
[  679.425721]  ceph_con_v1_try_read+0x1894/0x3a6c
[  679.426148]  ceph_con_workfn+0x144/0x628
[  679.426391]  process_scheduled_works+0x59c/0xa70
[  679.426640]  worker_thread+0x864/0xd60
[  679.426861]  kthread+0x2a4/0x370
[  679.427106]  ret_from_fork+0x10/0x20
[  679.427576] Code: 8b081b7c 91002388 f900033c d343fd08 (38746908) 
[  679.428129] ---[ end trace 0000000000000000 ]---

Thanks,
Karl

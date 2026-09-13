Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE62DCF67
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285828; cv=none; b=Sk4mU8aWVy4qeqILhT1lVu/bcfW12+IijZZwS8W8JgRqavEmCpRtwhzVo2Y1YiwYW2LOevnyHoOPsh0WJd+gjAQKZNDJnGGPf8C+BamUn0fXo0hZcusFH7OEmkVl7KqZSE3+AgO4/ltVZ/SLHK8AGKCqAd+HKwKiCqagd6WiAY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285828; c=relaxed/simple;
	bh=juss/8hyVDrhVEjsqcRBUyxf1c4JRnYIr2bgIgYpQjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=ZCbRy5YUXhS3crcubYCC2ZChjZCpaD6bAuk4swkA2TlDIv74+NEwu+EipRnQbm78xNaXr6e1uHscwcxJbdnyKdSvXbovdvVeW1g2m69pfLfTNaf3Yy7mJ7fCRzFx4Ja441Pwy5NqSrVlRnrvM787VXv/7FfjRKIfMXBrT4pv62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2cded7e6ea0aa955;
	Sun, 13 Sep 2026 07:50:19 +0000
X-Mizu-Trace-ID: 2cded7e6ea0aa955
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v2 00/12] mm, swap: extendable swap devices (xswap)
Date: Sun, 13 Sep 2026 15:50:02 +0800
Message-ID: <20260913075014.1732524-1-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Xswap is a swap device with no backing storage. Swap out pages live
in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc area,
and the area is grown and shrunk on demand as swap usage changes.

The problem being solved is the static size of compressed swap. Both
zram and zswap need the size fixed in advance, and neither gives memory
back when the workload shrinks. The solution should be a device whose
size can scale up/down as per usage. Xswap does that by mapping the
metadata lazily instead of reserving it for the whole range.

Design
------
- si->cluster_info[] stays a plain array. Access is still
  &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branch, no
  RCU discipline, no tear-down state machine, no NULL return.
- Only an initial chunk is mapped at creation. The rest of the address
  space is reserved, not allocated, so an idle device costs nothing.
- Growth is driven by allocation. When no free cluster is left and the
  address space has room, the next chunk is mapped and added to the free
  list. No userspace involvement.
- Shrink is driven by frees. The free tail is counted, and whole chunks
  are unmapped once the mapped range is at most half in use and several
  chunks can go. One chunk is left mapped as slack, so the next
  allocation does not map it straight back.

Size
----
A device starts at 1xRAM, rounded down to the cluster. That costs
nothing, because the mapping is lazy. An optional per-device cap,
/sys/kernel/mm/xswap/type<N>/limit, lets an admin lower the ceiling.
Grow and shrink both work without it.

Interface
---------
  /sys/kernel/mm/xswap/create           write an optional priority
  /sys/kernel/mm/xswap/destroy          write a swap type
  /sys/kernel/mm/xswap/type<N>/limit    read/write, in pages
The device shows up in /proc/swaps as xswap<N>.

Note:
--------------------------
Writeback, rmap lookup, etc. Those are consumers of this base. I have
a writeback prototype on top of this base and will post it as a reference.

Testing
-------
x86_64, 8 GiB VM, lockdep and PROVE_RCU on, 4 and 8 GiB MADV_PAGEOUT
workloads against a zswap-backed device:
- grow from 36 clusters up to the 3974-cluster limit, and stop there
- shrink on workload exit, then grow again
- fill the device to the limit and shrink again
- create, swapoff, destroy, recreate
Throughput is within ~2-3% of plain swap+zswap on a 64G/64-thread
swapout, so it is dominated by zswap compression, not the cluster table.

Changelog
=========
- Patch 1 (mm: zswap: return -ENOENT when the swap device is gone) is not
  part of this series; it was posted separately.

- There is only one size knob now. The runtime ceiling and the debugfs
  per-device limit are gone. All that is left is the optional per-device
  cap, /sys/kernel/mm/xswap/type<N>/limit. Grow and shrink work without
  it.

- The shrink no longer keeps its own count of the free tail. It scans the
  tail instead, and dropping the counter also removes a call from the
  cluster allocation path. 

- The priority is no longer a patch of its own. The create attribute
  takes it:
    echo 100 > /sys/kernel/mm/xswap/create

RFC v3 -> v1
- Add patch 16 to support setting xswap device priority at creation.
  The create sysfs interface (/sys/kernel/mm/xswap/create) previously
  hardcoded every new device's priority to DEF_SWAP_PRIO, it now
  accepts an optional priority:

    echo "<percent> [<prio>]" > /sys/kernel/mm/xswap/create

- Bug fix: xswap_lock init ordering. mutex_init(&si->xswap_lock) was called
  after xswap_map_clusters() (which locks it), i.e. locking an uninitialized
  mutex. Init now before the first xswap_map_clusters() call. Thanks to Klara.

- Bug fix: Fixes a compile error in !CONFIG_XSWAP builds. xswap_debugfs_root
  is declared inside CONFIG_XSWAP ifdeffery scope, so the ungarded use
  caused error when CONFIG_XSWAP is off.

RFC v2-> RFC v3:
- Replace the "header-only swap file + swapon" creation hack with a
  proper file-less device created and destroyed via sysfs
  (/sys/kernel/mm/xswap/{create,destroy}).  This required the
  __swapoff() refactor and the free_swap_cluster_info() signature
  change (patches 4, 6, 14).

- Require zswap: refuse to create an xswap device when zswap is
  unavailable (patch 15).

- Split the unrelated zswap -ENOENT fix out of the series into a
  standalone patch (patch 1).

- Fix nr_free_tail over-counting on concurrent grow, shrink leaking
  detached clusters on early bail-out, a re-init race on cluster
  spinlocks in xswap_map_clusters(), the nr_clusters_mapped update
  ordering, and swapoff accessing the shrinker-unmapped cluster tail.

- Minor cleanups (checkpatch, /proc/swaps alignment, commit messages).

RFC v1-> RFC v2:
- Added __GFP_HIGH | __GFP_NOMEMALLOC to alloc_page() and kmalloc_array()
  in the grow path, plus memalloc_noreclaim_save/restore() wrapping,
  to prevent the grow path from consuming emergency memory reserves
  or recursing into swap under PF_MEMALLOC. This is folded into patch 3.
  This was pointed out by Nhat.

- Folded the mutex serialization fix into the cluster grow patch (patch
  3). This is suggested by Nhat.

- Fixed coding style issues: corrected indentation of declarations in
  xswap_unmap_clusters(), removed unnecessary block scope around the
  err variable in xswap_map_clusters().

- Rebased onto mm-unstable

Baoquan He (11):
  mm, swap: add CONFIG_XSWAP and xswap fields to swap_info_struct
  mm, swap: refactor free_swap_cluster_info to take swap_info_struct
  mm, swap: add xswap cluster grow via VM_SPARSE vmalloc
  mm, swap: add sysfs create interface for xswap
  mm, swap: add xswap grow trigger on cluster allocation
  mm, swap: add xswap_try_shrink and shrink trigger on cluster free
  mm, swap: free backing pages in xswap_unmap_clusters
  mm, swap: defer xswap shrink to workqueue to avoid lock recursion
  mm, swap: refactor swapoff + add xswap_destroy
  mm, swap: require zswap for xswap devices
  mm, swap: add sysfs per-device size limit for xswap

Chris Li (1):
  mm: xswap support for zswap

 include/linux/swap.h |   13 +
 mm/Kconfig           |    9 +
 mm/page_io.c         |   16 +
 mm/swap_state.c      |    7 +
 mm/swapfile.c        | 1170 ++++++++++++++++++++++++++++++++++++++----
 mm/zswap.c           |    7 +-
 6 files changed, 1118 insertions(+), 104 deletions(-)

-- 
2.54.0


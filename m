Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8281A6803
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987507; cv=none; b=WlftAii58Ru6V0Jxjf5DnYynldeO5lFt7U8Kuat/MvzlKLeMYiIaXv6TLIcufeoopq7UWL68T6zKL7mNg0zXpSq6S28ztqXws3uEOVD2uKw8a13iJkIUws59ImJpa1pBPEsF3k5Xg1gb9T03TzdEUKPuXxrxbG5LT1qaaJ+3Dg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987507; c=relaxed/simple;
	bh=ofX6tnhtDVHRjP52IdXKSenN2p47oetmc8Iu8YJy/bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=LrMPSFzmouTbNqlJNfHdjI4F+ZWqAPZTv5mVd9zToXBV8RormnehE/b8g5jHuHcF+NurD0dZ//pY1Kfs5X9TYMoyq+v9u29+4FrFV0cx0r+rhVNq/j1jiTUSKwcZpfRsUqj6zotXA3RUBHBMlQ9YMfdsU/dD3bU59nNNluO3Sqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id ee9b3578c6a24f8f;
	Sat, 03 Oct 2026 00:31:41 +0000
X-Mizu-Trace-ID: ee9b3578c6a24f8f
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase I)
Date: Sat,  3 Oct 2026 08:31:22 +0800
Message-ID: <20261003003136.750633-1-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

A normal swap device has a fixed size, set when it is enabled. This
does not fit zswap well. With zswap, the swapped data stays in RAM in
compressed form. So how much swap a machine can really use depends on
how well the workload compresses. It does not depend on a number we
pick before we know the workload. If we make the device large enough
for the worst case, most of it is never used. If we make it just large
enough for the average case, the machine runs out of swap while zswap
still has free room.

xswap is a swap device with no backing file. Its swap entries hold pages
in zswap, and its cluster_info array lives in a VM_SPARSE area that is
mapped a chunk at a time, so the device covers a large address space
while costing only the chunks it has actually used. The device grows as
the workload needs it and gives the tail back when it does not.

This series is the device itself: the sparse cluster array, growth and
shrink, and the interfaces that create and destroy one. It is phase I
of three; the physical backend and the swap accounting builds on it.

Design notes
------------

The device is only an address space. si->max is set when the device is
created and does not move for its lifetime; what moves is how much of it
is mapped. It defaults to twice RAM, and xswap.max= sets another size at
boot, in bytes or as a percentage of RAM:

  xswap.max=8G          8 GiB
  xswap.max=300%        three times RAM

That is a boot parameter but not a runtime knob because the address space
cannot move once the device exists; it is fixed at creation and every
mapped index stays valid for the device's life. swap_info_struct carries
nr_clusters_max (the address space) and nr_clusters_mapped (the mapped
prefix), and the two walkers that touch cluster_info are bounded by the
latter.

Growth starts when 85% of the mapped range is in use. The call comes from
cluster_alloc_swap_entry(). Growing maps pages into the VM_SPARSE area.
Mapping can sleep, so it cannot be done inside the allocation that would
otherwise fail. If it were, the swap-out path would have nothing to fall
back on.

Shrink gives the free tail back when the mapped range is at most 50% in
use. It is triggered when a cluster becomes completely free. Shrinking on
a smaller drop is not useful. Growth happens on demand, so the same
clusters would just be mapped again, and each unmap also costs an RCU
grace period.

A file-less device has no swapon, so /sys/kernel/mm/xswap/create makes
one and destroy takes its swap type. The teardown is shared with
sys_swapoff() rather than duplicated.

The only argument create takes is a priority. The size comes from
xswap.max= at boot, so there is one place to ask for a size and one to
ask for a priority, and a priority can be given per device while a size
cannot:

  # echo > /sys/kernel/mm/xswap/create          default priority
  # echo 100 > /sys/kernel/mm/xswap/create      priority 100

The default is the highest priority, SWAP_FLAG_PRIO_MASK. An xswap
device is then the first one tried, ahead of any ordinary swap device.
Setting a lower priority is allowed.

The device does not move once it exists, so the address space cannot be
changed from this interface either. xswap.max= at boot and this together
are the whole configuration.

The device needs zswap. Without it swapout takes a swap entry and frees
no memory, so creating one fails.

Testing
-------

qemu KVM guest, 8G RAM, booted with xswap.max=10G. memhog is a small
local helper: it faults <total_gb> of anon, fills it with a fixed
pattern, and holds it.

Set up zswap and create a device:

  # echo 1 > /sys/module/zswap/parameters/enabled
  # echo > /sys/kernel/mm/xswap/create
  # awk 'NR == 1 || /xswap/' /proc/swaps
  Filename                Type        Size        Used        Priority
  xswap0                  xswap       10485756    0           32767
  # cat /sys/kernel/debug/xswap/type0
  clusters_max 5120
  clusters_mapped 73
  usage_pages 0
  tail_free 72
  grows 0
  shrinks 0

Swap 9G of anon through a 2G cgroup:

  # mkdir -p /sys/fs/cgroup/xswap_limit
  # echo 2G > /sys/fs/cgroup/xswap_limit/memory.max
  # echo max > /sys/fs/cgroup/xswap_limit/memory.swap.max
  # ( echo $BASHPID > /sys/fs/cgroup/xswap_limit/cgroup.procs
  #   exec env MEMHOG_FILL=pattern numactl --cpunodebind=0 \
  #       ./memhog 9 600 ) &

clusters_mapped grows to cover the pages that go to zswap, while
SwapTotal stays at 10485756. Throughout, SwapTotal never moves and
SwapFree stays in [0, SwapTotal]. Pushing past the size leaves the
cgroup out of room and the OOM killer takes the workload, which is the
pass signal there.

Growth and shrink, measured with two cgroups so that one keeps its pages
while the other goes away:

  idle                           mapped=73    occ=0.000  grows=0   shrinks=0
  2G in a 1G cgroup              mapped=803   occ=0.737  grows=8   shrinks=0
  3G more in a second 1G cgroup  mapped=2190  occ=0.777  grows=13  shrinks=0
  kill the second cgroup         mapped=876   occ=0.675  grows=13  shrinks=1

The second cgroup is started later, so its clusters sit at the tail, and
killing it leaves a free tail to take back. The first stays alive, so
usage falls but not to zero: that is the state the shrink has to land in.
occ is usage over the mapped range, which is what the grow and shrink
thresholds are expressed in.

  # echo 0 > /sys/kernel/mm/xswap/destroy

Also tested things as below, and nothing crashed or warned:

  - a shrink racing a swapoff of the same device, 20 rounds
  - a cgroup that cannot zswap: it must get no xswap slot, and the
    allocator walk must not spin
  - a create/destroy cycle: it must not leak per-cluster state

Open items
----------

- xswap_create() sets si->pages to the whole address space (twice RAM by
  default) and _enable_swap_info() adds it to nr_swap_pages and
  total_swap_pages, which is what __vm_enough_memory() uses for
  overcommit. That raises the commit limit by 2xRAM for a device whose
  real capacity is bounded by the zswap pool and by how well the workload
  compresses. The question is which semantics overcommit should follow:
  worst-case backing, or the address space.

- destroy takes a bare swap type. The type is an internal index that
  alloc_swap_info() recycles as soon as SWP_USED clears, so a value read
  earlier can name a different device by the time it is written. The
  swapoff ABI uses a path for this reason. It wants a generation or
  another stable handle.

- The new interfaces (/sys/kernel/mm/xswap/create and destroy, xswap.max=,
  the new type string in /proc/swaps) are not documented yet.

Changelog
=========
v3 -> v4:
- Rebased onto the latest mm-new.

- Add boot parameter xswap.max= .

- The device has one size now: set at creation, fixed, with xswap.max= to
  ask for another one at boot. v3's runtime ceiling, the per-device limit,
  the clamp it wrote and the shrink to that ceiling are all gone as
  Johannes suggested (v3's patches 12, 13 and 14).

- v3's patches 2 and 4 are the new patch 3: neither builds a device
  alone. It also bounds find_next_to_unuse() and wait_for_allocation(),
  which walked up to si->max past the mapped range. Chris suggested
  this.

- New patches 11 to 13: a cgroup that cannot zswap is not given an xswap
  slot, swap_info_struct max and pages are unsigned long, and debugfs
  counters for the mapped range and the grow and shrink counts.

- v3's patches 1 and 3, and 5 to 11, are unchanged; the merge shifts them
  to 1 and 2, and 4 to 10.

- Minor comment and cleanup changes.

v2 -> v3:
- Rebased onto the latest mm-new.

- The grow path now honors the user-set ceiling (si->nr_clusters) instead
  of growing up to nr_clusters_max, and a ceiling below the mapped range
  is unmapped exactly instead of rounded to a chunk (patches 12 and 14).

- The limit write clamps the ceiling up to the clusters covering the pages
  in use, replacing the earlier WARN_ONCE; si->pages becomes mutable at
  runtime (patch 13).

- Minor comment and cleanup changes.

v1->v2:
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

RFC v3 -> RFC v2
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

Baoquan He (13):
  mm, swap: refactor free_swap_cluster_info to take swap_info_struct
  mm, swap: back the cluster_info array with a sparse VM_SPARSE area
  mm, swap: add sysfs create interface for xswap
  mm, swap: add xswap grow trigger on cluster allocation
  mm, swap: add xswap_try_shrink and shrink trigger on cluster free
  mm, swap: free backing pages in xswap_unmap_clusters
  mm, swap: defer xswap shrink to workqueue to avoid lock recursion
  mm, swap: refactor swapoff and add xswap_destroy
  mm, swap: require zswap for xswap devices
  mm, swap: do not give an xswap slot to a cgroup that cannot zswap
  mm, swap: widen swap_info_struct max/pages to unsigned long
  mm, swap: add debugfs counters for xswap
  mm, swap: let the command line set the xswap device size

Chris Li (1):
  mm: xswap support for zswap

 include/linux/swap.h |   16 +-
 mm/Kconfig           |    9 +
 mm/page_io.c         |   19 +
 mm/swap_state.c      |    9 +
 mm/swapfile.c        | 1221 +++++++++++++++++++++++++++++++++++++++---
 mm/zswap.c           |   11 +-
 6 files changed, 1205 insertions(+), 80 deletions(-)


base-commit: 9a0542b19a541eda3f82934ee747c61ec3f18847
-- 
2.54.0


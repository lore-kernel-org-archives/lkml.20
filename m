Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203706;
	b=rdSNzr5/xTLNVX6TJ2ml4YUnr2lMCZ9SIo8hlwR0mpv2+V/ZLhLMkxLH+bJuHe66fMWo
	 WO1c1TnlKk3RJ9Alw9E5Xu+RcmxqIOXe4gEv24uIRYsnnyKydWvbg4GmLJaqZZJreb8/m
	 PFJ3RlwbsbcYTprWaZNwm8GkIMQeLmyhaSZ9jdfYAGArIyBRMJ7QK2cc6Hrxb2Mz+l5Ki
	 E+3VIuAAK4V/MU6QH+xCs/p2ouGCyzXSmNFbHJ5MIPtMLi0o6Q0+kaYMIyoMktGCukxbO
	 C6yj7Vke1WlX+d63/Ne1WvH21hYwWxzZ9/UKMIOWUytaXL3ZEKV1/svjS4MlcINnY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-type:Content-Transfer-Encoding;
	bh=W/AjPF4lUvH2Tm2tPsJdtvyHfSlcx6yLvdL+dxtRtZY=;
	b=baFqpnCBR01qsJGbqgMeP7VvvbmKWJORWZxZ2PkP8e+YXkpReZNVBsoeyeSE7n0eSW7t
	 ArOVoS+0KLKJE+r/DIemwABsSqgwIL6iaLHhgZ5wEXHIExRderCBvwBS7UuxMQQpuvEbF
	 SKpu0z4QL1MRCLDsAozoJjWVdlnN7SDlP7USypyYOsIl8FUWAT3IMrAj6UpbJHDePtNVY
	 Zi1jZxGyar0RrmT58HIEmG2E+4MLZTQtMmm5ho9pH0wWYL8atSAJC9GpBe/OqV2rCAst0
	 atKZQ24/LYBMnu1tjQREINqAZ2RU6mcmavSpzE46PG7nZYIq2t/JbDBTssb4s/p5pBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="p3or/Anv";
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEE8606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEE8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p3or/Anv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MY4RYe2ggYDq1Sriom4d+L+Pul0dtqxzyvCW4eNUg78=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203703; v=1; x=1794808503;
 b=p3or/AnvPrg8+P3hoZmkf1hdAJXVb4pvpO+U7/oBlhPwwuIRlgJxEFgavYzeABtbUepzkoSD
 Q24dW18AXftUL5tb3erHvFcXyNg45jpAmYlQaD7aOW3Bm0Oda53lk86g/Rt6HrjhDMocJBy7/b1
 YsyXbsWfVP4GBaKmU5zgyiy0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 1566e80ae3ec20ca;
	Mon, 09 Nov 2026 05:55:03 +0000
X-Mizu-Trace-ID: 1566e80ae3ec20ca
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 00/19] mm, swap: extendable swap devices (xswap phase I)
Date: Mon,  9 Nov 2026 13:54:36 +0800
Message-ID: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

A normal swap device has a fixed size, set when it is enabled. This does
not fit zswap well. With zswap the swapped data stays in RAM in
compressed form, so how much swap a machine can really use depends on how
well the workload compresses, not on a number we pick before we know the
workload. Make the device large enough for the worst case and most of it
is never used. Make it just large enough for the average case and the
machine runs out of swap while zswap still has free room.

xswap is a swap device with no backing file. In this phase its swap
entries hold pages in zswap, and its cluster_info array lives in a
VM_SPARSE area that is mapped a chunk at a time, so the device covers a
large swap address space and costs only the chunks it has actually
mapped. The device grows when the workload needs it and gives the tail
back when it does not.

This series is the device itself: the sparse cluster array, growth and
shrink, and the interfaces that create and destroy one. It is phase I of
four; the physical backend, the swap accounting, and the swap-table
backend records (zswap w/o xarray) build on it.

Design notes
------------

In this phase the device is only an swap address space. si->max is set
when the device is created and does not change for its lifetime; what
changes is how much of it is mapped. swap_info_struct carries
nr_clusters_max (the swap address space) and nr_clusters_mapped (the
mapped prefix), and the two walkers that touch cluster_info are bounded
by the latter.

Growth starts when 85% of the mapped range is in use and maps until 65%.
The call comes from the cluster allocation path. Growing maps pages into
the VM_SPARSE area, and mapping can sleep, so it cannot be done inside
the allocation that would otherwise fail: the swap-out path would then
have nothing to fall back on. A grow maps at most XSWAP_GROW_CHUNKS
chunks at a time.

Shrink gives the free tail back when the mapped range is at most 50% in
use and stops at 70%. It is triggered when a cluster becomes completely
free, from a workqueue, because it takes xswap_lock and sleeps in
synchronize_rcu() and vm_area_unmap_pages(). Shrinking on a smaller drop
is not useful: growth happens on demand, so the same clusters would just
be mapped again, and every unmap also costs an RCU grace period. The two
target points sit inside each other's threshold, so a grow cannot leave
the range in a state the shrink would undo, and the other way around.

Configuration
-------------

The device is behind CONFIG_XSWAP, which depends on SWAP, 64BIT, ZSWAP
and SYSFS. CONFIG_XSWAP_DEFAULT_MAX sets the default size of a new
device; it takes a percentage of RAM, a size, or "max", and defaults to
"200%":

  CONFIG_XSWAP_DEFAULT_MAX="200%"

xswap.max= on the kernel command line overrides it:

  xswap.max=8G          8 GiB
  xswap.max=300%        three times RAM
  xswap.max=max         the largest size the device can address

"max" stops at the swap offset limit, capped so that a cluster index fits
in an unsigned int. A slot is still a swap entry, so that limit applies
even though the data never goes to a physical address.

The swap address space cannot move once the device exists, so the size
is settled at creation. That is why this is a boot parameter and not a
runtime knob.

Identity
--------

A device needs a name that survives while it exists. The swap_info type
is a slot in swap_info[] and is reused after swapoff, so it cannot be
one. Each device instead takes an id from a per-boot counter, assigned
at creation and never reused, and that id is what /proc/swaps shows:

  Filename                Type        Size        Used        Priority
  xswap1                  xswap       10485756    0           32767

The same id names the debugfs file and is what destroy takes:

  # cat /sys/kernel/debug/xswap/xswap1
  type 0
  clusters_max 5120
  clusters_mapped 73
  usage_pages 0
  tail_free 72
  grows 0
  shrinks 0
  # echo 1 > /sys/kernel/mm/xswap/destroy

A file-less device has no swapon, so /sys/kernel/mm/xswap/create makes
one. The only argument it takes is a priority; the size comes from
xswap.max=. A priority can be given per device while a size cannot:

  # echo > /sys/kernel/mm/xswap/create          default priority
  # echo 100 > /sys/kernel/mm/xswap/create      priority 100

The default is the highest priority, SWAP_FLAG_PRIO_MASK, so an xswap
device is tried first, ahead of any ordinary swap device. Setting a
lower priority is allowed.

The teardown of a device is shared with sys_swapoff() rather than
duplicated.

swapoff
-------

sys_swapoff() opens the path first. An xswap device has no file, so the
name shown in /proc/swaps cannot be opened. Only a -ENOENT from that
open is taken for an xswap device, and the device with that name is torn
down. A real file or directory keeps precedence: a path that fails for
another reason is never matched. This is what makes both of these work:

  # swapoff xswap1
  # swapoff -a

The name is matched exactly, and /proc/swaps prints the one to use: a
path such as ./xswap1 is not the bare name and is not recognized.

The device needs zswap. Without it swapout takes a swap entry and frees
no memory, so creating one fails.

Limitations
-----------

This phase has no physical backend. If zswap refuses a page, the folio
stays in memory, so an xswap-only system can run out of memory once the
zswap pool is full. Keep a real swap device on such systems; phase II
adds the physical backend.

xswap does not allocate large folios in this phase. The allocation walk
stops at the first device for a large folio, and a new xswap device
defaults to the highest priority, so the folio is offered to xswap,
rejected there, and split into base pages; a lower-priority block device
never gets it whole. Creating the xswap device below a block device in
priority avoids this, at the cost of offering every page to the block
device first. mTHP and THP swapout are both affected; the data is still
swapped, in base pages. A bypass in the walk would avoid the split, but
the next phase teaches xswap to take large folios itself, on a
contiguous physical run, and would remove the bypass again; this phase
leaves the walk unchanged.

An xswap entry stored while no real swap device exists is not put on the
zswap LRU, so adding a real device later does not make it reclaimable.
Phase II puts every xswap entry on the LRU.

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
  xswap1                  xswap       10485756    0           32767

An idle device maps one chunk of cluster_info: 73 clusters with the
current struct size.

Swap more anon than RAM through a small cgroup:

  # mkdir -p /sys/fs/cgroup/xswap_limit
  # echo 2G > /sys/fs/cgroup/xswap_limit/memory.max
  # echo max > /sys/fs/cgroup/xswap_limit/memory.swap.max
  # ( echo $BASHPID > /sys/fs/cgroup/xswap_limit/cgroup.procs
  #   exec env MEMHOG_FILL=pattern ./memhog 11 600 ) &

clusters_mapped grows to cover the pages that go to zswap (2,414,630
pages against 2,038,301 of RAM in one run), while SwapTotal stays at
10485756. Throughout, SwapTotal never moves and SwapFree stays in
[0, SwapTotal]. Pushing past the size leaves the cgroup out of room and
the OOM killer takes the workload, which is the pass signal there.

Growth and shrink, measured with two cgroups so that one keeps its pages
while the other goes away:

  idle                           mapped=73    occ=0.000  grows=0   shrinks=0
  2G in a 1G cgroup              mapped=657   occ=0.799  grows=7   shrinks=0
  3G more in a second 1G cgroup  mapped=1898  occ=0.829  grows=12  shrinks=0
  kill the second cgroup         mapped=803   occ=0.654  grows=12  shrinks=1

The second cgroup is started later, so its clusters sit at the tail, and
killing it leaves a free tail to take back. The first stays alive, so
usage falls but not to zero: that is the state the shrink has to land in.
occ (occupancy) is usage over the mapped range, which is what the grow and
shrink thresholds are expressed in.

With the first cgroup still alive, destroy the device:

  # echo 1 > /sys/kernel/mm/xswap/destroy

Also tested these, and nothing crashed or warned:

  - a shrink racing a swapoff of the same device, 20 rounds
  - a cgroup that cannot zswap: it gets no xswap slot, and the
    allocator walk does not spin
  - 2000 create/destroy cycles: no per-cluster state is leaked, and the
    ids keep increasing
  - destroy with the workload alive, and a recreate at the same size
  - swapoff -a and swapoff by name both tear the device down

The whole series has also been through the later phases' tests, which
need the physical backend and the swap accounting; those results will be
reported with the phases that own them. Nothing crashed or warned there
either:

  - a destroy returns the physical slots it handed out to their block
    device, and a THP swapout leaves the xswap device and its backend
    with the same usage
  - a swapped THP reads back as one unit from the physical backend, and
    readback through zswap and through the backend both pass a
    byte-for-byte pattern check
  - the memcg swap accounting, memory.swap.current against the backend
    usage, holds across charge, uncharge and destroy

Note on performance
-------------------

This phase is the device and leaves the swap store path alone: an xswap
slot still goes through zswap's xarray. What it adds is covered by the
growth and shrink behaviour above, not by throughput.

When an xswap device exists, the allocation-time zswap gate runs on
every swapout, including the pages that end up on a real device, and in
this phase its cgroup check can flush the cgroup's zswap statistics. A
later phase replaces it with a lockless check.

The series as a whole (phase I+II+III+IV) has been measured on a 288-CPU
server with 1.1 TiB of RAM. The numbers are repeated here only to show
where this leads; each later phase will report the measurements that
belong to it.

  - Release path. usemem -O -y -x -n 1 20G, ten rounds, in a cgroup
    limited to 14G of memory and 12G of swap. The swap-out volumes are
    the same in both arms, 18,370,771 and 18,370,836 pages:

      baseline kernel, zram device    1,067,082 us
      this series,     xswap device     922,396 us    -13.6%

  - Steady-state throughput. The same usemem runs. Per-run medians:

      baseline kernel, zram device     338,260 - 338,760 KB/s
      this series,     xswap device    340,997 - 341,885 KB/s

    The two ranges do not overlap: every pairing of a baseline run with
    a series run is 0.7% to 1.1% ahead, about 1% on average.

  - General workload. A full kernel build, x86_64 defconfig and -j144,
    five rounds per kernel, best of:

      baseline kernel    2,572.6 s CPU (user+sys)
      this series        2,577.7 s CPU (user+sys)

    The 0.2% difference is smaller than the run-to-run spread of either
    kernel.

The large gain is in the release path. How it splits between the swap-table
backend records, the device itself and the accounting is what the later
phases report, each with the measurement that belongs to it.

Overcommit
----------

An xswap device advertises its whole address space as swap: si->pages is
what /proc/swaps and SwapTotal report, and what nr_swap_pages uses to
decide that anonymous memory can be reclaimed. The backing is the zswap
pool in this phase, and real swap devices in the later phases; the
address space is not backing store in either case, yet it raises the
commit limit that __vm_enough_memory() enforces.

Which semantics this should follow is not settled here. Counting the
address space lets a workload commit 2xRAM it can never back; not
counting it changes what SwapTotal means. swap_info_remove() skips its
commit-limit probe for xswap, so destroying a device does not fail on
headroom the device never provided, and real swap devices keep the probe.
The limit can then fall below Committed_AS; new allocations fail until
Committed_AS drops. This is left to a follow-up, together with the rest
of the swap accounting.

Changelog
=========
v4 -> v5:
- Rebased onto the latest mm-new (2c5dafa7f289). 

- A device now has a stable id instead of exposing the swap type:
  /proc/swaps shows xswap<id>, the debugfs file is named by the id and
  prints the type as well, and destroy takes the id. The id is assigned
  per boot and never reused, so a value read earlier cannot name a
  different device.

- swapoff accepts the name: swapoff xswap<id> and swapoff -a tear the
  device down, while a real file or directory keeps precedence. A name
  that does not exist reports -ENOENT; the sysfs destroy keeps -ENODEV
  for an id it does not know. The interfaces are now documented in
  Documentation/ABI/testing/sysfs-kernel-mm-xswap and zswap.rst.

- CONFIG_XSWAP_DEFAULT_MAX sets the default size of a new device. It
  takes a percentage of RAM, a size, or "max", and defaults to "200%";
  xswap.max= still overrides it.

- The cluster_info accesses are RCU-safe: the allocation fast path bounds
  a cached cluster against the mapped range, and the shrink drains the
  per-cpu cache and waits an RCU grace period before unmapping.

- xswap_grow() now links the clusters it mapped even when swapoff has
  already cleared SWP_WRITEOK, so a failed swapoff cannot leave them
  mapped and on no list.

- swap_info_remove() skips the commit limit probe for xswap; real swap
  devices keep it. See the overcommit note above.

- The cgroup zswap gate is checked again after the allocation when an
  xswap device appeared after the initial lookup, so a slot is not kept
  for a cgroup that cannot zswap.

- The patches are reorganized: the VM_SPARSE work is split into helpers
  and the xswap use, the max/pages widening moves before the sysfs
  interface, the shrink trigger now carries the workqueue deferral, and
  the unmap helper is prepared for range shrinking in its own patch. The
  series is now phase I of four, with the swap-table backend records as
  a phase of their own.

Baoquan He (18):
  mm, swap: refactor free_swap_cluster_info to take swap_info_struct
  mm, swap: add VM_SPARSE cluster-array helpers for xswap
  mm, swap: use a VM_SPARSE cluster array for xswap devices
  mm, swap: widen swap_info_struct max/pages to unsigned long
  mm, swap: add a sysfs interface to create xswap devices
  mm, swap: refactor swapoff and add xswap_destroy
  mm, swap: require zswap for xswap devices
  mm, swap: use a stable id for xswap devices
  mm, swap: let the command line set the xswap device size
  mm, swap: add CONFIG_XSWAP_DEFAULT_MAX
  mm, swap: let swapoff destroy xswap devices by name
  mm, swap: add xswap grow trigger on cluster allocation
  mm, swap: add debugfs counters for xswap
  mm, swap: make xswap cluster_info accesses RCU-safe
  mm, swap: prepare xswap_unmap_clusters for range shrinking
  mm, swap: add xswap shrink trigger and defer it to a workqueue
  mm, swap: do not give an xswap slot to a cgroup that cannot zswap
  mm, swap: skip the overcommit probe when removing xswap

Chris Li (1):
  mm: xswap support for zswap

 .../ABI/testing/sysfs-kernel-mm-xswap         |   43 +
 .../admin-guide/kernel-parameters.txt         |    8 +
 Documentation/admin-guide/mm/zswap.rst        |    9 +
 MAINTAINERS                                   |    1 +
 include/linux/swap.h                          |   17 +-
 mm/Kconfig                                    |   20 +
 mm/page_io.c                                  |   19 +
 mm/swap_state.c                               |    9 +
 mm/swapfile.c                                 | 1569 +++++++++++++++--
 mm/zswap.c                                    |   11 +-
 10 files changed, 1593 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-mm-xswap


base-commit: 2c5dafa7f289d760f4492260b0988029aab478b0
-- 
2.54.0


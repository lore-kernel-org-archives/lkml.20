Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC772DECA3
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790989882; cv=none; b=iJFi4h1edDzINIUE1v8spP58gCGB+dfdJ7qHJ/i9VIqwSSW1MKA9DX2lkvoK1lcGlAL36TbqAXR+qw1zSbueioTygZbjkDV++mRWg1lAm5dLKgPpDPlOWEbFjtqLbk18SzkrwsBR0f2L8MPPenPUt9DgoueiqnEVz8osOGXpkdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790989882; c=relaxed/simple;
	bh=6fSEH29DJgrKtB5LxtK+k3nzQ8DQ9d1V36qE0c3QBC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=H4FOn8Vtr8CGQn+kJfTXBcFQeneH5nxpbPuUeLeXB1kITi5c3rpCDBcU0109cXTUZYMnBFdLugZVShtaqnryisJb8yjxjTh6l9nbcZIKWcWZX+PC6dSDqlzuQwS3LJ7PvgcLS47fhXFtKMGK6LwAgm7+DBNlFC8gLGOv3qfveRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 2a5d2434c84c6a24;
	Sat, 03 Oct 2026 01:11:16 +0000
X-Mizu-Trace-ID: 2a5d2434c84c6a24
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	tj@kernel.org,
	mkoutny@suse.com,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 0/6] mm, swap: charge xswap for physical backing (xswap phase III)
Date: Sat,  3 Oct 2026 09:11:05 +0800
Message-ID: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

An xswap entry reserves no swap space: its page is in zswap, which costs
memory, not disk. It was still charged against memcg->swap at allocation,
so memory.swap.current counted pages that never reached a disk, and a
cgroup with memory.swap.max at 0 could not reclaim its anon memory at all.

The charge belongs where the backing is taken. Record the owner at
allocation; charge only when the entry takes a backend slot, and release
the charge with the slot.

Phase III of three, posted separately because the charging semantics are
still under discussion. This series makes memory.swap.current count only
the pages that hold a backend slot; it used to count every swap entry, and
an entry always held a slot until xswap separated the two.

Design notes
------------

Patch 1 splits __mem_cgroup_try_charge_swap() into get / charge / record /
uncharge / put, with no behaviour change, so the record and the charge can
happen at different times. The owner is a private ID, not a pinned memcg:
an ID is what the swap table holds, and the uncharge path resolves it back
under RCU. Patch 4 stops mem_cgroup_get_nr_swap_pages() from gating on the
physical margin for a cgroup that can zswap.

The patches
-----------

 1 split the swap memcg charge helpers
 2 do not charge zswap-backed xswap entries
 3 charge an xswap entry when it gets physical backing
 4 don't gate xswap on the physical swap free count
 5 do not retake the cluster lock when uncharging an xswap slot
 6 drop a refused xswap backend run directly

5 and 6 fix bugs in 3: a spinlock taken twice, and a refused run given back
through a reverse mapping that is not installed yet.

Testing
-------

qemu KVM guest, 8G RAM, xswap.max=10G, zram as the backend. memhog faults
<total_gb> of anon, fills it with a fixed pattern, and holds it. The
invariant through all of it:

    memory.swap.current / 4096  ==  backend Used / 4

Both count pages holding a backend slot, so over-charge, under-charge and a
missed uncharge all show up here.

  # echo 1 > /sys/module/zswap/parameters/enabled
  # echo 100 > /sys/kernel/mm/xswap/create
  # mkswap /dev/zram0; swapon -p 0 /dev/zram0
  # mkdir -p /sys/fs/cgroup/xswap_limit
  # echo 2G > .../memory.max; echo max > .../memory.swap.max
  # echo max > .../memory.zswap.max
  # ( echo $BASHPID > .../cgroup.procs
  #   exec env MEMHOG_FILL=pattern numactl --cpunodebind=0 ./memhog 4 600 ) &

With zswap on nothing reaches the backend and nothing is charged. With
zswap off the two sides agree (526429 == 526429). memory.swap.max is
enforced at the backend: at 0, a device-less cgroup is killed, but with an
xswap device the pages go to zswap, cost no swap space, and reclaim keeps
making progress. Destroying the device returns the charge and the backend
Used with it, workload alive, over ten cycles. Also exercised: the same
invariant on an ordinary swap device with no xswap device.

Changelog
=========
RFC -> v1:

- Taken out of the RFC as a series of its own. The direction for charging
  is still under discussion, and the writeback series should not wait on
  it.

Baoquan He (2):
  mm, swap: do not retake the cluster lock when uncharging an xswap slot
  mm, swap: drop a refused xswap backend run directly

Nhat Pham (4):
  mm, swap: split the swap memcg charge helpers
  mm, swap: do not charge zswap-backed xswap entries
  mm, swap: charge an xswap entry when it gets physical backing
  mm, swap: don't gate xswap on the physical swap free count

 .../admin-guide/cgroup-v1/memcg_test.rst      |   2 +-
 include/linux/memcontrol.h                    |   6 +
 include/linux/swap.h                          |  66 ++++++-
 mm/memcontrol-v1.c                            |   3 +-
 mm/memcontrol.c                               | 164 +++++++++++++-----
 mm/swapfile.c                                 | 138 ++++++++++++++-
 6 files changed, 318 insertions(+), 61 deletions(-)


base-commit: 456d37694d1e05a1b9ddbd1e493bcd6cf2016b4f
-- 
2.54.0


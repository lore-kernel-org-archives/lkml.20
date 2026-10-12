Received: from mta1.migadu.com (out-146.mta1.migadu.com [95.215.58.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88075448B83
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796598; cv=none; b=TtMlvWIV+/oNuxXqoNzLfevP4a58of0wVS8fjB/i364dwWb2ce8n6ev+7GVDwajaEExtv5PAYHiK7mfESK8m8iKYerTwMYRJu20p15wpgUUfGa/IqOGZywZ+Yio3zwc2LtnmcAdAw+JfchvGzBM64qrOkSy2mrSqfxjkZBv+L8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796598; c=relaxed/simple;
	bh=69YtGiardfA9MwaWyqxmYX4WlfVGtuCzQQDaVfCNu2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlWCOCLA3VhzW2+jL6jWjUum3qm2osYCJSzEVlbIdBl7lMzPDbgJaWGCppr/Ubltg5s/Gmi7s7jhekRhLQyWUeLoYETb2fCZfZYXYIONwVMDZsckKc/VzxVdNNotm5pCfB1kx5iTQjO2MTOuTO3T4zho04qCafwq6F4UEr7YBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BM93IkYJ; arc=none smtp.client-ip=95.215.58.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BM93IkYJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=69YtGiardfA9MwaWyqxmYX4WlfVGtuCzQQDaVfCNu2k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791796593; v=1; x=1792401393;
 b=BM93IkYJ8R8KSxfDfnJ6DOKPCN4QyojQrtcWpyGI8fmxEDx6SeCZzwGd2GT1njpVenaRO38D
 qvYwfZ1wuKctTzbdllSUx8s87+cwaIsH7WB+cfWo5aVfh5d5kSFlIghWlxtnblMx5gMm665A18G
 +nl+iqRLU6pdIhdUakS9Elao=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 4ebed4ed4dfe5b5b;
	Mon, 12 Oct 2026 09:16:33 +0000
X-Mizu-Trace-ID: 4ebed4ed4dfe5b5b
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 17:16:22 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	hannes@cmpxchg.org, nphamcs@gmail.com, baohua@kernel.org,
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase
 I)
Message-ID: <asylV5YyyaHs8rP3@fedora>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZt7-8mcxqc1a02@soda.int.kasm.eu>

Hi Klara,

On 10/07/26 at 06:28pm, Klara Modin wrote:
> On 2026-10-03 08:31:22 +0800, Baoquan He wrote:
...snip...
> > The only argument create takes is a priority. The size comes from
> > xswap.max= at boot, so there is one place to ask for a size and one to
> > ask for a priority, and a priority can be given per device while a size
> > cannot:
> > 
> >   # echo > /sys/kernel/mm/xswap/create          default priority
> >   # echo 100 > /sys/kernel/mm/xswap/create      priority 100
> > 
> 
> > The default is the highest priority, SWAP_FLAG_PRIO_MASK. An xswap
> > device is then the first one tried, ahead of any ordinary swap device.
> > Setting a lower priority is allowed.
> 
> Nice, this is now a good default which the user should not have to
> change.

Thanks a lot for careful reviewing, and sorry for late reply.

> 
> > 
> > The device does not move once it exists, so the address space cannot be
> > changed from this interface either. xswap.max= at boot and this together
> > are the whole configuration.
...snip...
> > Open items
> > ----------
> > 
> > - xswap_create() sets si->pages to the whole address space (twice RAM by
> >   default) and _enable_swap_info() adds it to nr_swap_pages and
> >   total_swap_pages, which is what __vm_enough_memory() uses for
> >   overcommit. That raises the commit limit by 2xRAM for a device whose
> >   real capacity is bounded by the zswap pool and by how well the workload
> >   compresses. The question is which semantics overcommit should follow:
> >   worst-case backing, or the address space.
> > 
> > - destroy takes a bare swap type. The type is an internal index that
> >   alloc_swap_info() recycles as soon as SWP_USED clears, so a value read
> >   earlier can name a different device by the time it is written. The
> >   swapoff ABI uses a path for this reason. It wants a generation or
> >   another stable handle.
> > 
> > - The new interfaces (/sys/kernel/mm/xswap/create and destroy, xswap.max=,
> >   the new type string in /proc/swaps) are not documented yet.
> 
> To me it feels a bit weird to have the interface split between a kernel
> parameter and sysfs, meaning I have to configure this in two places now.
> As far as I gather, there's also nothing that needs the limit to be
> fixed at boot since it is applied at creation. If we want to expose this
> limit to users (as xswap does) it would be nice to have a 'max'
> shorthand for tha largest possible value, i.e. SWAPFILE_CLUSTER *
> UNIT_MAX (or whatever it might be in the future). That would I guess in
> practice give the same behaviour as vm.overcommit_memory=1 which might
> or might not be desirable.

Thanks for the comment.

Here xswap.max= is a global boot parameter, while not a per-device or
runtie knob. It sets the space space (si->max) of the xswap device
at boot and can't change at runtime. So on the two places: the size is
a global setting, fixed at boot; the priority is per device, it is in
the create interface. They are different things.

The default is 2xRAM. From our earlier discussion, this is the largest
size we think is sensible, and in practice I don't think it is not
reachable in reality. If a system has swapped out 70% of its memory, and
even more at 100%, it is already doubtful that it can still function
normally. So 2xRAM is an upper bound, not a target.

On the max short name: it would set the address space to the largest value
the format allows. As you said, that is close to vm.overcommit_memory=1,
and it is not a real capacity, so we may not want it as the default.

We keep xswap.max= only for special needs. Otherwise we may not need to
change it.

Chris suggested a CONFIG option for the size. While CONFIG is not friendly
to distros, you must rebuild the kernel to change it.

By the way, I remember you mentioned you ever did a test making swapped
out pages about 110% of system RAM, could you share your testing steps
or scripts so that I can give it a shot on my testing system? If it's
not convenient, then never mind.

Thanks
Baoquan

> 
> > 
> > Changelog
> > =========
> > v3 -> v4:
> > - Rebased onto the latest mm-new.
> > 
> > - Add boot parameter xswap.max= .
> > 
> > - The device has one size now: set at creation, fixed, with xswap.max= to
> >   ask for another one at boot. v3's runtime ceiling, the per-device limit,
> >   the clamp it wrote and the shrink to that ceiling are all gone as
> >   Johannes suggested (v3's patches 12, 13 and 14).
> > 
> > - v3's patches 2 and 4 are the new patch 3: neither builds a device
> >   alone. It also bounds find_next_to_unuse() and wait_for_allocation(),
> >   which walked up to si->max past the mapped range. Chris suggested
> >   this.
> > 
> > - New patches 11 to 13: a cgroup that cannot zswap is not given an xswap
> >   slot, swap_info_struct max and pages are unsigned long, and debugfs
> >   counters for the mapped range and the grow and shrink counts.
> > 
> > - v3's patches 1 and 3, and 5 to 11, are unchanged; the merge shifts them
> >   to 1 and 2, and 4 to 10.
> > 
> > - Minor comment and cleanup changes.
> > 
> > v2 -> v3:
> > - Rebased onto the latest mm-new.
> > 
> > - The grow path now honors the user-set ceiling (si->nr_clusters) instead
> >   of growing up to nr_clusters_max, and a ceiling below the mapped range
> >   is unmapped exactly instead of rounded to a chunk (patches 12 and 14).
> > 
> > - The limit write clamps the ceiling up to the clusters covering the pages
> >   in use, replacing the earlier WARN_ONCE; si->pages becomes mutable at
> >   runtime (patch 13).
> > 
> > - Minor comment and cleanup changes.
> > 
> > v1->v2:
> > - Patch 1 (mm: zswap: return -ENOENT when the swap device is gone) is not
> >   part of this series; it was posted separately.
> > 
> > - There is only one size knob now. The runtime ceiling and the debugfs
> >   per-device limit are gone. All that is left is the optional per-device
> >   cap, /sys/kernel/mm/xswap/type<N>/limit. Grow and shrink work without
> >   it.
> > 
> > - The shrink no longer keeps its own count of the free tail. It scans the
> >   tail instead, and dropping the counter also removes a call from the
> >   cluster allocation path.
> > 
> > - The priority is no longer a patch of its own. The create attribute
> >   takes it:
> >     echo 100 > /sys/kernel/mm/xswap/create
> > 
> > RFC v3 -> RFC v2
> > - Add patch 16 to support setting xswap device priority at creation.
> >   The create sysfs interface (/sys/kernel/mm/xswap/create) previously
> >   hardcoded every new device's priority to DEF_SWAP_PRIO, it now
> >   accepts an optional priority:
> > 
> >     echo "<percent> [<prio>]" > /sys/kernel/mm/xswap/create
> > 
> > - Bug fix: xswap_lock init ordering. mutex_init(&si->xswap_lock) was called
> >   after xswap_map_clusters() (which locks it), i.e. locking an uninitialized
> >   mutex. Init now before the first xswap_map_clusters() call. Thanks to Klara.
> > 
> > - Bug fix: Fixes a compile error in !CONFIG_XSWAP builds. xswap_debugfs_root
> >   is declared inside CONFIG_XSWAP ifdeffery scope, so the ungarded use
> >   caused error when CONFIG_XSWAP is off.
> > 
> > RFC v2-> RFC v3:
> > - Replace the "header-only swap file + swapon" creation hack with a
> >   proper file-less device created and destroyed via sysfs
> >   (/sys/kernel/mm/xswap/{create,destroy}).  This required the
> >   __swapoff() refactor and the free_swap_cluster_info() signature
> >   change (patches 4, 6, 14).
> > 
> > - Require zswap: refuse to create an xswap device when zswap is
> >   unavailable (patch 15).
> > 
> > - Split the unrelated zswap -ENOENT fix out of the series into a
> >   standalone patch (patch 1).
> > 
> > - Fix nr_free_tail over-counting on concurrent grow, shrink leaking
> >   detached clusters on early bail-out, a re-init race on cluster
> >   spinlocks in xswap_map_clusters(), the nr_clusters_mapped update
> >   ordering, and swapoff accessing the shrinker-unmapped cluster tail.
> > 
> > - Minor cleanups (checkpatch, /proc/swaps alignment, commit messages).
> > 
> > RFC v1-> RFC v2:
> > - Added __GFP_HIGH | __GFP_NOMEMALLOC to alloc_page() and kmalloc_array()
> >   in the grow path, plus memalloc_noreclaim_save/restore() wrapping,
> >   to prevent the grow path from consuming emergency memory reserves
> >   or recursing into swap under PF_MEMALLOC. This is folded into patch 3.
> >   This was pointed out by Nhat.
> > 
> > - Folded the mutex serialization fix into the cluster grow patch (patch
> >   3). This is suggested by Nhat.
> > 
> > - Fixed coding style issues: corrected indentation of declarations in
> >   xswap_unmap_clusters(), removed unnecessary block scope around the
> >   err variable in xswap_map_clusters().
> > 
> > - Rebased onto mm-unstable
> > 
> > Baoquan He (13):
> >   mm, swap: refactor free_swap_cluster_info to take swap_info_struct
> >   mm, swap: back the cluster_info array with a sparse VM_SPARSE area
> >   mm, swap: add sysfs create interface for xswap
> >   mm, swap: add xswap grow trigger on cluster allocation
> >   mm, swap: add xswap_try_shrink and shrink trigger on cluster free
> >   mm, swap: free backing pages in xswap_unmap_clusters
> >   mm, swap: defer xswap shrink to workqueue to avoid lock recursion
> >   mm, swap: refactor swapoff and add xswap_destroy
> >   mm, swap: require zswap for xswap devices
> >   mm, swap: do not give an xswap slot to a cgroup that cannot zswap
> >   mm, swap: widen swap_info_struct max/pages to unsigned long
> >   mm, swap: add debugfs counters for xswap
> >   mm, swap: let the command line set the xswap device size
> > 
> > Chris Li (1):
> >   mm: xswap support for zswap
> > 
> >  include/linux/swap.h |   16 +-
> >  mm/Kconfig           |    9 +
> >  mm/page_io.c         |   19 +
> >  mm/swap_state.c      |    9 +
> >  mm/swapfile.c        | 1221 +++++++++++++++++++++++++++++++++++++++---
> >  mm/zswap.c           |   11 +-
> >  6 files changed, 1205 insertions(+), 80 deletions(-)
> > 
> > 
> > base-commit: 9a0542b19a541eda3f82934ee747c61ec3f18847
> > -- 
> > 2.54.0
> > 

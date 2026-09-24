Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABB2446825
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244049; cv=none; b=boKRe6SZLEkf1hgsUJrkgGxrGIukQF+RHtoQubfQxahWPry6N+HuB//JnyfUo5biTD+gGgmKsQ9+7gQdJX0a1BKQ1FYW5b3T3nULzbq52UrpNMOyaIucgyjcbbhLCfXWmGvTID4F+G21F7gR0zwQWs5nYO/w1JT3iTgY8dMZViI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244049; c=relaxed/simple;
	bh=p0hsvkX182gzIufK8eKnE3BB0dDKj9PcYBDxIxs7XcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saYpUpuQXOKkk59vdXWvzSHx86HvNCxS3SwToHd4mSEqv2rP+4oidTGjhWAhQxSO2SIObOF7UIrL0OHOIxLfCvBrsbEYebIHxEWeq4V0rlVwq9mDhcRpSIIIZpsrzyKZk5R/Ox1k32JM5NAB9eN5zzqAVLHztgejenaPT5YTLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNXq0dli; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNXq0dli"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a318299b38so17419741fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790244034; x=1790848834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn5PGTIKzsWJJgsHf1vn6sS9xeXwHdDO76IxSeD182Q=;
        b=jNXq0dliSlxKfOqeNgH+ZEMQ/4SVDnBDGY8dVVVQLvJJ7pjEYS6UUdKtloWibFU0yp
         I1k+oNrn/gG+MOJ5lLEWEtbrEiNzRUeNkH08x9Zk7fnDk0M/xrcPLhKbk1oq6XglZBk3
         bsDebWMkG5rADRTfsOww3ntnCkB1wpBI8tO9bSQfRYXKAfuJnWWn9CWxctb6Cho3mHVz
         hEG+TzJQ5DVLqgNVRcDH7zBlh6LTVMxHjXtKD7lzq/2tKyeezK+4Ib053gGdr7q2hjrE
         v6ZM61S5N4zP2rM3cfGLajVE6nXB3V0qyhNADEnYiiugEHd9H0/oW81RbdAa3z8ZuLcU
         FLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244034; x=1790848834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn5PGTIKzsWJJgsHf1vn6sS9xeXwHdDO76IxSeD182Q=;
        b=XFjQe7K+gRncMPkVaLoBOKBN9h1LyrFqw/faurTNSlX6nWcBBVF7uvq+x5Zv340y0L
         5PojB52YLefA2GzxVeAxNnMdscVzyPQ+BPCsQSf/rCHO/dRhXxPCiklmW7fGS+aYDyzy
         ZP3/moz1qzeqdqZ31Ay9h0qqCpSCDWEOGRW/Z1x37dZ96PByvhY8yGqFOwdXNPx8j27k
         H8ZFlhcTd3h03x0ZfcHJQfEplkeUYMu2xKM6exxxWxqY2rGqLH/tcFqgLebA+qy9JW/t
         OpOJDTkCPXiRpwvSWDHCguVIbmJXijZg8c6b4FszTw7Dj+FMfwuJqmUep/4ajq1HPcrR
         mYFA==
X-Forwarded-Encrypted: i=1; AKwUvBw0tELtaO9j4pDFPOhgVzPiETH0e8HVnBnTG9G+au1bDmCUHjef21nI8ZZKIlP7wHYQYFUGLMjIPimFzHw=@vger.kernel.org
X-Gm-Message-State: AFuF++m+voAWEwOyeS/pTN+iFv0oUyfTUzh2e/LksD+u/P45YxcIGqAu
	yri7rWbJQQQHiIsA3Uf6jP6gDVsSUirwzndkaOe5IahhDikFJDRuUArd
X-Gm-Gg: AYBFou0yY6+Wfjo6Uejv3VGZZwNBXPY0NgcWOo48DEq285Pm2KINLsSwvKwh0whopMB
	CJadLQUyNpIxTguF4ZmuwtiobSI7elFmL2StGWRzE5WZlOzTx0vtaGa+PBkeqfQfT6nAA5OvmJ9
	7mtNkXVXYkaoRqRkLF0X9dX9hxqTa5gMTWyY9vCKv/qdSTSjYnbJP0RTRypfLqbheBMASxEmS7d
	mpD/4PcoLMcfJP0inoYJJYP51w3WCnOII7jO8Kv104denn3Gms6Yq0sok3Jw064KjHHGlSvCXoX
	S1vbuy5iN3KnTUqV+lsqd4c5doOckhyHT02bpIQtsz4NI5gP/PQCI697EBhToqOR7XbI6y3fUd4
	4qLlMKlGz31Vdyd0ryaeMJa1HqneLdTAwSLahI2o9ZEE7bejZPvgJUjhtO9YOZCL/gf9m/8re8b
	cyPVJIAOhlLi89nJVsU2iYh+fbbBFu/JEqdaGRjR+Dw9oErm2HMO+qnOoutljoPwxbh9k3dHjYK
	lnvinMTqWscRMDmFMKnl9DuvG3L
X-Received: by 2002:a2e:be84:0:b0:3a1:30c4:d95 with SMTP id 38308e7fff4ca-3a63bf684d2mr5192491fa.5.1790244033541;
        Thu, 24 Sep 2026 03:00:33 -0700 (PDT)
Received: from localhost (sol-eduroam-pathost130.ki.se. [130.237.96.130])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bdbc54bsm5933921fa.4.2026.09.24.03.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:00:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:00:31 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
Message-ID: <arTwYTK22Wm0u3BC@parmesan.int.kasm.eu>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>

On 2026-09-16 18:19:07 +0800, Baoquan He wrote:
> xswap is a swap device with no backing storage. Swapped-out pages live                                
> in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc area,                                 
> and the area is grown and shrunk on demand as swap usage changes.                                     
>                                                                                                       
> The problem being solved is the static size of compressed swap. Both   
> zram and zswap need the size fixed in advance, and neither gives memory 
> back when the workload shrinks. The solution should be a device whose
> size can scale up/down as per usage. xswap does that by mapping the
> metadata lazily instead of reserving it for the whole range.
> 
> Design   
> ------                           
> - si->cluster_info[] stays a plain array. Access is still
>   &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branch, no 
>   RCU discipline, no tear-down state machine, no NULL return.              
> - Only an initial chunk is mapped at creation. The rest of the address     
>   space is reserved, not allocated, so an idle device costs nothing.
> - Growth is driven by allocation. When no free cluster is left and the       
>   address space has room, the next chunk is mapped and added to the free  
>   list. No userspace involvement.
> - Shrink is driven by frees. The free tail is scanned, and whole chunks
>   are unmapped once the mapped range is at most half in use and several
>   chunks can go. One chunk is left mapped as slack, so the next                                       
>   allocation does not map it straight back. A ceiling lowered below the                               
>   mapped range skips the half-in-use rule and is enforced at once.
> 

> Size
> ----
> A device starts at 1xRAM, rounded down to the cluster. That costs
> nothing, because the mapping is lazy. The underlying address space is
> 2xRAM. An optional per-device cap,
> /sys/kernel/mm/xswap/type<N>/limit, lets an admin lower the ceiling;
> the excess is unmapped right away. Grow and shrink both work without
> it. Creating a device requires zswap.

So I can't set an xswap device to more than twice the RAM? I suppose I
could create multiple xswap devices, but it would get tedious fast on
systems which have a different amount of memory. Is there a particular
reason for this limit? I think I could create an arbitrarily large xswap
device with your previous version which needed the specially crafted
swapfile (with only the header).

As I wrote in the other thread, I would rather not have to set a limit
at all, or at least have a limit I'm sure I won't reach.

> 
> Interface
> ---------
>   /sys/kernel/mm/xswap/create           write an optional priority
>   /sys/kernel/mm/xswap/destroy          write a swap type
>   /sys/kernel/mm/xswap/type<N>/limit    read/write, in pages
> The device shows up in /proc/swaps as xswap<N>.
> 
> Note
> ----
> Writeback, rmap lookup, etc. are consumers of this base. I have a
> writeback prototype on top of this base and will post it as a reference.
> 
> Testing
> -------
> qemu KVM guest, 8G RAM.
> 
> Tested create/destroy, raising and lowering the limit (including clamping
> when it is written below the pages in use), shrink with live entries, and
> 2000 create/destroy cycles for leaks; all passed.
> 
> The workload is memhog: it faults in N GB of anonymous memory inside a
> cgroup with a much smaller memory.max, forcing the pages to swap.
> Set MEMHOG_FILL=pattern: the default fill is all-zero pages that zswap
> compresses to almost nothing, so the device never fills.
> 
>   # echo 1 > /sys/module/zswap/parameters/enabled
>   # mkdir -p /sys/fs/cgroup/xswap_limit
>   # echo max > /sys/fs/cgroup/xswap_limit/memory.swap.max
>   # MEM="MEMHOG_FILL=pattern numactl --cpunodebind=0 --membind=0 ./memhog"
> 
> 1. Create and destroy
> 
>    # echo > /sys/kernel/mm/xswap/create
>    # swapon
>    NAME    TYPE  SIZE USED PRIO
>    xswap0  xswap 7.8G   0B   -1
>    # cat /sys/kernel/mm/xswap/type0/limit
>    2035199
>    # echo 0 > /sys/kernel/mm/xswap/destroy
>    # swapon
>    (nothing)
> 
>    limit is in 4 KiB pages; 2035199 is RAM (2034976 pages) rounded up to a
>    whole number of clusters. The device starts at RAM, not twice RAM.
> 
> 2. The cap holds
> 
>    # echo 2147483648 > /sys/fs/cgroup/xswap_limit/memory.max
>    # ( echo $$ > /sys/fs/cgroup/xswap_limit/cgroup.procs; eval $MEM 11 300 ) &
>    # awk '/SwapTotal|SwapFree/' /proc/meminfo
>    SwapTotal:       8140796 kB
>    SwapFree:         354012 kB
> 
>    The cgroup runs out of room before the device does and the OOM killer
>    takes the workload ??? that is the pass signal. SwapFree never exceeds
>    SwapTotal, so nr_swap_pages never goes negative.
> 
> 3. Raising the cap
> 
>    # echo 3052543 > /sys/kernel/mm/xswap/type0/limit
>    # awk '/SwapTotal/' /proc/meminfo
>    SwapTotal:      12210172 kB
>    # ( echo $$ > /sys/fs/cgroup/xswap_limit/cgroup.procs; eval $MEM 11 300 ) &
> 
>    No OOM this time: 2473705 pages in use against 2034976 pages of RAM, so
>    usage goes past RAM.
> 
> 4. Lowering the cap below the pages in use
> 
>    # echo 1000000 > /sys/kernel/mm/xswap/type0/limit
>    # cat /sys/kernel/mm/xswap/type0/limit
>    2426879
>    # awk '/SwapTotal|SwapFree/' /proc/meminfo
>    SwapTotal:       9707516 kB
>    SwapFree:             860 kB
> 
>    The write is clamped up to the clusters covering the pages in use, so
>    the free slots in the partially used top cluster stay accounted for.
> 
> 5. Shrink with live entries, then destroy
> 
>    # echo 4069887 > /sys/kernel/mm/xswap/type0/limit
>    # sleep 60
>    # awk '/SwapFree/' /proc/meminfo
>    SwapFree:       16279548 kB
> 
>    The shrink unmapped the tail ??? the state find_next_to_unuse() must
>    survive. Put live entries back and destroy:
> 
>    # ( echo $$ > /sys/fs/cgroup/xswap_limit/cgroup.procs; eval $MEM 3 300 ) &
>    # echo max > /sys/fs/cgroup/xswap_limit/memory.max
>    # echo 0 > /sys/kernel/mm/xswap/destroy
>    # swapon
>    (nothing)
> 
>    dmesg stays clean across create, shrink, swapoff and destroy.
> 
> 6. 2000 create/destroy cycles, diffing /proc/slabinfo before and after:
>    the largest growth is 142 objects. One object leaked per cycle would
>    be 2000.
> 
> Performance
> -----------
> (qemu KVM guest, 8G RAM, zram as the swap device)                                                         
> This series should not slow down a kernel that never creates an xswap
> device. I measured that overhead by comparing the base tree with this
> series. Both were built with the same .config and CONFIG_XSWAP=y, and no
> xswap device was created. I ran three 3G MADV_PAGEOUT workloads, three
> rounds each, alternating between the two kernels across reboots. I
> counted retired instructions per page swapped out with perf stat:
> 
>   workload                      base       series     delta
>   swapout                       50824.8    50866.2    +0.08%
>   swapout and swapin            63770.4    63796.8    +0.04%
>   swapout into a full device    67729.9    67707.8    -0.03%
> 
> Two runs of the same kernel differ by less than 0.1%, so the differences
> above are real, not measurement noise. I cannot use wall clock time for
> this comparison, because two runs of the same kernel differ by more than
> the two kernels do.
> 
> Changelog
> =========
> v2 -> v3:
> - Rebased onto the latest mm-new.
> 
> - The grow path now honors the user-set ceiling (si->nr_clusters) instead
>   of growing up to nr_clusters_max, and a ceiling below the mapped range
>   is unmapped exactly instead of rounded to a chunk (patches 12 and 14).
> 
> - The limit write clamps the ceiling up to the clusters covering the pages
>   in use, replacing the earlier WARN_ONCE; si->pages becomes mutable at
>   runtime (patch 13).
> 
> - Minor comment and cleanup changes.
> 
> v1->v2:
> - Patch 1 (mm: zswap: return -ENOENT when the swap device is gone) is not
>   part of this series; it was posted separately.
> 
> - There is only one size knob now. The runtime ceiling and the debugfs
>   per-device limit are gone. All that is left is the optional per-device
>   cap, /sys/kernel/mm/xswap/type<N>/limit. Grow and shrink work without
>   it.
> 
> - The shrink no longer keeps its own count of the free tail. It scans the
>   tail instead, and dropping the counter also removes a call from the
>   cluster allocation path.
> 
> - The priority is no longer a patch of its own. The create attribute
>   takes it:
>     echo 100 > /sys/kernel/mm/xswap/create
> 
> RFC v3 -> v1
> - Add patch 16 to support setting xswap device priority at creation.
>   The create sysfs interface (/sys/kernel/mm/xswap/create) previously
>   hardcoded every new device's priority to DEF_SWAP_PRIO, it now
>   accepts an optional priority:
> 
>     echo "<percent> [<prio>]" > /sys/kernel/mm/xswap/create
> 
> - Bug fix: xswap_lock init ordering. mutex_init(&si->xswap_lock) was called
>   after xswap_map_clusters() (which locks it), i.e. locking an uninitialized
>   mutex. Init now before the first xswap_map_clusters() call. Thanks to Klara.
> 
> - Bug fix: Fixes a compile error in !CONFIG_XSWAP builds. xswap_debugfs_root
>   is declared inside CONFIG_XSWAP ifdeffery scope, so the ungarded use
>   caused error when CONFIG_XSWAP is off.
> 
> RFC v2-> RFC v3:
> - Replace the "header-only swap file + swapon" creation hack with a
>   proper file-less device created and destroyed via sysfs
>   (/sys/kernel/mm/xswap/{create,destroy}).  This required the
>   __swapoff() refactor and the free_swap_cluster_info() signature
>   change (patches 4, 6, 14).
> 
> - Require zswap: refuse to create an xswap device when zswap is
>   unavailable (patch 15).
> 
> - Split the unrelated zswap -ENOENT fix out of the series into a
>   standalone patch (patch 1).
> 
> - Fix nr_free_tail over-counting on concurrent grow, shrink leaking
>   detached clusters on early bail-out, a re-init race on cluster
>   spinlocks in xswap_map_clusters(), the nr_clusters_mapped update
>   ordering, and swapoff accessing the shrinker-unmapped cluster tail.
> 
> - Minor cleanups (checkpatch, /proc/swaps alignment, commit messages).
> 
> RFC v1-> RFC v2:
> - Added __GFP_HIGH | __GFP_NOMEMALLOC to alloc_page() and kmalloc_array()
>   in the grow path, plus memalloc_noreclaim_save/restore() wrapping,
>   to prevent the grow path from consuming emergency memory reserves
>   or recursing into swap under PF_MEMALLOC. This is folded into patch 3.
>   This was pointed out by Nhat.
> 
> - Folded the mutex serialization fix into the cluster grow patch (patch
>   3). This is suggested by Nhat.
> 
> - Fixed coding style issues: corrected indentation of declarations in
>   xswap_unmap_clusters(), removed unnecessary block scope around the
>   err variable in xswap_map_clusters().
> 
> - Rebased onto mm-unstable
> 
> Baoquan He (13):
>   mm, swap: add CONFIG_XSWAP and xswap fields to swap_info_struct
>   mm, swap: refactor free_swap_cluster_info to take swap_info_struct
>   mm, swap: add xswap cluster grow via VM_SPARSE vmalloc
>   mm, swap: add sysfs create interface for xswap
>   mm, swap: add xswap grow trigger on cluster allocation
>   mm, swap: add xswap_try_shrink and shrink trigger on cluster free
>   mm, swap: free backing pages in xswap_unmap_clusters
>   mm, swap: defer xswap shrink to workqueue to avoid lock recursion
>   mm, swap: refactor swapoff and add xswap_destroy
>   mm, swap: require zswap for xswap devices
>   mm, swap: cap xswap growth at nr_clusters
>   mm, swap: add sysfs per-device size limit for xswap
>   mm, swap: shrink xswap to the ceiling when it drops
> 
> Chris Li (1):
>   mm: xswap support for zswap
> 
>  include/linux/swap.h |   26 +-
>  mm/Kconfig           |    9 +
>  mm/page_io.c         |   19 +
>  mm/swap_state.c      |    4 +
>  mm/swapfile.c        | 1240 +++++++++++++++++++++++++++++++++++++-----
>  mm/zswap.c           |    7 +-
>  6 files changed, 1174 insertions(+), 131 deletions(-)
> 
> 
> base-commit: baa8de2f3448d1466a888a805c18d01c998fe052
> -- 
> 2.54.0
> 

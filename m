Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44C44E67A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198880; cv=none; b=YzG6Cx19v2Xaj6lbu74QFXwodqsiGM9w64STAchsRe0+e3vOnt4TyzFP3pq9/WItm7rcvN1ntqOqAWfnimMBSSpSDO1fNTriFEE74TNU+xNHrHKJoG+Hdw+7HoUWwAXKhmVodWZ3DJSbqzpq8pUtFdQWCl6Sb2NQVmeLx642ZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198880; c=relaxed/simple;
	bh=5h4EQZuOgHV+MSphDIJrcKYtLiv2Xf+nQA9uyiTJ4g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLtmCShUuEWpiiYguJePgjb/x97mMQbxAYgxDEjZC7TimAUMtFqu+G0e1AlYPwAhTzXug+XTJZscDBxp0g/oQmdFzGMqivN6443UV5TCOcBUQfm1ptFiymj22+wZwGGZBbif5E2qiNZiK/iE2qTOAbM/c+mMaa16feKQmHy3xeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcBA7aLP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcBA7aLP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so111460a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788198878; x=1788803678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EqIx8ijt4hM95Y+cetezXZICQTZpN4/GGo2SvJmbUF4=;
        b=JcBA7aLPDXtEA/rhxKaBF4air/tW0SspmyAwv7YUQaClu50KLPnSTQ6gk9cBvSAGvW
         I3Jy7dr1zbZCdECjs7lQyBDVBeM8SHawRoY5WuCaBaCWvudyJzdikthfa4EXbg/Cej0r
         nv0Eg9+knFQnSkfC3JyBSaHL5z40H9DewZr5UlzNn6lf8qpJUMdf+i4TFhXTsscEf4XQ
         3pTfypGmdfnMIeyI4ohFVASzvhFhkZGnvjGBvmrf5TdkMZEOZIDAKTAA4N7r0zXyXOK9
         KMwnKP5CDXSLbBGGqHLBQDr4tuipWQcxqvcWLtWioEP6nPPqRe2rIaFYy1DFSqPr2mfd
         Ouaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198878; x=1788803678;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EqIx8ijt4hM95Y+cetezXZICQTZpN4/GGo2SvJmbUF4=;
        b=d1jNUwSxbfUDfTYDG+p2axV3Fqqq6pc8Vu4kyOzSPxAeeRIonUQ9GGDMffXtBvl6L9
         QzueeFuOaEoE6Y17AWJQIzrsQgusOF6RhZRpkmh5iG+fMJDk8ln9OhKpE/KN6foY412Z
         htibFhOJ3hEyaZiLVFMhS7PbmeII+btZby/0fYuGz4udJOU7/rQdnK68nArj2EU5Qqdh
         3UKM0tjA0sMJUaL/iHQh7JFvauMN2ENeR+2eWBSr1MVjNH1yADURhSmvw4Ugcv5qMnls
         GLP02BLBIP8ipBuhn1NffKtjsR0cW4lpYrUubWwx0RtGVIOIC94OQGR+ye1slnXAGmuK
         tYPg==
X-Forwarded-Encrypted: i=1; AKwUvBwgdAM71FYCmZQQqJ7Q6wBPpHb/3wrtoy4ILewA8PG3ttYsvRnDVBp5ltiv2aYSkyDmaaiSOgWCD+Fmrck=@vger.kernel.org
X-Gm-Message-State: AFuF++mzkNK5D1mzMA+f3q36WtZ6p9BM6Jys6CSN6PaxSBiWjJJK9phC
	qmh1SB+fW4zF7V6rKtrgPqLTjnO9s11v7qAWb5yvf1QJNq0o0S0xEWrq
X-Gm-Gg: AYBFou19cY3dKB+Xcd3qMqJuACxvWgRnrQVqVDDesAEaV7xrgPvpeelbIi6xcBUGODd
	PgxBPHdQYYpLUQ69Qayw5fcOZEvUoQe8RSrbbCGdU5xx/SWeUiH+iYzKo1kl3LU5FwPODaLfXao
	P5TgD0Dp+Z6+jC0/O1w62Z+Lb6DD2OfgRhQ/H9n5G9TX2V9SveNDPjm+DlpUJIDjq/woVBpIBp4
	t4QRVqUqYUaR2O5xDtvc2rFmK1anTuUYpB61CXJQGcvADj8ALWUG3m3xfaPyVoZ1lbwh63xoGcM
	A5RiVJOndyE2s/M+uBg2KaEPTYkIFUPtMJeCusdWFrPHhd7hak30avhVF7VjBGJfXzo73D+AHvP
	KAjmU03p5+/L+cv13zTW/8bQMEcWcI3XUaqF8bpei2s1kgsCs3R1FYXCGzluZ2/ITdgmJUbo0Mo
	2m4VHRSNCihH2eWNSg8mvXzzelDB8t0Oz2J6PWsT7wEAkn30YI7/FUJzrJ4X0td2iYUTqrur+uJ
	wTgT3fa63VhsgRS6Dfaun0l
X-Received: by 2002:a17:90a:dfc8:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-398e1f4be7dmr13082589a91.21.1788198878072;
        Mon, 31 Aug 2026 10:54:38 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398aa331ad1sm5260154a91.2.2026.08.31.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:54:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 01:54:29 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] xswap: extendable swap device backed by zswap
Message-ID: <apVNB2FRTFMDtvGP@KASONG-MC4>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>

On Thu, Aug 27, 2026 at 05:44:50PM +0800, Baoquan He wrote:
> xswap is an extendable swap device with no backing storage. Swapped-out
> pages live only in zswap, so the device wastes no disk space and its
> size is independent of any physical device.
> 
> xswap decouples PTE swap entries from physical backing storage. The
> cluster_info array is backed by a sparse vmalloc (VM_SPARSE) area that is
> grown and shrunk on demand:
> 
> - Grow: when cluster allocation runs out of free clusters and the device
>   is below its ceiling, more physical pages are mapped into the VM_SPARSE
>   area and their clusters are added to the free list.
> 
> - Shrink: when contiguous free clusters accumulate at the tail of the
>   mapped range (tracked in O(1) via nr_free_tail), they are unmapped and
>   the backing pages freed.  Shrink is deferred to a workqueue to avoid
>   lock recursion.
> 

Hi Baoquan,

I didn't check too many details on how the implementation in previous
RFC until now, After looking at it, using VM_SPARSE to setup the cluster
info area is a really smart idea, really good job!

I think many info are missing in the cover letter though so I wasn't
sure how this grow and shrink works from the description, after
checking the code, it looks much cleaner to me now, correct me
if I'm wrong:

Every xswap device will have a huge and fixed "hard limit"
(si->max and si->nr_clusters_max), and practically can be considered
large enough to hold any workload, and won't change once swapon
is done.

The actually data (si->cluster_info) of xswap device is completely
sparse and dynamic using VM_SPARSE, and so we don't need to change
any existing routine. It grow/alloc and shrink/free automatically by
the kernel, limited or driven by a "soft limit" (si->nr_clusters
and si->pages) which you can modify using the interface below.

Once concern is that the "hard limit" is now the total RAM size. Isn't
that actually a bit small? Will be better if that one is tunable too?
With a parameter, and before swap on, as the hard limit is hard to
adjust once swapon is done. Any thing limiting this?

And I think these details better be mentioned bit more too.

> A per-device ceiling (nr_clusters) bounds growth and is adjustable at
> runtime via debugfs.
> 
> Interface:
> 
>   /sys/kernel/mm/xswap/create           write "<percent> [<prio>]" to
>                                         create a device; percent is a
>                                         percent of RAM (0 for the default),
>                                         prio is an optional swap priority
>                                         (default DEF_SWAP_PRIO)

With what I have read so far, the mandatory percent limit here is kind of
strange, even with 0 as default. Why not make both args optional and just
let it grow without any limit by default? It looks more "fully dynamic"
that way.

>   /sys/kernel/mm/xswap/destroy          write a swap type to tear down
>                                         a device
>   /sys/kernel/debug/xswap/type<N>_cluster_limit
>                                         read/write the per-device
>                                         cluster ceiling

Having a lot of type<N>_cluster_limit in a seperate debug path
looks a bit odd to me too, and the _cluster_limit doesn't look
like a debug interface, we will be relying on debugfs for setting
the limit, also see below.

> 
> Since xswap has no backing, swapped-out pages are stored compressed in
> zswap: physical writeout is skipped, and zswap writeback is disabled when
> every swapfile in the system is an xswap device.  xswap requires zswap, so
> device creation is refused when zswap is unavailable.
> 
> Naming:
> ======
> I'm going with "xswap" (the "x" for extendable/extension) rather than "vswap".
> Chris suggested this name, and this aligns with the "VFS-like swap layers"
> direction Chris Li described in the first swap abstraction LPC talk
> (co-hosted with Yosry) the swap ops and the xswap extension interfaces in
> this series are moving toward exactly that. I don't have a strong preference
> between xswap and vswap, so if reviewers object to the name, please comment.
> 
> Note:
> =====
> This patchset only build the base. On top of this, the subsequent core code
> implementation of xswap writeback, rmap etc can be done more easily. E.g, we
> only need add one field in struct swap_cluster_info to let xs_table point to
> physical swap entry, or zswap entry etc. On top of this patchset, no need to
> stir core data structure too much or introduce extra data structure.
> 
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -57,6 +57,9 @@ struct swap_cluster_info {
>         u8 order;
>         atomic_long_t __rcu *table;     /* Swap table entries, see mm/swap_table.h */
>         unsigned int *extend_table;     /* For large swap count, protected by ci->lock */
> +#ifdef CONFIG_XSWAP
> +       unsigned long *xs_table;
> +#endif
> 
> Testing (taken on qemu kvm guest with 8G memory):
> =========
> 1. enable zswap and create/destroy xswap device
> ~# echo 0 > /sys/kernel/mm/xswap/create
> -bash: echo: write error: Operation not supported
> ~# echo 1 > /sys/module/zswap/parameters/enabled
> ~# echo 0 > /sys/kernel/mm/xswap/create

Recent proposal have mentioned mm/xswap, and mm/swap/tiers, while we
already have mm/swap and module/zswap. I think it's fine to use sysfs
to organize things but will it be good to have it in unified way to
put them all under mm/swap/? And will mkdir be prettier than
echo > create? For these part, just an idea, no strong opinion here.

> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap 2.3G   0B   -1
> ~# echo 0 > /sys/kernel/mm/xswap/destroy
> ~# swapon
> 
> 2. create xswap device and tune the zswap size
> 
> ~# echo "50 10" > /sys/kernel/mm/xswap/create
> ~# echo 0 > /sys/kernel/mm/xswap/create
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap 3.9G   0B   10
> xswap1 xswap 2.3G   0B   -1
> 
> ~# cat /sys/kernel/debug/xswap/type0_cluster_limit
> 1990
> ~# cat /sys/kernel/debug/xswap/type1_cluster_limit

Can we just use size instead? Calculating the cluster number
seems not neccessary, only making it harder to use, if this
is suppose to be a formal interface and not debug only.

> 1194
> ~# echo 2048 > /sys/kernel/debug/xswap/type0_cluster_limit
> ~# echo 2048 > /sys/kernel/debug/xswap/type1_cluster_limit
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap   4G   0B   10
> xswap1 xswap   4G   0B   -1
> 
> 3. under heavy memory pressure tune swap size or destroy xswap device
> 
> ~# stress-ng --vm 1 --vm-bytes 8G --vm-keep --timeout 120s &
> 
> ~# echo 1024 > /sys/kernel/debug/xswap/type0_cluster_limit
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap   2G 2.6G   10
> xswap1 xswap   4G 182M   -1
> ~# echo 1024 > /sys/kernel/debug/xswap/type1_cluster_limit
> ~# swapon
> NAME   TYPE  SIZE   USED PRIO
> xswap0 xswap   2G   1.4G   10
> xswap1 xswap   2G 315.4M   -1
> 
> ~# echo 0 > /sys/kernel/mm/xswap/destroy
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap1 xswap   2G 1.1G   -1
> 
> I tried create/destroy and grow/shrink xswap device under heavy
> memory pressure, all passed.

Do you have some performance reading on this? I remember you had
some in your previous RFC, better to at least keep a link, I spend
quite some time to find the previous zswap test result from you.
I noticed this series is different from what you sent before as it
only contains the foundation so there could be no performance gain
currently but still, might worth mentioning what this could achieve.

Another thing is, maybe we can defer the implementation of shrink
for easier understand and review? The memory consumption is totally
acceptable even without shrink.

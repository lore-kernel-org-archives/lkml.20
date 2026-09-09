Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A437B345EAE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922964; cv=none; b=anVONf9ItPVYCZULAx8+v8Xxi9RWh724gK25EZB33nMtu6IIW4fRTACYTUsQrC0v2+TpF/opWRyE1k0On/E6IUCfjAkvjin50tUwvlDbqwzkJH87H5DLGjo8GEwNuIGiYjTgsrDWDcjy+bopIoxOcQb1zIuDoVikjCK+7lvpaZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922964; c=relaxed/simple;
	bh=TL0ufw3FZMr6ABUpDRcuVYDCw81fNXUjWAocQH50Skw=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=YCabs0NoHVth3a2LMQoacOG3ZLOkbw88jNAm6I3ZJhihWMxXdCq2S6bjUxv9LmgizZLvuzoWvqCr3Wqit4N0OXU1AKFDrLR6rZhyvHlH7f5kMC4mnglmLiXkRXiaQa7yEaqVVj6Emv0jFkXUzqzD29x0irk9vF0rVcAMo4tYhzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hflwX34ncz5B100;
	Wed, 09 Sep 2026 11:02:36 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 68932RtR001931;
	Wed, 9 Sep 2026 11:02:27 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 9 Sep 2026 11:02:28 +0800 (CST)
X-Zmail-TransId: 2af96aa0cc44b03-7eb1b
X-Mailer: Zmail v1.0
Message-ID: <20260909110228828hKTCgUeuZkOujOBaVtUcL@zte.com.cn>
In-Reply-To: <20260909023507.1408925-1-xialonglong2025@163.com>
References: 20260909023507.1408925-1-xialonglong2025@163.com
Date: Wed, 9 Sep 2026 11:02:28 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <xialonglong2025@163.com>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <linux-mm@kvack.org>,
        <chengming.zhou@linux.dev>, <linux-kernel@vger.kernel.org>,
        <xialonglong@kylinos.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzFdIG1tL2tzbTogdHJ5bG9jayB0aGUgbW1hcCBsb2NrIGluIHRoZSB1bnN0YWJsZSB0cmVlIHdhbGs=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68932RtR001931
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 09 Sep 2026 11:02:36 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA0CC4C.000/4hflwX34ncz5B100

> From: Longlong Xia <xialonglong@kylinos.cn>
> 
> Every node that unstable_tree_search_insert() descends through is
> revalidated by get_mergeable_page(), which takes the mmap_read_lock
> of the mm the node's rmap_item belongs to. These are taken while
> ksmd holds ksm_thread_mutex, so a single mm whose mmap lock is
> being written to - a process busily mmap'ing or munmap'ing -
> stalls the whole scanner, for every KSM user on the system.
> 
> Use mmap_read_trylock() instead. The trade-off is that pages of a
> contended mm may need more full scans to merge; in return, ksmd
> latency no longer depends on unrelated mmap activity of the
> scanned processes.
> 
> Testing, on a 4 vCPU QEMU x86_64 guest with ksmd at
> pages_to_scan=100000 and sleep_millisecs=0, 5 runs per kernel
> (median reported; baseline is the parent commit):
> 
> 1. A contender process registers a 64 MiB MADV_MERGEABLE area of
>    unique pages and runs two threads looping mmap/munmap of
>    256 MiB, so its mmap lock is held for writing much of the
>    time.
> 2. Once that churn is running, a quiet victim process registers
>    32 MiB of 2048 unique pages duplicated 4 times.
> 3. Sample /sys/kernel/mm/ksm counters and ksmd's /proc stats
>    every 0.5 s for ~2 min of churn, then stop the churn and
>    sample until the victim finishes merging.  The same phases
>    run without the churn as an uncontended control.
> 
> Results (median of 5 runs):
> 
> - contended ksmd scan rate: 11,473 -> 58,397 pages/s (5.1x)
> - contended victim merge time: 10.4 s -> 1.7 s; the contended
> - contended ksmd CPU per scanned page: 13.4 us -> 3.5 us
> - ksmd time in uninterruptible sleep under churn: 78% -> 57%;
> - uncontended (control): merge time 0.65s vs 0.62s, scan rate
>   259K vs 247K pages/s and ksmd CPU 3.9 vs 4.0 us per page,
>   unchanged within ~5%.

Sorry, I'm not fully convinced by this approach. The performance numbers
indeed show improvements with trylock, but I'm not sure they translate
into real user benefit. Users typically care about how many pages KSM
actually merges and how much memory is saved, not just how fast ksmd scans.

> 
> Assisted-by: Zcode:GLM-5.3
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
> ---
>  mm/ksm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 49d48d1e0998..3cfb09a926ff 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -820,7 +820,14 @@ static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
>  	struct folio_walk fw;
>  	struct folio *folio;
>  
> -	mmap_read_lock(mm);
> +	/*
> +	 * We trylock because we don't want ksmd to wait for an mm that is
> +	 * busy changing its memory layout: we prefer to skip this page and
> +	 * let the next full scan retry it, like the folio trylock in
> +	 * try_to_merge_one_page().
> +	 */
> +	if (!mmap_read_trylock(mm))
> +		return NULL;
>  	vma = find_mergeable_vma(mm, addr);
>  	if (!vma)
>  		goto out;
> -- 
> 2.43.0
Sorry, NACK

Also, this change feels a bit too blunt to me. In scenarios with even mild
contention (far less than the heavy churn in your test), ksmd could end up repeatedly
failing to acquire the mmap lock and thus fail to merge any pages for a long time.
That could hurt KSM's effectiveness for ordinary workloads, not just the contended ones.

Besides, there are lots of mmap_read_lock in one page's searcing and merging of ksmd, such
as try_to_merge_with_zero_page, try_to_merge_with_ksm_page and so on...

I'd prefer a less aggressive solution that avoids stalling ksmd without starving page
merging entirely. Maybe considering it together with smart scan? Need to see other
suggestions from other maintainers like David.

Thanks,
Xu Xin

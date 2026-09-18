Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE212DB794
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701194; cv=pass; b=UKMVvAYtwck1K/AytGB8mmKmLqTLEgcY5MvXj8erClKtLhLYRtOnVHjt9pJBkhWv5t8OJ5VvEwpGVfCSCZDskxzH2t/bSYwDhGse09oafXUm1vxxTdvl/04p1CwhhXCjlO/K9MijETo+WvOa+6ljpzDD05HVn8tWIWH2O+SN3zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701194; c=relaxed/simple;
	bh=BCHEbV2evoT33asdVOA0k+dXakILyXkOzDDcm6Xacpk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NObJzq5Dbh7A7532EbmdHtX/aZbHorYz0t9173uyii/tSTfhRw/wqUQ1NBf/EE+POrwOhXkAsHoxh65oXl2pUgg//NJuXH8rOltYAGVRuZvk7slBBMCON66lHPffXCqZckkOH9Y8cwgVeF+GE664kOw2y4N7/ozOw6BFKOnTe2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FG/hgrZ9; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FG/hgrZ9"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7b325so1557011cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789701188; cv=none;
        d=google.com; s=arc-20260327;
        b=a3csphowf4oXs0yPV70p82tlAeojQKn3qinaddtDjZrYOOSvR0HOsR7DxBTKu6QPO5
         hKuchJcZprS+LAy0F7vaJVt/1FDUppr34GXzjwqC1aPVy2qWntnG3Fd5M/s0InMlVjJK
         hFXGxUA8uDeH9zLOD704xsYa1CGdJjM8E5hpsjEJpCXlsfa3RMkkIREDfFxplc/oTJoj
         /GVcQrKo9SIEneW50EqcuwsuW7I9YBTJyUuk64XsZf3EqkvUZLRHHECUGgZgPwxwVbNh
         Zw1x3y79ppcf/m1jbgkzg8i9KgxKUYn6PxupchLNlgrBJka59ft3dg5kGNbj7QvsAPXM
         xOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HnKgH12rIQjJaBvAg5EGDVVRZjrGbFrjvdaF1m1X+pw=;
        fh=V/bZyM2i4a6/6ybsMyGI+9aaAKm76cqUrpTAnAcfilc=;
        b=NipJOJ8EDbbl+dL3bF6deVejz5FpsDvmOo6srCMOxV3oxTLXxqKsG/Nv4hNvyTAhXz
         ja3P5vJw2yTtY0XSgoonvY8XU1ZaQks4+ivNuNCBiwtE1b1s3amDBK4wh2QnI8NNSRWV
         weiMOAjRynvSSBDB8PmQvhdxGLWsGQvI4IW4RbDraM0V0pCc7VcIm4Dktl2yfnIH5vKn
         0iTIHlc9kECb/kPI5AKYpepM2WCDo0A+R105aAIbU1ajcq4Uqsr88cPANngEujG5pbKC
         QgpgS53Bx+kOoy+M+1A5M7YD8wWzA3dFXsWbiQdfW18TyG9kj9YnulhHhX6n6elowmvw
         Cojg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789701188; x=1790305988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnKgH12rIQjJaBvAg5EGDVVRZjrGbFrjvdaF1m1X+pw=;
        b=FG/hgrZ9/vnqLyD7zLpY4yeIdphof+slONsWraVGl6UDCHa384lZScgY2NCER90G33
         K1Imm+PSkEPouy9qjKhHIfny0Sl8iv385h4nlG9Y/pup47cj+c+Oyxj65ivMkCWySc80
         3cRPU6p0s0sh0k3eSN44mjagcwLRrFp5rmMzdrXBUh+jCkOTws0KBgUM6LvKq38ldKAL
         c87NXrj+fKYa2VrkSOThTb35CK50mXXGmcC/EQAyy7jUKY9tcdkBlBrJoyi0G/AiP7kW
         5AwFmNdxJhyDXPo0oUkfGURPD4Y26q+bK/YvEPnorA7dluhvSW1Bz90ayL+m8A4ZrGdc
         TMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701188; x=1790305988;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnKgH12rIQjJaBvAg5EGDVVRZjrGbFrjvdaF1m1X+pw=;
        b=LWzLsl7IH3HxS5eFFSa7x1ootn8qVdwOTEwXvidQqOS0ed5ZtgbFZUeBgNEWMkDKVZ
         miVzr/japrjwx//KN8MqjDkbYcd410+7v8buaf/5crnSRTd3idbCa+vSiNkfRrvM9cdy
         cI1xRQMLex0rQaEynz17/1P8rSPT+eASRerVk3PngyDP3V2NEOQ8Q00+JUozojXQEsjc
         +oDilvZCkhYxlJlmdgNxqbzW9/+IpIVN8zjMo/71+/dg9kRV9PYfdAsFDx7HwVeg4Jjf
         nnO+znhI8+PzHiKKMisBe7s3ZjGizx4drW5gs/pi8NFTbW+6ZkyrImwNdNFlL5JszVwU
         VP4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzF8TLzE4DKbPKY6F3PNrzyvZq3bbV74dEFG9/zhu+TZk1M9tUyXiRK8SteCzNrgBcQeqRtVRgLdTNZE6M=@vger.kernel.org
X-Gm-Message-State: AFuF++k05RXwM9a+sw7szQR5qw5kw6aAHfegIpq3dirzgc/gVcKFjL0U
	87OrkurgMGeqESMV0qK/WfhUENRXvaInt7AtcoXq7t9Ve0aVJ6o5yBOLP8oWtp1oWN7ZPfyo+Wq
	HxS4RB6OghjqcBfQ7Kc6cEhRLy0YjQNSBHzH9LMYI
X-Gm-Gg: AYBFou3GXVht3H0rHuad4GYSFHguFNo4p3kiB2/FOTIe+XojvhcHufcflv288YH45la
	icGmR89EFUAcKiYCvjzk+QRkK+espRCYsZlrX4TWUQovyImRHFqK4JPLDyVXDZGrKo6AL5IwptV
	y2dNBj8ANxmceT956CJ4Ljo4pibU8s4bs6RpbbZpOder2QG2UKlYqG0KI4My1HqnMgozqkByd7U
	ry2WPD89f6hmLFiLStDJG7jZ9PEaa0iv372cSxqUwOlAjXpD3w6znJsmehaLmQ6Smn4dhlu8YOq
	x/X3DmJr6CSSF3CnBED0pclSGTfX16PZaMiVMkMuRf8jWcsqoxXPiDU9FwGESFNffdd3s9BsBzo
	4cj2dOrBUew==
X-Received: by 2002:a05:622a:2615:b0:531:17a1:7576 with SMTP id
 d75a77b69052e-5329e4a3d42mr19288491cf.52.1789701187201; Thu, 17 Sep 2026
 20:13:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 20:13:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 20:13:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260916-hugetlb-subpool-always-track-used-v3-4-38aae9b5ccdd@google.com>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com>
 <20260916-hugetlb-subpool-always-track-used-v3-4-38aae9b5ccdd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 20:13:06 -0700
X-Gm-Features: AcwNN1UxtUl99q4k3Xb2wmimX9em7-sbEcOm7MskCUYsrn1OIK-ISFMFvyN52wA
Message-ID: <CAEvNRgFgCdWBrMLZ7wxAgVwyQhrfHj_0UY4++zS4n30psgkGxQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mm: hugetlb: Avoid re-allocating global
 reservations on region add failure
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, Naoya Horiguchi <nao.horiguchi@gmail.com>, fvdl@google.com, 
	jthoughton@google.com, rientjes@google.com, vannapurve@google.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Ackerley Tng <ackerleytng@google.com>
>
> When reserving huge pages for a shared mapping, reservations are first
> requested from the subpool, and any remainder is accounted in global
> reservations. When adding the file region entries fails later in the
> process, the reservation attempt must be rolled back.
>
> Previously, this error path explicitly dropped the global reservations
> that were just acquired before jumping to the cleanup label. The cleanup
> label then returned the pages to the subpool. If concurrent activity in
> the subpool allowed the subpool to absorb more reservations upon return
> than it supplied initially, the cleanup label calculated a positive
> difference and attempted to allocate new global reservations from scratch.
>
> This premature release was completely unnecessary because all requested
> pages were already backed globally: partly by the mount guarantee and
> partly by the global reservations just acquired. Prematurely dissolving
> those reservations forced the cleanup path to attempt fresh buddy
> allocations that could fail under memory pressure.
>
> Instead, track the number of global reservations actually accounted so
> far. In the cleanup label, subtract the already-accounted amount from the
> difference between requested and returned reservations. This ensures
> that when global reservations were already acquired, the adjustment is
> purely non-positive, dropping excess reservations without ever attempting
> fresh allocations.
>

If there are no other issues, Andrew could you please add this for me?

Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")

> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Cc: stable@vger.kernel.org
> ---
>  mm/hugetlb.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6589b188cf657..ee1ba9ded0ec7 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6678,6 +6678,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	struct hugepage_subpool *spool = subpool_inode(inode);
>  	struct resv_map *resv_map;
>  	struct hugetlb_cgroup *h_cg = NULL;
> +	long gbl_resv_accounted = 0;
>  	long regions_needed = 0;
>  	long gbl_resv_get;
>  	long gbl_resv_put;
> @@ -6768,6 +6769,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	err = hugetlb_acct_memory(h, gbl_resv_get);
>  	if (err < 0)
>  		goto out_put_pages;
> +	gbl_resv_accounted = gbl_resv_get;
>
>  	/*
>  	 * Account for the reservations made. Shared mappings record regions
> @@ -6784,7 +6786,6 @@ long hugetlb_reserve_pages(struct inode *inode,
>  		add = region_add(resv_map, from, to, regions_needed, h, h_cg);
>
>  		if (unlikely(add < 0)) {
> -			hugetlb_acct_memory(h, -gbl_resv_get);
>  			err = add;
>  			goto out_put_pages;
>  		} else if (unlikely(chg > add)) {
> @@ -6826,9 +6827,10 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	 * There may be a difference between the number of
>  	 * reservations to consume and the number to restore now if
>  	 * there are multiple threads interacting with the subpool -
> -	 * restore the difference.
> +	 * restore the difference, taking into account any global
> +	 * reservations already acquired.
>  	 */
> -	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
> +	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put - gbl_resv_accounted);
>

Sashiko:

This is a pre-existing issue, but does this error path ignore the return
value of a potentially positive allocation request?

If hugepage_subpool_get_pages() returns gbl_resv_get > 0, and the initial
hugetlb_acct_memory(h, gbl_resv_get) fails with -ENOMEM, the code jumps
to out_put_pages where gbl_resv_accounted remains 0.

When hugepage_subpool_put_pages(spool, chg) is called just before this
block, concurrent thread activity freeing subpool pages could replenish
rsv_hpages to meet min_hpages, returning gbl_resv_put < gbl_resv_get.

Then hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put - 0) is called
with a positive delta, attempting a fresh global allocation. If this
allocation fails with -ENOMEM, the return value is ignored.

Could this permanently over-credit the subpool's rsv_hpages with global
reservations that were never actually acquired, bypassing the global
pool check later and causing resv_huge_pages to underflow? Unprivileged
userspace repeatedly mmap-ing and unmapping hugetlb regions under memory
pressure might trigger this.

Ackerley:

Summary here is that if hugetlb_acct_memory() fails, since the return
value is ignored, there could be unfixed global issues.

Sashiko also pointed this same thing out on patch 2 and 3.

This is a common pattern on cleanup paths, where the return value is
ignored.

I think the fix here would be as described in [1], to flip the
reservation tracking to track an available page count directly, but
that's for another patch series :)

[1] https://lore.kernel.org/all/CAEvNRgGN0HSJ2iLSDD2haSKOxifa-uhkO9Hwossh0+Q_d9fzOw@mail.gmail.com/

>  out_uncharge_cgroup:
>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
>
> --
> 2.55.0.1082.g2b9226bbc0-goog

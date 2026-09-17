Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12643F4BC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673211; cv=none; b=eKfxOuwXjeRo5pZ0pWwUU5FyI8zgpxSCaVwpvhr8F4mUzS9F/DB5TKrm40zuc8LhTafQDASy/Gnm+rSaDh/FsAgRJuCVzuEa8enIWbsKhkpYKZsVQWMGmT0D9TCOLd+ftM43b/6GVmwXc2KcaOFbkFtdQux2GS6ISkM7vquXatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673211; c=relaxed/simple;
	bh=yNZjRUW+ehnB6kYW1BDeCn8vZ1K549OOsZwMzAzKLXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ah2iFz9CACQQB54G73L+f6KkyACNY83kgaE9wnl2y3nbppgjuQLAsEATxAMwpMK1cFSNxymNU8oMWDjuofhQH0X/twKQJF4su/CzBpvf1o71Zj/ffb7pYy0DA99urPyj7wYGv4N/bWMEVhBHElxdORgEC04IigS8PHVAndzutVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSZ2567A; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSZ2567A"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2ad9so35582fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789673208; x=1790278008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=se2Vsxe0TSsDe42Voe/AhBhDb+5OgYc7j9RLVDJ97eE=;
        b=hSZ2567AlgtlpEKe+Hgozv0dXX/fZjp3sZLSZQ4e2jD2sHq/bb8O8eoxJOY6aYVQcS
         kBtl6H5yOCPRNyEPvlWYEdSLA6L7LsepJPkeWr2UvLh4DooXl0QdtyZlcnc8T3TeRzlu
         w9TEi6DKvoAvwsZnKY0/dh6jldZM+T35mf8zcsHiw94iXDgDPejyMUUU40eL0BKtl6o/
         PRpPeWeYOenCNPFtJ7To+FstkALrtOjhfZ42LhE2BUEVoDcjx/Bzq1vbHGdHA9fla2Ug
         IjHlhcEXh7CShmkztE/Rk0I/V2J0TV1t4fkl7/vycvvtZty+u+FB+V575v6oT65xRNEn
         94uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673208; x=1790278008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=se2Vsxe0TSsDe42Voe/AhBhDb+5OgYc7j9RLVDJ97eE=;
        b=ZQeT2olBiFbn50lWpYRcoRSPuGIAH6xua54p4F96yuo/CENxgLa5A9IH8u6anne7bc
         WnM9v/Oecsk7xpi52IiWxjuOI7YLzW5ciur03JIuTdm/INdhVoo8te2sRXjpJKlEZU9M
         eqcIj97uXWHCzGkW12rJvpsEmODw1eSn0SFmSLpcP0TzPggYgLxQ8o+eEjpaWUkr/6PP
         gYl8HYFAum9OL9KRfPaWhAGc+XqfLicZNgOY3sKRgScupt50aQ7ThbtZxYS4gaOoLHEY
         A/YhSBUuWdaAWOX5+N1/vzxXGasvrsZvzVOhGYLUHUC9Cguwk7mRRSDWgVTgS9S/hjCe
         ux6g==
X-Forwarded-Encrypted: i=1; AKwUvBwWVkCvekwCUCWoWeyh8uWKv3uxYnO6RaHSpdEC9AXgMTK4lj/VxC+O2ZbXUqNj6DtoUapKaCvpRnIjpBI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/frFR8GWInGOLOKp3kdt3Egsk2aBIhvhD/ToYzKvjF0JqpNY9
	RkEkS1/XDuXAOTN2As7zLGs3zw5/ISyKbn+3/l0YBMXGyh2dWuxww7x2
X-Gm-Gg: AYBFou1zPv3O8Va8C5w2apHchgTlGifp9iPFZ36hnxJSP1cvkK0q8mc3YNijbMlmXtU
	02Nalon6BhR0cJ+w+8OST9kgD5VivLypJjDuv7xeKr8m3NzDKCKV3KdqOHaUFJB5MPvr7A8VXmF
	3j2Ymcqw1ajP945gme+U0345e2+PhzOxU7qz8IRxDcPWGnKBGwccR7pu6+WKle6oE2b27z4CseH
	6sUUov6no6JV6ofeV59YtweEluieHZWyPnchJ6eOD1gO3QIyVRnSAjm1NlY9gtVEXFLSmA4sbZv
	KO7CDCavmHfp15B1jeMOYosRrJwaXn1ppH7t3pkIaHCBMQAFGi9MjH6A3E1dIOanxpG8sR8l6hW
	Cpre4XQmQRY0dbPdX0f3YhQeouK4f3R7eFPcl616jecped2repN2hOJ3aXUt5lFwt8rpYCL6M3M
	V0hJLzWRpqjOULgF+T9DNMjI2o1YHXa6zOrXA52RD5w3ut0htR4+nTx3JJyoTnN83avzGLNOsF6
	4IzFOC5s/DNrcvgMQmCrr3VQhfgaQ==
X-Received: by 2002:a05:6820:7091:20b0:6c9:80d9:5f6 with SMTP id 006d021491bc7-6c980d909bcmr2173414eaf.55.1789673207394;
        Thu, 17 Sep 2026 12:26:47 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:42::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c8f727fe99sm3306425eaf.12.2026.09.17.12.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:26:46 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hongxiang Lou <louhongxiang@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Wupeng Ma <mawupeng1@huawei.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	fvdl@google.com,
	jthoughton@google.com,
	rientjes@google.com,
	vannapurve@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ackerley Tng <ackerleytng@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 4/4] mm: hugetlb: Avoid re-allocating global reservations on region add failure
Date: Thu, 17 Sep 2026 12:26:44 -0700
Message-ID: <20260917192645.3436692-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916-hugetlb-subpool-always-track-used-v3-4-38aae9b5ccdd@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 16:39:04 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:

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

LGTM, thanks for this Ackerley!
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

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
>  out_uncharge_cgroup:
>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
> 
> -- 
> 2.55.0.1082.g2b9226bbc0-goog

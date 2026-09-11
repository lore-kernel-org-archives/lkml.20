Received: from mail-oo2-f29.google.com (mail-oo2-f29.google.com [74.125.231.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37BD352003
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137913; cv=none; b=HRyeg8TTRfZ+/OzHOesnsrcc39vwwEIy+wfI47cXbm/4xcUntau720DlTQ8O4xpm26EHhDml5XffbAliQypWXk8p07Zvqph15kmSvbBCuIJNpd1QNP5pAhrVYcuB71BuwBKItu8hnyNApdK0SF/F3DmpX9K4dcpXI4xccjqK4/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137913; c=relaxed/simple;
	bh=W20x7rVTdBJtL+P5aYShncumThcpv9eugB/ou+B1ipQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY3D54f3IVpF9xlyAc1nvEF7RQUVGFRKbu4FrEdew+UQs7AqSETt5ocbJA/DB9ZhIxm6Mvw7KIuCNZQO0dzbA8Ad2vrxXBMmH741xOirs7KKTXn+h+e2aDlDrHNjS03V5vVf+dG/OQYsWPO8l4f1MOv2IOmJgrRLxcSLobqQmHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDDJAxlO; arc=none smtp.client-ip=74.125.231.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDDJAxlO"
Received: by mail-oo2-f29.google.com with SMTP id 46e09a7af769-7fcc35eeb48so666632a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137911; x=1789742711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHTYcbYj4j1qZKzZt30zdIUqIM0GkVQjFda8W78rUTs=;
        b=EDDJAxlO7Co5wek+UHN0iVqznHqZpw22C9Ofbhwm215XgyQh55Pze/fqUvyKhUPq0O
         ylZNGrfdHifZdarYn3daH8Y9vCGgEDYAD7PAwhIVPtM5qXYF6pzF6kZRqJD6/Q1P6zsU
         nJLRAQjPUD5w7olkudzW20RHjv3so5mCLzg1ZrfRO69YTLUxD/Aauc05ZOy1UN2KobwP
         3/bFFAtG9Zx4HDf+wlNPIxjrvb6+dbIUBQEanudrILZKYVMpoFwPIiX/a1DzeF41FdWZ
         FDz+1lubMgIOQSGILpqBQ3aMKdG4Cn/Rh0Egou4l7qjBcmXzRGjDVGbNUOu3FGPiriu9
         l8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137911; x=1789742711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHTYcbYj4j1qZKzZt30zdIUqIM0GkVQjFda8W78rUTs=;
        b=O2mxGdeH+A6Bz1ts1gwRMn7yJ4sFVWdQl2LqCCfzfp5KTXVzEqpZZZ+M0p6W8ZICXz
         wvL1czrN65u5N+XqwkcNoJq0UJHhIUf5ZYuoSD3GHtyYM8ihRFbRBp5qocDesDZO4Kr2
         DUs20VbhbFk8kSx/p0RAszJFKYnwO+4+hAoYBnR7da2vgLELEFdiOI1sYsa/d03GzDFF
         AkC2lSagWEwdyCORgJTdoWFkWujFK3tkzCbDNKG6hxuc3Mnr3c7kJdonl6gFcSADS8Gl
         GXYt+2XNxtGa5EzT5z+2DI51nHx7PtNi6tuIcqvZYEr4FIL+KSBS18Dez7knUBJhzVaV
         O7LQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbdsBkPGOoN22ECzlllpePJ3g3KeW0DJLyyPVHxUSzNrAp5TdJMO5qDE2dd2PEi91SbQimqasdC6GAeBI=@vger.kernel.org
X-Gm-Message-State: AFuF++lFgnPIJrNt5KiGwMzitVoVvgU/AOy6lJjhOPvKasHxUNMSX2Ol
	UnedszpAGf1LdRU+FvPn41F/k88N4qb1Dc7vErzQ5NRwHYt/YLxjAvKr
X-Gm-Gg: AYBFou0zyveuS0AQZRZAfwYp0pMQR7q43kqDOXvnNX93lZuezaCMmD5h/s/aOd1so6X
	KHU7YGLovOrxzMIzYvMsRlkDwedKqoNXdpz6NFP3GPqA6u46D9exRLNCUSZKv2sp2hhW6FppyOa
	VG+lFvPggfpoYTOpyv2mtwirH4ruvwOgiH5y9FZ46GSXCLEzV20S8OVYo59y0rulpf6Lo1+xio4
	PpjC+psusuzjMsJ9t+blUPQK70J7KvRH/ReENjRAGhnLbxRPD+7UtfjOgIJp30RIOqqWN4pTu22
	WRoT47cVw2Lh9H9rRZHmdZ0kYGKoE/orDRORDZPMB3RUEm/TddWkVV3UcQlYkZIZ8YUCvdLOkzx
	CZnExj+FdS4rV7FF8EEGu3lTJyuII+YxFa84zwgeqkKFz0hfd5e6LJVb2XyVGGtcFZ9OoQm6Kl8
	cAdnyusvosgdJXqem2DPzl2y00l8WCwp1fQSx3Zl5fbpLW7vUPAS1dNK+18H0KmVhaDehDoUlnQ
	pLnqDAXLRVC2Rhz/hQADOZcAsWD
X-Received: by 2002:a05:6830:448e:b0:802:faf1:3919 with SMTP id 46e09a7af769-803fc316ec8mr7479732a34.3.1789137910671;
        Fri, 11 Sep 2026 07:45:10 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:6::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm2969111a34.15.2026.09.11.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:45:10 -0700 (PDT)
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
	fvdl@google.com,
	jthoughton@google.com,
	rientjes@google.com,
	vannapurve@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ackerley Tng <ackerleytng@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mm: hugetlb: Fix subpool usage leak on allocation failure
Date: Fri, 11 Sep 2026 07:45:08 -0700
Message-ID: <20260911144509.3792211-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909-hugetlb-subpool-always-track-used-v2-3-30c5d83b572a@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 09 Sep 2026 14:49:28 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:

> From: Ackerley Tng <ackerleytng@google.com>
> 
> When folio allocation fails early (e.g. buddy allocation failure or
> cgroup charging failure) and a reservation was not used (meaning an
> unreserved global page was needed), the subpool page acquired during the
> allocation attempt must still be returned.
> 
> Currently, the subpool cleanup error path only returns the page to the
> subpool if a reservation was used. If no reservation was used, it skips
> releasing the page back to the subpool, permanently leaking the subpool's
> used pages counter.
> 
> With subpools now always tracking used pages, always release the page
> back to the subpool whenever a subpool page was acquired.
> 
> Opportunistically rename the local variables tracking global reservations
> needed and global reservations returned. This clarifies the accounting:
> a value of zero for needed global reservations indicates an existing
> reservation satisfies the allocation, while a non-zero value indicates
> new global pages are required.
> 
> Adjust global reservations using the difference between reservations
> needed and reservations returned to properly handle races where concurrent
> threads interact with the same subpool.
> 
> Fixes: a833a693a490 ("mm: hugetlb: fix incorrect fallback for subpool")
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Cc: stable@vger.kernel.org

LGTM,
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

I think that we get parity in the accounting logic between
alloc_hugetlb_folio and hugetlb_reserve_pages is a nice plus as a result
of these two fixes.

> ---
>  mm/hugetlb.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 9eb9f3442574c..652cfb55c6e6e 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2957,7 +2957,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  	struct hugepage_subpool *spool = subpool_vma(vma);
>  	struct hstate *h = hstate_vma(vma);
>  	struct folio *folio;
> -	long retval, gbl_chg, gbl_reserve;
> +	long retval, gbl_resv_get;
>  	map_chg_state map_chg;
>  	struct mempolicy_interpreted mpoli;
>  	gfp_t gfp = htlb_alloc_mask(h);
> @@ -2996,8 +2996,8 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  	 * Or if it can get one from the pool reservation directly.
>  	 */
>  	if (map_chg) {
> -		gbl_chg = hugepage_subpool_get_pages(spool, 1);
> -		if (gbl_chg < 0) {
> +		gbl_resv_get = hugepage_subpool_get_pages(spool, 1);
> +		if (gbl_resv_get < 0) {
>  			ret = -ENOSPC;
>  			goto out_end_reservation;
>  		}
> @@ -3006,7 +3006,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  		 * If we have the vma reservation ready, no need for extra
>  		 * global reservation.
>  		 */
> -		gbl_chg = 0;
> +		gbl_resv_get = 0;
>  	}
>  
>  	/*
> @@ -3017,10 +3017,10 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  		alloc_flags |= HUGETLB_ALLOC_CHARG_CGROUP_RSVD;
>  
>  	/*
> -	 * gbl_chg == 0 indicates a reservation exists for this
> +	 * gbl_resv_get == 0 indicates a reservation exists for this
>  	 * allocation, so try to use it.
>  	 */
> -	if (gbl_chg == 0)
> +	if (gbl_resv_get == 0)
>  		alloc_flags |= HUGETLB_ALLOC_USE_GLOBAL_RESERVATIONS;
>  
>  	/* Takes reference on mpol. */
> @@ -3074,13 +3074,10 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>  	return folio;
>  
>  out_subpool_put:
> -	/*
> -	 * put page to subpool iff the quota of subpool's rsv_hpages is used
> -	 * during hugepage_subpool_get_pages.
> -	 */
> -	if (map_chg && !gbl_chg) {
> -		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
> -		hugetlb_acct_memory(h, -gbl_reserve);
> +	if (map_chg) {
> +		long gbl_resv_put = hugepage_subpool_put_pages(spool, 1);
> +
> +		hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
>  	}
>  
>  out_end_reservation:
> 
> -- 
> 2.55.0.1007.g17ff1f9808-goog

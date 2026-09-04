Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1940BCB2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542623; cv=none; b=paW2g7+7IRNP8VwR7rbENCrOJpMwYHdd/a58lyfWG85XE/Sgvgd+zhpFWF5sF3/QkgGFL0ALu+ZPfbDuyQybUedoqk3C/KzFg4u0LfE7qxFBeiszb9nYl46IwNvkt98dHomMD3L4K/9kNmShU7nLB/7u5TMMd7cMb92ouJFHKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542623; c=relaxed/simple;
	bh=sBU/dq8j6OpZIbc8vJehTBctYKrSKBiXMQ4wHeWZqkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FcQi+fpwV7dzy9cusTw/ZYgAvBXSnru3Gk0juhYhSkacskLk7SxeDKb3kFaTDbBs1Tl+5mXRL0Ym1oBQgEPFhr7pkQWn23lqOZVHrzWxuSsJNkEEHZ+icmuDrfpmhvKADL3oUBssG7Z8ZhontQpISGdtrA5TBYigzDC7ejCEdMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7nKs1ch; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7nKs1ch"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4ea388ba6so1351291a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788542617; x=1789147417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCVI76HnM719qm2pNvwAM4j/ewQptWjm8pfKFuUJMF4=;
        b=r7nKs1chDzKWfnW3116XbNsCLzaP1g1i8WljDTgdttVlV5jc2RCbmDR1gD3BWvVQiF
         q5KnzSiBh+B35qbdNdbFDoMyHYpILhb4uImdtrbFBXwxyCrWmunjkqcnNFiaNgrbbnKl
         PvTTuHaxpx2mXBff67cE65gLdfUXsPcaqHu2oOtzvN0PddRbwKvsnDAVeHYrVgTCbVha
         0kUZb4EHbkkZcPaJp2zcD9PVE34yQBPMsiNdg5Snw5QDdTrcSfvaujcNXthMxuL+Wvrd
         bWHRr9gKQpARvOBqgpSBqG2uiJsjCBuNkO37OVSCp4I937sBwC92RIy7c1U4xPymgH8Q
         CAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542617; x=1789147417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCVI76HnM719qm2pNvwAM4j/ewQptWjm8pfKFuUJMF4=;
        b=ImmU7ZqjjJJedauRZKurzMq8BixfKeQb7arA0uGABP8r7/rR61C5A53eXvDTAioiEk
         poKmBlrYSXP77OJVNUCLkc9KpDas0sFje80TtYMNriQHK++83geUs4CSkUXztlECtsjJ
         PaYDEpAuyTDDEW+dyTvdjd85y3ysMl09DqjHzxbS5l5Fmn6xXP5t8f9J3VJrznyTU4GX
         RHw6R0wnoK3NKSHmDyVYPnIwGio8oEbcd8OAS/v2Picbi+elc6IG0mzTSdu+86NYWqJX
         lqcoeAmRzZjo6Fd6hkBlRilKQeyT8NnpBAzgj8RQi7aQI8pWjeeOeIRld2gsVq1h8CI8
         nbgw==
X-Forwarded-Encrypted: i=1; AKwUvBw+1z5jTIWDXdTvPko30imDAqW3vYsImp7oKtfOJO1QuS+wddHteNkAUtz6bskVEF5wpPEhg/wNC9ARu0o=@vger.kernel.org
X-Gm-Message-State: AFuF++nlbM0C3FHbYyn+0HlLBrjh9IcV5aLXhWtlWNXCPXLeAl25Gc73
	9aq4XVhhJsYUxaMpmSx6QtVoikMElcIweftfFjaMUmPpfwaVAaEuAo8L
X-Gm-Gg: AYBFou1R7Cb8MFOuqtGQoVh+OK4pj0bLmWiG4BWL8DH7Qcq+65Q9pQ12CBK9nvByErK
	zYb4t1hXZG+WlDJUT5J1tV29gar6pHNORH6mTbBxxNWAPvaNTKO3PNweale5WJ3xN1pTKV1V9DB
	FKT7gn/IUULw+C4q9BuR2f6Eicgnh2YmY6ywhXPIHqiSYhP3Sb6BiiD2xIHP5KvmtRL9xPLipfR
	UWGaYrcSaLh7hm8pz5yHoz2ROL1KBQTMvAJIfTE595b3EU2z6CjcQtq2UfC9ohG8PXzgSKm4Axp
	VpGE+O7SyrHxzTH2fbTxNroV8L+e0fQKnaQ4KOk6rVcigvShcs5skBHbnnBIKFy4d2hquDDdzjf
	IV60G/1CZuVnPV3t+VRj8x73TQygPmmLxUDIzm2zTujZOutuX/jw917ly30GAywaq0Ti30iLON4
	dUoqNhxgflAuj2G2O7yG5GjggK/vGS/77icg2B6AOFuPYNiaU7AqEnwmf1lkhKBis01cnwA3+s9
	72KPxNTCwMbnKzm3S4=
X-Received: by 2002:a05:6820:1c87:b0:6b6:d4c1:be22 with SMTP id 006d021491bc7-6b6fb0ddb89mr5397329eaf.13.1788542616324;
        Fri, 04 Sep 2026 10:23:36 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:24::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dc6aca49sm3331420eaf.6.2026.09.04.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:23:36 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Alex Shi <alexs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	jthoughton@google.com,
	fvdl@google.com,
	rientjes@google.com,
	vannapurve@google.com,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Wupeng Ma <mawupeng1@huawei.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Ackerley Tng <ackerleytng@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: hugetlb: Drop refcount before freeing on memcg charge failure
Date: Fri,  4 Sep 2026 10:23:33 -0700
Message-ID: <20260904172334.322019-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902-hugetlb-alloc-folio-memcg-charge-error-handling-v1-2-e3e8942c141b@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 01:22:57 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:

> From: Ackerley Tng <ackerleytng@google.com>
> 
> When mem_cgroup_charge_hugetlb(folio, gfp) returns -ENOMEM, the folio has
> its refcount set to 1 via folio_ref_unfreeze(folio, 1).
> 
> The error path calls free_huge_folio(folio) directly, which expects a
> refcount of 0. Hence, VM_BUG_ON_FOLIO(folio_ref_count(folio), folio) is
> triggered.
> 
> Even with CONFIG_DEBUG_VM disabled, returning a folio with refcount 1 to
> the freelist can corrupt allocator state later.
> 
> Use folio_put(folio) instead of free_huge_folio(folio) to properly drop the
> reference before freeing it.

LGTM, thank you Ackerley!

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Fixes: 991135774c0e0 ("memcg/hugetlb: introduce mem_cgroup_charge_hugetlb")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> ---
>  mm/hugetlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 01b57f6d3b804..97c06f227ef8a 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2889,7 +2889,7 @@ struct folio *hugetlb_alloc_folio(struct hstate *h,
>  	lruvec_stat_mod_folio(folio, NR_HUGETLB, nr_pages);
>  
>  	if (ret == -ENOMEM) {
> -		free_huge_folio(folio);
> +		folio_put(folio);
>  		/*
>  		 * Skip uncharging hugetlb_cgroup since the charges
>  		 * were committed to the folio and freeing the folio
> 
> -- 
> 2.55.0.970.g62bdec98f9-goog

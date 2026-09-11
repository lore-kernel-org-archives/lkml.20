Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43FB3644BE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138206; cv=none; b=A40Nf1BV3vzH7SDyXZ4mno0sfjCNt6nzdvHC5sGU+2ZLnLjq7igAUGb7ekieaWRQf79Mydd7iQC8Crs86R9n92xhbO5gyLceWfv0WiGkiP8wp4USK90x+HdkLRSgfAjzIduDiIJkuFbZZbDyU1M4NT6Bf+JyJ0V4rmqA9LnwUag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138206; c=relaxed/simple;
	bh=bNVJD7d28jya6AMdpAda+RuFvf6rKJ/ChBE8yN2gLOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbdRb/6tFXC9B/HEx0geAfm7c4lu4/LL48T2jUxQsQfGKk43IGUOH4ODBVoiEg7q4PhcqBBWntDA+OH5LvjeygKJ9+7EaA118f1UCfnGNxVuzzF+72Bk0CI3QjmYBanT5o+3JTLvaeV6mcaV43iMCxwumi4ud8ojrhOO5Iue8ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OX4OlK44; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OX4OlK44"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7eb61bbeb25so1212273a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789138202; x=1789743002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMudlUwrJYcDNoa2hJH18RbyAg0bqvV48oum1eI5mvg=;
        b=OX4OlK44JdRe8pyG+m1Y9z2Gof7Vxm/yhz1v0ywVcgkyBIWEuARj9cT6AGspB5sr3G
         1aX7u9x1zbXb/m/NpKT/pPa4Bj/Rt/KfQ2Q9wUvuLE6SXfNMkgq+ks0fybOx9S3Swgy2
         FL8AMa4kiuGrs4uXB7p3be44RjHJ/y3iDZiXmM9CYwvBpLvG2/V6c2G1LOh5pnom71A5
         fe+RZeuiyvawrMq2s+XbH8XDCJ1IjLMhcuXSe+COfdJil8pOezQ0BRm17AeklOfdoH6q
         G53jN4OYbkBktGgh/+0m29xIaaNYX0lnR9g3N+rGhKh1GncTtnx66pFWMZ4EXSqPmXWu
         hE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138202; x=1789743002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMudlUwrJYcDNoa2hJH18RbyAg0bqvV48oum1eI5mvg=;
        b=lsSqmHy+/soD12184aDAv9Qjd7ms+8IAxhetHNLWd39gkPkK3GUys6scRf4mKZZ0K+
         I2mNn0A4FFdA4fcKToV/mGcjUmN0i2TaUlDIHzqisz1XKBYv16sICmxuFIHIxPkgaVkT
         tYzWK9LpJKMMHl2rfoL5opPrTMwrI7fKm6G4H6yHX6baHx2HpMddU86MmbncQ9W/SG1J
         oB5glX5CO+hfgarhBebRKVSadEWYnMhw8KDYEHcPFdVvQV3RwNG+qQ6K1pwH0Wg2Rjmx
         oAJaOhZbX5MMsjD6z8kpy9zjIBnVX/XzxOdB8V6B3SaHWrvf+uXu76ZPKhaWiJFM1Tr6
         JiZw==
X-Forwarded-Encrypted: i=1; AKwUvBxItH8nQDdsncvbPsuHytrW4ogRpu0WtP+qpcCgs9MnICfE7iQB4ZRbt98+PrIcNkUVnxonhM3U0mAczMI=@vger.kernel.org
X-Gm-Message-State: AFuF++meY837VcxW0ISFY2UTg421ifBiJltNaFXksFGYP/WYjpPRwtYn
	uwSr9jzlfTEiph9Km2bRxBZLg7BuwYMTpvy4SLNT+x/cRkAsGiaJ2Wzr
X-Gm-Gg: AYBFou0efVPLuERdXaFs2ItdJ0xNcpUjoVSo9iscs/dMGz8B8Gb8NFUH72BGGrJEjRJ
	lzK/cKkaA2Cyvok3eMoSzU8O8hFxuGS/K1ZyP8sWww9VueFWcDIsPsvbiZ6fcrYOVQKvrzbzP08
	IZzWVtaGXE1BpWlQCy/A3B4fZxpOYzjDmRMrEAsN5q2KYcH9rEZWZE6G0swSwkxXJgMoNHhzFw2
	z0kCQBYVPSvmGAPIx13VD6ExSwGyabQJmQXp9AMN00TQ+UOGpL4Iu9GULXzp/8NgMyhQMNJgzUg
	yee3fZ8fvqtOK4JteoWo0CyIWnbMqtxUBspwWDWbxaqQiVNH5/WZ09xu4Xue2jJA2KGciZRDRo0
	+j9wyRkCk/Ix4W0eXLUvSK/OuZpMMysK5JFp52BQmpVrtQIZG5zCEogXYflKRGB9kbXPAawK+4a
	/tE+Hqtdoyz6NnmbMOXybg+BLF2JPCvAlGQE56ZrZYrbCqcaF2W+fercddVGumitQAa4loSP6D7
	CFVLzzCS0WZSea3ltdVviH2k+viAQ==
X-Received: by 2002:a05:6820:81cb:b0:6b7:8415:d779 with SMTP id 006d021491bc7-6c0bc0d6963mr2931638eaf.36.1789138202157;
        Fri, 11 Sep 2026 07:50:02 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:35::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c09690af1dsm2652517eaf.1.2026.09.11.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:50:01 -0700 (PDT)
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
	Ackerley Tng <ackerleytng@google.com>
Subject: Re: [PATCH v2 4/4] mm: hugetlb: Avoid re-allocating global reservations on region add failure
Date: Fri, 11 Sep 2026 07:49:59 -0700
Message-ID: <20260911145000.3881046-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909-hugetlb-subpool-always-track-used-v2-4-30c5d83b572a@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 09 Sep 2026 14:49:29 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:

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
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  mm/hugetlb.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 652cfb55c6e6e..1151ad959ffd5 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6678,6 +6678,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	struct hugepage_subpool *spool = subpool_inode(inode);
>  	struct resv_map *resv_map;
>  	struct hugetlb_cgroup *h_cg = NULL;
> +	long gbl_resv_accted = 0;

Sorry, I think I have a hard time with this variable name ;p (I know,
even though the function is called huetlb_acct_memory) I get a little
bit confused because I can't tell if it's meant to be "accepted"
or "accounted".

I know it puts the line below at 81 columns :p but maybe we can just
split it across 2 lines?

>  	long regions_needed = 0;
>  	long gbl_resv_get;
>  	long gbl_resv_put;
> @@ -6768,6 +6769,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	err = hugetlb_acct_memory(h, gbl_resv_get);
>  	if (err < 0)
>  		goto out_put_pages;
> +	gbl_resv_accted = gbl_resv_get;
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
> @@ -6831,9 +6832,10 @@ long hugetlb_reserve_pages(struct inode *inode,
>  	 * There may be a difference between the number of
>  	 * reservations to consume and the number to restore now if
>  	 * there are multiple threads interacting with the subpool -
> -	 * restore the difference.
> +	 * restore the difference, taking into account any global
> +	 * reservations already acquired.
>  	 */
> -	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
> +	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put - gbl_resv_accted);
>  
>  out_uncharge_cgroup:
>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
> 
> -- 
> 2.55.0.1007.g17ff1f9808-goog

Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6022EDD40
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763175; cv=none; b=p8zstKgiO5MPb1rn/l6VwH2XkCllFA9azFxiQGQKS2F851qLCiVICae5NyaUk6rR91UaSX26dnfdrri9o7P/cpS5JRX0IN8HTeLIhBY6750OKf4gQVmPv8LN12VkdF14JvzEgAMTNBRRtq0yKLnzUbrQSSMxbLPqHGBegu46Gmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763175; c=relaxed/simple;
	bh=NgAJXFhyGAgqz4F/Z+T1d1uiKnNexEPPz0EJIOjXPmg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANqhcQCK7T44MIYCZ6VurHZzmyGx57cA4fjSyBkEyb0Z2CrkKBk9iKYXV7Mdhb7WpaMngNot0nV90FHJ2wHIPad5JMiB65mC20NX5nkKQTYh7PBpWhUqUht50TWzgW39xZDFJ4ULN6n2Q7T87CzQOuScamo7JWGiAmbUqMXKj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfqAPITH; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfqAPITH"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf8415866so6868052a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790763172; x=1791367972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VNZxYOPgHhHVtE3mtugzmk7TyFgX/vhP/aUVA52RJRU=;
        b=pfqAPITH/KEZKPDL3g5PPbjc2U8UMQ7SKIAbZXN2c2xXpm78b2DaUrBT0xLtf5Xu2s
         /SHnLRUnvIMbtmmPEScORXV0An/4sYmDkFP+zG9TZvYIFPN9baqyj/QPsXXBfs0PqvEJ
         Ga5cPpXVHaQwo9i4Jtb0bVy2JeSvYXkTDKMTj2aiTv6FdnqLWrcKMd9c6jTatxvBq0Mv
         3h4lCHW+3f//+KObijclHpo0wId6Wp/A71z3aNFk2QqmAcN7ZbS+acBqZ8Ut7Ls+ssvL
         CWNNrhZWN/CXPIUy58pFrhmMwDUqKj4S9lBrNJbRmK4o6tOxoe3b5WmqnGY9UQcnaXF7
         4RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790763172; x=1791367972;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VNZxYOPgHhHVtE3mtugzmk7TyFgX/vhP/aUVA52RJRU=;
        b=x0MaB1wo7wJeNu08d9FidVuR6rb3V3vYe1V9A63FrODqUPwfrg9/3soj/BjIhc6qIq
         un5wnufYEstxUgUhNnUEGo7QwqgHkLuKz1GUqAnOP6SBmqeHypbX9irlpmWZSim2q1bO
         3SpSZWAjcNlxxQUSrapVu6+qOWbfaTCblzdKq7pl6mJNpF/SOK8Wj82FEOtmtE759zho
         S0IkHzJjFpp+0vy4c2ohiS5poG6V1MdHffhy/vgoBIpStGSUiTEZsFX0+XmKPUcHB9lI
         2/zYek3+sa0c/An7QNECZ5AgNkgIpVqyxUVCtNsWThHaY9KBssaN2IBQ2XMiH/udjPtW
         +/XQ==
X-Forwarded-Encrypted: i=1; AKwUvByHHk4mhbEv3JTkZ0wR3h/mSuKbvEgZdZjRGKzS2ATKiWDDt+FlPMzB8uW5Eu8Qxq5R5cW2zKh5T6UPIFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYILow0blm7PZpuAMXRttBIr52I52GF7WBuv0+VDB6bMhOqsk3Qz
	2C8e0DOxiiugATSTxyj4MEBCTbYoJ5xm6PeCsDuHH7Rfinau/0wm9OIS
X-Gm-Gg: AYBFou2k0C+RP0Eo72V5nVIk2G9IHEZkyN/0AbbgNBCeiUGv9gu1qPr2hA6A+/QmPNS
	fd6Q5MJGtpsuVf45DkVd/17wlZQKqE3KsaoA6kcwTOqm/9/YPCdpczPQT/3PHjU2qKHEm6byL5G
	7DOFSaabTZr+3FptnplegqiuZOnnw/qqJ80Xoq06iXaOQpADLZn80HvROFTIMVfn+tlQImx73LJ
	Ixm36hxeWRKcduMQbgnz4zOtvO2D3yJ/17bM8QgsMYbbbp3y2mmV8DZmnXy+v37Ip197PqvfhOc
	L7UdBL2VpVgDDshL2dTlF37SYRwrYa7rBBkat5VF0vTc9nunkUCEJnrw6CGlKaQi/FJ9ERtW68k
	PoXbev0O5DojgxjDgcuH89HsANYpv2s0RKYFRnTD2fNwa2xvNxUreQGHTNP9Tj/JHdClp2ztEvV
	kS6TGkhm6jh6HLgb73EAKjcNo2UalC3yLRrUs=
X-Received: by 2002:a05:6402:324e:b0:6a9:dc6a:689c with SMTP id 4fb4d7f45d1cf-6ae199462e8mr462834a12.22.1790763172073;
        Wed, 30 Sep 2026 03:12:52 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15898cf4sm532500a12.36.2026.09.30.03.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:12:51 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 12:12:49 +0200
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>,
	=Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	kasan-dev@googlegroups.com, Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v11 2/7] mm/vmalloc: undo partial mappings inside the
 mapping functions
Message-ID: <arzgoe-bXAz1poAt@milan>
References: <20260929082014.160587-1-hao.ge@linux.dev>
 <20260929082014.160587-3-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929082014.160587-3-hao.ge@linux.dev>

On Tue, Sep 29, 2026 at 04:20:09PM +0800, Hao Ge wrote:
> __vmap_pages_range_noflush() and friends can install some PTEs before
> failing and leave them mapped, and the kernel callers do not agree on
> who cleans them up. For example, pcpu_map_pages() and
> kmsan_ioremap_page_range() unmap the leftovers themselves, while
> vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
> __vmalloc_area_node() relied on the mapping functions cleaning up and
> did not call anything like vunmap_range() themselves. When the same
> range is mapped again, the attempt hits the leftovers and fails, with
> BUG() in vmap_pte_range() for huge mappings.
> 
> After discussing with Suren and Ulad, we decided the cleanup belongs
> to __vmap_pages_range_noflush() and friends, so the callers no longer
> need to unmap the partial mappings themselves. Each function now
> undoes the PTEs it installed itself.
> 
> The rollback calls the low-level __vunmap_range_noflush(), it just
> clears the PTEs of the range it is given, which is all a rollback
> needs. It cannot use vunmap_range_noflush() because these mapping
> functions also map the KMSAN shadow and origin, and for a metadata
> range its hook would look up the metadata of the metadata, get 0
> and BUG() on addr >= end. The failed mappings were never accessed,
> no TLB flush needed.
> 
> Fixes: 9376130c390a ("mm/vmalloc: add support for __GFP_NOFAIL")
> Fixes: 0f9b685626da ("alloc_tag: populate memory for module tags as needed")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/kmsan/shadow.c |  4 ++++
>  mm/vmalloc.c      | 31 +++++++++++++++++++++++++++++--
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
> index 0c88d89bf0d6..2166086d3dc3 100644
> --- a/mm/kmsan/shadow.c
> +++ b/mm/kmsan/shadow.c
> @@ -258,6 +258,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
>  					    o_pages, page_shift);
>  	kmsan_leave_runtime();
>  	if (mapped) {
> +		/* Undo the shadow mapping set up above. */
> +		kmsan_enter_runtime();
> +		__vunmap_range_noflush(shadow_start, shadow_end);
> +		kmsan_leave_runtime();
>  		err = mapped;
>  		goto ret;
>  	}
>
Can we just do that inside the vmalloc? For example in the
__vmap_pages_range_noflush() as entry function for all(?) helpers?
So we do not need do it manually?

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 859e6d2d57a3..9bbf75706627 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -349,6 +349,10 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
>  	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>  		arch_sync_kernel_mappings(start, end);
>  
> +	/* Undo the PTEs installed before the failure. */
> +	if (err)
> +		__vunmap_range_noflush(start, end);
> +
>  	return err;
>  }
>  
> @@ -363,6 +367,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>  	if (!err)
>  		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
>  					       ioremap_max_page_shift);
> +	if (err)
> +		__vunmap_range_noflush(addr, end);
> +
>  	return err;
>  }
>  
> @@ -667,6 +674,10 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>  		arch_sync_kernel_mappings(start, end);
>  
> +	/* Undo the PTEs installed before the failure. */
> +	if (err)
> +		__vunmap_range_noflush(start, end);
> +
>  	return err;
>  }
>  
The only one user of that function is __vmap_pages_range_noflush()
so we can cover both cases there small and huge path.

Is that enough just to do unroll in the below:

__vmap_pages_range_noflush()
vmap_page_range()

functions? It will also fix NOFAIL case:

<snip>
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 89c327a6ce7d..fa1f357ecf3f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -359,10 +359,19 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 
 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
 				 ioremap_max_page_shift);
+	if (err)
+		goto error_cleanup_range;
+
 	flush_cache_vmap(addr, end);
-	if (!err)
-		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
+	err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					       ioremap_max_page_shift);
+	if (err)
+		goto error_cleanup_range;
+
+	return 0;
+
+error_cleanup_range:
+	__vunmap_range_noflush(addr, end);
 	return err;
 }
 
@@ -683,26 +692,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned long start = addr;
+	int err;
 
-	WARN_ON(page_shift < PAGE_SHIFT);
-
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
+	if (WARN_ON(addr >= end))
+		return -EINVAL;
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
+	if (WARN_ON(page_shift < PAGE_SHIFT))
+		return -EINVAL;
 
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
+		page_shift == PAGE_SHIFT) {
+		err = vmap_small_pages_range_noflush(addr, end, prot, pages);
+	} else {
+		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+			err = vmap_range_noflush(addr, addr + (1UL << page_shift),
 					page_to_phys(pages[i]), prot,
 					page_shift);
-		if (err)
-			return err;
+			if (err)
+				break;
 
-		addr += 1UL << page_shift;
+			addr += 1UL << page_shift;
+		}
 	}
 
-	return 0;
+	if (err)
+		__vunmap_range_noflush(start, end);
+
+	/* 0 on success. */
+	return err;
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
@@ -714,7 +732,13 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	if (ret)
 		return ret;
-	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
+
+	ret = __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
+	if (ret)
+		/* Cleanup KMSAN metadata. */
+		kmsan_vunmap_range_noflush(addr, end);
+
+	return ret;
 }
 
 static int __vmap_pages_range(unsigned long addr, unsigned long end,
<snip>

--
Uladzislau Rezki

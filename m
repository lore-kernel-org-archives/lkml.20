Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486222;
	b=SNMUhDlpAT2RU3divUM29zxmT58UaWK0dsHkF1mwHbpasdDf40e6uqdboecu5kDNASJ9
	 n1znMdAklatRsSi0+a1IXnG+DvCIQYt9y5GKp6wTjv7vq05O6fKup/7EQOP5Cro2AzCq8
	 wFlFZrBbaosy+kyWVoKPs/B6SWZG59eVP3MNZ4u/970aZkSnlUVuKeuKcmUDTHu3FfOiH
	 vjyoGWGI5vtOyWdrBd7iK+bQx8Ebsz7ufhs/oRwvYdKgYqF0WBlmvtXDBrSCk1F+MyXln
	 FzCjBxDb8g5vneEDUKh1A399y8duiW+zYXgJ0WMhxeuoenp+AuRbCl1k/hCgabxjMTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=My+EyMv7kUK9PriD5W/MVAD9Fcc5R9RWddctNSFBcso=;
	b=PyvW0MEH3HrWA3ptprp/XxTO+fLfX8k/6zLL0e7PsyJXx4MLgphdb0obf0VCrtiQR053
	 tznNYml9E9DNEd8T54nE2cIcwnTHpRz/wckLNXv/CfZNPMrDLnxCnaNb4xFfm4IDm6Cti
	 SG+yD9AbYipXNAIGmN2Jkyi8lNFvTxXIRgMaYZRfu2qoQzUcBW73XmKaauMcdS7KP9XjR
	 7L06xhWRY/CetEtwvqELRb5MGmhcSKEOKF+2ym3HdoBc8iIzS8fdEsjScH96mVvObXU70
	 XURWCVHTiSdZ8xSbP76AkqmRG+3Uxp97vBF3EhLTgu0dIVuIqyGliGTYA/O7zmZ/yZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pDxKFwp/";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C82606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDxKFwp/
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso5636340a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486220; x=1795091020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=My+EyMv7kUK9PriD5W/MVAD9Fcc5R9RWddctNSFBcso=;
        b=pDxKFwp/eOChUR9iE0+5rRB5zd79fpWLv7klUexvYFdUNbnJp+Loy3PpxXA/u/t1RP
         GjvHxXuVy0n+/Vhd/m67ywVi0o4/Wn4sfRxUWME9nt0y4aDe6OsDQJfDsZzbNgdC2OKc
         bRszLWQLeSUEDNfCL17x0xjn4Y3boBJDS0VjJVtk8/027ANDnBfwbOu1wBXShqCSlW09
         GJThMcljno9zRmxGcPvjakGZCjO2rABfRugW0ZTnl2WiSfXHyuwwGSaqwnnD4OyFcYRR
         UklCD8OVpoW4Dk7RkTJ3XpxWnkilcgUSTaUis0e6nClpDtVDn2K4mafJw8HgpKm0LUXG
         QU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486220; x=1795091020;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My+EyMv7kUK9PriD5W/MVAD9Fcc5R9RWddctNSFBcso=;
        b=DeRcw2q5kAxoNkFqcs3UypEgfMdcEPNUQlTgTa9P70AQGgFbjSz62bpKnK+6nGbHVj
         96DxRwBNvFJzpRLvZcLigvom33xgEgVp8CvADWxicse/MOjX2mO5MoJTUVQ2pG/NK4du
         9nLK5t/07ZgZLASFUIA1yfJd4IppfJNLa1zHeZytKFsUDSmHuNztGQ1eo0XJyMFk4gGm
         TOZXE0QWbs8x6JzH17U0nYSXG+R01re2Vc7yP/96MYGu0Z6VxdMZ62hszSo5+n5Ha1hw
         zTNMLceAd0csH0gdl4rTJ8q/lqdEp9cCmo7IUps4z+9pn23z4oSnK8g5J4uCWuUieC2X
         H7sA==
X-Forwarded-Encrypted: i=1; AL+hErHZYPTg4rmDde8Hptw3v+PAK5iWFDxVbizTizorUVruX9sfRUtii9TPse5fuxivKzEdw60OAPCAUB6JX0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z95ZIJmbt3pAcietgniPTL+gJ13GoxTW1srT+DnKis4bdVv6iqd
	NbwvIxn9TT1jV0wCTfVEDpixWkwZJyJqFW5UZ5BmKtt+47hfBxG7zOhM
X-Gm-Gg: AYBFou0yxLRUiruvK3PslQ9SPO/TJCfOsWw5tr2TZOZT9INa0Qt5yhH7SxnphOeLIJg
	4n3U6MHu6M1+3udwUR37n0CL5gJQtnVbm60lW1LyH9WcQ05xkVEbcy8Xz5Rn44tbQkPjjM8WqZi
	Gbu7glACnzW5OoxbnToylpyeQQdu3ljTet8yZ0ieBf3O3Rp7ITeu4OvzjYrsX1RVpC7FIjFfsDn
	cbDmCacejZAHOzAmf5YVFq6k1Bp0ehaa6aCNbXntUpcscnIqNDaFznOqpruRaB/l2pmiO600Bf5
	+wn1UQQX2L+QZCmVb6Jdn3Mv6i0oN4Hd3qDnKmveg34i95GkxgJX/mPqgLvVgBppfPON/OBxuNV
	gZAhXKSZFa3wR7kwK8LX8te0Hg9TsYwD3kGcK6tjSSB0EDE6mSuRyUWRXVtRPUE9YLbONOC4EPG
	KmadTE/lurnJLtKRB2SKfKhX3LfV3RjE15G72N3CklyZc3a0QJhsH6Q/ev2C+tiAH52HBBzdH5n
	suWDeZen9DqXDC+50ineXI7KQAIEXNizZWX6acvdRhdionRFvHYACj1/FHn6JvoSqQJEw==
X-Received: by 2002:a05:6402:2108:b0:6b1:e8e1:a3cd with SMTP id 4fb4d7f45d1cf-6b777828d1dmr4207046a12.35.1794486219647;
        Thu, 12 Nov 2026 04:23:39 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578eb0b1sm3345874a12.22.2026.11.12.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:23:39 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 12 Nov 2026 13:23:36 +0100
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 3/9] mm/vmalloc: BUG_ON() on an unaligned range in
 vmap_range_noflush()
Message-ID: <avWvyNo5qHbuk9hA@milan>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-4-hao.ge@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110112546.261415-4-hao.ge@linux.dev>

On Tue, Nov 10, 2026 at 07:25:40PM +0800, Hao Ge wrote:
> commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
> PAGE_SIZE aligned") put the check in vmap_pte_range(), which is too
> late, because the upper levels may already have installed page
> tables for a range that is rejected anyway.
> 
> The pte loop maps whole pages and stops only when addr lands
> exactly on end.  An unaligned end lets addr jump over it and the
> loop keeps mapping past the range.  An unaligned start maps the
> page below the range and usually misses end too.  Such a range is
> never a legitimate request, and the corruption it leaves behind is
> hard to attribute to the caller afterwards, so bug out on addr and
> end at the entry of vmap_range_noflush() and drop the check from
> vmap_pte_range().
> 
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 093b8d5f7b0e..27f2674a5556 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -125,9 +125,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size;
>  	unsigned int nr_pages;
>  
> -	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> -		return -EINVAL;
> -
>  	pfn = phys_addr >> PAGE_SHIFT;
>  	pte = pte_alloc_kernel_track(pmd, addr, mask);
>  	if (!pte)
> @@ -347,6 +344,7 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
>  	 */
>  	might_sleep();
>  	BUG_ON(addr >= end);
> +	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
>  
>  	start = addr;
>  	pgd = pgd_offset_k(addr);
> -- 
> 2.25.1
> 
Like Suren proposed, there is only one user of vmap_range_noflush() it
is vmap_page_range() function. You can add warn-on-once() there and
bail out.

Do not add BUG_ON().

--
Uladzislau Rezki

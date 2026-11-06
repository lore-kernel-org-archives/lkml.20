Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959998;
	b=sZExl56yth2mUeMvBtWoPgnbQvC99gHoJF0Geoy9R453+Ws65+/NVh87TDMgsvZ8/zgl
	 54PdSt6+GqsoRD11IZG4CQH668MKJAyUzEslbqhz2UrlsBJNUNnZArQvgXgyatffMoM3Q
	 Z/aMVSNn/phurjIMnep7OK1beyPhxdAH4NjPFQFFMh/JH+4o4rpvA0RWmoxbOgkh+iotb
	 9f+s9Kb/Ytc2ajyK1NYqpZQSJHgpNJT5QnBPJNyJQZws7hhBMHL5Pw6r7iTOn9AmVVIbL
	 lbybnylJbwKOl46koTv9OGpMuHtNKgqGw43tVvvU8p6M4QbJcs6MQtHW+74c1+I2pqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fLL3XmqFz5Pf3FaFIovTOe/0d0X3Y15DtdwfOU4Sa2o=;
	b=ls2yk1aEm8sYIqUR7MdXBsNiE87hQ+kVfANgCBYOmAdHWSUu679ofVLU8D6F68q4hzon
	 zepERCnGJOrTL9/rbnNLxdu2/3buUJR1YCet8GwOAz5nHo3yohzLwr3cPhVxI/TbQvWW1
	 kRw+AymPumjz1tZ7OS4ef4DR1WW86vKHlGGwiuzINabQHBpZdILd7AkjWiwoXPl95L6Ba
	 SbgO4BsMuyN1ECn/7mQ/uoP/HmNkharU9kZ6f91O6EeNctH4JjvD3BuvVT+j8nwoAOLz/
	 XMH5PioQMUqCY10cGakPfpTDSjW2ZE2ellB6Gp8lKOZPsoOXDnN8gIuTXhsfZjGqJ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmi5Q0Fv;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8DF606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8DF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmi5Q0Fv
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so471046f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959997; x=1794564797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLL3XmqFz5Pf3FaFIovTOe/0d0X3Y15DtdwfOU4Sa2o=;
        b=lmi5Q0Fv7T71Md66nuBX67PlvPoEFrAFoRKV1Sq9HgiIufOQpo6A5qA4voQ9XVsQnI
         Y5Hj/M5KiCFqmc99z/aMxLeWTTEEj7wwOi2WSlzSWmo/tAk3DTZOxVOHqmd3JGBbyX5p
         MjxD+nIIkXrtlDg79Rto+zQPgz6nVr2WPvpz2LPA0t+/5xqCmE79Ud+YVNwx95IDOpUY
         6gKHohlLzrUuTmWRolrPZjIckPQ9XVpyHmmteUBXc8zNdemlnEFZM9+mZVxPhBgRgSxd
         OK8xZxmBxgiJbDDXxSodZkJXJeAnpIIx2xVIJR2W/+gMaMI2CJhuiL6Zi46Q+a4Dwvd2
         pmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959997; x=1794564797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLL3XmqFz5Pf3FaFIovTOe/0d0X3Y15DtdwfOU4Sa2o=;
        b=kzpXXey2vW9Cjvqdm3TkuWKazF8sWVPR9QdcCaTJyILfyV2hVSYdyt6M/nwx38JlfI
         zlDbO6C/Fjc5V7jLJPmEU1oWBr9NLEAuOFk6f9UV/nuBc1oV14s5GKgFUfQwPSXIpL/M
         3u6a2f8+wW6K4ZJos1B1WhKFmLqJqyqGAojRjLGpsygpXtvJKT0HDAvY9W7Jz+AWgWNU
         M4XZqAI3twOqGFEDoAPDPvlJ8iQDBj2tBvW1E7KS0PRXaslBBKj7bdsW6KDwznvJwMdj
         aZDFTeeQ1N+0x2UlV36IFecuKHS9ZQZVu5pLKqZRypMYFXCKqImEVkyVgi+NhwqASYFF
         Bolg==
X-Forwarded-Encrypted: i=1; AKwUvByHBad6tAF697UaV1IE1EgCMtl4mJ0QgIhNfQr1xlQPIM4lKg+yTqMA3JGT3jN/g/5xDZQuX4GEGrjf38c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PfPdoXKBgNIVzuhn38KnKMrm6niTXHhpNMLrvRU7EtUJ9VWFH
	y6AM9h8gUayRPew+f4E5bhOtnl22PcwVdjoKWlVHQwt/bBlfH/dAEC8J
X-Gm-Gg: AYBFou29lRShzDc7UEDjv3G3bdIsUpFZcRJtIksj8W558GCKqY025jA5zWPZdx9ve0q
	Sq8Yw5cxTr23ejp3nSLYgIlklZMxv77NTAB5UB4t9NO4X9+WFKqJzE7Ef9w+4EGk1ihiIKvb+aZ
	NWlK+kbjfx/oxJuqYxemHO2uQhIayTotBWAT/JLzFBRHEyA5bLHIB9Vv7QDnvkOOQmCcxejvLZH
	/0dF+RYWvBywnqzn4jPTTfhpZc7DRuSOy8ntFY7xbZwzyMsnI2DjYRNLxJpvxg9sCv/PRrojIZ8
	uKm9xt+C9Sn46CIh2Wi7GV4NhHrq73/BUyK7+O/I0ZXNNvb9xrau22HDrQS+mjrTCUd8XGRom6v
	AWEBwP2XSD3DtMPmFqVuk8Rbm66ITifDw90Wtw/054Sguh7gtgxNFgDMhKOlzlUtdgeLl+d/2oT
	CMSyhagmmTL5a4xft/HrK7N+dkgP1NOdTa8Ffdi1M73YhPa7sJeTZm8TBMmS+lphMgtq1gOuB2d
	JKM+WekwE5PQOcPhytuyWGmRsTusokCZ89tbfXxkjl1t9oFNXQ8+3c3WBq38TevEv5VsJrxbfQ9
	1+WjFNuxs7d0tpP87GLBfiE=
X-Received: by 2002:a05:600c:310f:b0:4b6:bb67:bb9 with SMTP id 5b1f17b1804b1-4b6ded4a3b0mr30188925e9.29.1793959996617;
        Fri, 06 Nov 2026 02:13:16 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm121341505e9.10.2026.11.06.02.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:13:16 -0800 (PST)
Message-ID: <4763a039-60f8-4263-8124-beb0f9ab3366@gmail.com>
Date: Fri, 6 Nov 2026 11:13:13 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm/gup: limit pagecache folio refcount when grabbing
 references
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Steve Sistare <steven.sistare@oracle.com>, John Hubbard <jhubbard@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux.dev, stable@vger.kernel.org
References: <20261105-refcount_overflow_stable-v1-0-70b9c655da3e@kernel.org>
 <20261105-refcount_overflow_stable-v1-5-70b9c655da3e@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105-refcount_overflow_stable-v1-5-70b9c655da3e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 2:10 PM, David Hildenbrand (Arm) wrote:
> Let's replace our existing safety check by the new
> folio_ref_count_over_limit() check in fast and slow GUP before acquiring
> additional references or pins.
> 
> Keep it simple and use the check for all folio types.
> 
> Drop the WARN_ON_ONCE(), because apparently these things can currently
> happen with large pagecache folios.
> 
> Keep the zero-refcount rejection if the refcount is 0.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  mm/gup.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 2ab42fc6834e5..db9db6b2a4662 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -77,7 +77,7 @@ static inline struct folio *try_get_folio(struct page *page, int refs)
>  
>  retry:
>  	folio = page_folio(page);
> -	if (WARN_ON_ONCE(folio_ref_count(folio) < 0))
> +	if (unlikely(folio_ref_count_over_limit(folio)))
>  		return NULL;
>  	if (unlikely(!folio_ref_try_add(folio, refs)))
>  		return NULL;
> @@ -140,7 +140,11 @@ static void gup_put_folio(struct folio *folio, int refs, unsigned int flags)
>  int __must_check try_grab_folio(struct folio *folio, int refs,
>  				unsigned int flags)
>  {
> -	if (WARN_ON_ONCE(folio_ref_count(folio) <= 0))
> +	if ((flags & (FOLL_GET | FOLL_PIN)) &&
> +	    unlikely(folio_ref_count_over_limit(folio)))
> +		return -ENOMEM;
> +
> +	if (WARN_ON_ONCE(!folio_ref_count(folio)))
>  		return -ENOMEM;
>  
>  	if (unlikely(!(flags & FOLL_PCI_P2PDMA) && folio_is_pci_p2pdma(folio)))
> @@ -1482,8 +1486,8 @@ static long __get_user_pages(struct mm_struct *mm,
>  				struct folio *folio = page_folio(page);
>  
>  				/*
> -				 * Since we already hold refcount on the
> -				 * large folio, this should never fail.
> +				 * Grabbing more references can fail once we
> +				 * hit folio refcount limits.
>  				 */
>  				if (try_grab_folio(folio, page_increm - 1,
>  						   gup_flags)) {

this can fail now, so shouldn't the error path below return -ENOMEM like
the first page does, instead of -EFAULT?

-- 
cheers,
jose a. p-a

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908736;
	b=yqznKvgOV8LlfBVDzI8do0lJUHFEjxlWrfSGtwUnAFgK/eHnTyyxBo5eELkpP1bLXpmD
	 O7LBn3IozeCbYuICio9YvDw+XQvKkPtauYFCTjOvsk5K4hUKKJHXw0Gaf7hO+AcZvi+H6
	 cQJT1ibrc9NaU3AbepLODY1BYrnC1Etjx1bUnmwqjXtla7LfvOhc/2J4sgR7ybx28KD7Y
	 idUi/3uJdfygmuj5TM4DwIlWloeCipeEn/Qy1Bo8kcVuL6L6iX7xknFtlWJvjlIUnNsVZ
	 UnxEaePg9yhaNdnjR4rEr93vwz0o4/zWHt9cE1ef/oDxXxA+ezPk8QuW0qn2dRpXD+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=km0LURr6P7Lx8jR5JYqDxaUcl9rwTeeAgZu6u5Eug1Q=;
	b=Dcnk5/ekuEFL4bKMLjrEj9/cuuf2vvjxkaL2jLnWSd5rfeoQi0+M0XOhu6J7Pn1l8PbQ
	 8ki6m0F4PjQSvyMUuvK0BZchaq4ZYTSaOBlFFqRpQPrxZcZsQr485A+tUEiogelB7FhwX
	 PmpNLgPbvpihM/Qm5lHGCo09uOBTyJVB8NbwT0WUvQ/Dm78PC5a6KciCX3CuzVO0wtk/u
	 nXbQL9VRKShtGzddsqSU37Mp1+jHV3owm4DFR3vtFoWZr2pnLldxWoIQ5aGv4ynen4nA9
	 gk+4bhCSCzDd8MdrSpqydLrcCjrg55Sf+lTLNuJbCe/nhDD6SJRufkTgZKR+bLlSk3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XJOymQ0m;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26163606A6C0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26163606A6C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XJOymQ0m
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b300713befso22027897b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793908735; x=1794513535; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=km0LURr6P7Lx8jR5JYqDxaUcl9rwTeeAgZu6u5Eug1Q=;
        b=XJOymQ0mMkimJZUfpxnT80Ebiw3Py5HmDR9gMq3ivMBkzb7SJprP9+OODYRr9ZOHYq
         1tAuts+PErrYncO0eFf8BndsV7TU14sV4tSZTp4LlnHtfdWXbSef7YsLrYOJ8K3TaI5i
         idfi5oT3uMtrLwHj9LoT9/k+sjBAk9CVrhnOT1eYrNXYkYyKDYOE1dF5HK0hQ9FrlFbk
         SBn/sXcLH4866345PRwk+baiJdmsfcUJDr5SpQQHb83F4ugcGHkpwypOsPUqyfyiT2ck
         JO/Gow3w0mtK0NgZp/cCBY3LKgy5RJO9mrYQrGwdKgNCevt/Hkg9RVtS0GLwzxnryhxe
         aECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908735; x=1794513535;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km0LURr6P7Lx8jR5JYqDxaUcl9rwTeeAgZu6u5Eug1Q=;
        b=A7rk1CO97y8hMhoPOjGogv7+726MQDOU9CYT6taYzkQsP9fm+0zzlv6ZBqX9xmWuB4
         qzSfGZLlnoHAqwXfEzNC5wTahPZUpB6esLEwf8MeovIrKWfnSB6DSjrXHi6T9vUgj4hR
         KsYJsWkf+gzU5KWxZ9iNxVGseIE15vw/5WuE38eEt4s+McZKWHcyZM8MRebKgijWrt6O
         11w+52cUl3+iJ3MRkB2tsDAlmxT2IWJxKL3IR/LXGSMyCA/jxLgG787X19aUas2aeu1Q
         V07cV7MKKbfO+AnkRTYxyWHI1qxroHRoc1GXjnfct5PxbUf47GapFcExfGdUFqxaIPVN
         kgEg==
X-Forwarded-Encrypted: i=1; AL+hErHgdmsVfFRoYr1QylSd0awJwJHo0/pkqzfOD3LNlwYu7Yq26LICPNsZA44HQdTMRtrhFkq0fN1Mt//KIjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vne3IE+H5v29sFMxJKmCY0Gx/nAil7GG5uXwzRtVuHK83NICv
	/Ci9dXsNYuuN37pGqCLlz+OMHzP03qMVV0OVNUZ2EYgpq4zjQ+WIUYkUQktIAIvwPA==
X-Gm-Gg: AYBFou2QfAi7E/pyX82q3A6NJCVeJyNEHAWFip21COeG/5NmE1yx4Z/Lsxa8iD7/58C
	tO4SeOawYU1ZOH+Mb4DvLK276Hb5Jn5bB4/6pH0VadrXVNKvxDzPvo+/Yd+m28t3RoE3cKaz4zT
	vE/ClkWbPAUlyuz43EMVY5HSrEHef9OygQik/C6srNHY/8G2kSflCY6moff2/ZVXJBcCeJ4k4Wm
	AhKhnpaCo7PysAbT+NgdGlo8txukY5RFbmvK/MBSONA6iwxeceRYPJULuq9zbc2caokipT7wFvM
	zRjRfagt7QA45poZTb8oOFmr8hazWW1K7gZm0i0xx3mw+bliNARKQczy9TxW6dCkD/SA9CjTiBM
	LzLm0zZcDF81oPCWUK/PS3lyHNk0TTh1hNNJcp3VmCN8CBLnYQ62jfaLdHONjHvmYgBujDgvqmT
	cbPWs+6zhMIONmSvvmI1WFtI5AkgI/LEN3OVyJUoN5/E+KDL8SMX1mrWbektO7Z4dAbl5YpoLs4
	K1fDS1QzNi/7UvK3K2oA6odZ0C+gRVE2pZ7V2UjHarcrbLt9sAm9q1exRh6qYK6Ypv1VuTK45Mh
	3C4CY4BPQ2X/fMZ+0daK2VOlmFfyZ4zKLJUPeNI9Uura3vnS+sT3cy5VT958RoKmOrEmtFj+rJ6
	0qC/fR2nqOrzoj71TUw8=
X-Received: by 2002:a05:690c:e1ce:10b0:8b0:acc6:8e5c with SMTP id 00721157ae682-8b3417dd26fmr509307b3.9.1793908734656;
        Thu, 05 Nov 2026 11:58:54 -0800 (PST)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f76dba8sm3113237b3.13.2026.11.05.11.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:58:54 -0800 (PST)
Date: Thu, 5 Nov 2026 11:58:41 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Hugh Dickins <hughd@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
    Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
    Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
    Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
    Kiryl Shutsemau <kas@kernel.org>, Zach O'Keefe <zokeefe@google.com>, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/khugepaged: don't map folios that are not uptodate
 in MADV_COLLAPSE
In-Reply-To: <20261105-set_huge_pmd_uptodate-v1-1-a78d8a1b7117@kernel.org>
Message-ID: <1f69d159-4a59-535a-c24f-a26188698862@google.com>
References: <20261105-set_huge_pmd_uptodate-v1-1-a78d8a1b7117@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Nov 2026, David Hildenbrand (Arm) wrote:

> madvise(MADV_COLLAPSE) can map PMD-sized pagecache folios that are not
> uptodate. For example, shmem fallocate() can put such folios into the
> page cache.
> 
> collapse_file() already refuses to proceed with folios that are not
> uptodate. Let's just do the same in try_collapse_pte_mapped_thp() and skip
> such folios, leaving handling to the page faults.
> 
> Note that collapse_file() effectively clears shmem folios through
> shmem_get_folio(); let's keep this fix simple and simply let the page
> fault path deal with that.
> 
> Fixes: 34488399fa08 ("mm/madvise: add file and shmem support to MADV_COLLAPSE")
> Reported-by: Chris Mason <mason@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Hugh Dickins <hughd@google.com>

Valuable catch, thanks. I was worried that "try_collapse_pte_mapped_thp"
implies there's already a PTE mapping the non-uptodate folio, which
would already be wrong. But we've been a little too free with the
SCAN_PTE_MAPPED_HUGEPAGE result code, so there's no such implication
(and even if there had been a good PTE, I doubt there's enough locking
to stop racing fallocates putting a non-uptodate folio there meanwhile).

I was going to quibble with the Fixes, thinking the problem was there
earlier: but no, I agree with you, that's when install_pmd came in.

> ---
> Once reviewed, I will pick this up in a timely manner.
> ---
>  mm/khugepaged.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 8d9f05a39afb3..db135b3c44ef1 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1900,6 +1900,12 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
>  		goto drop_folio;
>  	}
>  
> +	/* Leave any uninitialized folios to the page fault path. */
> +	if (!folio_test_uptodate(folio)) {
> +		result = SCAN_FAIL;
> +		goto drop_folio;
> +	}
> +
>  	result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
>  	switch (result) {
>  	case SCAN_SUCCEED:
> 
> ---
> 
> base-commit: f44fd601f72e09e44c667b9234c9cd469856679c
> 
> change-id: 20261105-set_huge_pmd_uptodate-9b9820307f30
> 
> --
> 
> Cheers,
> 
> David

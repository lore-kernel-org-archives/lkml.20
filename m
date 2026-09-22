Received: from mail-ej2-f24.google.com (mail-ej2-f24.google.com [74.125.228.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5B0541450
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079431; cv=none; b=KaaZ7oDneu+byOm89BlihcbzxBIACLbFMrtIbc2wRGKy1A3r3pKfXl1IhxHmFfRozXkVIWcaZl2PQoM5qV560iYG+cgJvqcze9gblu9EGDvWqqUTj2e1vln3gPtnzvkoiYpTu3MNtBIX8r3YulbpXudHcTZegKwr4SLNWgkrZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079431; c=relaxed/simple;
	bh=tfLXZgodGHlsZ3c+mskxpecMPiVjGm6fBbH6e6KY3+k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRUlb/jtmGUVbVEWyyDHU8wlpGFWJObph7Uo/hm/V93+qUI33bXoGpMtZrpWrfmidafF0fLZO7g9ZQKG7QoOrVBcIrryCFHuG2QNRdgCy7pZpk2rSiY3jp1R6mM8VYPEVEk0rEOkPsVo0NOOH0v4LbhaXZbkujx5HYTIpHxQpqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VElKvcHr; arc=none smtp.client-ip=74.125.228.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VElKvcHr"
Received: by mail-ej2-f24.google.com with SMTP id a640c23a62f3a-c29d33431c8so531482266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790079425; x=1790684225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgtWhH7fN1wZ1neVmdj/h2QBFjKH8NY7ifeQrzN/T4U=;
        b=VElKvcHrDeMGwd4kOgm46Hhsn5VhZze8RQ6iRp3C7FaFpeasdH9IGTqBsmdaIV6Kf9
         4Fvw9UnyFwbPVhbY17PlQcfoQle5Z2ABoAd1EF3cP+ncOxXL5j4a/h1j2fzQQ/EeDdn6
         JFscRYYp14P1H6piEHcS46aKg05T/1ubE39z8Xe730iIBjp9YvJOIdG4UcA/X6cz8o6F
         TOUDAEN9aYu2z2vuyXkaZ1rRQAWZZ3fi2kGniJF9j3gdS4AmHBmeO4kAZpt2953kyuuN
         JHuZhhs+oYFACTilSvSjCqLPBDcRxQi49pfzmZOZSiEvmWgZJdqm3OE2RFjVdY9LW0If
         bukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079425; x=1790684225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgtWhH7fN1wZ1neVmdj/h2QBFjKH8NY7ifeQrzN/T4U=;
        b=hsd3ilzJZniyWG2IB2HHnJpgLXIplBFUSxOw23IwICdEWK0WNB7fNzYEfYD5K0HV+t
         N6A1GLuFzHXEhyaVl01TZPR+9A97ExE4/3eaO9jfH7SUVGweTWung/0cf5RzNjse2v+A
         OMlrktSGYoztWN+Z9ITpcOorPgPhEenSX6lF8kRYB+zd7fvPjwByAuineD9n6xkhfTiq
         woHKiC0FZksbTXoUISzP5SyBpEUpB+kcCLquLHaOB3avYG0uFD15w1xNjWQPIIdVQ0rc
         lhyAwkRXqfULWywZ9Nhs5LBe5KR02CwMUFZU0l1Nn7eV6jxwhmQlDP5tEYXaNXEG7SXp
         m4pQ==
X-Forwarded-Encrypted: i=1; AKwUvByEQFxsVYJNvsyNSCXsminqHHGDXU4n59HOijsxQTwODJ5LBkD0goQveEP6D+UeOl74TwAY2Y8I1eEaob0=@vger.kernel.org
X-Gm-Message-State: AFuF++mI76VtHS6XAOO+U7nMMXAqYJI7XBbKH4cGD1rRxlDoRIjHILOA
	RGAJ1BAbgTohhcixYkvfvlo0b3ozTMe90ysfu7D2p5MQuTstnIceeYm0
X-Gm-Gg: AYBFou2XC9dAcXiWOuj49LhWLSy1XGE7IqC6IunJWGtO6pFb6ikw6I3XGw3WKAWFCaI
	atxCG0T5F4g2318SGP1otKGKEFbaaQ6ITjFAyIyPfuuDFHNpXXqcwXXUrL9QFNaUCI+6gSFSc5/
	LnhWJKvyUCFFYJfso0N/2PNKjG6m8V9e8611gRi8uBwae5GGkZRzG/GUFMAjoRv9sgFKFFXNurP
	8oLst9GWWMzB0lc7dnVxO5I6kj0EhUa6IPSONrcWVe0Wsr+M7TXwiWeDftkxkI27wVjnai/wrZ6
	e4IgXOceV1+lJCPq9or5UXtCwNZryPDNmB8cmYWGRx5pZGDE5eX2iNeEscIUUUjPXdJaKEKsK57
	Gc3FT+Cy5+phWnbS0LZEz2kAkvM7JT5/hjkWVu7BN/19brqXB/Vp2jz7iDWxgXlwr9prdSSDgrT
	08Sub6Jum+wDpx5iiGS3Z1Ykvaf7Ot4jyUfAM=
X-Received: by 2002:a17:907:e11c:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c2a8acf45edmr237310966b.48.1790079425184;
        Tue, 22 Sep 2026 05:17:05 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5ee0b4sm74104166b.50.2026.09.22.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:17:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 22 Sep 2026 14:17:02 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v2 1/3] mm/vmalloc: fix vmalloc_dump_obj address
 alignment for last-page lookups
Message-ID: <arJxvj1vaCeNCisu@milan>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-1-73fceb3ed1c8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vmalloc_dump_obj-v2-1-73fceb3ed1c8@linux.dev>

On Mon, Sep 21, 2026 at 09:17:21PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> vmalloc_dump_obj() uses PAGE_ALIGN() to normalize the input address
> before looking it up in the per-node busy tree.  PAGE_ALIGN() rounds
> up, which can push an address in the last page of a vmalloc allocation
> to va_end -- outside the [va_start, va_end) range that
> __find_vmap_area() searches.  This causes the lookup to miss the VA
> and return false, degrading diagnostic output in OOM dumps and KASAN
> reports to the less informative "vmalloc memory" fallback.
> 
> The upward alignment can also change the addr_to_node() mapping when
> the page boundary crosses a vmap zone boundary, causing the search to
> hit the wrong node entirely.
> 
> Use PAGE_ALIGN_DOWN() instead, which rounds down to the page
> containing the address.  This keeps the address within the VA range
> and preserves the correct node mapping.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 859e6d2d57a3..df42d8a6f058 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5277,7 +5277,7 @@ bool vmalloc_dump_obj(void *object)
>  	unsigned long addr;
>  	unsigned long nr_pages;
>  
> -	addr = PAGE_ALIGN((unsigned long) object);
> +	addr = PAGE_ALIGN_DOWN((unsigned long) object);
>  	vn = addr_to_node(addr);
>  
>  	if (!spin_trylock(&vn->busy.lock))
> 
> -- 
> 2.25.1
> 
LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki


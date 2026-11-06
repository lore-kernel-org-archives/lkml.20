Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937067;
	b=K/wr6/jaaE3sGi5GzCn6q793ds39MAIZ6cdfzkNd6RKlCDqCmN+96jeg8wvvObATRhuc
	 BLBrSucfuTa7es/07nur+2xOFVMeZDb5zYo94UUe3ZNNDp1AKmKxtW6NQa+MJ8mhwDYaC
	 u4sr1soUSCWEEwWAAOO6SIeiGoepJG/CftXRICOa2G1uFvcbyXU+buC2QMm74Hs/GR6Ly
	 wj6iOnxOLF8/7UofFG8vQNcN/Id/GceMORzkmrUGaIzlr0OaalF2u68MU2E7Y5yKFHlrM
	 /z6dIbIT+Wd/Be18vSIrnC5YiA2AqTjZkauJ+RuXc1quPsR/lYKyK5D5z9vLpG/QA7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937067;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=LDVYX5pprFZ5HD3Zo6BkrsqChiY6yqG+iOkhfuPAdvU=;
	b=jUQOAbLHARMV0lBZzsqqbd8JhLQ0Yg55/kz4rfAZtwIjBr9p7VwBY0q5W4aEncF8+Zez
	 tridEv8njQbX7CZtxqszaoaDGPs46TgQR3dMywQqe/+h/OsIgYB+ZvEp0zSVg7glMcB7J
	 dVp50Pzwp4LtsIYuWX3rw3h/pX1QJ/AIvkA27PPSL23Np5EmFyLQjRgPRXFhkwwLI+fE3
	 A3jWQkV47nXFKIGCNS5mgXuu6wBZ28GQtoK7OkLvHurNUz9FUHxSSK9K//dSr/vf1cMfL
	 XrB+g+dwsARQdY5ywhQ3meDjm1NlYOelNDbPiQK5KXPlNwQixYctcJyKGA31AnTaQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r9Ztd5hA;
	arc=none smtp.remote-ip=91.218.175.188
Received: from mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8416606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8416606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r9Ztd5hA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m4ucnzX8AjDcLxy22+8CSKWxW8fX479FCTuyRg1XHhc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793937063; v=1; x=1794541863;
 b=r9Ztd5hAMLkHeRO6q3xVWEmUPAAhGm9uZWszChoWRlo8EXJoXdw8gulBawXOqH4L/WOq3x8k
 BzeSKavzXqIjv97OGY2fG/bJK7I2cQqOZoilRj1gwQ9Bsjxw/yOkec8mVwvEsNcJJRGyIQb38Z8
 k7Z9yaHvUKMpKoy6jzWFeEWM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e531e58339419fd7;
	Fri, 06 Nov 2026 03:51:03 +0000
X-Mizu-Trace-ID: e531e58339419fd7
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2] mm/hugetlb: add htlb_dissolve vmstat event
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261105191508.1021974-1-mkbund@amazon.com>
Date: Fri, 6 Nov 2026 11:50:47 +0800
Cc: akpm@linux-foundation.org,
 osalvador@suse.de,
 David Hildenbrand <david@kernel.org>,
 jiaqiyan@google.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D6862DF6-34D8-44B9-8412-B241812F6754@linux.dev>
References: <20261105191508.1021974-1-mkbund@amazon.com>
To: Mark Bundschuh <mkbund@amazon.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 6, 2026, at 03:15, Mark Bundschuh <mkbund@amazon.com> wrote:
> 
> Memory offline and memory failure handling dissolve free hugetlb folios
> and lower nr_hugepages. Nothing records this, so when the pool shrinks
> it is hard to tell whether that or a write to nr_hugepages caused it.

Hi Mark,

I want to know why you need to distinguish these cases. Is it because,
in your scenario, there is a possibility that unexpected nr_hugepages
operations may modify things? You are not aware of such operational
actions, so you want to know whether you have experienced this kind of
operational action, is that right? Since this risk exists, why not use
auditctl to perform audit logging?

Thanks,
Muchun

> 
> Add an htlb_dissolve event, counted for each free folio that
> dissolve_free_hugetlb_folio() takes out of the pool.
> 
> Signed-off-by: Mark Bundschuh <mkbund@amazon.com>
> ---
> v2: say "takes out of the pool" instead of "frees" (Jiaqi)
> 
> v1: https://lore.kernel.org/all/20261105020324.2011790-1-mkbund@amazon.com/
> 
> include/linux/vm_event_item.h | 1 +
> mm/hugetlb.c                  | 1 +
> mm/vmstat.c                   | 1 +
> 3 files changed, 3 insertions(+)
> 
> diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
> index 2628ccda076a..822fe862e5b3 100644
> --- a/include/linux/vm_event_item.h
> +++ b/include/linux/vm_event_item.h
> @@ -71,6 +71,7 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
> #endif
> #ifdef CONFIG_HUGETLB_PAGE
> 		HTLB_BUDDY_PGALLOC, HTLB_BUDDY_PGALLOC_FAIL,
> +		HTLB_DISSOLVE,
> #endif
> #ifdef CONFIG_CMA
> 		CMA_ALLOC_SUCCESS,
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index da5d04edf7c1..7c79523b2a3c 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2047,6 +2047,7 @@ int dissolve_free_hugetlb_folio(struct folio *folio)
> 		}
> 
> 		update_and_free_hugetlb_folio(h, folio, false);
> +		count_vm_event(HTLB_DISSOLVE);
> 		return rc;
> 	}
> out:
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index a3e809c57f29..6282eef7074a 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1397,6 +1397,7 @@ const char * const vmstat_text[] = {
> #ifdef CONFIG_HUGETLB_PAGE
> 	[I(HTLB_BUDDY_PGALLOC)]			= "htlb_buddy_alloc_success",
> 	[I(HTLB_BUDDY_PGALLOC_FAIL)]		= "htlb_buddy_alloc_fail",
> +	[I(HTLB_DISSOLVE)]			= "htlb_dissolve",
> #endif
> #ifdef CONFIG_CMA
> 	[I(CMA_ALLOC_SUCCESS)]			= "cma_alloc_success",
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> -- 
> 2.50.1
> 


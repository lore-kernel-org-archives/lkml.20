Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E8EEC0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486812; cv=none; b=U/AKUu/XFFT8R3mqmqbt17s/p5A0rtRX5xEqnepi/QHFHSAJTi3SBX07ATkYpePEF58kqvOG32chlFW8VD7RxSlJceCcMjdtrlIQGg1HFhykFF8MQ+CC9scgUc++t20ZSq2WkQ2sXbQLXQ8UedUQgVKmty0tFQ+I/yRrbmoDrXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486812; c=relaxed/simple;
	bh=9ppFgse9HoR0WC8oivxH8RRAD2/pDNfZSClt2XRLLyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtDvSOxUDZ6uluBulWccRW3Yp61nhWy+5YWGcjS7MwieBijGrIHk9F5cq+0ehM18EM5WGR0IF54rU7zrIrVf546hPDn4PECe2VDFujSuqxBcFsz4MKCswrDho4LL9ovyDCBb/keS8Q+OWZxSY3DqUr8+ak/KMY6hDcOm6HtVW+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=kNf3pl2d; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kNf3pl2d"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788486806; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=MGWPUgjmVUxtTSwlUvNg2bFsyeXOB8dJnjZI+3J1JLk=;
	b=kNf3pl2dsTWZsvt4P/O2Q9c3qguQp3iLnUyPVBltnq5C6oOXQLd2Yue5jp4YJX0gddFrmz07ft5GGoWiRmVNyUAyqtrCTZNstAGWA4s1qKbgeZsohtqFcLXG2nSdm7wxn6WNTNYu4GwaAYxscoeyp1eY3msOszMog96mbMGN98Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R501e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XAH6eEv_1788486804;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAH6eEv_1788486804 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 09:53:24 +0800
Message-ID: <c1992315-8e2a-45eb-a042-29f1f1725f76@linux.alibaba.com>
Date: Fri, 4 Sep 2026 09:53:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] mm/mglru: move folios from oldest gen to
 second-oldest gen from head to tail
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baoquan.he@linux.dev, chenridong@xiaomi.com,
 david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org, ljs@kernel.org,
 lyugaofei@xiaomi.com, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, stevensd@chromium.org, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 Xueyuan Chen <xueyuan.chen21@gmail.com>
References: <20260901232421.40157-1-baohua@kernel.org>
 <20260901232421.40157-7-baohua@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260901232421.40157-7-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/2/26 7:24 AM, Barry Song (Xiaomi) wrote:
> For reclamation, it makes sense to reclaim folios from tail to
> head, as folios near the head are relatively hot. However, when
> moving folios from the oldest generation to the second-oldest
> generation, using the tail-to-head order would effectively cause
> a cold/hot inversion.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> ---
>   mm/vmscan.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 1907a946840d..76dfa9575852 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -192,11 +192,27 @@ static inline void prefetchw_prev_lru_folio(struct folio *folio,
>   		prefetchw(&prev->flags);
>   	}
>   }
> +
> +static inline void prefetchw_next_lru_folio(struct folio *folio,
> +		struct list_head *base)
> +{
> +	if (folio->lru.next != base) {
> +		struct folio *next;
> +
> +		next = list_entry(folio->lru.next, struct folio, lru);
> +		prefetchw(&next->flags);
> +	}
> +}

You did not mention in the commit message why this prefetch was added. 
Just curious, does it really help performance?

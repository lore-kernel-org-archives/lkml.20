Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830340;
	b=xoKFjJuVlgCiz/6ck72ipVlPis1YYEUFVRgMgZAGGHF1ynDDMoEwcXfiTTmgnIAF9DY9
	 /GgV8oGi3bmN+TKhTadg0OoKTDuX7CRUjFWzh4dCC+6Zv0sJPaH1Mm+I5svbwqRtyYl7k
	 QLCxQg8uL9VnZ27MA+y7sFxV1yBv0hudQ1+qGxFBzWyKU169hF5J4hn6POReXKYUFr+bC
	 nA3xFPbKoPQ7p7xbGtVuMzvJPnDUJ43/y5CVPrXTwALf8QwzFVVs7gDFaC8J2REZoPEFj
	 MG3OyqAtvZmlCFM076anZxTKfCV3bHxm/vGpghrs+1xJHbAYKAhu70l7RwoE0lrp6+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830340;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KWVq0MgAQT8Gj3/maGoqBdOlfWXvORp1oF1E0uhrmv8=;
	b=U93y6hcOiTS07T9HGR0DjDdGTQRss1b1MSUmqS0NHBJyKY0FjEuAaRZjEUTd8XtFYCAd
	 4jozFbxoKuv2Dv2FaNHYDEP6M7Y135RXTBBngcTCxVbfF2/cLl568cHT3Ukd2TeHZIHNE
	 l3lO9B5GB4ks0CCSwWmLyex6vAmbBM3jY9TO/CIvgyc3/dcfpSoOBTPiqxQDGFB5a4GoN
	 oc1wNk09BIKpoyXiukjvSz/CZmryG03AFzvnTGLGNQybbN5FcRdk7kKyXrdiNMkmetzpl
	 W/3N8SayRwGg3OYSwILBM+5yKfbVZB+KKEsdBVpTpwa+Br/BAirIQWv9HBSXDEbILag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vIGdM2HP;
	arc=none smtp.remote-ip=95.215.58.148
Received: from mta1.migadu.com (out-148.mta1.migadu.com [95.215.58.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A6F606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A6F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vIGdM2HP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ly6e+I8kS/n5cbwSdAkWXpNs/8hJgpU5dlKHjyE+Pdk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794830337; v=1; x=1795435137;
 b=vIGdM2HPM2HqqMypxLwCmcglQ9A8eA7pGR7+hoQpDs4GQt7S77dgtb3cFLATMNUJ20ZjaMt8
 414jD3/i1ozlVGXPXixAGgpsNAUA38bJ2CcHK8o5UXoZaKWD/oF5cP0dRXhHaZhrZleIXd99Y7e
 y0qk4/gUXLgy+HWebzcVpFas=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 14d4939e5c5c90bb;
	Mon, 16 Nov 2026 11:58:57 +0000
X-Mizu-Trace-ID: 14d4939e5c5c90bb
X-Migadu-Flow: FLOW_OUT
Message-ID: <4d10c5e1-8805-40b5-8ea2-9fe62dbfc05a@linux.dev>
Date: Mon, 16 Nov 2026 19:58:46 +0800
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
Subject: Re: [PATCH v9 02/16] mm/mglru: extract lruvec_populated_min_seq()
 helper
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baolin.wang@linux.alibaba.com,
 baoquan.he@linux.dev, hannes@cmpxchg.org, hui.zhu@linux.dev,
 kasong@tencent.com, kunwu.chan@gmail.com, liam@infradead.org,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org,
 liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 zhuhui@kylinos.cn, sidchintamaneni@gmail.com
References: <20261114200803.23129-1-baohua@kernel.org>
 <20261114200803.23129-3-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-3-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The search for the oldest populated generation of a type, previously
> embedded in try_to_inc_min_seq(), is extracted into the new
> lruvec_populated_min_seq() helper. It returns the oldest populated seq
> of a given type, bounded by the given max_seq so the search never goes
> beyond it.
> 
> No functional change.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>   mm/vmscan.c | 45 +++++++++++++++++++++++++++++----------------
>   1 file changed, 29 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 400f87fc51e1..ae3e13b1fb27 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3992,30 +3992,45 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>   	return true;
>   }
>   
> +/* Similar to lruvec_evictable_size, return the oldest populated seq of the type */
> +static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, int type,
> +					      unsigned long max_seq)
> +{
> +	int gen, zone;
> +	unsigned long min_seq;
> +	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> +
> +	lockdep_assert_held(&lruvec->lru_lock);
> +
> +	min_seq = READ_ONCE(lrugen->min_seq[type]);
> +	while (min_seq < max_seq) {
> +		gen = lru_gen_from_seq(min_seq);
> +		for (zone = 0; zone < MAX_NR_ZONES; zone++) {
> +			if (!list_empty(&lrugen->folios[gen][type][zone]))
> +				return min_seq;
> +		}
> +		min_seq++;
> +	}
> +
> +	return max_seq;
> +}
> +
>   static void try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
>   {
> -	int gen, type, zone;
> +	int type;
>   	bool seq_inc_flag = false;
>   	struct lru_gen_folio *lrugen = &lruvec->lrugen;
>   	DEFINE_MIN_SEQ(lruvec);
> +	unsigned long seq;
>   
>   	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
>   
> -	/* find the oldest populated generation */
> +	/* Requires at least MIN_NR_GENS gens for basic functionality */
> +	seq = lrugen->max_seq - MIN_NR_GENS;
>   	for_each_evictable_type(type, swappiness) {
> -		while (min_seq[type] + MIN_NR_GENS <= lrugen->max_seq) {
> -			gen = lru_gen_from_seq(min_seq[type]);
> -
> -			for (zone = 0; zone < MAX_NR_ZONES; zone++) {
> -				if (!list_empty(&lrugen->folios[gen][type][zone]))
> -					goto next;
> -			}
> -
> -			min_seq[type]++;
> +		min_seq[type] = lruvec_populated_min_seq(lruvec, type, seq + 1);
> +		if (min_seq[type] > lrugen->min_seq[type])
>   			seq_inc_flag = true;
> -		}
> -next:
> -		;
>   	}
>   
>   	/*
> @@ -4027,8 +4042,6 @@ static void try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
>   
>   	/* see the comment on lru_gen_folio */
>   	if (swappiness && swappiness <= MAX_SWAPPINESS) {
> -		unsigned long seq = lrugen->max_seq - MIN_NR_GENS;
> -
>   		if (min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] < seq)
>   			min_seq[LRU_GEN_ANON] = seq;
>   		else if (min_seq[LRU_GEN_FILE] > seq && min_seq[LRU_GEN_ANON] < seq)

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong


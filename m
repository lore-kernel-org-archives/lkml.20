Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828606;
	b=avvHlqMNaI369s4n1131OsriwhSRm/+B2wUDiun4xwuVpY+9sm3D5XO51QI1kuxcKyPN
	 vsBs3NSrXcVWyaHAArM82GplRDw45s41O6tmEuvGQW2ft+tV/f1vgwK0XYc0pHs+LldPJ
	 BYnxmKuzzaNXhXVXODd6lzn0sNMfIAZM/JBi7VsyrHy0DjhSFRK5lBTFdxpAsivGo4DC5
	 05KtuDFGYTA7woyEFDZhjP/XGsOE7LP8X6MqqM0jEH6m8Ey0SHxNIZECMEcYMJBGEn5wu
	 I2nH9h8eD7a+79tdjTPeHXEOwK6W7rOJVlJ8eXssIHHfQ7hCa0+NTpuoo9q3VzmzOew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828606;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MkYPvtNGN0RhdD/DTofBA5aCK7VL8OaqbvoHLj/J3vY=;
	b=xz7Pinnd2iUrjs1ZRCuIH8qEHchN70uXaMpoEA7V1p0/8lznGcaiKGp3Xmp9oXQBMuwi
	 LxMFEnfrSoTVU8oIMWCYMKKvR9UFioZwLFcnPmADrQ8f1h9Jnrh6y4b4Y1ilIQIRA/uc2
	 gQInRuk4lGVaPQmIZaVwurXtemmsUoMNQcQKuqT/snVoIONv/CjniJo8+HW/nEiX7wObM
	 ii89HFLYAw05sPhxxqm6t8XcaFiqwiMM+4z+kw5P7yTT5E8ituJNa6HlG3VFy5eaYCVVQ
	 Sib1J6Lp2stEIla9xHRdd25cxdH+o80e5faXSibvNm3MARvN2wCpg4ahCzmfsRFHL6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="i2lF6/10";
	arc=none smtp.remote-ip=91.218.175.74
Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CF606A79B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261CF606A79B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i2lF6/10
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ie4RzWFhry2MN3P8FJFlT0JqjLp78vgtKrFUT1SVLWI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794828602; v=1; x=1795433402;
 b=i2lF6/10/tKqW7+jjlsiqUbSErRov+b5YnPW5cXNHPrUh6VD97+SFBon5+ntzEpAiP6/y4nj
 kt4PPLltsQD0+5aq9LENyeXEVOsO+XEMEY4sepT5gPG4/aroL4gboPIhJ5uXQVnYkGPKFpwgPUo
 NDwKtDzMZJKskYI18ybD3SSQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ea6ad778d8d8c0b8;
	Mon, 16 Nov 2026 11:30:02 +0000
X-Mizu-Trace-ID: ea6ad778d8d8c0b8
X-Migadu-Flow: FLOW_OUT
Message-ID: <ec16f79b-3a71-4790-b91e-ea73d361bd16@linux.dev>
Date: Mon, 16 Nov 2026 19:29:52 +0800
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
Subject: Re: [PATCH v9 01/16] mm/mglru: report evictable sizes per type
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
 <20261114200803.23129-2-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-2-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Change lruvec_evictable_size() to return the number of evictable
> anonymous and file pages separately instead of a single total, so
> that callers can weigh the two types independently.
> 
> Update lruvec_is_sizable() and get_nr_to_scan() accordingly; the
> summed totals are unchanged, so there is no functional change.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   mm/vmscan.c | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 46be9c7e967c..400f87fc51e1 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4193,28 +4193,31 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
>   	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
>   }
>   
> -static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int swappiness)
> +static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
> +				  unsigned long nr[])
>   {
>   	int type;
> -	unsigned long seq, total = 0;
> +	unsigned long seq;
>   	struct lru_gen_folio *lrugen = &lruvec->lrugen;
>   	DEFINE_MAX_SEQ(lruvec);
>   	DEFINE_MIN_SEQ(lruvec);
>   
> +	nr[LRU_GEN_ANON] = 0;
> +	nr[LRU_GEN_FILE] = 0;
> +
>   	for_each_evictable_type(type, swappiness) {
>   		for (seq = min_seq[type]; seq <= max_seq; seq++)
> -			total += lruvec_gen_size(lrugen, type, seq);
> +			nr[type] += lruvec_gen_size(lrugen, type, seq);
>   	}
> -
> -	return total;
>   }
>   
>   static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
>   {
> -	unsigned long total;
> +	unsigned long total, sizes[ANON_AND_FILE];
>   	int swappiness = get_swappiness(lruvec, sc);
>   
> -	total = lruvec_evictable_size(lruvec, swappiness);
> +	lruvec_evictable_size(lruvec, swappiness, sizes);
> +	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
>   
>   	/* whether the size is big enough to be helpful */
>   	return total >> sc->priority;
> @@ -5028,7 +5031,7 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
>   static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
>   			   struct mem_cgroup *memcg, int swappiness)
>   {
> -	unsigned long nr_to_scan, evictable;
> +	unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
>   	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
>   
>   	/*
> @@ -5044,7 +5047,8 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
>   			return 0;
>   	}
>   
> -	evictable = lruvec_evictable_size(lruvec, swappiness);
> +	lruvec_evictable_size(lruvec, swappiness, sizes);
> +	evictable = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
>   
>   	nr_to_scan = apply_proportional_protection(memcg, sc, evictable);
>   	nr_to_scan >>= sc->priority;
Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.
-- 
Best regards
Ridong


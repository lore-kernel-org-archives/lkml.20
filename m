Received: from mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F922BFC8F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788070460; cv=none; b=jnpbaMmJaTK30DasbDWHGzp3iUYUZgjrlih/2zHaEGIpwT7flx5rKqzm3Flg5FyU8q5bIVu0+FxO2M5GaonZXy3DYa6/Zt+GHxBSBL/Pr/u6JluhR3VdWnxrU0Mh8ack97tqyTNMP5OKhXQhAM3CeUXDh5hkwqhnZTyoj9qOrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788070460; c=relaxed/simple;
	bh=D7M512+Zt8aa+kANyYA+pnUSN+4DV9TAbeCp6TmwXhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbOtYbsbbWGdHvL1VmTsIHZXA8Mp6bwoXaa/YwoWrUAbMBsjSFosSwCamMWYdpcASkiKUrtYGlwO2YBvISzQ51/S1smCdqvpeCC5+AfT0NLALUaNyNqIPzduIkzKnHziVVqQQ8Fu/as+ZMp7Vpt7B0FJo2wbON+ejbDJr9N8ApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jYp4BpFv; arc=none smtp.client-ip=91.218.175.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jYp4BpFv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D7M512+Zt8aa+kANyYA+pnUSN+4DV9TAbeCp6TmwXhg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788070455; v=1; x=1788675255;
 b=jYp4BpFv9g461RIk0ZiYZdLJyIAmlq3bt0gMsvW+nUkb3sWcF3o5NA+r6eGcQqTFEmhLMps7
 IegYh0AbapwKpTLbrpSMsGUDJ3Si9D88wjaFC8mky7BQVyENnGvu8YOYy2VFGkEnphDZkuY+Ki7
 Tnlgfco1GU3IHOn4D+jLTkhk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8d5b453b29db44de;
	Sun, 30 Aug 2026 06:14:05 +0000
X-Mizu-Trace-ID: 8d5b453b29db44de
X-Migadu-Flow: FLOW_OUT
Message-ID: <d326d37b-4060-4dde-a544-ba71387ea3e3@linux.dev>
Date: Sun, 30 Aug 2026 14:13:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] mm/mglru: exclude folios promoted by aging from
 protected in inc_min_seq()
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 lianux.mm@gmail.com
Cc: axelrasmussen@google.com, baolin.wang@linux.alibaba.com,
 baoquan.he@linux.dev, chenridong@xiaomi.com, david@kernel.org,
 hannes@cmpxchg.org, kasong@tencent.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, lyugaofei@xiaomi.com, mhocko@kernel.org,
 qi.zheng@linux.dev, shakeel.butt@linux.dev, stevensd@chromium.org,
 wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com,
 zhangbo56@xiaomi.com, Xueyuan Chen <xueyuan.chen21@gmail.com>
References: <20260827234704.63163-1-baohua@kernel.org>
 <20260827234704.63163-5-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260827234704.63163-5-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/2026 7:47 AM, Barry Song (Xiaomi) wrote:
> Some folios may have been promoted during aging, so don't count them
> as protected, similar to sort_folio().
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>   mm/vmscan.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index b10d1703d907..2b33d3f44682 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3952,17 +3952,17 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>   			if (gen_increased) {
>   				delta += nr_pages;
>   				list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
> +
> +				/* don't count the workingset being lazily promoted */
> +				if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
> +					int tier = lru_tier_from_refs(refs, workingset);
> +
> +					WRITE_ONCE(lrugen->protected[hist][type][tier],
> +						   lrugen->protected[hist][type][tier] + nr_pages);
> +				}
>   			} else {
>   				list_move(&folio->lru, &lrugen->folios[new_gen][type][zone]);
>   			}
> -			/* don't count the workingset being lazily promoted */
> -			if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
> -				int tier = lru_tier_from_refs(refs, workingset);
> -
> -				WRITE_ONCE(lrugen->protected[hist][type][tier],
> -					   lrugen->protected[hist][type][tier] + nr_pages);
> -			}
> -
>   			if (!--remaining)
>   				break;
>   		}

Reviewd-by: Ridong Chen <ridong.chen@linux.dev>

-- 
Best regards
Ridong


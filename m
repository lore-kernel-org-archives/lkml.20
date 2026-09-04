Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB993E9C2F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557740; cv=none; b=B3kxischPMv1Bsst4xnJep5pcKM+q0ITpGvcqj00+9rWdzhSGfNRCs9CqDAO3R97kMuAF5HnToLI3JhNOmCJzxLuZjrflq8XBT08YifOq7WX4Gp7UNnGNYdRwKuu38A0Qev+fml05nTV7bknLYyidXh4Lg0qX/VqwRfVaYRsMAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557740; c=relaxed/simple;
	bh=TE6/7pMNgS1nsvSVNi8RHdC8GwfOgzuZWlAq9IXHFLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpibq3vDsyPHAe3/yE4S7qj8ufCnufyi7NhV/50DzIUPX2MiQ5IAXUP+VMVXBg4knIn/OuP2FBL7VVEQ6zJWsmlHhfRjUsNQ+6IaijpEVOysMsBduaKY9kZqdc+nZGcirFVw2H9XQavrIfIgaGlNG3g6/1T3vWWzjotJZtGLqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=h36vtbVJ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=YbWIczaH; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="h36vtbVJ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="YbWIczaH"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KZ7T74168701
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 17:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=L/aP
	YyT1Jy/RmfEhEFasDwbK2r6Vj3z/rQBklaXlzNI=; b=h36vtbVJnPBr/57FHUct
	EG1vzQhWbPpsp50Ww0DPKKHUacejmfX4tEXDe9AHJaRXF1UWzQa6CMYBXiIAHgG8
	aMUQTSUTg9jbDTdZVJzcdg+s2p6vfajitccHwSiIa9PmEq6WrpJNAae3d9IhAL/x
	8/KHRVFMEokYsmCh3QcB9/0BYko51C/snMoPCyxaKS4q+5V6a+YX4YBdiPNThh/y
	FCZeFTmEUXFM/5/t9qqpVsS7iouwFlpSXXnbmtGcq//5sh45WZuUCs+YvJ8UIswG
	xf+ZwoXDkRxAlxgKrrgdHlcQkpAg5bEKOvMr++z4CsB1xHSSPilo/EaA0ahkxiKU
	GQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gg0acb7nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:35:37 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e869793d3so34265726d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788557737; x=1789162537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/aPYyT1Jy/RmfEhEFasDwbK2r6Vj3z/rQBklaXlzNI=;
        b=YbWIczaHE/F3NWncSU+Bc4amYDd+OK0EMLo/5I6gL0mQPc5mqXlMt08AhKXE0ZfKpR
         GocvfhGUUUzhbTbf+oc0R6g3wc04R04ZkCEWt0sUBjMAXUbaHJfGlYO7kXdBnjO9Fyrc
         ucIlPvwf8kayQW0HqVJjd3jbTxL+kmpJswe18hA9tNu+FvdeGik3KmBa13KpI8irxkCz
         wDuCS4fnpymMM8Ip+Sq15I5+hgnBVcS9/IVy/Jwauz4TlfZ+5dHn6+dyp9W1tOOYNq6E
         PvGX1VfEwILCrbUlXGpsorwBObvqCYXT4EZgen1riUetKO4G3SbfiE9njuZMZnCX4P1M
         K4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557737; x=1789162537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/aPYyT1Jy/RmfEhEFasDwbK2r6Vj3z/rQBklaXlzNI=;
        b=pUlTUXsI9rOjcVktKl6JFa4/531KahXi/xYcQBjyr7CqV5YNHvz2pBy5WIs+X5SgEh
         uDuhqFa3gyodsLDF6rDSlmCpjM5TdRLJaeehVNygu+/bT+Bmm6pb40BBJRid7+gm/uWS
         /MJnJh8Cm5G0MZj4TlAS3GVYULWCvkZWRlYLP42i785w1G9XAUqbbM48DIoOW97+HPYD
         c58yGoi6KPAEGo4HBg+IM76vHztoJJjUxgKLR1grD6/zw517gN75TaH1Hr0zFhLhANVr
         Sa+Q7CPwJGj4LskO3Sx1+V2Z/72MU67XmMHrVfNHefdOjv4equJaPuWAID0E/9+HEZHq
         jdzA==
X-Forwarded-Encrypted: i=1; AKwUvBznJAGZV73YgAKSlIw///tn/OD/A7t7Jn8mt1GDAX80URjPg/gSog2lK4rx2odz6ZBUauUs3IHFl4BYYIc=@vger.kernel.org
X-Gm-Message-State: AFuF++l75ISG4bfmh+4z4Gge9JDKGChpVBZTrnXZg0evgmoLDAgxh1IV
	liNV2BreUiSKZlh0Jd+itA5vEYIdAF7NaJUSxXpWbh2JIvs3DUuBTEs/ACyYoc47C/PyraLNqYY
	Hb1rescsL6Ia/XPeQ3kOwYzXC/thFCv6GTR+7mbuLhDbt81PKzQMz1ekngxxqYw==
X-Gm-Gg: AYBFou3fwriaF5ozVEbwyvh2PjGjgNlT4J2slKPf2Og5MtiZ75u9slpa6RlzXEqASNw
	FN0KkPWjXvzgeapU25b5kvoQKpMA7zvnTKtqNTR+CTFv8wbiielhqisDq2qWowEGTl+2CpY217B
	yQ2x/VQDfSFW8v09jEqGBX+/P393S3BfjmSPfvgI8+y1VGf0vJEcQCQvIwxJXh4y2eJx+Lku+8C
	aPcdBrwFbAdZ+S1nsPrdyKIT51RypR2A37wpgum7Km+H3UxE2q7BqmdCyCBBtn+NOM6Dt9uYwSx
	3IOC5z8X995l7822oehstoOBNZwdPanWEFU9c5A0z60PRtJF4lQPJm94ZkkTSlyOPfxG0+2TZ9W
	7LwiZ2kHChZOHyGTAz2cRgLO7JQzntTkBqg7saTL1NEGmK8I6tCT5
X-Received: by 2002:a05:622a:130c:b0:52f:e60e:70c3 with SMTP id d75a77b69052e-53054961fddmr94379791cf.24.1788557736739;
        Fri, 04 Sep 2026 14:35:36 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:52f:e60e:70c3 with SMTP id d75a77b69052e-53054961fddmr94378971cf.24.1788557736018;
        Fri, 04 Sep 2026 14:35:36 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-177-158.net.columbia.edu. [128.59.177.158])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305418950fsm29599931cf.20.2026.09.04.14.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:35:35 -0700 (PDT)
Message-ID: <5ac3eb40-2c40-45cf-a5ce-d7dc3a10c491@columbia.edu>
Date: Fri, 4 Sep 2026 17:35:34 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] mm: memcontrol: constify the lruvec helpers
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu>
 <20260902-folio_memcg-const-v1-3-e2c1da22246d@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260902-folio_memcg-const-v1-3-e2c1da22246d@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _8sG2BR1e3qeela_p5TAkdldDNf8HKfx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDIwMCBTYWx0ZWRfX2J+Mm7FJQqLM
 N7Zm3gqguUZ6m8w2pNnPKOdtMcLtYghEybBRWi2Q6MXxpDgTPa1KJDxXepNtTA2aDNN4AtcexaY
 YegMuBYJbFzoZI/wBuSuJrcTAJbMeK+cbko56RVTgVUISIp8BTdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDIwMCBTYWx0ZWRfX/PZ/W4AAyIWT
 l6Sd9VmUHLUm05jitJuQyeEtjwb45hOqslGBfXqgVooTaKWxdho1AVsg2BS4GfkeB/NY1kI3SM2
 ZwC/ZYzqSdSYROAGgSwPwT+zKn2CQY5qeOfZa7n3fJCgdcawBe8sPH4t8R6969FuR8agPFYsXwt
 ifflnEl13eayYYNH5ExQUTdYnXZiWDEB51prkvecjddJsFK3HINmdgb8tET4OzQHOtxU0ctGfOP
 hCm8TccYXbyKKM92M6s1s2p91p9APWUtw/SRBdCEHQDiWAAZPljyNRI4dhIinn+ydFAibcg5Xnv
 Nmx5gabY2zAC0bWCIoOg+TkwZWIWZXAvzeDtutcP2uGqmy7JMaaitzi5hyhtwKp3JrB6/nR08cv
 T/dW4WBSldh4BVNAEDSdh4vLoZxtn52WedDVuFJGyJNMe1gmIm6zky9Q80UlF57W8vBmdUmPq97
 JcMih5XFj8AA4bP6zXQ==
X-Proofpoint-ORIG-GUID: _8sG2BR1e3qeela_p5TAkdldDNf8HKfx
X-Authority-Analysis: v=2.4 cv=a4EAM0SF c=1 sm=1 tr=0 ts=6a9b39a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=tLges04aSNaZGVAfhBIy2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=chcUDXjQMmrNteCdNfIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11896
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=10 lowpriorityscore=10 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040200

On 9/2/26 10:27 PM, Tal Zussman wrote:
> The lruvec lookup helpers only read from the memcg, folio, or lruvec
> they are given. Constify them, along with lruvec_pgdat().
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  include/linux/memcontrol.h | 34 +++++++++++++++++-----------------
>  include/linux/mmzone.h     |  2 +-
>  mm/memcontrol.c            |  6 +++---
>  3 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 2b3b62e84ab2..4b7cc97e45b2 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -688,7 +688,7 @@ void mem_cgroup_migrate(struct folio *old, struct folio *new);
>   * @pgdat combination. This can be the node lruvec, if the memory
>   * controller is disabled.
>   */
> -static inline struct lruvec *mem_cgroup_lruvec(struct mem_cgroup *memcg,
> +static inline struct lruvec *mem_cgroup_lruvec(const struct mem_cgroup *memcg,
>  					       struct pglist_data *pgdat)
>  {
>  	struct mem_cgroup_per_node *mz;

From Sashiko:

[Severity: Medium]
Does this function actually just read from the memcg?

Looking at the rest of mem_cgroup_lruvec() not shown in this diff, it
contains:

     if (unlikely(lruvec->pgdat != pgdat))
         lruvec->pgdat = pgdat;

This mutates the lruvec which is logically part of the memcg's per-node
state.

Since the commit message states these helpers "only read from the memcg",
is it safe to constify this when it can modify the structure on newly
onlined nodes?

Answer:

The write goes to lruvec->pgdat, which is stored in the per-node
structure reached through memcg->nodeinfo[], not in the memcg itself,
so const is fine. I'll clarify the commit message.

> @@ -1528,8 +1528,8 @@ static inline void lruvec_unlock_irqrestore(struct lruvec *lruvec, unsigned long
>  }
>  
>  /* Test requires a stable folio->memcg binding, see folio_memcg() */
> -static inline bool folio_matches_lruvec(struct folio *folio,
> -		struct lruvec *lruvec)
> +static inline bool folio_matches_lruvec(const struct folio *folio,
> +		const struct lruvec *lruvec)
>  {
>  	return lruvec_pgdat(lruvec) == folio_pgdat(folio) &&
>  	       lruvec_memcg(lruvec) == folio_memcg(folio);

From Sashiko:

[Severity: Low]
Were folio_lruvec_relock_irq() and folio_lruvec_relock_irqsave()
intentionally omitted from the constification?

Just below this hunk in include/linux/memcontrol.h, both functions
still take a non-const struct folio pointer:

static inline struct lruvec *folio_lruvec_relock_irq(struct folio *folio,
         struct lruvec *locked_lruvec)

static inline void folio_lruvec_relock_irqsave(struct folio *folio,
         struct lruvec **lruvecp, unsigned long *flags)

Since they only pass the folio along to other now-constified helpers,
should they be updated to maintain API consistency?

Answer:

Will constify their folio as well.


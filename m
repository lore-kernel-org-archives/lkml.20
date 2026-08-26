Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7133F99E3
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767689; cv=none; b=lzDsjoZ8bJHOMhL0+Ygz+TLoJ9wkUCL9Dy8uae9Nf2f6fzh3+uTHHPkoIFNiNw65oRlqpioRK4vMbJUpRkkCknVQC4uRSHnp2EbuBfOb6ka8sRnJprD2mcHnBPuoLEXH4MnzYbOTPvCm8Y4P9xPP8yeF6f1rX1WDNeh87rOznj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767689; c=relaxed/simple;
	bh=tvm5CHSJaD14REcKmQduDh9wpbsPFiNGEpPLcDso0kE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SWZImMWUqd6XuJD29OnvtYu9UICCWuLU3yGUBCvyHn+QhC72nupZGNmzOFBsnMvrP6wW54c5ls02Zwm05knnnKSTk/RitFKLq6ZvMlY7CszrgIzeXaFASc6ut/jC0CWTNxmxVeJi/QdUukIAzb8UhsM7/PW8+PWZmZ8YMGMjfPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLiR3ZLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcFKMlhZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLiR3ZLh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcFKMlhZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGulxe2548733
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p46+lTGQMwY0s7h5NS8WStt9mOrENqE7hJSRqtkar3g=; b=aLiR3ZLhebvh8vtS
	LF8J6BALZvXuDZH7Xekd3l8kcEJrbLgb3M9sNi/6a54NcjQHbMlOpfgLTyQdNTGn
	wrbryI6xKIdl/bXfScdF8GgsB9UZ4ai9jCP62vfcFstt1eafajBYy2D6NwCKNB+O
	3zxN4R6Zf5GDeERFVuaGyy8Mxty4+o94P+koJlmr2SmPu4RczoIFyg1N+8FY4jKn
	zdWCvbxeVfP4pao3HI0Qy9hrPUtAEhq2YRRHmFtKLDbIAhOIf2CO7M2GMyvQf0yM
	7oRQW2Qs/d9T80vQGQMAf01oCC+WxkwIa7shnKQYTwaOFMFx31GciVJEI7QG8KaW
	Fx6oxA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1tjnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:07:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39640eebc57so2724025a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787767674; x=1788372474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p46+lTGQMwY0s7h5NS8WStt9mOrENqE7hJSRqtkar3g=;
        b=UcFKMlhZQ/qaOKGIp5Kqrjox4cinquh/7SFMdpen+FtqxlsyUXUZOs9leSMv2yXn7/
         BmLd3/jHN0FRDvwV6wrosnxjArpkFNmVZG7bjHSy+s9XHCra7gxJmGHNpkPVwgtmLjZt
         gUGAlmgPqCPJPGpUO2w7c50fe4z8rpEIhoVhsif9tq8vRQ1VpT61R+JdR6gtUCQbanoY
         3/PJmuy+M6vIVAraLc/1jl5aoI14+FzlRRlOGtkDrqy000onMxn2AfPea90K6lJxCN4+
         xyEkOG1qKn7SbFxGroX52C984jaQJn7yvhosRhqiHmY20SsB59OaHBu8LbK0zVey/P0v
         eGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767674; x=1788372474;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p46+lTGQMwY0s7h5NS8WStt9mOrENqE7hJSRqtkar3g=;
        b=AxBF7jXpVGSiC1xgX3n7LYrkdjSF2esPKeMaFnODlfWEKqT2xWZrz+XQS9gfYBqE+5
         XIrssAh9DHPYSLlbrM9qxSWx0/J6PkuenoZyGpVqpX6ArnDD6cUM6rSLlpIS44MLQwxa
         dWQLZkxKKUCsPfc7DQey+R1SB6yy5Fxr8XcvJFddASXkayLbEohESzvO/N7PbxF+C5SL
         oi6nNA5BI46wnnUJlp2APIdez6etRdwwgtqrUgpyUnNvF/YNt/SH7yH7W/p1tNZOft9t
         hUMMSRMbYnbVvxsOyZ06Nx7JHKv5dCnO84we04b44QFxH9gwZjw9ZQQUXYS/aYrtempm
         oFrg==
X-Forwarded-Encrypted: i=1; AHgh+RootD4yDKqHFmUU06jVqiPZA8Bv3Eli6KWSatY85QSpbaH3T8gs456hroYePIYjSdGS0mCE4FrE1YJrR48=@vger.kernel.org
X-Gm-Message-State: AFuF++lJFm6F6860H9NwJVtEw9WLHLuaDy8ypjM9N9dfc9nDyaF/gXEh
	qYejSBA4GJCkAqDFYw1LnQV7yZuK05uC+1YGpqXakZ+G0kUI4mMBEj3O2BZjir/1pRGgqHCWGx7
	sXElOHcuKdk5YlSeg/fRaXKYiQ2v2RcWx3v2w30i5QZeGo0lUqPorj0i8UZGZcUSk5aw=
X-Gm-Gg: AR+sD12BIZsJsQp6jeQHoI7GkHhoB0pcdeDp/IpOT4lQWBI3/pVRPxptO1VR0J06tyn
	IaoenKyNkuLcvv5LzOuqa9tgUbcAbD4pKpbxCr3bdQJS45aZm9Glp7zl6KbzV7LfI4CM5F1gU29
	nfcUbFqEuDwWrAABGlChbKZp+zdma1twwe5hen1hqFD70WqaDagx4SEvJpSYinTttWBfzqiH466
	w0VuVFWErbXstRC7NlhoIzxhOJrxj1isMK8jguF86Fa0sxPIm/WES6ajjyJa1JQgBK/h0kGy7Br
	BwZaNfbvFIRZG/yXGgWSlzhLL6VWzFQBrPnJcL8KTgTFMYT5bAAUnCiuW/klKu0eAgMCMvqc4kO
	tNRBm8wl1AA5tee5a2cmUaTPI1oIlh/Q=
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr19248010a91.9.1787767674033;
        Wed, 26 Aug 2026 11:07:54 -0700 (PDT)
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr19247889a91.9.1787767673444;
        Wed, 26 Aug 2026 11:07:53 -0700 (PDT)
Received: from [192.168.0.3] ([183.83.139.169])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eedd13sm9353803c88.1.2026.08.26.11.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 11:07:53 -0700 (PDT)
Message-ID: <b1df5856-2cca-4ba6-8200-f71bcaa1d62b@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:37:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ketan Kishore <ketan.kishore@oss.qualcomm.com>
Subject: Re: [PATCH v2] mm/mglru: fix and remove redundant unevictable folio
 handling
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Suleiman Souhlal <suleiman@google.com>,
        "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
        Yu Zhao <yuzhao@google.com>, Steven Barrett <steven@liquorix.net>,
        Brian Geffon <bgeffon@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Kairui Song <ryncsn@gmail.com>, linux-kernel@vger.kernel.org,
        prakash.gupta@oss.qualcomm.com
References: <20260812-mglru-mlock-fix-v2-1-a3fec5853c08@tencent.com>
Content-Language: en-US
In-Reply-To: <20260812-mglru-mlock-fix-v2-1-a3fec5853c08@tencent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GxEylXUeKnRW6bOAc8WxK5EaO9EDFkqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1MSBTYWx0ZWRfX6nTWlW5u+ABi
 6scfgFAdJkw0n+uIqm0HFAsswtluYBE6xEJYz2WNTUUVnymV+vLp/FsvDFLdy8L5Ph+EEfCr4v/
 CowdivgVxMv6+0WQfRt6PmVb1GF/UW2d3aRyC+7jpBctxM0rCSZYf2P8s2TNKY22W1fbUEpXCvO
 eSlCvsGIxg4E6R0M4qkLeoYLLyheSzm736nMH7kl1wuHTUnrR/rIlKgafO3xPMfehAw/zCTfhkH
 yxl4wMQsezsuiy988Cq5uGcZt2Ty1unild3pKmHnHZSl8qyHcZT6ieKTczbYCnJyYmBfrlkgXko
 NndvIQwXJo6TocEv5A/ZTjIWN92M2acsnBylinKM4PEGYtNud+U17G9N4sOLXojpOsBUNZBNmW9
 hSjSt35fLYxJQzKq7FcyPzrS6lsqLMG6JHD5s1Zv/aAXBrO5NZL2yqhY6zprIphJHT8pb09/2zY
 LTYfF9h0FW+j1koIamA==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8f2b7a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JBlIGz/oWaLJr6gz78UtDQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=GvQkQWPkAAAA:8
 a=2LXwFEv-GKRroJ71e4UA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: GxEylXUeKnRW6bOAc8WxK5EaO9EDFkqe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1MSBTYWx0ZWRfX+9NMRvrVyjUh
 F1dsU0LNVwsG/eOs91S456cOoXG+5h/q2IHHg+mHvLOJ7DkrzpXxMjR6Bcqf2HkcGMDizz3ijSu
 jnTw2T1N0o8IPdSUBbR8UEAhNhQs24g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260151



On 8/12/2026 5:52 PM, Kairui Song wrote:
> sort_folio() has a shortcut for moving folios that are no longer
> evictable but are still sitting on a generation list.  However, this
> shortcut is buggy.  It does not follow the PG_lru usage convention,
> and it has a more serious issue.
> 
> Unevictable folios are not threaded on lists[LRU_UNEVICTABLE], so that
> folio->lru can be reused to hold folio->mlock_count (see the comment in
> lruvec_init()).  Hence lruvec_add_folio() skips the list_add() for them,
> and every other place that turns a folio unevictable initialises
> mlock_count explicitly: lru_add() sets it to 0, __mlock_folio() and
> __mlock_new_folio() set it to !!folio_test_mlocked(folio).
> sort_folio() sets nothing, and the lru_gen_del_folio() right above it
> may have already poisoned folio->lru via list_del(), so mlock_count
> ends up aliasing LIST_POISON2, which reads as 0x122, i.e. 290.  The
> result is user visible.  On munlock, __munlock_folio() decrements that
> bogus count, finds it still non-zero and bails out before clearing
> PG_mlocked, so the folio remains unevictable and the Mlocked
> accounting stays inflated until the folio is freed.
> 
> The shortcut also touches the LRU flags in the wrong order.  It calls
> lru_gen_del_folio() while PG_lru is still set, so a concurrent
> folio_test_clear_lru() (e.g. compaction, folio_isolate_lru()) can
> succeed on a folio that has already been taken off the generation list,
> which may lead to unexpected behavior.
> 
> So fix it by isolating them as common folios and letting the generic
> shrink path cull them. This matches the classical LRU behavior, and
> there should be no visible effect on the generic eviction or isolation
> behavior.
> 
> There is no performance concern either, such a folio goes through this
> once, and then it is off the generation lists for good.
> 
> Fixes: ac35a4902374 ("mm: multi-gen LRU: minimal implementation")
> Signed-off-by: Kairui Song <kasong@tencent.com>

We reported an issue with evict_folios() at
https://lore.kernel.org/all/20260807-evict_folios_race-v1-1-b167c6b4cfde@oss.qualcomm.com/
with the following trace:

   list_del corruption. prev->next should be fffffffeead4fbc8,
   but was ffffeafeead44188. (prev=fffffffee4fc4c08)
   kernel BUG at lib/list_debug.c:64!
   Call trace:
    __list_del_entry_valid_or_report+0x100/0x14c
    evict_folios+0x145c/0x16dc
    try_to_shrink_lruvec+0x228/0x35c
    shrink_one+0x94/0x158
    shrink_many+0x1c8/0x1f4
    lru_gen_shrink_node+0x94/0x110
    shrink_node+0x468/0x8b4
    balance_pgdat+0x4f0/0x9a0
    kswapd+0x268/0x470

Our v1 fix wrapped the folio_putback_lru() call in evict_folios() with
lruvec->lru_lock. That introduced a self-deadlock: folio_putback_lru()
-> folio_add_lru() can synchronously reach folio_batch_move_lru() ->
folio_lruvec_relock_irqsave().

We had a v2 in progress that instead tracks whether any
unevictable folio was returned via folio_putback_lru() in the lockless
section, and calls lru_add_drain_all() before move_folios_to_lru() only
when needed, to flush all per-CPU LRU-add batches and close the race
window without ever holding lru_lock across folio_putback_lru().

Your patch fixes the same underlying race through a simpler route:
removing the unevictable shortcut in sort_folio() and no longer
special-casing unevictable folios in evict_folios() lets them fall
through to move_folios_to_lru(), which already drops lru_lock before
calling folio_putback_lru() for them. That sidesteps the lock-ordering
hazard entirely and avoids the need for an explicit drain.

Reviewed-by: Ketan Kishore <ketan.kishore@oss.qualcomm.com>

> ---
> Changes in v2:
> - Proactively bypass MGLRU pid protection and lazy promotion to avoid
>    hot unevcitable folios staying on list for a long time.
> - Link to v1: https://patch.msgid.link/20260811-mglru-mlock-fix-v1-1-8b2321d0e1d3@tencent.com
> ---
>   mm/vmscan.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 3194da7dcc79..ca2b926520ea 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4648,7 +4648,6 @@ void lru_gen_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent,
>   static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc,
>   		       int tier_idx)
>   {
> -	bool success;
>   	int gen = folio_lru_gen(folio);
>   	int type = folio_is_file_lru(folio);
>   	int zone = folio_zonenum(folio);
> @@ -4660,15 +4659,9 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
>   
>   	VM_WARN_ON_ONCE_FOLIO(gen >= MAX_NR_GENS, folio);
>   
> -	/* unevictable */
> -	if (!folio_evictable(folio)) {
> -		success = lru_gen_del_folio(lruvec, folio, true);
> -		VM_WARN_ON_ONCE_FOLIO(!success, folio);
> -		folio_set_unevictable(folio);
> -		lruvec_add_folio(lruvec, folio);
> -		__count_vm_events(UNEVICTABLE_PGCULLED, delta);
> -		return true;
> -	}
> +	/* unevictable: let it through and the generic path will cull it */
> +	if (!folio_evictable(folio))
> +		return false;
>   
>   	/* promoted */
>   	if (gen != lru_gen_from_seq(lrugen->min_seq[type])) {
> @@ -4921,11 +4914,9 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   	list_for_each_entry_safe_reverse(folio, next, &list, lru) {
>   		DEFINE_MIN_SEQ(lruvec);
>   
> -		if (!folio_evictable(folio)) {
> -			list_del(&folio->lru);
> -			folio_putback_lru(folio);
> +		/* move_folios_to_lru() culls unevictable folios via folio_putback_lru() */
> +		if (!folio_evictable(folio))
>   			continue;
> -		}
>   
>   		/* retry folios that may have missed folio_rotate_reclaimable() */
>   		if (!skip_retry && !folio_test_active(folio) && !folio_mapped(folio) &&
> 
> ---
> base-commit: 1029098ee3275ea5b78e329ce132262affa2f8cc
> change-id: 20260811-mglru-mlock-fix-20d8f8d4847a
> 
> Best regards,
> --
> Kairui Song <kasong@tencent.com>
> 




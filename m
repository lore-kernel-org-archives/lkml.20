Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAE958E2D6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656280; cv=none; b=N64YVKG8P1eu3QwX6JUAFuU/kfmzDwQjl4nGSmqCeOX93jSjwhu2GcPJDVEoIb3F64SGnfGVA03BquqdiRZoxKoRPVrK68Rip352xzMfZRU52LhScnsaUvtF5UTCrVEvrzvMw2dLuRTlsSY3ED8RLTcpZejekr+A/9pwcpfDG3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656280; c=relaxed/simple;
	bh=L0jOHxxKNdjxHupbT6eiicRsacK8w3vHEPvNN5WP+8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CIEUCIJmLxHV5iKUK7Sw1U4UvlRsB7gTSuiiQsLJZakIf4t2PbG9trnhMzXqu0VXhVHg/iqGcs41e98GDfR4DefiB1TcdGyu7Bj13+KtCHXzr35UiuwsWRh9g65fq7BoW5ZTUkP94Nx2UdS/+KNMi0BuVEc2w/RbJ6ExBjS0it8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei-partners.com; spf=pass smtp.mailfrom=huawei-partners.com; dkim=pass (1024-bit key) header.d=huawei-partners.com header.i=@huawei-partners.com header.b=RScLDk2o; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei-partners.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei-partners.com header.i=@huawei-partners.com header.b="RScLDk2o"
dkim-signature: v=1; a=rsa-sha256; d=huawei-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=r6sH0YRnOsx9ADT5cVOZaWbkhNPDhNeBUllgAggui2w=;
	b=RScLDk2onGX0+mDgTvLhod536XLzUT92fXxoV9S/M1qsKC+Iwo09H3jDk2nl0+PkGiJlCffn1
	ubuaGkO1Dfhlvzq6oDpmHEdXyOBEhPxdXt+1Tx7WDijYrh0Oj/kHhYwRpuVRz1hV1ima/1u60um
	dNvKth28CBCEejisxJPMl3o=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hlz6B6ZxWzHnHJt;
	Thu, 17 Sep 2026 22:44:02 +0800 (CST)
Received: from mscpeml500003.china.huawei.com (unknown [7.188.49.51])
	by mail.maildlp.com (Postfix) with ESMTPS id 91CFC40571;
	Thu, 17 Sep 2026 22:44:19 +0800 (CST)
Received: from [10.123.123.154] (10.123.123.154) by
 mscpeml500003.china.huawei.com (7.188.49.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 17:44:19 +0300
Message-ID: <643b7cce-cfb4-461b-9e4f-89439ee7eee3@huawei-partners.com>
Date: Thu, 17 Sep 2026 17:44:18 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mm/damon/core: use mult_frac() in
 damon_feed_loop_next_input()
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
CC: <damon@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
References: <20260917142210.90829-1-sj@kernel.org>
 <20260917142210.90829-4-sj@kernel.org>
Content-Language: en-US
From: Gutierrez Asier <gutierrez.asier@huawei-partners.com>
In-Reply-To: <20260917142210.90829-4-sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: mscpeml500004.china.huawei.com (7.188.26.250) To
 mscpeml500003.china.huawei.com (7.188.49.51)



On 9/17/2026 5:22 PM, SJ Park wrote:
> damon_feed_loop_next_input() does its best effort overflow protection.
> score_goal_diff is always smaller than goal (10,000).  Hence the
> calculation can be replaced to use mult_frac() without concerning the
> overflow.  Use mult_frac().
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/core.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index de46072dc1a2f..bc41ac7ecca43 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2927,11 +2927,7 @@ static unsigned long damon_feed_loop_next_input(unsigned long last_input,
>  		return min_input;
>  
>  	score_goal_diff = abs_diff(score, goal);
> -
> -	if (last_input < ULONG_MAX / score_goal_diff)
> -		compensation = last_input * score_goal_diff / goal;
> -	else
> -		compensation = last_input / goal * score_goal_diff;
> +	compensation = mult_frac(last_input, score_goal_diff, goal);
>  
>  	if (over_achieving)
>  		return max(last_input - compensation, min_input);
LGTM

Reviewed-by: Asier Gutierrez <gutierrez.asier@huawei-partners.com>


-- 
Asier Gutierrez
Huawei


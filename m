Received: from mail-m49219.qiye.163.com (mail-m49219.qiye.163.com [45.254.49.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903A4457D3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856250; cv=none; b=UOG63/pQT4dv6Q9uDbreIJT0hjyramhn45548vRTC0MR0Q+Thjblkr0Eq2exFTDGLUViIFuKgPKrQY1Eefsfdo5VCYMoVFtfNaIh76JOlcg0PhbOrBq+ghzdnv8vtjqjepck4lp0oxDnSBZWZW3uRO1Ifa3C0U7QkSr4V/XhbAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856250; c=relaxed/simple;
	bh=TVXh6FPIytJkSq1XeqZ273eDS5qzmd9QohvI/NXzOtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9Dd4g26BAuDCniPbRZ+XOOv5BytK7fwRKsfQgW9Hdo6DE7R4qH8uW+iHhRqdHJ7ASEQnhMdY+QYhM6UyNbtPOQrhFpb6ZmQP1PgbZ5LpZ/CIJgODrwYo4xBkige7RW31gtA2xV1LurYyLCCpvOw7uo/NaQw6ZJ5rF8xgXqkDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; dkim=pass (1024-bit key) header.d=hj-micro.com header.i=@hj-micro.com header.b=AkdnegVY; arc=none smtp.client-ip=45.254.49.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hj-micro.com header.i=@hj-micro.com header.b="AkdnegVY"
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cf30c434;
	Tue, 8 Sep 2026 16:15:15 +0800 (GMT+08:00)
Message-ID: <f97fa5ae-3535-4e1a-a164-77138a93cc89@hj-micro.com>
Date: Tue, 8 Sep 2026 16:15:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to
 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
To: will@kernel.org, robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peter.du@hj-micro.com, andy.xu@hj-micro.com,
 allen.wang@hj-micro.com
References: <20260819105443.668784-1-allen.wang@hj-micro.com>
Content-Language: en-US
From: "allen.wang" <allen.wang@hj-micro.com>
In-Reply-To: <20260819105443.668784-1-allen.wang@hj-micro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa08015ea9009d8kunmfb7445f2344b93
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUIYVk9MGUIaSx5PHR0ZGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=AkdnegVYqDHiMZ5MObs6s/Wj5cJxR1D0LLQy0bRB+QuK+ZNrzqXA15I66PsSqwv9guPEaB1m+7qRXfqp4k5atrNe6OIxn1S8n+VlnV4R8bwSmG1i8vdzh8383Qr8KHu6CWcoMfHNIE8NrqG+UGlJzwC9h/c8IqCb1aYfmWzofUI=; c=relaxed/relaxed; s=default; d=hj-micro.com; v=1;
	bh=HodnylibrZqGPAki3DhMLi+kPd5I6p19FhJfJww+nnc=;
	h=date:mime-version:subject:message-id:from;

Hi,

Gentle ping on this patch.

Could someone please review it when time permits?

Thanks!
Allen

On 8/19/2026 6:54 PM, Shouping Wang wrote:
> When MXP_MULTIPLE_DTM_EN is TRUE, each DTM will monitor at most
> two device ports. In this case, {wp_dev_sel2, wp_dev_sel} will
> only use values 2'b00 and 2'b01 per DTM.
> 
> Previously the setting allowed values beyond the supported range
> per DTM, which could cause each DTM to select invalid ports when
> MXP_MULTIPLE_DTM_EN is TRUE.
> 
> Fix this by applying `dev %= 2` to clamp the selection value to
> the valid range when MXP_MULTIPLE_DTM_EN is TRUE.
> 
> Fixes: 60d1504070c2 ("perf/arm-cmn: Support new IP features")
> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
> ---
>  drivers/perf/arm-cmn.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 40c05c519a1d..13ccbf2a7345 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -1392,6 +1392,7 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
>  
>  static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>  {
> +	struct arm_cmn *cmn = to_cmn(event->pmu);
>  	u32 config;
>  	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
>  	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
> @@ -1404,6 +1405,9 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>  	if (is_cmn600)
>  		grp &= 1;
>  
> +	if (cmn->multi_dtm)
> +		dev %=  2;
> +
>  	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
>  		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
>  		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |


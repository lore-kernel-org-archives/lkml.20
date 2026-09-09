Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A254957D22F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970748; cv=none; b=LPt/ngbqOrEIDHjy/p7yfyZPHxoPrxDfijXkC08ij1DJd1FDYqA3tcUqfXiO2O4Pu38l/szTmbW9uKisS8FgD5BaWpKzmpMUIA9QiSAOMsGtqSv0VK+3Qbes6w7FIaACcFK0TAx4C8zAqiHYKcfjsmn98+KGe05E4fxtIC/iHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970748; c=relaxed/simple;
	bh=sNl01wYfVmtWRGiTAfaWvA0bgs2vxHpkcP2rJB+nGPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHgvS+eXkwMARX8xJRiSc2cuS+5HdWIxY9aO9Fn/ruElwd1/KdjyAvN/yIezO37b1ZIXVB/FDRpMMZ2vZAvs6NmaHcMQ/m4kwhxNr6m9Clik390HMwRdbWTTsHS911L3KMb8y4goveLpbMqMEIjrNC9x/gD+Y2tq+XE1zP/0gwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nKVXyx90; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nKVXyx90"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAB2D1570;
	Wed,  9 Sep 2026 09:19:00 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 704AD3F7B4;
	Wed,  9 Sep 2026 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788970744; bh=sNl01wYfVmtWRGiTAfaWvA0bgs2vxHpkcP2rJB+nGPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nKVXyx90ODUZ0WIJfhwgNyVL6A/WyzuXJXV+JFGdEEu7jWfbfBQg0XSKTzdofE5w/
	 MnrJypXMSSS4iCWhf98F9Dk4drRXNiMg15RPj72U8kcVnlV/8IYGzcC5VNas02aFCK
	 i4wxJOrZEeK1Fja4zWiTwRiqbI1uFZG+/8HWojR8=
Message-ID: <2fb3bda7-cd64-4dc0-99f8-c0fda8d42cf9@arm.com>
Date: Wed, 9 Sep 2026 17:19:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to
 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
To: Shouping Wang <allen.wang@hj-micro.com>, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peter.du@hj-micro.com, andy.xu@hj-micro.com
References: <20260819105443.668784-1-allen.wang@hj-micro.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260819105443.668784-1-allen.wang@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2026 11:54 am, Shouping Wang wrote:
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
>   drivers/perf/arm-cmn.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 40c05c519a1d..13ccbf2a7345 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -1392,6 +1392,7 @@ static void arm_cmn_claim_wp_idx(struct arm_cmn_dtm *dtm,
>   
>   static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>   {
> +	struct arm_cmn *cmn = to_cmn(event->pmu);

Nit: may as well refactor the is_cmn600 condition to reference cmn->part 
directly too.

>   	u32 config;
>   	u32 dev = CMN_EVENT_WP_DEV_SEL(event);
>   	u32 chn = CMN_EVENT_WP_CHN_SEL(event);
> @@ -1404,6 +1405,9 @@ static u32 arm_cmn_wp_config(struct perf_event *event, int wp_idx)
>   	if (is_cmn600)
>   		grp &= 1;
>   
> +	if (cmn->multi_dtm)
> +		dev %=  2;
> +

Let's just make the whole setting of CMN_DTM_WPn_CONFIG_WP_DEV_SEL2 
conditional on !multi_dtm, like for exclusive and combine further down 
(note that the CMN-600 "grp &= 1" is different, since that's more about 
sanitising invalid input values rather than the register encoding itself.)

Thanks,
Robin.

>   	config = FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
>   		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |


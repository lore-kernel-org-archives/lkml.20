Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764815;
	b=TSwjQass/yRpm03yBRS0+Osx0HvLjfWTNSF8QX6nq5EOkEwC2+/7aOdB09764q4suBLD
	 dNJJp4OtwiReYBAlyQoeXxH/R4YYXLwOA1CtE+dlcKmog6LWZg7oxzF/vbp3zbRq1FkV2
	 TuzfzCb/7TeO4wUDUSmKx4jB9IZIlwGW+cyX2xTDiQvVAEkn9qHdnapAyzd84gA8UP4qe
	 6WzqfSwViBoFsS3HCD4uzIv6WwG5tYIkoV4fXhY2Lt+iUTx+6IvVrQbh1ZG4C4W3y6Vvk
	 WiA4ra/bTmclmyQM6gbfhKMM492ffViTvHg/PwY+Yxz1xGcX9bEF8qrGE1bG9xbnJgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JsH8SNCxhbeLoCinL6Hb4gIpMGSz+nZ2pNrnlE7TQjQ=;
	b=tv6ha0aWo3XXBynn10sw5zHQZE+SveuawNLCztiW9NCvn6VHnkx6vThYiV8r9upY3H9a
	 TpoDFDQQJFHWlIetvR+mMVIgZBwnKiTzLAvVh44jF7+qYxzGQ3HX7uGSZqkrZyxFHuWJV
	 yPiX9mxNTu9oPhElDm1KRRZRY8jth9f97esXR5DEUXMB6mjvN2BFGVzcBqpDXayCe+KYE
	 eSywBqt7Y5LXbQa0ZTwgV2EHc6jJIJitMqOixDTJ1qGejB4MZ/CuW1EB8iZI1XBC6vE8f
	 5Pc76KusW/cF28YwqWGdg4SDPqOJSqx4l6VGo79Spo7ZubOUYTZrMtY7X2PyYLAlVCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ohf+ILZu;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EF606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ohf+ILZu
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1091146a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764813; x=1793369613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsH8SNCxhbeLoCinL6Hb4gIpMGSz+nZ2pNrnlE7TQjQ=;
        b=Ohf+ILZuTuqqsWh3ip029KlNrB42M8sRA23kJYWis8tGVgMjAVRSv5QR8I+xmQn8S3
         RPmHyAd4g5ZldCRmORKUpkqJs8qLPMN40yvngjGbMdkrg0APqO1B8ETubgLDbjGIScPz
         CHIaK8X/YkqLVdfy9s22ju0Va3qgEzfuQa5L7+KKuvw8na/NhsktzTPsVjTvsTC49xU3
         UaNRrHrWdsHJgPmZ9402Jd4mJ51AFw/n4yThqfrgjEdP9eM4Ol+z5lzvLdfIL1gw5KCO
         odxnk8wGCq4rIdQSoUSDc+FdZ2JzYJQfTBo/iofw11yA4MYnGk5jOs8FtU3/d1ydSWdt
         /N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764813; x=1793369613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsH8SNCxhbeLoCinL6Hb4gIpMGSz+nZ2pNrnlE7TQjQ=;
        b=q0fBEvV2gBLb0VRzu8kMPC47Kc4V2mY39LmTqkuUC3zr8whQ1HX241QAw/56v3tCk1
         IIVOv1/UiC1gvb9N5a9/wQ+KWJMw7R/2mu2oQT1G44AKFVfyDYu7iMmUsusmhiXQHgTk
         Pox+cubTgm8yBDi16jzlHcI0gYqf+XyQeq2sh/tnm8WBltJ98Y/E8F+JzWZzAMCrx39t
         Tbku3n+3ZoBG/+kAtRxZpATzYWF2guFyzQe55pwCETg0BZTik7u+zm/UGUJy3KCHCw48
         plOP5yAWO0dj9U8HFlwN8VMZNgRvc4rsdf3Cagc6xd7D10iO48owkgTv3XAOm8fOrwZ4
         WyMA==
X-Gm-Message-State: AFq9FYK3ITchG0xF+749/H5KL/5sWst0XU3wcOAqVBA8ZvpbmBfHhoLO
	5v8O2e0T1i6iwsk9LyGsnoI253mfsRuGZEJvizgOwamIK3rDjdKdG6Ru
X-Gm-Gg: AYBFou3J8gkpQq7baeLDryElRU1XYnOXSaU3um5dNs71U5Sfn8he479FeStV7GsG/T8
	SH950nznjvC+tUpX8EvN6LJDAyMmxvod3d5oM58JkvJ6A6HGlzed2SPxbm+hjBfx9vEQLPx6ur4
	wR46qbHmAM+qzCyvmRxAxB9DaF96/GbBbpq1oFUXZsx2Tt4WJwLsaaM4mNxiXWeOGrZn/2SjJYs
	IGdM0LAbOT/ZPRvhRqHWI3u982HK+NJvxVAIQXouVTeq4FxW4kbFxXXhMZQ6I1w8b9RxOlAHzd2
	x5pA4f9CmXZ/es4WpdaeyOK1wM7tIt0jjnGZtKj6QA7wqaW1Y+G7Iho/ki8bRN6y7rIlDFaOCvC
	0268TL0Zet8UOsTy4N3t608FczPE4q87OJo2EMelYRqTEQ6Me4zzHiKQ8BLU3Az0q0FhsHlsvON
	GdnX5XpGUiTvtECZMfsv7fDPKuS2tGcGPq/e4VNfLKe3nZEV4ZYMxW3GPh/fyVjRSUlqnuGeYPz
	PtFkO7eI/pJEbW6oaSRLOG/2Bqm1ceoxJlNCMTbS8lmbOXa9yy5mVsd4aSr4Dqgo36mqwg2QhJK
X-Received: by 2002:a17:90b:39b0:b0:3ad:6781:da66 with SMTP id 98e67ed59e1d1-3adcdf97f7cmr1890604a91.23.1792764813453;
        Fri, 23 Oct 2026 07:13:33 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:1151:5fc2:5d3a:5838? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2a132f6sm1233313a91.3.2026.10.23.07.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:13:32 -0700 (PDT)
Message-ID: <97b60bc2-85a5-4830-a510-e0aa9a0ccbb6@gmail.com>
Date: Fri, 23 Oct 2026 22:13:26 +0800
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
Subject: Re: [PATCH v4] platform/x86: bitland-mifs-wmi: Fix TM2107 profile
 handling
To: Matias Civadda <matias.civadda2342001@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ilya.gladyshev@linux.dev,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org, chris@miget.com
References: <20261022150221.26879-1-matias.civadda2342001@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261022150221.26879-1-matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 23:02, Matias Civadda wrote:
> The TIMI Redmi Book Pro 14 2022 (TM2107) stores the MIFS WMI return
> code at the end of the response and uses different profile values:
> 0 for performance, 1 for balanced and 2 for low power.
>
> Add a DMI entry using the existing quirks infrastructure to select
> the correct response layout and profile mapping.
>
> Skip the adapter-type query on this model to allow performance mode
> with its USB-C charger, while retaining the external-power check.
>
> Signed-off-by: Matias Civadda <matias.civadda2342001@gmail.com>
> ---
> This patch applies on top of all patches of Mingyou Chen's v13
> series:
> https://lore.kernel.org/all/20261021123414.25516-1-qby140326@gmail.com/
>
> Changes in v4:
> - Rebase onto Mingyou Chen's complete v13 series.
> - Drop the separate payload copy fix, which is included in v13.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a4c341ffbb9b..59b930ef8729 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -116,7 +116,28 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2107_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,   2 },
> +	{ PLATFORM_PROFILE_BALANCED,    1 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 0 },
> +};
> +
> +static const struct bitland_mifs_quirks tm2107_quirks = {
> +	.profile_entries = tm2107_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2107_profile_entries),
> +	.return_code_at_end = true,
> +	.skip_ac_type_check = true,
> +};
> +
>   static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
> +		},
> +		.driver_data = (void *)&tm2107_quirks,
> +	},
>   	{}
>   };
Reviewed-by: Mingyou Chen <qby140326@gmail.com>
>   
>
> base-commit: 893018d51f27ec0449155b0afe371aaf65380630
> prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
> prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
> prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
> prerequisite-patch-id: 2bbb1371b506f5a07a1e6e69d34217195cd5ffcb
> prerequisite-patch-id: b88e60d7915ad055b67478359bd9c6c9482d8433
> prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
> prerequisite-patch-id: fbf70405992dfa75ed02026d97aa16e1644fbd42

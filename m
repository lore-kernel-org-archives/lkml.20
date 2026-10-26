Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006562;
	b=3uPPt2JKkuUD8OiHxi7BGYGuCsg6Ayzfpy/XvaQ+juWnPXChUa20ibajiq1/LA7lovs7
	 ZxGRVhjh7PjOrO8hUu6W4BDR2xdbmsCssymFvjlJ/bGJZ88SUYGNgJKG4H4cf6lm37NXY
	 RdVg7NGpfWI2il7oaWW5Ig6jlNDI6rC3ZM7ogCSSm5twIwnbtliMKcQAA4XEQ531PPfXI
	 ayXSNCF+lKqdsRuWJM9cRdPJPfDspjum1nPxL32lJ0mu+Zna63RODD19ydp9n4psSbigN
	 FqYs7gqpnyyode/MJRjL0X/ud98CcDI+g3ypLJ4GuQHbAmpVBhK7W8MuZjYaPsc9kiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=30QwHpi4RQGrlJA4Ni1ieESAKb4LlkBBANXTStC06eU=;
	b=cSgco1DDzMVmiB0M6dhgHQtnAhWnlznwYn1cRHFqYqbk5NVIw2XI9FlwHIbgKIZtCtYh
	 nU7Hene8wzxPTx2mCbJ93/Tky4amGUYyYpiNbGYQh8Ey6pD+syiNvCNgfBWoFMftGnzKb
	 3f2dVkzVYxlG75WC+iHs9xLeQVqjgC0XHvKCNdBB1LC5rAvf2LPoCrnOhFOd2A/lLIbj9
	 Ax4M//5v60v+emFJ+PbdTYD+T3wbUwKgcR17/5dgZZXcf7rOfWgOVRxlmPgFE6JQLXroF
	 RmSuSIg1p84vc/o5kh2TJeUhGWAyvVOhnkn7gWMnfruvfcMnub0PJmZK53arL23HyDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqEKp91Q;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D99606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqEKp91Q
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2587318a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006562; x=1793611362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30QwHpi4RQGrlJA4Ni1ieESAKb4LlkBBANXTStC06eU=;
        b=SqEKp91QEemx2ju6xjRBnie9/9djcxRU+HZEFSiSRyQWs+ck13SCYuzwf5iDKE3O8b
         h9juM9RlXBSS0KdREyQ8vvTsvLQCrNqK3youafF5HBvGBH/eCKkazk79Joz5fJFm4ZQX
         +b96DLvSHiCQ45HZD/vDwgokbXbNuQUP5S74bpwWedQZRh70/dNYZAK3DZB+XANsRLFY
         kfZtKSWgEgBCdgvbJxkr2U956y4A91JIDPEhds2IE13W0maedIO+xOCW01n0b1Wds8P+
         VcJXT5VaDaHaZgPVWama7AlVlFBPDZfscJDtLcsCAbnYVHAej+yz+6wYOclPjEEujoI4
         BbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006562; x=1793611362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30QwHpi4RQGrlJA4Ni1ieESAKb4LlkBBANXTStC06eU=;
        b=rVm+etzL31JOVfRIeYSEhmKQv+tOB2v0ro/3Rb8FxVJew4KM9Aiw1kF5ZPfRj9NyZh
         NW3YbJqjdDBk7QnMRdnxaQMMXYpB2Jddh+YacHtLJEA2xRZ0EZdC6cMF/VW9Ui4yofCs
         w6Gxadu2gugLLogXfoEVO9XJWggUYFVkmo48pZW05O3ulh4ghkVIwOpHxvBx4HGGZwXd
         f2JAsE4+ExHNJPinHm4eC5Ir8+Q/0pGLfbr2K47shwDVr7poVFGpMZ5XMVl3MJkDs8Ue
         HY3e2Vw4/vBPyVX2Yr07x8+qnEqhMRBp7Ai5Q1ZzZNYu9AYf2wySj12VKJaURM3eb4Zq
         IEzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+v9HrphDhypXitMJsiph4hyBDhsXE3WC673v933TM0KV7vfnnY1UEqnalMZtLPBee7SLN9szdYyl98Cg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx95mLBoxIc3N2lAh/Nqp6WISNOpdA76+qq5/CkqAVDw02a53Z
	50a5jOJEtg848Ltur4NF1b1ljOpmZmdB9fPEjgQAcHxaUVzT9b5HtAFe+Y0+UbME
X-Gm-Gg: AYBFou2GaT4vBKA8tXSQ8F0Kqop4fLhT0fNc8kmU7NK7KU+JfvAaIoy2ZenXvtOKkKq
	hwyqId0CborLztkernUu5pDC66HB7jcBOkntzSjvlhTxsm9NZhAYDoDAL+kPI+74n3x6GYy1A+e
	6I6doMrme05Bb1Tjrac5eIrs+vwxXBUY51ztSAXtYqpaEykGiUH/ntgm+TmZqwzSTN9tDxIml89
	b8KAeAzpT+FnUAJu1cCBFEWxgLG7cTFM3VwHvql0ScyRJmF0/J466weEsclfUdw+bSWQ38qWd+y
	ObzB4GEK1p3mnB04v+Bgr78bs5FmJEn5dPxnAGxhDRyuVEUF6UKjK6MQIFAG/jtLx09xN7FvRYy
	/CBsMReYDCh7V6aHj3gm9DUrh/gsXPYlzUQZRnRRwIcRwNg52Ce2JATa6rUN3XOpZaRoBPy46xa
	bSH6o/0qP41BWulTKNPOMLdqbWQNFWT00djcTDo3r6b3n6loxHJG3Vc8cWPR7APnRgo9ILD5Qpe
	uTied4VOmZ4ji5ZN1Pu+cxkhQi01qMMrt9amCYv1WOPISIPVUP0pke0+jEmZYGx7yaMUCNlK1J+
	pxx+10wabsEUwqdxyGWt3A==
X-Received: by 2002:a17:90b:2645:b0:3a8:878:ebab with SMTP id 98e67ed59e1d1-3adead4c29bmr5294059a91.35.1793006561792;
        Mon, 26 Oct 2026 02:22:41 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:3934:2b73:344c:e6fc? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb06c57sm5454569a91.3.2026.10.26.02.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:22:40 -0700 (PDT)
Message-ID: <96fc3e59-9fd4-4960-b318-10dcca1bd11f@gmail.com>
Date: Mon, 26 Oct 2026 17:22:36 +0800
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
Subject: Re: [PATCH v2 1/2] platform/x86: bitland-mifs-wmi: Add Xiaomi Book
 Pro 14 quirk
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda <matias.civadda2342001@gmail.com>
References: <20261025195456.43414-1-chris@miget.com>
 <20261025195456.43414-2-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261025195456.43414-2-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 03:54, Chris Taraszka wrote:
> The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
> its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
> of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
> and balanced-performance are no-ops and reading the profile fails with
> -EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
> also aborts system suspend.
>
> The values were identified from the WMAA method in the firmware's SSDT
> and by setting each one and reading the sustained package power limit
> from intel-rapl-mmio on AC:
>
>    0x02  18 W
>    0x03  37 W
>    0x09  45 W
>    0x04  58 W
>    0x0a  18 W
>
> Map low-power, balanced, balanced-performance and performance to 0x02,
> 0x03, 0x09 and 0x04. 0x0a is only entered through the firmware's own
> mode cycling, so report it as low-power without offering it for SET.
>
> The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
> so skip the AC type check.
>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A) with this
>      series on top of v13, backported to v7.3, on AC: all four profiles set
>      and read back, and the firmware mode (EC 0x68) and PL1 follow:
>      0x02/18 W, 0x03/37 W, 0x09/45 W, 0x04/58 W. These match the values
>      first measured on BIOS XMAPT4B0P0909. s2idle suspend/resume from
>      performance restores 0x04.
>      
>      On battery, balanced-performance and performance are refused by
>      bitland_pp_check_capability(), although BIOS 0909 applies 0x04 on
>      battery. This patch leaves that check as it is.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a4c341ffbb9b..73be63146fd5 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -116,7 +116,28 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2424_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,              0x02 },
> +	{ PLATFORM_PROFILE_LOW_POWER,              0x0a, true },
> +	{ PLATFORM_PROFILE_BALANCED,               0x03 },
> +	{ PLATFORM_PROFILE_BALANCED_PERFORMANCE,   0x09 },
> +	{ PLATFORM_PROFILE_PERFORMANCE,            0x04 },
> +};
> +
> +static const struct bitland_mifs_quirks tm2424_quirks = {
> +	.profile_entries = tm2424_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
> +	.skip_ac_type_check = true,
> +};
> +
>   static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2424"),
> +		},
> +		.driver_data = (void *)&tm2424_quirks,
> +	},
>   	{}
>   };
>   
Reviewed-by: Mingyou Chen <qby140326@gmail.com>

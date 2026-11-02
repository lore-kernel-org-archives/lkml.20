Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619085;
	b=Deo/bzw6iIGafnS12Wu97R5tl1VPIM6nvyyXptBPyVi7Yo/VIkb0bvYJMbg8btism0B2
	 RTSrxwncM4aXiDGf+UzMFu8FScjDapV9Eocmcxpr/jZgRXsvImSrvQJ03YNxpNDu3ZiG1
	 9DFKXIEnHY7Zvf14KoJvZe0UgB2XCDaXy9i34hRWZ8YKaRQX0X0RFyzRlzS6utkiXcmfY
	 R+clJ7dKjFY2UopnScwsl/395yr75Q0la7BkfM5wSYI7Pr580kXgVMYRKB+l5Cj6ZcHlP
	 e6hYOkf/7StedyCOqulDYDtxgQXxlmdxv1X0zAScUuFuZeoP0v+sc8P/OHmE4S1UtsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ugcOTaVoHQDMbUWrr1UR/TQtkHFQCW4Iuv/ctdtGhzI=;
	b=5l99YXXShDbyf7NqVdR84GWt4g2RDV18QZrnFjEycIul+CFvbGvDfjGDJj9b7e7gp9Qk
	 W7c8FmgQ9x8G7Oc9QSjQ30iy9dpEb8AfB/KMrCrE3wKvBtrht0iVCqtGTDubaptbSTW4V
	 b+W1gXZtu3YexWyhJdrTpoBXXImDBPIIadrlXMuqdqL9yC8rUcmO4g2tcbWHSiWS/4/J5
	 1wASW37Ub8Kf6I7yzy6Dear5Fq+yMDMoHP/NZgwLCAa/8xKWNwC9LyWGMFyoMi8CmJ+p5
	 ONhD4T5vG84m0BUOq3u7aTROz323jrnyM+6QTIAnk7GPZj55oYy7oSfFPHB0aJl4SRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtH2HRPI;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA0E606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA0E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtH2HRPI
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1160186a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619084; x=1794223884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugcOTaVoHQDMbUWrr1UR/TQtkHFQCW4Iuv/ctdtGhzI=;
        b=LtH2HRPIaLKnYss9nw4YboHq2Numnvpkuckuo5SCXJ9lsE5P4OClzjMkRyNe+ErhfZ
         eKgDeCwL1cHfP8eMh7BC6qFDhsjoVaZ7A6U7FMGmTK32br1lk3g7tyjGzPn+8TmliqdP
         8UuQoximhZcygAjeORe8ogjegbs1h2jEu/wjjcY3LD0C6xWnaGUBjM+Gcr7GaWu558ml
         JES3VW+6ysZ6XbKOqcZ16HZ32hCsPACqCfzl48FPRcDPWfut/6o+3ANx2qD7868x/08j
         sLfpjM5aqbuf6FRJg+mlxP+zOcaKEpZQ2EYPHKkQK9Bfts9WjoubGFlZXfn9xjkPyfdy
         xppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619084; x=1794223884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugcOTaVoHQDMbUWrr1UR/TQtkHFQCW4Iuv/ctdtGhzI=;
        b=ngk7pqc0taHT9T3oRefTXL2nDuNIm9PxLE6nMifSC/IXZpkPt2lCNRsN34HLBnlX/A
         broW/V5ER7z3xVXkuXyBt48Le7k1I/kZ29lzKk5pfVdtBr8JuTieu7A89aYuUihIDiyl
         8ySMoNYB3cbAVKXuBR0eh8/wCEeTGDICOnWMILEuIcfPx9FTFv1puZYO8P2gCCrPTyGz
         6zYaof0fl06l4qeuC6QSZgJf1vELPxpR0taLGIhyix8LZtqBK6YbndVF/sq83nNvMx+G
         rnlcZQhGIudl/2OMgPNmCuwcNRBDD/KHvXL+Gq5ihGWSu3nViUM6/dKgs71Gq830QA8p
         cTFg==
X-Forwarded-Encrypted: i=1; AKwUvBxJOj8dZRRNJe+HtYvdWLKVcO47rW6JJ9Z7b9Kp2kc2njvYt3kLjygW+8xuW9544INXmQCqK1lsy6fpuvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmoifOaEYoyve4vrozxOEnGCbfygsAbn/mzWDCCKtY1INIP6TV
	x5B69AdRCg923oMcfiCpPEVU91HLljqFl+i7I5/jvNB+aL0QqSK6Bxuv
X-Gm-Gg: AYBFou3fnWjzEYf/Sh5wVNlNpcmJdusNgpOhqxebNe8+yRJT0BsZRzRo/RuEIvOf0Pr
	eqf+yPFfAZRp5+Ed+Dm7iNBdm9iLzIqV8ntQ9+Q1GN1OUCRTbK9SHSzD7NvZ7tCUW4y12HlCaUT
	34GMJSWUVk6oaEN4AwvmcyytlVoEg63fnGSpUfZQR72GDRx4oBPEiU3u+npGpkeNoQB/sc4IQVZ
	zwmVscGJr530T2fN/N1zMGppzVq9k19kDPER6OBk+a+rUX/q2TYDLGKDi5fPwTLsqoTWlzBLf/V
	bj1JkMuhw4W9713f5NGnPxGrQ16icMqBV8WqzPzSXUUtkSpgjviIiwVlj46iCEhs82ctRbSp3pv
	pbhagHRTgd0jWoUO7/AGFU+cZoKkZl2K2hlpJwBWzgWK0VW3Bvj6X2ePPA5detEjTDSv99yD09Y
	jQE58/upijXXjzk29CmF1i6WyEndDvOLT0iMFrRZhkn0Le+WnV/87rL8SG62IbJGUc0D6GGKj3a
	ARKZH9mh6CnEoSLV34aX6+rN9ITn1yGFH+KvPV2fDT0LukJK7j5YjJMBQIysvlNMOQAtwko6g4c
	ICebxiy5+brFXTbmbkbcnfjW70JDJ/N1t1yKNijCiduifSV/bDCZc1IINI4M8a/eYPT1
X-Received: by 2002:a05:6300:6cc8:20b0:3eb:39fd:bab3 with SMTP id adf61e73a8af0-3eb39fdd9bfmr3330041637.32.1793619083924;
        Mon, 02 Nov 2026 03:31:23 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:5bd4:8bc0:479b:e7d0? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm3066396a12.20.2026.11.02.03.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:31:08 -0800 (PST)
Message-ID: <3e44b454-922d-4a1a-8ffd-f77b4cbce654@gmail.com>
Date: Mon, 2 Nov 2026 19:31:04 +0800
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
Subject: Re: [PATCH v3 1/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book
 Pro 14 quirk
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda <matias.civadda2342001@gmail.com>
References: <20261101161814.1325847-1-chris@miget.com>
 <20261101161814.1325847-2-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261101161814.1325847-2-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 00:18, Chris Taraszka wrote:
> The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
> its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
> of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
> and balanced-performance are no-ops and reading the profile fails with
> -EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
> also aborts system suspend.
>
> The firmware passes the mode to Intel DTT as an OEM design variable.
> The DTT tables in its data vault name the modes and set the sustained
> package power limit (PL1) for each, by power source. For the H484 CPU
> variant (H404 has the same layout with lower limits):
>
>    value  AC                 battery
>    0x02   Silent  15-25 W    Silent  15-25 W
>    0x0a   Silent  15-25 W    Silent  15-25 W
>    0x09   Balance 35-45 W    Balance 32-40 W
>    0x03   Smart   36-37 W    Turbo   50-58 W
>    0x04   Crazy   50-58 W    no entry
>
> Map low-power, balanced and performance to 0x02, 0x09 and 0x04. 0x0a
> selects the same tables as 0x02, and 0x03 gives on battery what 0x04
> gives on AC, so report them as low-power and performance without
> offering them for SET. There is no balanced-performance mode.
>
> The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
> so skip the AC type check.
>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
>      with this series on top of v15, loaded on v7.3. Firmware mode (EC 0x68),
>      DTT OEM variable 1 and PL1 a few seconds after each set:
>      
>        AC       low-power    0x02  ODV1 2  25 W
>                 balanced     0x09  ODV1 0  45 W
>                 performance  0x04  ODV1 4  58 W
>        battery  low-power    0x02  ODV1 2  25 W
>                 performance  0x03  ODV1 1  58 W  (with patch 3)
>      
>      With v2 on battery, balanced set 0x03 and PL1 went to 54 W.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a431d3fef774..63fae12ebd83 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -113,7 +113,28 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2424_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
> +	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
> +	{ PLATFORM_PROFILE_BALANCED,    0x09 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, true },
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
I'd prefer to have this applied on top of patch 3/4 instead, so the 
infrastructure is in place first.

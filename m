Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617832;
	b=F4IkUhULaMStE/BbgHhhQZfUO8zthYPbWVb3hUlI75twpJB+zsuK984P3hg4npcEkbro
	 TM7V6GFrGAeWZWBZZpkeAKLGcAeVQS9pPPDz9anrrAkkNyjg/Es29MfZqKXuldRX4tPcU
	 9Roskvlqte8fLwPEX/N0sRqmx+KHCsOI0Dhk2ag1RU9El37tMo/x6BVFVkAYsm/278+0p
	 40NfA1uvK5G+CX0/V0oqKs2usrhkraYNB0vskIWc4RlUlh1iatcsBynvI86HpYaiFJIR5
	 ZqUQIgFoHJUp8HVegzbDUJObNL6KG6nAryLNICGrK3abdoxMCol+nOno8b76UZzzTXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ns2jpBxHnJhEeiIoRDQem4m1lY/zadpTOWX0iiIepSI=;
	b=IF0QADW499R61h18QgUquG6fUyUoHCeI4c4YKqrL+wNExEaD0P1TaqXWOAXYuQejFCk0
	 RFUKIPh+Q/B9fMos7lXSV/5E2IUMGp2v4r3wPqClnM2qzLsVk1W6Uunq13BQ3zundeTwi
	 5UDk49I5qY24XO2Wc7Ni5eopGrsgfbBbTEp2JNiyXFflJmbblGWBlr4PAVAfMmGx+d2Xs
	 dxrZaG4WloKkav5p19CUFJLqbRzmLA/vdP3Cp+9VpagTITMKuu1fpT3b1+JPhvz9rDvVh
	 fAkP6qjfny/8qt8fOHNwysHLgNgQ7sSraxfppeyc1hCxea0kM7CZk2WV2KladaX1qLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8iyQhzx;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03DD606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8iyQhzx
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1311276a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793617831; x=1794222631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ns2jpBxHnJhEeiIoRDQem4m1lY/zadpTOWX0iiIepSI=;
        b=b8iyQhzx11ExCaz0QiBc1bkRDEIz3whLV2+RdANYY3cnLYbkuPqakPzx7Sgc+W3YR2
         WOUBhqPUlwrJhplfW3XnSc2jUhE4i64nRgEh3CbK6JQzgiP4EVorspSJTh9gV5dJYBXS
         a88g6q9ZFI+a/L1g9FD78W43ZJrCUtQmCbtqG/C43eNcgNZbZq1Cyh4G3sHbKKZx6KKM
         fIFEMq5lwz+MEAKF8iPPp5bPPY4WL9UqXorFU/gtDe2SBGSeOtbnDkosou0FO7ZIdEY5
         UC9sXZ42rxYChxP95o/PBYQFyHXTHh4zUDBVKXi9FmGPjh31Q78y33eAua7wgcKGGV2A
         ezlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617831; x=1794222631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ns2jpBxHnJhEeiIoRDQem4m1lY/zadpTOWX0iiIepSI=;
        b=bTlwYAEy3AhVkpKK0FSP+/BoMxGLfSFRa4RIRpWh0ctXjCiNR969C/Lg/Us7LUIa6E
         AgSErgTuKNZ8pFMBRVyuwgAZVXLYiJzYqJEOtI4HVVjeuhxjJznWy1PNEdLegSC/LRpS
         7+TqIm9xSpP0ut2H5F+Um0vrGS4DahN4h65LGpihxNxXqLKOhwS/3imXvj3BnekBD/Lh
         mK88CtVWQuVqOcgDtHKG/qr/4zzcJbT1wRUAmfpCdSC9qg1XDlHkte8oXTbQJN5cz8RO
         nIZNGu0oHJUMQHKZgWdkRo2rW2T8ol8GaZu05liZ1lBvfN6rncHsx5ec6pRqQALEBuKp
         iUYg==
X-Forwarded-Encrypted: i=1; AKwUvBwChuStiWpFyI2gSAkghcGiLH6hHmhzQsCIfB2f5NKMSpZcaunsz8NcNC1L4ZoxWyQp8DpnGze8LJsatL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z82bw4dfkx4W8lEZWEyDGUzuS2h16TpO2fSUH3W4vxN/nBX/anm
	VWhMzQlSqw5r1PxePcV9oJVI6yRm7AC40kQ1hUtpArmxbkzoQrW76R07
X-Gm-Gg: AYBFou0zoERqSZsCMIqHW7eR2cSL6RHAgtue2RhK0W7HDOe2KYah3DO+yeRRU0dRrgy
	CuffzLg/e8nKdl7ZNBr0js08jqPJ+8bGvPg6iS1QbSDxFfyMh/74itNT9qdq+xdJrOOOAIGds9f
	DSIhaoY/NUOS3z3rvC0UXk8qf4eb6Zp9PfsiW7cWFCxQYVPE7M6bv7TkSGY6PX8qNPYolpXqWF+
	v0p2xcAJ/dRwj4HCNHiLgnPIMeAIUvbduqvWwbLpQw3vlt1f4aSGd2npX/fZQ/XafxZmjVKnjTD
	+v5ys4rOETuaIWJkoClbL8c2Dd2vtH/q2b1oPKkEABTxWNJUfE1w/pwWEI3VtZgiMkyM10EP2JH
	exIUoe6I9o9O/toQ/48mjmX7xq3T33JQQZQ0zcncp9+fDTb1Raenr7XWh8p0fnHz9lIXgk1Zkq2
	ckH+4xDTD+rBF64DP/ANfqM86vpNJUd1f+9bD1w0iuRNR/KxCOVW3slxhGwTaaxLiHkSLJbnKZK
	eqeXyW3oEmDw6rirHsC2FEv3bHJ6zA7xiP21YQCRg3cfnVFR04rTla4zZwQSbgWUoYEDYcoHIdF
	nhAjpDCDT+548q0t/KeTyFLdvGjFRD50G8WfLksdTZoYN0rjgE2XLTD+MtpDQlbFCoBY
X-Received: by 2002:a17:90b:2745:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae89776d99mr7744624a91.13.1793617831065;
        Mon, 02 Nov 2026 03:10:31 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:5bd4:8bc0:479b:e7d0? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae881c5624sm7342277a91.4.2026.11.02.03.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:10:30 -0800 (PST)
Message-ID: <59fe5a60-049f-4e53-bd75-e7b2de3717bd@gmail.com>
Date: Mon, 2 Nov 2026 19:10:26 +0800
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
Subject: Re: [PATCH v3 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda
 <matias.civadda2342001@gmail.com>, 7z0423arsenova <7z0423arsenova@proton.me>
References: <20261101161814.1325847-1-chris@miget.com>
 <20261101161814.1325847-5-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261101161814.1325847-5-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 00:18, Chris Taraszka wrote:
> On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
> the firmware does not change SystemPerMode itself. The event is a
> request that the vendor software acts on; without that software Fn+K
> does nothing on Windows either, and on Linux it is currently logged as
> an unknown event.
>
> Add a quirk for this and call platform_profile_cycle() from the control
> device when the event arrives, so Fn+K cycles through the profiles that
> all platform profile handlers support. Models without the quirk keep
> ignoring the event.
>
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      Sent on its own earlier today [1]. It is now part of the series since
>      it changes the TM2424 quirks entry from patch 1. Retested with v3: three
>      Fn+K presses from balanced step performance (0x04) -> low-power (0x02)
>      -> balanced (0x09).
>      
>      [1] https://lore.kernel.org/all/20261101144100.1043263-1-chris@miget.com/
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 4d02cd9e8a6b..84d1223d0ec6 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -100,6 +100,9 @@ struct bitland_mifs_quirks {
>   
>   	bool return_code_at_end;
>   	bool skip_ac_type_check;
> +
> +	/* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to the OS */
> +	bool cycle_profile_on_key;
>   };
>   
>   static const struct bitland_profile_entry default_profile_entries[] = {
> @@ -126,6 +129,7 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
>   	.profile_entries = tm2424_profile_entries,
>   	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
>   	.skip_ac_type_check = true,
> +	.cycle_profile_on_key = true,
>   };
>   
>   static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> @@ -169,6 +173,7 @@ enum bitland_mifs_event_id {
>   	WMI_EVENT_MIC_MUTE		= 33,
>   	WMI_EVENT_RESERVED_23		= 34,
>   	WMI_EVENT_OPEN_APP		= 35,
> +	WMI_EVENT_PERFORMANCE_CYCLE	= 40,
>   };
>   
>   enum bitland_mifs_event_type {
> @@ -217,6 +222,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
>   enum bitland_notifier_actions {
>   	BITLAND_NOTIFY_KBD_BRIGHTNESS,
>   	BITLAND_NOTIFY_PLATFORM_PROFILE,
> +	BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
>   	BITLAND_NOTIFY_HWMON,
>   };
>   
> @@ -869,6 +875,10 @@ static int bitland_notifier_callback(struct notifier_block *nb,
>   	case BITLAND_NOTIFY_PLATFORM_PROFILE:
>   		platform_profile_notify(data_ctx->pp_dev);
>   		break;
> +	case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
> +		if (data_ctx->pp_dev)
> +			platform_profile_cycle();
> +		break;
>   	case BITLAND_NOTIFY_HWMON:
>   		fan_info = data;
>   
> @@ -1015,6 +1025,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
>   static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>   				    const struct wmi_buffer *buffer)
>   {
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
>   	const struct bitland_mifs_event *event = buffer->data;
>   	struct bitland_fan_notify_data fan_data;
>   	u8 brightness;
> @@ -1043,6 +1054,15 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>   					     NULL);
>   		return;
>   
> +	case WMI_EVENT_PERFORMANCE_CYCLE:
> +		if (!data->quirks->cycle_profile_on_key)
> +			break;
> +
> +		blocking_notifier_call_chain(&bitland_notifier_list,
> +					     BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
> +					     NULL);
> +		return;
> +

How about 0x16 (WMI_EVENT_PERFORMANCE_PLAN_ALT)? Some devices report 
this instead of 0x28 (WMI_EVENT_PERFORMANCE_CYCLE).

https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me/

>   	/*
>   	 * The device has 3 fans (CPU, GPU, SYS),
>   	 * but there are only the CPU and GPU fan has events

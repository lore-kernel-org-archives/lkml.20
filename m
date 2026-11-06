Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971195;
	b=s5MdyEoJc7L3fkSu3CBqjJzmLK+0ijMQbPRAbRVcwU/K92qe95scjADzEEcoN37ywit0
	 Gcs+8901Bo7qgVjxZIwgwzYJPlRWdH5f9Vv22ZKWjrIMcHJ78dMMrbT0g2meZ1PClRhhP
	 tapHQMq31m8q3yg8F/JrrFKN2r/2udaHd1X7HI2fjAjV00YrppZkPXnVIeMDJpWyaOrf+
	 SkyBjnX7Ql7rWCaE2z/xY6JlmWaIPfalhS5zgOzBxHCpIr/3cX93saArMUK0XoX311VN+
	 bn3x922QHmFkI6IfRrlDfk2eYmuEAiMO87aeXsND+YE8u1SJrk9HoYzT3lBAeGydxGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=au8LZ3sFMoFSZougUadftosRf2sPIbMDVakBEI/0eeM=;
	b=RuYFBxkMKYjd5qRLp7wr91HU87MrNNvu1gfLy1XIuawiAQ9lsnQH4mlpzcFeKa8/EkLQ
	 a/c5Hx81mp0KVSfZG9bOIRdSCl6bye6GfqQ9V/O9itodu3FgpRe1SEiXTjTZGASn8pyxc
	 zCrCJQjaEBilX+hGBL3cyvMP8U/thnI3GHz1dSuHP6sjv8VI63yC7G9b2d2aUzE2k+9BO
	 39J6Wyr/BzUIMXQemVeNNXkKi/o1tdFELE/K/0Rd98qg4jFyjMQxv9qEOH3CsWuCeusww
	 c1R9tZr2NSI7hKCvdgmm5pr/+fhfN/CBlcjt8LasCjqhIv3n5OEOfZxe+1Z07MS1piQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5QNjI8h;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08AC606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08AC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5QNjI8h
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so1161083eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971194; x=1794575994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=au8LZ3sFMoFSZougUadftosRf2sPIbMDVakBEI/0eeM=;
        b=R5QNjI8hv09Ef7rr/KxiN8co3Ulf0iKTiVEFM4ZhopLcPD3efNhG0s81ZIK5vURsja
         Qp/OaSCN0zkfhDHfzCy0f+PwNL8ZVa7SiJzzvVY8a/8jtxCaqlBocRJM9RpWCAQY4eJK
         dU52jxsqZTaQZ74eVMSHtQ51t0v/YoBx2rSJL+NOiyR1esP42tDES5nuq0lw2zuz1LY9
         EGgxzuxS6n/uXytBt2qYBhmaLHhhhr+ZkX7KYddzp4mqnMhf47zVgYJHCVttwyP4GOkH
         yEqwSAGYo77aTUMmsV0t43wCIYZ3kUr6rfjNP9exSXlPYYDe2Z0C9KFnov92Y3sPz45p
         snDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971194; x=1794575994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=au8LZ3sFMoFSZougUadftosRf2sPIbMDVakBEI/0eeM=;
        b=MSrmhw1NK/19Zhd1ZLP1eL9tSt8fPINAttm4KQtVIS9oqVwxJEmtksZJF8Bkj3vr+S
         zNE9nLgHcRAb65FcJ27eB/T5CDhFxiKMuH3hl1CnprZcWJKl0eahyt4qAkOtu20IXqxQ
         FuowCbj4sq59+qMAy6z1VfIAkmySx0HTT7JMMaRTfPfHZlOa4ym43Il4LADetgv2m9tI
         QQQs7uVbE5Nb5X8gYfPaxs2yFVlu5q4i0ZGKPhFlwfzTR2TPy0Kv3fd+b/IupYO6AJe1
         wCMGiBTnYVwx/+3/644OMhJdQXecb6qfmPuqYbG3fvIIjGzMOWwySTQ+IfaqPwYdRU+A
         AaeQ==
X-Forwarded-Encrypted: i=1; AL+hErGnXk/60bW0jlFL4dmn02Pz/7DYacJahuzkG8me5LxFgT2wP8uiM6LOTETlBFCAclaSMwGTsJ7Q4/17SLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LySWJNhGvM6BJde70CGQ/OZx3pAw6Oh0spZH+sPUYkitAOQCZ
	hr2n4rLNWUWl5mFO5dm54Kwfzgl0691ww8z+WqhPiMpzg3PoUC7AddRJ
X-Gm-Gg: AYBFou29+p4MSEsabf98tBak9jIPCImuBeXaOCzNmZgJS3HmfFyJE7KZVWbVaSuNdAp
	vaQgyY2ukmLI8nB2dejrLon+j7++oUpqJR7oUuhScazrrLGiqLl07o/aKPZlV41VS1DAs3/nr/d
	6lIh2c8sJzZpwVCStUoSUVSeBvhAzhHViMnJMIcA0v5dcukAUn5n3wewRgYJnGR97jyTW1FSxaJ
	dKeXDQp0SVwdbm77uxviR4yzK2RPzZyPeaqVvFpjrtblhEekVwB30y4grgoyDuOzIsgJF2jkzGU
	DCyxgJzrr/ihnxDMlkDPQ+JBOWPGqXra4KYJPa9gQ0wnv1BeD8U1pCx/oiE/zeiRULQvmPAmjdt
	thOxro/DayyFzP+NABUjpjBaUSB9HbwiJ4ncLthRaaGWR/YNOB8ehA6SvW/qNQPAUUxcFrLj7WB
	Qxs5PvGkS0kft+sKUJkkcFD5AsHY/fUtT6fUYu1TpM5fzOAMp1TRj+DNap/3ILMd+AE9hDBK7K+
	NDnedV7omJL10WbCqI2fD4EcG1M70YnZQKFdZW9Dk3XLnypdwWkyStVCFmyrumv6DdoiqpgSWM8
	uLUQpWjGec7RyRzSRVX+VgYsOTMQwLniPLzk+G/LBQ4VLzO1A3x2SryhTBWnbKNaegi/
X-Received: by 2002:a05:7300:dd06:b0:36d:b933:675c with SMTP id 5a478bee46e88-36f75b1f6b4mr3549301eec.17.1793971193390;
        Fri, 06 Nov 2026 05:19:53 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:bb81:a698:7716:7bcb? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b7404sm6971069eec.24.2026.11.06.05.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 05:19:52 -0800 (PST)
Message-ID: <7e925ef8-7cdd-4e16-8761-dbceea94826f@gmail.com>
Date: Fri, 6 Nov 2026 21:19:48 +0800
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
Subject: Re: [PATCH v4 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda
 <matias.civadda2342001@gmail.com>, Arsenova <7z0423arsenova@proton.me>
References: <20261106114300.936782-1-chris@miget.com>
 <20261106114300.936782-5-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261106114300.936782-5-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 19:43, Chris Taraszka wrote:
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
>      Unchanged since v3.
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

Does this quirk entry really necessary?

Since only supported hardware sends 0x28. And 0x28 is not used for other 
proposes.

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
>   	/*
>   	 * The device has 3 fans (CPU, GPU, SYS),
>   	 * but there are only the CPU and GPU fan has events

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324769;
	b=faMEnulY8IAk6TXye6FfdNTIrccsQViFkFMZ9lMBa341Mk8R+hM4wTQD3tdnaiJ3Xe41
	 9e4spV5T4VjV2BVJvnR2e5wOhIOZbfxuYcqoc0valOqboG8stufQAsz7DrwJlvGkmp6OL
	 uJ84L8C16a70ExIANrgVibgZExO5ideDEcJtp9F3ICvjTJbNnnZO8aDELTO+/pAT5fPLo
	 EJ3s11akrt9QK1NPRYNJivv9ozIyq+CgR7xmEEMgmt4tEedpaXa1pfrn0ej+RKF5J3HFb
	 fN/p73fxapRNb+5r6tfSoDVEeoVKT3D+wqUL/JHBtN1Q8imflJyiIZ0fmyzN53UgQlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XccD1DO1R/ZU+LZB06u2umQt+RgHY9hz8EUttqWNV7k=;
	b=csgQ2lfz1KUaypk8KRhCZqHBwCgzqWxeRzAI9+DV28zJVhoBPlVUVJd2J9F+0KdNQurc
	 n2BBbs5D2UxZlJakbbVQw73T9To6ZOpxW7wGNWqEHCK5/lkYLXIFJwEWy5575vYTlPt01
	 6d8t4cQs7i0vNyNn2OJ0MhoHOI0f8nMW6z1OVwCQmie/ATUrErLYn3LhH6lC+2AEP8LUG
	 ZkthfxTvpUDfol0VPZBHkJa2Vbm26w2XDAW3UeX97MggLv4ANCv5j3xjec6zCQ5VAigsH
	 k13Y1hzAWC8pAGYYcVEY26V3H4slXrjpmsqDSjbjNxZba8cJgh7J2EejvVRrKJGhybQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfFK+MlQ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0CD606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E0CD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfFK+MlQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so25259865e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324767; x=1794929567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XccD1DO1R/ZU+LZB06u2umQt+RgHY9hz8EUttqWNV7k=;
        b=cfFK+MlQqPYvZS+Hsk0lJe7swJWefJFUhuKASviQ390c7cvenLmcoMNOyv1kBrgaSY
         dICXV4WQEUGFi7Y141oumYoVHK0DFuxLyczTRECnQqiXFxHQUwdEeuS5rOJeJpSEe1+x
         SPnyt+U49rP+bi+qff18KU7AT6BaPYWKfNNbmu1mWMLURNHNKx8ZIG/xOv/UE7Rew7Lt
         kOYc8zKNCq6SY/1JQU58u8hU60IpRVVnl3tUT/TVJVk9APkXXtqlMf3FXPSv9tV9XkZ8
         Xo40RUSpJFe3pHmBCppCb5AzYRfm3YWYLFo3f8wj2S1/MW5ny9F6EpBcRt8yADcAXDri
         Hq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324767; x=1794929567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XccD1DO1R/ZU+LZB06u2umQt+RgHY9hz8EUttqWNV7k=;
        b=MOekaTnF+U0uYnjSdUyiqr7u/GjwGvuspG0ErObyNott+LX7GwsezN0vhk9r9gKIDs
         XRVWcEpiZ/bYGwES6+kvQAm0la7YtGkexie0OzNBDB4g0Wkd7TxQpoJTcdo28yTSQ5FH
         KvpSvb8FrKhWO/ICPpegHpzbsblgbkBhNZyJ0d++pOhjQmpoND6rqHYsgW+MlTBvf+KC
         Bo6fE4t0t/lB6YuFh4ucrjFk5+vM+960hPB1ehLiwnH5qUxkysVVBH+/Vk+jHVQoq5Ta
         VVtY6wc+1LewwBpd2cqDtz+Mjo3mIdvWd3uL0lubteT8UZaTS9gyOy4uusac6iTuDEII
         fPlg==
X-Forwarded-Encrypted: i=1; AL+hErEVywDsX0ah51fOl6bq9PB1v/9mp6hGruvQqzAB/zZlMbJk47NTPP7PEwh8TdGF1H1QGaSM2AqONCsV/cQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gOy2A+iBx5Z/lWIZ+VFlBKG1T5IYR2I8wg23pIXjSQ2yPC1ho
	E4c3iIB+lCCBTGUMDrFECseZzi/ne+U9ZO8kOtmQFfRsBuZ4sgNHwHBS6kiuqQp3n7c=
X-Gm-Gg: AYBFou1I/qdtLfw39+Zdv4GQRcROnr4qELWg82G9QM2xjgeg0V9soTkcHEthtY7BgKj
	DfZuxDXHhmlOAooPwrjBmJIsgFr0FD7OyAeZ6i6G99DiOjdfcnmaOHfjlr/3/U3I84QXe6/FApr
	UumFiGjbvkFFnPN7YjetAH2mPzuyNrSqSp5DpeVB8E3DrnayXocGa97sqV6hXPgi8Xeqx5GfJI1
	KbcjguGyTB+yw4pXVRUida0OjnF0+jioDpvw0hkgFA/uSgTC5JfcpNVQm/sMX8IL/UEmNfG6tAE
	7ClTgGXZAe6Nk1bQUYV1x4vbl/CFkXgG4iC1/HGTO99wFR8wJfy0i9Y37EQZ7T38Si0oEpwXjIe
	2tX2yZ+t5KVIvVgIqbrQm6+8gwV/7izJf02AubOeR7KoCzBcT/7KPC1TXKXDXG/UDzJYiiFgMCN
	GdQE4BNyy0/b5WWQEGkxVBoO/QYWhTLwpPwi4AzRyz0QSrLmRV8KiAwsInlZuyZX3buckOJj/Cc
	FOKrvRnd0WpV2k3B70Yq5BD87yuaWej8cBvoZDIgkQz/GvvyrIsPZGnivWov6KhEHtaNS/9AdAJ
	Pqt3iqx6fUdHiqyb1i2yCEtcdrOSFU+yYg==
X-Received: by 2002:a05:600c:3b0e:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4ba02308316mr48969035e9.1.1794324767136;
        Tue, 10 Nov 2026 07:32:47 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm5509777f8f.39.2026.11.10.07.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:32:46 -0800 (PST)
Message-ID: <7a5fe9b1-bad9-4ce0-af92-475f13c5de5d@linaro.org>
Date: Tue, 10 Nov 2026 15:32:45 +0000
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
Subject: Re: [PATCH v2 13/23] coresight: trbe: Simplify wrap status handling
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/10/2026 17:55, Leo Yan wrote:
> After explicitly decoding the TRBSR_EL1 EC/BSC values, unsupported or
> unexpected stop reasons are handled before the WRAP check. And the
> erratum and pointer checks is no longer relevant when deciding the
> buffer wrap.
> 
> Remove the redundant checks and treat any remaining TRBSR_EL1.WRAP
> status as a wrap event. This also means WRAP with BSC_NOT_STOPPED is
> reported as an overflow instead of a spurious event, which prepares for
> for TRBE wrap mode where collection continues and a maintenance
> interrupt is raised on current write pointer wrap.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index a851f09d806a6b6a6386d6f7547b01a17f61b88e..4aeed1a17c4bf1653fb41731ac15f31feec7ed2e 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -661,8 +661,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	const char *err_str;
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -	struct trbe_cpudata *cpudata = buf->cpudata;
>   
>   	WARN_ON(is_trbe_running(trbsr));
>   
> @@ -710,14 +708,7 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   		goto out_fatal;
>   	}
>   
> -	/*
> -	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
> -	 * it might write data after a WRAP event in the fill mode.
> -	 * Thus the check TRBPTR == TRBBASER will not be honored.
> -	 */
> -	if ((is_trbe_wrap(trbsr) && (ec == TRBSR_EL1_EC_OTHER) && (bsc == TRBSR_EL1_BSC_FILLED)) &&
> -	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
> -	     get_trbe_write_pointer() == get_trbe_base_pointer()))
> +	if (is_trbe_wrap(trbsr))
>   		return TRBE_FAULT_ACT_WRAP;
>   
>   	return TRBE_FAULT_ACT_SPURIOUS;
> 
Reviewed-by: James Clark <james.clark@linaro.org>

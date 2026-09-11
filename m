Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB6643F091
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123399; cv=none; b=Ufew6ghPBqG2/phCufMbZWhX/d5hLLFOTix0EPtBphfmZ9puu08LaKSCowPYafrOjrDOMyouGocNFwolWNadhih2vM5aQsaVSwtiefdPSVYx0U+qoHHSMdVRVYuMoyvshPgwfjhp25bxYXcWff3NVd4YZIkfYSS067Vwkyl6aEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123399; c=relaxed/simple;
	bh=L/lGKMfp42hBWo7w5pZxZLyTlsE3A7O8TBaqBICRHSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nN3CKZ1W4XGJB+rEWmJwBVoxcmuL5CIYfKrCaQmS7wnIGF0WA5UBzLTyTse1YvDhyBaNb9GX/8VxXhNeJLEMy6zFqkG704ya6ViGM6oMf7U5BjtXJo3QS7Qm/8wWRHAKc14rARbfaZ1XA8Eg6VNKSkKijMIENb2L0v+DaMf+UIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gt1aVH0Q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gt1aVH0Q"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c255c58156bso178611566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789123396; x=1789728196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OBJZFY4WEPdfeqZOIs4m4qo0tGRehs4CamLBjm99hQ=;
        b=Gt1aVH0QPyM6P/zjdhKJZLjqHlX29/xTEwcuAeGv6gQC/I8qEzIvN/ijdXhCcJOJkL
         feB5eHJNKPBMcewpPyGbPoHh/h2y6FtFTyKc6xNrY4+EFj+g1/jjDzkMXHDR9hL6fxrY
         dcWqoUvnBPnDkrv4eKJrhYVrmcrqJXQ/uEaoEu6Bm5S3+7OsxMK8omO7EW3QAc7vCbtp
         33ct1WP1FMzD/uRPOSDEXh5fGU4NuOXFhLFcBi6eRRwg5B8COhm0X2wM4bfvdUP/cUz/
         tcpkhQOos4AETgmBoPKJqrM7drFB0FDJcTFJR8vCbKJk185Jsc5kQmzqmNHUNr4gcmjE
         8bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123396; x=1789728196;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OBJZFY4WEPdfeqZOIs4m4qo0tGRehs4CamLBjm99hQ=;
        b=jhhN1A8VxolynxCuFHFSNdqWmBPGhOahWJ2viwZSGHrRU4DgRK1zKqvdJOw/ZB51qD
         U/Q8ai9XnbJluATJJBd1zduEh9cH8mxHnAAvI6knd6K1tLr3xMc1KwSttpfrAC0OFx23
         r2ZjbetconABkA6swCWbXWe8WCAFoBH++c8I4PFwz5laFHXr+WxTKVwgVqs37EVsS13h
         TxsfcVaI4b68XNJe4Wy9SaRNEWOIgC8zC1wyr3csyZpubJcQAS4yYmbqzCWvHay9MJr7
         vY9IvaO+BrALMflVc0tDk9Opd35UuxH9XpUN5e+lZuoygIBlvt013C+BTh3ysHz8GK+N
         KrMA==
X-Forwarded-Encrypted: i=1; AKwUvBzlYWjdJ+U+t2WcSqJrUKNxJlT5teTt/i+pRMkla5KKnwWNsdGPOratJaoq0SQdsmtk4DzJUdtC51hRObI=@vger.kernel.org
X-Gm-Message-State: AFuF++m8+ad2XSKWKv7pTShwznx0AcVOk2EpkX1eAE2PiMUUxHzoRUzo
	rcyB8rD0r2kvqGjDu/xOijhgJy/gaRtMAjJD1lhEWVfFx8Q9YitRaA4MHAmCB3C7g/8=
X-Gm-Gg: AYBFou0StxH5W2o8T4A7JCyj1iAqEyQC2ntc72XNM1hVJqA8VJlk7a8ax7782Mnv0eR
	IvDhjILUW26DbzbDKW7ii+fzRZlcKXAxilEYGEmTLMXLMILeqNrFXLDNy4y+wTUzzboVM2ABHzt
	tpjktyn4EkgdivbrncTBfyu6osVKD9yOslw7R65P5+1C8VEfXk7Qrr1+W6qTsSMRhMmfRX0obw2
	zGQ175osJoeZ2pG4tRwdYJIx/EVbIIWJSecYFyX2tF2hMpp7nNANJSvN/pVvyGBurx480p2EmSi
	KIXLKmXqMvoc9fM6XOqmRkdqgiyQ91/botnqEU7YMVCXBX0EfLawEABAtT7B/s6R4E9cIqC6yhk
	55iJlhLD6ZurcCcl83LoubwIuq5/epftc16g7GIZMBc+FkRmlz3iekoYC93OCrPJIsIh7Lzv+yJ
	ppdue+KX4A/S+0HEFLXU0Tsja6rQl4yIhc6moDGM2ETiBwxEgDFsg70RCmKmCChY3wygTyrmx5C
	jp/v4ahpGX5
X-Received: by 2002:a17:907:da6:b0:c26:19de:9ac3 with SMTP id a640c23a62f3a-c296668e2a7mr154495166b.27.1789123395825;
        Fri, 11 Sep 2026 03:43:15 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.225.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966103984sm67215966b.52.2026.09.11.03.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 03:43:14 -0700 (PDT)
Message-ID: <87e34805-e56c-45b8-a3d8-458ef17b92cc@linaro.org>
Date: Fri, 11 Sep 2026 11:43:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] media: qcom: camss: Add streams API hw_ops to CSID
 interface
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-3-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260911062213.195007-3-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 07:22, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> Add configure_rx/enable_stream/disable_stream to struct csid_hw_ops:
> per-stream hardware operations needed to support the V4L2 subdev
> streams API, where the CSID Rx front-end is configured once
> independently of the per-stream RDI programming.
> 
> No functional change: these are new optional hw_ops entries, not yet
> implemented by any backend or called by any code path.
> 
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.h    | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac..90ee611b9092 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -74,6 +74,25 @@ struct csid_phy_config {
>   
>   struct csid_device;
>   
> +/*
> + * struct csid_hw_ops - CSID hardware version specific operations
> + *
> + * configure_stream() is the legacy (non-streams-API) path and is mutually
> + * exclusive with enable_stream()/disable_stream() - a given CSID instance
> + * uses one family or the other, chosen by streams_enable.
> + *
> + * stream_id, as passed to enable_stream()/disable_stream(), is a hardware
> + * RDI/PIX port index in [0, MSM_CSID_MAX_SRC_STREAMS). It is currently
> + * always equal to pad - MSM_CSID_PAD_FIRST_SRC (multi-pad, 1:1
> + * pad-to-port mapping).

Lets not mix and match names. There has historically been a huge amount 
of sin and liberty taken, not the good kind unfortunately - with port_id 
and write-master.

port I believe is the misnomer we are currently stuck with - so lets 
continue to use it until a more crisp naming convention happens.

> + *
> + * configure_rx() is called once, on the transition from zero to non-zero
> + * active sink streams, strictly before the first enable_stream() call.
> + * enable_stream()/disable_stream() calls are always made under the
> + * subdev's active-state lock (core-enforced via
> + * v4l2_subdev_enable_streams()/disable_streams()), so hw_ops
> + * implementations don't need their own serialization.
> + */
>   struct csid_hw_ops {
>   	/*
>   	 * configure_stream - Configures and starts CSID input stream
> @@ -81,6 +100,30 @@ struct csid_hw_ops {
>   	 */
>   	void (*configure_stream)(struct csid_device *csid, u8 enable);
>   
> +	/*
> +	 * configure_rx - Configure the CSID Rx front-end
> +	 * @csid: CSID device
> +	 *
> +	 * Called once, when the first stream is enabled.
> +	 */
> +	void (*configure_rx)(struct csid_device *csid);
> +
> +	/*
> +	 * enable_stream - Enable a single CSID output stream
> +	 * @csid: CSID device
> +	 * @stream_id: stream id to enable
> +	 * @vc: virtual channel to program
> +	 * @dt: data type to program
> +	 */
> +	void (*enable_stream)(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt);
> +
> +	/*
> +	 * disable_stream - Disable a single CSID output stream
> +	 * @csid: CSID device
> +	 * @stream_id: stream id to disable
> +	 */
> +	void (*disable_stream)(struct csid_device *csid, u32 stream_id);
> +

Seems odd that none of these have integer return types to propagate errors.

>   	/*
>   	 * configure_testgen_pattern - Validates and configures output pattern mode
>   	 * of test pattern generator


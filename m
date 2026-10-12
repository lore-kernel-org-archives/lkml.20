Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13AE3A168E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812773; cv=none; b=kWxhcpBTlJyqgmEh3KO5Pa+AsJya4d2JtTLRMRG69r2EtfP19Yx0sCGCoXBK/24Au/U8ceY0cRaqcxEeQas3NhyGqdVoWsyLMq2AdYCWB1ux3Ruda9xd4AKBnyL/iweWbiBdHRQ652UhdG4ESG+hnvo8u5+1QwjpGulkQYsTULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812773; c=relaxed/simple;
	bh=sTKTqMrlzRhmp4al7IjMezpQjYCs9jIcQILHVFsOG/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeCX25ClQ7CDHE85O3I+IVYMz99WGaHnRu+QjM+VlOJLjUYOho+RXsMhufPxRLVBIacqsqxU8RnOu87IeyaAhWv/qiA2k0d1Lq9ZFO5aOWAZLRU6Lbq2L8oF/DUJKtVFrTNlLqH5qM36UkFuR9cWv5hU3O4GHwH4Z7RgAVxP1ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v32pJASl; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v32pJASl"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c263415982eso219954966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812767; x=1792417567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHws0iegm7/ve8hvmLh8jfg8R/Vly+TZYm5WF3yIxo0=;
        b=v32pJASlphSa6Mc89V8MioFyF5EVZhM/e69oceX53Cjv1k5O/2bMmiWbXXw1SWSF6V
         flvswQn0nqa1+MUUbR4RHw6dNTwwOFMVd9swPn2GpX27dJbxAnnSBQB3fJVvisG8n2+r
         s3fSSWjYvvNcnq7SreR7Zp4kHz4HWpv9XAbKVZeFdz09MO1IcsmhRrV2/MZ5h1loeA+L
         TMTzR/9bLEQpq3tl7CJ42ap2UR2zI8J5vSYXxrs7UWX1eUiyJtrWoJbO83Ujdtq4GLtd
         g3LJyAro0UbMPL5Ia+ycAfZuSELrzbsgK8UJjROALv4LV8D4+5dMZIYdHdfs+K6j3MJA
         S2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812767; x=1792417567;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHws0iegm7/ve8hvmLh8jfg8R/Vly+TZYm5WF3yIxo0=;
        b=JrpQZd8eMy9PWTXxYrqwKVg9pm8nC4zuMOIXyJbZ77FKTFWsmfSzh84b4Xn9QLcxNS
         OWYqwG32rESMLwNSndKtdH0J4fwUk3sJbah8poUsv52Nya912FW5Vvk5uWgEqQ086yc+
         MCtzSZayRE7y0z3yCMqif6x2QMa9r9/2VnoTgtzTVaud5x+y97hM4fc2dgyg79XQYfas
         xg7jY0yZad2dXv/11zxjHfGWgG3aoeJgRuVQWtOQDwcWtX2Au8p2D5usVPPuP19kpjPi
         A7rbdU+MYpqemez+B4lU8ln+w0735rIDckieNpI92TyybAsd/+I6B+hcKXaZN5CmgZ8h
         Nt4w==
X-Forwarded-Encrypted: i=1; AKwUvBwSRBYKS3flozHxZlcno/rcyg/4UHVIhwEX94R1E4ccj0is9Y1cPuzan3D6P33wucdvVZ+QMNjuwX3kXzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxroVRWy0e+WPejIFFycSW68FiyBR/sJ0qOuTgqqryDNHFudOE
	RF4G0OwuXX8QmK7UGehOGvo72qY6ij5dKOK5wvcmHs+zcUsYltpH3JMn3wEW/WWx2TXzIeTYXAD
	j5ZKnp38=
X-Gm-Gg: AYBFou1iyoqZxtp0uMKJkeEi1JA0ZaoLtj3F4LOz1d4/xrFLAtniz04HhLJvplBascB
	w3+T+ZLYdLQQ4+NvFpwjaOpovphTJjg/oablAjGbr2f+3ycFk798N3qZDqBAaTspf+IIaMiDhl7
	7yGa24aVhs+D/znoz4RqPYqZZvB3c9I9tAAFLwZPGKseL9y4fEPKLXDE83auPzEihrH0eqhOFRU
	rJHwr14rJakVe5VcQdwk4x8yrSgYjP7e1Lz8+lWiLKPgeLpKCAM0z7zQEQ0ciJey1iNf0q/KulT
	khBWJ5zJ3o2GYvN5VJQHmbXB1GM5HIllDU7FQDmGMZ06IuMpXEybgLucw2gHXjRt9ysQpip6pmN
	OIKc6OOUS7qOIHGN/C52TMC7yPO4L03SQicUoJrG75ArPLPaYLF6g25v/mYt/zdiT7oy7LTQx8o
	GS5dx/cz2ZPoBznAgwD0fSIfmTinUDId2FX0+dzW1r2hIy0eLbXLus0V5wsmxLr+8iPpzvIRsLT
	OFyeEc3Tus3
X-Received: by 2002:a17:907:2da4:b0:c2e:4705:467c with SMTP id a640c23a62f3a-c31a9fa2040mr978925866b.10.1791812767239;
        Mon, 12 Oct 2026 06:46:07 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a38050sm470538266b.24.2026.10.12.06.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:46:06 -0700 (PDT)
Message-ID: <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
Date: Mon, 12 Oct 2026 14:46:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: qcom: camss: csid: Match the current
 set_fmt pad op signature
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, atanas.filipov@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
 <20261012120542.1140157-2-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012120542.1140157-2-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 13:05, Hitesh Patel wrote:
> v4l2_subdev_pad_ops::set_fmt gained a
> const struct v4l2_subdev_client_info * parameter, so
> csid_streams_set_format() no longer matches the op it is assigned to
> and the driver fails to build with -Werror=incompatible-pointer-types.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 2559ebe98..991275398 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1696,6 +1696,7 @@ static int csid_streams_get_format(struct v4l2_subdev *sd,
>    * Return -EINVAL or zero on success
>    */
>   static int csid_streams_set_format(struct v4l2_subdev *sd,
> +				   const struct v4l2_subdev_client_info *ci,
>   				   struct v4l2_subdev_state *sd_state,
>   				   struct v4l2_subdev_format *fmt)
>   {

Please add an appropriate Fixes: tag and Cc: stable@vger.kernel.org

---
bod

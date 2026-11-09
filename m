Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229075;
	b=JG86qqbxnnewzuInwExlRRx9jJNRaxSVQChM0b9M4IQqWtTL0SDpQ3nuRne2tPywrj5s
	 D9FJ5Kus24VO02GNh8T7nsRBEStYDgr6Oxl/jxC2LBG5+Xr32XhyMatnvrt+q7oCe3UAS
	 1kE3/CJ5RjJmzp4lIgOlhBiarPsCzQdigUFjsDF6HPEdSD+ZUthywkWintKWTA2mB3BF9
	 M4xJtUS4xmh3PYMBF7UZJKaogckHgoBYw2YT3L811MTg1+NBhjpKxs3WvekjyNzznuB+i
	 8rtRxQDzu03Onvagj8EeRBENGQAc/XKmI6MbhOZy437DctCNeEl+NQMLkI0OGFgLnvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wyy6bj7a11JEqmvDJpj3bQb2yikehoJWRBg5g2tkGFM=;
	b=pKi8NrHDxwhXIhjlbpfopKWABwaIvD2opl3FOVlgt/Q5FUxYu+mk1ET0z0FcLpbqEiMD
	 Q1d+/zLtQx2trU7/FUOUf/IveZ6vhAuWd3UQouLTWpjnRLMsa9YhxoiD1mVZ+4bunkajV
	 0rFxtlcxKqJothrTkNdyuxsSfQc+mzfgucu/F+R1p4X3CfMkyrYhfQBjr8/0oKsYghpf7
	 P0Am1sP3HU1EUcQUVfb0RqYoCXWNgZXIDM4HAFHvkd7P3G/mc4O/TqIWVScYSyocY7YXs
	 oY2VPCAS4wfTlFLqlAj/FJpPi7TRJ1S6/Yotbh5r0lHktx2///HkTismB3u/oNgLfFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CLgHMq6l;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C17F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CLgHMq6l
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so7002175e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794229073; x=1794833873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wyy6bj7a11JEqmvDJpj3bQb2yikehoJWRBg5g2tkGFM=;
        b=CLgHMq6lC/oa24etmU5uFOjanSEBhpMx2wF82F4+zWSCY/XU0I9/ziXs+kkm4nYTW/
         /WLu4CD9tygvMMVCsBLZPNYtYB5OIkSIjZzh4Qa50BKbzSu2WxGOrCvGVlhXLQHbmLXn
         x2SiOE4cZ7upzDNteFyZG94MpGO+Vi9zojFzo1RSwL1yVJgexWHA/8HYxG/NhNgqxbRw
         MpkeJbN7s07O3l/IRtucYkIS3xDEQj5vF1rYC23HuZeFmz80NdQQdxuNnVUSKMiKYROy
         8olnNnKw/+SlbL1BLc1aUYI5wRWkyHLNMjTRgVW7qKAXmSAt4Ea1qR4PUfmQu0dlz82D
         QzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229073; x=1794833873;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyy6bj7a11JEqmvDJpj3bQb2yikehoJWRBg5g2tkGFM=;
        b=ysIEMttsfkq7zyh5UDwaTzKWPn9/dNIqR05LNsas/meAun4/TxUjWopsLkkaPedfFE
         hUdAqnLYOG+s9+k/hOsqxcyoj9uxKCHVkeGQqgq4R2UN4WXsOdNtr5QL5R3LRvVZcpKn
         K7d3dJ+5bWDNmVx37n6BWjCto53oo/Xoq9bZCoZo+CTkeb6G3QqIv+BsF4m5ZCF4xW+Z
         DKktyGG6hHgbhwkqOyAyAT/AP11eQ5zhXckJ6rEcelKMLZGLNeG5g9Bws0dr6m7Gmcn6
         oZOd3IPfMVQJNCdV1mS1S4d9fKW+kUfBYXcqW3L1yBtaeIDj2w7dpjIyxMtcVZqk/ZXG
         n0HA==
X-Forwarded-Encrypted: i=1; AL+hErGaz34o+I42vKQWZBUymtxerNq5hcKsb5MjGATYYPw7BqwA8VhkPQqxAmEWGOgtrZnQnPXlNGqs7KD97dk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UAbojgpOg1SrDCFNSV+LvNQQfSfMO/Thl/3I9sTE+q0pVzCJi
	4sxnDZRgHNKmEOQS5VxSk6/YI4hmRelE09Qp9J9sykGRE6vibobqnDt4ydq9nKhTifU=
X-Gm-Gg: AYBFou0fMwkyuO93FhBUgP9qhRHQtb9vsl2YiE+4ZSGwmucybG7awp2nPwS0nLhHiB8
	tJN9dy6ej1utR1RBLVFlHnGpPfOnZNUKiOVK+PftmR0LomJQ4zrJvRKCM1EaFmXrOZzxlneYM6c
	elJ/f3ppZxHx5LUom5OwLsHhPwrRSgq5b8uyn160m42YHLuHh2FBk3MjfBSqkT8uhnpLP+rPROS
	wljUDBt/Ekg0IFb6g+TjRnT5bcOwCpMJtwCEDXZcNhg+b15KRNyKSTD2GTaPkHIj+/zrRyAmsDW
	wR8FwdtiNFS834BdjdZEkLuNQ2ebYgxTyxmWLruNOmbyyQmammfvZdILWyGmpHPAw/ARCgPono7
	zkJFa3sWidk/obqmam/Xwh/+6ny+xPB+OUmfva+22RyolSlFA+TLur5Pb4YfTlPGgTA+iEGn00i
	tdoMBxqfokdSf/H0YH1AedxuEny/grOm139AA5vTO9ICdbG+trZKT4EctQo8Rnwkwdav+ObAArU
	usZ/aBmUKmBWrPPXxMArXYhAgHnbJQcO2G8QJEGYx11z6au69cZEWIqzMpgea5S5O0SMhzI8gGQ
	J8cRiztFO5TPjtQenoHwisaednLKAw8SKiCSTA==
X-Received: by 2002:a05:600c:1d0a:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4b963c6c86amr71185815e9.17.1794229072922;
        Mon, 09 Nov 2026 04:57:52 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm237745875e9.7.2026.11.09.04.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:57:52 -0800 (PST)
Message-ID: <7f8e0938-2b35-43df-afe7-18b0ad917698@linaro.org>
Date: Mon, 9 Nov 2026 12:57:51 +0000
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
Subject: Re: [PATCH v2 2/4] media: qcom: camss: vfe-4-1: program the RDI write
 master buffer size
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
 <20261109112611.94010-3-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109112611.94010-3-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 11:26, Allan Siriani wrote:
>   .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 ++++++++++++++++---
>   .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
>   .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
>   .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +--
>   .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
>   5 files changed, 39 insertions(+), 9 deletions(-)
Requires a Fixes: tag

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> index 9cf1ccdb2..53ebc12c4 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> @@ -107,6 +107,7 @@
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_UB_CFG_OFFSET_SHIFT	16
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(n)	(0x080 + 0x24 * (n))
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(n)	(0x084 + 0x24 * (n))
> +#define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN	0x3
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_FRAMEDROP_PATTERN(n)	\
>   							(0x088 + 0x24 * (n))
>   #define VFE_0_BUS_IMAGE_MASTER_n_WR_IRQ_SUBSAMPLE_PATTERN(n)	\
> @@ -269,14 +270,39 @@ static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
>   			    1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_WR_PATH_SHIFT);
>   }
>   
> -static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
> +/*
> + * In frame based mode (RDI) the write master stores the incoming data as is,
> + * with no line structure. Program its buffer size in WR_BUFFER_CFG (words per
> + * line, lines, burst length) as the downstream msm_vfe40_axi_cfg_wm_reg()
> + * does, and clear WR_IMAGE_SIZE, which may hold a stale line based setup,
> + * so that the write master is bounded by the size of the V4L2 buffer.
> + */
> +static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm,
> +			       struct v4l2_pix_format_mplane *pix, u8 enable)
>   {
> -	if (enable)
> +	u32 reg;
> +
> +	if (enable) {
> +		/*
> +		 * bytesperline is aligned to 8 bytes (one bus word) on the RDI
> +		 * outputs, and sizeimage >= bytesperline * height.
> +		 */

and sizeimage >= bytesperline * height ?

Which sizeimage => pix_mp->plane_fmt[i].sizeimage ?

This feels like a slop-comment which is no bueno - please read this 
stuff before posting and make sure it actually makes sense...

> +		reg = VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG_BURST_LEN;
> +		reg |= (min(pix->height, 4096U) - 1) << 4;

I don't agree with this clamp lets just have a consistent logic albeit 
flawed with vfe_wm_line_based()

=>

(pix->height - 1) << 4

Silently truncating here is incorrect. If we need additional validation 
it should happen in try_fmt(). For this patch just stuff into the 
bit-fields the value given.

---
bod


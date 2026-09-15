Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B93B0592
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463475; cv=none; b=QIkqAl86VFE8xqWossGekVpkXvj3AZxVdPJqJpjeTiDxf+lVGatmv9F2xOurG0d5FtrZTxl6dI0yA31NWsoDZp5MW8LJxpc4FJ3jtDfe0o3ok8uxPLgyJMCHRu0lbqefO8IPkVmS2mkvBHL0W4ZDC4qwexpzBn4qK39FsgFnBR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463475; c=relaxed/simple;
	bh=fQkaQGH966gFPO5U3wwOm+ett7I82/RABfQ7YT2NVGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQt61pScWxXkPm41JKFY6HXlYDumJ4LRoMDvdCvDBH57Nz9OM9xu5M6MlD8eBzz9pFDu+aumJJKkFm/zAtvsJxshiiK/sI8lQLBaBn+2lMw8lOXP0ZjDnMMxBOhO0roYx3a1KrPjOZeks0F4z8GGe+ua/fzgccTZux0zegoBKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CnVacH6R; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnVacH6R"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so1192550a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789463471; x=1790068271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4S77UvxmKvQGEySDdGGt+bawAL6b3X54Q38xL2/BalY=;
        b=CnVacH6R6tI+sMYnpardK/lSWHogum4Dv34ECxiVVx5po07L9D4EHGlJp/3zcgFvLG
         crl4KhDkiCcvJtAfkuE2Vl6XhKZw2yqv6E2k325vbbHExBtr0RmYVB3zITdX7/7F4XZA
         apBXWwiyVrkXD9HGkAu/OvXi73naLPF6RxI6Jt5MVzesVQ/izih7kmR3bPgpRKBk+skp
         28+jfNSoH/kgZJMcV+Futv0Huo3NqzE7hLewDjqvG0kiPmrrP3pbsseSaUCcYAcZ9cRZ
         G8yQLRRSaqg4Q1kX1qn9jT+jooKw4Obl8NX6guEqWv7SbVrdz6rvvF3yV24eKQ4Rpa50
         WExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463471; x=1790068271;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4S77UvxmKvQGEySDdGGt+bawAL6b3X54Q38xL2/BalY=;
        b=055iQs+W/Mod9x+3dja8j5r0DhFKbUzYGw+qX2gkPiLPk4JKK8BE/MQW5hzsMYuDip
         hJDp9S8xLOrRpqcK/NYLAtrcCdpLRXezn7P7vZ7Kxz5Z0+sGo3fuqdjjFvgQ2RCUjJ0P
         0V11NTzqRckQ1gq5T8yoCOWPnP8g8+fa95/S3w6A3O5N5/FCGnHwfdevT33I1rkAlMd+
         ga1Vz2qwHoCnSnIbK8PzTv1fAqUiJNfY17zOxa5IK7Jx4JYWj7Up3zUcgq/rOGLZeVNx
         Osd4Zg85LjKTFShJA1cEM/5a7rGbSfldolpSnctbPDK18w7yVeHF6fV/UFKgfOrPlTW7
         L3AA==
X-Forwarded-Encrypted: i=1; AKwUvBxBcLg5fRY7waPl3kJUqocq+dD/F03+CSvv+MZ3qVg88LzpXENL3VXLEFbs34cYZHWErMIgPaHHq9ELiYk=@vger.kernel.org
X-Gm-Message-State: AFuF++n9z5aipbRvIifvDvBeXCMMCKxgKfL2SFZ/piNnxMAZOrNrKvU7
	N38G6E0oivtRR+eba+1fu0NP9dRQf+d6PKiIxNaZX8XW2NGzZSCWft7XHLjXxi3SK98=
X-Gm-Gg: AYBFou2P1+lrGuMwYr5HVrykGIo217H8wKiSZErSKt9AoYexzFZbzJe9EQ3mcTo01vq
	+91uIg/kECLSNraTF827LUztGH/40Lv/pEw/boA7KWhG2TiH161YeHPSLrMxwASieJaji5fxBN0
	4XrnB4w6k9zs1QocBZ3iJNfPlbrf8feTGBS1jnoIR9yKirWSUSd8YUvKVRGRzWuUqSDv4yyszRa
	cyCxUkbqFGZLARCMK5ybzrw+p4pHe7DhFA6BD0YY9JulSf8OsFa+IztDigW+S7H4AkzKn3nSz/e
	JvXoldFa9lpzwVcd8ZvTjl+79a0FlpSTbhgMishL6YaKaJ68tMj1wH4cUQ8XMyBTFHpO8udxdo4
	iX51rUgvL2lcgI0zDauIFSp+fQFhGK83xBD3e764NMhCz1PkEga7jH/9kKCO8d8AfnaVTaqWYXP
	aKZ5XGy3yRLTxcaV/bGIDYLuWahYmsVwhz57B44e/pO8VMvZp8drcpA6vEl2xPsEckkY+hPResV
	dOeB0KDTJs=
X-Received: by 2002:a05:6402:e8b:b0:6a9:d959:c94e with SMTP id 4fb4d7f45d1cf-6a9f63cd955mr3622644a12.25.1789463471264;
        Tue, 15 Sep 2026 02:11:11 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.15.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9ba8f3ab9sm5100887a12.15.2026.09.15.02.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:11:10 -0700 (PDT)
Message-ID: <4b8f4fd6-53e0-4efd-953a-cd8ebad7d479@linaro.org>
Date: Tue, 15 Sep 2026 10:11:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-4-77b13d131d3d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-camss-isp-ope-v7-4-77b13d131d3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 09:11, Loic Poulain wrote:
> Add the uapi header qcom-camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> The block type enum is shared across CAMSS ISPs so that userspace only
> has to deal with a single set of block identifiers.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   include/uapi/linux/qcom-camss-config.h | 212 +++++++++++++++++++++++++++++++++
>   1 file changed, 212 insertions(+)
> 
> diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e3d6cc4df7de00345e8142c81392dd42338c6ead
> --- /dev/null
> +++ b/include/uapi/linux/qcom-camss-config.h
> @@ -0,0 +1,212 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Qualcomm CAMSS ISP Driver - Userspace API
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> +#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> +
> +#include <linux/types.h>
> +#include <linux/media/v4l2-isp.h>
> +
> +/**
> + * enum camss_params_block_type - CAMSS ISP parameter block identifiers
> + *
> + * Each value identifies one ISP processing block.  The value is placed in
> + * the @type field of &struct v4l2_isp_params_block_header.
> + *
> + * @CAMSS_PARAMS_OPE_WB_GAIN: white balance gains and offsets (CLC_WB),
> + *	&struct camss_params_ope_wb_gain
> + * @CAMSS_PARAMS_OPE_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> + *	(CLC_CHROMA_ENHAN), &struct camss_params_ope_chroma_enhan
> + * @CAMSS_PARAMS_OPE_COLOR_CORRECT: colour correction matrix (CLC_CC),
> + *	&struct camss_params_ope_color_correct
> + * @CAMSS_PARAMS_OPE_GAMMA: per-channel gamma correction curves (CLC_GLUT),
> + *	&struct camss_params_ope_gamma
> + */
> +enum camss_params_block_type {
> +	CAMSS_PARAMS_OPE_WB_GAIN = 1,
> +	CAMSS_PARAMS_OPE_CHROMA_ENHAN = 2,
> +	CAMSS_PARAMS_OPE_COLOR_CORRECT = 3,
> +	CAMSS_PARAMS_OPE_GAMMA = 4,
> +};

Most of the OPE specific naming can be dropped, I shared the ICP 
data-structure analysis already:

https://patchwork.linuxtv.org/project/linux-media/patch/20260426000346.1158633-1-bryan.odonoghue@linaro.org/

i.e.
> +struct camss_params_ope_color_correct {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 a[3];
> +	__u16 b[3];
> +	__u16 c[3];
> +	__u16 k[3];
> +	__u16 qfactor;
> +	__u16 _pad[3];
> +} __attribute__((aligned(8)));

For ICP I have:

+struct camss_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 a[3];
+	__u16 b[3];
+	__u16 c[3];
+	__u16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));

So this data-structure is shared camss_params_ope_color_correct -> 
camss_params_color_correct

> +/**
> + * struct camss_params_ope_gamma - per-channel gamma correction curves
> + *
> + * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
> + * holds one independent lookup table per colour channel. Each table is a
> + * direct (not segmented) map of input level to output level.
> + *
> + * Each table has @CAMSS_OPE_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
> + * output. Each entry holds an X-bit output value depending on internal bus,
> + * the upper bits are ignored by the hardware.
> + *
> + * On Agatti OPE, The module maps a 12-bit input to an 8-bit output, the top
> + * 8 input bits index the table and the low 4 bits are used to linearly
> + * interpolate between adjacent entries. Entry i therefore represents the
> + * output for input level i/255 of full scale.
> + * Output range: 0x00 = black, 0xFF = white.

That's not specific to Agatti, its hwo the Qcom gamma silicon works right ?

Same RTL synthesised in OPE, IPE and IFE. So you don't need to make this 
OPE specific commentary.

> + *
> + * How to fill a curve (same on all three channels for pure luminance
> + * gamma; different curves per channel additionally shift colour balance):
> + *
> + *   Identity (pass-through, gamma 1.0):
> + *     lut[i] = i;                                // i = 0..255
> + *
> + *   Encode with gamma g (e.g. sRGB-like, g = 2.2):
> + *     lut[i] = round(pow(i / 255.0, 1.0 / g) * 255.0);
> + *
> + * @header:  block header; @header.type = CAMSS_PARAMS_OPE_GAMMA
> + * @glut:    green channel gamma curve
> + * @blut:    blue  channel gamma curve
> + * @rlut:    red   channel gamma curve
> + */
> +struct camss_params_ope_gamma {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 glut[CAMSS_OPE_GAMMA_LUT_SIZE];
> +	__u16 blut[CAMSS_OPE_GAMMA_LUT_SIZE];
> +	__u16 rlut[CAMSS_OPE_GAMMA_LUT_SIZE];
> +} __attribute__((aligned(8)));

For the ICP I have

+struct camss_params_glut {
+	struct v4l2_isp_params_block_header header;
+	__u8  instance;
+	__u8  _pad[7];
+	__u16 r[CAMSS_GLUT_LUT_SIZE];
+	__u16 g[CAMSS_GLUT_LUT_SIZE];
+	__u16 b[CAMSS_GLUT_LUT_SIZE];
+} __attribute__((aligned(8)));

So it makes more sense to differentiate the firmware type to the 
register-mapping type. i.e. the above becomes camss_params_icp_gamma {} 
whereas your subumitted change would be just camss_params_gamma {}

> +#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
> +	(sizeof(struct camss_params_ope_wb_gain)	+\
> +	 sizeof(struct camss_params_ope_chroma_enhan)	+\
> +	 sizeof(struct camss_params_ope_color_correct)	+\
> +	 sizeof(struct camss_params_ope_gamma))
> +
> +#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
> 


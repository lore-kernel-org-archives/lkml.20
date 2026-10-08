Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439A01A6807
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457908; cv=none; b=qgH4HQrrYP65LE35BFhnxgLZcGtHpS+DXO/DkKfbDET8JZGtZ8JhkTEaLF53f5j/gKWeQ0kLvHAjTi8h1esLcwjy1kHppGnUTaXge+iILjKA/MfqRLb+t9qXn11H1tO7jqHnHxfD+4aG16aRtm3/bnT2Ccji+gDywGz8t31MYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457908; c=relaxed/simple;
	bh=09yRFoZuygdD45EUDMQtl/Q4C8O2MyJRR3brstd97FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFBHXDgs3UXdYTWBGJDxTJV9VPVdg9DEV5AooWOHj/+qhN6yYkM7S5+OMoDU2EXm13RMKjMceg2Wslw2YzI+PWkQfWq9xaP3jmeM9GNLtkUzssoxZB52ef9uYYUjxC4EHz6p48OEBM6HYJeOBXaZwlnovQERsfsGhoxLY317Uhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CzwByk7D; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CzwByk7D"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2362083a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791457905; x=1792062705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xXvsj66wQM38M1X8uFAHXI+21qnaIAFX1qmFu6hhD0=;
        b=CzwByk7DDSa6l/Fe7qcB309ljXIGtSjAIH79TqFh3EDLGT0qpOmsKsWaB4J3Fsy3JJ
         kGtZMJ+rvDVe6J4vXP+a/d/QqY5NE2vd4YxLLVv9na6fkzMQ1D7Rn4blk+M1YjH3+RWv
         4Ln2/Io1kIc6pRzRRusJIBhHRkQ2vgQrbrX/3gPwdXtzTQoLGGgOuZ3faJ6u/HLQucGt
         aYl0RMHN4QCNjMWxWPAmirq3ZOuCOXXgvzlmayj/fsBAjb5D1cGixDCX2WslmRZ/w7aZ
         oxD/cPhq4+qmJdiP409IC4DXRJk7N00cNoR9UoglyIRkrqT390lzLm42ZDOlxGER4ktk
         vhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457905; x=1792062705;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xXvsj66wQM38M1X8uFAHXI+21qnaIAFX1qmFu6hhD0=;
        b=wDUNWRu6Hucw1deiBhHKr+VWDNz6rtLWIpcN+OVm8oms4ZsDEQCfqGO+sWyC6yFs7s
         G74KeweLRen/6o6I8ZwrdDA5qip96noFWutSWm8LNO7IDnbulSdpO3umZm6daCstig1A
         ZhuCweLYFm14bJDSzvOwfUSlbWY6XF/Cw/tC8+fZ0kw3Tq7P2xLuwrKOjeJ3LyylMD7X
         5pikbg06yPYIZw3zoI6/2AJFvnp5HocGy0CKGB1K8veSAudwTpsYBZivc2O2CS5HsIBG
         h3bA90QbKDLI+pnW1Re9qY/5VqBCV1ImnpOwp4mtGMYDj72HLnAEZmXvD2+sVLJyAHne
         oMTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4ArJxuOyqCppCJ7DH3s5w/4QWUfTz3eQfQJvxs75aFf8TYjYx/Mo6Y4UZsKGKUzlzM1xM1GkGNwnHPnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDFVz1Ymy9RzuBuPEw5kEVxqIc6n40xQs1W7kgsTLnHCJbNIEW
	VkdDDFNQafvxiQBz0LKAB8bcckmxJH+GEk0kU/pV/Wx9NXkAcU8HZMqIpqUh9mEqDwE=
X-Gm-Gg: AYBFou1p03U4TwCCqeAdAG8BVI3ha9K2MAh7MAWEL0sVUl86uOWoulkB0pWaBi5ZVt/
	jzHy1DAabyYOBRsKSFUy8qIT9tsnGdlZYUALE9PdIAGr/OXhijFlueC9SRfb/sdrRJWPH1J/j3T
	nGya6hB+u+lsMf6mZTsazkfiOuiMwzVcjjEvVErun9hsdZAKk9kB1lkLfgmRlshF8e8pSKXzhZM
	mQMIqdsKeDT9wgbdlR6LLVraIDlauTP+KrHCofTVQozKUsCCKzAGIKO8z+05U5pO5FLLvNOxRXq
	3fZEeQqAK8CavnFTSz306nyYCIC5kHBVK0sdegGRawKy7nk01ORBcdAIgllyQaaZnZUtIvUH7aU
	QVV14nH+7RGO0Oz0J1ChlaFW+HUd4qOnnkjNVJwhR9kx+TfU6X5KThVue36v28JNxTLNVTetHxR
	UaOWWdqXLYISRlJ7+xV5/bAFWBbtFQoB7HyZ/crgvMmWLCojzfZbu/i3wFm7ss4LaHfgLiNYEwJ
	GbAIsysfY1o
X-Received: by 2002:a05:6402:46cc:b0:6ac:bdb6:f245 with SMTP id 4fb4d7f45d1cf-6aff47b4913mr4165062a12.24.1791457905432;
        Thu, 08 Oct 2026 04:11:45 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b00aa492d2sm1245502a12.32.2026.10.08.04.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:11:44 -0700 (PDT)
Message-ID: <5d4ac08f-b525-49ca-8715-b4c2fae1c11a@linaro.org>
Date: Thu, 8 Oct 2026 12:11:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
 <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2026 09:27, Wenmeng Liu wrote:
> +static const struct camss_subdev_resources vfe_res_x1p42100[] = {
> +	/* IFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
> +			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 345600000, 432000000, 594000000, 675000000,
> +				  727000000 }, },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 4,

.line_num = 3 until we merge PIX support please.
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
> +			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 }, },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_1 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
> +			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 266666667, 400000000, 480000000 }, },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,

VFE lite has four RDIs so this stays @ 4.

> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +};

---
bod

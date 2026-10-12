Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F9437B003
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812668; cv=none; b=IDLqngVmsWDb1ITx0ikIqpL0U1TZzKlwQLcsU6nXKwgFBZl/rRuEqxTgyrL1xHlQHa/vHJm2Tcy7kIflwX30GYFQCySgCtI4RattABcUkEoM6AUpX8ItshvdnC5dEfjKpjw06K6CrFu4UufSrOAn5A0/AdNtnL5I4futLPOOuuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812668; c=relaxed/simple;
	bh=PHhDicVkoiLyHRl6HYWXDp7oB3gEBNszce5FCbtHAFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oujZSnKZvxIhm/IeTKtL/+fO1ZZNSSgek83ixoeXjV+GO09j6TrpaFN5h7vUE78Aa1O9iQBn1OnYYIAkKk3Nmuc6VUYbUMpq54/9TjnnmRQj5HyxrgbRdbwVMAuvxYF92BGjH5G1yXPMl0qu1Sv2TEvVPi1v1+oe40YVlCtG+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyDKFw/t; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyDKFw/t"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ab006eb282so2392871a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812665; x=1792417465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=slJcaotleR//bI8CYz8vjAiqPihT3cE676B1O6tN4xI=;
        b=oyDKFw/tFWYLHKy00Bhmr5nZQefjgmSCcDBntbbeV5QnuNAECc87/cthHJLmSBDJW0
         al17WVXGdzdeK0TyXuxwU/YcCvO6g2GkTKMsNScJbkAPQoUQAiKZ1ZOkDxNH5djh4i+C
         54VokihF3z1Kyx9Mqrd/YuNvfEJBZjbmKoXhIMmMvTq3KFzaDaT9rMztHXA3NmXwUzo8
         d33u5xy9QtnwwslPI/hBN2QfK9MPgZf26zkiaFtjsnhqN41SGeNqrKroHxmqhY0T6Af+
         D1cPb0LRv9yrMNIE0ToX9/RAgU0WN7pm1lOMqJxVusKU9H0dOndexzqBx+DA/3GiezxU
         VgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812665; x=1792417465;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slJcaotleR//bI8CYz8vjAiqPihT3cE676B1O6tN4xI=;
        b=I2jMmnf7tgEvYkLdAH5Yu7bQgY7rsyvXWZzN5RO+vDkbcfplz4fQbCkolLSPyOjyeq
         6PgavqHSRve8+oKFxfStIyP/IK6UVO7b98Wxj9ssZmIVnVPxB1kuq4Yj4ZaBZfYWyYpC
         DvRScKGuHRgMgH4RvLGAbCSTY6Z1d8OlwpGMpPN1qiUsF6ljZlNp/jyVxBNSFpfwXWIK
         X8iPGNu3U0bPt91LwOobpiJRHa8/1ZQKVBojNhehAw3HTjGPZtWC3pTqeokpsRWLpQn0
         PfgW4Y9Kg1NeyYo6qY6ADeel3volCCAJU5Pq7E0iczrZXedr5jvFvXEa3zS6YfJ/j2N5
         /Ykw==
X-Forwarded-Encrypted: i=1; AKwUvBzzFX1XNhobPZdIvpf7XoPLyI2JtbARYg5UzHdWmqzjkRUkIRpHg2GrWbz3toc1jOVS097trUuysS8MmtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpljXEMhvGLQs172dWTxj/FN8XWQQmHF2Pr905n8J/YJJdc7Or
	ukNycD2fKx35sV807B3qH/5J8QSSggeewbHeIRTO+4+E9BeappChZmE1a0sY+yoDJjc=
X-Gm-Gg: AYBFou1GGY7J+Y4eAV6cPtH5lWNw/zX3MfQtNj+wzVB6d61kKifXFo0vWRNKp6cgjsn
	IkDbwdbgGmjUJjtnRhv7PMxRDPJk44rUx6miRuOL8d5+LsYmMbdEtWoDPkfYE0Fwu98R6jW3pTX
	F7g4h89sS+16MRQHUSvJJU0cpTP6GXw10SzFx2VvpY6rbpWYT62te4Wd1Gx927FcvDyO78tCHYq
	vbhMSh2rVYNiiJcyVdIAvoRan4+LutUH/By8uhAtj8tUSDIgqornMWweFO+7lWqAWndWqzCrjNk
	Zot1fJcMOKGQ1zri/6/J5ePickZCGCyLGXJ7ubU51KyIzBOWhIM4OtcLn7mRmquXgDdf5oEqB7d
	8XBZKhR3P7jFh1xSjRvJFGM8dOR/R4yDwijUbhUlP/wX6KR00eHgCcFsW9Bm3fdMvCTyujFg8Ue
	z4UqYmaMABpUanNrV+5nnZhDCaynqfwf/tZm7PL3LCgl8uEhT47ZXmBe2pV4uUre+cojSsqarxE
	+3pwpOonPeA
X-Received: by 2002:a05:6402:529a:b0:6af:a270:b2b2 with SMTP id 4fb4d7f45d1cf-6b17c163ac1mr9457773a12.0.1791812664516;
        Mon, 12 Oct 2026 06:44:24 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm1931375a12.12.2026.10.12.06.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:44:24 -0700 (PDT)
Message-ID: <4b0c7760-ea60-49ec-a21e-7aff07f8130e@linaro.org>
Date: Mon, 12 Oct 2026 14:44:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
To: William Bright <william.bright@imd-tec.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
 <20261012-sm8550-camss-tpg-v1-2-620ab6f151dd@imd-tec.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012-sm8550-camss-tpg-v1-2-620ab6f151dd@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 14:03, William Bright wrote:
> The SM8550 TPGs are hardware version 2.1.0, the same as x1e80100,
> so describe them with the gen1 TPG ops.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5128dae79103..70f327484503 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3553,6 +3553,54 @@ static const struct camss_subdev_resources csid_res_8550[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources tpg_res_8550[] = {
> +	/* TPG0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg0" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg1" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +		},
> +		.reg = { "csitpg2" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources vfe_res_8550[] = {
>   	/* VFE0 */
>   	{
> @@ -7245,12 +7293,14 @@ static const struct camss_resources sm8550_resources = {
>   	.legacy_phy = true,
>   	.csiphy_res = csiphy_res_8550,
>   	.csid_res = csid_res_8550,
> +	.tpg_res = tpg_res_8550,
>   	.vfe_res = vfe_res_8550,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.icc_res = icc_res_sm8550,
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
>   	.csid_num = ARRAY_SIZE(csid_res_8550),
> +	.tpg_num = ARRAY_SIZE(tpg_res_8550),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8550),
>   };
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

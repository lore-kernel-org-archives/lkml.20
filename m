Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C54A8432
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048556; cv=none; b=KXgzUO7Vsv9DO/xhaNTuV2SSk9OF++veIz0G0RhNEuSueoiwneT1EDaHg3Mn5I/kBPIV7FrweXH+d8V/1ybx3MYZUzunA0l7Vg5JA8zyl4JiXyh7M3jEzeymcBx3tcxM3XvtckW4BBKAHuTQbmuE7N34HvTl1/woyAHu3Yo79mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048556; c=relaxed/simple;
	bh=vjC+BasSM2A5pqOKU4kst3CVWxdJ8H9DWDf0gHYFgJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4S2XQMsI3xSq5d+zo7pJfFCiRIMgKQnzS443AOyO9snSVQfbPXEhquJtudUgh3xQa68y1YI4fd7gD37iqww4sZ7dljOmkGm0Ucu7yyRZcbjmHdJBQyac8X2nE04R0sHkBd5iXP6bR49u2Hl0dQPy+yiLiS9PYTu5wJ8G8BJcA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs0WUlmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jirIuTnH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs0WUlmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jirIuTnH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6ra6p1682652
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=; b=Xs0WUlmOsjvUIFWm
	VGjcxKvZv+I1DWj4+mZpbWUfagOhDigL5ylhevrFn31lYSj0HV9NGxg+gKJF0gAi
	Pn6kCSzrDslJzpMItz2hxi3qXfs20wR7NT9YhjFv6mzs3oOvaY+eBKiU2iMH4RNx
	oZ5nBU+cWITt8NPaN0ciPBWmP9GeFz25yHRZWA7CMJWkhTO72W9cMCZvxzsq8Ut8
	ORjV7FXDdQpFHIOoQaP7YmFLYX4bLnPNV/pjLaKoE1464TPWqFLXVOso3NOnlLWq
	jsmpKzBfHpCGm51RAHfx8rO9U8D+/a2izpAtnyDNEAVyymmLQRtVHkXAyHPEIahg
	INctFw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb037ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so2596921a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048544; x=1792653344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=;
        b=jirIuTnHUksjcJ82dC1k+2LvN6jLQxqnJIGpEDyyS1xExEGWg6bw8KqG/Y2zYfpGo7
         ScYf+CJOW53lcoBcpOMicRCSOPlkvvCuxCr5b3Wsv6EKrLUv04Q1/ymd4yDQCTD3Iu8d
         DBjPgKdc0id8YKYDr7FAJGFaAwO3vketpNf1FLcNBxPN3NVBJvwpFS1joofuQIC3XmJg
         MNPCXAt0HrSkNYfDictiRtuHqRaJMgVnCDSX517U2HtLUEIxofTI7jj2qxJR3crlBDHZ
         L6qJ5ypdxmiXtyLXldMRILN3+ZHYOwwyNqWlCG7F/kIUAfScxH4XkCCGx+CxHHHajypm
         5F1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048544; x=1792653344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=;
        b=JURJMWibQE0/8d6/bwy8W/J8Snaf2I7pdqMDAkyCtldoNgXuzhseja8TFqmgUYKmFH
         tZiPvuZG0LOzY2p/kFcXQtkewhQWBYH8JFyP73J1d78JGPlY7z1HRFrWaM4N3KAO+0vR
         mNMc8Rz4GsFd8deGDjEDZy+h88NmX6rJ7mMo0k8ioOq06XxEaD9Meeu5bKHQk6SKqYQw
         4+MRgIamBP8tAeEFqx6eSToR3tWQYVXnEWfiahwIEZUiXoYncG9YLNAJ570x0AM2Z5FJ
         jG7CBHCVm8dEvOGJyniR6XPYPxQ0NPkomrTaYfktjvdl+DI3seYp4iC/63ttc6eTv2AR
         0XNw==
X-Forwarded-Encrypted: i=1; AKwUvBx6C2s0Qan6bDFhVl3wpiTMUjjTm5C5ZBkIWSDFX5b/auQBmleQ7v6mB3HFM9EeVKKE4/1lmGZYwybXhZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPi3+p4Ee1NKdXPKq+eFxc+u/Yd5wItCXlKllcGPcbdFaREMUx
	+8ectGQim1JHzG71MY1+mzSG5w6LxhVMYWZu9Ti/lstXo8RnT7u/V698QFnR2rTL68sVR0snM2T
	AFxaW7J9PAQl0Z+eM9e7ZxGO3+vicfiUuHaJpG+AhynkvCdajd9JkpSVxSo5HqYYdVoM=
X-Gm-Gg: AYBFou2VxXmfEWrSWGz8M8mxSvUx639S6uoiDnWg5/q6//J1kdej8EoXexwE5Glw6o5
	S+VvQwxEE29YfHjfwzRRsiuCQHPNpJ0pamYpnDAPxmvbPAHqsSAdduNpW9Fpelsw89XNQdYXrNB
	h0ewQsgYKHhAD821ApN+bcvATy0pK4NIFbrdF2VIZTM8troPlz9GO0AA4OnhtZjkhhNFlveCoBp
	deXI72Iz52EtxpVsoFHTMBFPKqCVnxYe6BA3OH/48qBnS+K86I+cIuhiS3S3MeqPlX3H/wn6VMm
	K0nl6YUu6KodCCfAKeFzbj4iUyTH869n5EMIQKQVMIoq8trUS4NobqtaXbcI+5HsE6pYs51E99O
	ORY6Kfprs/A74td09kdZPf0BbjU4=
X-Received: by 2002:a17:90b:1d52:b0:3aa:fc22:8ab1 with SMTP id 98e67ed59e1d1-3ab3a8a1ad5mr16246287a91.35.1792048544144;
        Thu, 15 Oct 2026 00:15:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:3aa:fc22:8ab1 with SMTP id 98e67ed59e1d1-3ab3a8a1ad5mr16246267a91.35.1792048543623;
        Thu, 15 Oct 2026 00:15:43 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:43 -0700 (PDT)
Message-ID: <0691ab2d-1ca5-4140-af77-05bbf718d205@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: Add a driver for PDM GP_MN fractional
 clock divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-2-1522662b6c53@oss.qualcomm.com>
 <h7ai3qajk4yq2jgvy6etqpchxuxo56sxtvcgvh7xhodw6jkias@ayn2thdck4ct>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <h7ai3qajk4yq2jgvy6etqpchxuxo56sxtvcgvh7xhodw6jkias@ayn2thdck4ct>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad07da0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=a29RP2Si9AT6pp-L1QcA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXy/cueF1y8hAm
 8baA1dzz24NrBXeKNbAoFhVNKc+6ErkKkFPQHZK/OTtftu1kWQFAR56xCILSiqRd82TSL1Ofq34
 oqv7Ov4L46O4i160EdmIHwzbJZbnxik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXx4gZTQ1SdC1f
 QJbQLa2w3pkX37RQzGL5DU0Ymencw2PPu6sJYM3slCxXFjQ2prVIZfDZ3SLY8nBvl1d2RIoxTMW
 XuRi8mAyjbX0pngWG9y9cf5BOWyZf7aA1Sw6HQCfd13ecn/9XCvY3BSH1FOrWJUAXdfHK5tDA52
 TteTcKNdTJa+dsoymJqSxCAL6StgS0xUzD+cudB2IUsnfSNIO2wvuaVujqVP+Y33/Hy0hhrCEnG
 khZ9bTzYOrgJKm9AjAdYhAlFWnJsJ/slX0WlEIHcus22zur6LuwtzatBhPbhHjgZIQdjk3AnR6D
 fu7Sq5UEDoaC0IGzdDlGE84G7uWvohOi3FbSaQ7CbSpavVaBgyozJggtO/P2pGjxfgXyVEi1k5Q
 fuPwvwm1L9DdGM7DwjgaUXG+MrDIpcwIc4/DXxkHp0cTUDxEbTi8uLZXx+g9L48AcB6BANQNLmY
 5oERwg1ja+vfJhIJOXw==
X-Proofpoint-ORIG-GUID: wvHg2bcIoxy_liSuBWX3KunhMUbcSkqK
X-Proofpoint-GUID: wvHg2bcIoxy_liSuBWX3KunhMUbcSkqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/8/2026 9:01 AM, Dmitry Baryshkov wrote:
>> +static int gp_mnd_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +		unsigned long parent_rate)
>> +{
>> +	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
>> +	unsigned long m = 0, n = 0;
>> +	unsigned int d_val, n_val;
>> +	int ret;
>> +
>> +	rational_best_approximation(rate, parent_rate,
>> +				    (unsigned long)GP_MND_MAX_M,
>> +				    (unsigned long)GP_MND_MAX_N,
>> +				    &m, &n);
>> +
>> +	if (!m || !n)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * When N = 2M + 1 the valid D range [M+1, M] is empty; no duty
>> +	 * cycle can satisfy M < D < (N - M).  Reject before touching hw.
>> +	 */
>> +	if (n == 2 * m + 1)
>> +		return -EINVAL;
>> +
>> +	ret = clk_prepare_enable(gp->pdm_ahb_clk);
> Can we use CLK_OPS_PARENT_ENABLE or pm_clk instead? Having to manually
> toggle the clock looks like a coomplete overkill.
> 

Sorry for the delayed response. Yes, I will model it as pm_clk.


>> +	if (ret)
>> +		return ret;
>> +
>> +
>> +	ret = of_property_read_string_index(dev->of_node,
>> +					    "clock-output-names", 0,
>> +					    &init.name);
> Do we need it? Can we generate the name instead?

Yes, I will generate the name.

> 
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "missing clock-output-names\n");
>> +
>> +	gp->hw.init = &init;
>> +
>> +	pin = devm_pinctrl_get(dev);
>> +	if (IS_ERR(pin))
>> +		return dev_err_probe(dev, PTR_ERR(pin), "missing pinctrl device\n");
>> +
>> +	pin_default_state = pinctrl_lookup_state(pin, "active");
>> +	if (IS_ERR(pin_default_state))
>> +		return dev_err_probe(dev, PTR_ERR(pin_default_state),
>> +				     "missing pinctrl default state\n");
> Isn't it done by default for you?
> 

Yeah, I will move it to default.

>> +
>> +	ret = pinctrl_select_state(pin, pin_default_state);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to select pinctrl default state\n");
>> +
>> +	ret = devm_clk_hw_register(dev, &gp->hw);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register gp_mnd clock\n");
>> +
>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &gp->hw);
>> +}
>> +
>> +static const struct of_device_id clk_gp_mnd_match_table[] = {
>> +	{ .compatible = "qcom,clk-gp-mnd" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, clk_gp_mnd_match_table);
>> +
>> +static struct platform_driver clk_gp_mnd_driver = {
>> +	.probe  = clk_gp_mnd_probe,
>> +	.driver = {
>> +		.name		= "qcom-clk-gp-mnd",
>> +		.of_match_table	= clk_gp_mnd_match_table,
>> +	},
>> +};
>> +module_platform_driver(clk_gp_mnd_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm PDM GP_MND clock divider driver");
>> +MODULE_LICENSE("GPL");

-- 
Thanks,
Taniya Das


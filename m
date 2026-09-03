Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A754489874
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436774; cv=none; b=GCtMxpRdN7hrkEwCCUt4GF9ECfRvmpI1mvUBMrWifk49aBYwbeGP+Lbk1fHo/ibpgWMQfzaO0lDTmC9Qu44cmA/v6qXUkYC6dk1QeVzNj4+VK1BWMPdZSEZ5H6cfGwbJhMQDIzqT7CaoSN3ojDwCAn71c+oBsPWZxjUCQgxsh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436774; c=relaxed/simple;
	bh=7QmXtZAxTs7eawrjZ02CXScDt87oRJ5G/NUCVI6qPuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dr4vfcPIKiK2kRAszgLJ0qYdFJMPlIcHI16gIgn3Bd8OPHtVMmUh09+Us0WgGASpJHFsauenHU2Qbhw6cdiFk5VukgkTXQPTCdbWTH0xcFKBuGzD3158/56VlyOsZT65D1AwKpAd/JxDSm7SeHKWTDj2oGYtIed01fOWsDtFXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxmLwF5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eux9TEup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxmLwF5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eux9TEup"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AwRhS749061
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=; b=gxmLwF5fBmd8f75u
	sRW6IU9ZMIG0PRXHPGElLnWFEJo4TKNXOKYuluMo14b/JlCYJvZ8EGGpOza4K1X6
	sM25jcFk4HFwdTSdvxpaUVE/aj9of/m2Dyum9SXHIaYfjkLNqma7dB5fViCFfYZj
	h8oTky5qQ9OeDJqrxRi8kYf9L1p5P5Ys25YlnNtDTbcCAsxoQXK2DUVn7Q0seEOo
	BuIKAf0U/mxQu6sNp11ie2mgSrcPXoe3HwgK5YrtkszLW7bxTkanNEGXpgCNUElU
	1p3GhJtaSdaA0WnDfBOb6IOsDMbXHyzNMsmpKWcDBXgvGbd1olhWmDMDVCEty64T
	b28Krw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hmc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:59:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso54497685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436771; x=1789041571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=;
        b=eux9TEupaydYJcau6OXsSY9Hjr9pURAILSGJ7okAOfMZFX3ApfbLc3UL/Yyy5aUUT2
         ftiZHxCHy3cqr0hZQaFNCgTfzT+BHjHc5QY3BXdqym3Ks0K/o2N1/bBYlo0OH4v7D027
         ssLYpW4Te+q9v4x1y72gVAV4aLLCRw2EbpQhO5yzz7B6t4czrkYkJd32f+RZ/WdS/c8n
         /Z/Yjeu8u0pEzp64UePDgXZq5NQMc/tZ4KhKlnJjxzXTTq5ifxUWs78vdnqLB36AwnOD
         vD3ey9U98wzJnbF6CRSbBZJumWQMZuuB5YZu28LaKXOC6EiliSbuAMI4qDZGJLnEJ85P
         X1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436771; x=1789041571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1Qym9kgY4rq9h5EI/XXBuMVMLgjEotX8kn67PH7ku0=;
        b=LUPPrQJnn7VaRAM4KmSCq6+N6PCDO6rmo0nzrcrU7N8SOEV1XPqQSNwz7jktcWtMnL
         HGL5WNNGb4Nsm7axnGYb9asguxbGoxdau4SU5YFTofg2LLuMp3DjorS6XXdURJPZH2uv
         CUR6DBX6kTquDuEgyem+VTrcxDKHTU+EMKi/GDsSCWwgg9F6SIxC2Ic3uTcQsGEsoQYu
         6f39vUR0roCczpMM4aqGq67XqZQMd3kDK3uP1Miy/0SuoXxFzU7YlrYfR/cqlVTovo01
         S9d9oNx7kTOfhTe/Ys5UlBSfxWE7NGYibKwsNkX6jQg8nhqe1+Clu69l3GMJGfWXPgDm
         Blsg==
X-Forwarded-Encrypted: i=1; AKwUvByd1iVmPhbGPIuxzYMTMB+x/fnxi9L6BdywSV2cj3t7pUQfv1Zq4MjkWMnwU4ff02CG5qfXy5Pe+rcOL3c=@vger.kernel.org
X-Gm-Message-State: AFuF++kad1VvW6aPaJ2cvI14SogZ8gWs7KGrfbRNgeqekRP+wrWVsTYb
	SmjGbhiqrt1O+CypgIFn7MtsM+sdHUQRzKS9gBjl9jWZsFqwqiM39wYXO1EhkK3x5CmY0AbiEoD
	Obnqzw5hL7fQgrz6KQnsLXMFSgJgE8LHY1EYz14ZsEGrSclFcvs9o+xglhd4Ji4wqdfg=
X-Gm-Gg: AYBFou1VUluF/326pGHXrsGW6dzsTeB7q4Zvt9+c1b47DbveoQjrtyfaLG2BA/O4KCN
	8EVximunddk5WyqjVHYdQXI/wmyLWAM0HdVflkzEqy0Mc3S1CPCqYQQe6SgOYxJX4hNvrofUcRq
	0upmb0yhbCzbakvm7+tdjqaViohsMZ+e3ioEyKeOW9VxNMgh5uC3lnVi0DWaF1r/FporYhlaGa8
	Y84FGFzWsL1woJ4E5hd/4PcFtHA6fcUg5wqYD8wRDVpUtIkqvXb2iV/1ZkspHnT+kfvaW6a1ms2
	NvIY+ZlLYCVl0KI0x7ykyzifyg+7HbMLe/fze7L7QCFGCTNmxMUEb1LFqymxQQaUzau98kXcFLb
	Lkb9TKbARtmPLcyMISpMQfg==
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr798649885a.1.1788436770752;
        Thu, 03 Sep 2026 04:59:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr798646085a.1.1788436770236;
        Thu, 03 Sep 2026 04:59:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42307e6sm88905266b.55.2026.09.03.04.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:59:29 -0700 (PDT)
Message-ID: <e5509cfb-0b97-414a-98b2-c030758f9899@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:59:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-9-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a996123 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=lXqaDxtV36Dhfzo6gJMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: U90NqZmA15TLwxU3rdWLFeVZXDFJkFM3
X-Proofpoint-ORIG-GUID: U90NqZmA15TLwxU3rdWLFeVZXDFJkFM3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX/ec4viXfvhqQ
 Ju79YctTovKJZSUjyBJiazqtXkOlYIg5yYsM/XdUeWYOv5MUmIAVBGVVYV2p9UfFFq7JePr4Kkq
 uZjSaRLOSg0SeQICMBiY3wXmlu8SDgU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX7yPlwGpmYn8p
 mzrE4UPOSVLojE4rDsXK0uqOmUvZ2GdQrG+Q6QLgPnQeCd52qBZBC5REYXBSBDvo4tE/zgh27Qr
 j7ErNInv/qERBbVF8C6EKlzTbLYaUjWpWoU83zZAAm4sDRmc4qDyyv27FUpwr5eKdk5QXpG9GT2
 f4E+qi6eAzz5MfAcC1egGbwQcqnsq8duG+1o+IlB+oWVFfYrMoe57aByLyvXDzxhFHbTb1pOx8c
 4s+jlhW5dYYRB+PHHzh5089sNPKfwYknuwL8XYTk6M4zEXnNjvBHIrpJfJQMXi0Tz0WhUVw1CWm
 kw14r3xALRMPNF2qB0mI/tI+ltZcA0Vv+JF7IVYFK5AZqTKm5t293gNrWwiE23Lr6VwgSGrtjrB
 TixUX5Ljgj20M3Ekm3viTnaNecV/oTZDs/fscoQmupVELJLgo7sHEL4R+zpyvpRC8rmz3dE7Cz9
 ODXqhdQyPR/b8uZkMbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On 8/14/26 2:48 PM, Luo Jie wrote:
> Some CMN PLL output clocks require a hardware gate in addition to a
> fixed rate. The gate control bits reside in the register
> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
> new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
> rate with enable/disable/is_enabled gate control through the shared
> regmap for CMN_PLL_OUTPUT_RELATED_1.

[...]

> +static int clk_fixed_gate_enable(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +			       BIT(gate_clk->enable_bit));
> +}
> +
> +static void clk_fixed_gate_disable(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +			  BIT(gate_clk->enable_bit));
> +}
> +
> +static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
> +
> +	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
> +				BIT(gate_clk->enable_bit));
> +}

This is also all just clk_regmap / clk_branch

Konrad

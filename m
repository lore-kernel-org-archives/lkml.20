Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7BE3FB046
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958709; cv=none; b=aEUC53uOvchVdWRwKWv3MEFVX5RdlJP5tuuh1g6o46r+adCq64iuDpxspE01IOCu7VeHGS4UjHg3n8nEL7+33FXyJrhnIX2WaFgZsc7yCKN30F2mYKbbmK8s9c5qBP/a/0atOutVmmliKH3BW8MCs7kdqrLSIPo33uFhn/F6Wk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958709; c=relaxed/simple;
	bh=drlZOgaf/s4JnYJ/P33EvkbPmT2Fg9i5bejMLDDy4H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxTYzLI/sdKG8d8vF+3zWIMlpQvNT3YT2ZQU4WPP/Cn9Q+W+6kz3Fh93IM0C0YlCdfGM41pXDzmrc0D0DB3/ecwp1GOpRJs6gcuUw9NIXFVz+ocHtRM7ERnu7GQ/rgZC4Np8EBsiQqx7iHFz7w9MPlUjNmXbksGO81uv8b5Kv1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVRpu5kP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLMCLZRa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVRpu5kP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLMCLZRa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BomUe2698833
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnfEq2UMaHI7YzG5KxBMTz8Xtbdeg2N6rtzficXw0dE=; b=NVRpu5kP/GQrgANS
	MankYWxrO5ByDETSlEWyipdTPz7tMTY2YEaNWNCmSrk2PbgltVvZOJeDpZHN2FKL
	/GXi6oIZCWm+rqQlMnIAQeRKYVNdYrLrNNS+WqvYUx3JHAURgO5aFTLyyPU2ur/H
	Mmst+n9IC8Dm/QbcJ8XA3gZ+ptJUmI2UA2CGDEjxVGE4ylmO8nUflVK35wPi39EP
	GowUlHmRnt4WcTJ3zTv5uElMxySs8qsBEziH+13Rwsgcd/idfASHCuUBZpYN4m6M
	HYVRjMoPEh2SaWF2qPE3p9FiJJpgjI0cP9jOmuxNb88+ULoHSEgBX34vK8tRSbOw
	Mm3Xvw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh07j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:58:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78bb7517525so728627137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958705; x=1789563505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnfEq2UMaHI7YzG5KxBMTz8Xtbdeg2N6rtzficXw0dE=;
        b=KLMCLZRaSpredxLrqBHqmi307Fvo/I37CBXZAJydCr8nuYid9QDbCxH4ELkhKG37yd
         rmUuKBuz2D9vB4u/HcytSEUJBasCaoABSaLSdAMrazrgHovmme9lPbXyH1TGXMKkdIiG
         0w8A4RkbW5vZlL5gZScM28WCmF27norfYA3l6YbqRzOzfpfDtTWE2VsA8LqhQ6XJrbay
         gtIucelB1Xg2UrIsKEx5QSTXde/nsCLgzY0y4eCagfMn4RcI//fZU6yHJ3g7A2PLBhlv
         j9smpzn7QvHHTN94GaDpMZjD8+EaPAyo5pxjNVmM3/PK2GLTURfjINK3TmQc95Idb/Sx
         UBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958705; x=1789563505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnfEq2UMaHI7YzG5KxBMTz8Xtbdeg2N6rtzficXw0dE=;
        b=lERgn2l63HFc/zRkuupfSfeNMkQFXcCipctVgh8+iL6g+aDdkOApRkoUKdhf5rZttS
         q3Hnzd4khppVsjAmLR/+tV5Or8EdQpth8vqlBMPv129weW/qD6YmD6ZtFQIpLCM5WNzU
         kiWmhdnyZdz85d//VPQhdll4aw4xp5SRbqvMTzIUvhwAOgdq9u21RdcqZnEGf9fXHEn8
         28zuAVKW7bV5CsYNv42pv6A8qw6DjddhW3tZDD2SyNoiiFdvBfpJLe3is/1pyHZWTEBQ
         AMOamYzAFTxbkFMdmoQw5o+LHEao8GaoSTO+Q+kH8PeZ6rRKa12TpAChOVa1aqO06v1R
         WuXQ==
X-Forwarded-Encrypted: i=1; AKwUvByDJyFykBCcYsLHyDDciUyJeMVpVmCmd34pd/AFroUb4H/4VDE66fMrOY18WMjsdFJNKobTWAPQihJNONM=@vger.kernel.org
X-Gm-Message-State: AFuF++lDdd7lRHvBYPJGwt7Fv5BhkDHOToIRVea8WGPkiJ7GvCmvyB8p
	Os3ehtVUBlZQh1qooaHA5vAt/I/k/+8eV6LtBYn/VIgxyTRwB39CR13e4kZEE1+mhxkXDST4Edu
	b7tbf0zJKM7+7PG9GSV1w79XHhZH2kEIonK97wZqybIipaVr7lJ8JIWoMOrU9bs4Yf9I=
X-Gm-Gg: AYBFou2ww4ePzhDcP+Iv2v4TuGf7QlIMaGlZXJDUMBW7Un9GobqioFtL6CjJhL0QqAl
	oWX1C+VwSTz1YBPORasTDefHIWWaa2zYnPT3hby0GRQWKlJoQoHJysRVg+WgQjYpCa5A9lHe049
	HebjaEwW15uXQBStKU01+HS5pYn8FfK5DR3OO0z2fJ10AW7piOrKxWHZqIqIZxeBlNpIjfHHNaz
	U/onnEG6taEHyhB3T8Tzb/hLdGq6mrBBtqmM54gNGBZCyg11bJUME6z1NT4GsJM7dM2TimoZ/hK
	MsQS8PvU7SO7PxwXNck/CLIL6Apd8BS+MU4ikI5EY9+YiQ60TaLpt/i4lTtYvd/4gAYaSc58EQO
	zkcvIElCNURvPzR1y/fDUf4IROk7DDOgm1UFwVOt9cw==
X-Received: by 2002:a05:6102:8093:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a4a42c1a5mr13384648137.0.1788958704698;
        Wed, 09 Sep 2026 05:58:24 -0700 (PDT)
X-Received: by 2002:a05:6102:8093:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a4a42c1a5mr13384606137.0.1788958704184;
        Wed, 09 Sep 2026 05:58:24 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm43058540f8f.3.2026.09.09.05.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:58:23 -0700 (PDT)
Message-ID: <4fc98d9e-5013-45b4-8fea-d0d6a8feea45@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:58:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: Add CAMNOC interconnect
 provider driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
 <20260819093211.1436275-3-atanas.filipov@oss.qualcomm.com>
 <20260827-adept-traditional-earwig-e2c8c6@quoll>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260827-adept-traditional-earwig-e2c8c6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX9qAcefUdsz2s
 ebjtiZz4qBixxv41QOMzc0sG2FGWVydT1BJeJNnvdGkBBylF5OtY2146/XOwT0fx4nowcwhskLV
 N28YaHjHSQUJnMEZPR3Fiz10OrzxE/JMbXpxg+rO9ZEpP/uu3YCnNyG8GN3xYJMnb3cKJeVGUbh
 T/SAnMyIOqVWmomLrPVM2zpA0rV0NOkywf2f2PdchbzMYHjByVlrGLvpTvS7wZep73EgsepDtZI
 kGGfL2j91FC3mUGHzyUesZUF+f3OK7vMyF/BnHI7i5StBEpdxESDjXpn8btrhE+tp1MxbLdgaGT
 /bV+VBeMHK4dNEA5b7UN1nW0hpTytQmTsVMzKWifXS1cCKFAaJfFxHqAAGQi33m54etBZZJaNWl
 YKs7nzxf3Y2ByjIw1CW9pCCrTE89+k+Mz3YYGgHHkQj7mIW50jmDUXGsm4T9iVVIQIy6v++NQbt
 vBfl2Wc7+9fS66yvmEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NSBTYWx0ZWRfX1uLO4KfDkRYd
 YhN1JyjEylHyGyryZMU21WAzljt6OChK5deKM2qxjrWMNBKWA5ZhJvhR9+RqvjWOu5FO4MnvDgl
 kFQS01s0nTq3p9WbjIU9x53QGak7/5g=
X-Proofpoint-GUID: w2yebdgcUAcxdkJf60IgmjT-dP0xpqPb
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa157f1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H0k3xGeVXtyUzq8jG-sA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: w2yebdgcUAcxdkJf60IgmjT-dP0xpqPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090145

Hi Krzysztof,

Thanks for the review.

On 8/27/2026 12:25 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 19, 2026 at 12:32:10PM +0300, Atanas Filipov wrote:
>> Add an ICC provider for the Qualcomm Camera NOC (CAMNOC). Multiple
>> camera sub-devices share CAM_CC_CAMNOC_AXI_CLK; direct clk_set_rate()
>> calls from each consumer cause a last-writer-wins race.
>>
>> Each consumer obtains an ICC path to SLAVE_CAMNOC_AXI and votes via
>> icc_set_bw(). The ICC core aggregates votes (max peak_bw) and the
>> set() callback converts the result to clk_set_rate(). Consumers
>> encode the required frequency as peak_bw in kBps.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---

<snip>

>> +static int qcom_camnoc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
>> +{
>> +	*avg = 0;
>> +	*peak = 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_camnoc_set(struct icc_node *src, struct icc_node *dst)
>> +{
>> +	struct qcom_camnoc_icc_provider *cp =
>> +		to_camnoc_provider(src->provider);
>> +	unsigned long rate;
>> +
>> +	/*
>> +	 * peak_bw is the aggregated max across all consumers (kBps).
>> +	 * Consumers encode the required clock frequency directly as kBps,
>> +	 * so the conversion is simply: rate_hz = peak_bw * 1000.
>> +	 * A vote of 0 means no requirement; leave the clock at its minimum.
>> +	 */
>> +	rate = icc_units_to_bps(dst->peak_bw);
>> +
>> +	return clk_set_rate(cp->clk, rate);
> 
> This driver does nothing to the ICC hardware, no votes. It only
> translates kbps to Hz. This is not the purpose of ICC drivers.
> 
> Looks heavily incomplete.

Maybe those series should be marked as RFC. The basic idea is to manage clocks as interconnect providers,
similar to this change: https://lore.kernel.org/all/20230512001334.2983048-3-dmitry.baryshkov@linaro.org/

There is requirement to maintain higher clock rate on source clocks and some place to aggregate them.
One example is camnoc axi clock which is used by jpeg, camss, ope and maybe other drivers.
The interconnect has already functionality inplace to maintain higher
bw per request which can be used for maintaining higher clock frequency from requested drivers.

One option is to use already available icc-clk provider, but we have to add many icc providers
instead one provider with many ports.
If you have an idea or other way of maintaining higher clock freq we can explore that as well.

Thanks,
~Gjorgji

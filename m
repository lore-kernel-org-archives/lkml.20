Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52049B443
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818557; cv=none; b=ulcj/S6pRhcPww6bN3Ta1n/++mk8LjKUlrAkk4V9VUxTQAJ5yjxVtGtjgCozAh4KfxGU7b3o5Qd97/2M50b1u/Ie24UN51bZ1UIngFSGmEj005HIyE0TSUtHd5qHrQzCyNDA3xeLp88Mn0uwAEUo/ziNZYvG+NaBXED93P2WhOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818557; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8cefKAl53oNhWyzZYJRKku16FPqD4AEA1pgWjAmBuqJOFQxH+nAVt3hFmYVprjNHNMj8bZVWMF/+m9T5uhzCZOZXQ0MVLbAIOc4x8V6efw64Dp6qZoj3XJXeCnCYe3H8evH/WFZb+9T37LPhzJGEAwUq5YzjhSjDgSWbpuD0gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnWCosfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs4u+6Yc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnWCosfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs4u+6Yc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Aq82275878
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=EnWCosfu6+nUWUPy
	QD2VB5TCDmHoXtxAxBzaN8iPhIqe+T/ov/ezfWbNVjk186VpXldNJBWJNktH6Wd2
	DI0etNFUP9fsLR4oB4yY8dad1Mc8+Q2tRXES5Jk5gehApPwsa6jGsyLOvpT1a/6m
	QcYBdsFD8l7WrbP2WbhmiUFsm5Wmxp8qye0nhxBMpgbvppzXkQWuYorlmdIRib8w
	UbPcgHCzKan0KGeie/g8wzjvGOn3ydXMqyCld55ZWEhvWiAI2pLu0poYCzvMxP6u
	0LESE6CEu2qZypwrn2eB4pshtxgJj+RlwxSLTIa3V5T8V48G/T7K1SbXgyXOGwlI
	y66/hw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq21ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:35 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d44237e2faso57424e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818555; x=1792423355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=hs4u+6YcZqDg6wIRzaGoT0hrK8KunavCa/2BocddX+4AzFl4rh2f7qUq/5FBqFqZd2
         fyP46WzkR5kyqS1EGnVUkF4bkSXhb5TH/1quOPz/AINMUUpzRF3uWdmbuKqyY00a/7+x
         IxmLZ+6ptquO74wXPtgU3h0Lw1KVtoHBsSPsKtr4HbsjDd3ly+1yMqIxjXHUAKEiJvq5
         Xk9bvtKbb/pRJBj7Qsqi6s6xdx/FyghUxldbaD2RGR2isSX5QjVgdhsO98dsL1/36fR1
         QknPgHlFANc8G0HuyTSkDV3Bg20PGGZE93M+VYzNCjIzG29NdNQTYgBxw6zFasJ104G0
         LrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818555; x=1792423355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=TT33DEs2/nSdVpIVj4j4CMjiZvtoj7x++uI4+5p6TDjfH9Odt5bWTdRYDtIi47CpoK
         nbjKZn8LcoYVmsgD0pvnCQK+ONy4Coa9EYS/5LAH2DLdbXQhgvPFYY14rM44l8fvbz+n
         pWjgwcn6fywDaygtVqzi6CVh02+nCrFHHeRIi3Mx54uYfYiwS7P6egMqzk8J5v1jpZ9I
         MK3p8K5JUN9fR0xHOHo7ZBp/yprw910119/1IF+wlFAeaMjv5ys3oLHY2S93Nu/KVrEV
         LR3P0Voo6pUHL6ejXWd0s3x6bvl2sz9QWANp6ScN35xs0m38eF6lJ5XJTfeIOcDzbW8n
         +74g==
X-Forwarded-Encrypted: i=1; AKwUvBy1wts9/DyY9djjzZ0tr1b6O8ywkdPrFomptKPfbpNA+lWg/fgg9UWLgl9iiRioxxPOR+Q8cC8fbWKmuDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYFheX0JOiNQft8j0SmWqL6zz3kS2mRPS8bOxkqwcpK9BwlImM
	FVahCuo8+umOr0ta2NGKx9F+JtDSQHMjXm8bVhQW5IY0J5LBuxUlLaoHy7yDAg9gbu2eG7UnPyy
	QDDCz+R38OucNOyXFapYJUt8dqwDs7g68BgpFkcnwiUXmInt70na8V7beQno3epUu0FU=
X-Gm-Gg: AYBFou1JNKaqQyDNeePoDHopRwblwo82kPPgN34P1SIUCi/yhtnQOT35i6oQNZ3Tbl7
	UH5V2YdEK2BRsqxWdc1+jNAcxabTY4UhFiSkjWnxXgwsmT0kUBkH6rJKBWVJi1TWiicONJGeMHK
	I//Ce7HM6T4TvPivXnagrFUIuAhMXKhzoQhy55W0hhzECFZkffdh5setJeJYyQa7kpUDFQNN9Jg
	esLdDsUJ0s2Ljgqp1+lZ4L54eivHUGgF49yq3kzlgTK5/DHMAl9CUaBEwOUXh/v6Ura7f9mTGf3
	mxSsECG9Yy87vtqz8FiKDJtTAS1PD9IqlDPFFiZUkdBBMcCwgS0SWTL+wQT4UvsOrFAQgMvy/v4
	+KFUSwldPPo16PKHTO037fw==
X-Received: by 2002:ac5:c5d3:0:b0:5e9:426f:33ed with SMTP id 71dfb90a1353d-5e9426f4394mr982846e0c.2.1791818554579;
        Mon, 12 Oct 2026 08:22:34 -0700 (PDT)
X-Received: by 2002:ac5:c5d3:0:b0:5e9:426f:33ed with SMTP id 71dfb90a1353d-5e9426f4394mr982825e0c.2.1791818554124;
        Mon, 12 Oct 2026 08:22:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm472745066b.48.2026.10.12.08.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:33 -0700 (PDT)
Message-ID: <af06bbb1-0068-4d8e-ae90-a1097ce6cf05@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/38] arm: dts: qcom: apq8026: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <9484f72d6da11bd98bcb4f93e24c44b6ce2b8035.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9484f72d6da11bd98bcb4f93e24c44b6ce2b8035.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfb3b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=tNoRWFLymzeba-QzToBc:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXx5DIxP4VkCQu
 e20UviQcHrEDKxSCdCpWy83SAi138s4j3gxJIdyMNLidBglRaCUHe0xISh/EaBht5PUQrtLxC5B
 h5Yns3nmboKzEnrGYfUgN2OYn5J3Ahc=
X-Proofpoint-GUID: GpePTMhV2m_8fSJssKbXOGSR_1zttQgj
X-Proofpoint-ORIG-GUID: GpePTMhV2m_8fSJssKbXOGSR_1zttQgj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXy+5CoJaEKM2a
 Aywul/LIZvrbjm2XvCwAt7NdTD5cVWsvutmy69FKLzmiAfZGna56HXlLYvR+MmrBJDq5JstccW3
 lo38FlN6To64HcFIh3o0b3/K0E0Qu/XvTUJlZU8Ds5if3lUwW+JeLgGm/0UjT2DC8z2nXTFP1Ge
 BIS9A5XRu5qcG0l7jcYQxBQWYDeC/eAf3iCAcgS6S7Ic7DcFnjlDOGZyF/nXqrmObFQnnsRGvmP
 iDyH2FTbhuPiPqxELup2RC/Hx0hbQLGtV+fUeuNDiBOUpxW6MrSrPJ59wRAkHT7T991WONGaJOl
 OqEbri7J5s7MPOaFoshp9plnCMn9hUsbPFZHj/ICxrpAbwb2wgyFc9sTEAaddyPmbkU7YXuQGXE
 HvRFTwz4euDr9jLTV8Wf+aRrlBmxuequ3OSOMFPyNHrVtfx/+TBvv2zI8HJefdNvqaa5TEZw+z9
 sKSA4OO8oFxJ191p8eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

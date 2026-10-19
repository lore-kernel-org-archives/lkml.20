Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541DD49F108
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399787; cv=none; b=r5gerNA6ZpycFjT4zgB8A5wxGapLIkO43JBD1ljjTPrjk/QtMg2IG4q8j0KIiaJQ5dHffiAaENWWJ8nF9rdbWdH/T1peCVn4uHrZ09w2sJ04OQPLga3lUACAqOFYAZe+sGdeT8hWH8d9+8es1QtbXQMmFToCiRc95x4eguhm9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399787; c=relaxed/simple;
	bh=el2mIH0hwIB/4TcGc577stYSPzN1P7ttrLRnvliBgY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSG60HfEIkbPwQ204AXy7HFrFUKHTUgQSyfk5fnJhQ5Ov0Wu+l0kCtTjIj6DJqJgfPLjsqjU/1P+TwRUMZM7EsZx52Yq8SRMPM26ZYpGymOc6cWa7W2Zbrs6GgaOAgCxy7Bjd9bsJmvhUsDapYGh01ta2jsDQV8jTF+4FQg2ods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnPTN1re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izcfkcVB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnPTN1re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izcfkcVB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OukZ2752288
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=; b=DnPTN1re09jbjf9j
	HZUbnBhqjb9lgARjDOSqcoAeDvxqOM8fn2VvH7wAGB9MGb6ER8b6+/vJEuHeVqVg
	n4c+rMyNTScGNoVDSofhXvhVBzYAQIs6vcTfYO+CagHhqhJXtel4iTawkrvNmlgc
	olugOrbyWQ4TOUW8kimxFEjme4ySKRPTXPkHB9Z5nJgb8ow3L/Cpr9J7mrJm/d+J
	aFq8QbyiYHz1/xyWMuujNY885sYyg6QsAl3dnnUASYVwwkp2kxs/ZdpE7Hl6jIqT
	xyMbgzVnZEcGAnz6WsEZGLxJdgEcBTHoMiA9cp1Du2neBw6TXbqs5yi4jWbW5iZY
	RIj3eQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48g7dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:49:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso68176185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792399784; x=1793004584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=;
        b=izcfkcVBWCJ278nokUvInQjSwuXPQODGr/gwghUUTh2juE9yyLc7wVmpbXj9cj4l1+
         6TNiQc+ySRuuCEuSWI8Eh+z+ioMFDv9/Vg4HuYnSFn1JzLiRNaR+Ke2mKu/QDzoPuQnw
         6tsoZAWzdXjxizKdx6s/6oWtKYMvlFvZ9XwEmhjB6dUHPOMAxftf9HM3wpIUZeWKvRtD
         W8NeQn2EY6UoMqnvykSLRLwA38C9wWk+z0XgF+3SvSjfrHEmGOizo42uwEYgjit+dSOn
         wu5daBGiFnEyGqvXZ7XY+6V3kEqYoPYqcSJP7sWCVq5+jZA9ecbiuyyFVFkmm8pi+Y60
         bzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399784; x=1793004584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=;
        b=UnCLm4eael/lsU0qb/Ft05lP/ShuNuGufVt0+lWdayQn1wx70ssviwn9cBey5niLPC
         Q77fPd+wjv22Ys3aSDYecEhHubSA+m6OSb/qY+fTpAp2wEYIZQM05X2JCeLdK+lomTgx
         yw/GWPQZWuKGcx/on9p6LC8JoW2PbQcmMCA6ypz8hjU3HA29/Kr3CCuv1P99bNluzxPn
         L4JmI3YrP0h9Z3FiTJfsij3XRqK6D3fFcmAqg6/zStSTYnU/jECHFY1GjTPKwIlDfzMz
         Dv3681crotwBL6wGjJf61m1B4RW83xK6ZKKSkPNMUq3nllAOCNlDpbshJ0sFGQ6+1MR7
         5EFg==
X-Forwarded-Encrypted: i=1; AKwUvBznxOTn4na2mxR2yONoN2fVw+neD1IM0bxnBTNPPCGTYQbaoqab8sMoqKecc3up6p+QcNFoH4jfmQGzy5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNalBPWs0AOmMR4CvZH/dm7SJunGm9/n2v+UTF5hWZw9uNBjvr
	ECTZIeTcu4xwFXOj3XhDp9F1noXiujMYb8nqWpwzYJv0FcWTUzbWpqpcUeJsTGOzm+cBLG61nxi
	0sULbIw1jz+//rkXNoHxi86UsnQdgvkGZd9I49ITr9SyCHSXb3GZtUavJ6EF5gRL0dZE=
X-Gm-Gg: AYBFou3WWJ+O5vTJvjVfG7nwvTrT3M0LN7lvNOo8vd0wLftw/dM5SEzgo3e+6brop8q
	LmA456bPgY+HvDAYCiijgRoyBew4O6CzJaemfPZWe+FDAXj1bgdCpj6N9uqHYgsID+nwYd9v0CD
	LB5yRI1n4On4q6tVNuPbKssQq74LiDh7jhmHzVjczM2lSjmNjH2JWCKfyY3g4b5DFcYQaMoyQvF
	yW5Z9e9fs1mpzdytjeHYiw9qIeNlFcUXT8P0Bc6kMaNva3QC28BmYGGXJr9cb8p9DrawGKDtEN+
	Sal0mtswMOqPW2dOapmUFpGybqDeK5OmD2jeEjoCIodOxgPOe6ZGPMzjQWqg/RYQS4rMyUuQeaP
	zogh2I+kf/3QwP6n/Xf4UEA==
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1411375985a.3.1792399783394;
        Mon, 19 Oct 2026 01:49:43 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1411373785a.3.1792399782856;
        Mon, 19 Oct 2026 01:49:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd3190sm347944066b.23.2026.10.19.01.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:49:41 -0700 (PDT)
Message-ID: <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNCBTYWx0ZWRfX/1VrniBjDW5K
 2QLzrHyEbFzGtABnGqu4EFjfktMZKLsAKGHipd6uygReBDu5hCxwE+5VulcbgCIIqokUip2SqOH
 7j3akzTTeeS1Im6jnsmSetXKW3prXXiShRvKZ6RU35+H4+EXXGIpEsrwm45SXAgIRtWvxHi5Tcp
 jnmO7wtPCfguTBK/WkqwbLkRB4h0msCOs6slo9MNOPXanezosi+hyv8jMpW33tr15kS+fDKSuPd
 u73ys/qLlfrjSUsoa4bo1naWtIy6xwd/VjDrwoANdOXSG4CuPNuOs71P5mjVii9hHNhFY/jzJ3B
 DW7KnqbDvhQJZ8KP7CaVTZUv6tFSK6tHwUr8uNd0U/5i4G/ISxtaYnVAQxdJW4nQZax56qF34l5
 qsg2xKLYHuP83siV5L1EmiOj/8Zgm850qUHJrZgAwc1dV0c9h0WYYjY0j/gk08X3Tvbdlxc4nMm
 Jx7QIdDpwARlrDM3gtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNCBTYWx0ZWRfX9/zaxJnypqS1
 psImQ50vOB/ZKZaqMyMj+dGmtq7+W+69XwMfYaPfnFgacAyTMotiAjEkDAJraAqPCpn5ELQf3Ko
 iFY1fZE5RvtX+4q8COAsMi+lHyo70YI=
X-Proofpoint-ORIG-GUID: Bcr4qdhIL3a-qS0nYX9_VncBniVpHaar
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5d9a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Rxtn_4jyFG-xpNbExEYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Bcr4qdhIL3a-qS0nYX9_VncBniVpHaar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190034

On 10/17/26 3:29 PM, Erikas Bitovtas wrote:
> On 10/16/26 13:56, Konrad Dybcio wrote:
>> On 10/13/26 3:58 PM, Erikas Bitovtas wrote:
>>> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
>>> in 2021. Add initial device tree for SM7125 Samsung platform with
>>> +&soc {
>>> +	i2c_17: i2c-17 {
>>
>> This is not a MMIO device, so it doesn't belong under /soc
>>
> Will move it to / in v5.
>> Have you tried using the bus through the normal QUP driver path?
>>
> No, I haven't. GPI DMA support for this platform is not yet upstream.

It's a copy-paste job, try it out please.

>>> +		compatible = "i2c-gpio";
>>> +		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>>> +		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>>
>> style nit: (foo | bar) instead of (foor|bar), please
>>
> Will fix that in v5.
>>> +&usb_1 {
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> Is there no superspeed / DP altmode?
>>
> I could not find anything that confirms super-speed or DP altmode on
> these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
> after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".

On the stock firmware, if you plug in a display via the type-c port
(perhaps via a dock), does it show video output?

Konrad

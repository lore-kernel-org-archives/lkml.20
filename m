Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699384;
	b=cPkDW2drtdk/jgxs5OXYF9zT3tmARN3lCtFO9TDqXOYMHRv1+kCEfZShTXAh/tpOF7zh
	 uS6A8PJEgzmD3qLt/d7/1T07sRMhGagfOWXMjTOXFyzaN8WVaJ2ZKdzuZBm7PoBFEBFK5
	 ByRMOgNqNEckQdVJVHkdQwmaY3MixiTLThBDbgyJqSbUarYfyukrzYKUzNpHW7Ewmwm7b
	 2BARrNTc9YIEW0Jal5QOCQff2BAwssxyqscwqXX3kGfKCOZsgzGjF0Ng4XzkJl8xMtbR4
	 Sw6BJO5bxYzK2G9qtGQ1ugZXfqh214NR7qZ46GoN0o7ckdi0PjUUqyX8CKsboG1S3uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
	b=cUNq8ysITbOY7We9lPCkaQ2Gnbg8wI8v+o7IQBYA+EWlP3W2c7uJnc7qavafNRMaBo2Z
	 R1J40TAOouvSfp+yDOfXUuNI0QqHtf4f/0yfeXVQgfS5NTW65v838korm83RyPk0eGJ/d
	 7ResU+raRFwNeaG24BPctqlp6sI5pu9iHSStUseH8qa0ycot/z8futnrVvREindd4WAyJ
	 KY5NTNS3gnfh6OQ/PFV5GbfCBF7NUrWSzNA+O5NAl+OuqitjPH4WZIP8yVfrtO6yPSwId
	 hCtvIiZeLnSzMeinWeT2ku8NhcXZF4dNxliuP9bPZKKMbbCrExCkQbOmtkNxMXfoLtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ3AbXuW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTbS1LiP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9DC606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F9DC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ3AbXuW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTbS1LiP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39PvqT1141844
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=; b=kZ3AbXuWPVnIFJ73
	O739e4Nif395c0f6pBHTd7pycrx1UiErORl2JUqtk24WPwDngoqsf8ZqFqWF3nmm
	AFISxSw4C3dAure3DwRq+m1KyQku7/0KGtueKXZysYXs6kSG4qek8xyK+wrDfn3F
	8KYo/AvkQ+x6Ufr9gj+T3849nSh4UKiqdsupZZBdkKweqEMcnPYCr+9RU7JlxgYE
	ENpL2EtDVa7TZWfV3pRj2l7WlOAa5RVq0rpAW3aiTuNpZWQpNtKcP+50iDEbKZVa
	I9RbXZUAwxUCxMCTJ1uLnFVtChe4oEaYNb4YNWVTz4tTG1jggxzInktVfYe0/6wc
	mKUjrg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycscq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:49:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9178ba8eb30so9139816d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699378; x=1794304178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
        b=MTbS1LiPixWvc5P+8Glqq5jojRoRNUEHc7WwDsmiIyhbIpSX5Cm5mdg2c5QcaKJOjc
         XdUi5rCvvSWp2hrrFBhcgI01PXlFpmd76bbGlVbo16DaeDd3279ayEEyStA2bc/cjSO5
         P1m1q0fnVu9Dde6zhWmHM69l60IdZVhn41mGDQUF5NwAZBwsn4hPjrUn+h9W+YBcXfJ1
         QCbh1AjYkn3cBcDF5KrokxORufCCDlmCtmieY1ICg4yRENfoAIz3SaFjwO+DMjszzMl/
         OJC4K5Lwhqj0ZeuCy1IckM8BOXMCTrUi5arCECFtixyoaiFE4wLl3hnwaf6X4PpSbVSC
         kLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699378; x=1794304178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMMQdzS/XU9GNBHfZVGHYfrRZgo6UXRJKRG45fQahE0=;
        b=w9MmS/QfGudHVarma9ZKHgoRmmtZukQkla2RlqfR5q1OZZG/Qw+mgJEHtNWLZ8OmmY
         o9/4mRDkyNiBzxh9L006wzDDHMoPFPT+JvfwE7fVHXi0k/Q94inRktu9mIpQWXPbMdB1
         17fFvmx7Xi++3k0DfsbO7+dkmNrhMbESsiK5C8w60Ae3mOzTRubOIS4NtjeIGCxMzzba
         aRivA5Gbk4hu5OhSs+qZj9J2V2K909DI8aTeI3bbCXDZlBrsQjoaKK0lXHutckgEuuzW
         +ODCHygF2eozEkslWFcutR5R5Va0T0pEqyiT0CyaUxrpT8MNJrV4oFBWiXesTtITa12L
         x3jA==
X-Forwarded-Encrypted: i=1; AKwUvBy0UV92vRkSnxl1VgO5o+vntOM3nxFUvUGUntbmu7Dftkok1xWG2gKZPmJ+Fn6TRLXundg87g7xjyv2ZgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w2z/znMCJ7EKo5cVSDY1Ymyt6c1dVe9HGCgbbWCX+T/THuU1H
	AxtZmo4re1xcrMIyv1xW3xi49T3EVxMHpFYQj80A70xV/OlMfE0cpAntYE9kb7b+g5/C53NmJcW
	7T/ifcIBYQQ+F/1ZOE7dwkQ7jMdzylmdUiHtTb4D3HY7sFIFK8st16c/Uxd7x7DhSThY=
X-Gm-Gg: AYBFou1/i2p0/kxrtu+SmIvY9PGkyU9ou7EdMoramh32wxlhyk5soloJrelZAthNFyk
	px+cPFDemNOOdj6tE8ek9c3TPp9ZoXJbO7erJCYdFPUj1j8PewsXHtmsHE4FtiQA108Lps1IIzz
	vYpwPwyCkZVg8AjjoQWpz/+yrIarPCxAuX+AbUPcxHh1SUn2k4DAomIJDNiPH4yA3ZkISJdfd70
	bIkWZp5rXNxJEYeCDwCZVBhZXpDqEIWJTAycuAwv+E7KAmnMraMFDBumiohpWscfcPbtD+SXEDf
	EtOPoFGg023Wzb8VmEoiAkkPwINikpj7FLGxAB5KI/zmJJ0Y4C5HTTJfeEj2itaiX/XaybEWNjq
	iFSpCmTZZNfJ4p6DMZGxW5AkbgUforOzl5qw7cGuFz0VdEfpGTFEAHHvDHt2Y+ugAvbY7qA==
X-Received: by 2002:ad4:5f05:0:b0:917:9dfc:b958 with SMTP id 6a1803df08f44-91ca4a0b081mr304850456d6.1.1793699377547;
        Tue, 03 Nov 2026 01:49:37 -0800 (PST)
X-Received: by 2002:ad4:5f05:0:b0:917:9dfc:b958 with SMTP id 6a1803df08f44-91ca4a0b081mr304850016d6.1.1793699377101;
        Tue, 03 Nov 2026 01:49:37 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebf164sm68701366b.13.2026.11.03.01.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:49:36 -0800 (PST)
Message-ID: <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:49:34 +0100
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
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Fix the L value of Zonda PLLs
 with a negative alpha
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9ae32 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=U0MhLFlXrxXVFuOl:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_AXJYLjol3WrTOYx9vcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: O0rATdNR1H6gtXSSz0Eyl3nHPcWHb-b-
X-Proofpoint-GUID: O0rATdNR1H6gtXSSz0Eyl3nHPcWHb-b-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX5wcG3Z2gDdI0
 CLmOIZ/t5VvjPVv/hJtbm+Hf9MI0OeC/jgw2RTVSQqbuTNPi36mJiASgW/5zK4JbfhnhUNVjqmg
 nladysWz0u/d8odb71pLHVxyD66Gux34YSn26z7AKYaBP8cANhf3pugbUsLEKIPc9TZ6JzMzxOt
 hJAGOzNnZktQ1LYkfUO4wn3KIfjwuGTdcsiomqUAgwh9lVixwtLYmsJAPhqGiAnUXN6aYMH1/gG
 z43pkiXHbf/YanMT5jSLt8LqKdfyTrJnw8Usc94NB/7/jvnkm0AAuJxJBKeD6OnE/6knhAgvfkj
 ER7++Wrx33LuFZQG8I/DGlhmCo0QczXFKM4pTf9g4Q2F5Rttp9Z4AvUqYXi8wXKFNehtKuDu+WR
 d4XZElrdkNIxeass9dzfjEF2ORNzkM3r0hz/wA1wsrPV1anlqONPJD1km9Hl3vsTXXB4Rygogl3
 nDrRTOd1sn85Bp98ZZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX7zfTgrL3rpDU
 3qom54sY4yAZxN9mkMUwDqwRsNKHw+7hcKYVGsMocVsQtnl7dNVtEneEkfrs8L5Wyud6Zl4XgqY
 xoZpOoMP6xvk7FLejlzzqqhFBKqcr08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 11/3/26 10:48 AM, Abel Vesa wrote:
> The alpha value of the Zonda PLLs is signed, so for a rate with a
> fractional part of one half or more, clk_zonda_pll_set_rate() programs
> L as the integer part rounded up, through zonda_pll_adjust_l_val().
> 
> Since commit a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the
> zonda_pll_adjust_l_val()"), that function adds the rounding to the
> requested rate instead of to its quotient by the parent rate, so such a
> rate change writes the rate in Hz, truncated to 32 bits, into the L
> register.
> 
> Use the quotient again.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Prepared with help from an LLM-based assistant.
> ---

https://lore.kernel.org/linux-arm-msm/20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com/

Konrad

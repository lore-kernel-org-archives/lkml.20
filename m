Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623367;
	b=BVQux6aNPtGD7+a7cw+7KaafAY7YdDpzSIphodAO0ogadH6xiEN2rw4h0CcsV4O1Jh4y
	 4f7XiSxvjXrEl3E8hxpcSkVtr6SIOlT61sLtCMAiivshowAu1Cp4FWKEg9sJcXSHnHbgq
	 Z1DSFNlz5QyJEpXTzOBXHoNrEv74i8UnyNT3S5xXDHvr+5FOusA2ytls5mQJifxFVaadR
	 yRIPASWmZmHuPXT5I0ghDa5VryaTWK70z9tySwAHbu4lJHrrERB9CdZzlQCyaudKSRnUf
	 L6yb0rx1WTM3ZTbKzq0C1jSazwOeBlcHfmeCQsneV6ab3dHjujj94yjNouF71HLBSrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
	b=1em1mD3KT5s2FJ58klKn94lz+rL0fxxL+ECUjxPdGG+UW5TqXfqapgjPvaI/wRWCFhNo
	 s1T5NzmW5vaOaWnwg8LREelSvmO1QszFotJnnGmVx6ED81yHLAwVgyx6H76CCnx9fmXE/
	 KiNTTlM8Jj+yl2ye+nD/cC5JXFSx8xcd51tTrXdtutcbRaWED5PiPdJIF2qlnT+Das/Xu
	 oLiExGyWvokXYDh/q6R4Ys2Fz4U4/LSpuBM2rsrvRsXkct77D0c9wHhJow3fUkcRr4IIA
	 Lvi/tZLVcyC2JJeWjc4/XoLNb5Fl/IvenK75N/gIjFk0Zd+dKU9t40DyN1ex+MtDVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imzn9mgE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCXAe2dL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3468760A2605
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3468760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imzn9mgE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCXAe2dL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3dF2466298
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=; b=imzn9mgE7jpQF7UJ
	l5NhN9P2tCVnLxb4TdTBR2FOSNJYdj8wTOT26//AF1GPF5PuPIQFSP5ViGDCvCa2
	4mmGrgG3D6wFmc0KCDipUueSrm3NRhQkBzh3GoNpLwmwC9BYu7cq7Ua57vaYcUdl
	7YgM3f7Fj1J108Q1ZgoO2WvAuWPIwY2sapviVFR5lXCi3+SLKGXIo/izg2gXY3oL
	7iTbK1ENuliAtSaY73WLoFYMb56uptzP5XHbepiephZGbLxaLYsO/JhzEU4QKGII
	YlJK7qieMGwQeYo3B/Q8gJ8RC+Ywd4G10lvOIH5zpCYXkTkGoH1cH/FMvobYmo0l
	TdgZ3g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhu4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:42:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c82e9d68fso8514166d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623365; x=1794228165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
        b=aCXAe2dLx6AvaA3Ui7ABcy+OyV6uebqnuOlRF+vCG7XQ5sOZCJbjH38nn86tQ/NYsD
         YYHpQ0CWi+7ui8DF6l2AjxJdeI6Y4UvnZQtB3GAlb77QbHRCih8R5vYiiSauBZvOExKP
         2jH92wiR69s8RF7UfIU5k9ufPo9HtEVpRpWX/lgyVyGo900JuD1Cjp70VmCU7/praxrP
         nx/03JbllRjZT+mXWgHKTTSPJkgJMS+itfhFm2n5jS2MEg+B1iTjWmpNXUw3TM2TKK0b
         pVUNtw3RqR4FaHbd1o9f4BfO+pCy/y87D+jgBkDHMhZCAy4S+DB9OKwpg33wHyV8FkaV
         mvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623365; x=1794228165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfJHL+LnVRB1R76oNOPPOaL+uw2rvGjVXvhT2Xe2FZo=;
        b=r+5u4HNLDc4IqCFFl4rVMCUPo2aAWXiMQDg1BMT5AdlU4NcPk/z4TPFNV+k4BFSFUP
         RZ7jySk0nYEPaEARtY1NQ6BZWkMrfE5O8KFUcMLj4rsKenEOSnGoKlSeDMSCmpUJ6IU2
         J1Jn56Xmx7+N3qfaoFmwxJKzmghTm6trCLPy5U4FF6gAGMts9szNvjXnjfg2rE8ZDXyD
         sYvtTllLMDJDmZ/ufhCj5SEw86lvJvHOUclwwZRuD2hzBp3RPD+GVYfXR5OgvwrdZlW6
         PbU/6OJ+MRyDUWiWnyyYRKGNK6ouLMhcI5274Cq5Wgmzp5YRsFmzZ8lh95qATPFQFsCu
         BcKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1GcJFkL06/d6XvCn0W8uYcaEi6KN+1AChjl/5P/RgEVmoi851lRM8+mv99W2PWJ7pB9x0ncYXFbgperw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ7tjmJQVhi2E0mE6rGxWLv4XzgDqs54KPUPGUbG9WFHIdcpT5
	YYDUvKOThOqsoF6snwSJTRCg/gQwq1HHpXg6C2rw1l2MF7pKH4J+GnvYEd4ywCYrTgFw8hlSEhi
	gdSJLA1mWXelakQcnwnXgsdXx7GYw7Ix6C8DDXsVY0+7kn7v/65Ra7YHarFuye4zEs14=
X-Gm-Gg: AYBFou240XvSzPlkOFbm/CP0fcEje6P2cha2pLFO8jTuSvyFl6dDXK6OgtPJRGReTYa
	WMCphepShdRCiflbU5q9bkol92tOECpZ6SEoLT2HvV7TcO9HuZRk3TTcHt/xSWmqNbe34MnhlBq
	vsWUU7qojhHyp3qgyFJ7R/60pj9aiF3FMuZDzUESe1wDwoTTxQ+2JWgkWasBa36wuJdEcYTqGpx
	MpElzke/R540DiMb1/eG/vrqYXWjjIn4dkZt4ZbsSGY2xDvmmCYloxe7K6gfU+GM4PQ0uxxg429
	GglAZvvj9CsiZG6NEAcbTJUMf6i81HyJ2J9cdsnLt4vG0BmlEAM0VPtb885hYpOCi1PrlGFO4PW
	hf3URoGc/LVwQh/AKlWQBO8j53D2CrLVEswEAam4VblAA99si5M6jF71hjTfx3XvD0VI82fY=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1608070685a.2.1793623365471;
        Mon, 02 Nov 2026 04:42:45 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1608063585a.2.1793623364967;
        Mon, 02 Nov 2026 04:42:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm399183066b.9.2026.11.02.04.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:42:44 -0800 (PST)
Message-ID: <99023059-0d9f-4ad4-a861-299006ae32a3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:42:40 +0100
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
Subject: Re: [PATCH v7 09/11] arm64: dts: qcom: Add initial support for
 MSM8952
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar
 <jassisinghbrar@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org
References: <20261030-msm8952-initial-support-v7-0-ad748ace375d@mainlining.org>
 <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-msm8952-initial-support-v7-9-ad748ace375d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SIS8B0QejXYywf0_EZIAGSdRZcqf1Rbh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfXw5tYfq3O4YWM
 gcGA3MueLH0Bjlz6VHlhkyUj7MdX1dlt01SJHHVw5hKDljcJ+0vjIapXMa/NnCGOKvIC0Lgc+sR
 a+XUirDqJONeC031aXaXQoZ5AhbPsGfY6AmAWeZvqyuXh0o+yXzZ6drbaNqfPmgRiKiM4Cis93q
 UkaCd3g/Elzc84o1e35RSWilKSjW+9PGPCY2kzCzjqANLwM6iGqurWocqclL1n4OqcMCF4a9tZp
 6wrvstZOTmOmKBZKLz//Ge7wVrbgd0YNX9JLOJASBCIGBkWueSODzIYUGbfwl/RnqadJihfQcuq
 eW0yM1oWF2TWmGDkWmoccA6aSJkZKSjOA3KvUmqDnuRYSMKeo9ENBlSgfOSmoBfvVp8N0XOHrB5
 bacaqlbPrGJdQ5yOLuMw9jt0PXUvIrZMDUGgMs9oU7yxMWM5u67WlywCpCa5ygFz1cZCRXt2EEw
 JfvFpcFxnStaOS8BF7g==
X-Proofpoint-GUID: SIS8B0QejXYywf0_EZIAGSdRZcqf1Rbh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfX/4AMl45VhMcH
 nnCoeCU7PLquML4GHfPzS1GgrKDlxLqFmiLpH639hXODBFrt8UQ5xLwuuzUoDywv81P5S6m0+rc
 SY88ApODNahREySqHCszI3lb9MhOMFE=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae88546 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OuZLqq7tAAAA:8 a=pjH4mUHWGEoP9p1cUU8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

On 10/29/26 10:02 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add initial support for MSM8952 SoC.
[...]

> +		mpm: interrupt-controller {
> +			compatible = "qcom,mpm";
> +
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>;
> +
> +			mboxes = <&apcs1 1>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			#power-domain-cells = <0>;
> +			interrupt-parent = <&intc>;
> +			qcom,rpm-msg-ram = <&apss_mpm>;
> +			qcom,mpm-pin-count = <64>;
> +			qcom,mpm-pin-map = <2 184>, /* TSENS UPLOW */
> +					   <49 140>, /* USB ASYNC */

USB DP> +					   <53 72>, /* MDSS */
> +					   <58 134>, /* USB */

USB DM

> +					   <62 190>; /* SPMI */



Konrad

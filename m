Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363948;
	b=nzFT/8mGjUhK06tvXJL844C3ZBE07JJE5B0f6ai49Mf3l6VZ4Y309IiNmtg/hgmtORs9
	 YRK8y80cFrEgcMQhHYg3Fi2vFbWV6dRF0ftbWj+sKG95XX+g0IhAN0PzPBlG3sPSVNwoP
	 QXTiFc3pu+SNFtKIu5Qfvjgv8QDoq/LayQIZvLYFfrMXtTApJSrCmIXXJq8TLCz8cyQ5i
	 aAiYBxLd4LPm/u5xnP2JsRMlbGEOq3XMdvvHCuOBK+cQKxeeOEPwI1CDPscmKlWbM23Gc
	 oRnLJSye8zYpxj0yTlFNHq48DGDFjTVpMQx6+IoTD0ZL5/VgwV0L/8d8krIymEemsvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uI4r/lNnWWRwm5efiSfVrEkVa0m10ZlmU3jditRFSTw=;
	b=Pz/RlgxWBTIBt7W1AMoppNfo62lOVkn3FzCtmBoTiEgZ5ShyS6ixIn3o/6fod0KXTmyq
	 QFkclMVXus7qeiERGtgMiFKLYhLN4bo64kB9Tp0eJ2Er5WUIcMK67GOwYVyp6ve5gJfFv
	 jgawzwdmR7jpy+xGOxxdArVem4IY9zkiFyuQi0auXIGEP65RnUlnVY4C13bgmwdSdwMBO
	 2CHwCiDdP2SKaBkAFvIdrZQEnVvlcQv6/2NpHK4yyf7GtOra0KO+fAjRu1Cqi7fWdoLnj
	 9psZTQQ5ou6rKBqCxqhppUEIQi2agz14T1S+CnVCPekGn1r0K6sFGBGZw8eYxGctdiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mC0J45hG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elNaCSBA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1812A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1812A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mC0J45hG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elNaCSBA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGWR93679082
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uI4r/lNnWWRwm5efiSfVrEkVa0m10ZlmU3jditRFSTw=; b=mC0J45hG10XRaLaO
	EcAVtMoij+nwFFtZV/OXNULSfZwT+TLTfm1ZUnSMBel980CA84cNPUitVVTUoMe5
	ZNLuUSo+l4mwTPEbdL9abC0T/Oz639N6flK/jYkfO910xfilHW1GHuOS4/35p8gC
	UmG8CeFxi8XPjzgU4R6Z6i9s9Fb7G6Bb9fHkGVe6ZSa45roSBGhLvlJcPivCjmRg
	V/bajZF9rGd/+FTVehXE3sBgY7ihmjEE+0/N2I6m5ozYfHXKmTbUi2GC5XehbnTC
	BBsMgeuQijD6/H+Xaxp7KPKcj/n+KxmvRZgGbq1S1PskCU9Xv18WI0WUny9xkbZi
	5knCDA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk22p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:39:06 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaabe26601so42476e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363946; x=1793968746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uI4r/lNnWWRwm5efiSfVrEkVa0m10ZlmU3jditRFSTw=;
        b=elNaCSBAnTAYmnBl3a+fpOVZVy2wTI05+w4A2Eh/OHg+xlSNmCzH29s1d/l60Tbw80
         smz8loLL4ugQwK6WMA59VAlXGZu78zwhDbBr9ehMmuvqImyCQCkhtGBPISYaoPkdswFw
         i6tuEdEplXrW9MdowcH9ddxMpbybBNRBI+bmktRsOnbzrkQwgusOfNjFm0wI1SXY4Xrz
         P/8cCIjJjsTazDAaD3xuJxrpZlqSNpIKE4aqzT85D1rTOjU08lHBqsMgzm31M8p6xl8E
         ZnnpFWVF77LOjCDeiQuKRyzVk9uN7L4xGrHwV6E2+oKZRKgNddyX7DiMWDTeMMk/uBkY
         CFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363946; x=1793968746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uI4r/lNnWWRwm5efiSfVrEkVa0m10ZlmU3jditRFSTw=;
        b=o63djq4wid0RA0QrKwXFXf7FsTQGtDfwyP3e/ma0hkp1BL41yq4NowDbt96VxcgaLl
         JrZs1TnXpqLWliDnBvWvvNsxoNk2GAv+8SbunqnxEWMqfP+lszzR2gKYqTyBCGHr0d2A
         cLD8GeuqLqOf7Jy7L3E3Fvv9XNzckIwX5uDc0fAJM2dEdTak8NSel8+fowciPVqCO+VW
         Glp2Kk22RnhrKnqgkANMy2kF134mOu0jbOKdN0Qlqp3uh81kKQbVKaT/fj0cycTzIGuW
         J39QJZqErtQ9IDaL6/I86H8RiiBdkret5/kTYN0p3u98k1FSWwYrJlgwdnvR4fnM754t
         gK3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpL3zmeasOvL0lFMMDTP3WxwPF0yDs0k28GRpNMOFFILbrdTQSGpiU1kanCTsNX8bDQYiZ7dBP82U/5NI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5JK8Hr+hSMyQWpW34hq5erLquNz9oYsvmaDzCEIvQc1q2KHlS
	E8uijBzfUVYrjbI3W3wEcqdSGdPH/4uC06NBf4GS11cRljw1XbHF3kTIGvduvAa7V2XYBn/Xa+8
	1zMGDaACM7WSfwS2DK/JZ3EU41q9JuBukdghP2v3HX4K2S++MlHZrdtdhVpkKPkSaw8c=
X-Gm-Gg: AYBFou0hf3rV3Liajl5WxgMaMAn4Br3W7iB7U7QGRBmC2RRhoAgWgff7dzzq5KRcdrw
	qdfVcsoHXtY49mg4/KiXH/I0QOxNynBJqwGhdZDMRCQZgPUYPP7AA8cFP6Yx9fu5udC3ROoTXOH
	c8El5WtmK6TWCiReTOohFnSYCsXEcOkQbWiM4tTuUIp9LJgaviccnZntPqIdMChSSoECFKa/Hzg
	iZYSVfLVuMvldw0gxh9oiuXtj29jRZ8wjjmuw5apbfZ0N17DYNv1fKmjIZLpX+kLvpQRoQXuQmp
	zl6dA+sML5eeHgUqKXS0VV04TXVqujjr8ZzkPYTRgynNEkRoxkbPVCUDKgbgB2tiU05czedeSO2
	TdkjBC5HnuHCxT0oByo+Ebu/bQM7rMVDX2XNeMTdYFTX5V4TuSx3M/VqNpGrGVCT9Jpaq5fc=
X-Received: by 2002:a05:6122:2b01:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec6897ccbamr998357e0c.5.1793363946172;
        Fri, 30 Oct 2026 05:39:06 -0700 (PDT)
X-Received: by 2002:a05:6122:2b01:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec6897ccbamr998229e0c.5.1793363945761;
        Fri, 30 Oct 2026 05:39:05 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf26b72sm60608366b.83.2026.10.30.05.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:39:04 -0700 (PDT)
Message-ID: <aa2f2311-d913-4b90-802c-e414764be169@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:39:03 +0100
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
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for the Qualcomm
 Shikra SoC
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX4YiXFd/ts3CA
 ywov2M5dPr4NUFJ5I+OeXM7esx5FA9pitY0d/zY5kHqRLjzXghZZwo7+0r2zSNmdukXAWh+G/oe
 u/ote9suCNE/clWXtfr6EbqFbjtw3RiE6kmhMu/Q+4tQYk+QGeYYHPuQPcJuKCZ1V8VPfoNLAzS
 fb+nmIidJPwV6vbuPZpxR/Z3DwU4xWSyBWV+y/wvjCCkJy2Nll8qXzyqwp1V2F3pRUdF8TGMQ9g
 DKNmymUk5IAonMxtSVkCQY8zGgg/cwfSNrylEF4LljxSTpZ3V15h3Ii70igNIGSxYcknVw71LAi
 sKiZsbdb7fUZzfcEBSjCgSNEIgqpneLBcL4APBNQrmxZPdYmYvVt9dCA73ZEynet63teH3gPzuC
 Nrl9hx+6vfEZsPS1zGRSZR4XrQGY8UDkK0pXhu2EqDYiyaKL1tZdTEUY+mMmchUbue9mvvEXnuZ
 Erb6j6HW/re5V9kV6gw==
X-Proofpoint-ORIG-GUID: dlkIeqU3dYsoK-LbF2Tl4X9IBp7S7msG
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae48fea cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7yfVbiq-ooDmJZbsBGkA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX5GT8IxBXq3pN
 S9LXU10ZZPLCt93uFbSQ5Aexwmle9GTxrwKf1mV2lzcJk1t+sdmR+jxKDMlZdzydIUciHsXsx9T
 u8W8mpUL7zdwso3/MIsplcr/6aNcK8Y=
X-Proofpoint-GUID: dlkIeqU3dYsoK-LbF2Tl4X9IBp7S7msG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300050

On 10/30/26 1:33 PM, Anurag Pateriya wrote:
> Add support for the Qualcomm Shikra SoC to the protection domain mapper.
> 
> All Shikra SoC variants (CQM, CQS, IQS) share the same protection
> domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

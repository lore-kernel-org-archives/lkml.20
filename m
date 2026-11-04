Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780247;
	b=oZbQnli+kCwstMmGwhWKmeNkzjFyvOAv5o0wXw3LkAdNjeiymjHhO9QRbG5c2M1WR5j1
	 Y80XaUoYGBOFQqJgNl/FrQ8QMhJREjXWJp1+JbLlH9+R7BXmbPQFsLih/991hdOvxTPaH
	 xtWe3C6jjwsaFDFyI9tkq73RfQzYTR5/7LszC9TjpchflO2LGhFJUnQkIHXq6MUev6uAe
	 OONbAcCZ7ZjSU5qJp94KO6QdQhAl9FHjg3Iz/WElkA0PYjJQc1rjvUpSQHqusOmO+HUPu
	 UeKznRg26d9/8LlCvLxZg1XCfGrjCMFp2EhjwCktx8ETVp36/JxNZYFBQa8DcB6dthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
	b=EOtLjYMF4daAGap7dioxtMsgUo2wqPj3k4wTmzdlDQgWz4aOJKkhZP47DwIeEGxKQoWF
	 29Dva9J8y8PhBvyVenMjMDWzQLa5e0SJWWLbXTHgZq0Wn9xMvbwOu3OjUDc/Vdv9viR1x
	 OsqXxQ/icTcCTPhNcAiCxqXLDjFMVJKiHgv8yhj/Eyki5xIZ4Hfj/Z+vBVI38pXUxHAkm
	 nkMKz8oJVdRlA1dPV4n1/yJ8x4bl2+CXQshBQXYqXVWd4q5b6UJfsMb26vVSFhtsBqZbm
	 rMotFrQcULastm0Zlx3EjRaj061DadyuSXPMIitXElDXS2sTCeyWsq24d0atTwniayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjPaLixx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHOhW9S4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA6606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FA6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjPaLixx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHOhW9S4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47MZGu838281
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=; b=ZjPaLixxKZWZPP8X
	8kyd36Uu3KY4HkNGJOalvoY7Wd/omIKyQidf087yBX4mMa1VZOaiIPLvExnzuSjS
	PXXPtcT2X2dT6G9cFwxXu3v/XOwFG7XOynrzXK+rZZppVOgu3BiBpmydeBZYXTwJ
	GlkB+EK15D0NYv1ICHAS25DmSvlxAXSBxxTUri1R9CRJgFHPggEsNa/Ya9K244jo
	OIOIPofyMccH422nQNVG0I8D4Gl/l5ugO2ol4psuscX2vLL4jCqfKp+4KnmnmCWl
	3LAj73E7jlrtUXKs5rozQX9aryLev4wWMxvC5V66KaCxt2CpEM5c3RKT2JWRSuv9
	T3aLxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mttsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:17:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so13610485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793780244; x=1794385044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
        b=eHOhW9S41ZMX9fUeIteXJknWzjZu+1QPCVKNzhwlk/z8qHtrKsPYPllGJi5ePzhxP6
         jytsgofXy02/Ng0dIibw74mqjYpvH0siWcUAp+WEWWL7e+2Uqk5ZA0flwfCwd4HuExvC
         3WyN7WBlnYTHrgP3l/IvF0TveyItsxcBPvai2ESYjYjnPTwEDN4wOAWlb1MobPqpI3FP
         v2y8K3Og1w7wVyHzmmkPbpSbAFHYZbO86gOuO/Qg3G5H8bFScn2DXTmr/AqdPC4Q7H1H
         XDlcWqF+ymL+U+yYih4T9Ul3W1gZjkg8jJHVZiPoM4FXHZtr0UWGkvnR1G/GH4sfcECm
         uxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780244; x=1794385044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
        b=DVPbx29UsNiAqYDFhJ45GUKHLV+hNqoLgNvrksK4GYtewnr8qihpj9+0mY528OFZug
         woS5DJJW1E1qsZraejpqxObdU/kn10Jt2IoEPsOSF3UiaZCURcExQVd8GV08yZAYPiYH
         OlweAEnO/s7OFf+YCBx/NKal8w7KyhJ11ocY+aWDKSU70syAJvx/f4uxVQt0sNrGmX10
         LLRi4yXUpH2M+DHG0Xb6BD2Ui3masBAWZoD1cTEnWlJ8DObVCtZOAJoLhy5k9oYaFCuf
         AlSPYf86RVldiBH4jDeWze4PVPeAzGrLvmkslXAUm68hywQsHs2L5cNCTdcaHy1/i0aY
         12sw==
X-Forwarded-Encrypted: i=1; AKwUvByAhv8fqKl3NO1NFna56Woq86VQKsTeuDcE8VJvmmtmNr07Ys5+enanC9dAz7QA0odiH8h9s+/NcVmb5/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cfLAwt1scWVsfVz/sFDKuz5lqGT+G3h13zLO45pMOg9sjFd3f
	S6TEDD+6KSYuXuaLlKRGRj4l3hKnkvg5AO6pHbt++QyDKUgoUiC09GX+HJbhKcBvnoqr0xU3x6K
	PZluwrcbHCRaHyXX4aWgXaGXbdSusugVNEfomTRvEy9czITZEG+ltSNK1CY0TyLnBwHs=
X-Gm-Gg: AYBFou0/x39+AlX61DHf2NXmZtGDbaVkeUxyb5geLME5F3uxWWwTUQ3TpgCYz+JrY7m
	E9CpM3Ss9ksAdM/19LAZsIQtXN1wL5OAPl+fDlZVGKFSX174P8K9yu6ZNdV81TQjhF+3+yz5UjK
	/2x01AKsjWr8BJ31oy1faKm0ZphqbMVHjT4AoFAcQaRfVoXweSvHR75gfRDOnWf2/lK6AX4vetE
	fAdDiXxBRVGB6zhIL21fCMcSB3q+f5KUaHRgVkSMBSuUbVx1kIi1fnthS6UPAx9EuEoTdh1B/qT
	K4zu0CgP+1bJyp8E2+h53LR6jBeLbNa180jj7LWUi+haRnncWvgbncbMN0bwpoMsY1d+KvH5Pg4
	w2vJQdeeqSaQUbTn50NjkREpLMiw5mJVRDlItalTXEn3/gv5YZLUXvmV0CB26tJdSahqY
X-Received: by 2002:a05:620a:414b:b0:945:dc04:c4b6 with SMTP id af79cd13be357-945dc04c858mr23612185a.6.1793780244328;
        Wed, 04 Nov 2026 00:17:24 -0800 (PST)
X-Received: by 2002:a05:620a:414b:b0:945:dc04:c4b6 with SMTP id af79cd13be357-945dc04c858mr23607485a.6.1793780243794;
        Wed, 04 Nov 2026 00:17:23 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0ddcfa78sm46641766b.0.2026.11.04.00.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:17:23 -0800 (PST)
Message-ID: <8eac300e-ef21-4dd1-88c0-63e798afae2b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:17:21 +0100
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
Subject: Re: [PATCH 10/10] pinctrl: qcom: Check qcom_scm_io_readl() return
 value in msm_gpio_irq_set_type()
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-11-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103213002.1673560-11-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UQO3ObHF0gqh_1i7Uek61ruXhksTGrIm
X-Proofpoint-ORIG-GUID: UQO3ObHF0gqh_1i7Uek61ruXhksTGrIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX0bdrIVc0kpEa
 rGheWimO3L5S1UvWH6SU8Ch6fgoIFAaefvi3UkX7RMv5ORBfvhXqsmR5nJx1RM3HY8fjMxyAFO7
 mqtOBoEqLZA9quEHXsWcMAXBqy+yT02QDKZZg/H7tQuGAU9cDl1/OE1ftRZo5JBuS7OfHSEiZg1
 qgGmbOSeajG/eJ6K9c/CyaEqrVzPVMB1n7jBdYP+q2kDwryV9z46e7rvJ//Gq+2oeHBQ6g29J1S
 Dnumzu+f5iJeSyKTENQr9hJZ88SYzqxf9+rSdQ6/1w87+Q/ZJfBoJjqpZEskB+z+Qt+11Fx9nSk
 mV49W9RQOtZ6av31C4TheSIw4MYJoDyKoHikOfk+kgsq/WCXqMV/t2kzyukpVHKbVstKJk77sHg
 j0fVUwcflxjVcDSMogiKe+iByR9HjTWq9+sy5CMn9uToASq7FPyTzSU6tQ8SQgMC2O3oBIL0+/y
 bIq/Bq91RUPhVJ5w+TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXxlFMEHDc5HJv
 h4JpOMWveYd2FLNj7NQY9uRQSCe6fidJY8k+eQ2ncQH2fC9MSA7YKukOVad1KpSrb0dyiRfxMB3
 5K9CThPMs/I8VSfOXoM3Wxcb46WUCVI=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeaea15 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-MbjPq3b4U0PC_0A3OAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040032

On 11/3/26 10:29 PM, Lee Jones wrote:
> In msm_gpio_irq_set_type(), when pctrl->intr_target_use_scm is set, the
> return value of qcom_scm_io_readl(addr, &val) is ignored.  If the SCM read
> fails, val remains uninitialised and its stack contents are modified and
> written back to the hardware register via qcom_scm_io_writel().
> 
> Check the return value of qcom_scm_io_readl() before modifying and writing
> back val.
> 
> Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
> Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968f50
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 27f06bbc113c..1b46735fc4bc 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1105,11 +1105,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		u32 addr = pctrl->phys_base[0] + reg;
>  		int ret;
>  
> -		qcom_scm_io_readl(addr, &val);
> -		val &= ~(intr_target_mask << g->intr_target_bit);
> -		val |= g->intr_target_kpss_val << g->intr_target_bit;
> +		ret = qcom_scm_io_readl(addr, &val);
> +		if (!ret) {
> +			val &= ~(intr_target_mask << g->intr_target_bit);
> +			val |= g->intr_target_kpss_val << g->intr_target_bit;
>  
> -		ret = qcom_scm_io_writel(addr, val);
> +			ret = qcom_scm_io_writel(addr, val);
> +		}
>  		if (ret)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

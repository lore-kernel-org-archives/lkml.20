Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FA8455198
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141756; cv=none; b=T9n4/qEtpg16vQ4IA4ae3o24FGIa0lqlQ0/GngBCDcsV+cgs/iyDHbqdypPWcijeMTX5HtNG5R0UcPZvSeW+wiCHfZe6VM5vRtNjjjTtLQggfM5hdwMuq0lzY+AGFtVoD9rEV1IB7ueVVg14aWXWYDTaAM6QxhbmizcVvRJfx+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141756; c=relaxed/simple;
	bh=lyvoeq0e8iebXlLsQyQOWuo6au41u9pWEqiAdJIh9Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNSLT4//Cz+1X9KBDwrrIKTfICprG230nahw9EftzjQnFJlFaFdDp1jUlSzzLSc43W0vZlcYm39bDBw2clTGe0NWsU07Y+PVwk3p/PSNwbPV0D+rsErTTFTTQEUaNaGxYUse3D7bf764tWVNNDoIRe6xFnRzETiOyyIeVPu2E+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARk50zr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUyQfzVP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARk50zr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUyQfzVP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lHTY1797611
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=; b=ARk50zr6m3Ulzobk
	Fy8URqJ1oVGMLtdbHqnYnRv84JSNMxzau0MmfzbOAkygZW9vRUd+AscGgJBO8bQl
	+2ci70X87BY2ea2bxh9Y8ThaXS06+7xA4x0zuTlJtJBLfA17NeILaC6JokLq3AYg
	cSKedk95t2G92JDJsOMPIstIA8C3eSfhLbAEXgUDbsHrPdu/klGgnElkogCh6JD+
	CSM8Dd+99XGmrxq5Uitk9tvNE9e4MNauCm6Fy3Uy3a8EtNAbga9TirOKGc3r0CnT
	viQM9o/NbaO1NWYSP+kMXEsIU2fYfa8GiA459iIgtsqrAGONl3NfvBF32zrlXZwr
	5bMp0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a89v6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:09:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso3829785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141754; x=1792746554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=;
        b=LUyQfzVPtGv3ppfb8aG8Z7hn+n4EnQ1w7ZTIH5uLTBlz5+HA72azVtSt3jH0RxAdui
         LkmkE0ec333Xd2YbGF6JZSsJ21SpoIKQkI1Q3G+58h+6fyNTaHgy81F1D1g7O/2MhyGX
         fWF0H146Pgc1y3HUCYHSHQOwCMofUBPJZ1KHx0wLRryclC6cGL9LvUI1kmeCD964VoXB
         mcuY7X8KSTwJhSHUhMiV8Cw6D8JjgQXAWF5G9dA4L9QX/PUQjk3rHPpXj5/IxeG+hJEN
         wafFMgAL66qocLx/0cue9VQdGDfCZvMeayW0UnmZy7znTgklF5rw+jRQKwFzuAECY4Jd
         qhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141754; x=1792746554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=;
        b=mzdKA7eo+si10As7I//JjuZXTpTbSOHM+wKWS75ykuB+pw7Zk2X/vDLPfoGtDRnWOj
         y/Prhq33spbT6WZYrZS/z8opEXExexpSxRQPNZmJD1CE7tQRK7xJaHmMKAtBZ7YNQgUh
         qiUWsbQA0/ZudO2z6IIIbvcUnw2Fe7F/1GGoN46zWQjf/enU91QTyiH07DxoyQH/OEFO
         E+IYLBWrNTD6wEpUp3071Cxk5NQC65HmOqQQUv+mFvzjQ3bTEV9CuOSQB4nbmO2t5VCl
         vast38ZxMGHsVSYo4IUvWFDIMo/KMoBGFBf5vp7AtPKtv6yd3bqsKkWdShO0yFMX8XHn
         t6iQ==
X-Forwarded-Encrypted: i=1; AKwUvBx518159CGtsJCUCV5+RgSCstCmt5JsVS2dpRMoxLCjuioNUyedaA/DAc1ULCTbH0zVNbvNcMool8aylS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3woV+q7eXpUlQtK9D98xByvULZLB1RYtMilBfVZ/TN5s336zF
	9KWo2EVnmUtWWP+n0O41gUAKHcfb9Dlmdoe1YUnrgB36bfpL1/1b0IsTj+Z9+XdHxVNPZxsdjHL
	n57HR50ViHObs9nJAz5GwFvKohvjkMWPGghlqpUPELqUYdyecLi9UmBA/+P8iPqsAua0=
X-Gm-Gg: AYBFou3kwYDcEV1g/yC8ikj6+LxbWeQ1sC9mLnidEF/LumAnMetg+I+YcjDM6fxYVYa
	S0MO4OlSQFPy+HuBMHsnjiw97YDzHWspgUVnZcoZBFkQIzfq5Wjl7dxyRqF7VNOSWS9t3pbn7/T
	XFbSu1/d9LUihcFiZA/voKkANZZ9LPI6kU7kCwG+uz3GCZP0D/M5osk9qa0C+WfsAv+rVH9x7fd
	pypEM9ifqc/2OKSPXIMCXJAjV0kN8VmMrlLUZGHjfYeXdGJXg46Nr9+qH5ReKq2jI57wrD0mRqK
	sz30w3zq01klBHMw0cWfCheGjAqBwnFvz8QH+ps0XtZyUPdWr8LjmJePCyGuKszgKo/A/Xe+Is4
	Q7gbhLGF/nwvwlVx8i3RxIQ==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3675061285a.0.1792141753512;
        Fri, 16 Oct 2026 02:09:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3675052785a.0.1792141752034;
        Fri, 16 Oct 2026 02:09:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm53638266b.78.2026.10.16.02.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:09:10 -0700 (PDT)
Message-ID: <4faab1aa-18d1-44ec-8a3f-79d732f7d0b6@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
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
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-5-c15cb83d9140@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-5-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX4AiFbKAxHnIF
 WeIskMQII/QEmv2Bd+vjR+4NJcDuIJQrTBLVSF6FdJerkw0iGQSS9yUWcFa75C8v+Q6D04VlnpE
 jAvcR5AbtQdZwMzDWfyFsSdiu6PG/0E=
X-Proofpoint-ORIG-GUID: bE1z6EuD5GtHjbBTG7VSvVH8yaHLfEUB
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1e9ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8oCPm4Ec_qhLfyN9vMMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX+Jnc8qgQtq5D
 rG/WbCNUxvRDjq1AYYvI1MrKlBDf9M6pTP324/iPSaVn/Lh1whrogC8D3Q6+5sqGH00v4idFHig
 6/hCJEcqsSOkwxprl8J+2vvWlfZ2jy9O4V47lFkQtoi6uUMARXHk0+UUqrPc7cdZzOvbtX5kPB4
 ivQCVVedGxmkSKoIltGnH+emLXWk50MCR9Hts8kRHAXjghoJ55P95MvIMryf2uu3kfpcmMI24VV
 NwAV0L8ap/8r/xd+r01e4GiGPlWJjwRN8BmVkfNqb38Jmq6tE6s6wVAerFaEJZHR9tFA6QZLNFP
 JaWd0Pir2aOzzuoi0NncMJVLxqRTG46ypDeZA9eB9G6K8Z6x7ecWsclnsDcHxBQDcODyRk0X4xn
 GxG5EKnI0CSpdxmhugDr+XrlkbyHN1odXBSxCx43uSWkNps1jUu/PgAQK3WoB2jGn0BHXg3UA/P
 2idPzHXv+gzOwtTPUPA==
X-Proofpoint-GUID: bE1z6EuD5GtHjbBTG7VSvVH8yaHLfEUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 11:54 AM, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 22eeacd7aecd..3bf7baa2bc82 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -1017,6 +1017,14 @@ &mdss_dsi0_phy {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {

Please keep the nodes ordered

Konrad

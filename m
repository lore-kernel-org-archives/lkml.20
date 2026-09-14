Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC953630AC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381550; cv=none; b=Xt8GeOldD1thDXUF/KVd0eet46+UkSK7kSXWfl3GcHFEx5cnDY8//x6vC9LxfAsbE2zP1Ey3gFWhm9V/X2t67Rp6gCdRl/bX2haiHIULBVn2EGlnd0VZDQy6/4LQQZWlJPMXTFUQiLyk2DcIBvRvp6PwsCbSscTjy6+a5o5GGdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381550; c=relaxed/simple;
	bh=OOWFS0fW8PalHpuUVagUzGyLfGec2bM6XnZpla9OrZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcjbjFO8l/jpZNpwHEubxqT8MDcUjPM4pOyU5x8K2n+rLCfJZAF9L1YQjJh7Li9PrshiCBkG3aS0asV3slU+LWNVgGGdCHq4iTiYoJEwjGvfWkCP5hSrqVI6saDlIRxjbwOUvHA2C3MjupWZIFg2uDmQI5nvzs/TyoBQqdSP+WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnzhIN5V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joV4RSls; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnzhIN5V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joV4RSls"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nMpF3663325
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JX+0a+hStUyRWI2lGYq3KNdkSglVyMZwq3O+0P0j1GY=; b=cnzhIN5Vo1Za/wEv
	iMIWGnZ/ZNlCOPEn0dLGgl2lbE/Y6zmJQxqkHWj1HZ0RlzzbH/X9oJIGFfx6uUss
	YlfJAlMxBA5Sif3PUYnaLeijGTGtmxszQkU5gPELQQpalkZtnGJ/+2zFU/eEn0F9
	K3FhQN8CTJfXQu4/ZmQS4G5KTDbhihEpcU7MsX28EpFVnt1f2FcKX8TgC0T25+Fx
	XO8+has4seybPo68RyZrU3k6oeLScIuHpDdZHbogp/55tx0WYZRS/A5tMhVgaPSs
	Mfn89sTqStt53pqGs326mWxWdWnwKnTFSnOBXcQuUfazkO0apCT6m6X0fLivrorR
	1yIsiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0k8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:25:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a18b457bcso41843585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789381547; x=1789986347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JX+0a+hStUyRWI2lGYq3KNdkSglVyMZwq3O+0P0j1GY=;
        b=joV4RSlspFGkIJHjWGMakpkF5TsXEyjtVLPOSkSfyg9hZzmcDDJvPvlFskMPS4/ojK
         hEArqsKpBkssbH8GxIfA2Qz//yzyGEwu/teVRsTNJcpgyUYSdDNZ1F3F6c2dwdunVvWV
         hHrzSuEvOh5N/ifqb/9LUwVbfm/oHyIzDjPDu/AckozX2BrbY2Z/ESIRCFLx9H/VVV1e
         /Op+F1QLnfiHJiPrwvbtjyUuOcTEkNDJ7fHjcRg4Iyc1gcIY/3zvxmdX0jB15/2uW/Ql
         PHrH3EDPzPKexCg47SZ0VLErhpXL1eP5LKatkaBlvfEbtOfK2MYfp0I04NmtOFapN5oI
         HDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381547; x=1789986347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX+0a+hStUyRWI2lGYq3KNdkSglVyMZwq3O+0P0j1GY=;
        b=mDgtq8kN/ppYMRwA5iBJ7A1H7WyA7bifFMrAuzWmzWZD59XBRr1dVSBIHdeIIjEd4z
         9mDgcTyWvYcXMzacMmYwzmzB6A4GrewsbyV9WUE8PepqllYC7Dyn4xLDBjhJkVzEZd8L
         lA5B+o8rphyEmpWBr7FJAyDpC8eIpTLdfXIUzmMS96+adflmwYLjhpHWEdkzfXZ2rwTn
         /8Yr6nhbvK+DsyJXtJ/ZZlU4LQWQ02aa9PHTMx/nGB5b7TwF17Azvh+evuiff3jNLPll
         VPy/aDkTw0cIfSLajp9b+83pJ4xciDYUaYGfhTKYVDsvo6Xoyal1q0tCLecqKBOMiw/B
         GgQA==
X-Forwarded-Encrypted: i=1; AKwUvByAYuFJ9W2RsY4WF4d08Yx6by+AzxjjL60Ce8CLVcBmYc+QxNQZZ9txBTRQgXSmA8lDQ9ZwGMLeZD4ds+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nETtaqaBJ90bQbyt1+GYqq/knCWq3B/fs9/aph2qhKhYtCfiRO
	CpHzABhTd7pmF/BvTqnb5FJZOFf4hGouu/m4zARZPs8OUVqWk9NKL0ec7X6pZRMWI1slGaaLzsj
	DzZJbK4YFAg1NuMEeltWyoP4wCu08D2jrUfBNDt66uXF3RFBWqtaeDwyBrtr4y0GA9k4=
X-Gm-Gg: AYBFou0WquhQI6xajK1i3xyEo0cdR1y4Y+F+kgA2kEPRT4+ygFh4vuZDuV+fhqVoGUS
	zV+nK94hPP+reHcn3wiZF6NKTovtcxSRtWVJi6o2hznQ5x5WIQ/CJTXWWv8MYb70i8DkZiCwbLq
	ThrG8mkbr+Zc9E4xGzO2A8Eo3x8Vm+ZwrWjBVTUyeGr/bilzJkXirvdK65O1mdd0Cezo9z50xlF
	zepNAsZNCNCFVrcT9WWI41+4lvQCIYaNwOzzzn3SB6xqITXyXdHIJx+Afm16wyQMkbw04gGlTzD
	HuPo+BV0UgbETg4ryVPtB4Ui5bl1YUJ0Zh7bcJ1wT0fzh5NCh9xjUXJCyD1/GQbMWVx6lS+o7Kl
	wWzgoAnUJyNsn7LrHAYZUaw==
X-Received: by 2002:a05:620a:4707:b0:939:de49:6c78 with SMTP id af79cd13be357-93a297cbe3bmr211355485a.2.1789381541932;
        Mon, 14 Sep 2026 03:25:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:939:de49:6c78 with SMTP id af79cd13be357-93a297cbe3bmr211352085a.2.1789381541452;
        Mon, 14 Sep 2026 03:25:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm404140166b.12.2026.09.14.03.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:25:40 -0700 (PDT)
Message-ID: <b96659e1-d2e4-4272-8e78-8042cd5bca9b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:25:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: typec: mux: ps883x: support TYPEC_DP_STATE_F
 like qmp-combo
To: jens.glathe@oldschoolsolutions.biz,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260914-ps883x-disable-usb4-v2-0-523c32b4e4d7@oldschoolsolutions.biz>
 <20260914-ps883x-disable-usb4-v2-1-523c32b4e4d7@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-ps883x-disable-usb4-v2-1-523c32b4e4d7@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7cbab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gxl3bz0cAAAA:8 a=lhgTqZXDA9jZt3rOk0sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: KrTi3Id5pRXGtzXFQfyRPlgWCa2fihkI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0OSBTYWx0ZWRfX/nDytDF04NRb
 OAH1Wlof+SReG8FDIVFxZlKsn19UuNpND/l0d7eejpO03bjQ1CXf/acOj7bAsNg9yBtsbK2m3vQ
 3aRtjPYHSDXsfGuua7sr1ETP2TEx4B8=
X-Proofpoint-GUID: KrTi3Id5pRXGtzXFQfyRPlgWCa2fihkI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0OSBTYWx0ZWRfX2d0hO3yQ9ijX
 sshDTaaUgPgJmf/3g0tI1p7mcmQl7b+W1c/AlcDlkNuAYcNUhekPDs95joOncUTGeK0dy2aoItm
 Nt/+IOxmuMRn0AFbDXNZhBqtIu7vclrDmRvnXEguHXF9K8Cr7SSPX5sizBlUdYrsstv6Sytl7vU
 pO7L+lX7OGz+QDwbUOIfaDtdrR65U+kOlEqMAGX3+/pDagWuy5VaWW88gBWZjFU2B8CcMTqJBDm
 6WrKq1IGA01tgFX+MXN2tYu/NvKyxkZT1DzgJbTcozK/FG6DVeFGwtjgHIQJZxx1Wt2jvbcIfxv
 bNR3c4Iji2ae8kHVHnsbwhZujVDpUv7Si//Kax9avBinzbbChn5SO0OE4a6BdnSEmNmaxBZbOFb
 0ExPYJXVomHZ9IEZ4I3t2vQQVRf6TfQY29RJ0HRK59UiImIXi9qDIQpz//QvzF1aswQr8DkBJfu
 K1LOP0bDlLQyfGMJ2RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140149

On 9/14/26 8:05 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Several docks, including the Lenovo 40B0 and SSK SC220, still send the
> legacy TYPEC_DP_STATE_F mode request (deprecated since DisplayPort Alt
> Mode spec version 1.0b).
> 
> Keep the handling in the existing DP altmode path in ps883x_set() and
> mirror qcom-qmp-combo: pin C/E are DP-only, pin D/F are USB3 + DP.
> STATE_E is grouped with STATE_C the same way.

The premise here is entirely wrong, you shouldn't assume wholly
different hardware should be programmed the same way

> 
> Assisted-by: Grok(xAI):4.6
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/typec/mux/ps883x.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 64e0a61b776a1..c185d8897e3a4 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -205,21 +205,24 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
>  			cfg1 |= CONN_STATUS_1_DP_CONNECTED |
>  				CONN_STATUS_1_DP_HPD_LEVEL;
>  
> -			switch (state->mode)  {
> +			switch (state->mode) {
> +			/* DP + USB3 (pin D, and legacy pin F) */
>  			case TYPEC_DP_STATE_D:
> +			case TYPEC_DP_STATE_F:
>  				cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
>  				fallthrough;
> +			/* DP only (pin C, and pin E) */
>  			case TYPEC_DP_STATE_C:
> +			case TYPEC_DP_STATE_E:

STATE_E must not set the CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D bit
I don't know if that's the case for F too, possibly.

Setting DP_SINK_REQUESTED seems to be valid on _E.

>  				cfg1 |= CONN_STATUS_1_DP_SINK_REQUESTED |
>  					CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D;
>  				break;
> -			default: /* MODE_E */
> +			default:
>  				break;
>  			}
>  			break;
>  		case USB_TYPEC_TBT_SID:
>  			tb_data = state->data;
> -
>  			/* Unconditional */
>  			cfg2 |= CONN_STATUS_2_TBT_CONNECTED;

Stray change

Konrad

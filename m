Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88F54973B5
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372373; cv=none; b=YR/GcA3thUDRJHkvreIHfsghhgVqrykdSk1pJ64uEbmm97mI+hJNHvUyRV7d1J5yy5rrk0bWzd0Z528LiPJq5P4j3PJeUTMgF+qMbiX7bSmvDUCnL75wkDGg/LPXG8taTwLLOM1BgBsWY9wE/m54Lp1KS2icUZT+BaDjLOv16UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372373; c=relaxed/simple;
	bh=KJnbpRVIHloDGfDhE5+fXC557tLNYH9I8hBo5WFW5oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpJ0uL4w9qBg2OTSHFbh51ev+bPe+zXQNzhHYbRs5m6ESDugDRm1z0hwMcDscPsFcb0fs6yAGc4rx980++vjX6sezhtwvwOVJ4JVReiyN61xwUrPSl5hWo56gCvPg/CIJhAnp5SNVV1bCZ8UEtAlcPJsTUQhMEiQgq8FtJWXapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbZWwd4f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZzcI4WR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbZWwd4f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZzcI4WR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmAQ3686155
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=; b=hbZWwd4f45taM7oR
	1t/YxBlNIjROoMvoLxe0gQSim8xIGFobL9WRamvq9/R82/Y+TltHr2PAUJJ0H+Cv
	HaL084GfrENxafIPOUFc2pdpG79at5prnlP3qor8IIp+/Q3knXd+NIcsaOvQtZky
	zdaYb4wf7K6GAnlGUkcOCufrBOLB/oHIKlWJ7QlbxIWyj7OFQ85TPvCIuWC6W9ih
	BfA/WJxsIJfFX9k4oBIXuy1Vk+53Hr/pWqE+XkCjZfEcEXj6HvTk+uJOPVp0CFnj
	7mg0WpoTEk5zoY25BTy1NK5oDKltaas/XPKjwVkr9eJbsoN332Qlc01uvfon59mY
	8ggRLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609uts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:25:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso305479485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372356; x=1791977156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=;
        b=jZzcI4WRejp4T9gRzvqbaV2utjFnTyPORCUuwovl9dbL/cau3iVx1ekUuGkj6PKjqZ
         PAv+YtYfrs8tEXIE/w0a5gqcxfQZ04tGfRmkqsSDSEGEsxPt1se5ZXR7+Datwl43vf1q
         Vlz6a6k/r2RhGYOyoe/iz99KYqZVocQD8b69x7PfbmRROW8izG/+j19XjZHzUO70b5ig
         Y0ifOvkxfRrJbNtMcUSMaj0Cm5nimgq9dRvl6WS42/cuyQx4D+E4GhEGjEvadhlOfL58
         QS9cvoMB+y8jEl5u9vIQYv8xsnZCmXn6ODNavIHaHtkCYFewdNAZVMcTxTU23d9OkWLs
         z0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372356; x=1791977156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=;
        b=Y4D5/C9PwuiFfCHRCYFEIV9m9It6j6xUUMlM8hI1pQttIZSI+SvZwJz1o9/Kreb6y7
         yMiQFdGvdsZyYvFfkxyA29holQksf1ZJVifdSIPOHaaUExBx3J4bI3dABeV8JY5FuWAH
         HLcMktmz4GXDOL43l0pJ3LUm73ZlIWOpnGQXWFCFaPmZycuMfmDhLb47M3lM+rydbETP
         kZWUt4bF0P1OBA8QkGyUKaJ1FVOu/TFuzrVMYnFgPVvzKt3GIfiC0k2pt1kG2/bnHZrD
         SLS5YK8QeXNgeDqYSqU+UiTSOpfsWnVjjdvwdqGDdx2CXbdnkYeqGDXim77PwmwWBcEh
         hm5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzvPom6y8eG9lgJSskHM1EkdOdpv4KdqwVeBjeGWBSHAgsYollOrwFObFoXAyqyHP8ZLlcj150AneCruGw=@vger.kernel.org
X-Gm-Message-State: AFuF++keiKE5iZJLDnarmdV9XCTBf4eyUhcVjYEhgtHjaWG7ScXfOsLd
	P6cBep3djLzF7aNPiU3Gm/ycWJmnn4O+Kt3B28zei7gqvO/SxlBHesUxYQAOh21v4Ff765kLcXg
	jTyH6IhYqo/578t7GH+xEP6VSeeTmXz/jQamC3AKg0FLxLlGRv35sfbQ3LQ0WRAZVIag=
X-Gm-Gg: AYBFou3nUk2tJ0KhfWqC62b+Z97wruwUfz7SlXlZCsa9iMxaaVvzOvk2qeKdNE0W6cc
	+8gevxWBrP4xZ+CjMLef3dI0BKhhDC6R5by6t3+wqCvjoJg/e+ryce3kjTeL6e5rSvWG7gx19nD
	oRMVLN7dnvmbiLVKd+wqEJb8k0wB0murLBY+M5p6R92v5u2GGqqEcKBAeL4xxSJ+RBTZXJ1/gP1
	lXtvMZ3LEFqEyDVFrWlW481RNl+YZjYA1vDE6JmUBZG/P3nfQ+4oePoQUc7gQKWos7CjAMWTZjS
	82aYYY5kKj/AnbsEn7ojb/fTBeQMr0uiiGEGd65Foj+rngkts4ILbPbS8CeY5wOm3f8AIqSMJW5
	bbFIz7wTO0/4TRTa1JBOYv4+N/By+gX1HrnGYfWln
X-Received: by 2002:a05:620a:40c4:b0:93c:ba2a:6c03 with SMTP id af79cd13be357-93e9b71c7c1mr368526385a.21.1791372350863;
        Wed, 07 Oct 2026 04:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93c:ba2a:6c03 with SMTP id af79cd13be357-93e9b71c7c1mr368493185a.21.1791372345970;
        Wed, 07 Oct 2026 04:25:45 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4482c4sm111196265e9.0.2026.10.07.04.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:25:44 -0700 (PDT)
Message-ID: <647cdc36-d6ba-407f-9eb3-f3b34ad9df4d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:25:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/74] media: qcom: camss: vfe: Add helper
 vfe_bus_v3_packer_fmt()
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-18-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-18-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aX8dkccwEjzeqijpFNNU4iB7_-au8SKL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX4tr1d0KYrPTO
 rgqvWmD0oniXYt/1emFMKpvHMAd73N84oz6ScgXCYtTZfc89uCg5UB/hzIMRNpPPdnJOPCdtNC9
 GA8SX6oDVg1sektueOPpC7W7UEDcl8M=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac62c44 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=F-lHOqjDzm0Mqe-WZYMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aX8dkccwEjzeqijpFNNU4iB7_-au8SKL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX8s6GXi4KZGw0
 WAJjTaG+J2y2lsF36g84uAx69glOTdkKHUzUCXQsT1+4EiClckzAoVNeZmJkQYzZtguy6w6ithH
 qnNQuR5ZPqmwxktGBJLzmN4zYKPMlFWF2Vxd/8fq3pSjc5W2g7zS7TAfW0hTQj6V84oHhQESsRH
 JX33RsNOh++y8hDagsIkxAgmZR5c1okh7dwLAQHWrEyQqumFc6VR3oxZFv6Zs3RpiO9L9Jc5Ysz
 67uXDVqw5FgjCkV1Na2n+pd9dTQmiGrOG0Qw9RPyCGVRVTdK0+DfCeRfqt7TyHYw+q7u/ktwNrM
 4guzIV1P1WUc429KO4VIhcc4WnBV4liyk0BRhd55zG5i3fRrFE7a+Ux9eDqxvGvzwrmnrnF5VIK
 XpPIC5StWXDk/DTphUj1Na9mlpIbYy2HaDw9TMuwYdsqIV4OWZwD2Wf5UJr5BFEa1ILKHu6SKSP
 azo4nJVfGVWEsd59WJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070045

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> vfe_bus_v3_packer_fmt()'s job in life is to translate a given v4l2 pixel
> format and plane into the appropriate bus packing format for v3 class
> hardware.
> 
> Other versions are currently not covered.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 53 +++++++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h | 32 ++++++++++++++++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5b5201b55a485..c95fe5b0b05fc 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -370,6 +370,59 @@ const struct camss_formats vfe_formats_pix_845 = {
>  	.formats = formats_pix_845
>  };
>  
> +u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift)
> +{
> +	switch (v4l2_fmt) {
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV12M:
> +	case V4L2_PIX_FMT_NV16:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10;
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_NV21M:
> +	case V4L2_PIX_FMT_NV61:
> +		return plane ? VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10_ODD_EVEN
> +			     : VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10;
> +
> +	case V4L2_PIX_FMT_SRGGB10P:
> +	case V4L2_PIX_FMT_SGRBG10P:
> +	case V4L2_PIX_FMT_SGBRG10P:
> +	case V4L2_PIX_FMT_SBGGR10P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI10;
> +	case V4L2_PIX_FMT_SRGGB12P:
> +	case V4L2_PIX_FMT_SGRBG12P:
> +	case V4L2_PIX_FMT_SGBRG12P:
> +	case V4L2_PIX_FMT_SBGGR12P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI12;
> +	case V4L2_PIX_FMT_SRGGB14P:
> +	case V4L2_PIX_FMT_SGRBG14P:
> +	case V4L2_PIX_FMT_SGBRG14P:
> +	case V4L2_PIX_FMT_SBGGR14P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI14;
> +
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SBGGR10:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_10BPP |
> +		       BIT(align_shift);
> +	case V4L2_PIX_FMT_SRGGB12:
> +	case V4L2_PIX_FMT_SGRBG12:
> +	case V4L2_PIX_FMT_SGBRG12:
> +	case V4L2_PIX_FMT_SBGGR12:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_12BPP |
> +		       BIT(align_shift);
> +
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SBGGR8:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8;
> +	}
> +
> +	WARN_ONCE(1, "no packer format for 0x%08x\n", v4l2_fmt);
> +	return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128;
> +}
> +
>  static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>  			    unsigned int index, u32 src_req_code)
>  {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 089f525b98cf5..98d403a71cf95 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -56,6 +56,27 @@ enum vfe_line_id {
>  	VFE_LINE_NUM_MAX = 4
>  };
>  
> +enum vfe_packer_format_v3 {
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128 = 0,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_ODD_EVEN,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10_ODD_EVEN,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_10BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_12BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_14BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_16BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_32,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_64,
> +	VFE_BUS_WM_PACKER_FMT_V3_TP_10,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI10,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI12,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI14,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI20,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN32_20BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_MAX,
> +};

I think all wm configurations should be separated in separate bus or wm
abstraction and move those per version of the wm/bus.

> +
>  struct vfe_output {
>  	u8 wm_num;
>  	u8 wm_idx[3];
> @@ -315,4 +336,15 @@ int vfe_enable_output_v2(struct vfe_line *line);
>  int vfe_queue_buffer_v2(struct camss_video *vid,
>  			struct camss_buffer *buf);
>  
> +/*
> + * vfe_bus_v3_packer_fmt
> + *
> + * @v4l2_fmt: v4l2 format
> + * @plane: plane for the given format
> + * @align_shift: bit position of the PLAIN16 LSB alignment flag
> + *
> + * Return: the bus packer format for the register
> + */
> +u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift);
> +
>  #endif /* QC_MSM_CAMSS_VFE_H */
> 


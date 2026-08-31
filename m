Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1588A352029
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141584; cv=none; b=MLIQCoGkjCYP6j6ievmnFPhDuEW/eMeIw0MbIQxvg+zIBgzVQAJGDgTqYwsd4o0Mx0AUn75NNBlvWcIYy5prVAePot/k3l+KYFoAjOhHCFPbkCUcinhZznf7KIVNGOJdT/ZdXT5vv0IkCpP0/P2IcRuS0CT4hJmKcqoF7Fp5lU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141584; c=relaxed/simple;
	bh=AGfDsr/pVkS0OEQwOOgN7J1EQurirgN5CnkOpjH3004=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5OULepmuv6TzsphSZU+C910mLdVphtz4tiZfeZ/PGRL66y/lK0JODS0uN9rduivDTzbs9ARQo6VuSvKW0PXTILO2KxCB16c4No9z8UUtfNeHcPPGGQa+HliR5BE+BQIMKuFb77kryE/imkexpBMmwM1vpyNTEwjFuRU9kIf+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fceX2KwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dt0fehA7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fceX2KwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dt0fehA7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1blHE2083280
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNdgbq+Ke14WYouyaldBldt5vSdQp4sGRK5KqDVJ/0Q=; b=fceX2KwPMT5eQj3v
	XGbRTnLa6XwlTcfQq0ZcEtQnOi8i5LzcZq+co4ehgKYnqSG+MlkIj4G7HHP4/0JV
	/f715sxJ7Wx9ZRPDghQqUoi/cjtpFq4sV2I7E+Ln860Vl81AhGAOrJDU2LmslrSQ
	6RBZjrNFNQXqUU89KArCpPCGxdAeAKKFxrprXEk08R90Wn+YPz9PLMXKyYd8pot5
	O/OQF6ejWukY9KAyisNdV+GDJvuHG9Bofq7eqY66uGcDrfZXvcBbn0EPeWD50D3A
	9VzjxZuAfgUaOxS5L10GyUprR+EtZt9eO4Bu3BKMtvvYmE2W9ZjDbET7FSxdkWUd
	Vtwvog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w8e1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:59:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so34619695ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788141581; x=1788746381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fNdgbq+Ke14WYouyaldBldt5vSdQp4sGRK5KqDVJ/0Q=;
        b=dt0fehA7job1BcnZUI+gL4ZhZN+EfVLjORj+hMo+0jMrTZl3Ig9BR4WiATqnEhp9ps
         kYlTL1H9qRSGlmH60CwDx7tRPFQdbq8RbTbVVcbkULs9lIo00sI2gJVJEvKAC5Sq/XQS
         Xx18Gx/VjN+4ucQtO86xkT75J+QTw9eDFiXoniE/lL4mV5095iwguE7bxpQipq/FBIeJ
         oqwYTgHn52ceH4JDybmsyDT0hteLIgyjiDiSULea751plZ4sXlY5XerDeZOMcUYTAJuW
         tixpB7SxuVU0qjq1+9UDVwaZ94Zm+biLDMIiKxkIxcoZnkxEiUdte6vTdl2N7Sjma0hk
         LySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141581; x=1788746381;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fNdgbq+Ke14WYouyaldBldt5vSdQp4sGRK5KqDVJ/0Q=;
        b=JzXqED/P+SgC+1gyj4DPFBSMJN/eP26dQBoBNvtlVI84WI595ShlPiNgcNIzofDnQM
         wmiaZ4Z/n9cR8pVtFgE2HSx3qRHqrio1FuQzYJtNX02hzjJsoJq8XiAUD6kWuiWe1Pbj
         EDMjqoXXyhykxYKKIo6Fcpp7hCrbWgi7a/7IXCNDQWR4yUfd69VBCbjcBB53+Mzg4x5l
         +HCcmif7zKHk1fSOa0cXG4XowTY75TRAvBpOuQqqZa7stfV5WFaEL0b7t+s1NfaGDy4A
         nOWB6jfLhr+L8qWmVNe+FmMAxvFqUNlD70tDhkorNaDzM9Pqsram3CHZr+4MV+3862MY
         ENxg==
X-Forwarded-Encrypted: i=1; AKwUvBz5QwZDBQDQbk4M5BBdOEuNCp8kmPHPznavFv/TzSvhIHdCIv9y1du55BgQltF/+Zj23JUb+6VsDe9bO40=@vger.kernel.org
X-Gm-Message-State: AFuF++mou0DcvgVVOl1gDn3egOmX+heTz6h/3YjPl8fUe2mXiO/k2IhA
	CuCoaAwfV13gXzYn8jhJWZgyR8nHA3sgUySozWeRr5WzsV9ZYJnaUChtJK/guZYyk2hv6JutovH
	cpf5I0yJcmpBvgMwW/pCEs9CleQcn95jn+ekKS9w/K0zkJ08a5gks1dfuQJNac8r6rC6hG5s7Xn
	SS8Q==
X-Gm-Gg: AYBFou1uJ/SDPgwYB/8uUyUis+IHN1CX6BR1lkRTNFqKMSkpqNTFWQ1JRFCd0XDmAU2
	6MQc8PdU6kkeN//udDt/1KkkK+q3kd2RfrlbQOX54jCGhJ7dxJ+OF2K2npjyGVnebvqS73UI8Ps
	VIHvtrRVFR4vARehtjLFolyCL7Buo0SBd2slMOVQBtPti/wGGgNTbP6Og9iunnfoyJ9hRwlmGNR
	rtpdK95wXDUDSyVAkKfyEpLYUHrfkWUVB4qYtum22qgvit9y6lnEzxYVFAawh/bGAl9ptdztdWP
	EcTTSb4iREofgKcY1naGSR3GPUF/eL3BlLoSWhUKy26rWJf4LPccjHtGYoU09m2Q6EWs58Mt67s
	BRh42WPN53mM3zAChVRAjKKJjetBmsk4=
X-Received: by 2002:a17:902:f70a:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d93f924498mr2677125ad.5.1788141580940;
        Sun, 30 Aug 2026 18:59:40 -0700 (PDT)
X-Received: by 2002:a17:902:f70a:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d93f924498mr2676625ad.5.1788141580511;
        Sun, 30 Aug 2026 18:59:40 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598c155fsm27355795ad.80.2026.08.30.18.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 18:59:40 -0700 (PDT)
Message-ID: <4f39d1ba-c41b-4add-9c7a-80d4eab42b73@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:59:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2 0/3] wifi: ath11k: fix QRTR readiness
 related WLAN initialization failures
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a94e00d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yeVnTpnW9Av9R37Qzj0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAxNSBTYWx0ZWRfX58436kRoHMCs
 tdvxRAZbL+lz9irGYaK0zf6lquAiczo8WgKVGZ8FUEWjZH2jmq0xF9BlVUX8dMMh1WVTyD0T79V
 mNq34fvkbM8BvlH2ekHwnvmszTafuK8=
X-Proofpoint-ORIG-GUID: a-7igqDS0EanxNT7m02lexC9ROj6ZL1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAxNSBTYWx0ZWRfX2I3MxgjJHJi/
 2MpQRlNX3uvIjKT++yUHfwWhLOw3JJeiN1kyEmG9ExZByuc5r2V44efVslwlWdH87DIFT18NP+n
 BqmRh4uvteQBi7fnARkMaNAfBZ404L6MfxQOkkuY6lN1cAhIqIaE1XKOKfYTIKA4//22JDmRXRX
 x/RIHd2Euse7e4eh5dEOTgl1zvaizlURROGpnrOsMf3an+fmuDnK70tAWHh1RcG2jJARRFFnWmy
 2Fy5eT9wT6r5kRJXxcbuy1bIKCMMa2yTQVEMYVPeDxKB2twEP+NhtiR2exIWzNOs8rxLboQZJ96
 GoQqWovlaGmk+yQuOoFQ35ySGYHFlVTAeti7DJezcMtRHojgD2CRKNUApvD5IXz7W7EAetAcRW3
 ChZxpk4+NfqZdeKMqh4P2urRzxa+I8IKCIB/gytTbWXG5P1eFyZ+Z/VxqjdPpYl7W/qS+wP4dL2
 eUV1gs+aLUvOqW3ZFhw==
X-Proofpoint-GUID: a-7igqDS0EanxNT7m02lexC9ROj6ZL1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310015



On 8/6/2026 6:13 PM, Miaoqing Pan wrote:
> On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
> during boot. If QMI messages never arrive, WLAN initialization can stall,
> leaving firmware running but no wireless interface created.
> 
> It also hardens the cleanup path to avoid crashes when deinitializing
> partially initialized devices after QMI setup failures.
> 
> ---
> v2: Replace the ATH11K_FLAG_QMI_FAIL guard with !ATH11K_FLAG_REGISTERED.
> ---
> Miaoqing Pan (3):
>   wifi: ath11k: fix sporadic WLAN initialization failures
>   wifi: ath11k: fix NULL dereference in ahb remove when QMI init
>     incomplete
>   wifi: ath11k: unregister PM notifier on QMI init failure path
> 
>  drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
>  drivers/net/wireless/ath/ath11k/ahb.c   | 7 +++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> 
> base-commit: 0ece44d394570806e97c8471a50dc9f584516ef6

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

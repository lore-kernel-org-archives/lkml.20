Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E555034F497
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142858; cv=none; b=Lav6J/YHcciRRHfYHkGRFk+VIuRSyXUXmjLmJN7FDjDOkV6ZiTOzhlPRBSE1afVpNtYreBVn0CXrXJctDbrhHtS6Z7gbWfitB8gp2tce6lU7jScaP0BxjkTNLog0ezLOO0lqoM3i+M8mfFxieIPkJgrpbVmtPX8PNKWfPCkx54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142858; c=relaxed/simple;
	bh=nx72HZix5RJQGzqg2UiYbR8bywGzuswE6lXXmCOSpRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pC7NaItiPSWymlCPPIi4bDx1/CC04cUz121QtiKZaSqkyk6xEUNY0cCr4buCiW0K0hM1CyS++Duod9rOeJof7Zq8FzosdH8HN7O9U5pgzS1yUt5I3okoYMHA/qyxJmfnc8GayJFr8bEivsWw3Pzvnn2NtcNdF3zBFnN+15C4nMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gs6N7DBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J86fdC+B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gs6N7DBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J86fdC+B"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iIVQ3250337
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qjLbtTDhsHiX99dZ4U9zPc7b9TIIVkqC+Y1oTNhL7I=; b=gs6N7DBdlGDdnTzF
	J6NVzxTVIPUy88VXKo6EAbYiC6noCrTNvdM9E6DNFHc5S9bGvWyddl1rXMpRvaLp
	TfUF9IEVfo2WBmS0BqHPpWOMSoEbBDuD0Om94aunEBQ91h/9c/hAAEESrH140Dj/
	j45sKoMQp2hN76zSYykEeSw8QwB73dsLO+0z32CCBTbmCBKz169T6o4RGNn2opy8
	+CW2A3Z8iWUn5SZrrdWCX9bT38Qr5FhRGUA9QNrFF1tNAhjD/EtOv2iUVYynfh6q
	Tgr2G2Z40PIUPRYCKi0FIFdQU/hnUuEHuIsugjlPpgpFA56O1gWHQ9AZk9QqVNXa
	oNnpTw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c2pt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:54:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33bb08e80a8so552848eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790142855; x=1790747655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qjLbtTDhsHiX99dZ4U9zPc7b9TIIVkqC+Y1oTNhL7I=;
        b=J86fdC+B6oklYT+HItgVTFQHvPF6SMGLwmzIjF2JaoSn3WEktat/l/a3CJJ6GPWgYZ
         0Yg18uR+Uiql0aa+GxI1tLxG1U0XsBxTVd0EGYuam4eE8SmYA/lrc9OhyYGDd3AnWmP5
         82iCvFHlvPLo31EHcS/sxxVMEzo0f2uuWtvVUFReMNxxW7npK0TzlZFfbQMVdrZfj6h+
         qWfdpnHtdzhQ0fwrfkiodKPmi/eaUAJ56yOYYYYAjXkP9hlttwFQYKxnOBRLs7lzkWRa
         FU6WWIYh3RRQrnkNAWdQZkSwl3odGFR5TnpjDCuLRTS+OCRENfipXfQKjZAZCCHHLM/V
         Jt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142855; x=1790747655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qjLbtTDhsHiX99dZ4U9zPc7b9TIIVkqC+Y1oTNhL7I=;
        b=JcQZUsoi+ZqZZboHDU08Jh9+nZvdCoxOBn9waWFyYy5To3cCK9VSQy+zGneLmSIsB3
         yPIB2ZBCUkPacGNqorAcL/j5bSkhlmxtnYMsCflSIYHosWev7b/ycNaARwnBajZMji3D
         v8YWoQYeYWUTM7tMcewrFcctDeHikYki/I0oPgkI1kiK2Q3EvM/3IQikjKOiB+/Ilww+
         F8aKNV0RhKZGC5cuhzMqNxdjwa0DCRGPmFTCtmBPJVxTVBFXxJIexm7/wSQciyY9q4Wv
         Ez4fxH8VrUSREIB9hh5UkdSzNzpxtTiIrxhtLAZecXGLiHocut1vw0QwHWmMDUh07R9b
         pwcQ==
X-Gm-Message-State: AFuF++mKIqVCMcwn1nAJwRZeHX/XwHG5ZqIheeG3VpQ/uvWdGO5WFaqt
	Aq2E6LrvgoU6AWqoa6h0krR4BgJKxnPL3XKHRqLmztfd0Wb6s/XZRnmTman+OW3Cb2aGRzK8yQC
	tdsmq4k2FM+bK0XMgm9Yxqkz/zIZ3eA5YtZhx01uBDtt1zB0pBaEOWQLVxe7ujTKPio4=
X-Gm-Gg: AYBFou3VumoohCIPrCVlapxQhWq6Qh/Uxd05BNdQGAjrwyq2gUb0SNELMKoUwCKUOI6
	Krm9bscLrGqN1Tm/c5PU4ppFjcmM3SdD7pINHSpERx0LkD3KdCIjdKZheL6Yhaab++ej4YOCwq4
	uKS9C+72kwZSshoQMhtw38w2AqqW3blxS2YyfxxWG0MqH+ZwOnQcoV/k+/MV74JMui9eWEqO5oY
	eaUx+33evLFvvI6P1NupHTw5EpGrNEXauJKnwY+rGMjm1KqLljQ184WYGqgfWd8cmwXGwrrcOk8
	WxomGcJsX4LvvPFDQgul9VFzoWKoX5SR3oQcFNYdFN+f3et3gbOQEjeQEABzUFI+5hMq/RzwEGK
	hsiC7Ym20uxxB+s19PQWY0f3dyeWPDUPWu+/HcVe9pj0gTCRu2o1orbHDR0oMG9EmWug=
X-Received: by 2002:a05:693c:80cb:b0:33c:43c:f3dd with SMTP id 5a478bee46e88-33e7c426a71mr1660460eec.11.1790142855355;
        Tue, 22 Sep 2026 22:54:15 -0700 (PDT)
X-Received: by 2002:a05:693c:80cb:b0:33c:43c:f3dd with SMTP id 5a478bee46e88-33e7c426a71mr1660444eec.11.1790142854850;
        Tue, 22 Sep 2026 22:54:14 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm3304240eec.12.2026.09.22.22.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:54:14 -0700 (PDT)
Message-ID: <f4b3fb1e-4628-43c5-97da-8af96da4d642@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:24:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] usb: dwc3: core: add post PHY registration hook for
 platform glue
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel@collabora.com, Igor Paunovic <royalnet026@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-3-763bb546824e@collabora.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-3-763bb546824e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfX8CCwoTRznbTu
 Xz4UIprF4El9/z49qeyFbgWRXT8XeEBtRkDulJ9MxHnyAk1YgUTXjjnPY93EC92ADDBf8c7CPDB
 b9GgGbweW5vvsZVOJ+PeAdKTf1m1mvfpkbhyjM2WMPrHzW00qOlrRIiQBDhFbDpCR5CY0hYXSUR
 +VtLaP3Yfw8SGQSfiNVTm6T4tUrilLySvX21K86cmHkEaqAO6/ngW2SPC6PxD8z274gClJFwrAr
 pxyhRi9A6y9C5d7Cevs1BtG3g9Z+W8JG+L/s8inZgzjb/R4St1tyL+fKCcdPUX5hRqIgzGHdmp6
 zgTwuKJtBCuvwg2HVknRkOSwAz2wDOYFvzgK53a9EajXkQ+a+zG5iDT2P3+bdsUL8gj3KZb+SJo
 OWLPSzwWkPxqx3PUdk1McM9JBCi6KsS1UOHZJEqBPL10phyLicsmfUjJFo2l1vRgl9nBKTn2iA0
 QcKSBq0v3p5rrwiYAbw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab36988 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=fFHpL_doKWamrhBxXOoA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: yPXZsc9nVL-3s2y1s8L6YxeShUJpYwtF
X-Proofpoint-GUID: yPXZsc9nVL-3s2y1s8L6YxeShUJpYwtF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMyBTYWx0ZWRfX/+t+b11Hz1hL
 2O+Ve/50jCffKM2GdyPL9vUul/Vr4JeExjtXgZyrqBqLPnsiweQw8dW7cjqOC0idxdfNXW8uM8i
 7yQR94NkkrP7NISbXopporJWm5V7lOU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230023



On 9/15/2026 8:47 PM, Sebastian Reichel wrote:
> Add support for custom PHY handling steps in platform glue code
> by adding a post registration hook. This will be used for handling
> PHY reset notifications on the Rockchip platform.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

> ---
>   drivers/usb/dwc3/core.c | 2 +-
>   drivers/usb/dwc3/core.h | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 4b7132887a03..daf5aec07fbf 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1613,7 +1613,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>   		}
>   	}
>   
> -	return 0;
> +	return dwc3_post_phy_registration(dwc);
>   }
>   
>   static int dwc3_core_init_mode(struct dwc3 *dwc)
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 608daeb7ef10..e9d8df0a298e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -995,10 +995,12 @@ struct dwc3_scratchpad_array {
>    *				need to be passed on to glue layer
>    * @pre_set_role: Notify glue of role switch notifications
>    * @pre_run_stop: Notify run stop enable/disable information to glue
> + * @post_phy_registration: Called directly after PHY got registered
>    */
>   struct dwc3_glue_ops {
>   	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
>   	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
> +	int	(*post_phy_registration)(struct dwc3 *dwc);
>   };
>   
>   /**
> @@ -1655,6 +1657,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
>   		dwc->glue_ops->pre_run_stop(dwc, is_on);
>   }
>   
> +static inline int dwc3_post_phy_registration(struct dwc3 *dwc)
> +{
> +	if (dwc->glue_ops && dwc->glue_ops->post_phy_registration)
> +		return dwc->glue_ops->post_phy_registration(dwc);
> +	return 0;
> +}
> +
>   #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
>   int dwc3_host_init(struct dwc3 *dwc);
>   void dwc3_host_exit(struct dwc3 *dwc);
> 


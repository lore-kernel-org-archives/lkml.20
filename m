Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376453E1CE5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790050363; cv=none; b=V23lniX3catTFz6ps2lZGfyXWxYoIW9aXfFEbGYxEtb/EPzNn5o+EqU04qJBxoKdi0IpjzIfP1yKAWXREV9eY7esHKnzLWEGu4922TgO4vfxC90xGcAUlF+hZoDUMmIaakU0WOfREGc5NLMjxRzBX1pomMGEvWAI3TQykbtqaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790050363; c=relaxed/simple;
	bh=RzHlk1F7njUH3BgeWZu92hSI239VbS2Vo6YeX7lNdpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjnsKHPIZXm4lPj3JztfBDRm5Gw3SqoY0NOjV1gRHC+fMt4WX2xzrfo1NFtocnsh1bDVyAyQtcbCclA3TGUgmx3P6ravDtKNcx+AYJ3AYIjMMwmtGngZLlotSdGF4ydNsZ9vQwqm+rVAQrptTKp98DUYkAW4mJJwnwlr3ewWOOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNZwFpqp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BSj0RVMd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNZwFpqp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BSj0RVMd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00DIu1978713
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXuMM402ka7tQl6eLpbXtaICayqC6t/BPuRsu7V4a7s=; b=PNZwFpqp4hwV5iMM
	hJRHOjFwSF80gz6kbf6051TWuk5p0d0ki/PZMoYvPf1g180Q+Mhv26os0zfuXEY5
	GmMbtkIClmU2bIm8NVmrGtd7s/nkaU8rS7uNDzGBTQlqyp7E20mvdnh9DO2+emXw
	dKUTu7GQV9HazhBed7Y0Vh2bw/Ot6FNchICCC9kbtGpQNgv1gvjKBphG5g+cX0u/
	VTLESnp7UbUaD20hIux8zJVuoLlAouneENqaBbdnxek5ddu3wOjHQMHh0bBVHssQ
	whtJOkr3dNg11oZYW5mRmyZESKjh4kw55872QzLHUHxxk5MrC9x/1HgpXoIl0GGo
	2j4j9A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0gw91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:12:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso4763115a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790050360; x=1790655160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mXuMM402ka7tQl6eLpbXtaICayqC6t/BPuRsu7V4a7s=;
        b=BSj0RVMdD27cHqHLKGXEJm3shdX9Wk1W2gAk2fP1HKfFKe+I34hy55GFkdAwWJfAvx
         9Bwo5BDiiddQIHfycO2GF8W1UwYJSumidZLnIC6A1FVLT/ekx0aY7qgP2e2BkChOn+9f
         nXVEJfr7wXvNa4+oJ2qB3RhO8uxkxJFp7+FrArus6QG7fVJBLlOLWRfp9iVHintbOoue
         lc1ENfhBqmuE24dB/onkmIfnlivtPcPQOy81b4X4UYYlrFIqgArwKcIv+dGMGI3x9Law
         gA7KgkgPpfeKwskugmuQrXpJ7UidrvqB+E827XVq8R0gh2mVJmLoPpuGX3+7bSxyGqcM
         UhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790050360; x=1790655160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXuMM402ka7tQl6eLpbXtaICayqC6t/BPuRsu7V4a7s=;
        b=E7ZrtkBaU7W5UBu6L4A/ikKEmGMnZiIhSdbYbp360uewAyozhiDjz7XhQTEmFyvJ1J
         LdZs8xSgfqUpFFhmb3Rez81rbojh7YSLb/FJ5YoMPGQUdyIYSYDmpwNyt/GFcXcTNqMQ
         ywoiLDVpgNnkXIQw8Wo242MRZ80T2c5A80Wl+A1D9JE7tP/B7liEB6trMLEgIxqpjw9a
         Yy0cTULu1LFa3i5iWJbI0miOZDhRJZkYeYEKPzlrEBKIQ50lBvhX8OHsBsIxqWqshV1p
         aGNzIlKk4zmyuzZ7y5Y/XJIaqkFlhrkoiJNj6UMQM6icnyJDybaQrLvIHVEyRhPDJhMx
         DphA==
X-Forwarded-Encrypted: i=1; AKwUvByDTjAhkSiB4mjfPcxfQm9oXvHepinzPAf7UJpfwigAFLmJm0i1hpqfCQCdBzayrji7CninVeD+ajEA45Q=@vger.kernel.org
X-Gm-Message-State: AFuF++ks4jrj2+3dLxS6QrBULCpUcWAzskRFGQE840AEKm6R4WOhQuiO
	vKwTKYyLpd87+2T68jHSfGE/ewkxRoh9TOo1J3C+Fb9r1AO/KjF4VbRqdfk4Xv5W24YrOCIMsqC
	nDtzLgsdHJ7VpS9uwRdZI6mzTgH9PYnbKFrxCHIM7pM0197PpEcydATXFFuzd/dQZWNE=
X-Gm-Gg: AYBFou05/+pIcdO65hzLvw3RTsFs0d4EW3hlufE5eaTKRo6MbPyB1LDw2ohszJUbJLU
	TfBs07DnhwRAMGw6hFLt8H5ZjNcjoTURrkpyVclwbBoQETsW4w3rkCUJv9Ern7zOAR+s9eZktUN
	+Iy5GwENNx6TEiVmBykaillIu4e0gdsfIhlu1jbyoyLTybFsi61f8LUTtYwI6UB4fqCHM9wTk8G
	fxpKquXZ600+Q278AvVzuCOeA+bExcUraJ393mwXlc0Dw2hS6qTx3MIWxBGa7wuZ294ZEHcOluO
	DyeIJL9Z686ipUErXuTZGgudWB9gkJYp5qGpMzOa6ymE/kP3BOsWOYyUJ5hXFedfNB1l/0LdzQc
	xA39Mdfzeu8F/2pQoh59tre7FprIxsRXU
X-Received: by 2002:a17:90a:c49:b0:39e:6c6a:4b79 with SMTP id 98e67ed59e1d1-39e6c6a54ecmr8967699a91.67.1790050360407;
        Mon, 21 Sep 2026 21:12:40 -0700 (PDT)
X-Received: by 2002:a17:90a:c49:b0:39e:6c6a:4b79 with SMTP id 98e67ed59e1d1-39e6c6a54ecmr8967674a91.67.1790050359872;
        Mon, 21 Sep 2026 21:12:39 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a504a2sm1176446c88.14.2026.09.21.21.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 21:12:39 -0700 (PDT)
Message-ID: <bf94f351-777d-4dc0-98a2-7af77f832f2b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:42:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add autosuspend_delay
 customized support
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org,
        jeff.hugo@oss.qualcomm.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919095506.9570-1-slark_xiao@163.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260919095506.9570-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JqTvuBNfzsjIXKrg0JFfYJxQ-0F70zTj
X-Proofpoint-GUID: JqTvuBNfzsjIXKrg0JFfYJxQ-0F70zTj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1NyBTYWx0ZWRfX9g5mZDLJSYO3
 0P7q5gabWWvbeTxX2WREgu/Vm9G8V61wnWovm32s3ec7J370727myx+niw09ErLlsNKQh+WuKIO
 +HyvZm948C9HFi8maYZde6vhCoYrs+kO0JjQ+nWtYdmsCZHBCvgvwkp1WmJ3TS1p4wfrRRm6nM3
 4C5V/CljzlyVhKRzu7srr6YHaV52EQTIAREtWRkKVfjLJQfGplIzbVa7Bqmcd5NXWsKIYTTLZu7
 8DK0uxiMc3f918plt05YeXlOyujSCUz0WlY7Ry/67MCuokOjVUsESixpxE8KuyqaGlzUZNYtozk
 jXLL1qvpJ2snuqVO/aHcJo4un1/zo/u+07C4HdEIbe70YP/y3NAS0ED+SS+xp1Xl0DM4Xv69NvP
 i/k5It5jClCXSD4PYzGO9bPhvMXenK/yeoBYpttxIk9Nn33vnk/CyuU0ukXHMgeaLQoL1kqnGyc
 H57W2FbjwZC6oq9TJcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1NyBTYWx0ZWRfX4wYEqyMe8+KB
 1FSo3C3khKO+1KCkcZi1ngz/rux+y1pbEa64vQpHbnUwSXPZUNVg98bUREXIk/xb9dnM/cnvHqJ
 xbiy8xm4ZazH334qQBzZVMBKF91o62g=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab20039 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Byx-y9mGAAAA:8 a=ErJ0Kj0kYxbwwNmegfYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220057



On 9/19/2026 3:25 PM, Slark Xiao wrote:
> For some WWAN device, it may get a SYS ERROR issue when resuming
> from suspend state frequently. Refer to the Qualcomm Windows
> driver, the default value of autosuspend_delay_ms is set as 5000
> ms. But in Linux side, all WWAN device were set as 2000ms. We
> tried to set this value to 5000ms and we can get a positive test
> result.
>
> So we add a support to allow vendor to set a difference value for
> specific WWAN device.
you can change auto suspend delay from sysfs, please use that way instead of
doing in the driver.

- Krishna Chaitanya.
> BTW, based on the principle of structure alignment, I moved the
> location of 'trigger_edl'.
>
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index b636e2c23b4d..3339b9b2d16d 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -23,6 +23,8 @@
>  
>  #define HEALTH_CHECK_PERIOD (HZ * 2)
>  
> +#define AUTOSUSPEND_DELAY_MS 2000
> +
>  /* PCI VID definitions */
>  #define PCI_VENDOR_ID_THALES	0x1269
>  #define PCI_VENDOR_ID_QUECTEL	0x1eac
> @@ -38,11 +40,12 @@
>   * @name: name of the PCI module
>   * @fw: firmware path (if any)
>   * @edl: emergency download mode firmware path (if any)
> - * @edl_trigger: capable of triggering EDL mode in the device (if supported)
>   * @bar_num: PCI base address register to use for MHI MMIO register space
>   * @dma_data_width: DMA transfer word size (32 or 64 bits)
>   * @vf_dma_data_width: DMA transfer word size for VF's (optional)
>   * @mru_default: default MRU size for MBIM network packets
> + * @autosuspend_delay: customized autosuspend_delay_ms value for specific mhi device
> + * @edl_trigger: capable of triggering EDL mode in the device (if supported)
>   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>   *		   of inband wake support (such as sdx24)
>   * @no_m3: M3 not supported
> @@ -54,11 +57,12 @@ struct mhi_pci_dev_info {
>  	const char *name;
>  	const char *fw;
>  	const char *edl;
> -	bool edl_trigger;
>  	unsigned int bar_num;
>  	unsigned int dma_data_width;
>  	unsigned int vf_dma_data_width;
>  	unsigned int mru_default;
> +	unsigned int autosuspend_delay;
> +	bool edl_trigger;
>  	bool sideband_wake;
>  	bool no_m3;
>  	bool reset_on_remove;
> @@ -1369,6 +1373,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct mhi_pci_device *mhi_pdev;
>  	struct mhi_controller *mhi_cntrl;
>  	unsigned int dma_data_width;
> +	unsigned int autosuspend_delay;
>  	int err;
>  
>  	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
> @@ -1394,6 +1399,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	dma_data_width = (pdev->is_virtfn && info->vf_dma_data_width) ?
>  			  info->vf_dma_data_width : info->dma_data_width;
>  
> +	autosuspend_delay = info->autosuspend_delay ? info->autosuspend_delay :
> +			  AUTOSUSPEND_DELAY_MS;
> +
>  	mhi_cntrl->cntrl_dev = &pdev->dev;
>  	mhi_cntrl->iova_start = 0;
>  	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(dma_data_width);
> @@ -1463,7 +1471,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
>  	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> -		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +		pm_runtime_set_autosuspend_delay(&pdev->dev, autosuspend_delay);
>  		pm_runtime_use_autosuspend(&pdev->dev);
>  		pm_runtime_mark_last_busy(&pdev->dev);
>  		pm_runtime_put_noidle(&pdev->dev);


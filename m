Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A538D402
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476632; cv=none; b=EdIDYHxxv+Lglo93UO5OGMTtiKWZtYK7Cvye5YOdbxr+Oftoc81c0t+QTNOQjI6o//+O7tlZcoVopHWEIHyRztPc2yJRuIu4BE91zMSvjzxguV6fGGMnNrfUpPjaIkFl+hW1Bx2uL8+N8mLV3K3fVneBs27hXoBZSAtZ0ESVqKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476632; c=relaxed/simple;
	bh=q/slvV18pWvYnxQ3ggCZNxeVmOtkuXwVwf21DctUYk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXCd4HRZFxIHtiaqQu6lP7I6yRcL7ikKlLGo3H+FEcXbHlgp3CmzwyaIHDa765G2oXkoYVJx8oN6ectr0AFX9soLYRPIqZgXurGNi98YYXTocyLUIsFH2Fk1d+0iR5uRTFwxrpOrC9nsjZeyNUlfnkGYLsTMw/l3CC1EPw1bVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3ktvv0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvBnmzU4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3ktvv0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvBnmzU4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVDqH3145539
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 16:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKNDWG+xPvadUx2M61Ah5llef0LaBAxJ2rlM1bN6Bmo=; b=S3ktvv0kLw4DCV+Y
	fE8ir90dF6sLDVUqey00+QeZ27bSZmH6dDPLQNULii2EuLg2dYEKMlA7Yan3Ecl4
	eQ1Hxus/SLRvcDKexq0vHAYQO4P4Ga4baTm9rByoBXlGk/EfWGbw+ldxIplvonWj
	u8RWb3bXS/e8+XxL/eh4fRuSpkajFX3az1U+/68K0etObFvFrpd26SShI4M1E55t
	xqJkdX7leTooKSO1PNvJLvDIS3qtXW9s1XdjWCGTjH5p6V7BEzatTTwCKKk53Cil
	WVMKYRWOIEDfqF2xn88gATMTBh9caHyWbRPyHnmBfi8GnzF27owKzv4+Q/sAgSHS
	rZTLEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj0uku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 16:23:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10445100eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791476630; x=1792081430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKNDWG+xPvadUx2M61Ah5llef0LaBAxJ2rlM1bN6Bmo=;
        b=gvBnmzU4xW/mH6waXHEReDOK310lbIwGc0R6OhTjeGd4MHD/8XNDA54Xe2dxGDstew
         W7epyI+d6YEjdcRqa/mjstmXOIkKhOjL+V0hfm9u4CdwmGx8+cJ983LIgVqnH9uPSDFR
         Lf6kuZEOD05bMuIMdNcgw2HDEJuJXkwjn1UdiMM2OoV4LXssf8s4+h6MrJxS0sorRw+d
         OaCqRk70E4xKJoJrsOiD1ILfESH4be6m5M9jxGMW7J92t468HEjbMkkA70i0VGCB/K9v
         ODejtY2mQc7n95/dkFeVlSmWq9zXIUBN57ETaJHskdZeZGLBdxbUjg/gHXOei3zIJHrm
         Z0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791476630; x=1792081430;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKNDWG+xPvadUx2M61Ah5llef0LaBAxJ2rlM1bN6Bmo=;
        b=KoMLCSV6hJBS1TNI1kpLqpioEb8hE8qZ4Wft6Dn5S7h0+6RWW7BUqVuo9eYGdFewDB
         5DIlCdO9R5fIOOtttkAWJMXSwCZGTCbvfZhab4qZ1ww1Jgi5FY9QGVpuw1b9acE+FDYS
         3fG60mS9exFAR6ZnHoXHxj7e98vjvh5ZChmNBiCY03IHj2P2y5yHRg4zW0YQbfcIAoSs
         n4Vy+j28eeWZi1CdvQl6QDgZ1ojes/m3QCg6K37vhClVyiVQaQjjaKFK0Ek582xrEDP0
         qTNFV+3ncRbpk5T0SC9NSq6N0F90TZAn404ohmG31hf7r5ZWIFFsQdg1Ejk5BWJgZBD0
         qMFw==
X-Forwarded-Encrypted: i=1; AKwUvBxzEpPFSMe8CINDrEKzwDjLV39cY/dxyP5ZePuRYK0kj0c39dLlYT8S9Z6O4GvXvMI3hi5T5XLOaEmXLK0=@vger.kernel.org
X-Gm-Message-State: AFuF++kgLjWlKmrffag0uP9AvGMj+BnYuoGcICCzztLBCsztGTYqYQE+
	qFh8WCMO1TCpH5Kp1e6QozT39h78RkeIMootKvdsd16s5VpG0EVYjWVBEhsR8lo0hZnLYdYP132
	68YzTsWvZ+4OUH8TGOCAHh4Iy+zmJRxniwrGrmi0sMGvqvydcauk+otmChjVCj7rw0ZQ=
X-Gm-Gg: AYBFou37hf1pRCVtDqj361/09CDM/lS+gVsBwQnnhy6xXSYWFxljIu7viMghDvN7Mfq
	ZTgAKljKT6TbafCvHtdSq7nF7LtbJ0XUW3kP6RM2zZeAHtSnCIcJcSbyOQJe2R3So4iOPMPHjNg
	8kDfJ+s7iL3Z0l5H2RPnlrTqzQmpHszhjxEINXm2gNN65djSb29jAaPKpElCjPS4A77YlbJ+j+n
	8jgkBs5i5WdFgesRU6IuWNJXDwj2Sn+LMSR6NJD+uWhPSdhbnAaDIB8m5jIbb1wfAQCojEmdQFO
	t/UBuKBDv7iosWcZgz9opGXM7eZwDCSEM1ne5jUph8yBn4ZT8Q291/wb2eZxn97/wWdSHzWgKo2
	it8D9W4xCG6TlIjxLV8WtILDOWu7WuYTv8OOil6qfpwA=
X-Received: by 2002:a05:7300:c00d:10b0:341:c6ca:1df3 with SMTP id 5a478bee46e88-3515dd78d9fmr7858247eec.14.1791476619625;
        Thu, 08 Oct 2026 09:23:39 -0700 (PDT)
X-Received: by 2002:a05:7300:c00d:10b0:341:c6ca:1df3 with SMTP id 5a478bee46e88-3515dd78d9fmr7856538eec.14.1791476593913;
        Thu, 08 Oct 2026 09:23:13 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm18325678eec.3.2026.10.08.09.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 09:23:13 -0700 (PDT)
Message-ID: <cf9dbfc5-5787-4a69-ad04-153afdec1cb4@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 21:53:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Make RXDMA buffer ring size
 configurable per memory profile
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
 <20261007-mpp_ws-v1-1-739b1fb87d24@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007-mpp_ws-v1-1-739b1fb87d24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2NSBTYWx0ZWRfXyaQZwWir08zc
 tlIVCWAmfXRS3JwDtAkoQ3P5iTjgN4Wn6SD9tswL0NI4r5Shs0LV8Ruzp0esUGxRPIOV6RWU3PW
 BEDOl3jMy25haTDKyTnnTbncXcmBrkh6LtqnS0Wy5cStyYtwzO/MqmgIJF0b1wZxioajllGNscs
 4vW2mYcwyFqoISCr4X4S51nXltvyVMYTCWCcyrWqOe763NpnVMupUI0Vk7mHxSVXuWgfkm1ty7M
 H9AzF6pUTssH80CY2BCIu3r3EagPA/6w34ODZhQAR/w6qeRTB24P+HO/NAqOzC82Nn3ZPrpoPNC
 TZ+nSBBF6aCZGMkpeVc8J+ya++4NmPw5a7E0S+pWcZ7mFfMoNhST14xTxZh0JHc7SpcV6RNF166
 +VaGAf+FjNiItr8HKjRGmkHgH6P2sYpBP6fMOTKVatleialI8uulggsa03B5aJfa2zgdSwQv92J
 J9B6Mp9IQRcxT46uqvA==
X-Proofpoint-GUID: -5hOjdw1Neu-A0cgWeX162EZUBbKQYCR
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac7c396 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tr3Ra7ay5OclNWw_GIwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: -5hOjdw1Neu-A0cgWeX162EZUBbKQYCR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2NSBTYWx0ZWRfX41bTE6CgGnbP
 Sh6YKWzIw5/3arQv8T7hJg0QVrV28GEyDpsoqHVkYo+MN/OrLPTjSylNXAO1sWoexnmyEbJeGbv
 O5J9c6Wzsdrf6mXCoQFqYh5gnE/2MLM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080065

On 10/7/2026 2:53 PM, Aaradhana Sahu wrote:
> Currently, the RXDMA buffer ring size is hardcoded to 4096 and shared
> across all memory profiles. This prevents individual profiles from tuning
> the ring size based on their memory and performance requirements.
> 
> Add the RXDMA buffer ring size to the memory profile configuration and
> implement ath12k_dp_rxdma_buf_ring_size() static inline function to
> access the configured value. This allows different memory profiles to
> select an appropriate ring size based on available system resources.
> 
> The function follows the pattern established in the previous patch for

Previous patch? Did you forget to add a reference?

Or maybe we can just say:
"The function follows the existing pattern of DP ring size helpers, 
taking struct ..."

TBH, I'd prefer to drop this paragraph entirely since it's already 
apparent from the code.


> other DP profile parameters, taking struct ath12k_dp_profile_params
> pointer as argument.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.c  | 2 ++
>   drivers/net/wireless/ath/ath12k/dp.h    | 8 +++++++-
>   drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>   3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index e527b59ecba5..764e646d0090 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -54,6 +54,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   			.num_pool_tx_desc = 32768,
>   			.rx_desc_count = 12288,
>   			.rx_release_ring_size = 16384,
> +			.rxdma_buf_ring_size = 4096,
>   		},
>   	},
>   [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {
> @@ -68,6 +69,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   			.num_pool_tx_desc = 16384,
>   			.rx_desc_count = 6144,
>   			.rx_release_ring_size = 8192,
> +			.rxdma_buf_ring_size = 4096,
>   		},
>   	},
>   };
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index c53eac20b989..108e27dd5797 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -31,6 +31,7 @@ struct ath12k_dp_profile_params {
>   	u32 num_pool_tx_desc;
>   	u32 rx_desc_count;
>   	u32 rx_release_ring_size;
> +	u32 rxdma_buf_ring_size;
>   };
>   
>   #define DP_MON_PURGE_TIMEOUT_MS     100
> @@ -210,7 +211,6 @@ struct ath12k_pdev_dp {
>   #define DP_REO_EXCEPTION_RING_SIZE	128
>   #define DP_REO_CMD_RING_SIZE		256
>   #define DP_REO_STATUS_RING_SIZE		2048
> -#define DP_RXDMA_BUF_RING_SIZE		4096
>   #define DP_RX_MAC_BUF_RING_SIZE		4096
>   #define DP_RXDMA_REFILL_RING_SIZE	2048
>   #define DP_RXDMA_ERR_DST_RING_SIZE	1024
> @@ -730,6 +730,12 @@ ath12k_dp_rx_release_ring_size(const struct ath12k_dp_profile_params *p)
>   	return p->rx_release_ring_size;
>   }
>   
> +static inline u32
> +ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
> +{
> +	return p->rxdma_buf_ring_size;
> +}
> +
>   void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
>   void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
>   int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index cfaf26ae2720..36be543b7c50 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1699,7 +1699,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
>   	ret = ath12k_dp_srng_setup(ab,
>   				   &dp->rx_refill_buf_ring.refill_buf_ring,
>   				   HAL_RXDMA_BUF, 0, 0,
> -				   DP_RXDMA_BUF_RING_SIZE);
> +				   ath12k_dp_rxdma_buf_ring_size(dp_params));
>   	if (ret) {
>   		ath12k_warn(ab, "failed to setup rx_refill_buf_ring\n");
>   		return ret;
> 


-- 
Ramesh

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C5D3DB330
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700376; cv=none; b=Qb/FxlQOYnQf4KDKKl0IUDUkcwzJUfyMRg7XuoAifeFuwlX7aBX2Qemh8JxF+jqAsIlKOmGu/1fGFynrUpDhyRGxmdm6VU9Emm9cx9lKN9InyCwxjdAeaoIdxyS208dK8cJnubGRs+JTNryuUay0jVOyKU7X9N/SbywegFtX1U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700376; c=relaxed/simple;
	bh=LiAihPoxkqZdV81WngRsOiNeAPyzqkFVESOlCfUvRLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Th+GC1GMqx6tu/VLzqGf4mx75yoQETxl5xY4xfNTQF/2oQCC+l6uMYgE+ZcOpL2+EUSFnLEhhPPkm2YfmncwzQtBhhr99/kReysRUi2wCmWHsbSYfwsvfh3Ilx5ZhHxoyt0lcNymRknyR3y3P0cc8hjuXLYSX1UfLSObZu8cU74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEBN0i2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bl2pSz6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEBN0i2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bl2pSz6y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqsEI613936
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=; b=dEBN0i2tek0zDky6
	2xI8SRkTy6muUz4dBIrz5fe7jg4NsDeBcPu1fmFwmFPism/3Mve1tUgchm9vVWiy
	rbGvcFEEKFcZj7H+hBGqfrNwUVs0WLk17xz4pfc/afWR25wAD6QjogN1PTTGx4zw
	qeD7XSMnBp328oah9kwACp33yA6E075kQbHQPfJlHPBLA5JD9V2yTLZ/+QlDGCCv
	g1GygBe2FclhSsPSm7KcP6DP/Yy584l0vcAVGOXzvdreTAF7Eado4xpA9w+2QJXH
	/m8beGrThSCMXvlWsajxYKXc2ig1azBaBspMBFo7EgC+CbiLC61r5+ZhMM1aQtjs
	yc1JSw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew3n5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:46:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4155643a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790700372; x=1791305172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=;
        b=Bl2pSz6ya2GNjjjeXJTauTZP1ZdPbAZSLWkEX08hFUEg/y2o/TuIQUuz1yl2sfabJo
         ZagApknKBgb5oT05FOIagGA8+8oCJGOq571RwryE4ft5wV80aJlZBv8Aiz84U+BoPklb
         uLPv2FWE9QImk7BU5DwCDcxwjxpscRHzUbgh/tx9mwsrJulykuxhCTjdQtmoa9wgfzze
         ZlzxHQJHRZudYC24Y8pg2ySXSiyGUI23bpEjko7KIvGf3OEtSSvxPGIEyeXT1i8HrkuI
         rWObMcJF0p4TRb4ui2lCP1+vaMCFO4nXc92Is1vcGDokeBQmaMPRWGR2tEyL7oYavOoj
         xSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700372; x=1791305172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=;
        b=tq+nkhEeez3LYidyIakP/IWx9ABKHMWb06gsUfkFTsMPkRfUWIvywNo3KWDE2GlufG
         y+dL3hszLWaECaGUL3zvWiJ/0P8xjfr0EPOWtRfRfy9ljmHo1KfLK3tATha/rwveLjOl
         lB6iQy9FML5/5gduN/h8lFJ5uppPsLNpxqnFlcH4K9eMkEbJ1X4uTrOlw26Na0atqsf1
         9ZxkhaXLDz19zPe0wZsfr7mUeiRFBziLmDghUdHZ4Iw9f8XjpdLlQ9K248RXyh4h+//K
         jsTo/9w0dUl+YLy7v3I2cwTT0p6gi6LuvhYzh7muzA11UAXJYXS2mcOezJvpPkgD4nBF
         m2gQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9fXx1inXaFefK56stOPdYHBN5qlNSdHbsvdvXzBhHfxHOYlzpRHXhIgQUwTJs0aGxJHAabn8AhjTtGFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPIFBiwIfsLg7mh92tYQAD7bKJwWG4DapjKY7vF64Rq1cba3vl
	Avy22xIAaYGoi2ezK8O36O0Jl3R0i0pz8FWLeDFxR+7g+1I4bfCE9FwP/UI91XdE7xvkWnuQbpX
	q7tWB2Ju1MSgp2wmcLsUCphijVrtKnx4w1ltMSSYVDqQxsBLMm/9Jnta2+DBytoxFmOM=
X-Gm-Gg: AYBFou03HOqCVxCX/wFxs/MHt8689LENRBQw+Wpn8GYo9Z2kzPi9oRJt09PQxXju2KC
	Y5fBLC0umKirf2hlMQtCbtcGDRh8VwzvktvG9D+0SPKt5+Ca1sqJ1MXNKv0fcGuPYXznnmWvMmb
	cBxwo5YQRavDHGzg649Rs9RegA36NJvEBTgKwZynJb89lwknlifQcpNHLbPpK4rB+rAd4y+q6X9
	qEnz/YRw1QI8c/LhJa8OdhDkR6hldNWj8B+p6MW8C6ysjORr1+JELbT8fv+z2u/pzRiNXwXVnql
	hycUVMeUMAyqCkVupi2crv5rsztULWEj8HoQae8BTns+E9dj4HNsDkuRYmHmQmsxogqb13EbDhO
	h03FXzhi6OGTO8NuN
X-Received: by 2002:a17:90b:384d:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a0986eb55amr14369929a91.2.1790700372103;
        Tue, 29 Sep 2026 09:46:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a0986eb55amr14369900a91.2.1790700371572;
        Tue, 29 Sep 2026 09:46:11 -0700 (PDT)
Received: from [10.216.29.115] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858bf27sm6367683a91.4.2026.09.29.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:46:10 -0700 (PDT)
Message-ID: <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 22:15:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
Content-Language: en-US
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX+BSL7/zMFKrp
 EfZzIiiLSYFgPobQgFTocJ7YwTg3IoyOBSbIQDQtMQodaEyXNfk6YjItqBiAmEuo9qa+z1gbjMC
 cjhqBvwSuCjFE8VItA6uxxCn0WQ8xgg=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbeb55 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4CdhTua64AM6UaT4niYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfXy8yd8uHnsGYL
 si0SV07+AJZX/a5UN66D81xkVttBX/0DHRStBMx0YrNQmA/R3fCJrM2oDe4KcR09cONPmeXpQK4
 OY//qdw6TOhblSD99BIrqWmjX7t9SZflw7bXx0pMXLP1Wg80hbAKxHPk0fXxo8n0/lsVO+Z78xJ
 RkCmOo9ShtNKq6NS2FYxMk3RF7NVg2zioGIZeYGQ7JVw2hSLyqZYaz/hdgIk989AfDqe8i8txO6
 3PiwDF1g6PWjr16L3hCy9enYhMJZDkeoEZ8ALwFl+EBndUHrrHtwLH+e20EKXxw5rVY8pPbXODZ
 PiQ9uNJqykObAH/FrOnRdnj8Pj72Z1TnQJg1vy1FcOWGLD575Zuux2GNKvOYUS9yceS+V/lbAuJ
 KynAGUTZHkZGpuBlkp6j97w0IWNiu74cI8z09Z6zIY+kBPuxdLjNbxa6401c5CTsPjBR3CURlEn
 sCAfJBxDuucBjV8XSDQ==
X-Proofpoint-GUID: 6PgkNtpV8H9Ohqjo9HFKx4iaKLCu7wPA
X-Proofpoint-ORIG-GUID: 6PgkNtpV8H9Ohqjo9HFKx4iaKLCu7wPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290066


On 9/22/2026 7:11 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
>
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE,
> whose value is outside of the node id range used by the remote nodes (0 to
> 0xffff).
>
> Finally, call the new API from MHI endpoint driver by passing the MHI
> controller index as the parameter. The MHI controller index is unique for
> each controller, thereby for each MHI endpoint device.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   MAINTAINERS        |  1 +
>   include/net/qrtr.h | 21 +++++++++++++++++++++
>   net/qrtr/mhi.c     |  4 +++-
>   3 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df8ab9b82402..9c8bb086be28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22511,6 +22511,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
>   M:	Manivannan Sadhasivam <mani@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
> +F:	include/net/qrtr.h
>   F:	include/trace/events/qrtr.h
>   F:	include/uapi/linux/qrtr.h
>   F:	net/qrtr/
> diff --git a/include/net/qrtr.h b/include/net/qrtr.h
> new file mode 100644
> index 000000000000..745d51b4a6ba
> --- /dev/null
> +++ b/include/net/qrtr.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _NET_QRTR_H
> +#define _NET_QRTR_H
> +
> +#include <linux/types.h>
> +
> +/* The offset is chosen carefully to not collide with the node ids allocated by
> + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> + */
> +#define QRTR_NODE_HOST_BASE 0x10000u

Can it be exposed with include/uapi/linux/qrtr.h also. There are user space clients like modem manager
which need to calculate modified node id to distinguish same service from multi modem over mhi.
This is same as wlan use case.

- Deepak

> +
> +/* Compute host node id from a per-device index. The index must be unique
> + * among the host assigned endpoints and smaller than QRTR_NODE_HOST_BASE.
> + */
> +static inline unsigned int qrtr_host_node_id(unsigned int index)
> +{
> +	return QRTR_NODE_HOST_BASE + index;
> +}
> +
> +#endif /* _NET_QRTR_H */
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 3990da1a65dc..c920ab61f848 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -6,6 +6,7 @@
>   #include <linux/mhi.h>
>   #include <linux/module.h>
>   #include <linux/skbuff.h>
> +#include <net/qrtr.h>
>   #include <net/sock.h>
>   
>   #include "qrtr.h"
> @@ -127,7 +128,8 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>   	if (rc)
>   		return rc;
>   
> -	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +	rc = qrtr_endpoint_register(&qdev->ep,
> +				    qrtr_host_node_id(mhi_dev->mhi_cntrl->index));
>   	if (rc)
>   		goto err_unprepare;
>   
>

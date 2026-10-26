Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050494;
	b=ny+OE3No4lkWudBd58ecSmyL3ScThretOII4OCCFlphczSDGXunfmFhLlDW4oM0LyXA8
	 vHiUEiIP9Q5Q6j6btTLLPyR2AvNgx6HWIbdjaZpjNP6OkfLPJ3keZ/TiwCJAPJSbXYJTK
	 AMt6LLTaLBRcm3NxBC7UHrV2T6TA6CDAFDk3EXLL3tXweyxZ6D9rHOr6+6iS86jVgAoiW
	 JAhgBOjfowNkkbb2OS/bmDWb6oLMAqgQT9ncKo0/LoYNOp/LInhI+OHaFKqQ9kaHAPh9U
	 6yo1ej3pCQpjLg+Sa8e8ETcabYvB/tdLZDnHKm6jlPgTDmFCXO49HL2JDxGyn5AUWWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=;
	b=ZVw4gsQy7u637QV/e6UmarEMC0T3JSIvw2zluRREOLAqLM9niKv+J/xbfvAqbY1+ioJx
	 9oNQDIW2LIecp6NLHKWPeO8anL8iWShYZ3N4DBE9GYjqMUwGsKo0eX4QegNIM6fHdC2Yo
	 9m11lXNLOyxmdV9mxNxWOnkydQ8lTzvdNJKWpr2m/GIJdHr5/HTZT3d7p+EoEUK1geUP3
	 YWjR6bpoLWWW/7/908eD5rLotURvGcAP6PC0SreDOJkfntOyK7QH1lnAV33FuQiVdJm+C
	 qk25ApXYdTB0A/Mf1Kl+54IGORa0zpK4Cv562FSrGoMWPKJMUfLyIvU5qKLQs+U6Fow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HoIsvugY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N2kH40/0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4385606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4385606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HoIsvugY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2kH40/0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoU4N986294
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=; b=HoIsvugYpfR2kurM
	7moKV8A6qIoWdgk6vO62Y0XvO2l47gFJR1mF0uNBeuvfXRzORgBKfHL0XK/kqgJv
	g0zMTPxc4P3OOV32SQxh5Hw/E003SKwOWH4tii7T984lqbzRljK3qWEyL2efPXVF
	mLAo1yJWXCtMuQ6phXfb9kgT9wsuVpIH/l4KHx53iuiGH9tIivuVKCCI9WkuA5XZ
	9zmROKtzWhd1nItZuwG92blqd8o991q6HOQ1yu2dVTP71Es9+R1OSPlJTexdoHih
	UmVmpzCColCzIwREDs6C/4bq3eSk4tjNCiYrIaMAtZ2c6bX5Kdhv+AdwfnfET7jz
	ibpUHA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q2fpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:34:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so3123751eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050492; x=1793655292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=;
        b=N2kH40/0lXNgyn0/nx1znHabA0rrQd/JY8AJmXwDNMkxf0d1ZxwxIgCyNGrVH+fhoC
         JwupQL7jEsmMLAtELSfuXFkm1Sd1hTaGip5YeAuewwfBh5dGeytogq8je02dT1C7ro9j
         accDQ0KhnTkvP9eanvBDwtgdjL2zlS8mTv3bjHSSBzqScuS13fb5qNeB5Tbw5iWzGch/
         Si6Xf1QX1qlS3ckn6Nf/c1Sbh/23XzrJlVdfXPu6KA59RXqkAFKUm1LPH9iGWczcHdFs
         bqIwekfKmklbfSNZWYVw1Tj66rjIOU2Jjydh5pe3tob1UpFPy1QsJZ3omm7BuTshS7zV
         LcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050492; x=1793655292;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=;
        b=jp5AoL1R/5roMcX4HLdTE+/J3INyE8/uoodTx/xMJwthiZghhNoC8aeZOi3RtJYZ9j
         f1rYOFP90w/TP27K+iMU0kQKJlTKwNyWVsyJYOwzLcvUoDkHJ4bmQCu4hkPAFKuBmxL4
         b2T73XjYgCPJYHLjjSmcV6UPHraXwT6+nWMRhFUompPOHh4aFkLGRSP1OxG79eErQWaG
         SqrrxXd5NYK0hn1O2KFMoO0IBTf0/2kaXbMEE7/4LN/QigVBGsujbixi6g4XDBrqTtf8
         uoatA3fPd2kln2MA83rjehnBjt+PJxbWBsvkLeFJBYsCrEMYPevciY0qjXlZMb4tFj73
         jztw==
X-Forwarded-Encrypted: i=1; AKwUvBz+xRjcMM9VCUohs+XwVMTGOg3h96nu5EmjBqniIykiwQ0wBEq6nkQGiUf6Wp450SHGsOsvJBH9VF8LITI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv6v1R3Sn9v2ht+7v/1HUK0mxl0b6EP7c39Y6iTsJ6/hkevzwu
	jBofJan4fSzgF8BmYoiYzvhQdASnTBEKNFW65PBDOfbfPGTN+PfeAa06AQt6tG8AkKGBm/O9npX
	67dU5qDC2DicfuY/PNsZRa/Ge94ulmrtLed6RSSpZ2rS6K3pMFhMCBUv6ZK4wXrTOcI0=
X-Gm-Gg: AYBFou1GJlE3NL6b1o5XiBTojoUHHW/CwiSKJWF6U8LbKXqshzp48ynsP+F7PQS13iP
	pfdbn1NUTK3YevdAGkqcAkCEaPYqXHKYe2vdIR0KV1CXfFK2jn0bDSR2ajcn5kAC5qTxpuPgTd2
	uW1jSj7XNV/AwhVLVNSogqYxdWEVZ3pXxwngSBJEUNmThPq6y7B1r7cvN40H+ct3CajxHXteVAA
	v6ETeVY0cIqyIabnoA97/RxxchfAyTuIpAeWWyFfdO6Jga9Y2nKm0CX8zrG8Y1Lu4TbTYQ8/uS8
	9gXmZbNKl5mftrX2Fk8DV2p+GEEhz87jxntyolThGyxmhK9DXmVwD7jf2I5hFVc4bKt7Ffh3QWr
	FsWfXBXtqLBEHEz47KDPSvwq/Rs6n+L3ZO+/BEEF7OiYbox8AoG7UMfK1Ng==
X-Received: by 2002:a05:693c:42d0:b0:35d:4185:5395 with SMTP id 5a478bee46e88-369e845b094mr12574877eec.16.1793050492020;
        Mon, 26 Oct 2026 14:34:52 -0700 (PDT)
X-Received: by 2002:a05:693c:42d0:b0:35d:4185:5395 with SMTP id 5a478bee46e88-369e845b094mr12574790eec.16.1793050491179;
        Mon, 26 Oct 2026 14:34:51 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm32084643eec.13.2026.10.26.14.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:34:50 -0700 (PDT)
Message-ID: <4e206a12-1796-4179-a72d-cf33f0864819@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:34:49 -0700
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
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
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
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfX0P0Vn+w1gapF
 tCK3V28X4aTv0Wym9lUCfJSqcvHWB2r/U91A03r9fhWuTPggzcWx9n92BY52U9AhUynoo+KJJTF
 scgdrWOLO4MvBO9LIDr8LmGtqhijV2A=
X-Proofpoint-ORIG-GUID: yzlWn5cscuKIifEBNIqLFS68Klc2OWaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfXzdtLU2BU8ODi
 Arn4+gfC1jgK7XbS5yguqMmLxKuQrCNKc0hIasouxVhwPigIc5jTL3KYXlK+p76ZBntbZ/ctpEk
 /5YTBwGlrJDfrarKytuWybwZbmEFEkcyHLnfjdPBPE8Q1cR/3PchCxRpNOC448GAr9gK0IjW+bg
 y/Cp6AiPnG5XNFCb3hvPfnPVF5/JtswnYJtRPbURQDFWvD1jGMtIhyjAb+jNEp9UW/twvyrWMK3
 T6YowPtoXMn0Y6yv5xD3OlE8/wi1ce0KKJDRFSYrcAxL8BQ3PJCxpG0YOW8OJXwNG/y2RKFqxNz
 fqt82euB8mOfs7D/hYD4vqj/AXvUHwTMqYm7zeoW6y4P1QjiOy+g4ANka502ZIh6bVLtCJv9APA
 B5xz2X7zPMwn9ehsUu4MO/5+kdZxjC2OsGJzqluTpJCKc6YCQglu/C/cDqmf3OYsFbC78Wr6Sfh
 4G4THx+ZSh35phvdrVA==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adfc77c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HQsDcwHZmgEkHUxyrjcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: yzlWn5cscuKIifEBNIqLFS68Klc2OWaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260086

On 10/22/2026 10:43 AM, Manivannan Sadhasivam via B4 Relay wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 6441927b5382..9b6108c1abdc 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -10,6 +10,7 @@
>  #include <linux/pci.h>
>  #include <linux/time.h>
>  #include <linux/vmalloc.h>
> +#include <net/qrtr.h>
>  
>  #include "pci.h"
>  #include "core.h"
> @@ -1491,6 +1492,13 @@ static int ath12k_pci_panic_handler(struct ath12k_base *ab)
>  	return NOTIFY_OK;
>  }
>  
> +static unsigned int ath12k_pci_get_qrtr_node_id(struct ath12k_base *ab)
> +{
> +	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
> +
> +	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
> +}
> +

note this hunk has a trivial conflict with current ath12k that landed during
the merge window since the ath12k_pci_panic_handler() that is part of the
context has been removed

>  static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
>  	.start = ath12k_pci_start,
>  	.stop = ath12k_pci_stop,
...
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 280e50a1f31d..507062068f8e 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -9,6 +9,7 @@
>  #include "qmi.h"
>  #include "core.h"
>  #include "debug.h"
> +#include "hif.h"
>  #include <linux/of.h>
>  #include <linux/firmware.h>
>  #include <linux/of_address.h>
> @@ -3940,8 +3941,18 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath12k_qmi *qmi = container_of(qmi_hdl, struct ath12k_qmi, handle);
>  	struct ath12k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	unsigned int node_id;
>  	int ret;
>  
> +	/* Identical devices advertise the same QMI services, so connect only to

note that networking code no longer uses this block comment style, so it is
preferred to have /* on a line by itself

> +	 * the QMI server on this device's node. A node id of 0 means the
> +	 * transport has not assigned a unique node id, so accept the server
> +	 * unfiltered.
> +	 */
> +	node_id = ath12k_hif_get_qrtr_node_id(ab);
> +	if (node_id && service->node != node_id)
> +		return -EINVAL;
> +
>  	sq->sq_family = AF_QIPCRTR;
>  	sq->sq_node = service->node;
>  	sq->sq_port = service->port;
> 

Since the requested merge strategy is for netdev to take the entire series:
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


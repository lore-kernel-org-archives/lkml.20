Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776556;
	b=e0o741CstIagvTK+5nSS+DZuw86E+KyUa07amObHpbO8+h85mVJJX/6QxQcEhzYZlTdx
	 IMW+o8jyqBqKj4JPbkctDK3saWLV7fkExxQA7vcFAlWjgaxKSYZsSyxGmbSjXjnD/fF4w
	 C93miR/CYe6bVZSdYBmNxbU5oFiQ3yRntBt0MJSJBPH+kDBuaP5y5cZz4bfHlTj+t1jwS
	 XgVJzSByRJelqLplcMjQxaOwf/aP+86Nc77MDynwnph120PbznXQv2T4JbYnJiemRWFF6
	 gRy23Jyna3zfHcY5HxI/7+58a7zDTANY47qntfRrWph4WrIQdoHhi8sE9IN9wBFlJeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O+iTB2sWcEPdjLUfuDanELNYMg3s5WE5cPIFIy2cSUE=;
	b=GWXBrz0H59vyF3IRVuSmZBCWF3JStR30AYNVVHNZsnN8h/Jj/KsBqk6BUfLDmCTZYPq0
	 gDz8VmZ0yszUAmVVNzd4ittCY2s6WdcXxGcGSyy5v4SVzPzwT3ck6gyzd12V9/VTYBY2c
	 8GE6vw+PB6gQcMwJ+UYpoh6MQGCiWuGXmeukNiOo/nIVsxjFIs2dC9NaeGcvuiNoxvVfh
	 QavIXNjcS/v4x53O6f/22rX6sXvZOnoxS9OQpu4rupj8DLeBUzV+rl2Xo32na+BPeopEW
	 yPEm0dd2PD7zgcx9dTsXv3SGIIF3I57tTCOkNp3BRgiGZOIWX3KO8dwE7cI8FSOi/nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=guQVGrwx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ftSZ8sha;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09648606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09648606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=guQVGrwx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ftSZ8sha
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47CmaA3459466
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 07:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+iTB2sWcEPdjLUfuDanELNYMg3s5WE5cPIFIy2cSUE=; b=guQVGrwxqr3g3k9q
	HPN8kLpq1G+oRg5fOfkBHVmzFiXk6V5dtaWw83j274PtCzRs8ZOK4oN80lHN9NWf
	6dEsKVX0OWLm7bfntOJ2I3exFjhbH9jnVsBJhiRJUfrI5/tdOlPzpVVfUJN0IU92
	z/9f2/9uSd6XWUSfa4kszrGOAq6zpwqUIBFAMd8wLfc3nj+MtuOt+PwkggqfPKef
	M/3VaauG/WroWIOBagsApvmCLSRlE7o0AC+OMiiKvEwfGE1+FLUPm271Ln05sp0U
	25y+TXYNlyt2xIDDFCry9C921LHok5TIEIPuC5Jik2f3HuHXOYnh1jciTHgRUcWa
	ocDu8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2buua0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:15:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b09a466295so312086a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793776555; x=1794381355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+iTB2sWcEPdjLUfuDanELNYMg3s5WE5cPIFIy2cSUE=;
        b=ftSZ8sha5HR5FJCz4/LW/7WBHppiMS+IUkWeIqmyj9VQ4vOzTure2smzGggSQEkHKn
         rDfQ/mDkYMuCJ17wqdLIoNljlp574XGbQzuRUEV4KV22WsPgc861tcDoLNt3eGjdrcpQ
         R+zBFC0diYVhVrEDu0HjOW21D8uoS/Ittay9epl9FX2SBLVMUG/b/I25+rZH82vvnAsb
         BW6+XUKK3q/ZAlwpQinRz8mKFl2UCJjMVj0xq1KFZLNP7N16vUZRim1wm5arcaVeNXQh
         Ix6R6+W0LlDc66RnB5A67Xsvaw94U1t8K6KoQalu9CI5N/T43q0iPxvIPZjoknOABUK0
         xKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776555; x=1794381355;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+iTB2sWcEPdjLUfuDanELNYMg3s5WE5cPIFIy2cSUE=;
        b=csY37iSefP7+vXuHRbBq4lpIqDsZbgytSw3+Ift8+rc/KPNGu5SL8+tzhOX2fATiyk
         2cs6KIwlgCixS8u/zWMRSON04M/pdzIVa4VTgs78OdkUcC8Dhg83qjHOXG8yxOve7OVR
         IFaTpUNFIUoH4hrxz341Hij19sBoIYUMFtemGfJjh18cACT76Wdgh+5gVc27vOupAm7M
         9u0URu7e3rroGr3mzADjQn1TLwtP7pdUvEio9DMwmoP9b6BtQ8OMCdvnx7/jrf/t3E5t
         P5CiizIElJnZmwCz6QIXMOoP+blnBFuW3t6Ptla1ZLUyZ4FpTtti0yTdL/IQvX/6Lcuv
         Z0nA==
X-Forwarded-Encrypted: i=1; AKwUvBx28O5qbDlyn7fTPMs116DBTly/+DB0fsnFzIlWenJdALtmyfMwcq9tIuUJkquuhTlbSc3Xq/Qg7KCLy44=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EslW45s6WpfJYvb/P5v/yCXZeZju8Q7yDMkvFRXzujTjqhVaM
	NKkespJ8glgccRXOwKmRJ2h/ulZthWhvc7aeBc7HHDUOuOKOOuP0ba49Njgj4fTZrl2rJ5z4Cqv
	UmD2jKlglhfnKvWnF1PsuCdVJjh9L3wECTX9K+DsRJ5z5UBQr1lLFawwJ9li4lb3Fpug=
X-Gm-Gg: AYBFou2RdRMzdUxQcwKWJ7fOsx6K9Bfq7KTDm8vq2Ou9SLPAdksWtDhBboLthLHaMzi
	80NU4b3aIAn1ilXJkbPE92oleUTSPG+IXzHKoseAJOUYpaVonS/rcHzcupuziWemgnczjTMKmbj
	xI0kE7uE7NAKzTsfoHbu5SnPtsSIw/VY6+etE4wclQRXcoY+uox0vhv64vKRHFSgz+phKaPSyuj
	FwjbNaw0w1qoGEmweL4cK6ogcjovi3N1UpuH3ryVsK8yeixRC1NynCpWdF4y+fJfzTqWXZ7WWhz
	rQrRw/V8g6k/XyUGVLPW+qV1Bj3/L+EFU2OSh8GSUM9CMNS6Gj+l+dYZZj1WGUaEq3dG+68rswM
	YmDyGMbuE2o8pLAUsdPm6gCVBP5LIFVYa1dliFOuh/SYNARQHXPH6AYsUXufvFb5EyzxqjwqAJ0
	IBR781wEF8yuxdFz63eVs9eZHoX6c7Pk+MS9ODVVvBHoXj
X-Received: by 2002:a17:90b:4a85:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3ae897994c4mr12728513a91.50.1793776554624;
        Tue, 03 Nov 2026 23:15:54 -0800 (PST)
X-Received: by 2002:a17:90b:4a85:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3ae897994c4mr12728493a91.50.1793776554082;
        Tue, 03 Nov 2026 23:15:54 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm7753646a91.9.2026.11.03.23.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:15:53 -0800 (PST)
Message-ID: <3980be1b-b769-4127-9820-1ecc6333c6a4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 15:15:50 +0800
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
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfX8l5xETde9g1r
 1A7stFKwXpY/r7Eu7LNNQkdG/YFdMBow6wplhb8VuZRnhY5JovhRS6Pbb1qwSv1+jflq0krqWa4
 t83EyUBq07NT38aPHk+kOa2vG8I7wv0=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aeadbab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WH3b8gmyxz3kVt_5t98A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: G-hk6IX3WyhzpkW0JPk_MDHVJBt-AX9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfX17WuNdjwIw44
 o6BELhRvmiX1mQRt8MKUVavs0jVvyNEgi54kjYfoTYoF7MmxmGat/AFL4DdI4/xbTWxMwO/qFck
 ceACk/GEKcgJCbqPMqAD2ozmGm+/WhkUf5flW4mwvS5liXq+7psAanvj2EUo8FAGgFvE9S2RMR7
 5jzCILK2R01PaX168QY/+nrdgIv4gyVZcEJHv+w3fvnBI3YSthq4jq8rszyZRc+KhdRlEJAhRrq
 oZM5IkExGtbW3Kmca8sSG3tPoI8R6s0srWTIBnvP30o0jJl1ByJlUTYE/HaQYStUIGWYKfLQA5e
 QtBAs0ap5TRVuZ27GIbIcSInULSBI/PJb7XJ2KcqgfIbW8bbPjBuXq5xFQ7/80R4WXsjDa59N+o
 vF9ZncwH9b9kqLaOAv5iPldf3Lc6CtKQ0HSBw7etxEziAFQKpDzllS/qS+ogo3xpgOtN9aJM4pp
 lnVqiAHkDUbDAiannYA==
X-Proofpoint-GUID: G-hk6IX3WyhzpkW0JPk_MDHVJBt-AX9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040028



On 11/4/2026 2:30 PM, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> Patch 2 refactors the shared free/load logic into
> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
> rewires the m3 and aux_uc wrappers to use them.
> 
> ---
> Changes in v2:
> - Addressed the review comments.
>  
> ---
> Madhavan Ganesan (2):
>       wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
>       wifi: ath12k: refactor m3 and aux_uc firmware memory handling
>  
>  drivers/net/wireless/ath/ath12k/qmi.c | 168 ++++++++++++----------------------
>  drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
>  2 files changed, 60 insertions(+), 114 deletions(-)
> ---
> base-commit: a2da7677eb9a12e7860814b70a1f6f5b0e347d7d
> change-id: 20261103-m3_and_aux_ucode-8337b881155c
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

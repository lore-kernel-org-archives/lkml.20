Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757815;
	b=NEHzA/OM5PP3AYTrUHnyXhnLecdYqznPso6lAi8C8F9oQGEQ6iEuRCXaQD77TIR6xGrv
	 WwBlvSidd396Ka4TaNuHcYiogmBfQYuhQPyjUMgr3fvqGGoY50SiSs0s4t4fXU77TEydS
	 kG/UinhC91U2dvVu3helr5iRmFgc1Zbh0BMzAVBtB8SJycps7RARQZh9vPpbl6jVxmYW3
	 7aZvhSLMhLtCliy8DGjS1KNTrnG170ujUSWKZNSujkYWw+tE3a8OY0Xc6O87E+QctVBBW
	 Foii3L2JlDg3ta0gT2dKdoUy9g7q2DXv59VyVO9ppFbTY6hKtpOVKoIrd4cJltegc5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hwhJsiEzIXGjwpPakaRIHnm9ygQpg1JZVtIO5uyoL+Q=;
	b=ZNwkCFLp7z0ZHOa18dgUeTwD+AInvweDaTnPxBorVn5md58et1lVugGQ5sr7GQwx0Twh
	 HnFaHmZBACwlMn0hnfWhiiRHEgbw5WNBnvgWfGiMFObobSR4HOn3uC88JrYMwmFu/jJVS
	 1AbNfMwCKf+otpNMKAgteJK4/xMOSJsb2cFd2xq2KJ00YB9JsJEasYHyLLRhJs3nvtLNL
	 kBiLxQjMZ/nBIBjDp1rl9KmqCeq2cSsAcpMNRFw7owqs2Zj5R3DwYpXD/Vty6jrnmdRPv
	 pLhiZTPyuWLRgaEYhR1bJnQeJcZ8QzgLs2sH4UlO3KlWlH2ZxZRwICV98gQBNQYEYWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DR2Zp73I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q/m9R1oH";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDA5606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EDA5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DR2Zp73I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q/m9R1oH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RJ5N193647
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 02:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hwhJsiEzIXGjwpPakaRIHnm9ygQpg1JZVtIO5uyoL+Q=; b=DR2Zp73IPUDPFhle
	R/u908IaGmSHqIcsvhe9LP7WfmfVY/6wruAH8KtbYjByIiAHXp4lrBpd5AVsXjXd
	zJohM6E9JwUTjHjU0a9lqo/gSHzrFgVhVQKVUhsnV4r+pIZcq7lE3oYbC/k1vVBL
	RzA7vWRCutLUkK4HxN0M8fDFcB3wRaCW1ZZakQZTUgeoxtDjFW97yQk8LCxRio7Z
	dfD49Q4WrOao/pvF+G9ef4YWBh3Z/JnOjYYkH9qPQkqYlP4mPfydnVStln52f4lO
	Qx3axDFfdp6+I0McXTVGxQx+0V/1UqOdrQfZvrrRoLWXDPAoRToZFz+wvcB1hAYc
	E3qTDg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nhe61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:03:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so398546a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793757813; x=1794362613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwhJsiEzIXGjwpPakaRIHnm9ygQpg1JZVtIO5uyoL+Q=;
        b=Q/m9R1oHlM+o9o47fVxLNRi9F43x5LYO5tcDLSUFzRbpNpil3JK50btgYdLqdtBlzm
         sCdMSBaiBYfYkMN3li0iTP05HMYBPv5eDXReGjCwzRjRnuSKyxfEYOHkhuKeAadjW0iu
         5gluGrvK+gH82J6GDKGnS0D6ytvsAsZK7L9SWO208MkPy319pw2Gvw81QjopY1oIkgot
         ZjXG/5NEpoRivKH63akxPGlTNv8X1R5eYBBycpG6cZly3K5HjYaGW2rXI6lpVFDmx/oD
         arBlMtSGAYUYp7dozzhJSOuemvDM33zppcSj/2LqX9bt487L3ry/R46KSeQMkMgvmfMe
         9RxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793757813; x=1794362613;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwhJsiEzIXGjwpPakaRIHnm9ygQpg1JZVtIO5uyoL+Q=;
        b=zoBgY93ctYiJLqvj7HNCPDPIbRW/JyWwiLaIwD9ok0g2wEAx+aixyji7Uat6weMplY
         pIJ6oJZDgwLzBiNXpMdN9wGhJhQnkCUo7F0J0lXK4ziLoZ2/mHV5ApZeZ0MHQYjmYKaD
         g7aP7XooS3Tl1Ciw98/pNvdEqxtXngk9A0Ny+DE+obKrueTqRt81RLrTh5jxtZrL27xG
         ARixpmo5LJheg5AX6ieHYc6yXTFEp9Rna0yQvOa5P4Mz0Gu+eksNZoYw7Z2XdSFRU8Vv
         G4gioZHCuKWa3rAVD8x9DyN/Sq5ZlP05Lz2FADjMxy2FVqC1kHDmg9zcruOqux1YlkUL
         Ksww==
X-Forwarded-Encrypted: i=1; AKwUvByRqKH6J52PoNpjjCKUvC0DNeOJLoKg0/70MCPgmHEQFkMBk0PymRUv/4upr5UI+AVLlkuBIZZmGlLN7TM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gJ9Ws24rsm6aEztQn3UElyklJZVKHDYRKvU6d6AFyTGsZX/4R
	OpOCrbKUOrQt01Se7xzP6N+pfIHxdwTNmA1ViCja6t6VRbStbm8NdgA43OeEK+o4+BJtcjgYJN3
	MWkXA9FWRC8XrT+ksJEW5nplJbymaC0XFNE9rWT1ZtXosBzOD+9Idvyf7icFQlg8/io/byW8GxN
	o=
X-Gm-Gg: AYBFou21d2ojr1bzl49EvVaUFwu+GkbzqwgdVXDzRhjFZiY5VpjEZMwx4TVQRBW2GuD
	2ibz57Kx/0CWlmymNsp7AgkB+qZZk29M196SUx2iW14XpYHirE9yc9A7xKsFjIR1Pwri/KTHK8F
	ZKq3GrVN2B0RyVEhCwm1hwPvjIHwrJzjVGbnu8pK2aI2ZNB1uY6h5kyqyh+9911J3c90D+Dx82s
	Y2gHsgohzRr7qGFbciDy0FouN5DjyXeCMLcM0o7hY3r9MR4f+TqENH2xrSX820L96r/c+436g57
	rFmlD9101MZrZ91bPsx/22Ck7+jlLS3dWnrUU8RQvsqGz6MT/NlMXMvtI9LoCfv0PnlTfRvPOlp
	j7UAo7jNLMX5lPCPqWWZ37dAYE7yZCAy9FDkuFMntEXwdbDphFkaA9MxetlYuNJE8/ZXx8YbUIt
	wyi8WKRd0xK2Tf/GgOxt3RtTjJoxOJ1YTERQ9R14eiTas=
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12644641a91.51.1793757812420;
        Tue, 03 Nov 2026 18:03:32 -0800 (PST)
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12644616a91.51.1793757811938;
        Tue, 03 Nov 2026 18:03:31 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm6716710a91.4.2026.11.03.18.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:03:31 -0800 (PST)
Message-ID: <df59854a-b10f-4997-86d8-134f62b73799@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:03:28 +0800
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
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNyBTYWx0ZWRfXwtC8Q3pir5nP
 TaFKcVwf2uo4BpOxQjpgvQ9Z88x/MSWOyvHPmOsJp46LLAqDzwnVg+xlzYFPfEtFhLu5/AiK9tz
 X7s7dXfaTnhl98u87o/7B5QoVyK3LTV582PEx9dbBfppqM6nQpfamosiBIttpYyoqWpc4Uyzx3+
 pqodv0othbFPZ5z61Ral04N+4PE07mFP4a2FbfcyJ+s4HsRLZON9YUEh2iUfNejxW50k778Epyp
 b+CycJLdkd3LWRDTrZ6pMmPzG/Ea1qEWROwh+ItblXIYOa6hmWnpylyL1DJ+ThwaI1+plhxtEVj
 SpAJo+ttW4eaR4gfGIAhvnsbfg6/8XEyTgrPtr8PgdWi8WB642aBlw3fmSiJIawDTTTM7RJ1G/1
 jh9C4afUb2qdqOlAQX5ZqzzIasla7ghTGdk/I2LHOPtmi0tIhu9dGYzzfl1rU8UfffnFTbccya6
 XGp401KJyd+9b2lMr0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNyBTYWx0ZWRfXxywjIxZJz2e5
 c0aGvcDbyq69hdb+8vALvxbcW8B3VuWnJNIhWi8vFmxhINzegdBVc5/rzFgaQprenM3LMX2wNIA
 5fOJW8Zer00KBmaDkzs5eutXV8i1piE=
X-Proofpoint-GUID: pTSjMUeYlrToimAwn2b9a8N2pcM9EWp0
X-Proofpoint-ORIG-GUID: pTSjMUeYlrToimAwn2b9a8N2pcM9EWp0
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea9275 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WH3b8gmyxz3kVt_5t98A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040007



On 11/4/2026 1:25 AM, Madhavan Ganesan wrote:
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
> Madhavan Ganesan (2):
>       wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
>       wifi: ath12k: refactor m3 and aux_uc firmware memory handling
>  
>  drivers/net/wireless/ath/ath12k/qmi.c | 163 +++++++++++-----------------------
>  drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
>  2 files changed, 57 insertions(+), 112 deletions(-)
> ---
> base-commit: a2da7677eb9a12e7860814b70a1f6f5b0e347d7d
> change-id: 20261103-m3_and_aux_ucode-8337b881155c
> 
> 

with commit message nit in patch 2/2 fixed:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>




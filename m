Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759187;
	b=GLi+ZATuKnkJphz7wyxA1Ngan8aKwhC6jximHU98IBDabx9bNPOWN9QS87bcU9MWa300
	 i4F9bKhDNsFF+/gvoKh4tTNZOT5AD/sJfRika97SfQy7tMPPDDNQbQFg/4y6CbLwydg2+
	 8DJYIBiQEhZF7YGfhVLmXnkOSBRZBVhZUz/72+FLfF2M9DifuBZH2rBZkgwZkZulv3HaC
	 YLDXlrcsesKIyFVB7duSpDcdPR749WFSy7L9ujpBIbt/auGXvBNqH/un3R8l2MUN1AlRC
	 XcmKJRb4rYisDU8PwqZcUBbqKXn2WNiUmxvAm5+ZoCzZZ0fGlNOJLfuTjyTlOJWv/+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+cU716QQkciKLnAv+AvMyJeOWBaGEIckc4N/C6sF0hc=;
	b=P+oit9GOfKeUnz+WoTF2wSxbW+IKLhbX7fD3INjZdagm0Nqh9zjEhTeXNRFiFP8gF/pU
	 JHlePgMV2FEosbtIqiP3gVtPkiKRwaPzabqJRY/PEyn9PVMmNmp0iPoyhbTSbNnJOPjde
	 Pvb9Db8MKxylj1nmIlinAauPcRSrL8izS6QFGov5KYbEkOnWMbHZGDBQUujJ7loc+WbOh
	 A9yUKMkEbLY/lQ2lDQQ2d8kt9C6OrTfnmJVuOYwi0/G0iElczvnR/QO8Z/NzYnZ/C1SPG
	 0AmnA9lBpVQCzZ18E8M3tjMgKRu4q9AfUyMfEEkibKt0hq7vulRWdtrNPkbBWKwKzMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuOhRHub;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPvsUx5x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CF606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuOhRHub;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPvsUx5x
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RKoh1191425
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 02:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cU716QQkciKLnAv+AvMyJeOWBaGEIckc4N/C6sF0hc=; b=nuOhRHub3riCWUWA
	FzZpU9VxJ8prfCiOttOX3kQWvXl0LsTNEobz+SOTZUeE8ZImUlPiGisOAge3s1RG
	7k9DdYNpDy2+p2lWJ1UHCW7xmxRuvbCoxX6HT6x0tDwoFsW26F6VMUSGHbp6l/AH
	kph9onWSQcUv4oE1nAuCihc0mpIIr2QDCL6HCoWK+OUl4QPMdFgd3pFUFjHSUTIN
	wqAxyOSpB+MEKNWlFS7mlQJUK1xAQNiS+2CWtEkeQiSmtTV9cM+cxCiHuPcWpLp7
	vbro/I983LhEELLVNSyJUaGSgYNta3f+RaaLEIYQlqLC/2GzV8cx791nKJk6r1pL
	x7jn0A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2phu9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:26:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1ac19c6bc71so222811c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793759185; x=1794363985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cU716QQkciKLnAv+AvMyJeOWBaGEIckc4N/C6sF0hc=;
        b=KPvsUx5xi0WcHmra8qYvwSkc74bt1sRfMKk4sVUxUUA1bHYAy0HdcoutBmn/aZRerP
         r+injbJJOun8wBdahbon8KOMR3PufxF18QzmWMSxOVbqHZjMdGdU4vqyx7CzMSinKMcC
         M3Kv/t7skN5wE7cWJL1r6dfCtGA+7sTdzG7AIpAqvV1obtDJ+jJtSwvZlvpW1yJKg7mv
         SN06AvxkhiCcLOkuZR55eM6MHNXZz582ejql4IzKxZVmq+ddP+d3F7/GZZwcXQz54R2F
         vy3cjHtyl9Y7tgv1hNCtx/RxIs5lYKB6OVdhmr454LxCIW0XGyW9c8cLT/QJmZiuIkaB
         OIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759185; x=1794363985;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cU716QQkciKLnAv+AvMyJeOWBaGEIckc4N/C6sF0hc=;
        b=GFH/QBaaeySIFiPFKX6O4epaNiRIYmIKB2fDXQ+B5DLcig6SBb9sJDUMyokpIi1nTc
         jtDcR0AXlDXy4V0dSiUYVhR/dtIj75+on6r0VNZuwYkzVFEtVcwpQRDG0t92vkNww6w7
         ork3ZrVDnM/TQwPEx0hIk/mT+FTmMqq2CgT7tkhukl/hg8xogUoGAYWES6y+CPnRtwMB
         rWNkzdmEFgehedMvcb+l8DNNaPe0MU0fXdR0I22UZqaDIE8uB1tf/Ur1UITRx+pQ4Tio
         0+ry0vPim9jMmtFOjqROyT6MEsx8xX5l6oFpcXwoETaQih33TP5K9KpgX6OA/H9iHA5S
         czCw==
X-Forwarded-Encrypted: i=1; AKwUvBwV7fJaxdp4rsuDEa+i7leHuvfWIjmvM9d/QvBm020EAhOdOMmWGuy7uIsm7z4AsAxaSRWFIeqcqmTO2jQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7asc49aG4tK3nN0oWzGCT0aKyxSWNRff+8/hQQk//xQ55/nQv
	2cv7K45IROBIAznupiBbs0iw29b7LpL3rEAWLmE07kqlIe53ZTpMFfBMK9wwbH/2boFG6BiNgae
	w6mFQPenhIkUX29zOkjWPJ6d+i72DgFwfPhi4U4paq6evFIvo/zSF9xIyQuQgLKzoZJI=
X-Gm-Gg: AYBFou2DmU5BcRWLtYdQKQZazT/pELsjNryZzAs5il0Y8lHEJF+WWpuPa1o3NaHRTqV
	8+gQJor38fYj2QFPjOzxY3qh+GLBOShwpREiVLB1SzX+iHfl9OhZkcxLAJvSOYEamcDad6KxCo/
	S3uq/Csvo3SUD/LgOo0UO3wTvO7DecsuRPt0QgqmMG6Fnt1dDL6kHLWzT0JKwzwp/8p8rIQt0wC
	CKPsvs8xYZOss+/S29rKWh6Eh0j8RiiLQ/gN/xvZCTL+K1ID16rHGehe0pAD09GBDH5JXALdswR
	Mhl+/IH9l/ZfXwgP44DJnMJ6E6pST7xi9EYRaV/Nd2twTKZv2onfSNlBLwTfXJTwhPOCJ//8XnQ
	xncXEXPwjQjA1m4FJOx/jVRhocFT3sLU+/WZ4lKcM+vA1gLoh42cYYxjYrbbT7mX5k7YUqSn0PX
	6qjp6qp4doiO4kb+ZGXw3vF7IrV1q+6A==
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr23414817c88.30.1793759184373;
        Tue, 03 Nov 2026 18:26:24 -0800 (PST)
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr23414760c88.30.1793759183594;
        Tue, 03 Nov 2026 18:26:23 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm3519573c88.0.2026.11.03.18.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:26:22 -0800 (PST)
Message-ID: <ee2377e1-2722-4068-b4b6-44191b1b28dc@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 18:26:20 -0800
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
Subject: Re: [PATCH ath-next v3 00/13] wifi: ath12k: ng: add Wi-Fi 8 REO
 command support
To: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwOSBTYWx0ZWRfXyirCTaJi14pS
 T2fPlq9jK5ozPIw+6MXu7nueK879xV1CK1hKwRfnJSswYjFIkkQExqPqluq8ia0dWMs1dn7M8GH
 GWX4EtqYAz6g+7NQ2wG5eSmxyXn5iJ2YnrlZ5eL9MtrEGM1AX/EuQBJYD+feifPmMhfIG8PYjpB
 FS0rad2puD8SPDuOBZetkIPtpPSukLQiSJHDA4Guj8Z0/F31FpbHnSs7/r9EzfYN9iXiYAQtNUv
 +OhZyRiKeXT156vfjA1lBZc5QuYq5Glrgywcynew8lCK9anW1778o1FZv50AisAdkJgdTx7A0EG
 vU56/I89qRfikwuobfFzK5JrKCkBtNjrcn0/kPA+Lpz0iqU4E+GkGiINs/LoyvuyS/SV8pGMUBN
 yg+8NZb/q0/veHZnzTC3iuWXjIArq8hzff1c+RtXfUEZXo8HGzGqoRzkXG/bTdcb/YOuLA7dJ+w
 bVr9QtZlzYCDV0vjaGw==
X-Proofpoint-GUID: hA72xnD-_prvGp6vxcTzZlkgF3wIH9J5
X-Proofpoint-ORIG-GUID: hA72xnD-_prvGp6vxcTzZlkgF3wIH9J5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwOSBTYWx0ZWRfX2X+dtXCQcuGD
 78UAUgAdtSu3LdImtQ9kMBDshJL9L42TYcKOU0CUuu1gY4r179f479DRBm2MnZgwGyb0EvpYsup
 l4+cdiH7Uz9sPn/B9pw+RSC/4tbjXuI=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aea97d1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=VGIz9s3jmixilTPFgOsA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040009

On 11/3/2026 5:10 PM, Pradeep Kumar Chitrapu wrote:
> Add the Wi-Fi 8 REO command handling needed by the QCN9625 datapath.
> The series introduces the REO command and status descriptors, high
> priority REO command ring support, common command context handling, REO
> status processing, 1K queue statistics parsing, batched command sends,
> REO queue descriptor helpers, qaddr cache clear support and RX TID REO
> operation wiring.
> 
> The last patch fixes REO TID setup on Wi-Fi 8 global-peer-ID devices by
> using the host-allocated dp_peer id instead of the invalid link peer id
> when programming REO queue state.
> 
> The latest dependency postings found in local mail for this stack are:
> 
> Depends-on: [PATCH ath-next v4 00/12] wifi: ath12k: ng: refactor DP and HAL for multi-gen arch-ops
> Message-ID: <20261103163435.2682252-1-praneesh.p@oss.qualcomm.com>
> Depends-on: [PATCH ath-next v3 00/10] wifi: ath12k: ng: Add QCN9625 Wi-Fi 8 HAL register and descriptor definitions
> Message-ID: <20261030120743.2687216-1-praneesh.p@oss.qualcomm.com>
> Depends-on: [PATCH 0/4] wifi: ath12k: ng: Add SAM support for QCN9625
> Message-ID: <20260921090656.1575082-1-aishwarya.r@oss.qualcomm.com>
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Update the cover letter dependency references to the latest versions
>   found in local mail: multi-gen arch-ops v4 and QCN9625 HAL/register
>   definitions v3.
> - Clean up the global-peer-ID fix by keeping only the wiphy-locked
>   dp_peer accessor needed by the series.
> - Make the dp_peer accessor typed and local to ath12k, and drop the
>   unused RCU accessor/export churn from the last patch.
> - Link to v2: https://patch.msgid.link/20261021-reo-cmd-b4-posting-v2-0-e8e3f482bfc9@oss.qualcomm.com
> 
> Changes in v2:
> - Use a lock-held helper for Wi-Fi 8 REO command queueing.
> - Document all-or-nothing SRNG pointer rollback for batched REO commands.
> - Use the shared Wi-Fi 8 REO queue-address LUT for qref updates.
> - Link to v1: https://patch.msgid.link/20260923-reo-cmd-b4-posting-v1-0-74935135a2de@oss.qualcomm.com
> 
> To: Jeff Johnson <jjohnson@kernel.org>
> To: Ripan Deuri <quic_rdeuri@quicinc.com>
> To: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
> To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> 
> ---
> Pradeep Kumar Chitrapu (13):
>       wifi: ath12k: ng: add REO command and status support
>       wifi: ath12k: ng: add high-priority REO command ring
>       wifi: ath12k: ng: allocate REO command context before submission
>       wifi: ath12k: ng: refactor REO command framework for extensibility
>       wifi: ath12k: ng: log successful RX TID queue updates
>       wifi: ath12k: ng: parse 1K REO queue statistics
>       wifi: ath12k: ng: process REO status ring
>       wifi: ath12k: ng: add batched REO command sends
>       wifi: ath12k: ng: add REO queue descriptor helpers
>       wifi: ath12k: ng: add REO qaddr cache clear support
>       wifi: ath12k: ng: add RX TID REO helpers
>       wifi: ath12k: ng: wire RX TID REO operations
>       wifi: ath12k: ng: use global dp peer id for REO TID setup
> 
>  drivers/net/wireless/ath/ath12k/core.h             |   2 +
>  drivers/net/wireless/ath/ath12k/dp.c               |  10 +-
>  drivers/net/wireless/ath/ath12k/dp.h               |  15 +-
>  drivers/net/wireless/ath/ath12k/dp_cmn.h           |   6 +
>  drivers/net/wireless/ath/ath12k/dp_peer.c          |  14 +
>  drivers/net/wireless/ath/ath12k/dp_peer.h          |   4 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c            | 138 +++-
>  drivers/net/wireless/ath/ath12k/dp_rx.h            |  20 +-
>  drivers/net/wireless/ath/ath12k/hal.h              | 103 +++
>  drivers/net/wireless/ath/ath12k/mac.c              |  15 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  63 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   4 +-
>  drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  94 +--
>  drivers/net/wireless/ath/ath12k/wifi8/dp.c         |  28 +
>  drivers/net/wireless/ath/ath12k/wifi8/dp.h         |   1 +
>  drivers/net/wireless/ath/ath12k/wifi8/dp_peer.c    |  16 +-
>  drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c      | 643 +++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h      |  57 ++
>  drivers/net/wireless/ath/ath12k/wifi8/hal.c        |  16 +-
>  drivers/net/wireless/ath/ath12k/wifi8/hal.h        |   3 +
>  drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   | 377 +++++++++-
>  .../net/wireless/ath/ath12k/wifi8/hal_qcn9625.c    |   1 +
>  drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c     | 813 +++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h     | 103 ++-
>  drivers/net/wireless/ath/ath12k/wifi8/hal_tx.h     |   9 +
>  drivers/net/wireless/ath/ath12k/wifi8/hw.c         |   1 +
>  26 files changed, 2347 insertions(+), 209 deletions(-)
> ---
> base-commit: a2fa01354eb39e673f3f09e6c1cec39f82f0f9ae
> change-id: 20260923-reo-cmd-b4-posting-af227314a3b5
> prerequisite-patch-id: 49882cc69530a316a86f617b0b8649c3e753fc39
> prerequisite-patch-id: 6fe238c82896b9f8b39fa0f09e32fb72d82ea6e1
> prerequisite-patch-id: f09a16b2b6b388cb3290a14d86f4fbe370929680
> prerequisite-patch-id: f7fab6336752c5a6e2e45221157c05a2845b1057
> 
> Best regards,
> --  
> Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>

All,
This was only supposed to go to the Qualcomm internal list since this is work
in progress.  Please ignore.

/jeff

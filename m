Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6A24A99AC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820629; cv=none; b=npQjrlY/BDOQperH2KCyKnWQ+wNhGMKYAZD2Aij8eFb3jLN85/bNQ7s1ckig+0Av1m+ju1g7xpwPDrGt5v+84TzjPxPX+oXdPgTrIW78Eg5bF7UviRgJt9Jjv2tEXr6xXAQUwgdrhu2eYp8YxsafT8lf7zfcya716zw51e163Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820629; c=relaxed/simple;
	bh=hgK6iHhdKFem6UFEboTc1tGVcd7hm7BGSzUtO+61aOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a/gb+GJpnKeIoxQBSnPYEzS1zkGr8QMVVLDWG5i8w6wON1Qn9qjlBgM+qsIbQN/6oRsQYWxYWF8SMGv0qVVQAIbgv28U2Q2fTw7t+CDNWQlvx1FzNW+C37NqZS0kHrHuq6pPO1og2/AjIomExFjSaJeCmTAmEB3gEvNuwmxX2ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k61Izvj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hR4ztKJ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k61Izvj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hR4ztKJ0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf8uE2420197
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=; b=k61Izvj09J1i+SqK
	8HOyPyrhPWM5o48Xpp6VeHi1PN1kYW5jrd0j+Jkikj6pN32BBLCcAaT28WenGhpv
	x0xr9UvGcaQesmhxzHOo9bD+hWqAjJqOAjoPJFkN+E1XvfPw0AjopP2Lih5l1O+m
	o+g76c78MrXjaQq7X4K7ap6iIL21bjJ7nZtDLfIx8LF4XU6e/UVAw5uhuwNHLRM2
	8ISjJNCceqoWLDqgZr22Vio9NZuJG+CLfKSRDG7Si4ENxvye0oHL5c8vCvVUshC4
	N60mgs+dUv7Nesz4+tZBOE8oE/FYAmCLjjBPktR/52wEEqGCYNo73tDU2r4/n4Fz
	JDrxnA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkk15q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:57:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3515266f6eeso3855935eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820626; x=1792425426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=;
        b=hR4ztKJ0gKdfczhDhR5sogI67YlU4V/6P6iktyfBxXPZcqgXKfqenL0HRmLtyDdT9B
         vP2pRUVxt/OweAYeg+UVU6InLQHurrPg/zt2+LkOQywUxrp71t9yadULwlkvGERbqGY4
         Bnt6QbSk2fJfcZRH91Rq+XPR/F/aRoGDED//GaEhodwGJ/UhkVJjqNTj2Lm9bqbYOP4j
         KIfGMM9M2F77B25nKghnLKKJ6Tc88hEKx+G1YWTJrmK0cVWn2OA2Nrby0JMpkUOG0a0p
         SQbAn9r0pR1KYNslfcc7quP9DDbVhdOBI5MSDtaKKR+AMTE1wPBmN7i0yuFM4OU/438I
         zxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820626; x=1792425426;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xAdX75WRt1z0l9J+6glmJ42BYc183LpaLtY137AuQhY=;
        b=P0gYjGdlzEPQDyx0uvgNpm6OHsXzypKnjzI73I0SjUgOF2mJKrLtLL/VhvCtmOFH49
         FzQriOfWLRuAfY/YkqFwRDctcloSdDxskJgjnp+lUAClLnc7GGDEeH4kdzi4AKBMmopl
         h9XABT1klBjA7jAzKLuNKaGRP2dxwfKRsvnbTFB6QXvHj+yyv2KLU2L38oKIAb+xZjzT
         fhTBR6PgKO84z6rguyE43FMYmEA3jGIn9/bYgMSPCtFssUpJziYmJ5GdM0LeAbrzeGKN
         lfNvdiGRRMBRCRFTSt7byFbtkmDiMx45bsX7+IhkA8ylpJDJdtyBtpECFe+Ba7zQ+sbh
         GUFw==
X-Forwarded-Encrypted: i=1; AKwUvBx7zrj8uPvxRJI7ZBdCMvtQeHsgCB2Gq4JGSJrfINwplA4Hegp7SgNvazkHKlxnTejiTLgRQ85QVRBoHzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNrklWKHX8DL6TTksWcC6K6So/UR4fXPDJvlB5u6Nw4FvvMp7t
	ze/YSdlQrSmJD2N0l3+5vNNQaNQ8mbyUX/nlRfQIgBkdeBYR+RSnUoycuFOZYuKDHAT/Me4yu1q
	GSfgVzZNastqM9eh64CNKnR3z2NB2Tw6JuvUB1UEri825wowz3Uyq2EnKMMcI0ZZ4FRY=
X-Gm-Gg: AYBFou2cLqyidau5lB/90IitIfKSTZWgleURHRPwAvcD2NgG5pzPpOySZN5FWh4qIWu
	mql+VEuExLN9zZz+pYFrg8LaWUsP/nmWjzJBPB22zLiHW2m+AS5mQsiXFtTm/Cf//OQRNlojsJd
	UEX8Fv2ODdWRuabJZZg8eZKuIWLkwck3+ALi0pC/jzjGGu+Rr9loTFdbTLluobRxPTbKGGVKmO2
	xERBtMJO9SD2WEahkAIJ5fNnN6Jpr0ytX5KBvU8MF67PIB6F7f//3MnTOeF4ailGV03m4lfr2E6
	Vwgm/+pxR1RVMS6fB61u5T62xKZh0A3RbM18r1OtaVKhEtlaSL0XaKErhUgR+3f/S4i13hWAVHj
	B5YSfrxcPv3aAOjVOPViqSdgF2tyrBGZonfKvO3CPZ+U=
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr12292583eec.9.1791820626094;
        Mon, 12 Oct 2026 08:57:06 -0700 (PDT)
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr12292555eec.9.1791820625436;
        Mon, 12 Oct 2026 08:57:05 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm39386183eec.18.2026.10.12.08.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:57:05 -0700 (PDT)
Message-ID: <193ecf72-5e41-4106-9cd7-8ba287642148@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:26:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior
 <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX/3qS7NtMpNRe
 yhe0Gx3AqfNANjZmGo31L4JysOaqpZRo1xjasSTQ3du3mABO4WHQuviBc47XwQf3Kg9s7l7uPp9
 uWQBWyyq6lsQrKRLJBNGz66QxhRrunXMAFg5p8emOmaJEMDdXF4rJZBDecbyKE3pdgCa/MVuznx
 pXsThBsv1Ml+s1/Ged7VWRUszwRpVuH9HYxXVKFUEcqmA4ISqJPyLeX24xzhrSuvaAr387GmHIw
 1mwCRa/oqlKTfFAwL8eAtef+XK04iZY4v2sYsuF5AfvLSwIgMbBOpT8R54Y3x2co1THQZ0y21Ko
 qzMt/1+dHjnl8RtBUjFSREVzmsKJeEKwPh0UD8wsxI3bgt4oqpqklT+kWMsqzmNW8PkRb1Tbhgr
 ZjbcbWM0NESXBQLwlzxTuy3iYqwNkyAZBi9qWYuM8UdMdClhqnP0g1MKOxTFHBfQEhhDZMarJwZ
 mmFCRbgh9jXD0NfbUyg==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acd0353 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX71+v0SOoHJvG
 Ts8YUaGlYY6xxMak8JPYKgktYfKWQMGQUAoYAa4bksDLo0EVgTy7Dh2QUptj0X88Yus9+uRtdzy
 7LtJhmt25hvdML6PhDZQIl7GMkZkWPk=
X-Proofpoint-ORIG-GUID: 3U5t7hSVsXTVSf275i7xn6e2KJDztWKn
X-Proofpoint-GUID: 3U5t7hSVsXTVSf275i7xn6e2KJDztWKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/3/2026 2:50 PM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>    remove each IDR entry before freeing its skb, as pointed out by
>    Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>    leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>    wifi: ath10k: avoid IDR mutation during TX cleanup
>    wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>    wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>    wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>    wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>   drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>   drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>   drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>   drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>   drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>   drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>   drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>   7 files changed, 44 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579811;
	b=3FqyMyDu/dZceJvPLBFtTgwTGD9gJnooaGXlDBPOIZCTecjJ/u8a5XferwvEsmvnMbdo
	 Yoq9uzSq+t0+djH4QiQwLPhK1ccJ+1FO+upP6l3Z0WvvKew/UQcI+97BvLus38sOC6czk
	 SBTA4Wg9tPaq3Ux5m+sLkOXLsP78WWNk0zo4l2MxG999zhjWYfNKeRkrmvOe+PU0ICU8q
	 6WntIkwrchyjTZ7j+5lBUVofYLhZoUMCNrkJz4FHIckjAMKg1P044vJPEQdjmpAKqZX9b
	 v0hr7LwCSnWoxoEK3mdSu7kIa7ya4xypAUgKncrPzhbWU3hh79OPPRuMm3v46ZBleEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WZtrC5nd7BZCveHlYloTin8bDZimwFGqn4L+Odkt4EU=;
	b=jta92iGGdtfYDp2RjchT09R+aihsZAJIqUiM5/udxi3E/u55k2hYL0dh8aUaIipsVqqW
	 uR2BSDSzKalA8XgKmQmwHUj6yvoWM2epVKQa/nIywo8v/80u/fRRfrqMQz1RL//EscvaS
	 GfqyOFRfo3ePc+JJsY1Gkplwm0TO9P+1vZHcD8LnDgrMJpoxXC6YxmizVxL320wIqiizq
	 v+Sv+ZzOzP0FnmazgLCJgbktCTKyVMSrA/C+Vi80UhEE+Ee6xJqjAmZxrjC52oN9EbiUz
	 gF/ZPlbIuqPUp832oEYoK7cy5ZdxwjHEk+k+ndNamQWjnuBUj12EBpcnyNm6rV1eKQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOvB7Cz+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djoZ8q4a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76266606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76266606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOvB7Cz+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djoZ8q4a
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5kW13015991
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZtrC5nd7BZCveHlYloTin8bDZimwFGqn4L+Odkt4EU=; b=gOvB7Cz+BSjlKchn
	+/DMyddnSv/zRS+MZoIq+be5fOe9LrmjkfxKGqTPQf/DTg3Jo9augIWMf1UspFbE
	YDWhW4WhBvi5nhMqosfj/1EHpgWMv73UEtJ6VAXrp5BRS3Y9FU0GrZkyY4E1DFn6
	06mTUFggqB1K3y9AcXzyhnF2jdMkWn09Ks9frBrCAkCp1pCWC568LgzAcVbjp1IF
	PL/kJpOyU7GWDoQHRB7z806270lY2krZ6FV7FVRowxWORIzRGdQA4qngt8lMTxrU
	4jcKiv+ypULQEBwFTcW4GLnv8rINRRYkcymkgMS+Zr2K+eTo9ObyecxxSgyDrFoz
	OZ1P/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78nnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:50:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso17051385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579810; x=1793184610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZtrC5nd7BZCveHlYloTin8bDZimwFGqn4L+Odkt4EU=;
        b=djoZ8q4aZ2Fuvobh8SIlW3ExonrwDMlsYpvwbkZAshytj1nQh5IoeDewmPsPB77lHU
         s/3iZzovP1hujUzpOr0KDZV6sNr5z5mdZC3Fqa2T4J2HbUgUXpgWkp1SeeXLEJHA0Rcf
         bVvEONJEV1Ewu4Je2y8IjNwGChgFIbLAOZ102cLiKL+MkNxZXC5AgjG8ud8rQ9gVZcRh
         KqGMGEM4+3C5Wv21TE6WliOlzhjWHduvL7nUUW18Hb/cVn1TnAZEFbU5PNq1HhPbs8Yd
         zp8lJNmo8W5jeqh8nIvz0Ieha5qitmQUa+ZSFwpGMR+zfFcJ7J13U7vCLV1ENvYpwk9C
         Ks9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579810; x=1793184610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZtrC5nd7BZCveHlYloTin8bDZimwFGqn4L+Odkt4EU=;
        b=YGtW8ju3/kvfW11Vs2AUd3JrH4OhbxPxw7pf7UgO4wl8YOk1zqUe13265eyZMKhYVQ
         /UcYewxs0/i6mKNl4lurYe0lK8/43qMdjvyC6ygE/PZuyKVL78Anh8BgsIqSjlMvSapv
         0bRmn94xiOaOcmw+1cr+SIFC1ZXQX/CozQTyT4hTKDc5bTlXcLv9QOKWnZTiLeFy1wGt
         6siR6n/4Nda8FeTl5gat6nXCz4d6ill1nTU5UikEuZXaNRp6X6IutjnwG6WQXU9qDW6y
         3W58E2UWhNVM3K8BntJCFio1fYAG8huFwbyCM9jtmXCBWUcQe+2G6oPFrCQmXzr6UM18
         0ICA==
X-Forwarded-Encrypted: i=1; AKwUvBwECZOAX8UPkC/Tj1idxXdb7mTfIAwe9P5xTxU6+DKTeypGLL1rI7IFGyBqK+DghQSI/IHc3q+Jff9gxaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGODVHl0i0WdrG+fjHqnetudjC2OraeXqN0dZIQrjcvlzYAihQ
	9E4EdefxSEwEU8tF+onDdEMhhYXNAvyMglKPjf2hQ8rOmbphkEzjL8r+rXegjs0y2muolfX1NKj
	9rzdyT7S/jhj/kLMaDPrH24Tq32l5+iXxnr/SH5xEO3LdC0/xPnCVIkrjTTc83MjFLVM=
X-Gm-Gg: AYBFou2pU5hD4clbTgZj0sbhTguNliGjgKTeu8bCYn0vUTblO2q9rCrCNajwW94S71b
	pG5cbl9wZmE61/S9eLGXg26bQ5B72180RxF2Cj+ejnuZUZEm11N6EKNRI19PKfxLtT6BzrwyVuU
	W2s5YlcWZIPlRitImu5Jb3tGRde4hf/doZX2btJ6sfGk/e2FAuG38jwYa/k5X9qW6tjlD0EjaW1
	UmghLJTFNh0a3dCQv09FaRhJxNdUDeb9cmKwTo7cDilbJq0OvikfUxCp9owj2q4oyaPrEHN/Ukx
	RBHPFVXcfjAgq7wuqBJb8JGaTqpV1uneQ5GcVncihuLOivXrYn9RJ3ULRo3CnVtlA2MrJVX2GAU
	80QEoUHGpgpb/Pq1RRqX16g==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr411698085a.6.1792579809761;
        Wed, 21 Oct 2026 03:50:09 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr411693285a.6.1792579809294;
        Wed, 21 Oct 2026 03:50:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403155331sm740891a12.31.2026.10.21.03.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:50:08 -0700 (PDT)
Message-ID: <56569e6c-bb8a-40cf-87e0-bcdee5fdc969@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:50:06 +0200
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
Subject: Re: [PATCH v3 5/7] i2c: qcom-cci: Extend i2c read limits based on CCI
 revision
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-5-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-5-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7656wp7lbs4gLfhH65hDDN-wvNJ-4Xf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfX02bKuWbphIVJ
 /nSWVy9HNtakbjjR0ShNMbF1Radbns7BQG7QZYUyUuNR8m1lcy/O2GE5WafLT/RXZrQ9bLtLARS
 617oKhDTg/WdHePn/dl664lcMUNf7fQefmMj/8wBmXtLQ40qRMwkOlstSfSnyJK0zWdrIta3kX2
 zzpHtWhF2+4QxZZ6kUFx0seFLe1zElh+TYbn+pQbNVshiNM+ByJib+yCpG/p54nVi160YazWlTe
 Oh2VBAywFfpZvaFFVY7pVPTRtrc1yRC2oRqt86seN1yug/0d/V8uq2E+Aj5H5ZuV8T44U1U8CWU
 gi9GgVVZDJdXQMdsE4tiwR3lb+V1o7YhokCK4kuwPcUcPfTINamaVIKYOupNNjzk7f0vAKwczE/
 jXaVajHSXaoB14i35W2tQoAXdht4TbCEF+NoAXMeH8wQaJ7aQ0XKaDLouN3KPFgxluLXZi8KMla
 vZ+MNysTpjqVg43KF0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfX8wTtYuQiaowL
 6XOPadf+SX0IEhJo9QkfW3eXN4d4MbQF3FLwyKGckO6787isdecQ21INv0nTClBWttSdOf4J5sJ
 u/Kjg6AE3jqbNtXnVZeyuvfwx5vsvME=
X-Proofpoint-ORIG-GUID: 7656wp7lbs4gLfhH65hDDN-wvNJ-4Xf0
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad898e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vrbjsZuTOpLc0F945_kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210043

On 10/16/26 10:00 AM, Loic Poulain wrote:
> max_read_len was hardcoded to 12 bytes for all CCI revisions, but
> this does not reflect the actual hardware limits. Depending on the
> CCI version, the maximum read size is either 14 bytes (16 - 2) or
> 254 bytes (256 - 2), corresponding to FIFO_SIZE - 2. Two FIFO
> bytes are reserved by the hardware, with the first and last bytes
> used for metadata such as slave ID/address reporting.
> 
> Add CCI_I2C_READ_MAX_LEN macro to derive max_read_len from each
> revision's FIFO size instead of hardcoding it and adjust the
> values according the hardware revisions.
> 
> Improve the FIFO read procedure, read the first word, discard
> its ID-echo byte, then drain the remaining words in a plain loop.
> Switch to readl_relaxed() for the FIFO reads, since the preceding
> wait_for_completion_timeout() already orders them against the
> hardware's completion interrupt.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

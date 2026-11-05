Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898304;
	b=r8qUUzsvXc+atROZ15ighJyv3/fuw1GMsWUAWYNuBwu9P75qDO3wx3chVru49f4B7gKH
	 BQJ9j079JsXl5Hld1rgncFA3v7eL7yWkcceiDh1l+5ULa3Ozs49ElwVzDRAinj6TBjd9B
	 n0H5tFwzWo0H3fT/etDqDESwiJYjBmUFOxUHDDadiuQ0U+qPDSMWeBZ/gPfQyM0tCHM+f
	 AyYI6FnY7EQI+df8A61yMwJ7snVP665cfah+rCMpJcmgyg1l033USSyaDm6mL0I5mlCGP
	 KeyPQPAlKBJNcDXsdshUhi+/+FkdBsB3CsvaDZm2i40ihsKu8hXwXe7FnCAAglIMlXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898304;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BsTZVQ6tUmIbIT25Pss1efYGgm8TLRoF2m6voevDz+I=;
	b=q7MW149rIDC6N5Em+qa3M35ztW+73NAOsUyqf2BrHJFxcN6N5VvH0eDbr1HgdNNaj4Or
	 2OhUKCLGWeMiDSpyrjreY8lG+kxUgBkCIViKrTst5TJw0nkT8Wagm7Tt/+inLgKwwEqiu
	 t0I71BVRAPlzzBo1ZLQtAoiOr1Nr/SAe+RNLuE05jrYregBo88svu0Z0NnvOTHOmHyju8
	 D26im5pdR/wzRbzON3g/nISWR743fNaJMNrMHeC9v26+AwLALRA1Wgk408RLwMw4yhHnN
	 NzyJgkN5Ab5BfYZTHQdmmBW/J2itVLM2ZVZoEn8vxuTHgGlkFfnf5m4Is09cg+wXiDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dpyYuB/I";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KujPir1I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89359606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89359606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpyYuB/I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KujPir1I
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ2PG1049555
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 17:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsTZVQ6tUmIbIT25Pss1efYGgm8TLRoF2m6voevDz+I=; b=dpyYuB/IwZdMjvCJ
	bcWfhr/MRUmjY8yU2kYoWhVoVOSH1IgN5Q/irDeC0zoljT0WO/INopqYXbM10omS
	iz8xkDDw3Kx/q2BPp6aWcYi6lH7V/mBlGZKlihHc8l0QKF00ZOzQPSp2A/Tt1TPF
	vSd4bgwny4JfDEvWl4TVzSM8CXQ/9XJ/RBgMI+rw/FGxFChPaxtDO+/rMBj4JqpS
	FbItxWcKF3vxHqG48iu1lJTzdKqrWowiGeZSJKm5bHPw0nYp4BmAY7QA04BmDlt3
	P1eEQselIm8bSgKAxWiXNjVxQne3AG+6LumV3tYHV2y07kRYWm6oHcsoHbOKn4y7
	0V9jZw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaaj773-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:05:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3978038eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793898301; x=1794503101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BsTZVQ6tUmIbIT25Pss1efYGgm8TLRoF2m6voevDz+I=;
        b=KujPir1IzYKiVWFog5dfupUJC0e8Ys3O5p+TvGwBzCYReudncQT2GaOZYalfSkvDMp
         ZFHuQfXor8bkrI1pp2qSwNweINIYgWfMf0zZ9Ss1xrcXur00LrDkO9SxQJVAz3R5cB8T
         KVPhdTbGXQvU7NHjqDwVMyZVnAhArF/+N8fuHgTTGfE7jTC6ujuVRLim41LyBpSjopxF
         sjRFwQphJaabJGAUiCls2rUpBY+F1j+jOuqSaeMhnP8ooCZRVPC1FLIOewsHfKNrH+3h
         QuGflrvn4whLSVP8mz9GlvtFNEtC5Rru+9ee4aCJwBdlC4MsT2KKbufe/qS/qfp+YFz+
         sCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898301; x=1794503101;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsTZVQ6tUmIbIT25Pss1efYGgm8TLRoF2m6voevDz+I=;
        b=Uqz50tR5d3tP9IhDVxGi1BvtcIIW/jE64QHjtwpyXMd6cnR1MDaGruEi3ORTXw+avN
         NSgNW60Hk2tK+XAS+fNf7PWzcUAKfTyx59AzO+//UUZmn9mnqI60aLk9pkziQ4YtxE7b
         FVf0qK5I1/++iSWNreNtdDt2RhqgeCiqzq+h/huiSC/6/AVyFA+Ef70i4jBuag+vEMqN
         h9i8BvgRdnV7gRmMFSjc0plUvG+wgyTNOz/tpAj4kIbd/2+j72JuTVo1VbUGkvUzNkgs
         T3PMscEB+1Ex4mFo3+oCa8Yu+VvdKicQEJ1S9RF1aCOk3zouxGuOYy5wnqKs7/BTuKS6
         KlaQ==
X-Forwarded-Encrypted: i=1; AKwUvByTGu/4h+BJRjxOvFGopw0T7ALjvzPWiYUTAeKQejOsVc+Y3K3ADPPqsWykEChAHaj0SCdn2Z6X112sJ58=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8k+Mpp/vLf9ylq9duC2Vp0EES/Ll/ToGgcpT2wNx/sZbV+T/1
	fjB2fN58UtPaje8VN3YZQ3aUpulaEwyluU15iylu7B0u53jzSFFa6Ju4C5/sBBjfeMIr0X+5shn
	Ypdjy5SeZ3sNjALIyikxD/2tC/eZPlJGvk131zKy9syn1Oz0V4dWIgYOw/s85HV8UDOQ=
X-Gm-Gg: AYBFou1d4pPzuYbi4JqjuVQXp8hrRHk4jsA4YrlP0JSGzFHlZcavbMytqCu92HZX2uB
	BQjCBkpYudKxCKOwnSaHRvO5cjS1L9F09RCUtVSQWKNIvJijpo5eLDDrNuZIveIt1c9RnINLEDr
	kqn+dSB92pu3sT3t0RPw7JVD/TQGSVuUOAufu9+qXVPgD/dUs2W20dSqyvAeYxS+F7GdWIi1QXe
	hM8MtCl0AZNug8CEafpkiRuB8nWUViqHeBmPIeWKqpTS+05ioyEGAG9IGH0yMr6P+hKrmcYQ0m0
	updAcvkKqhkYiZKCxquTImxxxK99c4woG2/uQywp64ihk7T9bNK1iQVHQRzymMfVebPC/+NfT15
	htlf2EcMi1AJoQkqsBXXdEFvJDXF+MgL0vXmKDRQv9i92W57QYMkBiuAOW9ChV24Bou3ZzlRfxo
	tx4OeEaX1g/x59ILA=
X-Received: by 2002:a05:701b:2091:20b0:148:bc4a:8356 with SMTP id a92af1059eb24-1ac5d5aae1fmr28881554c88.28.1793898301061;
        Thu, 05 Nov 2026 09:05:01 -0800 (PST)
X-Received: by 2002:a05:701b:2091:20b0:148:bc4a:8356 with SMTP id a92af1059eb24-1ac5d5aae1fmr28881520c88.28.1793898300422;
        Thu, 05 Nov 2026 09:05:00 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm18717397c88.1.2026.11.05.09.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:04:59 -0800 (PST)
Message-ID: <b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 22:34:53 +0530
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
Subject: Re: [PATCH ath-next 1/2] wifi: ath11k: don't bit-reverse the
 firmware's PPE thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        John Crispin <john@phrozen.org>, Kalle Valo <kvalo@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        P Praneesh <quic_ppranees@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        ath12k@lists.infradead.org
References: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
 <20261104-ath-ppe-thresholds-bit-order-v1-1-0f569106cbc4@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-ath-ppe-thresholds-bit-order-v1-1-0f569106cbc4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NyBTYWx0ZWRfXz9uht1R8Z01M
 EbAqMSzls/ll3vmIivyaYxk8s7S+JZoeUDqzcqlbC1xz61X4ywIPPnTo0QfVT05WybGHTXeoN6h
 HGsLaIGav11ZDS9QgPrud8Vwx/UNnSYKXc+KMYU/RGnz/l4uCBTM83NxmvRU+y7a12BaRxaZ31o
 KgjhEMa088kZUHrcSyV2rjLfNCHp2s5K5+Q7F5c7qM1d7lyCkTVvE+nTsav8Ag/ulh/pfLWGmtt
 7J067ZKdKOUKgWfult9XZfsvm/AvJqY6SIlNSN8cd9sk57kLLjAx5LKbA/NV5nKjlhuw4Hg69ew
 UFyHV/E8h4HZe1/b2dFrYfDt0FhJb8YRg+RV5X/Mvb4cL1qLwwRdCtERcrHfhffnLy+qxFnMIwT
 9xSoXHiORlSd3DxukNeVugdJ+slwOOziJpJtjXnlFqhymVvlzU6Ply/QFENQSRytloi4dgsDdGp
 1vgzdxGspzGeS7lTyYg==
X-Proofpoint-GUID: KT8Y7Qz_xCwo7nMxpa6HgNcSY4D81hLK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NyBTYWx0ZWRfXzIMVLjZjYtTm
 cFOdjoUFKariHb6jnhFQTYUeUIRaR2WhUAqbhyjQ0fEDHkZJRBbbi/YPPB1/YQp+tCW4BDT0H0P
 pyfn+sgSVe0zh29H7MAio7BvnaI4bh0=
X-Proofpoint-ORIG-GUID: KT8Y7Qz_xCwo7nMxpa6HgNcSY4D81hLK
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aecb73e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=g6HBiduwhlTomHawZCYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050067

On 11/5/2026 10:47 AM, Christopher Griffin via B4 Relay wrote:
> From: Christopher Griffin <christophergriffin05@gmail.com>
> 
> The firmware reports its PPE thresholds as WMI defines them: in
> ppet16_ppet8_ru3_ru0[nss], each RU has six bits, PPET16 in bits 2:0 and
> PPET8 in bits 5:3, each a 3-bit constellation index. The PPE Thresholds
> field of the HE Capabilities element carries the same two subfields in
> the same order, bit 0 first, and ath11k_peer_assoc_h_he() already

yes, but ath11k_peer_assoc_h_he() logic seems to be too complicated as 
well with << 5 and >> 1 for each iteration. Looks we need to simplify 
that with just,

val |= ((he_cap->ppe_thres[bit / 8] >> (bit % 8)) & 0x1) << i;

May be in a separate patch.


> converts a peer's field to the WMI layout that way.
> 
> ath11k_gen_ppe_thresh(), which builds our own field from the firmware's,
> swaps the two halves and then writes the six bits from the top down.
> That puts PPET16 first again, but with its three bits reversed, and the
> same for PPET8: a threshold of 1 (QPSK) is advertised as 4 (256-QAM),
> 4 as 1, 3 (64-QAM) as 6 (reserved) and 6 as 3. Only 0, 2, 5 and 7 (none)
> come out right, so the bug does not show with firmware that asks for
> 16 us padding at every constellation (PPET16 0, PPET8 7).
> 
> Copy the six bits in order.
> 
> IPQ8074 (WLAN.HK.2.9.0.1-02146) and QCN9074 (WLAN.HK.2.5.r4-00683)
> firmware report PPET16 0 and PPET8 7 everywhere (iw phy: PPE Threshold
> 0x7b 0x1c 0xc7 0x71 ...), which reads the same either way, so their HE
> capabilities do not change. Compile-tested.
> 
> Fixes: 9f056ed8ee01 ("ath11k: add HE support")
> Assisted-by: Claude:claude-opus-5-5

This tag may not be needed as per latest guidelines

> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1a237adaa37d1..8b4e992b609a6 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -5825,8 +5825,7 @@ static void ath11k_gen_ppe_thresh(struct ath11k_ppe_threshold *fw_ppet,
>   				continue;
>   			val = (fw_ppet->ppet16_ppet8_ru3_ru0[nss] >> (ru * 6)) &
>   			       0x3f;
> -			val = ((val >> 3) & 0x7) | ((val & 0x7) << 3);
> -			for (i = 5; i >= 0; i--) {
> +			for (i = 0; i < 6; i++) {
>   				he_ppet[bit / 8] |=
>   					((val >> i) & 0x1) << ((bit % 8));
>   				bit++;
> 
-- 
Ramesh

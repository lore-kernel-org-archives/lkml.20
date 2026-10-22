Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655140;
	b=VH8T9u6ZaUqTflYU1/q85iILDaKHmlDnbYi0AZnjZT7kFnXxktar0mP28LOVt/B5VHrU
	 UoTrL/ad7Rl9pb/zPgvLcdvj5Poulc//k6L22dBHMCjX259kza8rVJu927jy3zNjMTk2V
	 Lvg7w/QSJ5V4IbB/+EZxzOukasJnoEwQNSloIdvjcO4SbARzGCDlPNjp7zRNeThkb/Fip
	 lra5QjsdDoADtRbIzOYz0s2l2sVjEGdVk2Ec65u9lJ5yllLoHfmpbMfpBubUx/UsUziT8
	 DWtE1N6vqDWYc0K0x4OwP9WLY62Tkn1ecugomS9+v4zqzXXFjpIIzquAq5QDLlHHjkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VWNhUBbEj98a0eKk1XOTo+BnFUwSU0QxEzvHKDZ337I=;
	b=v9RE0yMYx6zyXylxjGOVdvl/mZ6J9pPdvMWWfPCe/mlfXZcxBy8D7z/VJbP7K01n2DQA
	 P11cooxC03QXMJ+dfcWusBHbYwSgmFs/NIJ400IR5wVyYODAs1tFb+7YgrvcZ/SGu4EsH
	 ub2/Gv/iSogNeKWfFoUyVCiXThHwP+S9wYSr/ZaUe+KY/KioqdPhACA3COiPe2JO2rJN3
	 RPLBGy37InlbKitd20/Vvy1loOA3EO74Fc25bShRSbYSvXcGXtIRSvoUqFXqpcM4fl+TQ
	 WI4EtTWVIyRHoDbo7yz0XASEAlbYxddavNFEHl857vAz8HT3bM9AMUUwUouWI13h9eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daya9Fgv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PaV+ukH7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC5606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10BC5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daya9Fgv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PaV+ukH7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Ap34110717
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWNhUBbEj98a0eKk1XOTo+BnFUwSU0QxEzvHKDZ337I=; b=daya9FgvA3PourQb
	baUmIc9oFQBTsU/VeU8tgdghMEXnbBsqOktM/8Ftk6g94URWdBADi3HSWuFk1d8l
	ozeS4fNIcWYXJ9gVVvet9SiOZPUODXfO1zOM0fBk4ZQ/NRXa8qW/ktrLXZ7haueF
	frwOElWV9U31UPNoAq+JfGmGuiJR1qOnAC4wUFslxCfCkvE5OxeEz8//ZK1uTbhI
	a3qfw71ZmhzYacKpTYP1ydWzKZSlodWTBwrZQ94wexk7KI7OfW/yInRWdcf+Tn+J
	yRRuy/75xC4hR8ruji4zHGW4pn4ZRKVZUp6ENqtALpsW0/TYANWgAQRnL3E2R3C4
	ZEPp3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahabv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:45:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530cd3dff25so2463551cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655137; x=1793259937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWNhUBbEj98a0eKk1XOTo+BnFUwSU0QxEzvHKDZ337I=;
        b=PaV+ukH7ZvMqvdlZZjGTiO422mxvNxeYfxXOL5hnyqYVE3hsOrm7skEPc6n1kJSvK9
         YzSWBzd2CDBKL63OdFPzcQUDLnT5HSl5L1bUxXWAwW9Dezg1NvS3bzTnU/enb2VodoDf
         q/VL+eGYOaUzZwtYz4Aot3oTqD+OeA9czv+BYoq4PLwTsOny1FtJ67gW16iCKw6WlQhk
         Vx38M5MYV0wvtczMgF6iwKwJFYuhyXpuhnlcLo9m9lxfFKMzjBPKPebrjObwCmOI7lCt
         b4mOgNjn7jubBGhcmr8S0wPNy2DHJqQP+Nr1EPGqQxwUqmmbBRmq+h+dLiPg1lx8WXrK
         /Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655137; x=1793259937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWNhUBbEj98a0eKk1XOTo+BnFUwSU0QxEzvHKDZ337I=;
        b=t3aSFjnl1jYbIgocUUIgDlkxXs6BBpgS6szDv5Tc84NO4R7/7XwY9AdSWuWjEjefCw
         T5AeNLSygT3WgKq9r0VqCdSgCWTni73akAESeWDOmB3fddB6+2zfrJaK4v6Bs8tLFCFP
         WgOhw2mcTsqvdTLZkd+i1eqM+LXse1/A8yVHm6XdWciWTKTIU5scThxLwSaygNhJO3eK
         oDHn2RjXuJA250+kPgk9KiHLDU/R1fU/k5xzGco3IFZCSDOa1YVN+xN8BX4Z80s53PrW
         x4Y0m+OyDa0/CVskddt47SsbGIqy+ul534gtOuKWIm6blDYmKKD/729v3tSiFhyl+hZn
         2oMA==
X-Forwarded-Encrypted: i=1; AKwUvBzXoV+h+fq7wOVUnl4MwxUWmt5LtkYK2JuvZ2JslGHC+PCk3kqEvCW/RolXyOrcs03CySpkvOy5z4+ZdOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf8QE8gHDhiPx+cA+Qofuo7lhj1N0/Gt/SgyPIuJBxjp2ODuvR
	J14VKrlM9Zwl2J3LbzlmIOuP8q9zDGnbA9O/0pjgkkVLh3FqRTJzPZjCs/ebUWLPes820mMzZBB
	GqcFzJQGLF0lPdj3cl35RpMII76gEC1eEfsRdfFiLOUTHroIzySnybm15kmIYNdyC0sg=
X-Gm-Gg: AYBFou1iqOevaWidRE/qwOvrF+bhxEVYja5WQzXncVPDUOAyg8wPUYSYpj12qCRpJs9
	OkZXEvXucQwMg0Oue21ypaSJkkEjGK/If+Y6RT8BmXKmWTO9M8inmNHHS1NzxBqEQc24gCBossX
	bvS1yjFfmxi5yD0XKhGGcTaWAyFf+LMFjBXyxEyijdJMQm+vjShasAq72dS5xkJcLDZSz78r3i0
	eKHg/mpws0FhBdQamhjOSgmpgvWSumOFWK5EEz/qOY8A4dVZaORefJjqfgR4cgnk6uWMGD9w7qJ
	Cuhvsr7RIctpv+LyF+WWz4TUemALINSFBcseiVkJDXSWK7P5zz5kF1XVgQfY/yd8RCMWuIU2iHn
	MFIH5LAd1+SqUEvJWTDfJ4Q==
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr84820311cf.3.1792655136809;
        Thu, 22 Oct 2026 00:45:36 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr84820081cf.3.1792655136379;
        Thu, 22 Oct 2026 00:45:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59689bsm76332866b.48.2026.10.22.00.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:45:35 -0700 (PDT)
Message-ID: <6b539621-20a4-42a4-bf1f-1fd58f803581@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:45:33 +0200
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
Subject: Re: [PATCH 1/5] firmware: qcom: Add a generic ICE service
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-1-b035be7aab0a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-1-b035be7aab0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfXxAmNDcVzRC5e
 YCtfEBeajZs2tmxXbpJHRKODzE2yR+g7Trkmx5Nhel2OJ+z4nJvzTqnnPiTYKDgknlzLDZkAGIn
 PG/6P9pEE5aW9sywTyEH5Lq+7cI5RkTp6u/+474UEvWCM5rsTzpahAgWOg3/yhcmge5WIThTS50
 IuNOoxg3tnH4uBJlroHS3JjCVsNuV06ysgvSpL94sVh05BxuBv04DSVy1gpya2zHXB9TPLgUHL/
 G8lbBcK1hYtT5hjeRA01E84lJk78GAKJ+UB/+Ieir5j7uLEZZk1dPMcZZFQFRUIpqhQp7b3ya6/
 9JTrAzXLiseLQe4vqNWE849y6Vjn5BiC1ZFnCkN3zZfJDUrMpH4bPjliPEISTlOklEnHrMNijJ9
 MB/pN5Uguw/25S5d6BDhL42VXUXcnTe0yt/yjUT3BwHlw01/uybRmDSKzjoY1M1H+XINmF8yfNH
 2VW/YqnMw7MTpB96eZg==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9bf21 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IgLHovSQZjQVHc4R8FYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: z4xcY1U9O6WHK_9FnhrAhc1qo2x8wa05
X-Proofpoint-GUID: z4xcY1U9O6WHK_9FnhrAhc1qo2x8wa05
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX1OzSJMQKhCB9
 QyqdGibgCuAKg2MlcvDbosqgQKhg6sOr5O/dafaudb9fk3LWL0kdA9dFPLMGsxeEQibh8CjbkqM
 Lp/A6OQM20UlXxFz2By0ltRvd60XyXo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220030

On 10/21/26 5:43 PM, Harshal Dev wrote:
> Qualcomm platforms such as the IQ-9075 EVK now boot with both QTEE and
> OPTEE. However, the Qualcomm Inline Crypto Engine (ICE) driver
> currently only makes SCM calls into QTEE. With the arrival of ICE
> support on OPTEE for Qualcomm platforms, there is a need for a generic
> layer which re-directs the call to the correct TEE at runtime.
> 
> Add a generic ICE service which acts as a common layer with different
> TEE backends plugged in whether it's an SCM implementation or a proper
> TEE bus based implementation (such as for OPTEE).
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

[...]

> +bool qcom_ice_svc_ops_registered(void)
> +{
> +	/*
> +	 * The barrier for ops_ptr is intended to synchronize the data stores
> +	 * for the ops data structure when client drivers are in parallel
> +	 * checking for ICE service availability.
> +	 */
> +	return !!smp_load_acquire(&ops_ptr);
> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_registered);
> +
> +bool qcom_ice_svc_available(void)
> +{
> +	if (!ops_ptr)

Should this also be a barrier read?

Konrad

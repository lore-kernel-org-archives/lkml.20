Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CF920010A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697971; cv=none; b=dwjfnG2SjHVINdWwEpFHXjLaC+TpC7K4wT/fYAWsraaoK5bt6r+lsZ3i3ii2dLmSUm493po8D5j09rS0E4gYx2gIiNtOKSxkyT/Kx5lxccMy/euRuqY6ng3vKKI1SL7P9Mv6n4y8j3Xkuy+pHVNl9S9tILGK+rQBVOpcwt2mrM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697971; c=relaxed/simple;
	bh=0KMbIGlkQ9Fdd4ZOQI+nyu1yu8DbaVrV6KBtZclJbNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utZ3QYpXTwmzxA5vtCs7CHeuMR2CuLdRTdORjxwg38ipUlXjraoBEGzavio8PvBHUMCOYAFkmj2sT/+OcKosj4tKnz+5AOOVBnbZNxhek7QqQNW1XATXy8NVhlbpKZW2Avhepczn4SFrRHWGf8LV/X8zx5803Rxb68uPHvT2CnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJ4ze8yQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zu6BEftT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJ4ze8yQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zu6BEftT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiop204966
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCEzOarjsAvhV1WwVWXKXzlUThiKoigcykcG44bqyDc=; b=YJ4ze8yQ0UKQGuhF
	lypgBv+kwWCcUQsBrnm0h2TmU4ScPT62nrfZPREIli6hCakpdiWJzsIx0APeI6CN
	27o86YY105YOeS8i69lMl4Ai6jrUOL/jPJn662cmIKMDlP/z7+nIDfI4EbYw236d
	NZN1OOTtl5Y47VOxSjY7UKGaz2XWEdOS82ND0K5wSKAF9tEYdFreqjKCK09TFz5C
	Qd4ncX8w3cDuFZiIn6WN/cviIekM8rT+i+l8MiwVd/iInvZZVZE7ce5RUqRbSJzL
	GsAqUMHvi8bV1CJcVwwzKemfWqiC/bYMiG+Q8KUANFvb/L95B+RLlkgRCd8UUmtp
	7D/uZw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144uxp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:06:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988c785c86aso92708241.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697967; x=1791302767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCEzOarjsAvhV1WwVWXKXzlUThiKoigcykcG44bqyDc=;
        b=Zu6BEftTnM/KPa709hosWmC179MgFRFT1BzKcRiXsFd8OYX3FqNdA6TEm7oCJGElIf
         oLKvTp59mYAHH6WOvAqziCOFip3afXsqn+ka256Z4FLvRlIZhrrO7cP/7B4tuxJZLTXO
         K6hdZ1Zobml8y5zSNE+inLu/uTwsm3krMymv9s64Ilk1QDxn6VfP09XfCpJa8xQxt+Ej
         NylmDb64EFmr91DVKb54t6MyaiomosNkZjTkwcAJ23xxAcQ8cJva+joYxsgdx+ND1T4d
         GwI3SKrfaAbCQ1uKkb7IvsEzeuxittsuPbN6m/QpN6L+PFCXhx3jXYDkD4xXW5KVsVYy
         sliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697967; x=1791302767;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCEzOarjsAvhV1WwVWXKXzlUThiKoigcykcG44bqyDc=;
        b=rCfDyDFmrW3egzwt6U2arqlhoA+uZ/FyaySV+s7ohvlmlcX0YZoi01d0jvPpryr5Hx
         ZeEqELEDSHsHRScjaBHJiDZl1p0IPvnP64f/UVP68yVEd3qQoGzuovo8X3NJO/GogS5F
         LRfjiveQaDPR6gU+YBLSMDlkkOmKJ1SePPATUKcc5VaNuZA7bLbaJdnwzyLpbZxOzaMH
         r0HTLxx0P+uTT7Q16cEBLMIRtmj6eeiFIaqxk+sbYRO5dSDHv8WogvXXVn8QPQSveBFK
         CZLAp6R7tfUSuoRuWh1RsEcioQbrypDavzXeHWWgh7Ig/S0Tr/qGhrbDYEpImuOCUOTl
         Malg==
X-Forwarded-Encrypted: i=1; AKwUvBw2Mz2t7DJ3/+OBWSPSE0dKpxCDLKDHX3ujKyqYD6laAqhAA0fGY5Mozaf3vBlYoduJN8huOze9+GtTsno=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrMgdEGeyqzusTErsl23oRf23Wkq3JJBTd9naZUX3/ThKO7fR8
	JBJC/gLTmCSJJPpCt6Hn7oUrSDc8MNWUXUfSVgBZBb9i1PXRBcVj4FwbMuUz3J6dglMcac6QOzF
	skOs8+vWDq4ORoAD4poEKAfZyGAfZ62H9IWgioLRbKnR5QDZEdgSzvniizvm0P5RTadQ=
X-Gm-Gg: AYBFou22wWkRQTGQkRW6JbfZ6i1iG/jWolsq6YymYm+xXwZFpF21IG2x9L439j4D3RL
	9UdChGHHpMrJ6gipcTH/a29Lyx4hDMKxIkn7jrqbMF2AuwUnc9REVMns+0s8DNlBi82iUh1zxPc
	MDynJPetSO3xl+q8BGcYljRdJYVfwtabskFxAvOfmE+6xmNOf75DwleUNFCftw7pn1bM8vMyN2u
	mxGq1yK+n8yfjCMOyTQZX8daNaANZgKhkK9np7mP5Tbr/3R1Y67Dp7U+3cQvW8AV4tNoJAx2ifJ
	Ekm7pU3y4JNXl9uYgLcSNKTg8eiELOCI36aJEV68nuQdOTXdcJZa2Xd91sX0VuVSnzHY5ouGJCD
	JU1NfN7WWqkuaW6IAPA==
X-Received: by 2002:a05:6102:3941:b0:7af:87a9:28e0 with SMTP id ada2fe7eead31-7af87a9296cmr3601908137.12.1790697966349;
        Tue, 29 Sep 2026 09:06:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3941:b0:7af:87a9:28e0 with SMTP id ada2fe7eead31-7af87a9296cmr3601887137.12.1790697965785;
        Tue, 29 Sep 2026 09:06:05 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.105.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm82549515e9.6.2026.09.29.09.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:06:05 -0700 (PDT)
Message-ID: <77b27663-c248-448c-848d-308d774dd413@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:06:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] thermal/drivers/airoha: Serialise access to the
 shared ADC
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c0317c1-f4df-4b2a-ab03-2a7b7132b1c6@oss.qualcomm.com>
 <20260929160356.38468-1-sochnev.v.74@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260929160356.38468-1-sochnev.v.74@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX9i+NpR2bg3aT
 Zmss3qs8oH1eSpjgptCrbpJDiRJKwXu9H/2fVRgkLoyGV3wT5XoF4FWs3zyUS/NqbMOAfI1HmT/
 5FDgzXbE5eVL5VN5TE8UJ9g9QSX5M7x/GeW8xpeqcU3bcCdfV89QEK/gU7daWCjaJQepyF4hMDQ
 HhU3Ll3lSZJ9J95igvQVvJs/2pVslI0ec/FoFtYnbu+L9Nurb4TglcDrvRDLtWZm8M/N6LQ7oza
 UGFaGQVvluCtpxBnPKebskhieBD+5zvmCAHbZJQG7v0+Dq/L1ScSQq8lqBcr+gNnI2Ltwma23Id
 vgEjh//OXsQg5bd7JA+gJWEXjvHHMKezCq4ZD9O1QZwFHP5FNCUozuFXOQGjhjySebqQiB8Ey+B
 pyfDyaOCZ7X8HXlAXrWx5Ct3F1/MwJnC0dUZibJco/xuh1GnxwQqnuRUT7XvtGCMEcNhtZdjlhP
 LBkqHaPrRl0iFAcRC6w==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbe1ef cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=kT0prZ8Py4Rt33E10uL5pg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=rWyjvxLpqfaSTwYGxYQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: tJIc0UXsSE9usv9PXxlAxg_3FSoLrZMv
X-Proofpoint-GUID: tJIc0UXsSE9usv9PXxlAxg_3FSoLrZMv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX+sbzu12HC/Zy
 kfKDxS1hZIbBqQtL5Thm0Pt4fVRwOmKHLGsbgIDjB3BgJmGS2ILqEVC9VndxsLoGtLWa3D0ULWc
 PYeriwYyZ+mgcdgTITf3AOl74/U9ea4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290064

On 9/29/26 18:03, Vitaliy Sochnev wrote:
> On 9/29/26 09:53, Daniel Lezcano wrote:
>> On 9/15/26 21:11, Vitaliy Sochnev wrote:
>>> Serialise the sequence, drop the cache, check the selection after
>>> writing and after sampling, and return -EAGAIN if it does not hold.
>>>
>>> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
>>> ---
>>
>> Should this have a Fixes: tag?
> 
> No. Before this series each device registers a single zone, and
> thermal_zone_get_temp() serialises reads under the zone lock, so the
> current driver never reads the ADC concurrently. The race appears with
> patch 4/4, which registers a zone per sensor; this patch prepares for it.
> 
> I can state that in the commit message in v3 if you prefer.

Yes, thanks

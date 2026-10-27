Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100356;
	b=w048Tg0qI0JiOZJjJmdLBf0ktnxvvOEmCY2LU6OmfPpGwpwsQ92Om+NGGGsWD6B1sLj5
	 KO5UMaad5EO3quWGoCna23FuJZFhbEw4BcF0tSfNwTmqrs9zxA9Fh5FMy1tscU6ddKdMP
	 aFodjS43PMl9Cc/kssdpFH5fRly1bN0jARxnbygp98AFekA1s9X4PvV0ZOi/x/R2x3A6c
	 Dcx7tnOSRg7aSeOHT1kiimjLjBore0twm+yFQkaSIuzg1+waofvKDLXxF+m8SOewhfue1
	 Kq82Tz7zFeBQVy1V1XAzzNep7IQxe73MSkypli69Jtj6el5fb+Rgc6Iy+yfMnX9dNRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gV1fCIZW2NicXlmFikXGuq/gfQCQSMfGDpxSV8le4/s=;
	b=WVOhKKRbRU2vhqwx+7MTLnLtwFT+6a5GMxnY6aWSllGEav4aunEkTAREV8FZchO876Xo
	 BCE4S8QQDDQNXqLcYyLff9fKLrM+YSwmRmYNXN3HmVE6zQItyv71hcdHHtS5CCtLrMBJa
	 w2qKrxQ+Pd97i6VXAxpxF2OaVlGgB0wTpqF753MrZSdZfffzitwbROqu743fmRKX+UCoG
	 TPz3op1O4TCoEalobqtdn4AJNEuTgTSNm+UX7Laq/5iJZcesOxLGoqOO+TvihHQFWlH3d
	 y3DGSbm7u3QOrMW1mQFGfMEVyI1eBKWn2AG8xGE5JcJlkjrbHe0YIA8AouUmcb29eaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1uE8HYU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hspT3pBB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C77606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C77606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y1uE8HYU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hspT3pBB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsUu1973270
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gV1fCIZW2NicXlmFikXGuq/gfQCQSMfGDpxSV8le4/s=; b=Y1uE8HYUsfHvUvss
	Qj3DmyU2upZPPNVhR9q8/VjNENWt1taFK2PCoNcctzpcVmaHSbLjowUZbGsrD48B
	p+CrGgHE94fa0P9b8cx+dd5HR4xU7cyc9zzfR3Hs3ENoNyre2PvGr+UOfp/hNpNH
	y480kMXKzxhXjCExAEON2I8QqphpfXEuE1lVGB7JBLVZy7PuZmS/E7WS/GbXEswp
	oAY1B3aMUX25/y02/jQZ+OfB/4XfcOhM08IV3mfrM04dEwzZB2uS+ubEmQR8E7j9
	iRj1fCXbgIWcLnGR7gwMPEHwl2lqJy9qCJYf8H9+AraxJOHnNfdXIhZQjDBV11Cy
	FAF40Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1ga5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:25:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so11613701cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100354; x=1793705154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gV1fCIZW2NicXlmFikXGuq/gfQCQSMfGDpxSV8le4/s=;
        b=hspT3pBBz98ehQ5gB/otIzronwEYvfIUdCOzqaFCl0QY8pVVfSubR2y7TKmBkledrS
         2LZtq7CZnQURD2KZetNdoJQBUiVz4Q0crjcaiDWPRWy9r5hj7/D79U2p3qTi1Ik/VoIx
         JpjgBsyb0irW3rRK8sIiV77HCIcY4qjw8bNU0Xkv6Vg6OQ2Xskwz0lfpi/3ZnK/cQ0G+
         Vy9HvymSJj/8+vr0i2Am/GRtUqPganmup5M/to0MqK6cFk9msax/gHn0dP9hK/we1kOM
         /eat02GGQEe3UUTm0gvKP74vEdFdlmbl1NtSmDVmGhq5Lvi2uA2rly8rwkqWa+U/eeNb
         1lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100354; x=1793705154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gV1fCIZW2NicXlmFikXGuq/gfQCQSMfGDpxSV8le4/s=;
        b=jSrDJGblaRdNK2S0Erk991UjXVoyNDOS4I4ip9htNjc8APUOi6RbDk2PfTDzUiFp3B
         sZnmtYMscC9cNOw5UbZaIPdHZXBE2tQ3rkW6k0XRHJoJHozpwtnzZWuohrUMhXEISKJF
         aPquuK3nBAvHIxiulD3tNhgp/9yd7UxS8jqAn+J9xKRkmeTbpi74HR/+NECMYvK/iMvU
         z1lIh8dkR1ZQEUnMSN8mwDZnHVrvWDh3jPz8zVQsCP+SnmgCLkwmtNwffiVq8o6hlOgK
         JjFOfd7L+msrtpAXVB7c91UHMtWzC4NTsmRBBP4ighd1+pQfyIUsG7qotj1E1bwVzg76
         prUA==
X-Forwarded-Encrypted: i=1; AKwUvBydJa1V+neES+WAcz9vfYZxc9d90H4kcTUw9nfYENnz4yBHgUHKKZz1N2ToQfBR9YyiEMeoe3xT8QRT6yg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIv3y9Y28gbmRc4uefdKwwYIUkQDqc8Lus1VWuu8G3Db/6/t6Z
	4U8mSBz2ZRMuZaIy3DCkmjZtoHsY15Sf8iJkDya11QsFEmPanfTRu/QGW4F2ATaQLZ1WZCs/HBN
	N0Fvtvul4zVn1m7LtAy8mhDO1Y2js6Jyjhx3pnYP20aafoYTz/qnwEmZZci+Y23tzbFA=
X-Gm-Gg: AYBFou0eDQG2CCYcNgLo0rA3hCQuam0t6Sp/acV+ygPWzQ12YEHR2GRHz5vMvf27p5A
	8D+OHMWkt2IhWOBhyZzV3KkOANC/20QI/iTMMBeMglXhntIenzaY/bX6f4JCyPKKxXCAiGEQTHJ
	80Q1PXfjSKf5l5EZa+0t1JLw+VXBM1Or6MDjT5UXUz/YbbiedLcaqTOOxjRWy3CIW0ZvvbG43jY
	g147XANuRB+7YkhT/ktN/1BVQq9DwDGXOyK7oDRV2DF+Xft201HqKZCbtYECEqJHtNyRFaPDBud
	QMVAaWXERiUj6Qdb3VEcKr2m9SMRQ3id5C02MwynfG+cg0YLaq1sHOrEaqQtpPaD9Lod5PEai83
	r71dWRHMOk6tdYIGpsFYmxw==
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr135312781cf.0.1793100354150;
        Tue, 27 Oct 2026 04:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:e0ca:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53840e30413mr135312391cf.0.1793100353679;
        Tue, 27 Oct 2026 04:25:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45e167f4esm3315889a12.2.2026.10.27.04.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:25:51 -0700 (PDT)
Message-ID: <7e6cfbd2-c54f-4a21-af27-f681e6ea19b4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:25:48 +0100
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
Subject: Re: [PATCH v4 3/5] drm/msm/a6xx: Factor out the common BCM list
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
 <20261027-adreno-a620-v4-3-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-3-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae08a43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=J8-uP8xFOBs1Kl34Lf4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Og_SXOvOK06KmRdTJgVwmiLQp4iGjCil
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX5nzJril/bT90
 nObtE/MjVfXDPadv3NZdGMWiiqdRS8b3uwZ92RXlljYh/CQRwzMz8N54R2JwrZgsZndSPqE8d37
 q0TtYUK2Ud4YIwwAmJ7jmz4GRlkMKrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX6cPSJBBEmlqP
 A2LwljtzuA8/g+TdDRuOfQiT6Quo1POxqFMO70s+OHeOaHSqaljmfBl7zDGfmjg4KYaZ4k7tcVz
 BHVT59em1glFXO1MUzALydeHNXnAzTRUf4721yk9F6L0BlgJ8rRcDrX7ydoDAa9z9x2Ka+9KytO
 6WQD0v2KRebRu18r1kpF3dJfwa1EiPv8zRM8bPERKhbYMdp/71Y2MFX1oVwMHWIaDFUVu2qTyMY
 hH9msDBvJgmRX2lJWxK/aeJHaydWlrYujrGIY5DQlkEn2c6WDJ3vFjPkcg/nGMZ3cwAPSQSq6DP
 fiFr+5mrrA9qEfCk+4+qqcwHNwaNthFQ7A/YXWOMTON9fzf5FeovCH7wgolYnSec/UyswSW2WGU
 /jnCHjcZUHmqTo5xrqW73MVtT26N5OQ4GOMfPh7aXAyChAsYMR3U5f4w/37FBo34I/V/QgHsCm7
 FaofdJKrsjXciNnAEHg==
X-Proofpoint-GUID: Og_SXOvOK06KmRdTJgVwmiLQp4iGjCil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> The A690 entry carries a list of the Bus Clock Managers it votes for
      ^A623

Konrad

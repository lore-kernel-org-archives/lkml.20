Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99A3488DAF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992643; cv=none; b=QEHa5jPYD/6wFYelA4FSllmXSbeXHvgf24v+Wh1lh+aim5SSoK+7VTHHPioKQGm8EORcRzK7joFsRDTNImlcI16wzuiXCAgKPZMIiB91LMeJawoQWNoPelO2s45t4TEcQEHm7BwMzp3CDEmI0+SPzEGeMyb0iE5HOtmVIllmo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992643; c=relaxed/simple;
	bh=EbK6ODNmO0D3SZaqHghB8w5UPz7lhy68KwjWae3JCWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbE3ck6VjLgJD2OwB/sh9pc1pkF93olRH8WqsRVC+f6PdMEMB1KSMBFTGKKvOMB1zy0zZFuWwL95f6UX6i/vWUzS2CwpKLkTtWXjnqw+YgmBFIVPpIBgseHUi2xkddvFbUQ//EwwKOd5GEPFIn28BaQYAU9EldbzUQBQdwVM0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFyqWjTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3J4yaHB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFyqWjTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3J4yaHB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdt442091254
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tL8IyACdL/zO8BuJLGunz4pX
	sGhD+T9jiJsqTTcZuvA=; b=VFyqWjTwW54GTNCnz2FKpdw20pT1oxAyyab+0Agy
	FSdcsuxzuMfu5Oa7nxXGkQgU9mrvXECx2grs/OAVHnPgbHA8BrF/89/CV9OWBd3m
	9R27Z4CEzmu85gokRnGzaKQoIPgYguh0dOfk4M4euUDhiV9di2201XccN1CfPIKl
	bCUG+ol7CrRnXEeAaUbooBVbNpn5u1ZPJboPtxVfv32FdJEyJjjC9+G4sXFBGKct
	ChnCpsB8SFElmEbR6y6OugjAzjZATqVFLTHak/OzPyvIGaO2KkdN+Z8jDWKN7iCu
	ISihCh9M4mrCNC8DzLvnexyIfa2f9bM81g36NkKTRCi5dg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wt91x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:10:41 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so2437199241.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992640; x=1790597440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tL8IyACdL/zO8BuJLGunz4pXsGhD+T9jiJsqTTcZuvA=;
        b=U3J4yaHBkM/mnZbtukwDB/5Viwi4eYDpCuKgE6JBlc9Kn6UDb2Z9SAfmHOU1i+Onzv
         BC2bF5l76rkTzC9lZRTYcB6xpQr9ahyzCpG0QdJ7HoC1BGJ8ponZSyhallmSoyU2gA8U
         fEFzzDclZ3jvHmQiI1bjWoZZF1+ICG4oixONzXIgOMvSQdMQenG98rEl3rzXL79Hx7gR
         W6OPKQdnCAAotcqSP+9J6K524kwpRsgxy7d5Fwz5hmtZhCEPHP2EZM1HK9uIJQiCWdd1
         s5+69mpRvnBgoAoywmvILCZ0s02wv/tMHxKhSYZinZ+EPX7Z+UtEr+314lgHALf54t7A
         JRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992640; x=1790597440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tL8IyACdL/zO8BuJLGunz4pXsGhD+T9jiJsqTTcZuvA=;
        b=evYrkXkZp1UJYWTaBuqYY/P+5YSccBYKtAL6UeJYhJrIpQwnTtg4li+jMJY03fm/8e
         twk3xVFxWG0P83DVAROPNQI2ZjV2nOAYTVllG+AcslPGAeld1jaQ0bMOLWpz+QmFhCQE
         H9z2boRcOH9G+3p4BXFWQcpvu230W5vdL0D39UFZYTW2szAS8KvcJdFqixFHogOy7PqU
         iCFpdqXqe/O9aOd37s+Dxhxf7rWMgPPEOZjKxk5uh0+rYOpn622ARvOAsai5qGJV1TXW
         +3SAbtcye4C68mDwPv7xcYmUKhzpCSdD5UYSaS0Gz/oug7IQpv5fBF+AfQ8rks6A1uNd
         LlFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGJsMxruTMLnscH3Yp2tqWAPwx/sCjNYAv3gdP563Ud6vSwiKUdWB1m5+EPpQlTBrPLeniJeYELfL5ZPw=@vger.kernel.org
X-Gm-Message-State: AFuF++mJSgUHOH8wjO2VOO374ZrBeRLenSoLH5jeCes+Z29Y3U+o1PH9
	xDMfeZbloeTYA8VFIephCQ9vXYs6BkhV0ZlLDWMc1qv0tRmbpkf9vHFster1Zimq43bdUHm0YYZ
	hfVNpcTn7AWq3tk4BhOfSznelSfzJWPQUVrzSExBMrx+kAm4LJgYr0xtlU1eeQGsP1Ik=
X-Gm-Gg: AYBFou0cb/LGWWUaPaLoq9gwd+rbqVDW2N5F/Jo/ht9Hkqrd8hfJ9lctTS1qwcODMXu
	Gvd6QqDIbbjpPBfsVhRHdhvNlcMLk3c2mOY68dH/03So5JKJ40iuiYz5PtX4nwXoNArCrw6hvOz
	vDnsaaMGEZpCf70QBeiRFoZ9KHG5zEJTpxgJfl6242tlLn4p2bnnmG4G+EEma46/NxuFi86At8A
	eM3gaJvNqrVplfZ0nRzYNrZkZpf5JON1PhCWHWz1biJr3GfmOdvY/z1gqxINqXMBcVhKcdyGfB7
	9NpORjhAcyvPRYDBqh9KdM2ZShFWhjEZevaksiWKJkQ/7ztLvQRUJnyWv/5k3Y+KIJSUcLYlkhA
	Htv3zgHAPmuZzrw==
X-Received: by 2002:a05:6102:370c:b0:7a2:568f:815d with SMTP id ada2fe7eead31-7a55c2891a3mr4038170137.18.1789992639899;
        Mon, 21 Sep 2026 05:10:39 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a2:568f:815d with SMTP id ada2fe7eead31-7a55c2891a3mr4038117137.18.1789992639421;
        Mon, 21 Sep 2026 05:10:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc55cd8a8sm283004565e9.0.2026.09.21.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:10:37 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:10:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2S
 HUB Serial Engines
Message-ID: <ol2x2dw6akjc25o5kw4ji7h7niyqtpvjopg6xljy2rob6ays7u@n6ufsrlev3dw>
References: <20260918-topic-sm8x50-i2c-hub-fw-ram-v2-1-30e960966802@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-topic-sm8x50-i2c-hub-fw-ram-v2-1-30e960966802@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NiBTYWx0ZWRfXwEAD8frx1QjD
 3/wR8F1fNtRvAvf5RJCUy7qtVwwD2hScXmLaeVXTE+r/HGQNKOxuRGmFXb+Q4Lp057RfFwIPHFf
 MHjjduNfFEbDgyOhSBeAq+aE2cerY72ejso7w0FeYXQ7CGdQHgCUXIj3bZqE50oDMXDiEaQ3hbv
 qITuxE9Qw8SIRlG48zExnBzs2WOWDn3RpFTZ9iHm7h7lZ7MTqkG04d+VJ2906hlQK2xQTUFrHTw
 DbBXLevp/m2Z5Vo303ah8gdgYmp7Hob8R11+dgukU4UkE1nogJ6FlFru+CIcAd4gIw3E/xoFgtX
 YTp5STNny0AYuTuivkZp4IQ3DG9qF287oJvHHaCr1Tv068pu5mq4kAtD2QWFViZNvAMgDBs9O9k
 qcJV/+wokzuimn5x+HcV2TpMDUA1wMeIJtMNdWO2gz4JLwqBjdmGG/HQIfDndl/Wpswv/R3uyOk
 hsporfOxLcqQVwOSQxA==
X-Proofpoint-ORIG-GUID: JkFN1Q9me8uDGUr_Z7AKvZlc3Ac6lAGM
X-Proofpoint-GUID: JkFN1Q9me8uDGUr_Z7AKvZlc3Ac6lAGM
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab11ec1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=U8wyIeYwd4xs6rStnZoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NiBTYWx0ZWRfX+rUvpq/uYEhu
 Pei2M29yxQBbw6wXHaVqX86JdtFYftgiNKqWPTAsROW5wUeMu1QgL894KlMASQ2j33ICdQKWgHl
 c9dDXcIzI+uXO/ijYYAweB/YecOHYKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210176

On 26-09-18 09:29:04, Neil Armstrong wrote:
> The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
> is in the DMA register space doesn't exist for those instances.
> 
> Provide the ram depth in the compatible data to be used instead
> of the reading the missing SE_HW_PARAM_2 register.
> 
> Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

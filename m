Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F74418A37
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376506; cv=none; b=GNQdf6iD0u+USA4BuAwKStAQ+cJfRIKiMqCzZn7imuSBGgmule+0tP9/Y99/myPrp8NHsHYldzMPN1jTmvCL79sugbyqjLJMZQh8s2GMiyDKQZ4HudErbV0Cb+1woEgu5SHFHzLXgHijnh8j7cAQE//0TsFixp7k6hX2L3XMpBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376506; c=relaxed/simple;
	bh=SSZZuAbiA/bGCxdScGctQGz1SoqPI7ykdWK0HpLAE9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPTXGOn2QsbFRxCM9PqkdfWuiqMvy3NWEs2A7CZNL8jgyGd9svdXj81WyhPU5eP/VMazRmRq9+6zD3e4upl7jeqVOp+RjDiHDYiKMUE+67fKfEYBsO3znToerdrttTz7ekX5X5K6TgqfptK117+2+pgr227QWSrPvgRNsCZVycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+Hk2hdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSCoRmx4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+Hk2hdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSCoRmx4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7SE1q3351944
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=; b=X+Hk2hdV9zVs2YKl
	HWsXYz54XPR6gXnU2Wr5lV5VUTP0iDCXSoc8LETBMtoIxa/ItD/nzC7d6AVOarg8
	eER3DaBb22iz74Teu5Nd5F3P/qhSo9cj9GJftGileLqzkHoeOxQsJQwc/jZ7OPQE
	quY1LrApkdMNCD7LfXYbGmj9h7EwqtalZV6gpuI+epaRrKbadv7mXStrahj7aUg1
	zwtJEM5y/d+II0gSAqRtD8f1LLYYKx242ay/d5Yfk16YaIdk1qBAUfFuS60XyjDe
	z1HRscQxR4sk6pc6Sl7/rOF1JtebBy3ZPLwBlSRu7l7rGT7f5OeCEhYCxC160qrn
	EV3FsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0ajs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:01:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9103db79014so7998746d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376500; x=1789981300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=;
        b=cSCoRmx4CXDIrhiwIGdOjk2Yyxeww9Lj/IRS6zYIOt6pzpWQ2DLMOm8+0NkEr4ul8p
         rTyAV77Nrc3IdsoBiZrKJImhdtH1wLIJ2uLvrFSxeRy1M+pWx20tg+qIuiNGwZKEsyTv
         7bUXfltPm152N5GqMbV1pO3D8okfXQ5GbkWWGxHvSHVfrMBAO9pUARHR/Mc9aSibQUHz
         uSoXwLnf5DBc+ZFXWTrzL9tHQDB7G+qg+ps5QeNxrnbFX4a7LX8QOTuMeNBltwMIef2x
         vA1/btaN+K3H8VPwvYOVwGdBoxYSI80Z8fpYk0SH0qQauTstLzC2nhY8onh7UJSU3tNW
         XW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376500; x=1789981300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=;
        b=A1s6Z/kQZb58cUD0txl6KP5jJmH7rXAYW8O/Cq87U8mV1Gdz4xppyRuV6OhW7aPNpB
         vtHe8d3jlFE7c/oA4c4v++F8x+wcB6GetMbFHvXcm9EHiY6bEmL08VaV6VVpEJhyrbks
         lcCRlCVmalcoUFlEArXRMjE6u0xMGPTzEypNYFNBj6znjKoJTl0hEoZYgIvmQiyJmiBJ
         WUr39zViEr8142q+Rr9yi8UGrHscYPZ5c5Ef1wppL6MBDF9N6XrykC+EGnJFAwW27cnz
         jAMgzWTyf/87m7qBgofJBpR7k1P3PkYj6aXg0d9ni5RD6hNwShEFgRks75xZjjNHZCln
         d6Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxUn2QZJiUhJiFF8V+jxdjfKDAW+/Q4n/W1jFzvOfQvD5yXP4473eOv3tmDDoNeouMKe1egxl6cNqmxlnU=@vger.kernel.org
X-Gm-Message-State: AFuF++mGwhN0pt2dh4SR/a96+N2XpbTGwwCvbJCY18Y/F1GVLorXzSY1
	lIj7C53O1K2mvOF8gdSJ3rhMv0z+Y5u2Cy2fujpVkwt8e9zC6B6uAKQiUdqLrWUekXDqcG5D1nL
	MlQ0iGidcrSCufIqhXAtlYZvhcqkj0ty0Xs173uW7/cdNc6DLMQ2DJaRFqUfO/GOkDSra5qe81I
	s=
X-Gm-Gg: AYBFou2wyy1wVliBRuqaXp/v72Ce8oR8NSCjcF/0N2UVYTlgNDrUV/8ZjiufMpkorbv
	M7t6/Of7R8xiEkLfBDzZQCKo4HIKqi7ICia41v8Azi64tkTtlmpAwyUP+0LEOGiA5eKktUGeddq
	1cxAXMC8yWcgsyEiy+OWVDkQmSyd/SZF/d1Ap9UvFBXMc2xJWfvUP5orDVWTQHHkh9vYjLqBdGA
	TlG6EFTha6YIGReo58/WM0sv3KA+JYXsKZJhnsBtbbIu6r2pP810BSc8gfLJ+HL1TYddmOiLfox
	MEZsEk904rjXo8VlzbX9K1o6l+/9p+GFfvMPz2QOyqzNUizC1xPO8KxCvd0aV/Oe94XpCx57+KK
	RhhXon6Q6Q4rxCYCMBHXdxg==
X-Received: by 2002:a05:6214:2b84:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9122e68c7fbmr19261676d6.4.1789376499670;
        Mon, 14 Sep 2026 02:01:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2b84:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9122e68c7fbmr19260906d6.4.1789376499064;
        Mon, 14 Sep 2026 02:01:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614b29bsm390322166b.62.2026.09.14.02.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:01:38 -0700 (PDT)
Message-ID: <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Add sound support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7b7f4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=v5UkR_fZS6cbfkSa_YAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: AUx3fyDFhrso3V0eB9fk5ppm20PQnRFs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX2OlHvIrcB36u
 vZBr6LdDRL2SB6m6rnxMAQusl3yAlPiz791WVqye3wFseOu8VIxRWJt5Kk41sDtobeYw8/guEWg
 jlNmiFxzG3wFEly/NLT2kQW8ElDLqaM=
X-Proofpoint-GUID: AUx3fyDFhrso3V0eB9fk5ppm20PQnRFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX/twDH0QikBeE
 tIb3z47nPq8Ci1UcK1u1noRdjK1lfFxq9tIMKovc6tJ1csB4rJGGmm4JTe4Nyx4R0Lh+ST1wJmy
 mBy2DWa1EprbMMQ9dSIYq1zhLo962Lr02Q10H/P62YuhWR+QK5lEGD+V6mPalU3uKTpU8b5HlSP
 sQF9rTgvYLeX75t7CpXJ68W31IXfFqBdFGpVmEKfTFtgFmYMyCZFjOdDj5s6OhrbWq+P02wceqk
 MjyXojTsjCq1OJbjxXm02S9EiLU0Sox2OyZMRzj9l+GkQT2oVpz85W3FDtCDdd8wfOBk4ebIS76
 cP69t6A4qPc78cruSb2v6Ie3kFzGEQu/97pclhUMSSAlyamJEjaUPw4r/YiRjobNsTEDXbYJ6FH
 /NHfNNCB8evX3sklHGJ9tag1+B4852IxaegF/5aIxSkTfxklftKriYljluDEX8LJw03ogAZECZv
 glt2SY4AXdmjKkLyY5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140128

On 9/14/26 4:40 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Enable audio on the nord RRD board. Add a soundcard node using the
> qcom,nord-ride-sndcard compatible with two DAI links:
> 
>   - PCM1681 playback over Tertiary MI2S RX
>   - ADAU1979 capture over Tertiary MI2S TX
> 
> Add MI2S pin mux states (data, SCLK, WS on GPIO 73-76) and the MCLK0
> pin state (GPIO 99) to nord-embedded.dtsi so they can be shared with
> other nord board variants.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> expander on the same bus, so add that too and hog its dac_enable and
> click-pop-mute-n outputs, both of which have to be asserted before the
> DAC produces sound.

Sounds like something a driver should ensure?

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572712;
	b=KDEJsGVVYL4gwJy2YNcZ+JclzHpU9uLJp5x8kCUnkMA4eeI4Ibwhp11dbSbuZJcZwYBp
	 DK+rb6vyhHk5DZICiMKFJn7gf7/RYB94KjeQDV2oSuoKTlmS8Cmx0oNK9o4nFQ0uAj4ww
	 47zCrQ5i/Lq5+5KMrEOhUrGyq/lLNLdYjlRvPYom6O0jG6wrT8211w2OBGTHOPRkiIXnZ
	 pst7PJm96wWIINPuFPl4B5/9hio12UVDOWgTXJSZ/jA9HG9/SkJJiv3SPPf0t1CqBHoqi
	 PcjGAscvq9GaffKgF8ADrDnIqD/ONTnQaAXMdbvxd2+JENA7agElY5AwxLkxPEgiuXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
	b=LT4G6cvAw90JiAZpRbp+OxMc00LecwLuMrlzzuMBlw83OZ3CytbXKEMKskHeaB8OKjjt
	 UP3Roc9EclN5ayYrpmL7UICOkCaokrBz7LMvHV4A3jxHo8Kztd0Vh88zKS+od6GmEOJJl
	 SSbfiEaYJbtIVNrwrRMIDxx81SdedNpm9uL+7OuxLg2W6dTj7dhzvNGY0dFDCbizcntCk
	 3YPfVOPg2ZAbKYGJeIzEk9GYlWCWdkqpYWOuLzb17kPyn1NIMaoIPdR/Km1jYIYBFk3yd
	 38HWgcFeQbwuGdWUk5UT5f2Ov6BHMJ+pKWaweD++BbRdC3rShmU5d/ahiKiLPl1YBbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eevbGZx5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BuDyPL0P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECBD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECBD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eevbGZx5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BuDyPL0P
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8Pt6W044057
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=; b=eevbGZx51TjNI8eL
	BSAc+E9ZHVox7sAUAJAb6luMLvjAigyp3rJlTUZdPtYEvzH98x4xM7Kc/yewpMc0
	ITEhCIEnTVgNEu2fq4d9B67aL56zGvdxVllgf5kk54LjEb0ylXpICp3h+iONpxpO
	hTNZM5cAufuZ0thIDIxEV6Jw+M0g36/AT4f+1izFYUkyI29ajjwdRhbkHlQTN0fd
	KoNBfRiESnWM5t4aGZMvvg1tiS8I4ooCCYAXx94xNHV2eoa1axYYymobm7rTpwp6
	w9BFTSsOvtrW0qi7YpBffoc+X9W62iFG9y+iyEBtRwluIHSurn/rKRGOJfwe6KiI
	b3khEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r25jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:51:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so9418485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572710; x=1793177510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
        b=BuDyPL0PkJclgCfP6c2h8rXJ1y2Ugc8edlLuJRDShyIb1NZryrV0JQOEufoMYH8Itv
         BoH6dS480qG60HjaQlvaOw0/ZNd+1EJ0ifHAtYDociR2OO7S8CSvGzp+38Ir/LLb1dFr
         9jV7DdjrOTW4b1KD6CbpfAvhPwSyr27LA3o+mg+p1z6wh0RdArBS0o45jHydvGPO2obf
         mvvj/G+ihaeQtn2Wi+bYNXClrnwuhveavIIE9rzPa0RJJjCkJDIksWTEvKfw0TS8EJxC
         xM/t3eQLexxSyS7YyT67kgBr7gjDYxdr9Hg4nX3FPZLcOrz50OTv6T6D8fVc2x7X2Lzz
         2r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572710; x=1793177510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//8emHITfe15m0Bez4BAG5beNHYKTojZgWKVzWcxLKY=;
        b=zPzJ7DUa8liv1w205+SBrC6BFIHcgHxx+DZoc0zhKHQKA1u9G24SdwCmvPqd8znNZl
         f3Y1QKzJ4HSW/p60CYN/zxuAgErqGNNR+HiZLHVeu/StbUSLNZLbKhvg1ozvHpxtEXzR
         yCZ66/4F1yOG3vh026Wn+jedTg4IzpYty1k481jxmzzVHjgRWcjimo+1NIljGllqkvZx
         YNZ20KeWPugUwRNjT1+iE2c9gOojIesMrq7oSfwe4KdXQp9PwmMholn/zfMEudeAmiY7
         BKplOWqHHv8l0SC73CznJoI+bIXtCIaKIoyI6pN/vB8Gd0K+RJsEcowcs0Tqxy0VlCB1
         rDEw==
X-Forwarded-Encrypted: i=1; AKwUvBwyG52DmHyPCc0YUyJLJynt6WItIXeNw/YznfZ/C3QqayiPWagm6/0sG4TNqnPzgfJP23a1H1NhKluDupo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9NjS+0Tejd9B26EDRlsbSb/GOsF6bjDK70WK6HuaNsZDWohyb
	rMAYOADLxGbWEB9btObCDtrZwctAQAsq0qL1WVoyB1T67NPTkvP7FcsrYUMoYeDmx1a5pRwOAIZ
	r1lJSONrMNLrZBqQN2v/v5vRZsfsS0jsuPco7p6UUnptO8Uqr2o99hKmFL71/8E+Tj6f4ZjN2wz
	zVHOC6
X-Gm-Gg: AYBFou06d7DiMs6YhVGp6naqbBnlo6Ie/XGIhHu0CAo0ggibRtzfeYukdm/L8JanTpp
	Is/6v8y0CgmnBdQ2k84E0Ukyef1ijwgVgPAqdKNBC5BBEo2eClZmQK0gn9dkx+aos06rMGqMXIn
	yRNKC8ZOnCh8e9lOmax+Pg5mJAXnJhHsEi3gNtnVjzH4vL941GR/vXnjgnShHsGb+t37NxZ6naZ
	+zLuHH8CjbcQrxqxgt56XUrOXcczJQumBA+/JA/geUC+/qQ4vIT9TKV4UK14kDnPPqZd4NU5ehC
	sRGQRB2pHqnSdk6pPrFSYEkf6dZo15GtMxjurT8O7SDNEcq5TzyS0XjH4dfDHoyjPpSrV0d9KrG
	tt9PblBLt9tx8bJAg4f9tVQ==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr339635185a.3.1792572710039;
        Wed, 21 Oct 2026 01:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr339632185a.3.1792572709548;
        Wed, 21 Oct 2026 01:51:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900dbd3sm53534866b.81.2026.10.21.01.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:51:48 -0700 (PDT)
Message-ID: <cc411497-6acc-4320-87fe-481c3a904f76@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:51:45 +0200
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-5-e7b1f403146f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-5-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad87d26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6BLq2ykjfKK3BQYAMXkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2dtR2UbZAhXSQU5Gb9DHTTcEjrYKaxu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX29cEd4XyLZmR
 6zaqhs4dWmV83vg9gn243GCdcV0nSydN3Gss+w0LbhXoE+ymuk7YxhoCvwM4iddQwAfHWsaiv11
 sk/9CD5Rw7qxQSNByfFinuHQSHdEjkMaFyAGSkOyHQ30BBDmaC9BFlEhCk2qPeIV7VtA4sZxWm2
 kJkqZjtPK1RA+Q/dM4u2vUkHf09DA1G32gg/vwS4eJ7W0FAjaLMUTG05PuJun5AQYQJbZhnBHik
 eOyqWusqd312jaIXam2gvcZIhhSL4c2b07sW9i2rKrlGuB89fgxRW6PSSr/UPP0/IUR+eTh1EqG
 /1jkHnQhJqZqYMEv92PxYajA1J4OnLzRI+LYeaWNUwTpjxfRxI6mFFHfREWh52VQDUsubbBzY8M
 3NUV9IqgOUdAJFI605yOmcBO21wTBVqKFikNWNZbOojljCAegkwmHh6sv9LlKkszCZuWt9c6tVV
 G5URK/a0BrGznxCCPZA==
X-Proofpoint-GUID: 2dtR2UbZAhXSQU5Gb9DHTTcEjrYKaxu2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX45ZSGkJfnNyx
 ovmd5l36pPPnwJwgiqr+gHv0yAwfOc/SK7IjiACAAw/xoUOeGCaMDXBF/aXROofiNbi/iA3FV90
 Bue+k6Buqs3jA0Ht3a789s1SPSeJOv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
> CSIPHY4 in four-lane mode.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

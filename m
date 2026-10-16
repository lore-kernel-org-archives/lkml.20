Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9A423E9E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153892; cv=none; b=jOyQc7f4jp2RorqFJ1grMR5cX2+fxtWm7gXVQueN6HWw249XeKFoJ7JPa8H55O/eizy0d1H5u1zthMM2k2atWChQK8RzULAypwUAmSp4wGAE0sLSv16kDZ6i+vph9Te+957W4j1J52aCYE70db2xim2vO8v/79AZxnWuqwmyzIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153892; c=relaxed/simple;
	bh=uvzCRxGuooRqn7FD6epZqB7NmrfzTcjHnLeWzrz4Tzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjSaNPsiUtM/RSfU0CUaZR1e0rwXn3hLRMBSn/+9rLSgXKiHjzAZM4XyZTnphJN/txzG7uSwtYpLwQh6mw9W1WCaoTezW5lrE/detjwg1Prm6ebm4p9TgRcSTaRz5TwBU0OfXQtgmh3QBrk9maCmLCTk2OLmGQVOHrXhslhkE7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZ96fk2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apd7t4E2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZ96fk2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apd7t4E2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAASUH3069342
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvzCRxGuooRqn7FD6epZqB7NmrfzTcjHnLeWzrz4Tzo=; b=jZ96fk2DZK99DMCG
	2dbDYX+BmrDRCFD0Aii09w4b6OMRgmd5fkhApbmSOWDxLv39fkkPuRGhiSCo/ftL
	XxsqZYpP6AqzXGObAe1I9d1L3DJ5W4tbrCwQTizZLKYSoebm3mpiCUgs11va9bip
	aRa5M5m5y37xd/SdwFa3qx0akBGSguwF9nGPbTX875amUYd5B/OlVJLEKy4XQkpr
	ZazKoRztkvKZEn8BX1JMVSN/iD842raDeOfenO2LHX1WZb19iSxlvCFiWxKVPaOR
	Yv1N/KprMYZ1qgngnUbIVB7fKOz+wBAoj9bq7nTO0tLhX1lteDZXbCdX846SUqI0
	OLiVRw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba2629mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:31:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so238632137.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792153890; x=1792758690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvzCRxGuooRqn7FD6epZqB7NmrfzTcjHnLeWzrz4Tzo=;
        b=apd7t4E2PujIIzGQCXLMWcY+wVYAiw6niLdnY32AA2Ce5t8jxPiX59MaiLHggsA4Qt
         LDSqa1PsuVAULxRuufDR2nfpPgeVqo+ig7LXTy6kAMtdpJGUAB8t+NmRidX5JW83OU/D
         NaL6ZNJoCN20KIoaNJAwMEQpySncCVP96rFsU+DaPXisrKK0biM67CoYTUPoTt9KtibX
         hsks5KRNtrLwwHOuBSgpNy4LAmVJMqUwenJPfqYH6moUPBppzLlEcEhRTb3Ni2dlzhNL
         B7ycaBY/TiHoCN85a6D10PS5VH+fVMwyEi8iBgn/DdBeQuZu8qEJyoBqGkIgE2Sy5B9i
         JS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153890; x=1792758690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvzCRxGuooRqn7FD6epZqB7NmrfzTcjHnLeWzrz4Tzo=;
        b=awBQJFxrsvq98Qf8pM9VE5c7kaGwH5iLUx/8RZp6ayIrkMWF8W5xXLYKBMu37ym0tX
         o11sAhwDu4PZqnEsz+iJGbH8N6VqxDJYfb0cAA08D/fzm7NatT9zleF9jTxvVTUcuTd0
         265GhA4xaRkb4JbKK4zqAkrDu26ekRpbk+d7GFsiR8hl4K3PKsyZfyrFxyPoANetDIFF
         YRFGHkMIriy1UAEWRVjJIOeMFY0i0ky2x75V4HM7MNRb6pjc5TkM8mTRJo6t3mK4kdnS
         Ue6+AaGAyEqQ/d4x3x5oyxB8FLU64ReatueQv5FEbrR0AW6GLn3KZHJwWIs7kmzxHHpH
         yrLg==
X-Forwarded-Encrypted: i=1; AKwUvBz/4DK4Sf94fRw57A0KbwOx0V1vl6u0mCiLDkk0hu+G2tvPR5ofGchG2GVQ1ppwz0PVnmkNIwZlZKAW0CE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlRW22odMY8AeinPoj3ElXlhcDlfy1d/UlP6umQgSX+zHf82Xp
	o98TDU1eq0iEPgiHnwero4pZPlLtj2GJg13GbaWedZqkRpQMzsOIjU1vQgWHYhIA7ZRe5KygsUs
	Bs1RypRyz4BXTA4PAB+s6SwX+lThN8XQ3DuDOBpCEFi1OA0EHon0kXUzKkbgzHzwrrLo=
X-Gm-Gg: AYBFou3CbKzI0AYflJBYXwMZE243KDp5KZf86X1brGgCnsIpHYLZ5PR3gvprIeEkiH1
	zJi1kKphNozQfZrMSIXrGYShEnTh4QTtiTwo2uhvAXJD1n22d7mQDYGvzPToH5GGqUS/+UtsiYg
	SqewjBzqmwfRn4fil+XlLbLW8DfknsFtWKOndWvrRI7DT2raazC0AGEL2P7ld9XevpPY64i/cEP
	h0wfQUCD6G8sqP1kBig23CFgxDHbRb3uzqAEAs1KOsRo4KCPfb1FT5jM2lsjF8jBvraKuiTHspT
	c5Wth9rsLwcfo+yJ6+9xDTAmSXJ+hqEIExVezB1wb9nm0E1glPfn44q9wCYdCbfQ/I5QsjXpcQN
	HSzMqSQKUjS8fhg/zxfw0rw==
X-Received: by 2002:a05:6122:4650:10b0:5d4:41cb:8936 with SMTP id 71dfb90a1353d-5e91f4ba58fmr5094052e0c.4.1792153889558;
        Fri, 16 Oct 2026 05:31:29 -0700 (PDT)
X-Received: by 2002:a05:6122:4650:10b0:5d4:41cb:8936 with SMTP id 71dfb90a1353d-5e91f4ba58fmr5093981e0c.4.1792153888906;
        Fri, 16 Oct 2026 05:31:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm66813966b.54.2026.10.16.05.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:31:27 -0700 (PDT)
Message-ID: <18d6a6ce-afc6-4590-ac26-0aca6dfafae7@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:31:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
 <20261006-shikra_qce_fix-v1-2-8ac54d81edb4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006-shikra_qce_fix-v1-2-8ac54d81edb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad21922 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mSLAci9PSNYu4dxlomoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OSBTYWx0ZWRfXxOwP29ICPr4n
 xjkf0cnwuJpe1bkrY6fILSIFJAShrurAawdETx35lc0o4sQWHS2ZEeI2B+BFNdMDJq1Ls5kzNeT
 CEjBmTS2m0Sg3DisdlYgnzNlMIrOnd1OktybGFzVemhCFsgCHxAhR2YwMAgYdGPRSpGyYleXbua
 7njRkf25kW9oPkLBwSr6DhGjgxgB9jVfXOw453XWTybmKV4Dk6G6Vpp0kvL8RRE/NhRMrIvmey3
 F9reVYxnRjAXjZcjjA64Bbs8gwf3A4lZOlXD8EuPfpztsNyOb3xT88ZDVlgjpgcmzXRJP8MVR13
 kM/Zg+43sepLUVyVvrCH/qr821JU6nMUs9BfMzQhxys0B+QDubtE4ZnD8dqsIVzg36RpBp3AYiB
 tiujjY7xVFZ2RE/M+ussCEHfRfk36gwSMw+QMo2GpAOfwqVTLnKAYYtrMjD+GqOrAMGN0syicoB
 usDxoQ64uJwp46WBPBQ==
X-Proofpoint-ORIG-GUID: gya4uXvNyi7CkeFo5TVl9te3cVE7fUae
X-Proofpoint-GUID: gya4uXvNyi7CkeFo5TVl9te3cVE7fUae
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OSBTYWx0ZWRfXzGPg3T6xSVyJ
 hNdxenSBdkVyqJZYFa+l8+1xdQlfdLCGV+G8KpgcLo2oZ7lQ9oCLMfTRueI2QJ+tuVbkbpNHDGK
 NviH3TJ9L04hjMF2qWHIzcC9O7L2JNE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160049

On 10/6/26 1:14 PM, Kuldeep Singh wrote:
> Shikra is derived from Agatti and uses the same QCE integration.

This is useful, but..

> Update the QCE node to match the underlying hardware implementation by
> adjusting the fallback compatible and related properties, including
> clocks and clock-names.

because the compatible you switch to says ipq4019 and not "agatti" or
"qcm2290", the argument falls apart.

The real problem here is "the hardware needs a clock and it's currently
missing". The similarity to Agatti is irrelevant in this context, even
if true.

Konrad

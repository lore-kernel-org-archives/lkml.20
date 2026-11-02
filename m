Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613527;
	b=dyKxohmumjAyuFYisxE1FwzywK2zIUeQ8oqKqhNtpZxjRFXNMhr4WnyArfFrTUzZZeoW
	 Dp1qos6T+hVfgKrFISkGE2dvzQqgnvEa/8FYrdIokJn9KrxOS/RhVC6l6JfRJ8OckYj67
	 12DWqt8hy751wkiZDZDHTrt+IeQTv1wbOVwNMid/kjPgDis2BVxsk/TrGcnZe3y87zMNv
	 GtFAQBy0WBXmdXpYhvhl92Eov8gnV5PVV1y3v65A7dWZC9CgH7BVTWmqVZlxAlSgv/pHa
	 s3RMQH7o4mlSdIQ4S6LCOm9PQfIY6QGYh8VAtD4fNd98KGuBP73TPANV1lIEgZg8/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
	b=0HsCYfOwZba2CwM9BgoNCrYviQ0KmASyxMhkC/TdSGbrLjeFpc/81B73egrUDa6ofcYT
	 7O3m96uKO2DmTZffksz7uudoZ5dXAuhRLLQ1uLw7HRNdi/4V8v6u9KfCXL5f+VyAI5yey
	 9qCjeXHyNM8TsCqX+fZQd4N92OvuQ7D0CXM/EnlJfyN9aANADct4Iy/4QT/m6TA62MZBx
	 jnAB5ogw7PPeE6D4ylj3ojJWte4dWkFZKCKY1+SCvnx3mirIq60a9Dnc30+aaaCP+8Bsb
	 gKQjkIOYEZ/1Y06lwKyluAPQXChpOOjYS9MCs92ShDKcLsIX0sc+VKk8rmfLTA5Z6DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DDYU+IvQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D59iB/J4";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F3606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492F3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DDYU+IvQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D59iB/J4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B0f44015000
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=; b=DDYU+IvQRYoSsgfY
	xxuhpLvMBKfk8QDJxkkquXf0u2tNrUP3w6sywVqWAJ/vgf/GhWmwHJ11HdBX9L2+
	XPySOuGi0kQOsvmb8zaDHROIEMJSf4xWYOErtSQ3nJkIyIf9M3oY/ruEf5JJcbx/
	Ct1BjNTmZFc98EhAYZtvJmVC3C/IzfaeS6CRdetp7/4wyfcvnfanWS5t87ikBL9+
	RlG2ebhU4xLxO1msW+9hlrgd8Fg79S3OBm8eqoKXJJHMVekGIVdmIhGOwt6Sfqw7
	YYRUIRKKADAI6m/I3tyLlCEe+5hjPUNJ17euSIVJ29Fs4j1MD7D3QEKTX8Bn9fud
	hW7t8w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pf4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:58:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c82e9d68fso8239686d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613525; x=1794218325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
        b=D59iB/J4WBanpS234LJvwRPWBCLA/EQVcMDCCgrlI8g2NICiad8Px3CKBrFoHo7Cx4
         TlSopvbQ/cK4FpUwOiQInPPM1IljqvR4tgdZX6eNo8paDKA2MEGN/z+e+8DEc7L2ILHI
         H/0IG8g5WJAjHH4V1qb4v2Ejo1dTCLSL5M9862+CXB7AGKtnX1W4KGrvIgMlAx3eIML0
         dIdAK7R9P7OjsO/e0jGR/TvLb20QuJHguOTKpWrghRJyopAmpCRabWk63d2B0oT2064I
         xo9A/xbIQZOKX+9lpzQuBs0giL0A875vctfsNcgT8Hr440M8+ihVsdRiH9CJL5Mg5Mtn
         5d7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613525; x=1794218325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
        b=cubiOl9fk3Ji2l09Krm5qWZR0h3nWeb5ENa7I1z4Y6GW/E8metf1UEKjQ4BrKvDlhM
         2F2Sb7AdSrzd+0yV4wLG8YbC17N8oO2TahKybwAeM31xOqK7Kv2R2AqKYR5PVqo7SUma
         djbqzNcVkhF3NEzji2OqzBo8wCOrLNFGTvnck9R5eBbdaFtxZLAf1I59nePyITiKDZlX
         sg0yKYVYacSiQXEX6EIJEjZA4CYMS9zjk4HMBhtAWJP7zv3VjQsifHNwlbeEtAwXx3Vh
         SjxSJpGZQvnzL01HTBTQO6O5/H47oGKwSDPA09UJbZq+FhL5ZpMvkxbj1T5wXQnnVrFT
         h64A==
X-Forwarded-Encrypted: i=1; AKwUvBzASurEA0gMkqFcy7OIl99271I9yCfxzqG4MwR6J4mcKh5gltj481/+3r+uLIdrwFujPU2vJwhDnkvdn24=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcwUxy9tbzSb0FgnT4G2GQGpAxxXPQH23IILUQiOr2dE/WQoMJ
	3F3hYtJBzFKxGTpFmLFUr3l3SV2NhZDfvtuVY2fg8M2PIlLq/RWfA7hmT+q1S1Xxi8k0Nat6EmR
	RnKCsawUNLiUqnEDXjrOFEeY1/zWkS3uY52c8zxqoNFT8Qtrb8h2p/cujt3P4+ukCfes=
X-Gm-Gg: AYBFou3hhC2iyybWPj89u1FfSJ2e9rtVIAI5zZjT0wqL8Lx0otmQYeJ5miX5gFIrSVQ
	p7E6QYZWUFlkpESbJENoWTonKTMnNT7VckV6LDPJ98bPktIlNfxZXz/6OxXmG/YSPGfvoZ+9UlQ
	6t0BRw7+ubOey/IHXkDqZbe9Des5Z6JsWGH4jcOmBuoHDN4/+7T/KmYZ+DFAVfBIX4Kg018cgO+
	95EH7+60ep7ISHBiWtf1X6U60LWqQbsTl8xyQzZxFq0ZxH2FR8JwtSlYnj7vgMzQfIF23kJACRC
	8nLH3DDdSnbAPbHLvexlL1i+CD01WmUgy8zGq4ACkKR39CEcHxoKzq9X+3a3lUETYt/FhX7vLHb
	gqTOhJ3FlAyiwY0pEDb3fEeyNKdDRP028owXjp4aODhUFtgmEgO54DW38Bqp7HYaDOpvhtwk=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1551972885a.2.1793613525323;
        Mon, 02 Nov 2026 01:58:45 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1551971885a.2.1793613524919;
        Mon, 02 Nov 2026 01:58:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fc668sm3100901a12.15.2026.11.02.01.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:58:44 -0800 (PST)
Message-ID: <8433ec2e-0f0e-4816-b3a5-6cdd7a6d1040@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:58:40 +0100
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
Subject: Re: [PATCH 03/11] dt-bindings: regulator: qcom,usb-vbus-regulator:
 Add pmi8998 and pm660
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Robin Snyders <robin@snyders.xyz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261031-pmi8998-vbus-v1-0-4d805e5a0f27@ixit.cz>
 <20261031-pmi8998-vbus-v1-3-4d805e5a0f27@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-pmi8998-vbus-v1-3-4d805e5a0f27@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d_B7Xa2mqHe4bFiYzuHlbulTbT5LIOcj
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85ed6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=nHuvgkJ7WHa1mimDmQUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: d_B7Xa2mqHe4bFiYzuHlbulTbT5LIOcj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfXy5ouCnHefEVD
 +J41ULotBBM6b2MAHpJBLytrbDTDFtatOHsBbpJm2vNYRjg9vFltclHc1xdj+WNj4qt4Gl8Afd3
 QSaPZiOijfO05YejyblGp9Znk6wJMyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX3kgz5F6RdhgN
 asRGpsBN04fQuIa0/zpZpKnHmoGgnvoLySO1Wmzxw2nafHvoEvMyaW8zHIT38Y9vzeTG8IkJrIc
 wJX9R9a8VVXL34sCPQ+J3DUyI3btiXBkDe5Pg3AwBHX9kObbO+ZpRkdL4Drc38849pAH/EOoRqY
 EwJk7pdsEOdKJs4jKOyUVC4CtQHomedaKRek+O9L1nPhrF+xzduulfnHtiBN3dzE+xoyA9y0bqw
 uRoNz7wZGL/sZORPvwtZhOSdWdphCzY24iSugsQVOrTgWALtdminrR0rwh6XwLo6K5jFqMgo7zE
 42zo+RNkvtQclxgRDdxIT1XAdKAkodlZDBczhB88iuycRYIAMnqeAA7OE9S6LTCgII/KxmVeRjP
 RATcEB+6Uqxk+FB1dVLSU9g8h7b8z9ufRd8D6iTBqgWyGJ6T5yYjptdqXIsCsK9X8rJQ344sVgn
 JOpW/EIlyEjg646BWOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039

On 10/31/26 4:05 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The VBUS register block on the PMI8998 and PM660 PMIC shares the design
> with the PM8150B one. Define corresponding compatible string, having the
> qcom,pm8150b-vbus-reg as a fallback.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

This is absolutely not true. They both have a similar CMD_OTG
register at +0x40 which makes the driver seem like it's working
for you, but otherwise the register layout diverges a lot.

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA67F472535
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946760; cv=none; b=rbRL1kkljcbEo2OqTH0yu99bbltKvpT+Ei0OsZcbj/Sst5QIej0Q7JzuGKg0B58uQAuzVCIqXyJOMm4pUUXZJwXcvD94yWelk1Ipnixd2Ib/+mV4njpZqXVuK4MmKXfCWfReIRc7shKbe7dXZ6YqOddjBZMZh6RLstgpXAsgKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946760; c=relaxed/simple;
	bh=6ayzOsAvdG+G/rn6syoukfBuBdqHDmFchWC+bLjgl+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b848LnzTrioctnRD8GSMhfqneusTxL5CHdaDcvocyWbMtqsKfIhkAfvE/M9OsJfEMcXBWa5JuGcDqninu+cBy3Yu9Dpp3BmE6iUydU7TgjRCNFxfSKmjc4lwMu3l/KzJyEaiqJCxbCxDVZaIXeLM/nyeSg+GAdUf7nTcicma96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIppjMw7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9ClyEJ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIppjMw7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9ClyEJ0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896W10A045467
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 09:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/EmgsJxrD1L3erLFRo5v6HtacTKMKtvJ59uEs9Mbc8=; b=KIppjMw7N9Ur2RFK
	BMM0ohKgDYdQe30tJP6APMrKtLe84yNNb5Bqvptw8i+8Sc6KdBYEuH4FrE3uVj1S
	gj6I4iuyF50o6xjdKETlxIR7NvzeAIsP7Gpd+Y2zZlZ/1MkOIyZT1q1fbUb2hUK2
	bngPXSBpf2paVJCHityyKjqfaad9wASo8HBC6kis5FQ/xduQCSYn07pnX/WHqCxJ
	lEWXfUHolAqAncRJfedEXnMV4IIcpJSklR0MMMGHti58UKe7rzl4XuuwE2+zWk9G
	ca+EQQamKsWpO4jKjHpNViAbSd1uDeD6G027jtuUkotyDdrg4R7YglNamc1nwmRD
	ihRrhg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewk9fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:39:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9102fee9920so11607036d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946752; x=1789551552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/EmgsJxrD1L3erLFRo5v6HtacTKMKtvJ59uEs9Mbc8=;
        b=Y9ClyEJ0RnwfzOFL/UzWzx64835U+M+5otmDyfCyejb6tqnQZkw1Ih/ZCIHOwE13NI
         NZ8lJ5KuqXuFM3XzqxZcOD23dRmCItIh303ZDDEmgYxdhI4LypK/pxsHElNZV4ndepPC
         Vtdz7Papx3ytmyreomNRtYaAU6MynQljPRO8ph/Z7DTquJ+CsuqtNrZZuz+/DCbdzu1h
         vQ5O2pnoYN11vJ1jG8m0iXbr2cz+uKnezoaZn2zfG+3v9YoKW7Knb9KpAmWsvgzVZZRW
         apZOrHqCFPXOxQi1l//Ar0kgM9lSaZCNdJcXyXn5jDIbLg0Grf1cEgGIHEDCNNW7CU1a
         K1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946752; x=1789551552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/EmgsJxrD1L3erLFRo5v6HtacTKMKtvJ59uEs9Mbc8=;
        b=bn4ZoRdSJ6WSQSxmmS4aI6X1WNKc4SAdasooHtcTgTlvQNrSX2SICRw6bpX6Ymjz9c
         9/7SknB6rb4642+8+LG4sFZYdXsa3IHlFbrZzwPSwRmuqF/tgmIcgVjzzzybMSBx/3sN
         MbGCNI1dBOL9/EtLMzrTILlhGq7O6yFJ8Tb4Q1E9wpcLXZ9z7Hu8jaWnsQNPj/I+h8k+
         na/vffpJ717gu6pjvwJLx+7BgmI4arhIz4iY15fe5aMPqogGPtpa9cUhVuu7oRNxr1YZ
         fWsXhi+ysVBCJI0EI7maKtYYy4681L7KoISmkDtj1oB/DssY1ZolutZgv+uNwX882s75
         1VQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTWNpF+wgk7pCg+D9DCnATJnWDiS7BoD2ay7tiGqHAx5sm1/Ht8oRyOCtjVazNKtNoqVLxNdQaHkC5gl4=@vger.kernel.org
X-Gm-Message-State: AFuF++l383LYCvC6mDCH9UUU/BLvPS+sStyRt7sf0ZG1xOSGEHRLMfyJ
	T+qMIetDf6wTRTrZyR0hextJJUNedzEXMbCe8TQxzADnMaeX/AkHa6WTzG35tBeS+k1JK6ztZFa
	xijxHJmq29QNRdLyJ2qCmLBFG3Ewyo8z3bwlCbf8Ww758GrX4nKJLWamJCQRLQvY+8Ko=
X-Gm-Gg: AYBFou2/L5SdMS9M7ygzXL32rsiJ7j9zkgaxHtj1iXItJdl8lpLJ4TEJ+7tBJpgJRLL
	ageOdu5/NGDKnfl3Y9fHMFA0kTaH1+UE2MXFkqHKBx8ERi1nSt8tmUavQvONkaRLeiqktiYNbUy
	U6YBqeloLTbucq+AYHaGRZezBUGp52Rsrc6SynAsyM3ykBa78mf2hxWXa7EZrtl+IVq6VcyPPKS
	ifP6NYQb9MIPEuorx9aZS+puMG0UnAraLMbabp+sYzSdhpXN4HQnpkjgRdb+G0V/eqTP9+R0L7C
	gxQoxhV8DqevJk7yCXKzoVqOKJcV3EFvsRt5aWEFjQkkEg0S503fat6cPnKVERRCk06HLcZrqDW
	0schqaUQ0+ff29TCc8359+w==
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2182395685a.2.1788946747323;
        Wed, 09 Sep 2026 02:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:939:48e9:51a1 with SMTP id af79cd13be357-939916f6b72mr2182393585a.2.1788946746884;
        Wed, 09 Sep 2026 02:39:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6beesm6664052a12.8.2026.09.09.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:39:05 -0700 (PDT)
Message-ID: <77f0e1f7-ed6e-430c-812e-4eb316373937@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
To: Shujath Mohd <shujath@outlook.in>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa12940 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OxYfkThgsBOJW6NJDhYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: HKU5PzrVSmvvZj6N3S4OvMZrTUIqNLUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX2HKWKTjFdDrJ
 mX4S4TueDFF9EHWeNybfpZmUUAb/EEEsCUA60hT1pmj2wxWpDMXE/hFDuYczXcRHpXJ0TnJlGMB
 nYWY8mG4x52486UaMl/zupSx65M1xbRUTUzK8YOwGofm3lNKNqzaY1mGKi81OQTz6NIvF2kXbap
 0ngqM/2466MD541B2Vsm6uy7QJsncod6Jjy/Z03j9idBDouBjatkKiXqXW1qbqY0o1aNECSxWRr
 kwzIJpA2qqJp5h0dTXRcGlFhjxkgD48eOzg9YkCK56yID24YlAJNXy+RSk9UmxHuk8SFnzIdcTF
 lr5NP6gGR9FalIo6OgEtXYG/O+CdW+Q6N1a5SPMzMyds4+UOMCe3fKKKANx96leSSqZTIIQH71b
 oIyzWAyVQiYADh9WpqBs6MRTT1YroUnjGmWgV4lYRgZdJW4R0tk46tZ0HSaPQ6KN0BQfDFreMYF
 2x/J0XVeDUsxNQgDJqg==
X-Proofpoint-ORIG-GUID: HKU5PzrVSmvvZj6N3S4OvMZrTUIqNLUF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfXzmg83C8URD3R
 YblIqDV13OhhlZXyJMWfv9hOByYwyMyYqht2Ie2fsVwDhXp9gWTmHVDVYWZxu5SpkTXOgR186+S
 mowEXGNVmvTkc2uXz2Am1dR658y3sDc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090107

On 9/7/26 6:03 PM, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
> battery voltage and 4.245 V as the fully charged voltage.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

In the downstream kernel, I see:

fg-gen3-batterydata-akari-byd-4250mv.dtsi
fg-gen3-batterydata-akari-byd-4300mv.dtsi
fg-gen3-batterydata-akari-byd-4340mv.dtsi
fg-gen3-batterydata-akari-byd-4380mv.dtsi

fg-gen3-batterydata-akari-tmm-4250mv.dtsi
fg-gen3-batterydata-akari-tmm-4300mv.dtsi
fg-gen3-batterydata-akari-tmm-4340mv.dtsi
fg-gen3-batterydata-akari-tmm-4380mv.dtsi

fg-gen3-batterydata-akatsuki-tmm-4250mv.dtsi
fg-gen3-batterydata-akatsuki-tmm-4300mv.dtsi
fg-gen3-batterydata-akatsuki-tmm-4340mv.dtsi
fg-gen3-batterydata-akatsuki-tmm-4380mv.dtsi

fg-gen3-batterydata-apollo-tmm-4250mv.dtsi
fg-gen3-batterydata-apollo-tmm-4300mv.dtsi
fg-gen3-batterydata-apollo-tmm-4340mv.dtsi
fg-gen3-batterydata-apollo-tmm-4380mv.dtsi

fg-gen3-batterydata-aurora-tmm-4250mv.dtsi
fg-gen3-batterydata-aurora-tmm-4300mv.dtsi
fg-gen3-batterydata-aurora-tmm-4340mv.dtsi
fg-gen3-batterydata-aurora-tmm-4380mv.dtsi

so XZ2 has 2 battery suppliers, while Premium/Compact and
XZ3 only have one. The -mv suffixes I deciphered to be tuned
settings for various aging levels.

The BYD vs TMM batteries on Akari have a different capacity,
and public spec sheets match neither :)

BYD says initial capacity = 3056000 uAh
TMM says initial capacity = 3217000 uAh

the spec sheet says 3180 mAh, so presumably the TMM one was
used in all models

The constant current charge threshold is set to 4370 on the
-4380mv bin and the DTs don't clearly specify a lower bound
(maybe in the qcom,fg-data blob?), but 3.4 sounds appropriate

Konrad

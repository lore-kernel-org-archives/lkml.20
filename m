Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D9560AC7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092311; cv=none; b=FBCMhXb4JPq8FEsfZjS0LJmmgZxWvBfgl/vcQl4ZnEs+FxmO75fwaRYYTKlIfVd9QmoRyAhzX7HKoGG6YvkqMDV0ZyeU3Kxfwo8QsImBCxJVmtWCy0OXTb4PvVdLeMdG7NCI/c0F0vW8UrpWdj8qYJeYnWAqn/dEn/HCF91xiug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092311; c=relaxed/simple;
	bh=h1Jirh2njNXWwpEhevaaC+b4awoAc2Rjo8bbL4rz7r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzjL3VeyjZGfBD3PJvNsMsADSyFA5sYSsAJL0gISILBaWuG7bdJGeNqDUe9Htm7nKHvyi7gvCFpOd8qRgeiAzEXFbdIvo79DqM8DIMNBfIc1szODAjeBKwgqogf6w3sbW5EowcnYwmdObuWopxF95kyiiloqnLjBmZYIq6Dhls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7JebKBj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgE+xdf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7JebKBj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgE+xdf9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjotn3952905
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=; b=T7JebKBjMDSTjcvT
	jvvm6qlOAFp3Opw7JH9XLLvMpxwQ5Jx8SIE6WCmEtK8wAZHPVPkKurHVgh/qpV2o
	af1yerBOqUz8i3e4pe+Ia4j6jFrQX91Kds7/kehSZJVYzUc3KJgQoWA4BJqL8DDU
	z/NSwxieaNJhA9DuHu12joKB/Abvrn9nXKbJz2jnstzcVS1uO+Pq8nJbKDDId+Vt
	2YdLVB93mNnV+gMqTyH0I3xV7VwXGVrJ1jvEzXeu2bgkYHzCycNoSkXBnKy/rUVp
	ht6KQCMYQTaBvyEiZ3nLCL3GzwTDag/ZwEzA/0sOWBjZn25Z5QqN1v4zd7nnZSyE
	tXaQOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqbd36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:51:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106a836457so56946d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092307; x=1790697107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=;
        b=VgE+xdf9DIjpZNi8EZhYGbKI/PkBnvZ39yh9RnOxL+zcWVL3N+x4EEUekCfm7oggpe
         JE1SkLUftYfLDzJXbJFRNv0+fjYjO5sQlD5yNfwCjxKv7d4ytsdwOwtsKgG322VgYECc
         5Qu5AG3/4vu1Ru+fieoh81eaS428F+dyIit55IcC2fcHqa9owTKsHJbtp3KWcCINQNFx
         fkEHndar0VGah3FuG7XOXvAyj6NaHBgP61/Glgam1pu6vbErJFigOnTLg2nCoMspzp/V
         1TsBDkKzp+fgaGLnRwCbn9VO06HNwf1ZHQo9kKU68h7ytbzrEnWU8IgzMGJ5JnmlcH8y
         Y+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092307; x=1790697107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=;
        b=lscU7d44liQ9aH0FIdEQkbxU0YAsVtYHY6ZaJ3XmlNew4GIF0+VEz+FugR48adUpNq
         HlSmTCM8HegBOgk0utoYh8SjxZ3otb6N99W92S9zgl1i8mLNncdDuvcuuBSZGn2eOOAT
         857yZt9aDlI/ndED76ywQlyXPpzLvYE3dhYa8JVZcoxIZhdY0QIEollbgBm63GKmugwH
         u7j0vGfwPAnoSyAzNhs+PhA3MSR+INT6QnLaa3YVJtnCeSmaEPPffPB80e4ka2YHZQSX
         zYP4KCuPoVMU9649qvrDMAqiREd5KdrGyKQxu+FV3d2dz02ICcgsSgWflTn/ylrkbWtV
         S2fA==
X-Forwarded-Encrypted: i=1; AKwUvBySdss0T6I77WtwMLr4sSErrIdkwJzqdjyWLgDX6U+EAHE0Z/BP/u39XClxDZQwP2RoeBQHNwhDlwkPjwI=@vger.kernel.org
X-Gm-Message-State: AFuF++kbVBA/2jK0JeEjHbWiXenaoQ+FEJWq5nUuWe7d1J3OeViMyI3i
	3hBOAiM2vK/o85fDdpUghBgTnB8irRuwHyn90cb9KMeN6/UeVoMrK0JiNXXTn6CGj630+ybxsEC
	eF6qkRBF//eplfDpxCcs0MjHDvrAniJ5wkkxr2QoA2YBdPrO56SC/aF/+34VbCUhuP5Y=
X-Gm-Gg: AYBFou2BoT9XUJL8cdWQFuyt40L9FSbMMqkPPOlsXUCbiaKY67GEk2OgHZr1uF+8Nnc
	dWY8me5fCv+37GwXZuFmDc5n4AUEaj81ATnyi9M14QOI035+iC79RHmdCqiwzUwBRdGjaLIkKwV
	GE11PGmvJMhgRDWxu1CvMiWjv6qaAkQ8uv6IQICS5+z0rceTOTLKM3Fj/50OvlMDDTi2FgwqXpK
	47hZo6HiZCH6tdbjMECMbD3e2qJldVmgbR/K7eVY3AmBbQSHxVZYugUxqW1CY+Lu2ATQhMZZGUr
	uZTl1FfszdunB29i11RryVJXmjn/NGilwXppXZmSPsdVa2rjpMOdOoBe5FmR7wySzDoeW2Z3BOl
	YSLLvsbZAJRxY85GaAa05IA==
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr62342036d6.4.1790092307324;
        Tue, 22 Sep 2026 08:51:47 -0700 (PDT)
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr62341686d6.4.1790092306971;
        Tue, 22 Sep 2026 08:51:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440db2fsm1379520a12.3.2026.09.22.08.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:51:45 -0700 (PDT)
Message-ID: <29671684-020d-42e5-b7e2-f7882fda5ffe@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:51:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _O2MnK__8KPun3asOAyIA_1BIox9GrFF
X-Proofpoint-GUID: _O2MnK__8KPun3asOAyIA_1BIox9GrFF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX04TZG7+VSRaA
 gXMS4mRSoc1eWvzjOqWVpqFFLQxX+Zdefj9oixvIgnEwHzDCY9NeDx5Tg3OcaG59pkkUpZYcT0d
 v6390PtvnkmbUcvzMPGjCkoSL8V4GqE=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2a414 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX+KoTx/P1JMk/
 xSGpvyKUuX3MOaKo/yauIx7KP1hBXw9TDn+cR8DQF2Y2y2AW1cBwq/T61k4iuuSeb5dOhrLP4YI
 P5yuMwg3mvwDXtfPZshlCJQ0PE6t06cpNjaTaNRxoNYv4rU04zFcXLPP678QLrHckVfQUjm87mY
 hmN3MysNfmsOHdnszP8RZW57KAEgwz6cljqpFemqbcE0+OKfIfAEN9yIFsOC0aGfKUF1dwzqsuS
 Sgnj5PO0tw6FMhrD4hYTVt777YK5EJppwgk65OIvmj5pwXHwfqCHwzPHbQR5RftEDsrK3vd4NqR
 vt+IkLQ40TDM14+GafGSPQO/mtlPMOHo/KUwg8A5D+lI8IQqLK0KRm2UTVdzxdopMCxec1qcTF/
 LqTvIX4dmCZ0bqYkWtA+lREDRIoar7NHrgQqxI078WKzeJBmYVgUNVMRv4FSDAn0BOEF5Z0FKgm
 dbFx1SeMOVJKTZF0ReQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

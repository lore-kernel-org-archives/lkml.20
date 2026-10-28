Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197408;
	b=3iQ9uJTUYrg81U3R1+AVoaP9FES1M43VZD1IkSvNPk+l9u2viEkClhg9w4KDoCFTcxNq
	 q+ckY3saH6EIJRbOfucisVFM82IbzqJymv5XE+DEgVEgYhg5kG7jV4IFCm9eQ4hCWF5lA
	 EliKqCuACzbTXqXAUD+gdsZt4WilOwZ4gAjhHwBMUERV0DbY/92ywj7nCR5mj6oO2HnJn
	 O6sf7CjQoDYsskRQKEUqpNf7TnoadbJlDBgdJe4A2V7C9Czd57Kz11gH8kH9QcMQ3/w1E
	 KVm/xRfoZOltFs/g7R6xBgRXaP2FLJiEag3Dyf7nTVGoBdb36qHsvigjWe8l4Mf0ogw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
	b=R8FoZzGYYl0G48sV4z/RTw1TnetTfbnI2XDymBVuaGBYswr1AU4Z/Sm3cDhv503cTwTW
	 8tmT8SNB5hJvUFLtqnhw1qY854FdbnMmgr/0lVStceZwutojJeZsSbu9Eo2HCUEjP0Fjd
	 fRIxnLoYwFLcrslf2Asc7nXgpYWM4BMW76rIEy7fA/FMryFGf00xuwG1S9PPxKChgFhEa
	 m01WBhsfy9mbZb6OrFhVLtru4QlqUeAp0rWbnniB1VtoUzRR1YKT2GuN6wuZNKB2EJOEZ
	 7XO/WRNPwyujpdRlpwaSNpdhJ7wH5eecJ1P52oKn/gJHI0W3bZlecX/kOfd3r0b6LWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wt5Z0Nf9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OvHHa1dC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD8260A2625
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD8260A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wt5Z0Nf9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OvHHa1dC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe49Q994733
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=; b=Wt5Z0Nf9w4m/p01v
	hCNgRezvewHpHBHj+9SM1eZnOUB6+h2WjJ2GWPdWV98IC/fqJ7yzlME+Lt9jafI/
	NQnjqsrvaY5oCYriuWpwWrfVx/3SeQfXBuAKHINyiHyDUo58EE4PsI3KBh0H9QUQ
	SuljY10Eo+eOzRbwgb0FsfQHLw6gwInFt5EkMsE1jTy7tSAi7bfQw3qqcbRQXQkF
	FoWexBqZ9Tlrk7M4/g76Uvv4JO6lm0e0nXKsF3ID0NiYjc0GVsiJO0lx/gBvGeeS
	k7bLZGQtHRHu74TRnbz5X/clQ3AU3BEhGnB/VZmsxTYzCVslAPlfT1pjCG+5ew2x
	pXHNlQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttftw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc59bfe25aso20259137.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197406; x=1793802206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
        b=OvHHa1dCkcKykwMEfTAL8VairYPRBTFDArPU3fLKtiBRLHP7ZYLltu5KZoaJHHgHYP
         R6cfOHiE1+tQ6cMpxunIojHqRm26PQLCHgCkElW5Py/gFf1FuvEne/3WYE64mMaGKHKR
         2JZtpbpykOe+EYN91PEAWtRUmcBEPVoBnXRfuYmIKnJF7m7yP8eIo2pEXL9zGjnrO1Ua
         IYcYGv7ilb+Gnf14CB/NfnCFlu8taRZiRouQRsBQ6fGsnjRRPm6BNvQMz8zYiBWCo9Zl
         VO5OtDO0ZX8N6X5+E5ZVHQV9hpubR38PKp8dcrba3kE6+B2PYhrw6VXaZV1iFTar2P29
         rYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197406; x=1793802206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
        b=hAzBcF7TbqBMf2pI+yDeRB9pVnBK8N5L4Qii3CoqRoFC0InNy+DKQTpNUdVY0RjzFM
         P2dd397QtKy2G6yntKqfEmc1YeGiBCd4hXrlWBBsAZPGjmxYo4tpXyHqwbWh62anQ5r1
         Xp0riqOXDvxsUdpu9pQWY6lLSmt7B/TtAJZ5XL82QD+z49vv71GOxGKWzecknjXdfMZ4
         YKzrEQcbNTYKKsmLwASfkABHdj7NGDWDdc40cTovMIGwYwe8fWkty0jIr2JWHAxKqsGG
         KosySjtBVuaFlqSXPWsk//swODcb+UhFCdo/xamAkhpItqDDUTZntvH711La46AsRovO
         9DBw==
X-Forwarded-Encrypted: i=1; AKwUvBz+C9yQWbg7kw7fvhU2khJmNarv/z0aaNZaqTHCFfgwD1o8+Ejvc5y9lYpmWqssnQQm+8mtDF+K5UJaWz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsZ2xTHuHKe4gFfDq6o/EuEl6TSoFVspaEn4NH+WQTcyw1PQVC
	2uKnJQg+j9Z5MgH9/eaAiCd7HjFWcBfYj43tgUXd5bu0RKC5i1lzvdIf9+xzVGEpcRx7Plo2lKu
	7fupCxs/8I9NMhHkB+kGpVrPskbPUj4r0TroKWQJVjLRFHwvE1Z3a1v+eqIDGyAqsCFk=
X-Gm-Gg: AYBFou0Px4HafcAwpNPEy2joE1AvD28lUXFsW+vDUKSlaYB0/rf/Qr6GqaGcLDTh8em
	J7tlNi7otqVMnxtn0IUfGAnlo1qqOQ0aQ5fozEAEgeOO9sfB7Xpo1QwxAxsGjj2Yh7DzSDEsjJq
	hU3Ye2vd3uJvqDwW+NaaNmSY3ej3Zj3NRAH279rqFPRC8pIG/wwFmkpJZHXTQe/PW+0K+0Oc3BP
	TbDYJlmupCa+lyqVsSae7zJXeIanPZHPtgCJxjFyvUcYrPX7xiCepQVtEt83/TcRB/t7eASBQcF
	WsiliwZzKtxzMwUWL1igkuQlQ/mRBSJP4my9G0uR7sg6nZ4wmptU+j24RpTf6U6IS7XjsUZHpTg
	Yi1qFlAFOTK5xwcapJ+7G0xObZuFl4jsmsuvFOTBhzL6GQSvZxWqaWCoBc0Th23FRP8iWi4Y=
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1515580e0c.0.1793197405405;
        Wed, 28 Oct 2026 07:23:25 -0700 (PDT)
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1515533e0c.0.1793197404874;
        Wed, 28 Oct 2026 07:23:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984e9sm603752366b.74.2026.10.28.07.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:23:24 -0700 (PDT)
Message-ID: <b4adf2b0-5a6f-4f87-b6a9-ed32fde3bea6@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:23:21 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NtanKgjMj0PLUWK_qfJxNzgfAcpixkqQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX1Kc6BBpqdQTc
 zXomyrIAA18dqtXkxBeuttte1EzT810RI5SM20k8f71kwyfsiTHP7RD2P5JKsuesPGFsPtMtTpZ
 exTKZma/g9j6jit1vwrc3a+GS4b2bXM=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae2055e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: NtanKgjMj0PLUWK_qfJxNzgfAcpixkqQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXwdfHD+Dae4+3
 WvPeFq2Fl2+0mPBqi8ScsxoNLjoJWxMIwbJAsZH+c50OIqKtPkOYvbU8I7LRmYpal/OuI+d6Y22
 6MspfnnbHesS4ElZHe+bHKOEO4iMdvN0UC+fjmfyF1B55HZmuF8E90eTcr0ekL3eiZcRd4TlN5s
 JbcYW+Dz+LzjC4A3Lz+9/wKkrPKmEkT55navAKCVBE1ILqUk0/G8mBJv/y/JiZfHgBFZilFAKbx
 DD3ODB3aLphZDqMrD/CDBy9ZTL6162PW73PgfUqpgFrz6RaVYgNA1Z7EJcw93o6LoVBGTFZ78kZ
 w9XsbJ4H7K5lrcBLgvlE3HnfQkQ+a2Yg5R6UKkQZAzxKhI7azpvXAnsIlDK+Rx7NTDyU41tKBbI
 bwmAmDNUpV5ypu7BGaNrfKDmS6J7gLgRTxFN2u+nxftIXGdIuLPwPcpu7Z994IT2qZnWeLfyY/i
 heZXAYnpMCthGn0zBBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057

On 10/28/26 3:17 PM, Loic Poulain wrote:
> Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
> nodes for thermal monitoring on the Monaco Monza SoM:
> 
> - pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
> - pmm8650au_1: SDRAM thermistor (AMUX6)
> 
> All channels use 100K pull-up.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD4438DC68
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163477; cv=none; b=dKXtDEizLygKW5yxdWi/eGucUA7PZvjMAyLLvw8R4paXB22Kw495z7BlKfpiTcUJfB6gMbE5sf3NuMwilirdZdO5+1mYz/NIJqlkd1B07Myo9sM67GVbTl89kRZnd8/1Dx6heVAoVgJtVpIIyRQ/jzoNOEsLPze63e3+CXoBOOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163477; c=relaxed/simple;
	bh=7bPVnZplLmFVqkDLU3WnLpK2QvTlhSBgRlfPuPaanKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jiq7pGzHU237dMzInNJg9Q1Smmh0+svnVf3quZ9OihuSrUQnQJ7gu62HxneW4BezEuCDjbPUxRt715xWKQuvilnGxY60DLbGQZVatekEZzgTCSd88mw4bt7SOPo/Bjz2jbVH4FSWIt6xo5cPpiU88NCenYZHE+DqsRmklF6sA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+2eqF3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1sIY4C/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+2eqF3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1sIY4C/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6ACN3006159
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZNacfeRWpMHG68hFaQoKsd53l54VClBNFu4uH2HbKw=; b=l+2eqF3q42+Uttmj
	E9iAkzhIani0xzuNa1za8GMIsHBRkxXn4IPVDkzQDfDwIDTaWIkJp703TxAumlXa
	81RsgIbkCaJAl0DVSGyjfQU/JTTx2vsvO+DunyCgv5c3h4Opg6axjGEmCJHB3VON
	nTqRGfCFQhTC6XYF9tFrMc5+yhE4QPamjgB2JwKC9vgfJgLlzcbYg/yuCoTvq2PA
	OCC0QOWZU1x2n9oB3+MLdoKBVQu6YzPVe7m/qhL96kHFd8IJl+hAMHqkFRGyvZmS
	pj8AT9Gd+/MGug5+l/KT7uHMazqYP2Wa2dv2v0Y5wnZ6Ch/JoJLzJOUc9CHeyC8a
	laZjpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa4a6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f0aa07824so867685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792163475; x=1792768275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZNacfeRWpMHG68hFaQoKsd53l54VClBNFu4uH2HbKw=;
        b=M1sIY4C/lKXo1/vD+59Ep0rFUtqMkRAT4roylWkCWEv8iJRly1180xuOmpFVkyth/m
         WeqaEMrz+is9Vi7TyjYFcutNJa6zJ51F+C0a2VkWj8IkKdigaepk5VabdAOModY52023
         P0+KTmXTCdz7MWxHnUMIRsBqc8AfjZacDVlZxzcr4gWLeJo3nZcBug02PPZ1NGq6MHSQ
         Wh1cok5xechmFPZrpZm+mlMhtM4hbGVAbBuQ7nLq4JO9AKgGXgsuWf2gDtXsUKL6P+Pf
         d3rt/17cQJRftFSBdtTPQ9YbuFqPMqUpcjIXHEXydWnlBBhUHpXUqVqZUrR/51mWAPvu
         g9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163475; x=1792768275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZNacfeRWpMHG68hFaQoKsd53l54VClBNFu4uH2HbKw=;
        b=Yv+FmWShz0oddP/dECjfKVat7C8fpoOajFTT9TgMn8ORCFZ84axa3jxmgONN85n30c
         vJ9rwJ2AJYOXPS+zCn02UVCUvoYcZQjKq9r463q0P3uFh7hlkddjfRLPoBCVymhhypIS
         AKH/lFKDhZ6oQkQUJK7CcV5YX85YvlInnPTQ2Fefa+9Y8JUZQo79IUMebpfiVSsmDWzb
         VB2hXOtTieuoDOYcfgHp8H+btY/PDS1KqphPPoR2HHowhIbqC95RnuDvKkArajK9icxZ
         QuX+N+q1q9P1gDCstgQgFJ4ptRDMeLq7d/qibSVnlb4i5E7AvwwJsBnvUSgF/CWAqo43
         Y+6w==
X-Forwarded-Encrypted: i=1; AKwUvByVV+ZUhAcrf/GRnzPBOLa2TESR3aEErqjriDfZt7J/f7ZezNnnKgpaKBxg7grrGf/aS0Fcrpnf0j/9+2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLeiXvZNAo3D2q+7WnwZOj9CsdK+h42EbnBvAKLY6PaWCzdkPc
	6B+r+WOkCpyf6dOl80rhY9/OcEXgz3YyPEgVTJp9opYK4mqfScYIMG0MmfB62OGG2KAT4AbToPT
	L+CK9yGu9bXGYLjycH2TvCqRZeR6ZungfedmfSHE53Bcg+ZHN3sPt1ynOVCXBTffB+vM=
X-Gm-Gg: AYBFou3Rj80g3VY5B3OFzebOPRIa4E0n4m9lBAqDmGG0GY9dtHqQWukIkWtVplSUuTB
	Sb12OYmjLLyV/pC7cEjy3YF+jPSHoM3slGisSF+b8NwSHwsMNaIvgSI63G0/7ks9LtUDM9IbZ8c
	SoXvNgOpIIbWGR8gI6Tb2MtrqCjndaxzw/QIzChQLRnb12x/T6m+s6v3lIJzcTAHZAoKw9+U5S0
	7EbVbx6tWYsmO7GuhMWLYK4PUgZ/if3WvfhmW5k7kTk2KHVrRiDSBjQ58pbMyVYdq2/2v4e8S8T
	GPmpvnx5nmZeMUtO1D6aAg1joqNAeOc+fSM+cEWKEA/BoBLy9r8T++dUjoN7Lzx1xtXhIEU1CYO
	M6GPQ9T4o2wxaB5ywCd9e4w==
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr16483985a.5.1792163474348;
        Fri, 16 Oct 2026 08:11:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr16476785a.5.1792163473754;
        Fri, 16 Oct 2026 08:11:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c416a4be585sm18365666b.68.2026.10.16.08.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:11:12 -0700 (PDT)
Message-ID: <5531e454-0d84-48f2-af0d-1ab34c149760@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:11:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add proximity
 sensor
To: Christoph Rudorff <chris@rudorff.com>, Linus Walleij <linusw@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261016-iio-light-gp2ap002-v1-0-7c93312fa8d5@rudorff.com>
 <20261016-iio-light-gp2ap002-v1-3-7c93312fa8d5@rudorff.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-iio-light-gp2ap002-v1-3-7c93312fa8d5@rudorff.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfX9z19NqRPo8LL
 s0IOwJokFtKGY11PElPQfd158xGOv8nvMX7vhooXHvkhMmIWPz1WXb/bq61s1ntAgVAeTvkrjZA
 XVCbcFmpgV30Jk9ekioVrRgmUo9frUo=
X-Proofpoint-ORIG-GUID: za3MWnH19DP6e0ZONQvGmEgEcDTMN6B1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2MCBTYWx0ZWRfX5SN0Q0QS4cjh
 VwJSjF3BdF4Dh7QdIj8y2S5788BHkjwPMweGSlPeMhhmQ1QSASIKypgQbxNFazGkTIKrDE+NQp7
 kyu/qhTl53K8QZxh5+2Ryr/G+A+qqLTcew9sU50t2R6Ea6V4niN/uFDADoLttYeN4I+/K9AQATs
 WxnM5StTEnbVp+2y0ykqu9VowtytfuU0t0qg9I2Li5fW9/3wW3IqyrAlE2V3gKPGHzr83tk7bKG
 PP1C7cL5WhydXGHTcrdKvHNKH44Vpa/Tt2gmfht+OQwUst0JGyvASnOPwTEWDylMKqGerp+Mf3L
 EsB2x+5xE2Al8FHv8fvowhwcRMejLSJIe7qmWTnsLL59n0M5SIxEei/IOMrjk8pN02hfeog9V2H
 mwqqaLyJIeDQFNawM8qT1IBMELTTHFftRn3rBXK/+15GSR5UB+6jR2/9TFZRw8U2VdSslb7X3TF
 8tprnFtn6U2RKM4TlBA==
X-Proofpoint-GUID: za3MWnH19DP6e0ZONQvGmEgEcDTMN6B1
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad23e93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qfT2Yf8mAAAA:8 a=FGSye35rWshla3B4t1AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=nKa2voRIl820JbUdVH2x:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160060

On 10/16/26 4:43 PM, Christoph Rudorff wrote:
> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
> 
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>
> ---
>  .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   | 19 ++++++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    | 40 ++++++++++++++++++++++

It's odd for the regulator and pin setting to be common, but the
sensor to only be there for one of these devices

Konrad

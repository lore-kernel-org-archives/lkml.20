Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018366;
	b=eDZiaWtk7CnQR+ZpbevYvPJ9VSV4nPLdweYzsTtQErm4v/2r/2IaFpoox400L4ljqLLf
	 0OGP1ABasxlcG2suRTuBTleTLMhkNfnBsUAwakulNkfKO+rCIEyBg0DHm5HdSdu8vb71N
	 1rj4vPCrRymUiRAMROSe/H/0TbMNKrhziQwpgkwgJ9/mdHykNBCXXN6d6X/B1RZTk43y8
	 jC3qL+3yQvtO8NMJJHTm7nL5P8L76mRBMR48b7VqTyIJvgJVH5QUwjcIm5JcfXub3pCBV
	 S6Iq0dHlXElo/Uwy0S3IyFrumGDzUDoNosYK/eQjqGiKvmxS4ZdyQCLvAOPuWA0HpGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
	b=VjXzSP+XL9Twa0yUDwxiTc8+Rw2fEpM2lLI4siAQRfhCHRhGBgULLw8oeCzUt1+sNZeD
	 1klLeL/O1m+5pScA9qvmpLtYKbCmTnqCYIQ4H7VUHxf51S9wqE3Ks+A7wGnuWfDf2Flzp
	 z14jN5ds8AYXU8DNUCrqYkywG5jWZN9LoMSn1k574v5R1oadgR0MRmieGRK/s8vc+c+qv
	 TYqgONfOf/edDsdmnHFdo5/Z6MukUEzVEK+VNSM1boGvhXZDaFx057lRuFVfUDZTmaHM2
	 kato5mKd5KgnRXC2IiHhDZGdT9UIvMyJ2AM9IT1mrpjLJ33ppu4vDWPeDenviGTZJ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WTzzFqLn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpZzmsqg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17571606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17571606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WTzzFqLn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpZzmsqg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1NU2732889
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=; b=WTzzFqLnwVYu4HrR
	4MHLjMicCThMVoWiMc6rYZhLuGFM6mLBo9ddNlnWGsbyHybL0SbpP95E1mk7M5v1
	fw4ZVK/BKbdUECrdmzG7FEA9dHYmmf85Sp4pAkjFwKZhHr9eE0w7ch40Ul2EezxG
	8y77P2R0QL3rXTjrAfsm6OZuNIjzqDdoMo5nMMKyvU4H29+DJzxwF7vN/GwdtC/L
	X01BZUf1AkZxpLKT622MCUmrZAFgFT/S4Hb48CVy/AQCAv/fih0hCLNRZhZqPUMa
	WmKHjE2XY+Y2cEB5kAa2dZ1G6IYLxQaIRuoVb18OnE7vv5TY5XYj52fFuEiae7Hv
	TH82qA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8p4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:39:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so88496785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018364; x=1793623164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
        b=SpZzmsqg9YEJN01lH7OxCQK5ZAtZPjABZnB2VQRFv88LS9KMIFCX0abgwwCi4xSc+r
         VuO10VENHsaRNe44178uj0ntScXSeqKJfTWEXj/Xo444hdgPHAKUN+yC3RjYd0QtMr2u
         YlBEAygME3EOEItCpnrNSmtR/Y6QI6W6w4clsSHW/AP77LbHJBp3gUUiLrqK2ib46xOS
         6if+PQ+e9x6FNLge1Q/aeMgOSMZrqzVgN7DEWATBmvPPv641WkEBHWwbWYeNZjlYOi0r
         phWY+cti8mdlBHlCJanxv2V70ZM+4qo9nnjY1Csw41KQRPC+67gwwv/Qjj1w0iFt4MD+
         JTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018364; x=1793623164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
        b=QcpSgWkOeVsn+OD/y/kOY7QaK3cqKyuaAphU6bP80YNKoNtTlgmehlg9++eZ+UrIc3
         XjuEtpz41WiV8Y/a+3XRnLW1QpjukWe15z65RQPlgyFjBVqJfRiVmTbtug8aPqPFEMD8
         gXdYYnc3Dh9pKOWFParpm7FMvXIYTyGCjEWiMgjjEXNDT7SQPW2GZE/CfY2N8HjUBxVM
         7g42nq2rY2S85JNfwLxn6FWYr6hVDNPnTLDfz3Siv3szt/H4ForfdEyhosvJUZRwaFAw
         qw0KHHVLA3vgU8kSjSI/iFTXfJInGp1UbZQLUZz6dbbabeYHZD5h0fmy7vc2L+FlbVKJ
         nEzA==
X-Forwarded-Encrypted: i=1; AKwUvBzjpvaMPZDKWUHUxQmPhRPFf4YH5xJ4gWDT6a5Y+Av52dAcobKrcUfteAlfxjSjg1nHwLqG0ukIQzn/UvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH5Vtzy2OD9thMbRTk7Zi4+R/rUsBntbTq1WjRAAO/mVITmKwa
	zuiG8RuoYFvFHIhP6MyJt3rLDUjb1mKP39SlTSCxXhMRroRBWVWWE+FX08fumf8+1FFDLY4YOvi
	cjnNH6HijUE6zFIA+m5CAy/8lA+CHje0Id0QlH3gL11P+FqAPy5mLdx3j1x4nfs/2S2s=
X-Gm-Gg: AYBFou0w8929L/m5TBY07c46wMyFYMn3MaRuPrHRYKaJJOZFL0JhMXiDwl4VB3YwszA
	WBnUhdpAyGhlgsdnqFqw0ecQrjw2O9EMyj0r9XOzdQOTEsgtMpngz/eNLtDp133yZjfd+gRMX00
	taXtaucC8K5UqqmWopwObaxu98GiXxYy4PugCwOyqchLmoxdSYXb0Ci/aWwkGxP/UeeVdvNs+LE
	rICRp0BX2MfdkGiYLDj7DQDquZXZN15eVBPtUtLBfixRM/ySlmx+QjpBubRBjWwZhLrHo14l6Ah
	e+n+0PJCqFOlFU2sBk/871KJAC6fxV8qwrLd/J48tR5RLGQ94cyrBY5WaWDSySCRdwaR3SKjQGq
	P2dfFBjxsMVRchOPH5A0Ong==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr949470285a.3.1793018364137;
        Mon, 26 Oct 2026 05:39:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr949467785a.3.1793018363655;
        Mon, 26 Oct 2026 05:39:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9d459sm1530307e87.82.2026.10.26.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:39:22 -0700 (PDT)
Message-ID: <2c20fe9f-c117-47de-aeca-2641abcb4b66@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:39:19 +0100
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
Subject: Re: [PATCH RFC v2 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
 <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
 <d5d28d79-474a-40bf-b511-e20fb0897b91@oss.qualcomm.com>
 <SY5PR01MB10600F961AC57A32262D99ECCA1662@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SY5PR01MB10600F961AC57A32262D99ECCA1662@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX+FVEbb/9Xcws
 glMh2Eu3CGqOB7wmDGEbVIJ3kIZXRud/KWjorh1vky5AJHgjSxC8qrsuo4Qc35jVyTMUE/xBCKJ
 76dUjvulorMCQg9uqZ/5DevxoLjoIH/DkjyscPBzvzMNC8nrC+ZLh/wBeOnmMC34d4O+2aa1YY1
 7JrClv4SCiz/T8dosK7ViPxPIColbwYyNq1j/M6WkJZSm47lFnA8HpLT94wiAyNLRFUr9CgyMKv
 gku179remUh25RsKsTvlvB+nDXy4TAC8xoq6jRLjE4onTsPrF/d+I9fQcVbVOKiXSGoLRLBwezO
 yfZDD5rpxcjpGST00HcmBag1QW0Da4CUBhBUPV+GJMmoMhVT3OCQbnRmCiE4ZrfjVX7vTl/s62J
 BamrzkrpgWwZStt9b8a99R15SqG7+7sA+ztDQKeB5iVQk9XiWpJRNelsDEgA6QAPBUWx0GwVUYm
 KS82Okq2lGwEeojbQpg==
X-Proofpoint-GUID: NS3twvaj7pZBuBxubLK2QIYxw3iEHcFo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfXy1jrHWrnRPGn
 3D6ZQwqWTCm1zqRQDHnORksi7XIOEg5M8MUZuKIvesG2vmDr+5lsRywO3UMmUiF/5RhT71Cfg4p
 0y/R1WuxF5tEWLJJDvCDZfCpP8dFNWU=
X-Proofpoint-ORIG-GUID: NS3twvaj7pZBuBxubLK2QIYxw3iEHcFo
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf49fc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=SGK8BKh5EnIYygesR2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260050

On 10/21/26 2:52 PM, Zhang Jiaxi wrote:
> Hi Konrad,
> 
> Thank you for reviewing v2. I have posted RFC v3:
> https://lore.kernel.org/all/20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com/
> 
> It updates the model name, node ordering, common PMIC include and GPIO
> reservation comments. The cover describes the revised DT's bounded
> native core/USB test and the Codex/LLM assistance used.
> 
> USB remains restricted to High-Speed peripheral mode in this RFC. The OEM
> configuration retains OTG/UCSI role switching, so this is not a claim of
> peripheral-only hardware. I would appreciate your guidance on whether
> that explicit initial restriction is acceptable, or USB should remain
> disabled until the dual-role board integration is included.

It's fine

Konrad

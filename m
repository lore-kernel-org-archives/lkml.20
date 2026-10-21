Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578150;
	b=RGzL0MrCeKRvIyXkiCIc7yIsIxXLmp1mSWogADnrlx9NY+KWEO9OCGAY5zGMrpX32ssK
	 gH62E7LgXNCgS525IHjffQgEbs3GT6ScofT+lNx/nimm5mYtoi9wmorzJ4p8BGFW7Z4p2
	 TViF6RdkWXGkyPv8/OHY+/+PJ+Zhi+z79TV9tF4j0k9uGZAzmc53HC2z0zaARvpyqVR5Q
	 yH+93x6KXYWS8eU+stKfW3kjwuHTCUOUU/hVQt5EjvM+NjUjpEnR1uL3SxzhknH0cddF+
	 tD7yGIdB4mlj+IdnuzvVK5tGG4R3OLKpNyS49+1f6QalWfT4g5/SKRTSgQbl1AJEK/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/5ptcCbI48PEs1dypq5dA9saJSf1Ds907jkJ02bp9Ow=;
	b=JuDpYkJ1ZROyrPbSJrZN6UKiXO+CeI9wr2EqYgNploft+UbnNKaou/8twwZiozO9krh7
	 jjEI810zd7U9abSqoUi5omKJNv+0uhOeeBd6MArChbjvoIpt6wzEvU5wjzmfrj5i+Nb7X
	 73QLzYjg/ex/5eRG21j9cWVU9HDaZvLORtfmgc/beD9HWMi36zAbBOwGFaVe8Ystjf7d0
	 8jIsopOFXxlz8Fvy06g0CPzrtcpyUNNYpI8mUg30lV5wJe2YMSxBK9iAVR9GcQKVQc8DF
	 2Sk6jZ9605Oo67Ayufr6drvyyAlRFgTH/VkUwlFfEmSQxNYo0LYRuc7kIf1kLUghMlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OmIf+HU4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRkh2tiB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E835B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OmIf+HU4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRkh2tiB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5k6r3015981
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5ptcCbI48PEs1dypq5dA9saJSf1Ds907jkJ02bp9Ow=; b=OmIf+HU4uVLVDT6h
	D2e2dHwUZq9tStLrl+paYBG1CBR64UaBXthxFxFA/5Wi5i2sArXnP9vrEYSVFwJ/
	OJORzN4o1BrjlU3t1m0M4KS3jHqnPutnEEru8fv6tGuTojdA2oqzwUaiGLf2436T
	AU1HGF80OAFfhrAlfYBO9mBeDhjXIO8vAUjAeY87rfKpSmQmta0HrMxdij4D9yBh
	HR3lcbklyX9vbkpxZmDABxRET2shgUVgNLyUusmulHu7lIh4knmt7e4vf0JYL/FH
	ZHN9YmhfMA5dMw+/tTjpSfpqWe5hvvjgvrP0ddVtrhszwvgZnUQ5Qa62QcYbpvBm
	VhyMRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78jme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:22:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so14379585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578148; x=1793182948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5ptcCbI48PEs1dypq5dA9saJSf1Ds907jkJ02bp9Ow=;
        b=VRkh2tiB9/aGF2B8WfBgrE6k5nqNmIbuUYKKJLVipLf8BjhsEI36RFEkABFLx9DTCQ
         LUUqffAmNNhWlKoqQ2dbgCeAVjDB7viD3BeuJwiARGZc2NdjQ50vc9EXVFBTxQKg4kVP
         762nDYA8AbHX8x4Z4En9pYUJvuW5DXFAvrri33cOMtEFZabQL+Bdra4iLG0m/4PQp8s+
         DkISJTRZySsoHBMWNTY3wxJ/u0rnI8Eu6jL5PGBRBDz7GmKYUVpsWFTPkAOByFhtRGDi
         EReli3SAQS45yGnmd4wWoPw0E6n7HF2/cjHcYJKRbm6CPhNE7MQc/s30YRjyBhm9babM
         dODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578148; x=1793182948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5ptcCbI48PEs1dypq5dA9saJSf1Ds907jkJ02bp9Ow=;
        b=q5eLkoxbtT+AHY5yOGf++/lTuflkA94DDrQzRj5le05PVuIQX7VuDIbThvis5l6a5I
         fkGZeLGcKoLO2234W3cCmrpzLw6yqMDrwV2wPP8Cf4OJx1wmF4K2kFtuKwzt9KYfBihR
         +uuFI4kdXIfswS/R/Zz787klrooYdbRr0SCmdyylCEP3RTWNOhw4/aDKIIL8j3F5YjSg
         MpglbCjaqSKDYtg6ZKT01v5/db0mYDqBRUwRJ8at7+mlOlz4m4Fcqob9rlI3++wMde4K
         8o1E+8oNagR/ZkL8eNznNz9NR5AoQvAFiDXZ7f5sw3EShw8ZgvdqW/f/aydNFhEnMvvU
         TetQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2ka02PFcG+0XRBKbwSVyC2Omm12b6nd/UmSEUM8liMmd+5EVDb70hOMZofTMlJ6T6ggjpUcQwMYg4Puo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDhmtFSGk2158MpAS7fWg1yIfDWIR8mlCyMHVr5jgUgmztANOK
	+cY05DDc3wTX+oHB0YvbYIff3Tiv0W8XchMdjlH44N4v9aI0SC08zau9cJrirKGCrVSO253brrZ
	GBbyStpIPuhNaBPuebp1wR70r0EA0GIKJbazLyJq4RTBJgfSjeVLfLXgbwzd9T+nCGx+q1yxxhN
	PnPUNV
X-Gm-Gg: AYBFou2NGAPKMSBcOPbuqD7gOTviMneYdSbYJiwERJ3ia2uwGQmA9bcXH5oc3FUMW+l
	DWpVBQwnYyAfiAFicxXKipaNPx7vJ9OuyBesTXQcZ9XTKoceMlXMYUQPaiZIC0vfLXjF0L17WWE
	HProlCdprP3pD94lKvEbKbogg+JQ04N+HHzh6xZqiBNVjoBY3SMEgwCswnqLZ/jLhg0+7V9AJmv
	i6RBgwFLsyFo/qH3sr7iYQxNtk1mm1uyFf5aPVPQMM9DUo7Z7vwO0u4iouvvgP72ts3JBe82DDl
	q1OTfPkf6C67VA6fQcL69Jsjs1EJBFevnYJzHpHnd6PLZOzYuWVCxrnclwvxN6UFIMpA2kKu4kT
	qIgc+k5hMd3Z7R2MeYOipvA==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr390504985a.2.1792578148147;
        Wed, 21 Oct 2026 03:22:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr390501185a.2.1792578147680;
        Wed, 21 Oct 2026 03:22:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403110386sm697576a12.15.2026.10.21.03.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:22:26 -0700 (PDT)
Message-ID: <b62ed7e7-a9de-4420-97df-5e4f73ccc768@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:22:25 +0200
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
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
To: Tianyuan Jiang <code_0002@163.com>, krzk@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tianyuan Jiang <hiez832670@gmail.com>
References: <20260721142147.1618-1-code_0002@163.com>
 <20260721153444.423-1-code_0002@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721153444.423-1-code_0002@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wIPB2eEAjzEr1-suc4IdmB89f_eTTYEm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX+7a2RqqKviYK
 kfqpkO8yqEy79TfLiCQCqyHrSrVHVwi+qSW+2ft7CthkyLqn1qvNeCM0Y42iHp+LhX7uRMgf6xf
 uTJXkfsGe/QbdfT7byOtJdtpDbCnl6lfqiSmWXOPVYomRLAfHZVbcpAGDhxchTSjudowBJ7/HV+
 kNs4x+ujsIGnZsZEt0eBCgno1a1gQtk3HzaGENHOx6jZvA+wu83P8QD6yoCN8A7Gu2zuNVzRIo0
 pEApp5fmBox+ulb7GGvl4jMwMDaOjRjBRnrY3jEMTOZSlktr67RejLE6pmvFpj+Qs7VoaTfjTEG
 rX5HvRXF3dOKF2+W+xutonvNSCS6M3bO7ZTKpl65y1pMdX5tONu1x2dnihyIstYPg9mG+pdJCIW
 HNOT/tnumIddunz+PypIdqyFT3JypqSy8mWn0JiYRMz3KfAcGbxkSec0cqj+LhsDCZ/1DawfKc8
 Ts1P6LexwEUItgEZuvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX1hPpscvkBjly
 EJfA1gE0otsJqkv973fc8GHBnxMbly53SZf1OhLOz0jDGgZnnjTYeCaK9u2de6vUGrOxDO4nIOc
 LwHJMJYQ5YcHnEs3S5jRE+drGZ4wULI=
X-Proofpoint-ORIG-GUID: wIPB2eEAjzEr1-suc4IdmB89f_eTTYEm
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad89265 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8 a=6LOTDsU12QUmseQb8m4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210041

On 7/21/26 5:34 PM, Tianyuan Jiang wrote:
> From: Tianyuan Jiang <hiez832670@gmail.com>
> 
> Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.
> 
> Signed-off-by: Tianyuan Jiang <code_0002@163.com>

[...]

> +		/* Required for libcamera to allocate buffers when cma is used. */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x30000000>;
> +			reusable;
> +			linux,cma-default;
> +		};

If you update libcamera and enable DMABUFS in the kernel, is
this still necessary?


> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/sm8550/xiaomi-sheng/ipa_fws.mbn";
> +	status = "okay";

nit: please keep a \n before 'status' consistently, file-wide

[...]

> +	nanosic_mcu@4c {

Node names must not contain underscores

> +		compatible = "nanosic,wn8030-sheng";

This compatible is not documented and I see no references in your message

[...]

> +&spi4 {
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "novatek,NVT-ts-spi";

Likewise

[...]


> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +
> +		local-bd-address = [ 00 00 00 00 00 00 ];

I assume the bootloader doesn't update this, in which case I don't
think there's a good reason to keep this property here

Konrad

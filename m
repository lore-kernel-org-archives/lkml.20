Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189061;
	b=yOcf22JLd1dgZEGuTkGn1gRF10hlmG0wvWDElXTjJ7sHfkV1DlzmYJ/2azjwZ8xz+0PD
	 0o7NalDL2x3XfD1OLE4G71rUHLCQzPZ1OqygB6bXpJyhPMu1Ty8gIjtcR5cdWxBBhmhth
	 4XdsQnYm1TikZwUS1Oeu81TVqnY5jsVNsngzksuH2RhzIP+7vTC3Gx9CfswJ75rWu7ihC
	 8SgPDw1R1b25//exjvTiAcIKOts+Eolif9iG6TPyy7ZrlfaZ1GfTimS7HlZXm3wqFBbeA
	 nJiCIUDZrMrPPVSTOWZ1rd6pJfB5WXmhWXv+7nyaG57at4nn6s3KMk8vWG0Np5eMXhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
	b=Ve7uvoHSWV/zWRz/MXBCLeBTDtR7RUAB2Y/d/3GXSkQ/Y8AsBVVRVpWXJzI7lRKeVp3F
	 nO3pj3iK+rM89CxSN7aN+iV5KdvPJVgccnyZpxFRvMqEAf3r74GS9p+cuk05nz/s9xYK7
	 qUZX2bms7ROXOLk24mna5FkOBLnvwMkfb3Go/nSeXBuzRsr7C4mtZe4QvGBkISKmQFDKE
	 NkkZKxEPU8UeWjP9jbH/nlFGhrOf5bnr13G2cNGTmxVgpg2APamYLrdql0d81cVF6n9ZH
	 ekuzPmCezQCMRLN2qZRxiWMoNHX0wxUlr4Ia77g7OcQm8Pel/4sQZiPmMoIilAG7Y0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6snvN9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5mJLCG7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6snvN9m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5mJLCG7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxwm2105699
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=; b=A6snvN9mZVyi5Hr3
	iK+WpdiaTKaqYIz/umvVihpeIn6IgxYYRXTNYoKJT2BttvtFDgx8ecfaZyaa6Zue
	BFx1aULCEFAebWHWU5MWzEdhgyEEAax/fldQaIPi6dSEzwAbWfA0h8argoJf1Ywu
	47PsPHFnaiICKAjyrXrFhaggHHfvTL6eRUloYxZ1d2HjBG2XisYZ7QyvzjmRDdfV
	49+hDLPcoLHvqH0bjAbrXEY1+pNrIC9rMHUtVPXL82+SoYI6KDfHwUTLncUsZMy3
	SKe8jms6Rhvipxw5RTYHwkKd8I5t2wekF1V+QxPZsSY38hFxfK+B0ZCMZYfdA3Oi
	0hEzXQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pudwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:04:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73a1cf1638fso15840137.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793189059; x=1793793859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
        b=H5mJLCG7NgK9TgtT2xYPSGhmEEu6TtQWhXoTXS0hHL6lGk13A07MStjbUB3OQzRJgS
         SPcKp1VYBg0rc4Zud4a7HGoBgzJSVoOf3FNc1V/ftd7WRaEUXSbt6TvbjFwq6iBGEApW
         +P+mS3knShJRamEt3DHDPh9c2n7VVA5q6sskO/pEvjztEepyJtF2+uiEY5stWsMi9J3E
         PgcQ/7uFg9elf3As2bURA6Vs3mEy93ljMJydYfOXmXbcw4yNx4mmeiIdcHR6CadsVL/z
         xhKze9ofZLYuuSt7nm6LHJsBEHDEBQijgXtZGn7TZDxrCS/3d8IpfYB4SOgvJE5c+B2D
         b9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189059; x=1793793859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
        b=09LQwUgQ3gm1vPytAXk1kc4oTK5hfWbCY4V8R1s3/DNooM2HL0R5qrgOBgJP8ap9q0
         B/Eknij6jtnsLu4LJYDFEpSEfpaUl98v5GCu1a4V5fZ9yHjo5mTLjb5WsytmfCXNSrBd
         0Jhku5xtrF7JwThWEnGVDIvQrhusY0kCJPP8oPo4tmjQRSTuN7HqEKCROhRS/7laq3ZB
         +1bl3KjpubUl1sUiY/NjZ2UIoHOd1lWQ0Bn0J3VZTGd/w48lr/MuIR/KybyW89lfrysT
         r6kZCiBvfkL0rC+N5Ml4AUZRQaY2OG7Z5Pw3fDFFfAofqGWOXIW76QNVVVjSkvmgV0Nf
         3xgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGkwVntqiDYzpV9uyEYw5ea3wqoUZ7pAQ23kPHbcOEciB5mkLCAEiBswOcBZvcqhODJnNqhoK1Ut8PrX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwamEAO9J++rJtMMrvZOztK0ow6h+4i2WZiKTEF2kIZ1ilaPz1
	NW64RBNxhY6u2gmk/Z3RziwuJxjIQsDo390KteShAeLAZIZ0YhPsdqR9beeiWxTnLyMzOr0DFTR
	2RfGZkCnrwQeFPkODQbwHhOdrkEKp1FFtktJoDDef4vfzlxLI8kjDY2YCCnt3Rxbcs2Q=
X-Gm-Gg: AYBFou0yCS7ND+hH+w14e2VWY3q7ONCYSrnaIU1H2WuDBKeQ3CYwzPKRBRxHGSJY0xz
	KQ4HR7pF16KGP/kDzV9ZbD/JjjcZsNSn7ExnGLKrT9LebrJLVqEcxc3GVXZC4n959Ls31epH/Gl
	WsVu3MXB7nVFeREmFOBb1uDSkrnZIS9XcEYDtPd9D8MmvGD24heAaA3XQxt21KylD784cNi8ArM
	1j4tsiChLlgFNXgRCwwjCS2yGsrGBaS9dLvwe767tY+/0jLuyBVopDStRpSd8eM67XU9VLqj7Vj
	dTZFTktAj4wGGke+1993wb4daHT7YhLBHJB253TIOR2iZ5Uri0x6YESN9/MgTHEIn5yunnb3LC/
	TboqEwrlQkDXr1vgUIBrHTGkup6rRrDAAJzajxgMAIU/SbLaUTfCOH8k+KGC3l63++znTdPQ=
X-Received: by 2002:a05:6102:8482:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7d03a556ca3mr577574137.3.1793189058795;
        Wed, 28 Oct 2026 05:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8482:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7d03a556ca3mr577514137.3.1793189058217;
        Wed, 28 Oct 2026 05:04:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm1348803a12.19.2026.10.28.05.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:04:17 -0700 (PDT)
Message-ID: <96405224-72e6-4786-b13e-d73134b58ca2@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:04:14 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7325-motorola-dubai: Add vibrator
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Enrico Cic <enrico@privacyrequired.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1793135056.git.soyer@irl.hu>
 <8717c3739be282747cbef611d242acfc5a40656b.1793135056.git.soyer@irl.hu>
 <20261028-thick-gainful-pegasus-e1b430@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-thick-gainful-pegasus-e1b430@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qvja6YUqmI2ep7NVBEQzZQ8J-rpFc2YT
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1e4c3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=SrNx-AKsgThqvEfA3AIA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX4dhMTJD+336j
 XuFDFCz9gt0QX2Hb5cIRW8T3IB1iEG9iNPU3SVXuDi1LnYyztxKubrsSDEJ+ThHfxAAXExGB4BB
 SOSi4J17Dtu3sJdUt32rdG0Vq6OI4s9zMS/tQvgCx0T8yf/VJSqdub2dOo25fhWyB4etEcQtuWR
 rGZgsIswUTXlr8Oto6TLxyuUKbPUVNSJTL1B/fM+Ph0xdE3SeYqero3tafchm3nFSrgV/VlmIBH
 aji2M2JEoevqZZzLWBfMyFptR0IN8pEBhksUqoCNTDtHKXvWinQPlpKuEfD4DmpIS354vHK7SWI
 MOXc1Mzs6L9f7HGHudUB+9N98aAS4VAA+4deHu2OBQmH9z1t7gnWvWAB3JIjVYQXyU3V5SQ9Y9s
 x+KwCM5zlbHOfMHPUjBydkARNE4Zg8/z2O+cLS/qluiwYVHaaryLT+Rj6gvi5pMLktciYjbEtsY
 7Gu6NEtLgvElaZIWNOg==
X-Proofpoint-GUID: qvja6YUqmI2ep7NVBEQzZQ8J-rpFc2YT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX/T8c0CekWMv5
 alsb0gDUs5hpajFzncMtMSg55VhyfStdLfP5Y0FH21bIrV6qxExsgkFexr91ju6rQawleH/VXlG
 PglHrt6DP4QNNDxXJIlYGJEQk4A10hQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047

On 10/28/26 12:08 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 11:01:25PM +0100, Gergo Koteles wrote:
>> Add the required node for haptic playback (Awinic AW86224).
>>
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>> ---
>>  .../boot/dts/qcom/sm7325-motorola-dubai-common.dtsi   | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> index ef91986a1fb9..434846be51d9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> @@ -924,6 +924,17 @@ &i2c4 {
>>  
>>  	status = "okay";
>>  
>> +	vibrator@58 {
>> +		compatible = "awinic,aw86224";
>> +		reg = <0x58>;
>> +
>> +		interrupts-extended = <&tlmm 47 IRQ_TYPE_EDGE_FALLING>;
>> +		reset-gpios = <&tlmm 46 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&aw86224_int_default>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>>  	wl2864c@29 {
> 
> There is no such code.
> 
> Please work on mainline, not some fork.

+ please keep the entries sorted

Konrad

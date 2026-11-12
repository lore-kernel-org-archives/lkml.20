Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484265;
	b=NK3TTFUs8Rra6gZ3v9ZEJP98inR4Ai2LGRFq/gXYEIteJFUH6HpwSs03qLtFYXHHMOeC
	 QRIJhHm025qHMjBQELuOoFa8ab0lSz97wpyIBPyeorSA1hWB3ock1PCtWZZZv8IwOxa2e
	 hbsT/F7UJo4ssuwTKSq28D7vfRERHhsPwuhd+a+y0q7OUSQ+fVqsf3wS/k7ef+bAg14lf
	 uhr+i8jghzOg8lkGae7XH+KVvqFejH9zxXY/FCGJMeALG3QK1l1qS1u17uH0Xuy7h6FWz
	 IKm4BfJiyAK8LnTkg5MjZli3dtnzzSxSbBld1zPlgt2IDtdkRhWaXHAMdPkFXuToLeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
	b=v52WCdRv1D1uFlPdifFM4IILSUtqLwA2lMEv/WOnTf7YGVOkKVyd5Bjk3ysFwKOpCOge
	 3k8igU+Hb84OD1tijlTmjwnKSesmdKGQI1rTqNiFS/chtPfqqkB0T4DeB3m33wD+A1htB
	 F/HsvQGU0mGv+6Yc+TExYkQe5ryHeru7JS3ERTHGcI0b7bxXABR7vrinS/iQTwceQeH7r
	 A0juDOZ6+9QMclsNpXDFervcvNKPe6eIUcCwZKWNtP9FAoXwl9QFqr+iIrgoto1IeApJ2
	 ERYxb4wTyuPqlmjr1PC5X8MdCFPUdmoJ+i2m6/vaVIq5Wjipmax1fonTRkZ0zk9G7pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlaWAyPQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fepBsLRR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB0606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DB0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlaWAyPQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fepBsLRR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmiU32555149
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=; b=OlaWAyPQmxzF+Xys
	250SgtYy6aMFRtP5j1LHgvALDWsPYKUVXeW20Qr+su0AhQvDnkFNb+5slp9+HPjV
	aVrwn4BetA5ZLFO0jg8l2leJ6FyKquLHIu3ILvkkmMk7bhENPP5KYcfndOJJQgsm
	Jmbz91+3uGQSGQhNAVUfUWenSrL4aGD5r9NGcYTiUMdudWCGLXuu10VNODdQEYRA
	gmhJ62R6/qj5T8oQgn539euq181GrKrw8rHtu5fxN7iuPM7vg/tVQJLSutLvCTz8
	1VWNuh/HcATHzYugn30N7xGzkcmHG+Oqk2aoIlSVcscFNE/YFHDyDkZud1qeqc8Y
	3dnBhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j06ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8e16d22d8so66379595ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484262; x=1795089062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
        b=fepBsLRRniJHdsT45aPOuXmbekNHk8qsvgvpZevKY5rpsMdw1kISwUlpHBkv84LPFF
         2a8FUMrAVNPF3ggvQu9UfgAfu+ZQb2cA1T3bosK7TiImUip9gQPgYm1l/bCO41VPI0fy
         lBurt/KIkUPyuiaN+syhejGu6h5pFlpZPjVTsFpthQUf97Y+U4Aq4SqpEPUUOJuU3PhV
         S94Nxmn7RCkTEOdXAJK6FB8FbN8wIzUR04aS4JRhafchAFdVE6iyN0enuPCnjJGCbuLo
         fBZd+7yxoQMO7ARzfwBxPJwdfDJgNqkaANzf+vf+o+qGifh/8pNH5jUAzyvfvEvhGEYl
         hm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484262; x=1795089062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
        b=DrETybQ0v4j/riZGoMHIjUva9eTpIoixr2JYAFHs4YvgnSvR/3WfvOoMP09v7KfXI5
         Kt2BqUAxS+qHcT+MnwzTHVwLvJGJwaNS+GQPbFDJxNiHop9S8bDHGo1ST5S1KqGUWCCP
         Ww/JpCAAZiUWZhvhCgEBDWV3P7094RbGEwsMOBNg7JceLyepRAv9Ykyrdc5UTleQm0PD
         H2/S1XW8155eKac5up1FUADlD7x7cQq6YSSjc1865KJys0QFHXylbET5s29yLu6Yn2fI
         6bCkju5V4Qe0seeWIY1eoPZb6WqIFG+UvTWafGYKMH0Y7ElfV5cr7lK8Kqr7LLRjXkP3
         h7gQ==
X-Forwarded-Encrypted: i=1; AL+hErEiDeVDCaTCmrtUcUCiY50XVikbxcpMy1YmN9NXCa6n60Ifk9lSsdwY/8C8rgkmHeYNz5Kt4iZNc5NeOMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/femABZ5+s7Tgydi009R8V3fb5oVopVRpSVAOp3USqhFN09QFc
	kkfSuczzYnj7ykT2ozZ8LhDYULbbNAyheHzDaIeqFQKQLvBMrkdIokB2JWzZXE/6g2TgRfVt5Y1
	HFXI3MljWFEjGfIVApmxDHdlZW6dcmcJC95JVR/QWqa18BYedMBBqrwukoP4b6RpveH92ND10M5
	E=
X-Gm-Gg: AYBFou2GiBJaAVf20WPW6bL9Q2JsaVabL1D+Wrl+/7eNIztbWYICM2cwy8bf+UX8MEa
	RXjgAOpCNLIQb9qM0vAKKAhfjESIQ6VCUHB0t6r0iy/FMSPTIv7w8jJ9OSEltcr3ApKZXBMDLrE
	jNJu9vmMSw4urunFjvFKruCU0qPLqfXGM8uls8hWTdtqvl2Sv9/dt0N2kR1ShShK87jc9uLq4vl
	XFIQSvXOvdfm/BzgXaPkn70ZWGV8HQODvNfNKT5YKOQWxo6EXzqJFPxdpz1CI1diySIdVrEWfep
	Lus6Y6NrwgDiFHrmtvxbZXp5nqdLRRxGlopAeUby8yNnp5HJyM6/YZFi6ZIh6LcGf94LoETCrKr
	+m9kYpoTLHumZvlQ1/m+vdY8mQOFX7JSvRcHgOaSxMULIj3ojeJV9TI1Ta2lOUbC4xITOvuCpPw
	kbtb74nTY=
X-Received: by 2002:a17:902:ec84:b0:2ed:130f:869d with SMTP id d9443c01a7336-2edd7acd66bmr55971775ad.43.1794484262464;
        Thu, 12 Nov 2026 03:51:02 -0800 (PST)
X-Received: by 2002:a17:902:ec84:b0:2ed:130f:869d with SMTP id d9443c01a7336-2edd7acd66bmr55971575ad.43.1794484261955;
        Thu, 12 Nov 2026 03:51:01 -0800 (PST)
Received: from [192.168.0.111] ([124.123.194.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a415d3sm33309415ad.9.2026.11.12.03.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:51:01 -0800 (PST)
Message-ID: <6b02b6d1-1bed-4304-b11a-bf2bd3e8f852@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:20:55 +0530
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
Subject: Re: [PATCH v6 v6 9/9] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-9-2cda302237cc@oss.qualcomm.com>
 <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXwLFMET+hlZ1i
 NOzSog2Fvfdpi4Qs8Wy+/3haLKjLQdVZWJ+Snjn5/wk2cS5/xXLqcdGmLMDcQxR+hNyg4YT/muW
 dYd3wfNZy21xhrUdbtDCaL0u5bBg8Bw=
X-Proofpoint-ORIG-GUID: 6GQ12hGZ6r1y1OQ2sp5VwAAKB0aJ4MEE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXzE8/g4b2SSLA
 ZqdzPhHi4IZ1K6nuC88mBccdgJT29mDUO8nq9Mzt299u3SOyVHVIrkNqPTlSKRJQsH5rSA+sYJR
 VLYbxdpEAXpwDnsRXM0Tm7NjH65l9gsueisQU5Jmb+ula3iU/M9Kiz0/gKC4orfjRcrnzRaWb0E
 jQS5QsXGrIj+obrU2uE4aFUn79kkQhKhfUxQsqKjKoxT5rvLV5TtZJshDrV1iNWVFhns2gFV4CT
 IvdwRyj/2vSo8aCpe4AK4+AWky1ee9m+67kzxhiIktrbfFX/8Cgh/VLuNirL+IlxgMRnCIY05Q1
 fVS/zzI7GiXxjxtegwqyTJWh2s5MEJoQGlw4nPYAB7a/oq7yttxWOBoRy8a1XW7/oJS7iwB1emy
 ovsc4jcvtFDAmY5Fd4pjsv7ra4E6nEvc220VpKji4wHE1zRVf8yfj3VrFIIko3XodKSDrcYLAuV
 HwdCjZ7OQWGAoQaljjw==
X-Proofpoint-GUID: 6GQ12hGZ6r1y1OQ2sp5VwAAKB0aJ4MEE
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5a827 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=H4FFYLkF8j2uoF0yKy44mg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=1p-7M3_SpvjJ0s4hP8UA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047


On 11/9/2026 8:32 PM, Srinivas Kandagatla wrote:
>
> On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
>> version = LPASS_CODEC_VERSION_4_1; break; @@ -2175,6 +2178,7 @@ static
>> const struct of_device_id va_macro_dt_match[] = { { .compatible =
>> "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data }, { .compatible =
>> "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data }, { .compatible =
>> "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data }, + { .compatible
>> = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data }, { .compatible =
> Why do you need this change if hawi is compatible with sm8550?

Thanks Srini for the comments. Although Hawi can reuse the SM8550 VA match data, its DT clock interface differs (|lpr| instead of|macro|, plus|heartbeatpulse|).
Hence, Hawi uses a standalone compatible and needs this match entry.

Thanks,
Prasad


>
> --srini
>> "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data }, { .compatible
>> = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data }, {}
>> -- 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261866;
	b=X/y5rSHsh9injwpjs6H7P0ul/sG4vRxGyBnlvJcput/VLxLQk8eThOBgTNFRZUp+VRge
	 sWuTvIHb7mhXPuBU7acfDoj7OlmFbIzNM7Xbr665StQu3rs/z02TIVKV2CNw8W7oOASrF
	 Gt4QVUGkMXDFY4PO/Hsb2YP9vqBINE0bbCW468FsDV3iEY9cp6A8crux+jKKfQf1is7BD
	 RFj4Vr9GW0ibOEtuprnreh+V4T6UcFabDo6p1WpRY5ukSxZ8piaxzm5Fi1MLxhL7UY30l
	 KnMi9K+DD8QWtyMPjAkCk9q52+SZA/hFoYeniR8ip7P8sA6G52yCgBQkkyOARNJhxyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
	b=KXKAzowoo8VcYIkIOnTFopPMa7QO6lpPvGTnmA736WcHmvzFpPPMmvfTMyqYAoO1zPLP
	 tX0/yoLG1Ts25jyWEcZthT8pWZCHD7pybmFe5CWtlTdZdMeZXR6W9N7C0qnOeVCqOEjAk
	 yFYSOCefpQ/7H6DtnOhFba2WoIJsNBQkRgalJdYVvknigAa4Av38V/p9/1KlvlF56FQdv
	 gFoEcc8BS8G3loETjXsonlCg6B6xID1wR6uoBY0kkjhOEHREP5ULNAVVwsiS1sl8G3QE3
	 0LyuGUPgMkAcEPKfcsqxB96y3fD5gNZiWM0pLAxDtmqlRDX4QjcN0kdxryckrimkLIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+8a5gz5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8Wh0s30;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BA3606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BA3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+8a5gz5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8Wh0s30
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gv0c2974012
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=; b=E+8a5gz5mE8FXXzB
	7dU6HJoFxJEsPDc1K5cQDbAVcUEzlQHczx+F90ln4xeMzG0yVD/wBZ9yp/E8ZqA8
	l2iVSa9Faw9da3rCY8/Zqtms4r5ypnhoFQNYXJkNdMNofXPhvMsq4kRiWPnZrpGg
	FYO9u1gFcN4EavpgfirAzGfir0Z7IfoRP9v0P39XnSOrHy7tzROg/XgRypJM7tG9
	SodkDhrFCXhxiuZjGwuPGc6b12RPyknhPfa1VP7N4g/vLn2TslK9XAx3/chyDMHI
	7HiXrxtQzUhpqTxoGuAwYNDvpEjjwLTTCoavmWdHwrRaqI87EwAMffOVf5qSl/Id
	hHl6hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpavu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:17:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so50851585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261864; x=1793866664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
        b=i8Wh0s30wwQ8+60Q4lgSWrocQzkGhURYk+4rb2090UuebIqh+mMGsHZ4S7GvIFTM83
         kZT8QIgAbjfnoGd9wECU6zMIgvczBcvFhRp9yOY//n6SNW4UDjQTwLhQknFnKgPvMUVO
         g2vGPUsdv0sAMIY7e+ABGgRh8Lwi2Sew535RITbTH6EEou4R9hPAbzAHp0EMnHkRqRC2
         EXgZyJ5Y0YTmWCf50kn7GpuUps829IhMeq39BvMQV2TnA4kr7U/v8zOcfSX1PpB8pfd0
         TtImLFvBuNMSfVlWVbqFj/YukRcdQ+BLqK57vG/V33/sYrKPtCjP6Ub0CyVHtNc3Ay0n
         G24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261864; x=1793866664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
        b=KdZKweDpOmgc+H8fo4Oh+0FqOfF8V50fsDtxUp3nIbiObOQjbqD2UnvVyYvtErpAnt
         iniS75swtL6ExeQNxF3huBNJRkQysJs3spvPaVikoDfS4QiVXHurpxnbbl4zHFzJF0KI
         R+mWfWCZlHP4aKGGTDPFsrD9NdFAzPTS3hnRzubhU+1mix5vyEyrLAoeNEYY5G2dOj48
         0SnLtXpwcVhReFcfVK1eo1K/387CjeMKyYWhi9HzC8/RiVPQs5Y9yqPWx3V+VG+77XGY
         ROSSg4eKunO0snNySEOcFTDrjYbjmrBuPjtvOEn8PYnDfyzbRBmd8G1C5Y7DLLYVkTUi
         LhVg==
X-Forwarded-Encrypted: i=1; AKwUvByLnTUtvte+oUm9P6xI9muQWbiq8Sw5TPhnIryMCS+MzuiBhvfRlenNUC3VGQ+f1DOZBTohzhozuoXaHkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBAXOR388zGiCkVStfmQ0zbazeMHTb0IXhipJ8nzTNFO64nmoT
	fL7sdPF7nWUQgwUMGefYMmXfDpPJfQWXSgVoXcxI0Cw0XF0gZLKUiLZaHTtW3xEl7L1eXDdvG8h
	llpq1cOIEhBPHUdDTjXIOK+CWRNJr3MCqml7elmZksRTpK4snW1CRtsviyxaWqyzQgOs=
X-Gm-Gg: AYBFou0thFZ2q+rPdoJMsrq1IoXEsDzhuDtTWc6eCzK+RHvBI8LQGJTQnP0yv5F0yXZ
	nbBnXszaOAWrelKzlGp25rvLi99bRI7XjlvTnveEz+KGV5lWRnJezHEC0yZlFRdfWm+u/Bz8TxE
	jCUEGw9X/MUhVOxnvDKryWeL0ZTXVJhyBuDwAGwBo8NtFrhprSlhE+uMljmKc6VBB1nnQAr+uQY
	dVGOZul/jtOIALEzmK+Kb5Y6LKEE1wB1Aj88gllCM5YHMdRjSOBNI0RG7iBV2+Jf1ogvETSFr6i
	sfD0AOyFktcmRk7Lsb7Nl/IOZ35d01ccItxRsIng98YKjo3dPdAwkMVul5vvm0A0a5mrqUqS6CH
	gHfm+ylh8sKjGWzsG5/TaOZUWS0Cm+QV368CoM7UmTVP52nGuIjp4jV0vwVAlO+2h+NbGiRY=
X-Received: by 2002:a05:620a:1135:b0:936:2f59:dfe4 with SMTP id af79cd13be357-94408845854mr747553185a.0.1793261864103;
        Thu, 29 Oct 2026 01:17:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1135:b0:936:2f59:dfe4 with SMTP id af79cd13be357-94408845854mr747550085a.0.1793261863581;
        Thu, 29 Oct 2026 01:17:43 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49641f64csm2408328a12.21.2026.10.29.01.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:17:41 -0700 (PDT)
Message-ID: <f8c823b4-9879-4a8c-8824-a745b5426c85@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:17:37 +0100
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
Subject: Re: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
 <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
 <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae30128 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LyDrgX5eIXfwpl7llHQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: h4NRdM4kFiFhgL0ryNdu331bxs2MrOu7
X-Proofpoint-GUID: h4NRdM4kFiFhgL0ryNdu331bxs2MrOu7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX/o8jaBhMY+QC
 mJkBg22TqdmLGB6Ox0NPfBs8wrC/JAl5OFCaewnThIMThZkfh/PTsddnm1dYmHNvmjnnSg5p1ZU
 h1RWVBLr/awn6poZkcyS64XtF8FBIBs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX609ViY+eDoC1
 R1RxkljKTlJSZtvawL1Bq5OR/FJCjSion1EMjIAxCj3OTYhFJYV+tZZfOmGpSS74w+sBgUzJ8by
 MnUSTkPo9lJXH4iZJ4hRajkF/zLVR403dxqiGCQ53C4Og5IKPGbIqsrwCBJwGVfOD6APmWLfmVx
 eYb9Yy8Ft2Y1qXivNzpTQ+wBCo8FxKhF+O5yoWXh06WzOPS6W1PBchDAQngWHzn9SrPSJ9jaC8V
 HcxoR1tUpGit/VpieSuwX8E3TLM0c8bcPhLw+0nn+k+ZbcsojT1TIWUsnzTj8S7/OzkvDME9T0q
 ZH3zSskKS+wPZVqIQU+DqHw7M+/hb9r+y0jFV4y9hT6DdR0LD5RNonXcdyN9Xy7hVHubf+rQOS/
 nYLcRpqfuU0oOGU8NJ9Y4V3VQPv2AzMjxHUYpz4PG6ObKbsYwacCYQga19xNZOsR5ek2DGy2q0b
 OjF06ljmNE2tAgJ3awQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/28/26 10:59 PM, Srinivas Kandagatla wrote:
> On 10/28/26 1:38 PM, Konrad Dybcio wrote:
>> On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
>>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>>
>>> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
>>> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
>>> speaker protection. The speakers now expose two DAIs, so give them a
>>> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
>>>
>>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> index 58158b51fe29..fddc76f59557 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> @@ -256,11 +256,26 @@ cpu {
>>>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>>>  			};
>>>  
>>> +			/*
>>> +			 * WSA SPKR playback-side codec DAIs plus the WSA
>>> +			 * speaker-protection VI capture-side DAIs on both
>>> +			 * WSA (left) and WSA2 (right) buses. One MM1
>>> +			 * playback open brings up both chains via the
>>> +			 * machine driver's multi_direction_codecs flag;
>>> +			 * the SP<->SP_VI control link in the tplg handles
>>> +			 * the DSP-side pairing.
>>> +			 */
>>
>> I think this part belongs in the commit message instead
>>
> Yep..
>> Otherwise, do you think we could bind the speaker protection
>> channels in the driver to avoid having to modify the DT?
>>
> Nope, it has to be a codec-to-codec link that should come from dt,
> giving more flexibility.

OK

Konrad

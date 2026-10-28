Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194699;
	b=FJ4ma6YWL83PQ2zPBwzmsBnd+9bV7wGytTZCt9s5n5gULeozNocq/MVTpmRqNWrUOA+5
	 KfQRDB6asHu2JTmnMAdTscCeNfbUIaSxhhz3WE9vQR9yGcHClrBr+jOa05ggFOooV5cxM
	 +51/OlSEg2E01I4d8b3npsekMw3tdPxCUFbRCtexYyjynnvNuinNuG40fu2cxXSghDm1C
	 zdBRHt/2Zfp3ggUbknyJk67b2J71M7mbFgGAg5028c05ApyCZXV/FPythr9acBgvtjTYh
	 ol4cYENYwqiId9cjJm8nuhJQH8fl0Beq+i6BLIjboImdJlLu3DUPP+qGLQPebZKfuzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
	b=MZk9KY+L6DoBOZuQlKGZcca8h1HBVvNOR6wM5+fLcdq9dVsL4KXK9CMMpfeiKIolWEG6
	 PzrqXMiUfSDhmv0Nna1+RQ9PeZ3S0wO1LVrZ6YSbGhbrIDxx2vPkU2+DOFQq0vjTnG5wT
	 afc52JfOE09C5aitPXvGexJC55yG+dy7Is8YTproba5ScWYiWTFu+Rb7Si8LYWK2Cq8wH
	 moFRMMzXOKW5OvMP5u24TV3KJXbku1y5PLophrpEl9c1y1Kvfu4gkvrGeHrZhExabWATM
	 u9+LtYIwaZ/4bQ1hAOL05SGVVeZN56s2u5No3y6IkHVL0BFzYor2zKCQErtomi3W6UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kybmvRQ/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djHwWfUg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C70606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C70606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kybmvRQ/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djHwWfUg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2xN994555
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=; b=kybmvRQ/e8UryMBc
	WTenpDPQ1WXj2/WXl6n6Bq5zRTSaoMiIq1oHOfYCQs2rjN60Az7tYyL1caLBWoyS
	5uqiCf81wrK1zFnWSOQIieq+99Mp/7YDDAtU0NWqbMGq/yGOIG9i+KiL8yiR4GXi
	X72Lp3p5GyAH7Hd+atC3W3CIHzw89ogn8shdErygiC+Cx3+/ZCnIsh+o3RgASQYw
	nA5ake7yV87wcaPewH//Urw/AUqpqUwOlaJfT/+j3Xs0s89eDvv2Z5ivMRoET1iX
	xdHmIFy9DRmjwRxZPsUiPxJtNp+hFSemWqCalsL0lyhFkkCT/d5doiVtaFhagvjK
	fB74Bg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt9w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:38:17 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so87789e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194697; x=1793799497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
        b=djHwWfUg7mpzu1uq6nHEi2OX/T89tBmMQmOfLP8QKR4P9N1VvL5X46Bo2yMkSmQvyF
         E+lLCfzhIe1dkpwgf4pdm1irvUr9+x6OVG+KPfmYaE+q/x468oFI96WGhtGLdRe8fDz8
         YGXT5ODIgq/ncLSNHLAEJjqMssWBDnTplw/oNePBO5sXq+sji9xkpfucYH/ihqSA7Etu
         y0qyC6DwlQVHM4CbCgApVUb5Y2amtDvHw1u/Y5BmvCKIuHv9vS9jXiYVUfFlq+3GtJ4j
         cGyD0/e1GbMOhB54JrkGghtvqZ1+ru4qF2B18UknNyanPGimm1B1p1/PdXVU3GNM76Ni
         KkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194697; x=1793799497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
        b=mOGqrEk7isAsH8QQLjfvn3IKRy6mrPK8FmaaA/sndnPOmt7itZocSDY+GtXgHXUtWf
         /JpJY/ayDVRQuP0KQ+OEXJ0vWhpVu38swXVedGghQDQHoozoAR2oHkNq/Jjs8EsNaPly
         6RFDUVN+02ARQYr5qp2QSvg4FP9w6jd+sebingxBPNe1fKS1jbsjviel2HmbS5MMJ6JE
         QAJJ3zHoeFmfQis7axdb9JRXyJcTCkkRrCjwZFzXPPD20nUDb6SdfDr4kQiCTcYYUHEO
         4NeuZNS/0DBMkl+Du/9+JrDnpUtIH90nyAG47NbfaXJrkMuFQUwIDhOJGP/WTmQt0PEL
         ecQg==
X-Forwarded-Encrypted: i=1; AKwUvBycHCDZtuNTyZnYdA9XuGSrjtbrgmNBNUrGz0SqkU4VF99NVKVEGvGeU8JNpQklRfanbhBh32+R5wT5blE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmJlxoIrRGWawLRBcrQYJ80FwgdCUhhwS6DyGMqgoW4GvKI/bD
	gQJIF6amOQeu42J/dGgipylUqsSm5OeXRUTgFBYYdwol29TzHjT1KbSNXvX+TkAnV6+OTFxCVKI
	azGFbTzev/LOd8K6NaIOmDUURYiAgO8h461AgP0QrDVDoVX9PRfefG0remIFnwEEeIes=
X-Gm-Gg: AYBFou30xkOYWn2cUbXgnaZV/90KRWOEnYAIQHPaJBT/7AUu5uMOAQTwiaL6x2xaDlq
	fN61dLT4Pvcl0SNPap9paGwOZC8Dj47klz8fHWcF7uLyrgASnLjEmcQ0fQsi8qPFtKVU9ylrpDy
	7kLagPe/urjgwu9TZj1NvmGwGB0VVgXaeskLgqMiaxSFk2Or4c6FgfHpDPlSY1EDS0IUU7gq58u
	5UcRhA9PF4edi/Nmexcs+ob22pNPMbMowuUZ6NelW8dkb4ClNWM3UuOdkcF6JO27i0WIIbdRxTP
	ifDZLVw/sg+kYCVpJwg4CyRVhr9H5UqBsmCmjbnolb1BMajxWwWmtcHKUsMCxhhvPz5BQZhm2tD
	a1kPBLtdumPHj3Fab+roLX16Z0Z6cbeh+ezXCQVnjaki2QLUfP9JYkbORT6N+19VkAwCKMTc=
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr1020170e0c.4.1793194696844;
        Wed, 28 Oct 2026 06:38:16 -0700 (PDT)
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr1020137e0c.4.1793194696325;
        Wed, 28 Oct 2026 06:38:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3d9esm30451071fa.26.2026.10.28.06.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:38:15 -0700 (PDT)
Message-ID: <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:38:12 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IQq7K8dghvwlIgVJeCsjbJwLp8kyvHlQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfX7tnICbpzU8NB
 1V0jQ1VjEMlICeQxzwj1u5WOqlEsK3I1VpINCBUQtlsMTnuQ8hnpBQSJwcdRAuQLKSJ+hYJOhTD
 lvBqKOAX6VuxDaQ2B/k2GrklEzmsMyg=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1fac9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7ERdoP64vwSu8KGZOMAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: IQq7K8dghvwlIgVJeCsjbJwLp8kyvHlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfXwi9s6UnnOiQt
 Nx+oEnhpjX3p907tegqGQZiJDbvqVQVrWBoC6cJ9sagdXnhcCvqCTNBw7+USeyzrcouGW7ZusgQ
 lJd336lTMb35pkONO0Y7CTSxhPATM19UMazvHVjst/EJxtf5SMjT3PjAzg/x7MYfXyr2Run7d5N
 PDn1Z5o5YZb4oro7ucATxm85ES85TIwXYV1UbAe/wh9ZWy92/Q7XM83F67N/BzDvZgqIuJtAY53
 DV56XvM3po2xF2gAawqrgYnVlhNRocnFffkS6AZ5nz6GM/ttomqPR0ASQOV714iVgMKiVxkjspY
 4DFvpP3HeUFU/Ma0KAUhUr0tzXnSxyZlH4Lwpht5CfVhtUlY112ApNGMtRUz3E44Sk5lJIl3+tQ
 nV0aJVRk1ayNgPxbbf4zkjECDUCKoruKjPxVcLZ2+2wMfucop8PKS50mKE0yMGvcZUY4VcfBHFM
 3LR3HvTyaS8rsak5JgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280054

On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 58158b51fe29..fddc76f59557 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -256,11 +256,26 @@ cpu {
>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>  			};
>  
> +			/*
> +			 * WSA SPKR playback-side codec DAIs plus the WSA
> +			 * speaker-protection VI capture-side DAIs on both
> +			 * WSA (left) and WSA2 (right) buses. One MM1
> +			 * playback open brings up both chains via the
> +			 * machine driver's multi_direction_codecs flag;
> +			 * the SP<->SP_VI control link in the tplg handles
> +			 * the DSP-side pairing.
> +			 */

I think this part belongs in the commit message instead

Otherwise, do you think we could bind the speaker protection
channels in the driver to avoid having to modify the DT?

Konrad

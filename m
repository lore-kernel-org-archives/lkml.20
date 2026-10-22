Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685844;
	b=ebavXb7eReFfIvvp7PGbkNNSjhi1bRdOdHDl+hQVsmLkvLdsVgmDhceMiImUYCiykSzn
	 kig7XDDOnU0SuMxtRgoGcKwxQRiYYitQOnraDxUb9596ReH8sm7PnZu9gjOCMtPn4BEw+
	 /+z8CTtipxjj70qbRhT+Gviwc7RRDtXMsfDvXvq0nCucGyi1B2a/YUD1fZa6aVQnP2O7d
	 jgxASFQTBOjcy4/ntQE8XX5YyUH33C4TerWf3YuUfSktzUOwsMdBRWMExe93M8vskrM+D
	 ULfXXIACRM9xoBupUkRGTNzHUTk8UZNcYGD3278tUUD/VVThGVybf2J2W+7c/JXpW9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
	b=Dx1ITvwNxiwv87kN0oDHiCHSiJj2n9NZ/4LrwBX8Z8QIzmFqpe98iYfy3CVksKmxnSLN
	 B4/v9cjb9NB54q/R8itagKHkFxHVT5sTbyPLZp+zbh6JbhyYHpm2d8aioNcF17U9lVIMS
	 8wsnhm7g4zcp57S/r+Y+Y8pUuWMK9MLpoYTJVWdi1zS1WMlC5PaN8bHdHWqVCUhmFFfUX
	 jE9hcBkL3jyzOL8S51ub96r0dE9Jn4ZyNYu9OsIBMvoRgNveXS3XuUmbJWHxzyhja1VWP
	 qWzFpdC7XNmQpbCljmcw+hiLurDYItaGRp6I4XMxe8iUWtTWvHTjfdLlLUCQeMUFQMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ni/5mqHE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3APwiJ0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A1606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 352A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ni/5mqHE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3APwiJ0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFIwM3211179
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=; b=ni/5mqHEPn4Pg9cK
	Yzbv45AgeD/32UA3TR4NIaQ7nWsiltS4EiH0GBcHQsBF0D6wbcwCKR1u8VZOnwWm
	JO9+H5rhqD4J4rr+jsv8LYF7ToZiyFWU+htfXWjGLC03AmF/ogEidZMQMWBHa/H8
	RbuCFtPxSjLu8LGSdpB8QlgrAJE2z8zoq50NcqJ+eZkqe7o1LmnrBCXsJCQLn95Q
	du6tD1hZkhkqPkSpzTBPdqIHH1O/Dtt9p9gDvfyoeyUPtuyNLDSu2knkkDuSKZXd
	oVWG869g/BaihcpGBPdi70w96uY8awruxq6YLkfbsoHD3lZb1tzjWD8kJADVpPDQ
	UOhe2g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93amfju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:17:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so904515eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792685843; x=1793290643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
        b=d3APwiJ01oayBVHB4/OfTRjN5HMRJWsngMceHFwKtFz/RSia8EhQIksbWAo99C8vVE
         QPCRwfSXXVSREVpARQHhp8N7Y4J4n0D/qXCw66GCfgHSoGS9ObZxiAk2nbGNQTGzSFk+
         VVlzaxpZsCO4a7vCE9tb3oRzaLidPxmbaDq6T18g6RBZ24T7Pntq2/n2HgN3jS2KRXvf
         hfYqYt2j66aJMBEgdgvIjmAIyvw4/GnLjD6JbYWWWIgGeH8hzXjS7fxuSbJmMSKkFUJC
         RoRR8h3ghOCxAaupuNxUtAsC1X8nV4db4VPv9O9jGrBQB4sPjUilOYcvhlhrZj8bM5HJ
         z62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685843; x=1793290643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
        b=fuc1M4Tsydc5LhnIKIi49DW/gTlGDiiq0KxbpQXDILX3RwfFJZkVYwu8VEtAU2quCK
         ffZweavO7BgJ+ESpJGexkCXV1Q86THYKccD2lN6+XC1pKokQhrXZClL5py9qCNtYzMtr
         alAibp5HBIfwmaa+ZSDpLeshMmC9kxU0+uoZoH34GrrForbJBYkM0hfp/VLPeREmygoY
         BHpR2Hi+eUvrFmCq5Ulu9oIZEHecGQeKECdEIfRMVLAngJ/scaJaZahaNxCrSJbLvzvy
         FmSy4Xvn9XWeXZTAQzXdgf0tqZP64vXkIW+b4T1mS27QSqda3HWSj0BC3bmGqnbwaoqC
         3R3A==
X-Forwarded-Encrypted: i=1; AKwUvBy001ssMyPe/lIHljjirdzaqwtf6KCe1iMLOIdDx4DMyQorQAHSSKtJUwwEUUtueQiBiY0S0JtaqqsOtfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU3oh3u7mBMVAclsYX2aaqxKrFhDl2rNDBSjd0AnvZ2egIplQ1
	oUAzJHEeJ+4qnS+kZM8nKYCGaqPZednbRo8hFAxSkXJFPi9e8ELtR7glNJQOsVah0uL+31tceNe
	yvhY/3GAPne4j2MTJQqhyqtv2xcX49VXtesd2rKaxz3k7OQP+x4ZCB8vP+fwEHEYUFUsCPIbSK0
	4=
X-Gm-Gg: AYBFou1PXhmFNaMV2R5SAkboACDzkgruT1rwXccp7H8PhUWfL4vQ2GaYoq6L5VJVO4p
	6aCXe3MeYtk0RXKQyFh2qwBjmhdQJFL8nGhfhcbSTKpTfAWyZIAfqDxI69h1HmKFAI+jHoGvnXV
	A0n+7IWrf2m8NuCc+XnGnQ7Fi2Yaskzg1jHHkz75FXjLB3MfHGbkiBugGFmYlZpy0AveTgfvwuZ
	ncjuvOYuXTQGPvGuA4i0SKQCMOuYNni/aEaw3InHFTo7kGv23b173DT3EmXPCedn0dbDV4JgfHv
	NIO3ujO/hUMz65kNY+7HEuZNk5NdS7QueGPS0D/M8Y+QsEYDrEgsSz0i3uH5+d71Xh3qWsqcSjF
	CBH3X9q7e4jtnKyIWOYQwFiSikw==
X-Received: by 2002:a05:7300:ec8b:b0:368:d722:48ac with SMTP id 5a478bee46e88-368d7224a10mr2854568eec.14.1792685842405;
        Thu, 22 Oct 2026 09:17:22 -0700 (PDT)
X-Received: by 2002:a05:7300:ec8b:b0:368:d722:48ac with SMTP id 5a478bee46e88-368d7224a10mr2854534eec.14.1792685841743;
        Thu, 22 Oct 2026 09:17:21 -0700 (PDT)
Received: from [192.168.1.11] ([171.61.216.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm37045478eec.26.2026.10.22.09.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:17:21 -0700 (PDT)
Message-ID: <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 21:47:14 +0530
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
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add
 shikra-iqs-lt9611uxd-evk sound card
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vHC7MrcZZScEc60lVu5lVJpUMQkmTrJp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfXy7SfEt52DBz4
 H0biIyvjll2MDcFEU0pKp+eQfMXtOiJVRuU8XyWaMGFY/cljcGWR13zjBsm5W+iMjF69PemZOIJ
 e6KaG4FW/2c6WETOZj+gjZuz7pn5Nqo=
X-Proofpoint-ORIG-GUID: vHC7MrcZZScEc60lVu5lVJpUMQkmTrJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfX68axLJCW0jh5
 cJW4rb/KWDxQvZasOh3cY+0khCvoGmccfzsufubneHpxIt6LHOn7LUipZnRLmoryhdz16GK0lBZ
 3WseWdfmgNRNT8n2SAZ/1VS0kmLXWHCzzu8xt/SV9sJoQqb3eyV/VbddpfqG6PLTOXN5ik8UShg
 kFKR4YsrhS1Vt3PAWhaWAQFx8wOXAUn5BE0yTGbTYmU3e6+BkCxy8SQqeDJT+2aAFKCh7pSpIu5
 vjBP0XpUTGa/dAKXS2KG3BS4BJvyo162hC2L3piBeENtIythhjVk5a1WOM/FvQFmegteMUEtBNk
 Z+xFv2wBt0cZWWrw9+5Ea+FIsKSJjdBtm1RpIFP8mOWpAml3nnlOKdhl6+Y4UTy9KvDT1JqOx/6
 yxqF70SyBpogtW3GwvIFCdUTc3F8Hcstmm06l00DoiKQ84qJSiMBCCJr53kjKSeU6dSaml8JZQN
 MbWcGV6ZTSkBQ2yuxnQ==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada3713 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Vglx2bvqrojy+vbCC2YzaQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=poZCmOCFEqE_XbxgsBQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220064



On 10/22/2026 3:13 PM, Karthik S wrote:
> Add the shikra-iqs-lt9611uxd-evk sound card compatible so DT can
> describe board-specific audio topology. This Shikra EVK variant does
> not use the MAX98091 codec as the base shikra-iqs does; instead it uses
> the LT9611UXD HDMI bridge as an I2S audio codec. Describing these
> variants explicitly in DT allows the machine driver to select the
> correct DAPM routes, controls, and clocking behavior for each board.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,sm8250.yaml           | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 1536fcd96d68..d1f948a14c62 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -50,6 +50,7 @@ properties:
>             - qcom,sc7180-qdsp6-sndcard
>             - qcom,sc8280xp-sndcard
>             - qcom,sdm660-sndcard
> +          - qcom,shikra-iqs-lt9611uxd-sndcard
>             - qcom,sdm845-sndcard
>             - qcom,sm8250-sndcard
>             - qcom,sm8450-sndcard
> @@ -247,3 +248,45 @@ examples:
>               };

Nit: please keep the compatible list sorted alphabetically

Thanks
Ajay Kumar Nandam

>           };
>       };
> +
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    sound {
> +        compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
> +        model = "shikra-iqs-lt9611uxd-evk";
> +        audio-routing = "VA DMIC0", "vdd-micb",
> +                    "VA DMIC1", "vdd-micb",
> +                    "VA DMIC2", "vdd-micb",
> +                    "VA DMIC3", "vdd-micb";
> +
> +        pri-i2s-playback-dai-link {
> +            link-name = "Analog Playback";
> +            cpu {
> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +            };
> +            platform {
> +                sound-dai = <&q6apm>;
> +            };
> +            codec {
> +                sound-dai = <&lt9611uxd 0>;
> +            };
> +        };
> +
> +        pri-i2s-capture-dai-link {
> +            link-name = "Analog Capture";
> +            status = "disabled";
> +        };
> +
> +        va-dmic-dai-link {
> +            link-name = "VA DMIC Capture";
> +            cpu {
> +                sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +            };
> +            platform {
> +                sound-dai = <&q6apm>;
> +            };
> +            codec {
> +                sound-dai = <&vamacro 0>;
> +            };
> +        };
> +    };


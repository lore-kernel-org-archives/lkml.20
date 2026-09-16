Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615C56260A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576226; cv=none; b=KlqCikC3dJtyM/amxJqkEcvSJpzlWKCOJJ8L0ENERqLwBfCukGj6cDCWSPEOumkXJLOYB7vGWE1YJ/n4abIr2Y57XZNuXJ7P5DmNuaAq6lDanP/kbwRkIx7o1S2raohOHHESRuCXVAhzwxwei2ipce/0ZCeD8yviOoBADSmHQms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576226; c=relaxed/simple;
	bh=+pr8JXwf3lEotRxrEPi58W6+E6MbOpFpvM9BWeVIpSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aL3YVyNsfIF9SY3OGTXHOOQVN/OcAKbMOeEiR7H+pa3eUU6OkRwsdus5oixKV9oYibul91GaENlMSTGlquc709CB8caQ3VFMeocuiRdFzJWXiVPdFvMxSUJ6kJx134YKibTX2+KSbBoydPvdgM82hkT2FkRAdNDDN2ewetVpGR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XORSXwVQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSmpgUhw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XORSXwVQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSmpgUhw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeGr03001984
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=; b=XORSXwVQRu2XVaOH
	jwDzmACkl1VXbgZX5jjrOfWd9Dl9OhDZjiuNcjdZd9YrOVXoauXDy7/0/n13ZAWT
	cbWVYrHnUEL8s0WzS5+7eCwnsMK7MuQtgsxHhkl/nD89EfQnTIyQ/ZqZy0TC+ZeU
	XoKkCBMKoIdD4AMcxWejVx/6YTqcJRi56/H/2SjB1czUoLuJbdXwQ3ggW+IEYdvK
	YoQoSYMpN00vq3Q72+HuLgHSsQkS6nBf3bEAcZAhPscdT++iLOrnT419b58xd0X7
	dqVYnNAgytMRFW8L7dFInG7M8ofHNK+oqCqGoVvutabF4l1CWxXk1oD0AN2WCZ3U
	4ZHWtQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7k2y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:30:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e768af628so4703824241.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789576219; x=1790181019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=;
        b=GSmpgUhwK4eq3k48tTDwYQ1+iRHGheZzMz1pcsNVo2+dvChBMEKxSfTZfzC+PMSFbt
         NLqeLuJ1WKfoJghAcV8Poja6Z0awJAuzTfhbjgFKn6+e3pfJ+YiCAmjGVdMVOBUT6z8T
         0oymC0jj5xpTeRRo6qJVJ7WKvYjyfNbZbH3K7AzQ+ghbj5jm/DCiT20RVaN6H+dy3SU5
         O3lU0CGPhQ974C9bfc3DiK6LSSlqtLnRcdhLXMZTC6njHBbgPBQR31uBwM/SuAt18ArZ
         yboFriTMlrcAdX0rtXpf+kbp2ZKMiadrjkUM68xr6lzQjdtuDs3lRBq6qvwVuk6KgmGc
         O5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576219; x=1790181019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=;
        b=lAbQ3UIH72NTXglObkvDD5oeuauzRs583RHtXLu2I1YQff/sHDAl8u/c3Xq/VHrSkW
         mvryBy8wP4VecA+GaaX3OrRxXqqD6VEfS6bd+ftbojIg+IKG5H7vomTMAXZ3v1C36Gjz
         ILpzKiJ2TfwauDWjA0mvV8yy5yiEqY6af0xH8weIBApojUbrWigRJi5E8z4w/yNReW1e
         12K5fQ2wRUOQ/HL0MPmGvFK4DG8k0or3ZcfbFVyPqe+E96dMsH4HJKxWvhyvk6QcWd0+
         CdNquAyxpRorQN1qIir1yvb0BJvtE+lPrIiIKg/r/EeU/GsYlfZFo6e7bxU0KgJSSiY6
         enIA==
X-Forwarded-Encrypted: i=1; AKwUvByVLHOws7Yi0bri/cgR+XKl55MiTM7U40Bu8gQHWrquMeg3XRrUGBliteyndfbMdYQZzqoAEdjy2djMIsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kFmUTpbyuaR0wqeB7mdsKgELiE6wtZFtI2YpWQldhP7wvg5vf/
	+VZ3djD0Ig3ldDIal8+atse9KCSi94jTWogMu1KFCYoeuDCawoUDu0z77CWdIZlTH+goGFwGVAS
	uMWOYV4MSdng1bDxpYpXiSSm1r6TyMZP8oIYBMNh3CVrQjhAY5ZdxAo2xqEpXfckU4Z4=
X-Gm-Gg: AYBFou0XE6JJVqVJ+s7GxT0Jr4HqjapexL8/4+aQ7DpAZbeE1Xmk8xSFAQ5Ty2QyO9Q
	Thh2J5vnnnqyKFkKCv5aLNNYNmPJ9j86xWUkSaF4KzDW+1+DaDeT1IKzC8kUjsNROTk/M3wzaO0
	c/4Vq64bvUxf7GdVXR6UnPANRyLWNlsKIQs7G2BfRIpl1p1pLuLrCPM9Jnp144tbMyXdkmZtVkv
	ujyxuICEpqrfSeQa5n9yQDvWaQ+3QZioYe8W2M0IBgowYhLQgfqGNbqG7U0CA3tCKHkdfSUws1f
	j4uxf2HZzPb8yq1xoHY4gHc/+xG0CzIRy5mjQ5G7NLKtOvDCwdDAKWpbkIjK4l5rNRGB+ue1cGO
	oM1hfpQtfwEesK9cI+PVXllDTmj4=
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr3279009137.8.1789576218554;
        Wed, 16 Sep 2026 09:30:18 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr3278871137.8.1789576218006;
        Wed, 16 Sep 2026 09:30:18 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd2356d1sm3008975e9.6.2026.09.16.09.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:30:17 -0700 (PDT)
Message-ID: <cddd5bd4-df99-4332-9bbd-f9dc10874cdb@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA
 codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com>
 <20260916-imaginary-glossy-stallion-c769b5@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260916-imaginary-glossy-stallion-c769b5@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n9gRecoEI43PPu56Mmsqmp4zvRvE0ID8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX8FZDatp32ntb
 YOT8JMm7EXNUOYX4i58VamJ1mXa8/JP+7+4jJ5ZY7NBBTjidObqnGX7j3D8Rg1ll0D7IrtuMFhM
 OMPw/myINNctQFfemmL3sAovUSQJjgLczpSoMZK+g7V1S/MIhathdOmHWZEUVEZ4HA7ycuzRtsD
 OogRb5BuG5hfx0KiyYeNy2W6S2WMXNAzSOeA0JMKyzLRh9u2iwx8nDx41ilC1Dkq/SsUT95RSYW
 vGIDsquGjmwhCgaf20eumu8XO541S06HFKibK2P13gcwutHqX3eo5FnzdkjTyKNB0wOgIdoby+p
 95uh4+16aystahG8g5JutkFwCS9CynQcv6Fq0guqQyb6H7TsCXsn1XUuLU6+vBbExQIlNspBFq0
 bzrOaLaQFOPbngtEXI3RSKXLlpdw93yGakFAvKs4aK9jmpfIAi+Wl9QQrZIPH3DyXUCkPfkohTs
 sWQKU8gJVTQ5KgLvgDg==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaac41e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HeNI3thZ33BDYE7jO_kA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX2/7TMYqWxzLv
 43oe/efIYkXjEeavq6j499WbdotKk7Nqo9TWb4drGSqiyIxHpaE02nmAKwhbGLETpDvOFg71GOP
 NTQM16s31osIoNXnGyWD28DSaVSOhMc=
X-Proofpoint-GUID: n9gRecoEI43PPu56Mmsqmp4zvRvE0ID8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160225

Thanks for the review,
On 9/16/26 7:53 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 05:56:49PM +0100, Srinivas Kandagatla wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> new file mode 100644
>> index 000000000000..9a6c309018ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WCD9378 (Tambora) SoundWire codec
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm WCD9378 (Tambora) SoundWire codec in SDCA compute mode.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,wcd9378c
>> +      - const: sdw20217011000
> 
> As pointed by Rob's bot, this won't work with current soundwire bus
> schema. If it is the same silicon, then usually it does not warrant a
> different compatible, even front compatible. For example same chips are
> used on I2C and SPI buses and the difference is coming from the bus.
> 
I can send update to the bindings but I would prefer the flag that you
suggested.

> Last time I doubted that "compute" and "mobile" modes are a real thing,
> but if you say they are actually different fuse values, then they would
> be real. That could warrant different property, e.g.
> "qcom,sdca-compliant" or "qcom,separate-tx-rx-interfaces".

qcom,sdca-compliant sounds much accurate for this.

> 
> However my points from Jorijn patchset remain - the top level wrapper
> node is a fake construct to solve power sequencing issues and this
> binding should allow fixing that one as well.

There will be no top node at all.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,port-mapping:
>> +    description: |
> 
> You can drop |
> 
sure

--srini
>> +      Each entry maps a slave data port to a master data port.
>> +      Entries are in order starting from slave port 1; slave port 0
>> +      is reserved and not represented.  Compute mode uses 8 entries
>> +      covering DP1..DP8.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 8
>> +    maxItems: 8
> 
> Best regards,
> Krzysztof
> 


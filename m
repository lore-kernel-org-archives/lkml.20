Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704674E06EC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617354; cv=none; b=h1BakIDQL8c0CgqSKi9zYXi5i7S3bCQnsr/SGJOXyCPQMRgBN4ulSfgMGwXSPvrk04aEyhWaripV8+btPbCwpYHzDBS/icZitQq4nURmCiSyUjavshDqMl++xJ8XAQvqtmFKzvsqd44tH4Ai1HahIZdrXIJ+oPxU4ijD4C6zhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617354; c=relaxed/simple;
	bh=aUUSmgHqQhCtyaUyPVrKNdKUlZbWL0wNpisO5osGGFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkUUQcNcGbEVWEQ7F0O4x8GRTzzt20b+GEiFxw1BrUZ6lgli9nkgQibGadfLcPnSfiIR7b2rHnc3ZZvrjQUgLjzZzGsxSmFVp7Wqq5C/Aazo3GMUypQ1uys55bLbGvGGXdBzIFAyvfzFyAECzs60c4+nElGGmFv3mQks1uySIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL4Wl/Hw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dp6KFr4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL4Wl/Hw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dp6KFr4i"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdw2i1016772
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=; b=XL4Wl/HwJgVRsuK8
	q3RnyxqVML+kI3u/FS7cNh8W4kkcTRT/kJpRRqY1kQ8ncLkcbMYKvlaGj3AbRhn2
	xoLbu5zbfpa2q9VQVN1u18gKoMa+e195I5YqiqzBWXdv+KkG073OJMFSuuVnOyLQ
	xX1gsBhkUEqHGunvIr8WUUyMc3VAMqVc8/EVT3UxdRKJJf7X8HF9gk+AhWpHs0bO
	dHDbvNGPSujYVT8i8sBYlOQsBEmLSjaPsCkANfb84zBpb9ZVt0jwtlua89+aYNWc
	yKnKL0p0l2UB6eQjRS82Tw1nlZembrYY0Z2DNiGKDg3Q0vEkhvqPXG8YZBiASt6S
	+sDkuQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq3e0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:42:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-791463ed29dso2933218137.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790617350; x=1791222150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=;
        b=dp6KFr4i8HVRteFugtB++wTMpaErmh71EAChPC6h+jdGb/yJkSx0pQtabUxRv3DEGF
         o9zTgJgwi91j2Y7tnuvWC2C1ojmwaLdTn8tE1rLJH9IUSX3nOAWO+hXGX0wbhL2805kd
         O8xZ3d/afsQGP/aBEBUppi3Ff++zUCAER3tQ3u2nk3Z6uxqv880pXVDjS8u2RazyHAXb
         FDLG98XVyou24xdbcyZwtmG89BXPGPTZ/SuCosmDUIIx4VI2E5rnp2BRhvYRj6WW6SY0
         K6PBJxrJM2rtM3/ybrQLMLRZuojV9WWaH6js3CNbIy4gT7CBqcdvpeVc9XqFX658ZktI
         E4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617350; x=1791222150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/1WfCSunnO65R5rdxWHjPtFptxxB7B5h8x2TWIFRQo=;
        b=JHPL8gWnHpEer5vB7XSi88v1DGh8WBF3PR7A9HA810iUn6NqaGlZusvKfjs6Y8rhGa
         e35CD+nU22EmjmIwm1G2MceFvY+jobucCQzC1iCVnODxMeqYs87smpgjTDknJooZNG2A
         RneR1r/bW39iPl8FHnV3Pz8CsTaK/JQggI2CpH8jPnEALa0WYMg/kGIM5CYk6L5EIy2o
         AOYd2nrAizbwtH+md163kVcn4kkClmYYArw2cMly1R0NmrA927IbSB7I7FaAi1Bj/8HM
         Qtldp1vE71HOluH0NQ82QF4+kRh/5nDNJ53Y95fXbsfrsCqf3n8ZxjTrBe/j9WvCJrow
         935w==
X-Forwarded-Encrypted: i=1; AKwUvBxCy72WXPsE5PghKfr4/Id1nwc9IIw47E4MntZmEZao9PDm0IXSImZRR2Dmv6UaZDzwwqHkyd9gn8c1tkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVfuT23hiqyOH8tOSttrEG5b5Mywy6ub28bsp2Bcl7xc8S/DbX
	4LUKkvJoh6Is3PwKupZzm4gJheICxzzLvL7UOTJ8s0p/jUSgnssCKJrKFXVA7SVMFZUBeDmlAPH
	H/QsvKFwlVS92P+yzmeqZqMxxfcHtwKWvJJ6HhGFy3q9M13VIGxpiwa/SCwVw3jvRMw5TXa6wo4
	g=
X-Gm-Gg: AYBFou2dGZiEpjNqHc+ZrEP5a9U27QqZniwhDfHwU/Ydatwn5YIM2gmBzZt37O6c39w
	ooEgcQfSNCH9SZb1f+i0X7UxMBXMtB0pEx0tYqvad5UmWpyAA/EbUwMqdN4ru/LkXuUpFruuGY8
	xahrdZ7ptX6emWUOrN2gMhId8KFF+N0j8nyCql5vJRA2dZh1TC7eatMZQ/jCs9HvjZBckrlvlJr
	2HcYoyCzu4UEnzWeVrhchHRlVa+OXxoaJBuvSYcjKQSNsBDK5v9HWqtxORooQxznb0I05+KLGT3
	HhBxBNQhWLVT9a/ZZvrh2GvHQE0Do+t87ujDIP0JBj5Nqvii8md/MUS8Kurg0uFFL96AnFBSPI9
	ymOPxdRkjQ13Q0VXTM2jzrK+M5A==
X-Received: by 2002:a05:6102:5491:b0:7af:8089:2734 with SMTP id ada2fe7eead31-7b79926dc9fmr1077939137.27.1790617350368;
        Mon, 28 Sep 2026 10:42:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:7af:8089:2734 with SMTP id ada2fe7eead31-7b79926dc9fmr1077918137.27.1790617349866;
        Mon, 28 Sep 2026 10:42:29 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00cf868b5sm15293635e9.1.2026.09.28.10.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:42:29 -0700 (PDT)
Message-ID: <b037133f-3a5f-4957-84b6-6eda14739f5b@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:42:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for pm4124-codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <20260928-ancient-boar-of-persistence-629a9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260928-ancient-boar-of-persistence-629a9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P4ZatBw809cQF72KtFDxsG5BJPtaEOA6
X-Proofpoint-GUID: P4ZatBw809cQF72KtFDxsG5BJPtaEOA6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX2vzyg4sB6wBb
 FV2ZbFPxC1TzfahkfQNUhmVUU5XHrD7m/qgaksBJOZqOHiauygw0dEPIlN8q3rGX7Of3iQ4R1AA
 DOGU6yWwb2+Ewk/RuQY5T1v1Vn5Nlz0=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6abaa707 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bMBjfq_dd7qU7rFTbikA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfX7C2/lF7V7cqH
 fHowt288XbEN6seNGAJ/0ehWtWd7xae5wZm1wfykVdRlMYryagzWBDFDkjVTXtW2EiFI3objtQk
 20QGfbpPL9RrYjKsW4L0cwt5JN1F8dqA5C74NFlIDCJeTVLrMb2MIDEIFAFWGFm2lBn//0XI5Fa
 e0B0liWmHNdK77irQrbnxQ2vs8sm+PEq0dRwvoS4BdBaKWfyo/hnq82TelNDlDi1eAkGwOfjkrZ
 5b5F8RwaKhh4CDd976ScpbciHifJBmXC9XJNsA7LOzniAp3rKV/PXY0tDMKA+evKuNY6mKauqyn
 fAmCQOlP++maLdufJAY7vHZnzhJ0FAydzlgfIp60EcY4hWJlEs8bec1r8GrLHFjS8d4hgcc7q5d
 N4+41oh96GurkIVgt+pKyXB8OIpxo/CRqn3EVl+Hrl0LxxAXvGjpZbNheXrYYJ3oaJEDRMt+R4z
 0N15hHianT9jQmOX6iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280070

On 9/28/26 11:09 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 11:11:24PM +0100, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
>> Audio codec has TX and RX soundwire slave devices to connect to on-chip
>> soundwire master.
>>
>> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
>> properties in mfd qcom,spmi-pmic schema to complete the audio codec support.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> [Srini: reworked the patch]
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index f6534e9e9912..d750da31ae3f 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -148,7 +148,15 @@ patternProperties:
>>  
>>    "^audio-codec@[0-9a-f]+$":
>>      type: object
>> -    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
> 
> This had three compatibles:

That is true, things have moved under the hood.
Thanks for spotting this, I will fix this and send v4.



> 
>> +    properties:
>> +      compatible:
>> +        contains:
>> +          enum:
>> +            - qcom,pm4125-codec
>> +            - qcom,pm8916-wcd-analog-codec
> 
> This has only one from that list (+a new one).
> 
This model was suggested by Rob in last review, I will add the context
in msg.
> This must have rationale in commit msg.
> 
--srini
> Best regards,
> Krzysztof
> 


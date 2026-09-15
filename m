Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23904AA030
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475930; cv=none; b=GCCG0FjKvZTe6LVgEtZfAET6AgwpdthAo31vcCHQytl0+e5fmv6+kJlKYt4oZQ1/LoNQ6uOEDjrk/bvo1v7lfNbk3RkYkyZMqCs5n6QQwfI6p3ew1PFiU9/WYOeSyK53mEZPJWaFba0u2ysXBYfGs2Q0Ygao3411zcm5Z9L5Du8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475930; c=relaxed/simple;
	bh=kyartu+TMLpCL1WbkdOyGgGRHw9vqTHR01SIfwa6v9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjznSgA5RHXxUQJp0QYgghy7bgqrJCs/MAxJhLzU3Y3yTc1s1afWofovD4YekR35CATikXKS73N3UnptAc8Du1sXqgXDU9aXDvo/rKPr+1fVuXadrLOOsw/ajTmgjxqjrh720Lhr6vQSYR0Ck+xVfIeTP6//XJciH/RU4UEsCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGEO591F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPMHIYLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGEO591F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPMHIYLd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FA4WwY3611178
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=; b=PGEO591FcLUMG99/
	fnQ+jUhO/tzgozvU9My8C3uHW+BQQD0+E9Z0zCGUDelTen9HoHxYKL7dBeEpokVf
	FLuctwmWDKcuwWniju+WFstJB9D9XdqEE11k3nCA4Q97TpZ5lVjWrfmAmwe5pTmo
	ujDW/grERFEUFEhMiQ2fk3wIHtg930N0pYa9ZgEgudF4DamOoNi6BXbtwm0ZCeiK
	uHJzG+/8jyXizs78DSq7DLKrOPmm+U4nbBqePxNUf/eUPDeHuIIAop1PbkICQaFX
	rRsdD1Bs7shj/HwG95Cq7XU/Cr7fNOFwixhg6yUDywVV3fpDJZnWukDAHBOJWaB7
	Bvbjgg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtrqjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:38:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so6609143a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789475924; x=1790080724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=;
        b=HPMHIYLdaPcOkO+mKiG6akwAwYErAX3cpF2jjWeKd7ux6AyRGy7GaogTa6FFF8uoSI
         K+qbLam6OMgHWtyPlMLNOTLz8JRlU9cYmSImCQRids3rQ5I+5SCcqLJ5ziXM2GnhKS0s
         QNO5fXXW/Js50/Lzm8T/du/hkx0KlozQKTKGs2WBn9fZAvEMK8LMTLmS9pEOqaVx6H7X
         0PgGXKwj1ZehrE2P5BHVT+XYcnS4AOOpBK7iUjYRjg1v8TM2cZH7FKWJPQvWSqPx/IDP
         3ZXjtkZe46d8mdeQ9VEkOlkERh2jWeROyGuOX0ve113f8PbCoepKBAbFkgyDVYfnbQrt
         TfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475924; x=1790080724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=To3gckJSL+lLtFYBc12foP5EN1xKQrTgxmIAPgJMM+A=;
        b=2Aioxwf/VDg4NJIWrSAOkrCwMk0JiWZeimqqA0/R5gPwG6kOk6BJt9aJ/T8xLzKhbK
         zfkrYm76/1mEbWC6xvEvQUoJ+XZ71IMQNYxjNBYK50Z0MNB2euyUkYPQU4HCRdcpFtYa
         bputva64ogey1pKK24p3Kny/xPz2Iubat4ZVhK1wtgZwGKA2b6arMjWX/MwHYQda3tdC
         THtt/vbm52IYbBLKwjHra5RnEMpN61aBqKLMRzQtFSVsgOUtTqqi1a0LR/85TtaQ1q3d
         +/3h9aCn4me6lHLW41IVIxCHjmBZ6dVICP3bFAZPwULYLhLKiVEvpykyQplZ+e6BYVN8
         ZlLA==
X-Forwarded-Encrypted: i=1; AKwUvBz4Yr3OzTVcR2++ycctmLCwP0pgwCY0HzVZMrPH5usndUzqM//ptfu5gq1UMus5On3ZVvKA3VF5kaFeI40=@vger.kernel.org
X-Gm-Message-State: AFuF++kDybNoHjnMvgcfTm97847dBpGr7s6n+RoSbBtJB+JaWuL+JXvx
	0xZF9N0W0tlGGDFaUMGOnMZnGC7HRffvcaKMxr5ySUp+bcEBI3aWBT49uEtEgGFBA2Jh+S27IOT
	2KLZSdg1IlfHbzmH6Ii9Y9l/RKHBTVFV4p21FtF2kb9U/6bolgnu5o9U5prqoaa7sqt8=
X-Gm-Gg: AYBFou3lh9GkPWHnIA4xwhERo4IxOVtyr9gkwZrj79Am9Ewm8H1G/d817y1XvPu0Inv
	1iCObU2eISZDJZelfJKcsFuBB98Vfpq6L5mSWmijWXSfP8E3CZmaiKpJEMlR7G/JsusW2lzmWvi
	/I+HI6UI7C1lbPR/AoJf5YKJ06Yy6nGVq+9SabYCBTBNmY/JAVqNpJ6Re8RhNDwf3B5mniqKkRV
	YGJ9rL2qiGPDfqjUV79c63r7YPwuFQ2YxYasxkfOelipdXBftXHMK+BW4PkTTM1HqSqgEy46scu
	LFUg8Zjsv4ZFZby5lZJ2xFSfXKpz1owjdOhZjaJrsYjN5NwBIY/B74e4DI25MGPTcpsjgJAeHMU
	uEXxb/7Q/GG0AEClIxijqZkjFli5F5kNJsDbphWU=
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr17438020a91.8.1789475923954;
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
X-Received: by 2002:a17:90a:e188:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39debf93d89mr17437941a91.8.1789475923437;
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda7d765sm5280661a91.10.2026.09.15.05.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:38:43 -0700 (PDT)
Message-ID: <3d5a1cb8-defa-4252-8faa-8219752c59a9@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:08:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>
 <20260913-melodic-violet-dogfish-fb834c@quoll>
 <2345a7db-d9da-4a21-98e6-e3d622174a9f@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2345a7db-d9da-4a21-98e6-e3d622174a9f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0BJmJuFZzN9DiIzUbel-QkPBV4HDDI5_
X-Proofpoint-GUID: 0BJmJuFZzN9DiIzUbel-QkPBV4HDDI5_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfX50VTESz8tzZX
 bbE5DllEn7ax3xgWE4E00fInI0udnrGhkK4pjLAkhUJDoDW5pRwCB6AuBboIiplOqWn55JxfiZu
 bpRc/X6kr3Pt9dTY0DRldCsGoAm1TV0=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa93c55 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IbSSN7kqFlyucIwrSVkA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfX77U+UFG0QdYY
 8RWjs/oo9iTl/sABvY8rOAZNjUrIi/STaiIEQdRj2/7ZCpfENAhWKqA+5uf2v3mvRlnMdqxxN4H
 nCjL8HPgPTI9cqR5UAB+1Wyo7hpxlhmBRWlTrgN57FwdNS73y2+8gNgGClLv3TUAnbvn6f+ZV93
 WyMCrNR95M0vE2+Kml1bsOY5WiPnSLzvMeLuI6U2mE8563yETjfyvlQOJoYnqzRpI5FQTPYXaSh
 zbHoPRaci8q/hgePIQuJhSI8YLClhFZujZt5I+XoCWxyOK9xxTd+G04AoH9O4INd17TZvV87cFA
 nM6+9ARKzwoTKXYFwwIhyEYh0IqCb4NnzQe+wl2jS1Mh14qnF7Buisz8vcgCdI4804CGNTkbuRg
 7kRWVSCTrUgofWssCViwyg5sAM+dIe2Y3raBvXBcnNtuOQmb4lSa41shsMoA3y7NGijaFITON45
 puVvOskM8EaBU1WssWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150182



On 9/13/2026 2:19 PM, Krzysztof Kozlowski wrote:
> On 13/09/2026 10:48, Krzysztof Kozlowski wrote:
>> On Thu, Sep 10, 2026 at 03:16:52PM +0530, Mohammad Rafi Shaik wrote:
>>> Add bindings for Qualcomm shikra rx and va macro codec.
>>>
>>> Shikra integrates LPASS codec version 4.1, which is not backwards
>>> compatible with the already described compatibles.
>>
>> OK, so it is not compatible with anything so far, thus existing
>> constraints from the binding do not apply. Then why are the clock inputs
>> flexible?
>>
> 
> Heh, and you already received EXACTLY the same feedback at v1, which you
> completely ignored.
> 
> So now second time...

Sorry for overlooking this feedback. I had initially intended to handle 
the clock constraints in a separate DT series, but that was not the 
right approach.

This was my mistake.

I will update the patch to add the required clock constraints for the 
new Shikra LPASS codec bindings and address the issue in the next revision.

Best Regard's
Rafi.

> 
> Best regards,
> Krzysztof


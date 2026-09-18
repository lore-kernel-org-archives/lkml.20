Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD544E1C81
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737842; cv=none; b=FGR3IClDjFAkqrfmuec89As6ZD4e9Tzo1gdjZgfyK5zVwqc0byCnjHrpO1wq4bXS0VrVEJHKgyRCDoT5/T2ZimSX4wroem4aDfgk61xXq7g5yeUvUUVkUgBw4rqpG4RwuRlAcQTphakFfUaF4WgCDzq218vABPcuLkLKyz68kO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737842; c=relaxed/simple;
	bh=Yc7wqbvlmYIYSmY8DLM/Fc/IZHx3O+w9ugmnjA+pCAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJxM3jlTbblW42+u+nM5TOv558D6T21obdnlDIeil4gprb+Z4XYgdftIzRiYh9V5qUgKY1zezS+cf1yR7E3xT8I33RQewSKcHVIJJLTI8jMVgabKFF/2vXkXA+SOOGiRPJOBiZwrZyIwn0Vb2S4/+FUfTeEQntYfCoMGaZ7nr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hf/BNKxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNo3hFAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hf/BNKxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNo3hFAP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICuIm3038998
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=; b=hf/BNKxCTppZPbn6
	Xo+8ydQNhF/FEBjcg4U4vNdLZTC4jDnxv2z8zvF02U485r9hNPPBijP75Wx/2JgK
	64X1sLLRRsNoSux8BdzkrCATqOUPhpTGVLYgpZw7k1qMt6dY/mfqknYpIkdBIRIF
	8r4wTWA2zwj30NWuuQd/8kFmv9wVs56Ro3Ysp0mLZWYx2cjYehPvDdbeHl7by9GV
	T/voniU4jYQrIeOW2LySKAEyxqJP0OreTpGgN8XM8hfsdztDPiJg1oSR2BFKO7jy
	0b30NJsbh3g/4M6slkJ8SVD8+T7H4TSbXtgIH6Fkt7P8Cy3uMMHGyi4Ic04AaSMW
	dtPCBw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2kuqph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:23:59 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806a17a7baso8608241.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737839; x=1790342639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=HNo3hFAPdhJnm+BC74IvseHMgQ2m3e93jOwHyr0BUPd/fVf4xJwzKqH/mrhnrndg5a
         lFz1urMCi+2Wsyz5vS2Au+PxZ9Tc8/Q/kluYgZfJ7gABfrlyF5Hr341TCu4vE7Z/ZVA4
         mBDSFpisfBoUDfDntAlwMSFzyl2L+wqcBOadIE2w6F6EY6EcBhYNNlAPpgjTRi/7Rvza
         NLeO4gwACDdOxWwhl02bEmrDzjTogM7t9zv+FSUMOj8lpVhAuoNglkKNGMVanxsYP4PI
         HYdLt7+hb38pCpd2rNlk77KiWPA/Y2LKWEn6aXo7dYXJZrgnW/72qEzfCC5y86SGQB5i
         ljUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737839; x=1790342639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=MWGCZJHESgvXufQMSaqFSS3D/gRxPRf+GuKjrveNmV/dqyV5Bd7j+koX6VAsbll5JU
         EG/m8XNTUEUjTvKQYvC1h1unIaARYugAE8B7dbHVU36XYOEzIlPQMDZce0ugJmyX61pp
         kgFuwIfLMjccvjX0NvmQQDxvA4Wkf3ZPlOBCDi56mK1MP1HL6XEERSmmnK60UTDjhfvP
         l0zonO9cA1EF3RD4iNKbTjEHWYXAGSRlWLT9kg8W1H2AOBn2jtWAu8j8YkKBlgpMnvGo
         Hpu+nKMm3d7ykk4O3v6N9s1jv+b/LrC8rzR0wbYO0sNsdi1JVB05cLRUzgBvjFG6CC68
         1TNg==
X-Forwarded-Encrypted: i=1; AKwUvBxYWq5xd9/KTb6fhfGwpwvPFz4fS2ViifnJAlOurgzE6pYMNzS2lqDKkgEIz31KUMaAlZcgyvuckccz3DA=@vger.kernel.org
X-Gm-Message-State: AFuF++mWnlw7xhXCnEejTd21lHMtcb2NRn/XVQLsBTgbfEAhO9Q0Tcd3
	nbeOfNeC3CyM2gWnu065uD8OBq8zx1ozD0G+skEWC6QpeXFOtKvCv+ouZyvXPTF6Y4FwR/9HQ/O
	wlNiDJWQqc5HGzVbvCAecnwgCu0LeQrfg3LuF8h0QbnDZUglakNk9vNTu375kZ4NUM10=
X-Gm-Gg: AYBFou0Mw4i/wdGlyB+w4mZwY/m7LZaGy13ErA22diXU4SoH4NTwxFl053Xo5zA+fsE
	p1wT/CLPka0hsFRI/FAYu5FA92eXbrT3hhqWSMnmxtP+9jXUJppae+tWoMpd5aAaLVrOzPfYwvQ
	35WVGe+FlnGVAE/RqixSi+9z2jg+xnx59hwwb80/x1ULLqsE2Dwa2RA30jxlKgSREfKON7WKnYr
	sKR/+fCxFEYs9jauFvfRQv1/on9gpZfmuy88+Mfb301rBXBx4c6IbyRC9QSEKLOy7V1evzAhT3A
	0u9v9ntC7c/THHOoS3cI/EQ+2LviZc6wwrWzSte0aSlJml34IIe018hoF84jf5ch56WUDIpfbd8
	RlI/P1Wct0buVu1w9ZUTdlQ==
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929290e0c.1.1789737838647;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929254e0c.1.1789737838198;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3237bsm856663a12.8.2026.09.18.06.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:23:57 -0700 (PDT)
Message-ID: <9709e146-0f9a-42a5-bfcf-2e5f8b49df2e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:23:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
 <20260918-objective-okapi-from-neptune-cbcabd@quoll>
 <92b7a87a-c086-48d1-8487-883dda7c4d70@oss.qualcomm.com>
 <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX8aznafZtHlhV
 RAwiYQ4lWdNOi6LrFiKaT28Xzo87jXccYdm+cKt5YqdePnNdp6Q3lx0EbVFldoAAto3ZnU1CPLp
 sEHmBiEphOuF/VgZBU10Dws3JDn1udoujRRKct3wTmYw5ivE+oaR0vPDSlcsCtn1gjK/16X5iHP
 XmOr17HcnT9+FSAdLNeeRQM4o6a6QmJqSyuZHU0P8KM1yQTT0WGQZyv1GSKcisefMY+/yDSaurr
 1gdpxalT5LUvakUc36N32FmCA1wBZchyTtZeycfZ79eAROrLCl39SO7Y4+/gNC0EIu+jDVly4LM
 8XgH5C/CdCtJHzk/blxdBIhAyvNxj8CV6jk+qPfi9N92m0faQ13iWe1cW8/BK6pqGdAS5hP8TuO
 r5Sd4daAPHxrTINv2FDpdVXH46wP5efieDVmmo8zumxuupx8d+DhpFzmAWx0vV89U2BxXjR7dN4
 10aDJy4uKCA6TAkFhXg==
X-Proofpoint-GUID: XfPTb2FHLOe6wCcmI7gS5l1d08gM3BIo
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad3b6f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=PwanzjBgMYuxxlb2B-IA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX1QsuaDOiSY5g
 YcJhPMed1ZzmMAzOc4UzoiwbjeG4JG4nU7/pYS3P2JvKmuY9X4MgGlroYji436C7DGdBxROUUuA
 iQrvzJI51KlHWy6EeiZR1UlpgMLGdv4=
X-Proofpoint-ORIG-GUID: XfPTb2FHLOe6wCcmI7gS5l1d08gM3BIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

On 9/18/26 3:21 PM, Krzysztof Kozlowski wrote:
> On 18/09/2026 14:29, Konrad Dybcio wrote:
>> On 9/18/26 1:34 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
>>>> +description:
>>>> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
>>>> +  machines) come with a custom EC firmware, loosely based on the
>>>> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
>>>> +  customization.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - asus,zenbook-a14-ux3407na-ec
>>>> +      - asus,zenbook-a16-ux3607oa-ec
>>>> +
>>>> +  reg:
>>>> +    const: 0x76
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>> +  wakeup-source: true
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - '#thermal-sensor-cells'
>>>> +  - wakeup-source
>>>
>>> Wakeup source should not be required. If it is, then it is completely
>>> implied by compatible and there is no need for DT property, right?
>>
>> I suppose it's not *required* but it's highly desirable.. should I
>> just drop it from the required list?
> 
> Then why isn't the device driver setting wakeup unconditionally?

The i2c core checks for wakeup-source - I can remove the property
and call the equivalent functions from the driver if you prefer,
but that feels a little "rough"

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491347;
	b=Sxfe8aQrrTnaNBS2KytPMo7BhIMAwxIdp7RKjlc+BTzUZ2xGDPPsSxfLO0u/vqoBEWUu
	 cJaVoUeuM9u42DOYDA7BH0jdYBMuTTAkxKV1GZdkeh6x1UUF9ZqajJG9Yx+QO0hcrOjt8
	 KUBAz2Pdwlw9LGacpFE+qWiw16HXTUPAYHwC+bQuTVZnjAtYi09elYi3POAcl3tZHCavh
	 9v+Ggw7HkQmlej9f4wXru60dUvqFTzSG/ZGmwiAXbTwAVvwpK2b+E+b6MCiNM2LWhR6jY
	 dDV+2GRLVY22uj1qRZgAuViC2h8aqC8BCuETxoCuSjLHqOGCmQ6LC3oP6RMEGU040hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
	b=giNJkoy/9EvWA0UgkkM23e6ollKPfz9GAlmj5iU5krZztBFRBJk7wAA3UtRA3P/Xffde
	 8HbHQpV7AJphe+a2ZvjgOxJE/irqytfeoABlkbOTKTrhoiM4MZ+MvTyVEJP1gVoDGsGQK
	 1oVH8w+hBwdzY8liYITI7l4p1+bmDVJqIpIXOr9Ii8Bqd9Of4ominB5/fjqTkvMamWmJ6
	 SkPOgrQqa1FQIHAyvgsk67vD76fnBa25/+uZAa4DjhIwrQ0ghrcJ+lTluz3XobutTKjE7
	 uOXlLfv7wJl/DPbHyYQKlRHePXxxTlWYWyMMiL8oPXGTGF5x49NjdT+PQZ5j3mX/eqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dS9ADkxb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LB/XrMTV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76C9606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A76C9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dS9ADkxb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB/XrMTV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAUnOw1629431
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=; b=dS9ADkxb/Kfrsqbq
	kcV7+R5mEVT1gMPTFpALmOlGY+TRXp0Y6aTe3royqRmSFs++2bvUIRJEfwho88sr
	P78psjoAlCnf2p6/FJwQ5p9/GZFRCAt3tz7rQvtbs1jlXaqd/EdhAKRoUM4Q7W+v
	ITiQ+3WrMPGFofw2UQtRSkWg1swqsBtkcGn2Qb2Yghny+OipKvvsaC7rsXotkAch
	9Joi6OWaY+kA55TfWUGDkExP1TAJm7yi2IfKIP5l4h8qLSnv5ruSl0iQR1RArp8i
	v+c3mUnhAlBzsqYWtuL/Ece7rVZFnJOAg0qh+w1mF8+lHe+5XYVvSfZvA9FWnFOq
	Co/2cQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs00n61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:49:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94607500fb0so705893885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491345; x=1795096145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
        b=LB/XrMTVAom6eiU4jL+d6VIQK88Sd0mAAKGHBIbEb+L8PX0H4E2ahkdB6YuMLmKwlR
         SSRGEjGhC0AzfcWCy2YPKIfJakX15K85/YxKuq0GohCJA4PITS16QYbvGK1341tOApef
         m+GwpU3i1Q7h2HJAmaf7YyWXJ8CoM+BunMyEEYAwrCmrcFxf5OHC3HzJyJj0spL/dWmR
         T9hDrluoh1T9+d45jOH6pZXZ1AkR3/hkS/YFP4P9WF3GdLZ2Igmd0xOoCwONT11BAh+w
         nIEKRv00eRl6EQV2o3JLAusZrt4mjj6qjFnzDuQRdFSaKNSNN16AANDcu0VkaxiUC9yB
         fPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491345; x=1795096145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
        b=jo+S7WA/eiXz6AeDXZTEWhVZGZeFZPs9pmQqVH7xYhUC5xC863R3PHvHWottwpXdjr
         UIiOmoRAHc4ozOS3enBHzovVubN90XHQBy/rZcx2VAt/QA/KgVZzsmSH3xcrYugdVLhX
         WwI4c5qXRIDvPW9BKS5c7EsKKORmnriLmN/LtGAJZEPxyIqYt3/xdiYhcLDgE/dgidOK
         +SYi++/I3vFoNfWZZ/SIVwSi5SvGex0SWMwXLjH9lTyUUGVaW0s+kGdHd8heQTpaXVod
         bol8Ez4kb+5sQygfbWuLfrx900LYnDYTWbkGdNxadBcSNaQ7HQI/0/Uwg4SC1GGqNlyP
         RCOA==
X-Forwarded-Encrypted: i=1; AL+hErHABXigdsJEy4KEUvAOq13J4KbS7elxDZcnLLdaAFYhKQB4qj2MyoUG0FQgTPu/Xj5rsd5lpFsKVtN5roQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yW2G+sYJtpV902OjlNBV0g9C+N5n8r0mNUPUWhVKzzCaNP4/J
	2eGBHa7P1HsTpbSJtGJOH8ZmKzkS/Vey98pGE6C1UZ+oeON4Ppjt10/jSEGF41D81AxBuhq4CaS
	AiJ6eVODv5oQ65KVq2n+L0qCWfAjtcf7B8h4rNEBqIKOuWSGFLy3+0KmdsF2jahC5s0k=
X-Gm-Gg: AYBFou20vhE5MA2uQMevr7D4R44E1gpStM1VqhY1jIbOek0n9YhMVEVQdY9E8Ie9OTP
	fxRefaG0GQGZVahYojStoeEjhKNNTnIi7LAfssxVtZaNxcId3IKHmC3Ad+TpidTVm4WP13RSmNi
	mczsYsWLB8dGXBzRZ05ZDVFWYXjYe/+FBRTli1yz1qdn13yWqwM4tg47jvHAJNHNXnQNR0rzVp8
	0UD3FekmRNO/gw2x5K54FLgD0NuKf9VjHZiqL5plHZcKQQS0MN3KxTyZcfX/IAp4ud2sL2u8SuL
	gmLHFbSkxsLeESqT2zPtzunh+OFXRAi6tpm+ZOarO9xz7asPa1WPuMt8xUVcb7/TYkXfqh1sDjC
	ZjRTsmuav1qEegTXqBo6/z5m6NTiV5i/rqfn5ictbSw8+PRXAdtJc8zciHNS032Y0rimaxQh3eG
	ricdk=
X-Received: by 2002:a05:620a:450c:b0:93e:623d:99ec with SMTP id af79cd13be357-947affe663fmr964783885a.13.1794491344755;
        Thu, 12 Nov 2026 05:49:04 -0800 (PST)
X-Received: by 2002:a05:620a:450c:b0:93e:623d:99ec with SMTP id af79cd13be357-947affe663fmr964779285a.13.1794491344206;
        Thu, 12 Nov 2026 05:49:04 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae196cc72fsm10673721fa.13.2026.11.12.05.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:49:03 -0800 (PST)
Message-ID: <b1b753ac-cb74-4b9c-8fd0-31777a020878@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:18:53 +0530
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
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
 <20261109-stimulating-oyster-of-respect-620b7b@quoll>
 <61646f06-87f1-48da-9b88-8898bb488af7@oss.qualcomm.com>
 <20261111-prudent-polite-shoebill-add35c@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261111-prudent-polite-shoebill-add35c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX1YP+vsTHniiG
 KWr/4/y30Z+nXBXPD8Xsl06/8Xa0tFuYKyWqQXsLMLeUyrghATuwjoyU/m+BN0YSq2sXFN/ZuVF
 If2pP3o252QkTi98psCkJAVQmaH5NptUk/xu/AjhT6CxT4Z/kVF8L0V86b4Loh9rbx3qQWx1S7v
 PwnpSgW858bp86VaVV+OCHjIOzySTwJ6K0y4IiL0rjF9HWJKi8nc+ACzuSPH0fU9w17hyQXw9JS
 thOs788DPLJ5ZjAiHI4qnIv/OfisNpFPq+Z1ny88rjfoT2jZAfv/LdrsPe9HEqfENo6Qb/bG64X
 PXIFy+aApxE5GU25KzmqT2EXNMiEJDOqUmb2QHLuwgQfORY/j0PWHKKIlEHH4IE9CSrjZyz0Xqw
 20zNroOz6HwNwXGYfTExZLkKP0O24ad4jLUgJrJiIu1Q/sRgYID8U+N0L8pywbye7YqGHjMtnij
 rJJJGpVqoGCF0sii9/Q==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5c3d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DN1OgqIxCIglqtzaC5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXwzfDF7/fzeh+
 0RSevogP3V5KsdenqUYEUN7vS31G2joERG09X5OhyvUGX9W9dmcDnF+968L90izAMb76TvV4Sq1
 3z90dX3UTG86XYIR6okytNhYMgksWuc=
X-Proofpoint-GUID: GdhQDv-XnwW0xpRNYGOsu3byJxA2CgK6
X-Proofpoint-ORIG-GUID: GdhQDv-XnwW0xpRNYGOsu3byJxA2CgK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054



On 11/11/2026 6:10 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:13:33PM +0530, Jyothi Kumar Seerapu wrote:
>>>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>>>> +static const char * const protocol_name[] = {
>>>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>>>> +	[GENI_SE_QSPI] = "QSPI",
>>>
>>> Why are you creating holes in this array?
>>
>> Hi Krzysztof,
>> The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the
>> existing entries cover IDs 0–5, so the designated initializer leaves entries
>> 6–8 empty.
>> The added NULL check rejects these unused entries before accessing the
>> protocol name. Appending "QSPI" directly would incorrectly associate it with
>> ID 6.
> 
> And it should be 6. Just look at uses of this.

Hi Krzysztof,

The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
This enum represents the serial engine's protocol IDs,
rather than consecutive indices for the name table.

The SPI/QSPI driver uses this ID to request the appropriate firmware
and validate the protocol read from GENI_FW_REVISION_RO. The firmware
loader also matches this ID against the firmware header's protocol
field. Changing QSPI to 6 would make these checks expect a different
protocol ID.

The name table therefore needs the QSPI entry at index 9. I will
clarify this requirement in the commit description.

Thanks,
JyothiKumar>
> Best regards,
> Krzysztof


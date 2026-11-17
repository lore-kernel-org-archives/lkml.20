Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936523;
	b=vv4PsOjoUwg9tTgjG/Jp/E6oibYMj5BiXQ3+1J1jP2MwWsT4TOBO3uD1nDz9o/uD6C+s
	 axlF1RbHfbSVmriFU3pnmYXm2faBQyPIWTuccgSEUpp5v4zu5f0PhFueDx5z9uCIC7YWH
	 aCs70UDqrw7hDJWPiVb/qAcINZ0iwvrTz78la6hOorjDj8ZVKb1y/OnkxAJTS/ky4wgSr
	 hY/jc4qlrzwAA3nqwhlmlq7Zyk4ZGIHKPy+wjJbE0cf/hm9a73xpKVQeB6ujDH4Mmef9b
	 17YCEXiPmLu3V/EASs1c4Z/r5fI+K/b0BS11WQJgFiFTyXgJ07qT25jiAYlPvJ+iPYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
	b=HD+1T5m0gvJ+Vf7CnNPN2qQ1dhOV/TGib2AH+tPJ070iwwPok2VSOTpQuz2CHlHbGONx
	 AUUe5ylSW92VEZd9O1Qull/LyeC83FwYAhiKuFytGpBl5EXi+Bl8lyHq7rhxnc5nQyebY
	 sahkOU9rCaV94SdYJr6hAiappPnxUfOvoi0HgeDcv960QmekeOZWFzxvDgxBA/AgZZrWA
	 A1zPEBXhRFbg1pZeNmWG0xk+M+v9J4gRSpj1Hj6BAEIfUZAWXSiMrbDCi2zqz2lprMHw4
	 RrVJh9/JLxyC77mtiTSvzlmAPN5PbLxMYblsazWPHt5r5qmOgcJ7pkSiF6dmOjP4N5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJnEhgb2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZLWtSpQt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A4E606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A4E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJnEhgb2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZLWtSpQt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQbEO1916111
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=; b=HJnEhgb2bdQlZQjE
	Kj3chHu8kiRM9GDtJyJ5j9eKdiU34ayyp8yocjjJ7NzMEMGXXjAHYO80adE+dv9l
	IwJTnWmRmS3mqivaKRAv9BWXSSNRwn0Eci4Zw6+gFmIn1QNGapJWYw1ipIMM0yPw
	5VI1WASclYFa/UEoqv/95IlFHkMNgNduE46RommRNzv++Bb0JHJm8tTK+i+5VjlG
	l1OZ5l9tfLTzX6DMAzKpXp3SRPqmjcDZqfU7P6Fj4FAavzqznt9ERRV7m7wCH2a7
	ZaARfp83EReIFAkOvHx9FYGgaBTdXWf/HkRLwcrdjsnoFJfmNYWzS0BTL5WYs3OK
	EmOlfw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc81t5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:28:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so102298eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794936521; x=1795541321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
        b=ZLWtSpQt2IQaOyLYJvegt4k2ygfrcYExvUkysnEDZSeYgg56n94jPU5JiKp8OHdBcp
         HoOh4UqxKGlQeyej1KZ6cvCp51YrbDD9RFSzPVHV7dQh9wVjO4rutRA886Tcu16Tn0Pm
         oKBYiLkjPmorsrrwR6OdmWI+t1H8NdWF1xXCk5YL6sVaIqdgeI63ZhBnmubPsYPEL9tM
         Rbqg8RldzvniTCug7x2r89EjfjFlla7KaxfC1N5Y2kP0Lc+NRt8Q9/S76zstVfRs6fx4
         hnvhXcjI31fOsFtXofcl8mdVnnqakEVWnUPb/ghLU1vYLnla2JK00oBu0by8Kyn0hbWu
         xTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936521; x=1795541321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
        b=pJo7SHfOXgO4T3Bx3vyFq5aNNnC6+uMoPeO6EL9jAc9ILTj/+8b8A+xKnppuFBmNf+
         KGmAzcOX2kgwgkdPKxtI1KtFGI3NRiEjxo5GqbLZ4GLkY2x7jLdQTsDxcWWC66MQgPx2
         ZvV0FiVTiEw0/Am1ylPe+qvcOhLwxe29P3pqLUCC1rkFA5Z6IsZNf9Rksfv5h/MxiyJk
         U3TLuHzIF+8FtPw21PlHZKbhSX/9trClmAkCY2C/WduGXuMTdGFGlMoItER/w8Gd3Uve
         aM35x4eTutv6u9D31t8fXt3AJWX1Mx+TJl7UVorP52DGQUiY+yDcU2iosQ1G9BzU+egc
         p0fg==
X-Forwarded-Encrypted: i=1; AL+hErG99LQcLWTiwRld3amJxdqFreY+mWHBinZ1j+pXfqSkPy0fpZ4D7Qlpmj0u3Cxec8AvpaDizd8zhNT12LA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cHf8jn2/21qrKmgathuhvy8sz+AkVraknr1G+3fR6Of0K/q0B
	CLPesUMfaasrn3/lJ1kdf5NQHmluPDF86vQMe4YEjRPQQ0lI1pIS27/wpGjjLISiJRei9KJB/Jv
	czF4GALjl1C3upnuv510KiD16ADunoIKKKAg/su0/gVwqnsRZGIxup5fYAqDw9eyPZpo=
X-Gm-Gg: AYBFou3JInWEbCkuk94UyPdx+IHbrJvcNA8nQKVmhmzucLLRZhYZBn8c1NhPButlm5Z
	An4tNTI4halgElr3oX+8zRbnuednr6IgHw9CLeufzrshGlT4sEkO6Na+vzjzJdT6jk4Rz7iPReS
	B0VzBBdV2ZMSJTRewKRyt1IEXcFCpuE5V/lrOWOzzQIuigIXEI6fwavbRRX4o8obNiVXx6Njbd4
	q8x4R6B9n5qNPRiGGAVz1EIMQI8bH0YDPfxh4G4sIsvbYA2xlyWPkKezzBVWatCFMU4U7aGYqzy
	Osc5Vsb4guNdccVK9OCS8OyysJElu6NClBr0N1+u6RdGG22/bQUrVljKoj+EWqmit2B1QN8Y27b
	abfhFYd9XlTQbomK9ea1qRsl91LNHWncBS70W7XnBrKulP8XUI74xLGNy6PHLa5mV5mEqtdbtif
	+w7X3AWY1tN58jl5Hg
X-Received: by 2002:a05:7301:188a:b0:37b:e40:397e with SMTP id 5a478bee46e88-3827ff7aef9mr93348eec.14.1794936521222;
        Tue, 17 Nov 2026 09:28:41 -0800 (PST)
X-Received: by 2002:a05:7301:188a:b0:37b:e40:397e with SMTP id 5a478bee46e88-3827ff7aef9mr93316eec.14.1794936520694;
        Tue, 17 Nov 2026 09:28:40 -0800 (PST)
Received: from [192.168.1.66] ([103.172.4.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm48943359eec.23.2026.11.17.09.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:28:40 -0800 (PST)
Message-ID: <1d294300-0077-426b-9bbf-35e42861236a@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:58:29 +0530
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
 <b1b753ac-cb74-4b9c-8fd0-31777a020878@oss.qualcomm.com>
 <4060e67a-553b-4e1b-9e17-e6a742e62a3a@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <4060e67a-553b-4e1b-9e17-e6a742e62a3a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc8eca cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=kYVgg70FI5gtGbgwxQSixA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=rBq-xhpCJJ2lye-X4V4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfX1S/uFWQNfFZd
 vbkJ0uAWelZ3zNt6ix7gNLzyhj2j0Z5ZQsU11ajq9C3/m9X09VcZJcCDIukQ4uQl7sfqyt850ZG
 Sx8QVQB21RsRyRgzWYn657zFUky/EXU=
X-Proofpoint-GUID: neRyfir6eSYJiYg-8O37g3gDNyWF9OAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfX+a04qphAnu+a
 0/0VHsMkS2Jum4fQBeLi2UnJ3R7AlXBygTaiOPCy1ScY3+vhm0f4omrPD16HuvzcxQ+qfwc+2qX
 SgKCTx8nqrejkLPIE7t1+GXA0n5qvx3MYKHK/ZyQ7foECO1qwZdQzELiPao4u9nYoajrRODwujc
 LPhdhzFnP6iwf2KCnxLtKcRoeJFBcrcL/Drzgjqw4rkGskdKLbH48lkPMnP/tTBTIzzrtP9tAzA
 yOIjvX8sDzDBKBvTtHeIIX2pQ6JWH+Lw8ShXr9lszK+Xicm3vVnfP1sMra2+ibuCJLHytgFC5tk
 gao3nY9IAe0OAGXzx/yqjqjkSlQxKsxGdVwLERUXxz6QaY9l+zbr7OMIj8IAO1GyS3/segyulUK
 2LaWSl84hT2oywtdCZ8b3TY3w9RvdQBKmExOAH5twRLwX8fNqCCJlFBulxxGktcuMH8v8zpWKxn
 d3ufGyKr9fyQbUMCcpQ==
X-Proofpoint-ORIG-GUID: neRyfir6eSYJiYg-8O37g3gDNyWF9OAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170069



On 11/12/2026 7:26 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 14:48, Jyothi Kumar Seerapu wrote:
>>
>> On 11/11/2026 6:10 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:13:33PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>>>>>> +static const char * const protocol_name[] = {
>>>>>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>>>>>> +	[GENI_SE_QSPI] = "QSPI",
>>>>> Why are you creating holes in this array?
>>>> Hi Krzysztof,
>>>> The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the
>>>> existing entries cover IDs 0–5, so the designated initializer leaves entries
>>>> 6–8 empty.
>>>> The added NULL check rejects these unused entries before accessing the
>>>> protocol name. Appending "QSPI" directly would incorrectly associate it with
>>>> ID 6.
>>> And it should be 6. Just look at uses of this.
>> Hi Krzysztof,
>>
>> The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
>> This enum represents the serial engine's protocol IDs,
>> rather than consecutive indices for the name table.
>>
>> The SPI/QSPI driver uses this ID to request the appropriate firmware
>> and validate the protocol read from GENI_FW_REVISION_RO. The firmware
>> loader also matches this ID against the firmware header's protocol
>> field. Changing QSPI to 6 would make these checks expect a different
>> protocol ID.
> You miss the point. This is just a table for Linux driver, not what is
> programmed. So please explain me, if firmware comes with new protocol,
> e.g. OSPI with id 10000000, are you going to use that as an index?
> 
> Really, why are we discussing this?

GENI_SE_QSPI is also compared directly with the firmware header's
protocol field and GENI_FW_REVISION_RO, where QSPI is encoded as 9.
I therefore propose retaining 9 for those comparisons, without
using it as an array index.

Can I replace the sparse array with a switch-based helper that
returns the name for each supported protocol and rejects unknown
IDs. This avoids holes and remains independent of the numerical
protocol values.


> 
> Best regards,
> Krzysztof


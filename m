Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874649;
	b=LPLo3VlT2IQlqSM6YKEunCsKODfbagmeG+0PwGd+RgbvQcSNqrZWkXpxRBdqo81IgBCR
	 gra/DcKwXaJoxpy1wu7J4df9/o6wb+zfIBg+jW/Y/fAw2WyOcfOLSaVALAcwHefARnfKt
	 AtByegx04KCtSfb9smDKmslvKrmatEM5flFUJ5Zi9M0x9lflls4NeBQgLj/sdvdaMK7t2
	 f7oJc1t9yCtJtiRxa66WBhChsetUDapWpmEVOx3fDEbeX1IK/9oOAY9AXpW+4rUyvQEqF
	 x2NbsdRvzpPG6VuZEgbyoJDU8HmUVCtdgBUgbmr8/1g6uy4Hl4vZb+aooyeSVnKs0iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
	b=orXwYd0tckrvJ1BbcfdVjADUk7bP8ELbFHQNenu3vlGydoO/EcNfbV0d/5SP1jciulO8
	 joMH2uRJ3T83XsI0sQVUhDEC7Oa8P+4tVAQdRrr//oACgGkxHc5oxJlBzFV0Y4ugFZMhL
	 puOf6YjNI2OvyOd26WG5SOII5g9zI4V6yH25PsKhJA/4wIXXHFxB1AoDo1VneBf/tNXLK
	 HwCE0UD6KHTgTh4u8nZBGFxk1efJH0wVrQ+GD0rQLE+vv2ney1Qcbc6w/avjU/0Zl7aT5
	 LjVK7h7HG0aDnI6ahOtRAnmKYsox5VyzsGA6tRZlceY+BSso0QDmHh+Uz7kmH6Ygrew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nwAkK7cO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaFFcR1V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BF606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40BF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nwAkK7cO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iaFFcR1V
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59thGg3532014
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=; b=nwAkK7cO6SzNaNRI
	eWRZfMBrewvD8gZN1WvfIQyNbkUSb4wBs7PsEeYlWpacGKmt8gvqjN0hP1HggBsr
	VfTmzWqzU/Z+HANEZmH6NtLJ9TZrd6ydK94eJRoCcR6ZYc0YKvQwamb9xOxLSmq7
	XySB7fzbxESdJPAYSTFif3208JPPqt7bUOMOd2KRjCF79f/VdCvODj5iS7rmdcU4
	F+nDSYfNqP+pEs8HqwH6P1mo1WmGJmTR30FScrUmjlwE9bi+rbSF5k+Qv3naLvEQ
	2Q08KJjGvVt/gZxwv9/vMzVM7ffI/RH4IWT0LiAO3W4/HpyMWdzc7ugQ4Qk0DvRR
	+8ckFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq95d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:30:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so1747944a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874647; x=1794479447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
        b=iaFFcR1Vk8m+zKODmIzMhEgra52DEYtUr+SJsMQPvhXcDaxu8Eiau6WLq6yn6RCu/5
         7eCwNYzNqQzmgDNHK3bdffm9QRqPdf4SPVHbWOyPvNK5W/q/GDj3VoScrf48SB5CTycc
         5ttQwioQ6kztqb5nnfj956Vgjf4IGd4X0qLUL89knBtw12P+kONF9TTmDL7iUEyySR85
         Ym/UA3xKRnV2xOHzOFaxMdnhSvnPw1+rjVOn2rULFPLSztM7etUvGxZKg0+FwPr2vsMO
         qgl2Qs/yQ7SUpKLoy4Z0OuZntWBo5EdRxyOdvNlUl/tfEODQK3GTgF3S8cznK/ZhtP3g
         SesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874647; x=1794479447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4eh26VIvLph9rixscA5Qk9+BXI22FApx034GLz9Kzo=;
        b=rvYD/G+MXcDCtKXblmrCR+00Gsk6jgD0b9vz9mngpfk9A3msTDZD4O1fj7mb9aKE5s
         EF2mJi9hDSmtCk5hQLFgnPZvfWUoyZuMjBJRHO9Pt09EHmNj3Lwkb/b4j+3FeDKWuuMR
         qaEKw1XiAxVCQZvBhs1Fjob9qXuZKKjU9tOduq8qvToMpKh3RRvNY2XY+Fc/pLoXz4ZS
         hvCeqK61vsFpF+tEzQ/KBMXO7IZaZhipmQNTS3gGLPmJ287Rj63Gd2N58+Xib5zu1Z6k
         nHk6YjE/87hoLKxcxN3oE/1pinpS3CJoT1Fupia7I6z3VX+Zo3ZWNaQaSYi9OYGa2v2F
         aNVw==
X-Forwarded-Encrypted: i=1; AKwUvByK3n4pfqWssGGuIgVEd4nuf3dKEjjqY8/NnZkLzV9TvQe/qA22ke0YbDYW7rYf+VCcn1v3f9iYSkw6C8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cuCVHB9W2DCXt2FsPCB3M/RCsTnVtInpr/K+OY/VzWCMpxJmL
	lsXMGpxxi0jfhAprg9wz6gpdoOU/ToChfH19KztvIEFS9WvOA7fEsEWw+KqUerbsWQK1RvCFzHE
	h5W8jOQl15Xu8fQUizgb1V9Wl14hH/GxhBbm/UmJCnWLIJpMYdTRx3uLM+CZE5E80MzU=
X-Gm-Gg: AYBFou3wJ9pHBXZzb1IQ3tF92mrhNgVWuwbpd6vsBiLjwfFWe8sHdwpnqCoROsVS6AB
	TEWxrf++xAHObyuzh7QBNOmn4T5TlmLMLlqyTYF11NGvG2HztyPwTuvS/kIzzuIWDiY4ABawZLC
	L5KiWnwqM58IB7vhT/f8A0KqDX7LTqVkpnc7JR0MVgrwsXsvUhIZZLf92hAV6rB/wb+CG8WJwr3
	EgQ4njfy60ayGXa2T/lqSUj4cW73Up4sstE5eoFRhUzMi3KcQ9oixOfjOeEaccRzsiybdiwyxp6
	toEq+EG/DB8P9g1bVxZae4/FvNg/9ccL2OI5EYoDhjTtIWqno1rPzxtg7ep/Swm+DvHpnzBblUj
	PtnxZv3UhGAftk4++82d44wuGBNjMlKNJNG5dXs86Fs2Xmd9UfWe7PVZAmvaNtYBkAzWgEp6Tpg
	YzjvHoQg==
X-Received: by 2002:a17:90b:4d01:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3ae8970ef3fmr15692687a91.18.1793874646671;
        Thu, 05 Nov 2026 02:30:46 -0800 (PST)
X-Received: by 2002:a17:90b:4d01:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3ae8970ef3fmr15692668a91.18.1793874646235;
        Thu, 05 Nov 2026 02:30:46 -0800 (PST)
Received: from [10.217.241.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cd6c0sm3232520a91.13.2026.11.05.02.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:30:45 -0800 (PST)
Message-ID: <2b5c5216-40d6-41e1-b79a-76c56c702348@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:00:40 +0530
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
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
 <20261027-talos-lyra-evk-v2-v3-1-658fd5a7ec99@oss.qualcomm.com>
 <20261027-whimsical-russet-marmoset-f248ba@quoll>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <20261027-whimsical-russet-marmoset-f248ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX5okfkRNEPBtq
 gEmeOKfnSmg2/Y143VStaMNZz1Zqp/M+Pma5e18Y54c3SmcJuA8AjvV9cOy0PZ2UzAASAmscrjU
 EPD9wZd/b4FGGUxEWBmI0vgVky9M0imP8X05fh+An/3g6iyDkqMmpX8OhuC3caoYsPPMNTTIG9D
 9cbU8zmxOui14PQAqDq90ydnemVg5AKCWYWODz3z8ZRcvTj3EEseczlMVyPd8zLr3a40Ri1tFHC
 pG1uzdDaub08YD4uoHLi+y+qzNngYsoT3IU8yi1peQEbHE9t9M23K7XjQqJ6ghxDBGggdRutgWT
 vywukdeUqMD9LROVRctYhzl4z5FZImqp6j+I37+nSXpeq2OOhnUdp2RFQDvOL+8u7r2Ni7QiFiw
 /bh6FLWA3Y6L54BL8GZ3ylBlVMm4lJCT00M5yJyTEdMHvEX5XWWPkTYR4XAF46/4MO7RZeKO92N
 jzzCwRJgWvzPO/LjXSg==
X-Proofpoint-ORIG-GUID: ZtqQusLOdu-5b--ld5ar_JXKP5vw9z8A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX+9KeUzUQN871
 VVcZTveSQLqy9/fZrmd06Hcj7+2rIJhlYmh9iSJiVgd7ZcNSAPeT8hDJ11BQbcGUMMGvt875eZF
 Twg8blh++GdkpdhkwmVyqVQpffmjVrU=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec5ad7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OzfGJC1uvw-XEFatyoQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ZtqQusLOdu-5b--ld5ar_JXKP5vw9z8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050041

Re sending as earlier reply was rejected due to HTML formatting.

On 10/28/2026 12:11 AM, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 05:01:55PM +0530, Ruchira Revdekar wrote:
>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
>> The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
>> qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
>> than introducing a SoM-specific compatible.
> I do not understand this logic at all. Usage of same SoC has nothing to
> do with having or not having SoM compatible. Every SoM uses same
> compatible as some other device, so we should drop all SoM-compatibles
> in the future?.

Thank you Krzysztof for your review comments, and you are right. Sharing 
same soc (QCS615/SM6150) can not be the reason to omit a SoM compatible.

v3 commit was misleading suggesting that this was the reason for change, 
will fix it.

>
> So if you have a SoM then it can be used with different boards, thus it
> should have its own compatible.

In v1 patch, the EVK root compatible list also included Lyra SoM 
compatible. And as per earlier review comment that there is no value in 
EVK claiming compatibility with SoM, we removed SoM compatible from EVK 
compatible chain and added qcom, talos-lyra-evk directly to existing 
QCS615/SM6150 group.

If there is no value in EVK claiming compatibility with SoM, then is it 
fine that i do not have a fallback SoM compatible in Talos Lyra EVK root 
compatible list while I retain qcom, talos-lyra-som compatible for SoM 
itself?

>
> Again, explain properly the hardware if this is the chosen design.

H/w toplogy wise Lyra is reusable SoM containing SoC and module specific 
components. The Talos Lyra EVK consist of this Talos Lyra SoM plugged 
into Talos Lyra carrier board. But The Talos Lyra SoM can be used 
independently with different carrier board.

We will take care of above things in new patch.

>
> Best regards,
> Krzysztof

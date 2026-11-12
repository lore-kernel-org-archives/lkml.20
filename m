Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475918;
	b=OuWXA/ndTGMqDg9lFfGElstnUHG4ohX8YGCskcJCo/g09R4zZwinCTwDUerQSEvZD7V7
	 ejRoi6DofP2OwjAiSsiS6M/iWvgckKJF9YWyEAEyqmKuZHkfbxJc2x4rDYPgG4jgfC2Bc
	 Pb0B3szdQAVuh6U9xs+hE91HYzTVYHAfLh1LUkSwwf3YjY8QVYSS0aqPSeZgn5wI83VQj
	 jxqRVTNZtRe8H0g+XUu2hc6/1pFOuRUKCAFVHjEhTq1sF7JDyKMx/I7wW8y1eZV5g/tgq
	 zIfA1Te7eFW0NqWcIFauCbSrWOLV6lgXM9W67VL/Xo+xWHttxlDrPlTp7thaDV4Bq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475918;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
	b=Tk9H0fyHfIkB5fmKBmbSIWhsM2urALuHUw2kbpQb53YIgPguML3x6dhwQvwFTEU6EGfV
	 SZCcltqh+fEKsDfil1N5RXP1xlYt8puhPQ5RGk73IlNBcFxqXnHUUDP4GcEYR3eeFh3PI
	 qWShEWOKwBn1OwR/7C+EWc35hjIi42dftQN4vg8XVKP6LTs6/7UvDcgSAlZXy1/zQzafn
	 H6HdR2uiuzHAvrvFzCI+zTquj2kzP8RBl1dtLX3+b4h+haWfXBv3Ln4d1vMgwpmiPp9pf
	 X856A2qfUSFc2OGwlmwgBEqtnmajhjf8PLk75LH/3bb9D8thd+hkdNPxgTDkfyMA6QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D7CE/Tbh";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vYyHGU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DAA606A89A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DAA606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D7CE/Tbh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vYyHGU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5ne99441576
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=; b=D7CE/TbhTazlPtzH
	NyXnko+sJjN8ZOueSlXJCSYCGpuwEfGMnxBmv9ZMBzD3Lzj6w3fHLna/jJAkLm0S
	9xXZnaLviW/cBwhqRvjNF9udK886qUkyh4iqu1qIcVUP4WDiuyVb6vQRQEN1d7DH
	oFbb1XZV43MnKVCZJB3TY8AI5B8LCUbS3KMZBbsO+d2clOxYOD5l067hzfn/i1D9
	5e7pcXSXmK9LHaAv0McfZ6Rcf/hjjfvjRvp/ZGtCdJ62R1h1Yb65iHoSSS3Y0FYi
	kYpUkgDMWE8n14AMEd0H3ElacOSeLlwexcYonOwwAu9VUfzA6YKmiUSNvaDHqLVT
	Cg6J/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0tkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:31:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so2403890a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475917; x=1795080717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
        b=f1vYyHGUXqiLqzGdXK8nuXhwV7obY47U/Usfy+R75vioJBArxC/ZnA5gAn6sZ7+qE7
         ofIl8tmKxtjqiE/FfmCzyEPp5Cl/6rA3Sc2B62Ezi6R0oXJtsNjIUNvIH1lHjI8Z4khn
         0l7HuTgDGGq7fzfM+Zrw6Vg0esdH+60cV+InnZ2Byk9XdzVenKBbJFu/kmuN2hs/tSSH
         GrvRUZga1+OO9ElUYQbJpXZAtSKdR7L1TK6NUyUCdGm8CJKN1163ifqHgauWyVilVq9m
         2VDfk41SDWhS85a+fpiiqdElN5ZdlBKA9qUtiZEf/fR0YNBWUSies/i3gb0NSHxmpC6r
         2ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475917; x=1795080717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCuGPHtHnPRrKGh9BUttafHVJpJBdP30pXA4h8qbWSA=;
        b=FJihvwwCVfvuv052LnjBYxypBQgir11xuhBFJVOTO7pDKViF39R0dG4Fuuia4/MU5K
         rzF7EQLIolGhX4KbeSxJny4BHufY8aw+04hdK8tc6aDVRy2syyI+McfighCyMlZHaShJ
         NCWRaSEFv7So/g32rj8H4YCp11zaBuTOTP751zv7GCdTo+LvE4TebFzSrs6ZpzjH6oXi
         U32US5rwcKqPs/5ffIMFn+qhF7udlZlXZUSnFC4jR/0oH8kIsfFYn7cX2R1VYhe92+ig
         raODGapfMABnRwhCQce//uoLxCUmU7Rl9jNfN3KynokNyw0OUYrD9lM2ghkFLMpZgAIQ
         EOqg==
X-Forwarded-Encrypted: i=1; AL+hErGLQRzlN7jEMOHuRiLKu2YYuTU5qkNU+dNCkgddHcFgZ4P68Y1ALoDiI/60HkG26hAAQ/Net2I+aSe8itg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HXl5V/0Nnn755tDs+W+MEyq9cTKV2ah/wGyYoNyJHVlgxqoNo
	ipujfpSh9eEM3Farb0dq02WN/Z/KCp4/aT2/ksiJrWOuj4g9PK+8G59/2zEQ8zpgCQtmxErOJkI
	gl/oFxPB09e1JcZj41u4+NZOb3UPI7SCnGddEUwInuWI2pVNVGAernxiYL3EGM+iAyN8=
X-Gm-Gg: AYBFou0Cbcs4CdztOaeiWLbs0FHMyNXezL5vIqSEgHLPNHQY0M5/doxHo7AiKyEOgND
	M4fpWPvMHSHGdgTegTdGZth0HXyENQS02ZEwSirEtc3oHlboSqHY+bpWwyuXyYiiKPW2QZZfK0h
	1/G90/rxIkc0rqtqhUKo69sik2H7zzwTewRHJnjTIg27BBvq48zzPvmgTqzYL30Y3SEI2ZVfRXr
	FT+vE6orfhN6If5hKSNscFIaB1mzfFiIwvnH3IrYp/55v8Km5kkoxbwOMzp+tgTAsYNWUQA6xlN
	1guFAEWRql6XMStGPLbBDoRC0hPUEgNl1EEbQ4hyXyAFSaN/WaCmkpDL6S23bDwtAYU/bpBI/KU
	wbQf4SCbk4P2jbOnadZczX8twMgKo61oL5joXGJnrRz5Jqrm0Z4J02zojazH9JuiUuZP1JnpR7s
	gA
X-Received: by 2002:a17:90b:4c49:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3b182e6f54fmr4910349a91.19.1794475916845;
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
X-Received: by 2002:a17:90b:4c49:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3b182e6f54fmr4910327a91.19.1794475916412;
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c9d7c1sm3869051a91.17.2026.11.12.01.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:31:56 -0800 (PST)
Message-ID: <f2b119c7-ba01-46fd-96c4-10b918f98d53@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:01:32 +0530
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
Subject: Re: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on Qualcomm
 SA8775P and QCS8300 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
 <20261109-qualified-pristine-newt-ba1c0c@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-qualified-pristine-newt-ba1c0c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 23qtxwwuN-aDFWfABCnbrrOGRAOPx7bf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX8Oe5kmdOAVfr
 XcR794e3JoKM1xoOnhIjz5sNSl4aiYuttS+ADY38PAy/cZjmtAdgptHt8S9dbMrrAoJXkvD170e
 tp+VKS60yXDvxFL+imKdgO31jrBKUzg=
X-Proofpoint-GUID: 23qtxwwuN-aDFWfABCnbrrOGRAOPx7bf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX+QLYK1B8n0wJ
 Sh/su2o1L4XgqSi3NOznyN8A5JpoOX4ceCVAlyFTQGrA76k+Jzry3kzcQUYU7Lz3vb6pJPRZ6/8
 Ff5c6GQPYBmQy+4FRPtP4C09I5KhFUbhLQwWHOowEJneCKeD/oIaNjVQwBULrgOI/C3+nurM8EW
 Sb7eMM1UmYlW/SkF0DYRuTW/ojcjsMk5NiujM4U+JlWmrEcoL8cWtR6dJgf/HGvw6UHh0U4mANJ
 IOpYBiODUo/yc5B2OV3L4k/B1+OpkpipMKLiGJqNXu8WBI2HF3UEPSZUQ9Fi1nfSu42b3os/PpH
 +NQvkGNUy9en2Sau6K2jpZ9RLGr+E3wRwFazaL8fP75xakHng1/w0ys3O+uua8DL9qL3eYuFV6H
 eeSNkFafm7bN9ZJsqu3EkjFBQ6YTlc0y/hSBgyfbB6zaalOo9ACSbmO8/wo/34/3rL8C/+UN714
 zpMgVbkJL9ihdW4S48w==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5878d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=-_rbqcG8Jwc29zszMZcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120037



On 09-11-2026 06:18 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:22PM +0530, Imran Shaik wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sa8775p-tscss
>> +      - items:
>> +          - const: qcom,qcs8300-tscss
>> +          - const: qcom,sa8775p-tscss
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    minItems: 1
>> +    items:
>> +      - const: tsc
>> +      - const: etu
> 
> ...
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        reg-names:
>> +          contains:
>> +            const: etu
> 
> Reason for same devices with different address space details should be
> provided somewhere, preferrably in description. Assuming in the first
> place, that this stays because how two devices can be basically
> identical (same compatible) if they have different programming
> interface?
> 

TSCSS is a single hardware device, split into two sub-blocks - TSC and
ETU, each with its own register address. Every SoC with this compatible
has both blocks in hardware.

What changes is whether the vendor/board actually wires up the ETU's
external event. The ETU block captures a timestamp from the TSC block
when an external event fires one of the ETU slices, which are driven
through board-level GPIO/IRQs. If a board doesn't wire any slice,
there's nothing in the ETU region for Linux to use.

So interrupts/pinctrl/qcom,etu-* only matter once a slice is actually
connected. Because of this, only the tsc reg space is described in the
DTS patches today.

Instead, I'll use the "qcom,etu-slice" property to drive the required
constraints, and add reg/reg-names support in DTS by default for both
TSC and ETU, and update the description with the above details in the
next series. I hope that works.

Thanks,
Imran

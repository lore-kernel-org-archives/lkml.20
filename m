Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481429;
	b=v4dSHDG1ZwbBOlsB2Wnz/poV/1jdz7qJ5xFY3ofgUleDBsb9SN8Gy7wrB90QaXUxY7TC
	 wsllNLgWV1Va6y3Cwubs5urZxPPmgOGu8widF9POIKU6il4zEOo9qHXtY581IYnwPFzJA
	 P3Em4AwO+uWhGsb9qvZaZ0H6OMOXD6DHHkas1fPbGLipEb8wGlyXyp0TF/SZpInjfMy68
	 5Npli2m+QxCqjf18St3WNAD17Jw/zR//TH2bTJuMTNBumPXIRmNvQFiLjTeHWzg7eKytB
	 Wk60hETfotw4tiTOujNUG7adl9PtjThYw9PFQSXbKYUfZV0YRS//2zMdp7gsIniY81Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
	b=AUiC2nuNLpuFm7J+CjYNAtusTYdySGetxbHHW0M9lXtEbsbkzczubA8EMVEITYj/vRWe
	 YC5V8YhAVcgmGfcnV3eZTxjUApUZIinN20Khvd2kmB+g7E0cNn70BkzUUOuDwINoDcnSO
	 /VhsFozgTHSIQShLHIoit30GHgTK5e1YwQnmNiNf3b0Cbr2YNtzHQh8fnc8Z1honVy5U4
	 c5ScUnpMYNjlkXD8FuEDEJcZOPatLXkkt1wltGXjjeZY1ung1zBWudmw0VRUi13paP4GH
	 GcwouXOljqi7EADstl5sUOMND3gl96z1SMaJO5b3nln2saOZHmjRzauRitoEEzo2DKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWnIhHFy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZUz/lRLO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAA5606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EAA5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWnIhHFy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUz/lRLO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tdle4032439
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=; b=XWnIhHFyxb7aEpiq
	xeGv4niNxM+L/QgL27aVfxAgYAY/CEE1QzmhjLa6+jGoiaW84KWmSZe0lDskvWhd
	0x/3T1vXqVk+/JqHvYTP6r/Hmq24EYMTOcQmOdSJpb8c8+QtaFQMIoSOw3N27nid
	aVBWUsTpBvNGoSS4UcjicM/Pn4uNxq8p0RIVWUzFWVdw8t3Eyzs4isbEtLa/SF/i
	d+PTTBTAbf0fzupF6P5cqKu22u1SyS/h8UY947kRTzsuHqg0OBrpEyJ26w/C2P7c
	AAiz0mxqPta+zbVcilSFtVz0yw8GzFgSXARsNTAuwMEG4PWMz7yZMGQOxVGCkowS
	cTXqRw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9bt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:30:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533962f6bc9so5886191cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481428; x=1793086228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
        b=ZUz/lRLOtNs2Z4quOHQRqhaWPH8KrLg6vOse1CQ5o6dyqhkG4pgzTjroAMACTR1KsH
         PPZ7tp+m71ngqFw3UbU1nQ/rz8Mw+9QzBg5+vPczdoP8JECbJB2MUtYdE24hMi2bscO3
         eVH2Tm6Ml6TK53p+w/jZ1AdOYygUlDduC/8gFK76UZzhVGTYgCWLQ3pgn4fq4Rax1Tww
         kWJzh6hf+UQ1sIkl+tO+dkAM0Upb7UfqiCg6lnFicjxoRZ4pDF9tutmBeMzkRE0TY4YN
         LvWPcI+XrX0AvsFzuWx5Dha5fVp4uSUs2MD4XDBHZg9EwSINmXuNz+0jX5vnLDPEfvWo
         /G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481428; x=1793086228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
        b=BkXsTy3zTlhsphWdrZQupYytwB1wAfGAo+5e/EU3sbj9/rqiXV7PoCelSTx3cdSbNl
         khIe7OmnZC6H11UqPeis+alyhDwX0QBVQNvAesXl4ZkGMawW5lL4KqDXX970GtrQXujH
         FTWilu5yOluZx8vD673fP/3immX71Ef9g4v0d8tg4eWSWSGSMdWteqaGs+ESjNywkbiv
         gRP4dkngxFV8k3EiDIJTG0NHHi4b46Auq1fJGzcgxCu8CQzsEd6XSDkkd70ThSZm5mGl
         n1YYezp0/Pwtbenil7HobMAHmiWgzKWH5cUIIPc+gPTdgsRJfC2Blh71VljnnIDgRvul
         l/jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRHnrOdZw5Oqy69jdAnylR6ylpmdNzyHnyaVY7de1bRA2UAis+KEqLkaRdn+xdq+70k2DE+B8+cqxXxK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEqA7zl2m+HLyyJterHfeO2577p+peX5352VwNQmy86tyefEhi
	KSPdATxzV4V9SvVJIneU3Mgrr3mpXxz2oSEzq20cVStZWFu5GxJ10BkxqWNtRnzAB5FscMS682u
	YmfAsIWaFL18QXmw0JVgNHQYWsxcRKQCZucF8tLf/4n/SCWuZfV/lgZr2M26fZUd7l9E=
X-Gm-Gg: AYBFou0GZUmpAF2ZvUxbGtx8NMyKTRmmwCnAAw+87FsnjaZC03m0wLLdTs9OrpPdhVL
	/ZOoQ43+hqfDabVGygJwiJ7MpQGngM3SfpLnsVQO7SzK9+GBdNa6khEiLX4B4IHqHewatXvTlST
	NkgNMbp7ozIxwXydBZMxafROc6VbVcSYCSa7Dj32xu8inZAisSCHv3jcb2MeALxLqlAncx3JxCx
	bj7yqWbgyxNqr+7oAJ0HOjeb0zE5Cs7ia4mKyjO9gLDQumHVQd3QaZLNDvr5ocMQn3r5ydL6sps
	sqvBs+7RWgv8ONfPh5ANtWRODzDsLLZH9dnBp0+/bXdPAZH6SlPJ0tJpQPrABB3ph46w+OUCNtQ
	Vo2ld0L/GjBajtRnwwLhozQ==
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr176740671cf.5.1792481427232;
        Tue, 20 Oct 2026 00:30:27 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr176738631cf.5.1792481425434;
        Tue, 20 Oct 2026 00:30:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf72asm463264466b.18.2026.10.20.00.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:30:24 -0700 (PDT)
Message-ID: <c59ce48e-05ea-4632-aef5-78b9c6a4b21a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:30:19 +0200
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
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
 <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WlsvWMPjk9HsPbHuvBa8Vgif2GbiQuNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfXx5DPPC1i4yrt
 9rGBL5EZW3VhmVvY/cxx6M0RtU+vCfDfHEXQdevqjFBsQh0uAMFGeqBZlxy+4c1cBKjOHhGYJen
 uPn3cgmRs2/XOMKjAHNQseQ6lFjT4PUbrvso/o9swncGsMQYNLzLR3URqW+/iqwPhdyfnY7IiB8
 Cyy37nd1/9swcS3XRq8krUUm5e0hvojVHGA6gTnsLHc4ZXo8exrm/ukGD0GBgjBozEefWna27Sr
 3BoQchNZ1SDIg1QOH79O2D/UmJlEykMC0C+094aguBhha1DM1EK1LG5AEgpACJ5q6YyEiDBJ1FQ
 9lUyoBHPvkFE66sVMB80Iqig4kON1hHWI3POajnVFDg9POpGHgFLRS9uDoK+OJpQtCkYfd+2CJa
 Szur5+prZX1NIZ15jjRxjqZeTWIesePadzR4qD9RYSyeSubkFwOOoLj8DuQ/NYC4DHQKveENjV5
 WYbSqYxtMD4DjNdOYNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX9XTGV4v9TuRA
 slfccHt39WGUiVpn9aAA1SumXairdDnLQygZY0hOZtCJkAssPy6xP0PXh2pUPib55vYeBzwFfk1
 pRfY2C388S0z2FPXLAARYA0JDHUggyQ=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad71894 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SJAiqMQSjMSsh2023uEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WlsvWMPjk9HsPbHuvBa8Vgif2GbiQuNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200029

On 10/15/26 9:15 AM, Taniya Das wrote:
> 
> 
> On 6/9/2026 6:54 PM, Konrad Dybcio wrote:
>> On 6/2/26 5:21 PM, Taniya Das wrote:
>>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>>> clock divider. The hardware generates a fractional output frequency
>>> from a fixed input clock (typically TCXO4) using the relation
>>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>>> register. The clock output is routed over a gpio controlled pin.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>>> +    gp_mn: clock-controller@88d3000 {
>>> +        compatible = "qcom,clk-gp-mnd";
>>
>> The compatible must be SoC-specific, looking at the table, we could
>> use these example socs for the versions of this block:
>>
>> 8960 (v1.0.0)
>> 8974 (v1.1.1)
>> 8994 (v2.1.0)
>> 8996 (v2.2.0)
>>
> 
> Apologies for the late response.
> The GP_MND block does not have any functional differences across the
> supported SoCs. To reflect this, the DT binding will use a SoC-specific
> compatible followed by a generic fallback compatible that represents the
> common GP_MND implementation.
> 
> compatible = "qcom,sc7280-gp-mnd",
>              "qcom,gp-mnd";

I think the dt maintainers may be a little grumpy about the non-SoC-bound
fallback

> 
>>> +        reg = <0x88d3000 0xc>;
>>
>> Let's map the entire 0x4000 that this block spans
>>
> 
> This region support 2 or 3 different blocks of HW and they have
> different functionalities and for which I am going to add the driver
> support. What I can do is map 0x88d3000 size - 0x1000. Please let me
> know your comments.

Sounds good

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566703;
	b=LMtVfDq5g1MxxFIw3JTX0C+DY+CCVS53OnfODvFS+WQDwcaDQbpUY1Aj1iA3rdZQbsev
	 iutegyiRXBO4GObhX7N7yHWOsxYE8e70w6sMQ73nDtfu6NV7XGiDe+674WpkO6++Ng5iq
	 He2qbU201agdG8UnTHDJZJhcuMNRQKjQgDmPl1tgd1ZOvTn4ryDce77i58tTW5X1cZLr9
	 te0X3v6Th+cRCPgBYt2VLSq33g0B3sp/w4thylbnpywDBaiHqyUF2H2vHeS+ml1UXdXNs
	 hN3c5P5Jc4uvz0lR0sLIGBpPTJJZNY38pspgat8Zmg5kIZRBNhy3x2D054Q1tRtMtfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
	b=z206AAzpEOt72f5bEVopQJkp0HDcQeSfqYGwojU23O0E0gf+K53hZK7TLFYRZy52E1G6
	 ojNWpXnacuKbrbMHVwkLOZxf70Tu2wJw947g7QMxAWigItdxWFzLMOekqoDJDuIpe457D
	 1P5phj+LYtqo+SxBxtCU6GRONzcn2gik1Z98yWMtim/TxDv/X0asOb6xXG5ZVkhU1hCXG
	 fmoWDdmfV1LdfFS42m4ppvKIxMvvVxzsNDOZkA3wosWjgKMvYKQoTshqzLRNIXPG1y1Vf
	 fLD0CfkqVXLMAGaCvylFPXko2/gPe0ayLQxU/LiQkClhfa2Tl48q9GA+iJ887dNqQgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QLA7Mo6c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG4j4S70;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54B606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E54B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QLA7Mo6c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG4j4S70
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V7WI3620255
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=; b=QLA7Mo6cLIZZjf82
	qk7w1ss19fAqrQxUtYV2M+uEjrZ1uu0mFeG4b43NEscXVF+9pW/XHNwLWpcQS77s
	6dmMqW2NsMZ4g+JTwFcrpCcXNcdpoCNp0b7UvYsu4oSeH3/3J2aOFCZQSZVKxFTR
	TxpthXxc9bCK4PNfTGuX64k6qH9U7q2JLwmdyR5qtdQnfYoNPB96bnJ9IiTY8sjt
	epv2ng2Oew3L1krcTqeUps24WdNz4upXKvskRDifvYEPXr9OYKlXDo294hkCOfws
	uYUpsV+KPrHmtDgus0b/4a8ZTLPFRTgpIV43Qlqz6fIf6fj96mL7yMxei8O4slDn
	ZcXEwg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9045-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:45:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso916243eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566702; x=1795171502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
        b=fG4j4S701Kq1/hZBqE2+DKp2rEL9Mlw8nTrVVMQCMtSpWkdJPmLjEPKtYHeQ0sSap1
         WIAlFvoXMYY0nS4x4savN3Pz8ajxvRUjRfo/GwxoKVf5uge0dmAx3LLBBXe5BYuHPO7E
         1Gy/t3WdMQoSwgReZWYG2Ol+lV3/fV0JIfqdMjjlrpE2C8PCDgTTiZWy2EcyAElKqh73
         gWd00HbK1yAAxYwYANAjuae292RZWzulssgOrsCoTiW+mkslQx7FGR8YjSAL28+crycG
         lhRxiSzbb5MvnKd3FYN0hiE8OykROMTXWC16KqcidZ9pHrdRGKPGzbiKcYH3YJ6jbCb2
         Ltxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566702; x=1795171502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljDMRqOHYPM+180KLYBxEZozbfQKzrnp4W89QlCNPN8=;
        b=1fSd314nKDdm+5WTpHNuzuczP0U8dlAKwWfAEO0w7C4v0B1EjhsNg8CQDixb1FJR73
         hDjZ0BROOfOvPdB2PsVLfXjSHaLFrB3ab/sFrJxs0/THSv4ZCSg6qg838ighptVjXlnU
         1rnrxywBQPN2+vhIFLw/RaRaZbjGq3fyvGO2U7fsYNzPRvoSATKhBLWjLxOiQrMVz2lU
         yj+R9gf9lTxBogTjBpLlnsHmDmu3ZmKgdVIYtVlnUKtVL7jrv2EK432DcCpEE3fHD1zc
         oFuskSAzXOpPzZIP+4bWEgO4Ea45LcA7RtB187PAK3y3QJltNb1chWb3mM0yPx7hQdbd
         koDQ==
X-Forwarded-Encrypted: i=1; AL+hErG4PzgL2t7RjhOgT+ZegVQTfbGmKDiXVdycY3+nyazmlCGD4kcc8hnTatWm/FKyJLt9B3YKoph6MwRgQ2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kyzoM+I/1u8Wb7Rny9y08+dRbtiWta7v5HZkPCXSuToCeKzzR
	rJbL8+sgoZPJge3+/1hT+ckaZLaCYfKAZHiwlQpxQkLx2XBJid5szb/lDMAl6TfxOY/YGa/4Fxd
	JSTw6DVlFbn0zpvQhZEcoZVTVLcO7032p1ahou0yquC3OICf/RJrCLDRHnxNdFBFyvt8=
X-Gm-Gg: AYBFou0kKs2mlI+1qsP9GYo1/PcS2JOgLN9EWKXeJe1FpGNEcEftApYEQVGvgRO7auz
	Mi5Y9Hiz5SUw1nAy55O+/5ZVoKkIMAmBsJb0OGA4h7L5u9XgYUoiJ0dodUXF1Z++hPPXMG4O1jm
	RBgzGQFHBHGyCNkE2YWAZLkN8AVnABGAbGpD9zX9T/2wbV2CpYI3ptVw+OtzS7ogUo/eqwROE2o
	FI3PznKp8Tme4SL3dNE0rw1JXU5ZLZXsueFj2LN3Wcr8OxyQq9DeubPitQTO/SuCM8WQvltApUP
	tlqM4kY5oWVdVFXdeb4LJ+VwEFkOkF+P1LXdDMd2LwNW8gezADwgjAO3Zd71SWtp0+K6YzYcvME
	FwK1YctEr+tZOlWEzXAsz2dYCKo0u8kIyXX6Ok7lwEbZOHaM740NEqVnQrGzSFJq4E4N7JbK5jH
	OlEg==
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr1882061eec.32.1794566701670;
        Fri, 13 Nov 2026 02:45:01 -0800 (PST)
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr1882040eec.32.1794566701053;
        Fri, 13 Nov 2026 02:45:01 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm6746586eec.5.2026.11.13.02.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:45:00 -0800 (PST)
Message-ID: <a476c249-74ed-4b23-bca0-13b8ae5a2888@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:14:53 +0530
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
Subject: Re: [PATCH v2 02/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm QDU1000 SoC
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
 <20261108-tscss-v2-2-d5f575010427@oss.qualcomm.com>
 <20261109-sticky-caiman-of-research-65e9a4@quoll>
 <28202f96-f234-4c7c-be6b-3019e119bb0a@oss.qualcomm.com>
 <c068e21a-6dcc-4080-a35c-8f604646aef8@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <c068e21a-6dcc-4080-a35c-8f604646aef8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B2SFaJPykcCyglr9U_-1GY13lm08Q6Sg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfXwMdTyDJqcS/I
 hdRFF1XUJbFpCHnhhm/Q4V8V4qTL3nbCPygGRbHxbemC3onT1x/WoPQZVxwwG8Vx7TC1FkkEqvS
 s3/Ui/fraf34AFXD+b9DrJXcZfuq2+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX2iGnDoDOTBH1
 XEDzzCw11WDQKV+Vu165Ez60pThwog4YBDyYIvgX1dHX72RDQTAGn1eEtvpAAtYsUpBzavm30+v
 2rxpCLMX19YqKDuBTb26+sLOdF9wg4Uj2CKFy+Mhh7zBSBXOLnalf8skprwuCiudqjVFiWG/C86
 UQkMl5ZYK60+O5L+ocW9ZBVWUVAoPak6ihkCMiZKuV9gbwzGMlTOHn4gcjl0z93u60YznTO/MhK
 2fsobmzf3t2tK1NZnCMrXgKZLlx/dnseg1LLj5z1Scbc6SENglKRHLvnug3FX/c1s8ItvmN8Yd+
 hL6A08DQIXR8oyb9e+RahDFFho9NcQ+jOOUeiAlgcvpXHey80r9tPatH6+peFPnVSvnSL162WwE
 UYfX4GzFn2g6t8i2iyEUjo79oBRL/9CBa6eGuBoCjnrjjzs88sQEQqRWctav+PskhWmzMXZMgGT
 u8sXsj5BelmSSnHjtig==
X-Proofpoint-ORIG-GUID: B2SFaJPykcCyglr9U_-1GY13lm08Q6Sg
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6ea2e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Z8WexQQaEhEqRXIjmLQA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130042



On 13-11-2026 12:35 pm, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:32, Imran Shaik wrote:
>>>> +  The TSC block is a timestamp generator that maintains a running counter used
>>>> +  for system timekeeping, and is functional with just the AHB and counter
>>>> +  clocks.
>>>> +  The ETU block captures TSC timestamps for external hardware events. Each
>>>> +  ETU slice binds a slice number to an external event selector, and
>>>> +  generates its own interrupt when that event is triggered.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,qdu1000-tscss
>>>
>>> I failed to spot the difference against your binding at patch #1. How do
>>> they differ?
>>>
>>
>> The ETU interrupt wiring between the QDU1000 and SA8775P/QCS8300 is
>> different.
>> The SA8775P/QCS8300 share one summary interrupt across all ETU slices,
>> and the QDU1000 has each slice with its own interrupt line. Due to this,
>> kept them as separate bindings.
>>
>> Can add them into one file with an if/then on compatible if you'd
>> prefer. Please let me know.
> 
> I see, it's fine to keep them separate, but you need common schema to
> define common vendor properties.
> 

Sure, I will introduce a common schema qcom,tscss.yaml with the shared
properties, and take care of overriding SoC specific constraints in per
SoC files.

Thanks,
Imran

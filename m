Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869012;
	b=igfjhGKLc0VNK3paKMsJLy18l6XZOMJQiS4OL/Ua5u9XAnqcVvlNuLQRqalP0JZTIUoZ
	 QOLQ+U3dB6gy0DyzO3kolynAvNPhvdHpwm3jMwdMF77LJFCSBeEmFM2mruae7ona3kuND
	 kN1L/qmfLOmvdxAyntVrs3Lg7wG4gXXPXQDUrrbzgJQpNluW8d5ONYvnj+tKhdj+igPkI
	 ub2DoHliXNGbnVev2BcLnPpg/9CfF1OCgqUF/uxP93RlTeYv0EpqESUCeWK0DAZ51BGSn
	 cDiq4p7fIdLix+1+0if4JhiM85cjJBnDCrVbsf1X/gczLW8e7nBTPLIREZmH49inGJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
	b=sIKm4xzDJFHbIUYgZlkbwBk9MTE+JL/qaPG8G3B0Xt/nCs97AM7OWlq5jhVyu1v0Kkcm
	 SIx3n/VfXcR9+960i9Y6TYXOKWvjDlVdjhakNTtQImEOLzuGkq4gU01KgbhQUidmpc9jH
	 VML/JEY1/YBUCNwFTzVNlcniaSW+HnTwFE19BwJMtx8J2qoqB/hY1dp5HRl+zCbkqgrO4
	 5/ZkiKXN8iBx8ZHVz5yPEVBvHmoN/AlW8JqwqNXYvkfTmtvNxlq5pqi/MYfPtKL4nOw+A
	 dAg3d//2Hrib1DziZ2rRmWFlWFKpV+X1dIJOFjiNmWuhMyQks+grjZVQ2dWlQczCFzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFGku3p3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXRZPdzS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D52606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D52606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFGku3p3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXRZPdzS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56Ttv33223155
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=; b=cFGku3p3DX77c7Od
	hScyCf6gq+Ionde83X23nIUfLXVdmqqusgQE6NmZFxrGVZChKwXmWMOt+lCCsaCq
	rS5iVlzBCL3W26ai7m4EjDXwmrdC6MRQBbCIKtsEPQsBO3EfISJ8D8ZQNAicSpZv
	FDxFTLxesGz9rGnMQemaytfY88E8g59ck0Z/Zd5ua/V9DPvMdWlmexmYgA6GH1e8
	Nflk1KAdsKYadeBpXAziTw5UuZAf9cSfa+xtYMR1L+lOyi1gGoKBNPpilmUFXRzu
	2FjUKLJrD25/I/2NqfZnYl3gIl9E6ZIGZpxosFpJHcEz4D6HOtzGyBegQu8/BBrA
	YZDWDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43h6t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:56:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1982784a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869011; x=1794473811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
        b=LXRZPdzSBk6hG7METAaIvNcKTRuM52N7KGWPG89CSvwRTS5yOR77KVPvYpPijD20IE
         pUH5Aa0tHufuqs/vajUAa35IseanAJ9aqF9Nt0UZt7j+lG1Vur+Q1MjDeDqqVLmhL9Nb
         Bi0c4j/IDEApNQz3NNuE+FK0CwZwTmCTYl7SQXb4w7iKikjufDFoFIUuBffNP2dLubBf
         K27TEOcyc12Oc67libY8ljhtths3DZWi7Dr4BOWRKQEVb3dEqh5YdcZVcPazAsUQW5O5
         RceICo4057hkN+K5jEYWxDVFOCtiQmzlnWG7+kXrq2grI89W7c5E2ZbyXKfVTu/1LfL5
         lpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869011; x=1794473811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll5HHjmuNho7sSH/k8QiuGBNexPrd5SRjnX5v1inucM=;
        b=OasDia2O+dwBr5AGj6bc025HrW/Yzw67OTJPeq1oK/FElxYvRbvGzsDUKSPTVydn4I
         CG0Sd+iuEmzgfBYX4zC6PgJtWP6bluQiTn4o6rczIL9i10NZ/hsgn412UPi8hEqAqLN2
         xVgyfe3cutTf30GNqdrjxVhiQyDdJdAuHmws/uJjvbsxdJe4eUJCoQs+U/b49AerTe3i
         t8pgGdSkmpvRkCS9roJCMxNhP3Vsp9R4/09qMvbGDzktgi8soYHHwNdLGr1Q8OV710Qf
         cYICPUY+Z7+Wns32hWya+FDpS55wp+HjBlGDqhmQoSEwpRns33zFqCFEyBe7oTLWZKYW
         XpXg==
X-Forwarded-Encrypted: i=1; AKwUvBx505gletgGC07vj7kLaBrI0zRDKqNw8bP1e2GU05fqrARnAzL8x/a713BzuQ8U8oGFS9xEhMUpG+8+YsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fhb2hwZM5aKzEh4ROsojrLvXpYa1z1o0+Fh1aOH+d8LSgMJ6D
	dvRHp+sT+z0le7Hg39LgIuvSdwb1SBTIlqqXaVWuCMMVvba0JeHDl6B6m2yMdQyCTuwMC2TW0TI
	to1rM01DSC8hgyiecAXV6rPSBe0p+uK7Lkw1J7JtuuZr9+KTreciv8inLy1xwFNSl2Yg=
X-Gm-Gg: AYBFou01i+MnrPsbFb5Z28qRZeK/1npV1OVpgKjQUKihGqW3TnKt9ho49lpYIe/tJcK
	7anfhRBQQG/NAxb6Vouicq2skPdF/IPPp+IyG7YazSOUFTuAeSR/trW9qG8s+shyKppzNjNvkHP
	8UTikf0TPqzVh2kYmWcuDTJqGrRMqduzJiGfdcj3Q8FZnYpNwzMSC6Gl2vB1MhERy0oeTMC3uqp
	2m2/n1em0RotLzNxrkynSfn1YdKiUDSfr5ib2vkBvzS15qGIJaOMEoeinzgyX5cgHQE81xUCStR
	S208OqjA0mkeeHSBYOGbqKGlbQi45pwKSF5f017R/7wCZL7RQaxD07T6hJP5mixG/bsC38IKTS4
	Vm61fBCbe75kIxHyCNunBzTCXI8nGTaWdQ3kHQhnWF+ML64xN3iR0AUq+xlhGWZEcXUefuaIGCe
	V4vDs33oyJwVFnJUJpg7qEr2/7hjWQHuqPebsgadXyEw==
X-Received: by 2002:a17:90b:33c2:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ae897e076cmr13614233a91.54.1793869011158;
        Thu, 05 Nov 2026 00:56:51 -0800 (PST)
X-Received: by 2002:a17:90b:33c2:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ae897e076cmr13614209a91.54.1793869010516;
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
Received: from [10.133.33.106] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31f8804sm2910640a91.17.2026.11.05.00.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:56:50 -0800 (PST)
Message-ID: <f8ba83df-f149-4703-b0ed-a7fd00608cbc@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:56:43 +0800
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
Subject: Re: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
 <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
 <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
 <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
 <4edbe80d-f1f0-4e85-9973-86da7649e9bf@oss.qualcomm.com>
 <1a83f9a4-73c8-4a13-bd53-2e779f6ade22@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <1a83f9a4-73c8-4a13-bd53-2e779f6ade22@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ja7X3u3gv1OlW353a-PL-_XJIgqqW6zS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX45NITmU2giLm
 1Qk5/LCSH3g0/xjJJzryr0iSXfgrDBeTabogyRnHRDS12zFoGkJd9DkcP4iQ1xr9vJgGyzH7Mxv
 Dn8+wXPiqmE0e5nw2FtCkPeArcoO0kBoQSNCEIiYao1sX+DQ50UWqXNl3ZGZJWim47+sRM2KHSY
 nKEM+XdXxfQhtCqRzS9gmCD3WbrGCujgU795a8KxKG+FcFSGWDYeepyEip21MRkSgeiWZkP020b
 zst3f1inKvEGDb0V1Aa65rWEa1R99hdJfzk1drNTqKII6e5LFaiH/IsVvhlp96Rb6EQPbCNpUcc
 X33DMX9asAKeu9cOn3w5JZWptar0TULpMs/l25IakBdFCNr+f57zZw31xLW4VTCy3Gb45DC73nV
 Y5Tekj3cLPb4RmScOszZo9y80V4bIMhWnBEmmEkgKy//F/aM7KRKiZEM0RdjMLi9saa8jcebnsW
 Ppww5DwIKnXG6P21miw==
X-Proofpoint-GUID: ja7X3u3gv1OlW353a-PL-_XJIgqqW6zS
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec44d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=yLkMS7TIAoMVBHN_cM4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX9smVI69YXdjZ
 sUgAFNuLC55DPda/Mf3cDDy+chwxnnHypLT2O6vtcj51yLfTCKbvpNAT0WdIlU5y/xyzZzS9L9+
 dIsL+O7LA6DX5ypEvtl1ofPUmmAAWnU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035



On 11/5/2026 3:27 PM, Krzysztof Kozlowski wrote:
> On 05/11/2026 01:48, Fenglin Wu wrote:
>>
>>
>> On 11/4/2026 4:44 PM, Krzysztof Kozlowski wrote:
>>> On 04/11/2026 09:29, Krzysztof Kozlowski wrote:
>>>> On Tue, Nov 03, 2026 at 08:51:17PM -0800, Fenglin Wu wrote:
>>>>> Add binding document for the haptics module inside Qualcomm PMIC
>>>>> PMIH0108.
>>>>>
>>>>
>>>> Why are you ending this? On what sort of ancient, downstream fork are
>>>
>>> s/ending/sending/
>>>
>>>> you working?
>>>>
>>>>
>>>> NAK
>>> Best regards,
>>> Krzysztof
>>
>> What's the concern on sending them? I don't understand.
> 
> That they are based on 4 months old tree? Or half year old? Or longer?
> Try yourself. Does this apply?
> 
> No. And if you tried to work on recent tree, you would understand why I
> am asking.
> 
Thanks for the info, Krzysztof. I was working on the tip of input@next
in September. I understand now that I should rebase them before resending.


> Best regards,
> Krzysztof


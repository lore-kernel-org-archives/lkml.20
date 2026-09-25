Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990844457CD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318410; cv=none; b=l8tqTRHkuVVi3mMhrH6ABVYzyolyU6NILalQXu6kFoVp6mVH5wJHaG6wRC3ax0a6+ItMWI3TdDOGc+ooW4hg/ZXzQgbVdsRILhE+FXad5YtvKGVFOJJYINpo3JIhIkKcdbKh8heN/srtqx9eEGhg05jgIoEcEWzeb85pOdF0lpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318410; c=relaxed/simple;
	bh=875AmwlOrIOKxRPII/aa61meBYbnNrXlPVbMLzD9nlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHSWQTIvOcD51JanHSxcENHxbi0aLv4vmrX2qiESpA37/g5/7p1QpvTsEsJ7UXnRSZ9fZQ9jGED1Uwp0a93at+ZU8HtPITOoNyABcQoQAF0yw1I6zZ4qxKBKrY0IFLgom88lesj95I+CUgOb86DDCSHIqBPMZuiCeOts6spfMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvbzoHHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCzrASwu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvbzoHHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCzrASwu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JPhh3628311
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMZfP1A5b+AJQ/70u739VGpCqQdfMAhFIZR58V+1cbs=; b=GvbzoHHKAGUgXgBk
	DXokfiwWYkF+vrTQAaZQLmEIgKYrnfdgZCrYoSwG0c7go2A47/JwaDobrvkgnmlU
	2QLAo80e8W6su+gzRpjL/CEE2FkAJDqZ4RuSuvMx3gbPNDJLW43qSxcARpm3EM6N
	u9S+G6fV1H9OZ5G249hi8hmsUX8g739FJG5zE1QJEWURIVR6tJFtmbvBihn++ptO
	7L1JLaoF2KmhCmpLzGCKawmVa36tqn84c2GsxQ00tefJ0W9KPe7mlZwRaSNi/NO1
	qCwQnzIP67jvO0IWHDXFH3peEv7HYO3zMbHzcZVXnOTRRxzowQ3/M6gFfRSVrYpC
	fB2Bnw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq3873h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:40:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3412efc2661so757923eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790318406; x=1790923206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMZfP1A5b+AJQ/70u739VGpCqQdfMAhFIZR58V+1cbs=;
        b=iCzrASwuaD5dekOBceMjiOMH20ZzsmNQUl3obE4/dCqaDflpJI9HoXyT2HkP9Q93BJ
         FzGUYixf3JuCw27DdYLoN6U1E4kV+/Wh8L8Mh5epxuNLC4ebkhPA/PRKkv/R1yA08+t6
         AMApTiKg3oQ1tIOB5umD2wfYbsW/EGZEu/490pnCTTSpD40dAjZv1HZy6zyfat6q0jZE
         R8VT+AIFA6wbc/5R39rM95YD2/PCLhUanIQ3kQaKRyv/pe1kpqqFjdUWMmIIePMG5hB+
         Ry7bkdgYZsix0kI0beFnBweugAH9Fn2nUGMkg+hFbBBtUeUKGadLAouhW/tY4uMR6cTs
         ckag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318406; x=1790923206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMZfP1A5b+AJQ/70u739VGpCqQdfMAhFIZR58V+1cbs=;
        b=Vrdw/wPT7DLEVrWERms+ypTLOg6/JvymS6hibnpSQsPKqzTCloeB9L8QmzWPXPkBy6
         11GPRHoLeClISZu2lKMMfL5JxU5JAKByDFnYiZmZ4imNFp7sMby1tz5wz9Qrs38oQKx9
         jYN9XD3DMhdS2tDSidE65lYIe8YM56Y0sbx7eQBVc30hq0RY0j6ooVQwMCNTv29N39Qy
         NMsQaD6s9Mzq6acVV4oPSaXgA7EJZS3CC3o7Zen+w66FvjUmasf7DQr/WiPWYn/vt/9p
         fV2NC3yFwJ7pGPEDPZHplyJw70ZTyzaZgUzt+cWGEiTcRZmMdvA/5T9F/Oj8ST7gRwio
         YEbA==
X-Forwarded-Encrypted: i=1; AKwUvByc+tYY8TAmTuAezvhwgRBNvo/5i6fBe0wiUY+h3UHNk6rr5h+iTvDQjGjRNSkf/rIXK4+odHh/h/uDieQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nhOFpgO7RymvTJ664vLUHVB3e8X40gsBuk8zzrP2jSVaPatFh8
	9X3C8/fKsTavrnONgtVRFA9tAx6hSSZAJzk/eSPxajofCfZvAfI4gOhbkdNzJNQ1tdpqNKjm3yf
	Klg2iP8c8pyGvo2+nVrudm1GXTQBoxYONvqvuaj+bah8mfTqRA+gP9kq1iDi82iJzBcuxx7e2PR
	M=
X-Gm-Gg: AYBFou3awAknActlgB1xe11hBDK78qZNMxhKTJMzKK14/JW2gH0OY9C3Pj9WmCdqAE8
	zCxXxllsErPNn3ocXYnzzfwGZSIMmtyYwOz6/JuAkFK+3xH93DPK8Dm6u44TGtP4UztfYjGLUtb
	VTN7YW44GgxAMgsp3utKUqClx9GZOthbc16i721qf7u2W4GBfv7hw1iHiZkjy1mC463QAYqJw1M
	kTcV/+WFr4/pDnRjZLyYx/NtqMipI6wyevCqlzVob3nhkeWv2DyvcL2k+XOixhL96FL28TDfCqR
	ymCEew/meg0cpOKvXsAUgRiw1A499lhTnTpX98iq6u9rWyIfRaQn0BJ/qgTQob+DFoYWbGbtHvo
	hFVcuA8uDBXLLh0iJdTYtx0dvbGQXs9WXvQqjpeJBdZHx
X-Received: by 2002:a05:701b:21c8:b0:143:5c2a:e488 with SMTP id a92af1059eb24-14503f6e17amr3456579c88.0.1790318405741;
        Thu, 24 Sep 2026 23:40:05 -0700 (PDT)
X-Received: by 2002:a05:701b:21c8:b0:143:5c2a:e488 with SMTP id a92af1059eb24-14503f6e17amr3456550c88.0.1790318404841;
        Thu, 24 Sep 2026 23:40:04 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adcc5b00sm3614535c88.15.2026.09.24.23.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 23:40:04 -0700 (PDT)
Message-ID: <af43c724-89b9-456d-a5da-0d8ba46a9b8d@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:09:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] dt-bindings: clock: qcom: ipq5332-gcc: Describe
 clock inputs per compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-5-d242e3d49648@oss.qualcomm.com>
 <62a5fabc-3a06-42fa-9c6b-6504650e712b@kernel.org>
 <7bcffc7c-5dda-4ead-a053-7eb4980e43a4@oss.qualcomm.com>
 <bec2bee4-dd38-4846-91d7-006fe38fc9da@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <bec2bee4-dd38-4846-91d7-006fe38fc9da@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNiBTYWx0ZWRfX8EGt6wTmMo71
 C4Tim79mzu9PrE3ubwOo362tch3nBwn45Ssv+ww/lqo+1cq6vewp176B6pjyE3mQwe5lU9bumns
 VXOn5v7TCVe+14oN8AQxsMqEJa8jHeg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNiBTYWx0ZWRfX98r2QCpDY8Xl
 lQLktPY0VwC3Js5PD5MUcRxorudPxTCZVwWy80ZbL2+qEmXDMaO7y9wP9RGk9fUorEtOQmO/xO6
 YMKHKhqk1STof5eu6T1OCgUdAU3zLCRtDS2VGrl6YcAl30qeyxp1kar7vd0aPLex8CFhli4C3ME
 pYd5d9vbScqzNLtdmcAcMRqTBlnHgoyTk6O8nUHUqNks0ZOKnGgecTRnIyg5jueRVQe4fTQ+znT
 1nuPcCIy73xqGgstfXYO9O899dq3KMlTTEoroy1NeXIuF0KgnZEmKdDi5/ry+dWlablrCZ9Ykax
 +b3MQwABZARWSyCW46oJeUwyp2j3uKdTRfY1D8VXaCmhoBfMbtHawH8YTy5U4dwDj+RqKuRzC4D
 Pl6/M2SoUqkooZJrzwOjfJ055Z78hB9Pz9kTmcjwrM9XJNoPqjU+Z53RiIs+yRtINNr5WSb7eDf
 9m/rFKdA7bu3EjmOq7g==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab61747 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iYr-Yv8LbTbqzJeusKwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: FnIDn9OtfaH8jeeZNIgsysotxOiKOiW-
X-Proofpoint-ORIG-GUID: FnIDn9OtfaH8jeeZNIgsysotxOiKOiW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250026


On 9/24/2026 4:28 PM, Krzysztof Kozlowski wrote:
> On 24/09/2026 11:15, Kathiravan Thirumoorthy wrote:
>> On 9/23/2026 2:17 PM, Krzysztof Kozlowski wrote:
>>> On 21/09/2026 08:19, Kathiravan Thirumoorthy wrote:
>>>> The IPQ5332 and IPQ5424 GCC blocks use different clock input orderings.
>>>> Document the clock inputs in compatible-specific schema constraints instead
>>>> of using a common clock description.
>>>>
>>>> Also add the 375 MHz PPE clock generated by the CMN PLL to the IPQ5424
>>>> clock input list.
>>>>
>>>> This keeps the binding aligned with the clock ordering used by the
>>>> existing DTS and GCC driver implementations.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/clock/qcom,ipq5332-gcc.yaml           | 26 +++++++++++++---------
>>>>    1 file changed, 16 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>> index 1230183fc0a9..fb39dffca988 100644
>>>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
>>>> @@ -25,14 +25,7 @@ properties:
>>>>    
>>>>      clocks:
>>>>        minItems: 5
>>>> -    items:
>>>> -      - description: Board XO clock source
>>>> -      - description: Sleep clock source
>>>> -      - description: PCIE 2lane PHY pipe clock source
>>>> -      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
>>>> -      - description: USB PCIE wrapper pipe clock source
>>>> -      - description: PCIE 2-lane PHY2 pipe clock source
>>>> -      - description: PCIE 2-lane PHY3 pipe clock source
>>> You are changing the order which is ABI break. Describe the actual
>>> problem to justify such change. Are you saying this was broken since
>>> beginning or what exactly is not working here? The driver was added by
>>> Qualcomm in 2024, so how did it even work? It's not some 10 yo legacy
>>> where we did some mistakes in binding while converting from TXT.
>>>
>>> Also, I do not get why the list cannot be shared.
>> When the bindings was posted, list is combined for both IPQ5332 and
>> IPQ5424. But the driver wasn't updated and it was following the below
>> order, so was DTS, which is not compatible the DT binding description.
>>
>> enum {
>>           DT_XO,
>>           DT_SLEEP_CLK,
>>           DT_PCIE30_PHY0_PIPE_CLK,
>>           DT_PCIE30_PHY1_PIPE_CLK,
>>           DT_PCIE30_PHY2_PIPE_CLK,
>>           DT_PCIE30_PHY3_PIPE_CLK,
>>           DT_USB_PCIE_WRAPPER_PIPE_CLK,
>>           DT_CMN_PLL_NSS_375M_CLK,
>> };
>>
>> So I'm splitting the description between IPQ5332 and IPQ5424 to matching
>> with the DTS and the driver description.
> So we asked back in 2024 to have the common part of the list. I even did
> the effort to dig it:
>
> https://lore.kernel.org/all/ruti7hmkxkayzmqfbme6rw6j2vbhlx4ul4ptcckwamcpd4cyfx@owufhxwpvlcj/
>
> Authors implemented it partially, broken drivers. Now you basically
> revert what we asked, which is BTW logical option. It's logical and
> reasonable, but leaves bitter feeling.
>
> I have feeling there is no accountability and no responsibility of the
> IPQ at all.
>
> No, that's not going to work. You cannot come 1.5 year later and revert
> what reviewer asked you, even if issue was just by mistake in the first
> place. And you should not even try to do that.

I understand the concern, and I agree this should have been caught much
earlier.

I only discovered the mismatch while working on the IPQ5424 clock
additions. My intent here is resolve the inconsistency that currently
exists between the binding and implementation.

>
> NAK

I'm happy to explore an alternative approach if updating the binding is
not considered acceptable.

>
> Best regards,
> Krzysztof

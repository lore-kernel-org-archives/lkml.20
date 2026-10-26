Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019362;
	b=vIoQVHAMkkCjkVAN4PlEIIDaU/3hlmTaAnPfYxFvvq+lhLqA0XjMhuSgbbimukhR218w
	 Fn4yiKvyInk+0OxWN+eLS88DapbvD2GKMg+p0PuL9V1opLo/Iww5vvSF9CGo6bD/e4Nf+
	 JikBE9AOcPKBEU+8Me7gWKKIcWlWC+L+mNJ9gJK39BhdD8JwG52W8q2yTIHWMUJwtt0Vv
	 32CjOsxkMy6DjA62RafzgsJXxVA47tM0MQGCJaIRh/+oeI5EqgODU5mUklCq4xUjPeJN0
	 khteEtO98lBtx3ZN/ZfEET2HMTbvtI8FONdJOA70SN9D88gN3aSiHd1H615t28EFFtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hNO7pC1kz63YSDMIEHWfeIC3Vw71SJAFnz98jQKeibQ=;
	b=dzifRlb79eBrCyE1EfSo3Sz8VYquZZ+NV2egk/hyWridUDBKt5TbBfIpAR16kaqcOgsH
	 muX3Ko3Lubn0uynA8rxyfsrk5rq+3A+XFijlNDP97rq7WQLJDYKVenMqkl43ohX6n/UjN
	 uxEPal/1XqQXz1nDstysBp/wZaazQfmiw2QV9gSqPOPa90kGGKwgMFghNeSxH60lReTKr
	 0A+hQ1OmK25zB3ydPhwC3Fz/075KCUwAVIa5GS1WRK3ENXH6Lzwwo+cyvUG646hpMvcen
	 NnI0pL6AQ/xB+NfPYW78PcfJAb964NwNDcUuQ5QuIkwdipms3e13GAXzl1gPXxRMOiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S7dphAUN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="e/Jhbmpu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EB4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EB4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S7dphAUN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e/Jhbmpu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsuvN2732727
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hNO7pC1kz63YSDMIEHWfeIC3Vw71SJAFnz98jQKeibQ=; b=S7dphAUNgcPfraAP
	C0b5lgfQz5b7erEFF2J9VlbAHAgRnqdbDzx019x+jZOMGjhmQBorH+m9nLX6oHMo
	/Kv7fcGKb9aEUzlfbRRcBYUDRlqPd4k06AQ3RpUhtIowFj9V6sodpWPF9cIvz52E
	IVNi/QSu7G347o48RP6pR6helreuSq5PXXpjmwM6+GTeVnlgzdCbD8duBvEJONjf
	EHFCF42+7tvzC2a6nzpCc4yR4DsIuE/5qCeqTD7W0/oqws5SfqiOOiVk9+M9MTD6
	6db5HZEEarz1QcTAKpM3KDN2uiM9dxFyAPo4N71HLjQKAOUh/HsfD1fcc3khbUHw
	ruTkgg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8qvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:56:00 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0cfe694c3so42248267b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019360; x=1793624160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNO7pC1kz63YSDMIEHWfeIC3Vw71SJAFnz98jQKeibQ=;
        b=e/JhbmpuXxH2JuxmFGW/FkGk9GGKXXagIvEIpjZ46yTh3+5mF8nQ4lH+pa4vRpNppU
         7BsKYGiRo46TXmoi8sazDu3beuCuQQLHaBUQwTja4NU9E7u9TL6LFVCB3vRLJ/DlR3Wf
         5eI3B0TMAAVmeaOx9jbi/VD8V3VHe0kYumjDtxQ6dQy+V1TGMLAb3KPqW+ma/J8Mp33K
         USRJxPE9mkuXYzUfex53pv5Piu2qqeWiNTQVi0rObizkR/QSyZswL6DS5nSg4j/l6DwF
         SCQcw2xR4UqKONzZaTJBnFme+KGtzSPNXTktWJoKdKfBtob3Nm4bkT8nOmnk3/2Fgd3k
         aSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019360; x=1793624160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNO7pC1kz63YSDMIEHWfeIC3Vw71SJAFnz98jQKeibQ=;
        b=AzCOKIYev2ea33qYe3GFlJXjNHt6YEZHeIeQNYxPAoes/5Y3bI1qnui85EFWUXg4Kc
         mIxk4h/c7tqbGEcKIP8lzavXUAAqsuIafe2Wij+4WqIQFM8fs49/ZXRkQfFFztBG/pPO
         sWFQoceQAzG43HjB8TdZpd/6cY4l3YFm0jFfXfZ2x56falo8ttqAtCmFrjMqVpvIiS81
         6J3Be2IeqfRE9D3titVV57WA5PzKwWgDJXpNfiaOmoImnsR7D5eeiDA9K8UMqd7AOq1w
         BJ8JvC7lI8CZo8N5foJvCYU5sR+cQoa3Rt5k7DmT3Q6fKdqlHwNECDSn4w2+fAGLtthn
         VdZQ==
X-Forwarded-Encrypted: i=1; AKwUvByR3P/IbVnRbkMFqNTsj3pheLQYTKOb4pDW1iN3nQE4u5UtoIIrET4Z9JLHMegusg/7OFPntkmo0ivkGuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxfM/ddT6P+38MoKIU+n5dD5JLpU3SkYjg5yR/gWPU/4mT8zQt
	kR3M0ntBDHho2PmwWZ6ksRzfo2fZGpr53YDkgs1fIJmWZs9b8LqHEvJHuCNqq7fEmpDc7UJGOLF
	fEhYet8Hlc6YdrxxyDdaeguyBbCxmztfMPuG9a++BI670rm5e1s2NQe/4kkoGtnFVOoc=
X-Gm-Gg: AYBFou0NmzM02Qcr02CeHP5YvrsD8SDfeirdu85sUvCO8UyGUcJeFjit5opH7aW7Ly2
	1jhPRxg7BQPn0axNRJGgBZYZVXlQdzGUR8LMubWzy2YBqQg+m7tjbGtjT1Kq5BVUGnuvnfmix1w
	IJowAdDd/iD5AG8NrPHgJY8nkJPtSq6euaByq1nhnHwMnnjlnliRSeJKm8rx6qLZC/8eaOX0V6M
	7fcEsRapn3VDNDhzaqAUoVb5ZHwJXQIhnyoooa4ys+c0xfqUhG48pZpnYC6jMPflIgKHkc85uHj
	DkMOgyqxwk/8ZWu0mhYiNl3WIFLxzCJIzlLpaX2cRS/kyroaFtEi4zOk9FJf/JwUm/Jenkj8zFt
	rwh7DjSxAQwjibqYpMjtbKmMP1H0=
X-Received: by 2002:a05:690c:d8a:b0:8b0:ad62:198f with SMTP id 00721157ae682-8b166bea5f5mr53579957b3.20.1793019360458;
        Mon, 26 Oct 2026 05:56:00 -0700 (PDT)
X-Received: by 2002:a05:690c:d8a:b0:8b0:ad62:198f with SMTP id 00721157ae682-8b166bea5f5mr53579767b3.20.1793019359974;
        Mon, 26 Oct 2026 05:55:59 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166e28704sm31507357b3.23.2026.10.26.05.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:55:59 -0700 (PDT)
Message-ID: <237b2f74-4a9b-4df2-a0fe-a7b783ed5267@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:25:37 +0530
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
Subject: Re: [PATCH 1/6] dt-bindings: ptp: Document the TSCSS on Qualcomm
 Lemans and Monaco SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-1-beed14e72510@oss.qualcomm.com>
 <02792987-7ad8-4a6b-81ad-559c63174bb0@kernel.org>
 <640acacb-1704-4ee6-aa34-d6be3b30b44b@oss.qualcomm.com>
 <f5aa313d-0e23-41fa-b59b-9388839b2525@kernel.org>
 <7f6839fb-59b0-4f6d-a3f8-7579f6d40857@oss.qualcomm.com>
 <aa76425c-0579-42c2-832d-cc767703f3f5@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <aa76425c-0579-42c2-832d-cc767703f3f5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfXw7JzbcPNGfHr
 qy+hdJXXnd0S3cpc07IMDiy7vscinO45ndCj609YJ4IJEFWUei7e5XBn381aQCpMu2YAackguz0
 IjZwEBg2j7RMRInkwTFK6l/dAq1aaLHA+6/hHtCg12mR/StKdVymUuomEjEiBRnx3u3riPUVRt7
 zvGuPsCZ2NuixKlQwd0+5yQh1uap6c5AZDAIEP4BgSajW7C2Rv+hzOt+TC58CXWzCz1a9LJPpoS
 l1w5Swkbd5mtg8/1BTtmsFYV2clnlreI/8Ht428LLMp66l0zs0SCgc+hVX+nXwf1HaEfw+1u0Fl
 egmmDBrFk18PXVDoTcXzOE3+t5ssobQvQuc7NG9BIXfUHqTRdLf84zkrygLwdQChhl4/ts5vEh9
 I0A4RjT0LrAzNSypPZ0bmCmvsrj4y48b6rkXMSNySyOHEi0mBM+QjzDBsu20ZGYYWb3glvyQE9K
 aa1HY6qSth3KAyuXayg==
X-Proofpoint-GUID: WkoYWo3oFtXbI_MdeBSOGciHhN11VatH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX2wE7ydMmMz9u
 Wq4jrycefK2iVR7SdHpSNDtkg4jog/162c9kZTaRA+dGIUB6N0iASDp60pSxO7C0TLu5U/eSm5C
 OAgkYie1bfkd8+rslPZp4QXyl3TbMww=
X-Proofpoint-ORIG-GUID: WkoYWo3oFtXbI_MdeBSOGciHhN11VatH
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf4de1 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ebbTEIlB-icwTnaok3IA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260051



On 23-10-2026 03:09 pm, Krzysztof Kozlowski wrote:
> On 13/10/2026 13:49, Imran Shaik wrote:
>>>>>> +
>>>>>> +patternProperties:
>>>>>> +  "^etu-slice@[0-9a-f]+$":
>>>>>> +    type: object
>>>>>> +    description: ETU slice configuration
>>>>>> +    properties:
>>>>>> +      reg:
>>>>>> +        maxItems: 1
>>>>>> +
>>>>>> +      pinctrl-0: true
>>>>>> +
>>>>>> +      pinctrl-names:
>>>>>> +        items:
>>>>>> +          - const: default
>>>>>
>>>>> Heh? Which code do you copy?
>>>>>
>>>>
>>>> Each ETU slice has its own external event pin config, so kept pinctrl-0
>>>> and pinctrl-names on the slice subnode. Please suggest if you prefer
>>>> otherwise.
> 
> Just drop both pinctrl properties, because you should not need them. You
> define them only if they are different than default.
> 

Thanks for the feedback, will drop this in next series.

>>>
>>> No, from where did you get this code? Why are you sending bindings which
>>> are different then all other bindings?
>>>
>>
>> I was referring to the example in [1] when adding the pinctrl properties
>> under the etu-slice sub node.
>>
>> [1] -
>> Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
> 
> That's like 13 years old device binding, so unfortunately likely
> antipattern.
> 
> 
> 
>>
>> On checking further, I found that our etu-slice sub node deviates from
>> that example, since we don't have a compatible string for the sub node.
>>
>> Please let me know if we should move the pinctrl properties under the
>> tscss node with per-slice names, or instead keep them under the
>> etu-slice sub node and add a compatible there.
> 
> etu-slice does not feel like device at all unfortunately. I see only
> address space, so one resource, which might be enough but lack of
> description for the subnode is not helping. I have doubts that separate
> subnodes should be there in the first place, but if they stay, describe
> the child node fully - what sort of device it is. Just because there is
> independent timestamping counter does not make it separate device, just
> like independent interrupt in GIC is not itself an independent device.
> 

The ETU is an independent hardware block within TSCSS that captures/
snapshots the TSC timestamp in response to an external hardware
event trigger, for each slice individually. Hence the subnodes approach
was followed and will capture these details in the description as well.

If we drop the subnodes and add everything into the parent TSCSS node
instead, then all the arrays here must stay index aligned as per slice
mapping. Example DTS node looks like this (QDU1000, 3 slices):

ptp@1da0000 {
	compatible = "qcom,qdu1000-tscss";
	reg = <0x0 0x01da0000 0x0 0x2000>,
	      <0x0 0x01db0000 0x0 0x10000>;
	reg-names = "tsc", "etu";
	
	...

	interrupts = <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>,
		     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>,
		     <GIC_SPI 334 IRQ_TYPE_EDGE_RISING>;
	interrupt-names = "slice1", "slice5", "slice6";
	
	pinctrl-0 = <&tod_pps>;
	pinctrl-1 = <&gps_pps>;
	pinctrl-2 = <&hardsync_pps>;
	pinctrl-names = "slice1", "slice5", "slice6";
	
	qcom,etu-slice = <1 5 6>;
	qcom,etu-event-sel = <1 3 2>;
};

Please help suggest which approach to follow here. Accordingly, I will
update the bindings in next series.

Thanks,
Imran

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394892;
	b=uuCIUPjOBcOtacgi+CRSIXWorbfslx9EyYmot4F4Ky4eyG1MDxhMCrjgRIB8fS/YF80X
	 Dg3Q1+qAU9BMXUHXopAyFQYGxzrda1vDXWYD2534s3u9Q5Bk95ZAnx5NbYodEkNY5NSTS
	 SnayIQ17DRWWEWSSEvOvQEC0DOSLKKl+f7qnXYnH5qdKbIHiGtNBNS7EY5XFafLuC9wEX
	 SUmTFBiJc5WEP1CHitBk670kMYfCNujZ4aF5J9liJkrAPS4JsLvDAUnnvDfJez9wReyxe
	 fabZWzO7+7/9uB90VXoEaRzmbIfgPqmSXfuNWvjVl+PTm1zQ+IP6qMuyKk1J8fm3HHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
	b=uvcwPW+i/4chqxiuMt1Zz3XbhTaRS0c/l1ecos5vM0tN0vW8LCwFVWe17GHeGnLbG97p
	 YV0EL6KLtXBJVbDuPTkjbjbS95lOiD4f4V9p6ueccVLc395PePs6r56YU9d+YLqadQH/Z
	 CsubXUyuuGCP290tufaSAXQGBu+twf0+B3geNgwPZLh90Ljh4bzYqgcMS9ZTPe3Dg7yA/
	 72sm2mqrRywouLLfXSCBW+m2IM9SvKP6zYTp+29Clq0iU5NvJ9g7p9bjkKZkflYnjNJzQ
	 qnjt86c4NealMxfPc15SnKC71FDes+LG9VR5c0iYci5I830Mcg7gnvU55/O43Iy2U8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGhR98c+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLUrV0rJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABB7606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGhR98c+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLUrV0rJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAcBh799515
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=; b=jGhR98c+jZQZ19n1
	EGXUDDWVe1dFey2lsm6xqJ8+g886G9A7zzqLyQ5Q7Ze/91w+4ILdPec9ULtbfm99
	DTntH+4FIDCTIv4tlWBBf9M//bXNajzo+PTLphFt6/SQu6CH3nFoetyEjH61g23p
	NCzcnuoODUEgUTqEHqvQwwhPutPDQN2+PRJsAQEPhhRw3EnkjoXKaS2mXTk0TKCJ
	prqKPxTfbwBTOXz6+WqKP3Va12hcMtXenvCIRTWGqPI2qtCA3JvkJ1q11DqzAlXA
	6Y+a9EAkLOJp/Bv+KA5rRsJo+mUP4TiDDSg1C5y3as7C3ubLtKsNKnZ7dh20Jl61
	jNGfnA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x100f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec3e1962c2so31511e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793394890; x=1793999690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
        b=BLUrV0rJQ09tBD8TrH9o8zPahMIPesTNSgympz5R7wW3ulvy9ozut7hku9+PfDUTx6
         I0v+N1cv8Vz2BYvlCVnyOUC4PhZcESMc2EklIe1w9TsMDqv6VB/kMOiUss1OR2zXNXbT
         FIJC4fcWsYhdXvg5RoxWwiVZS0wbYiBc7Hm2zz+IM6POMTn3TsGCktAGTYvFbTWqoP3l
         xfjGjI4wL0wAIeNKPY18yXq/UoS71asYlwAZYk5lAKtPrFG9+o6PeZzovpASDp57MA43
         oMC4EwcnbEn4ifviz6QxysuH5Gll46GGXsrxtw+Y7hcKzqxGER+sW5lNkT34C1ZOAzMi
         wbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394890; x=1793999690;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/QiM3kznT7Wu13IKF37WvOthsj/0oserWKR8GN/KGM=;
        b=WlegM82SWcGO2mKqjGExuthLPIuuRgOuXQsJbvNW6qUKNHhHQq1pMIIWJWjaBkRVvd
         S4Gn30vJUKm+lt/qam6V0+wm46jwCHrPKLNXUZ3jYN72zrGmBDUS9KFrN0DgmoaMQkzY
         jPftbg47wPMU9aLQzfanod1+M4jKJlKPayTwZdYCPBiEwaFqmRDmcy+Ozr/BqZ929vvc
         4CV2+IqYBXlEX5X3FRmqyTtV9YkRBnwqW2PR+4FTnlIgw5T/FV0Ql8t0Ay093kETQB6w
         ka9/0usHbpKQMum/NkInuoNjpae6KQ90BNtbmb5qkXAqslHpe9zmHonfmMWqDFYvjAjn
         jSlw==
X-Forwarded-Encrypted: i=1; AKwUvBxG2NB9iUpQv7l3FV9U/FXGwmGe8NCqEtHvGw/dvQbvkaJIhgIGx3mk2i96shJjz9YATsYafrO6O7GcYtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKieqTRwssDCfEs8f9gJ5aLvQBnnh1H7gC6vR76tE3lRL1JcNZ8
	GJwy2V77nNhiIk/A03qxySeeqv1x9+Dwp2KgdTG8rK2EhZ+dV5OwBhbvLJ++YvTxrbaIEh+S0Zk
	r3k0xeyd+dReo6lzgQPMSR9bIoYBGo78iotnegNcApope4uU9cPCYFr38eHa8AqhRoX4VqTYZXF
	U=
X-Gm-Gg: AYBFou2qaa2GpjfOCo7myiPunKKr9Rruomgl9QGXKjsa7fXeW7Z6VKB4O4JqHOzoEnC
	da9Lcr8SHfWVNdQX+O0MdInSNW+BSU5ZhmRb4ZWNVO1u7vUB27tAAwaDrJ5RruACaxf/YPf8laL
	UB5np4q/PmiQIpCIMlGue8vcONOzWq++AVJlK9zy/ZHX/V8AY474pnMVWir9hf2CWiJhe0HIx5Y
	RSAcxszqX9X+RemHkxJyMgH6d5JUPPoWHBNlAOLwRszaC6IqdBAccniPEIhkrq58GRmn6K7EEql
	GRpVFI76bKIZnMLp7UTSJAsMApUUYrym7j5OAWQ7ChbBrEGpHML1WM5FZGqObB07A4R8NrjAxCU
	SY0rjAzn2LREdjGz3p9Ynlt2qnfcybtESCNDiHdVcLdrL/AA/H8L8VlYLBcgLgvUG2m0+SeNrno
	Y=
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr640135185a.76.1793394581360;
        Fri, 30 Oct 2026 14:09:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr640132085a.76.1793394580963;
        Fri, 30 Oct 2026 14:09:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm178757295e9.10.2026.10.30.14.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:09:40 -0700 (PDT)
Message-ID: <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 21:09:39 +0000
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Le Qi <le.qi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
 <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfXx8hLWP7dphlF
 mHUWYk+Kuh0x9UJq5djK0mqL2zmkGRNTbIatviP2SFBusXq5vuZh7YorZcFfqm+9gTBC6UZwaL9
 2dIrY+7IqFbofs3jV9jUneo3mUqZnP+tCG6yOlImPk2zsbX7YxoDwKL4tmY8usyWAcLhJHWJVCM
 hLFD7ETqb0jqbIte16qapyqbLra3Z4Es6cJu5UvZRayLPRKnJ8M4Ap8LHrv61mhTT+GiFoT0NuN
 RkUZpAdB/SSkabCa1HslyboM7V/iIknBlMk0WkGYP810owFfxhBGreScxGxMHCSm9t18KzN6FX4
 kw0pFBI1cWe+qqp5QBISlpkbOueLHByweoWkYe7MhlUnjsCBQo0xvy81wJ3lb+NAqh44zu62dSD
 o0sMQejHAiOH1GQeNvJv7Fki6ePicg==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae508cb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cwMTcsmotyg-k-KcDEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfXxCUK5tfg591m
 rdv5vfEDaK2e7TaxGvTw9/P6EFk8samyy9I/tS+nXpJpjO5n77XOIvMLtAHF033XmcEwag4SbbC
 ipSmCCTITaExQhW6nLm6KXChZWVO0Mw=
X-Proofpoint-GUID: LsCHurPS7qAnvutSmgftNYVvSm4cW9eL
X-Proofpoint-ORIG-GUID: LsCHurPS7qAnvutSmgftNYVvSm4cW9eL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

On 10/29/26 3:27 AM, Le Qi wrote:
> On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
>> On 10/9/26 5:04 AM, Le Qi wrote:
>>> The DP2 DAI link is missing from the sound card definition, preventing
>>> audio playback over the third DisplayPort interface.
>>>
>>> Add the required codec, CPU, and platform DAI configuration to enable
>>> audio playback over DP2.
>>>
>>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/
>>> boot/dts/qcom/purwa-iot-evk.dts
>>> index a811d8ca2dbf..93cefffd1f46 100644
>>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>> @@ -641,6 +641,22 @@ platform {
>>>                   sound-dai = <&q6apm>;
>>>               };
>>>           };
>>> +
>>> +        dp2-dai-link {
>>> +            link-name = "DP2 Playback";
>>> +
>>> +            codec {
>>> +                sound-dai = <&mdss_dp2>;
>>> +            };
>>> +
>>> +            cpu {
>>> +                sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>>> +            };
>>> +
>>> +            platform {
>>> +                sound-dai = <&q6apm>;
>>> +            };
>>> +        };
>> Srini, can/should this be in the SoC DT?
probably not,
1. because the dai-links do not have explicit disabled status, so these
get parsed
2. sound card itself is board specific.

--srini
>>
>> Konrad
> 
> Hi Konrad,
> 
> I think it is better to keep this in the board DT, since the sound card
> is board-specific. DP0 and DP1 DAI links are already defined here, so
> DP2 should be added alongside them.
> 
> Srini has also agreed to adding DP2 support in the audio topology.
> 
> Thanks,
> 


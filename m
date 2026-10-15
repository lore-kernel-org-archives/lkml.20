Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26446D096
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048894; cv=none; b=BfScSGzA50oC6MiJVpCSLbFmpgbqc3SgGqe/wM2jHR4n5HHTVA9PGsf1iN7NCsd+3xkD7gAaM3LAsJTP4p2Lj0iialwv5kt0nzBJTNeoUahtmQd1cn+GDHD0S12zXpWgsLxz0dqxpxEYpmp7vdSNfJ18LU5LbxP/TpJj0B5vFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048894; c=relaxed/simple;
	bh=i9PGNYI4FgKmm5g04rgKr3I+6E1QizmO/YnLvfMjF2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3T2hvvNPpe3JsorRxJSleRm+4Wa6rLwFCjnwY7ytLTfkl3du6R/DznUQmaX9Sy3kptA6VPlWi1SM7KG8V12zT+vE5j5kmaKycFWMz4b0K/sKiaSPC7tm+J+s15x6ATliHAHh+8QNxdkFKQU1ZEHmRRHSC1A+mQKyvonCTLypXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VY3TB6I5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXN5ZvEN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VY3TB6I5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXN5ZvEN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6vPQx2121588
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Vh8VDafyxQoJ4R6CmmLgnWnqUOhc9iVaJBsTAw855I=; b=VY3TB6I5J5fsvPQE
	Z77MhghDb8P0sczgqNbV94IEEhKZ2W36YXjvgUSyzbXHq5oW+N+zlRzdM4EkNnkt
	UmWmVyJOSAIRkqbtphOHG+Rk3+LOQ6wUxR7gRI79Nwxgkf/8yVZO2kDbWTzpcSrE
	S99wNwv5NFuNgBzcLyyvL66CQULWUSDeScrTeFXqpJbBN3zpz1BTk4NRJcUCcKIi
	DH1EZltqQFAmxQheEtUkOZTQJ0AdZ6UD9FxZfCYquajVGF/Et42gMTRxzwqGVIPG
	y7Eb3A06UkfNH7zMzQQXDCtuI7ryrRARuoEQWGZUAl28yzKA1OL6mlNsFUxSdY1u
	eNwFEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1e1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:21:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so362901285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048884; x=1792653684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Vh8VDafyxQoJ4R6CmmLgnWnqUOhc9iVaJBsTAw855I=;
        b=NXN5ZvENJYwo+TBPDxlzWp4pXNOcSMq50ZJ4duFlVr1WAYk9WF5mkS/KhVgc+7JKAg
         Vyoo+arYpausIpa//dWJwG6gb3Vdkcj3rd7KmikSTaxLuW78TKJeljlsTrp5xnGDAmGi
         gUjgv9blR/bBHGY7JECFus1mM4+iBDvb5OrKtTW60Kw1/AWv5SGZe1uPva6j3dkvRJj7
         mmei/OlQ1wbrzxDQK8+zfQJNkJ7PcuJlTsSBpLPNZpv4gDNetDRJnrBaUMtyhmDmsn49
         ARZX2RS/i1MkMWLwk9xMmwSF4BMjZ2SzEIIqI8GKtOwTPjdnAy+ivOBUd0wCN3dkmIf7
         9s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048884; x=1792653684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Vh8VDafyxQoJ4R6CmmLgnWnqUOhc9iVaJBsTAw855I=;
        b=atvKzUlncNJyLSU788DZoIPvHkx3zUpQr88SW0/92lXMjENk9NREYVZqoSDCz2Ciwt
         UbE4EyEeJ3iNTx8oiCrrF7dJLkG7EXnmnXSBNuz4uwvZI1q3ghz6I1i0gkktQSPS55mh
         SxRzs6J6w67sFiS0KHlHjvM3mzX33ghapvHWXbUX4gKvV/YcrekGMUOqtQL8quF6rBjG
         +amUOKEtL/QKfPOxwOUIKW5cf8Uxs8QE7Sc6rodT45RIGgllVplAi40LpasSYzG4oDDI
         JaMPe1iFraMYUKfRmCCqcKkHHuMJvBF0HSDKo3CVc3mWrwQGG/7bUfeOaF10BpsN77P/
         GXQA==
X-Forwarded-Encrypted: i=1; AKwUvBwP27H1IjVOl1nyZWndiEIyk2vLzsXOYMaS3UVxQTCca6BILD023yL9ddhVMAlJ2VPvIUlgMWhDcia7Viw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuL8HAyp2pwX7Ul6xwdmyULvSHfJL/67qRxwBGyVNa2fKXAMfp
	x/6wBMuCY3uDBwXEkQfaEd1dvGhvitClVQpfZH6dhJZVRLZc4FfgpJGnxVoVLn4cclsQjCi37q3
	pS0lSnYrYubdXpdgUaqvGZh4PMInP9i/9j6129fXne6yK2ssYxYuBUluh99cbXloC+Y0=
X-Gm-Gg: AYBFou2KKuM7BxQySNKjjN9aS7a9F76VXKtBOPU9VsDxNEqwApKMstuLR+XUyBeTrZw
	JZmm19epv+76B2P/hmSYPYCOgmPvLsbgqoAvjyohhcfCZM/bjzqrKN+iqIUebbZoQ24xTfeeBY/
	EnZFkGNAAHwXWeGg3pMXM9jWiEye6vhMh+eA7iNbTLUs85RdQTbbKb1ZyY7ehluzx59gcE2afFw
	Gm3KGwmVDTn/qo7Q2dneje8bGKGvz+pb6EDO0/37iWLUc99wgDmcJR/ue8al2JeTPagivM1SYXH
	qBTPZBDyR+tKQtcu+seVPSvdJKr2RfPB7mDfbz8CK/gCqko2xX5ciFEhWjgi+b9dPe3/VFVOgm7
	05c/UBt0PiRpmiJ4IIWgY3WazQDm6Wbp7HYew2Nn95yHg+b0TGwKGIpWrekEdqw==
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr2983883985a.13.1792048884538;
        Thu, 15 Oct 2026 00:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr2983881985a.13.1792048884088;
        Thu, 15 Oct 2026 00:21:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm16747351f8f.43.2026.10.15.00.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:21:23 -0700 (PDT)
Message-ID: <08095630-fd5f-49f9-b502-d5b2b33c60f4@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:21:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org, daniel.lezcano@kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, linux-kernel@vger.kernel.org, naseefkm@gmail.com,
        robh@kernel.org, tglx@kernel.org, grandmaster@al2klimov.de
References: <20260918153606.344143-1-cjd@cjdns.fr>
 <20260918153606.344143-6-cjd@cjdns.fr>
 <5874ea6e-4e2f-416e-bcc1-851461c7308b@oss.qualcomm.com>
 <7108eadf-5dc8-4f39-beee-d748aa88e9af@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7108eadf-5dc8-4f39-beee-d748aa88e9af@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOSBTYWx0ZWRfX79XW/27LFvSa
 5NpcLfE+XcQgXFlejrKiDRTEwodbAqoHU8vXkxhtWgsiQBhnyIOTsJ+483nAbCSi1PDELkFQXya
 F4D3Ht7Rw9Exakuo9lp6TsHfha1Y/8b/PzAuXkveHM4puC6nx4c4Ennlmjv9nYgXJ+4ueAxObkG
 FXUMG6bZmyUSeDV7FEYiS65+8dWgMX5D72uYdcDghITCBXm170gnxFGeE45pNN6wtQpSYaZRHg2
 UHPPZKDdddeeFbiktQvdjj6MqANoWZaFwqbGaP945X0AevdVPX5mJxy0DYwR18hn7n/o50HSawk
 +1aALIKRFcW0PXJp2+RkrhDoKRNMc5wo73Phl8h9n6R7T4hi1dqDlzVHTYeu/fKwu5yMCDeniFz
 4Y0uKBMU08H7V/IC+p2Ma6ilVTbjRo+hoKPvd29/2qQ+EDYuC/lSqzjLXY2Lo0HyHMyVZjof2Rk
 zGGJNPlYelsL5xt5KuQ==
X-Proofpoint-GUID: Yv3o02vv7hDnp9Fvo0BdTUWrTG2PxhfG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOSBTYWx0ZWRfX6Bkf4thtFojR
 +17Uu0NCgmMM227AdTQN7ZNGVEGuTT0+448UjXHQiga+w9urElyikK+lGLa2up7sf9Wv7pQGU9C
 KB+WxHRG2WKGesYVWwy1CWD33xxGKzA=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad07ef5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=fx9yKbBvac2UQYKBdUIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Yv3o02vv7hDnp9Fvo0BdTUWrTG2PxhfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150029

On 10/14/26 22:36, Caleb James DeLisle wrote:
> Hello Daniel,
> 
> Thank you for the review.
> 
> 
> On 14/10/2026 20:43, Daniel Lezcano wrote:
>>
>> Hi Caleb,
>>
>> with the help of a LLM, I got the following two issues with the changes
>>
>> On 9/18/26 17:36, Caleb James DeLisle wrote:
>>> EN751627 is based on the 1004Kc which uses a different interrupt number
>>> for each CPU timer. Support both this and the EN751221 which uses a
>>> single percpu interrupt.
>>>
>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>> ---

[ ... ]

>> The binding requires four interrupts and two register blocks for 
>> EN751627, but the driver sizes its resource arrays from NR_CPUS and 
>> rejects DTs exceeding those sizes. Consequently, a UP kernel 
>> (NR_CPUS=1) or an SMP kernel configured for two CPUs rejects a valid 
>> EN751627 DT before registering any timer.
>>
> 
> This is a fair point, and I suppose a reasonable thing to do here is 
> instead set num_blocks = ARRAY_SIZE(econet_timer.membase) so we just 
> don't use the other blocks. I can send an updated patchset with that.

IMO, econet_timer.irqs[] and econet_timer.membase[] should just be big 
enough to store all nodes without using NR_CPUS.

Given you have num_irqs and num_blocks, why not just kzalloc them ?


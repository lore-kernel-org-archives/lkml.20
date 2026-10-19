Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7403D25D7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391283; cv=none; b=eTnyrK0VJQqxaZA2wXH96qPvM6Oz+YEfPXmvAXRpjf0k0CgCdE+21XXlZ4RXMLjmC+VpQGFB717vx9XmJ8gQageHD1d6GKh7pVGPLv+QhSJhNkV92fSdEAZQnaUNYAN2XbIGwkUjPHWrEB6VkmI0La3UJ1byzdhpgsvuOnjE4T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391283; c=relaxed/simple;
	bh=H3ad6YJKI8vO3CC9hEJWwrqweWLV9XGtKF7p3FCoEC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mueyYJce0MWfXmUFe+urKberu28CiAcgafDqYN3lxdENbQHAws6ouhGf/Kt8A9fmlVAdRdb7MU5reS+ugF0xwnq8MN8WkKZL96SttMAqxEMaO5DiW7kCn5UmXRKabhQ3fESPXJ9EMSYAJSsnUuduWBoQM0enFISitu3CioMTcqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jViqdCmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cA/H0xXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jViqdCmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cA/H0xXz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4iv4O1552866
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	67TJvhbaZTj047hnnY+jwvd3c/L8F1Raj4MzGVBymyE=; b=jViqdCmOkP/Yo5J4
	jNtrSgh8ZvwZbvbhjMSTcT1yx7u93EdmfW2Samf6H4hnumFgDETsj10LWVasU1nx
	ObS+/Ly7fj09mYekvou7veL2zQWENH1j0ZR4LVahA2o3jSA5m3ACAmiMsw7H9zRX
	QmULRsdN3d4fgSOlz0wlNRCjXnVqO8YuQdaRea0zI2mSBkLe0uUp6WsRlkZzeh3E
	Um3p145rjpGcVQXU2RSA7ug5OyRNd61CFs0PBtfLKCylxTVP4N7Amc+nzJlnq83t
	Ujv8mzHe8+iGwAHi4kPVo09C9UBypzZrDuiV0A0tS0G9T09aDWivANzhlPwDWef2
	HUx6Ug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur19ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:28:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so3778946a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792391280; x=1792996080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67TJvhbaZTj047hnnY+jwvd3c/L8F1Raj4MzGVBymyE=;
        b=cA/H0xXzErSmXm3+FQKdJiyXNqATTNWVhunt6PLTyIxutDdhOwu4+hxIQFDglCeafI
         tlZEX55sDkQ1rjPjyy25ufZvP3o2qjMOtPv8Nyg2uSirQ+rzsOMnzdE4WE+GQkZmGm7K
         zaFECLk+pKc9893co0MyMCAaGf4p/4f6Mpm1KeU2RVsF0XsYCqvVRwHz2wYk5S0DGlPl
         ppsOdcTmhIidvq2WB1P5UXBP+JptsJMmYfrrSx4nswmvvLB/frOd7r/9FyfUa7zykTx7
         6CbtdEQdEzVbzc13JL646F35yxa03aIklEhK6JzdEaaoigTT4WFiD/6Zzq7VC1lxsfXx
         woMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391280; x=1792996080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67TJvhbaZTj047hnnY+jwvd3c/L8F1Raj4MzGVBymyE=;
        b=ABa6ttU3YRn06COQILxZ8jvr0tAdAfGcj0D5wz7Qc2sSqDQIDhC/09BIKxPY+p0MEI
         /GrzVLe/Came0aZp+YJSzj54njAE2qMQ0J3YoPSTpUkk9H5Z2BMp0F0JOioHssDtL4KV
         PS3UIQq9uKn9z+XKK3dLHFn1SjcyEV7oGl0gBsssYGDK0vO6vwsLPPyHlpYnlWWSHc7k
         vWryvArHTFHyKR8WFr78KeVxFC/G424GWG6AypvWQS6wqDff/hOHOgDr3HPLv3Xh/IF7
         Zlss3VUUSK7zBwYD1UBi9OwYX3EEQNr5+69vyBgprVPw7zwkmQnCd2uEvL2v2KJH8ZH/
         oe/g==
X-Forwarded-Encrypted: i=1; AKwUvBwt5YFmyCUA7w8OfaXxiiOKMwjvOf4CS3EQV0bqac4FrROOhTXOzj3oMFnxih/xedv5rU6tSXE8zygyeN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI954P24BIR3tXmER10h9vo+kwO3bo5erBqPAdUF7jj+/qlFTSi
	f5f+UQGc1YfkTG0PNVgzHaxO91ULnNPWlvXtpnn//PtdYOCcC4ysRqueTo1Oie09Ctr36KR7A3A
	8EItgMZi4cqIkWUpGY7TqVG+lIiYbQA5iYJLKxnQ8WJ8qVH7SxfE2/nrVaUHaUXeunts=
X-Gm-Gg: AYBFou2U5wXrTQIUWwTjYUWOnfOd4MhKfsX48Iwe/1V1/mh0yRL/pgtFyWHZeYPg/jj
	FCL4yC33QAVrswXpKWCeEoQSxkFEWHknnl27wb10A+zWJfpMIMtzYIB8lZUUa9fVhWxYCmi5gWN
	wQiUtQhMesESlHJUgUp+C/hN3byfWDz8CwmN0aEiPouPRQ5Ebiw8uGgm5cZ+4Ml8Dwj8dBBRetw
	/uGGTxyALX71xKf6yGwcCIKMHIqjxC2aX7XXsOnoD77VOAAeUrcJzXcHkFQMjdj2NYzOA/NjPGR
	NU1k7QevNyJWPNEwjhW4hZ93EyCSWnhkgvwIHAzRc2SLWD6m1VzvryV1zt4+42lagaoMoZ/W7lx
	R1i6yRF34tAU54jJ+XrZD
X-Received: by 2002:a17:90b:3d48:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3acef0c8753mr5686891a91.24.1792391280370;
        Sun, 18 Oct 2026 23:28:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3d48:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3acef0c8753mr5686875a91.24.1792391279887;
        Sun, 18 Oct 2026 23:27:59 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e7548sm19362196a91.1.2026.10.18.23.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:27:59 -0700 (PDT)
Message-ID: <8a2f55ed-67cc-443b-bcfd-fba9c6f646e9@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:27:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
 <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
 <686fe87e-63a2-4358-a6b9-8b2107b369e6@oss.qualcomm.com>
 <1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNSBTYWx0ZWRfXwxLsK7FvaGGS
 FuJO2zKj5qBKUDLa55cE9DcZDsXDqDZ+T6rZZc8menvjv2p0ZKy/tX7TvKbXeSxv8YgF0ywXJAc
 ZschYu7UeSBwzibu7Rb1ZFc10S6zRH4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNSBTYWx0ZWRfX2jce/SwhjcwZ
 RbS5e5NMjesISqrtd2NF5Q4ynJYkRDaPRZj1jbaqSWJEEzgTw266IYxp+Pncgu8O+OhfB1glrYo
 FjJ+nLVtDqWgXzxHSJw8rhWhfXO5Jd6ic7BqdUhOSF6LlEJTvtWaSpIOpL6n6ue5eo5ERmmPCEd
 DtdBVmAl7StPby7P20a4oTAwgKYxszQNKM8uS8rlUzXcnp90xVflS5qXrahCuXP5gexZvoXSNxT
 I1cChnPZw69Q8vVCc6NOJ1rosmGYx0w+uCA8ttHIJF9QHWjd3JJNcBe7skzoXy3B1IcRT6V8nHa
 wI218kIqV9bps/KNu0LnHu0eSWDw0+lsaZU7D14VXx+CbjYlSbwU9pRUiLriWS5LEyopP+NW/sH
 5rD/1y0s/X1ji0wVHqLIQz9Ps4qzmLvo3dd9KntOLwzS/fE0vqrSI3b05lmMPbhZdIeF9zPhiQ4
 rbyOhUOPeQqV/k/zQRA==
X-Proofpoint-ORIG-GUID: 0HAumex0SLJaGQP73rB4_Z8AuDGGNvgU
X-Proofpoint-GUID: 0HAumex0SLJaGQP73rB4_Z8AuDGGNvgU
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5b871 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=oXeLTmZ8f4T6MCm4ZgoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190025



On 10/15/2026 5:06 PM, Konrad Dybcio wrote:
> On 10/15/26 4:26 AM, Jie Gan wrote:
>>
>>
>> On 10/14/2026 9:23 AM, Jie Gan wrote:
>>>
>>>
>>> On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
>>>> On 9/22/26 12:35 PM, Jie Gan wrote:
>>>>> The APSS debug block is built with CoreSight devices like ETE,
>>>>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>>>>> ETM trace.
> 
> [...]
> 
>>>>> +        tmc@1d029000 {
>>>>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>>>>> +            reg = <0x0 0x1d029000 0x0 0x1000>;
>>>>> +
>>>>> +            clocks = <&aoss_qmp>;
>>>>> +            clock-names = "apb_pclk";
>>>>> +            power-domains = <&cluster_pd>;
>>>>
>>>> Is there only being a single cluster_pd a mistake on kaanapali?
>>>>
>>>
>>>   From psci map, KNP only has one cluster_pd shared among all CPUs.
>>>
>>> Hi Jingyi,
>>>
>>> Can you please help to comment this part?
>>
>> Hi Konrad,
>>
>> We have cross checked the cluster info.
>>
>> The PD configuration for these two clusters is identical byte-for-byte and is based on cluster_cl5. I believe this is why they share the same cluster PD.
>>
>>                  domain-idle-states {
>>                          cluster_cl5: cluster-sleep-0 {
>>                                  compatible = "domain-idle-state";
>>                                  arm,psci-suspend-param = <0x01000054>;
>>                                  entry-latency-us = <2150>;
>>                                  exit-latency-us = <1983>;
>>                                  min-residency-us = <9144>;
>>                          };
> 
> Right, the configuration is the same, but ganging them up in a single
> power-domain prevents one of the clusters from going offline
> independently from Linux's PoV

That's making sense, we need fix it.

Thanks,
Jie

> 
> Konrad


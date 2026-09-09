Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FDF552931
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955952; cv=none; b=cj2nViAmQiy9GdHbdpRinpXzA5yXV+N1DIvrLtdpH7R+FPwihy7pC2WiVunzX3ZpnbTuqUfCNvw7iLPrYcWTjwxvVLdY+uBKCavhQSoKDsfp86E1sjLv64wSFnMjRnLMGz1KJoSGDaCkv21eXR3VO5GxF2851seN0pJeKtyTeRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955952; c=relaxed/simple;
	bh=Np7c5aBXs40Izu6BhIoBcwK6jKTo21Aj+MxYQLBZy98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIF9+EFxxNKC91k3tyaMkORzmM0LQu4PyD9MN6DlUyTBP7k6o+kXkklHYxCpDIPAjxIHLxyLfxOw5/w/i4UIgZ/BsNEOlsr8OyERZ3U2pBK3/v8Xrdy05Tbf8vfrLBvlJu5YlczUt4RLzGk3UKo6TAplmmOEwEsDeAaZHbnWDe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7M4UGz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWirkZ3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7M4UGz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWirkZ3y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU40E1723123
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=; b=C7M4UGz4QFPthV4l
	yS18nJkdeOLTVx7y2IPax42+mmc3Hn3N/vFtUzCkfsi4g1TpYRnWBjn79I4SjjQK
	CA+Rw5WK+OM4fY4WM6PCNzUVoloKqk2tP/5xDCRp6ybEy8RN1hIESUbo7h+YUSYa
	eopKOdWSgbvf0JWgYg+XXlzknNWdemqgqnpNS6F8UeGZocMSdLYSuCrdP7yv28rW
	8ymbtsktpmFoMPySPTcJfEMtX8cMWgueiHcnznBzOxiq15yVKy2ludY050OcmJHi
	5zslGt6qMPC07koi2QMGURnRkAxmGcgaS+GjXKSC2hf2F0NbXtKPztONVv5f7Gwd
	H3gpAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrfcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:12:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cd500ad0aso11095786d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788955948; x=1789560748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=;
        b=IWirkZ3yI9EI68EWCLeqmB4c+t7Khg8mud5Yo4kEwsT5zLYoq6JjGcIIevzpTIq1wm
         zI6TmknUbMT+OBRNX9Ax5KoG3jbOYhjrVQX6DAuJ7+/WzfIhWXcEe7imF4P632mXoYdZ
         9jl7wKHaNd4LrVI76pLAlCAYEw1c0y4/KUoQT9+HOWlyJUSkZ6/oaNmD/Q1r8V9NNPW3
         PAgg51TXmAhCgEwWeZXOceIM7YG5mAOBofTNAFLCwzyLkOJ/eWqFZTqMv97KbRSrZAJZ
         NYQ2IIb2ct56rJlvVJulDdeOgs1oqYyPP5J315VQkqjBYqr50x46shO1FVKq1L5EcduE
         jXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955948; x=1789560748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdXJHKg9yw3m3xvjN/96iKJOr0TVN9REc8Mom5izEBY=;
        b=UW+43RUXmI6l0MsNONHpwGjoEdDb07YLdkfwgy7DyesC93Q0t7Ax/AxUdtZ88SDSjx
         nq+q3LvyUxVxn+WrBR+gZnj7M9oRdEhYUKA3vFjYywN+kLUNySxJElsgNfuCX0MSvIvl
         4OcjSZpfFmiTsX0ZTp5tcPhtyMC5uPCTDeYrfyJlTtgJwTR1d1qR7GKj55gG8IySVgLW
         TdpYsEV2hAQNe5u1bKe/kaNjUJrdlyRhALbMrlX/02rG9LFMM16QeiM6PKhH7yYmWAGt
         p0kg3xBJbWAuGLo7a7USbxp3feH2/iOnUV6pnfNB8OYpL81lTEDg/gLXPSXEmF4/lsdb
         Zuvw==
X-Forwarded-Encrypted: i=1; AKwUvBygNDny5idMFwFHfYM4JW9fHOGA2KANHEq41HRnKRoJakgId7HbrMopDUFOQDhzoTewnGn/REKKZLn7lWU=@vger.kernel.org
X-Gm-Message-State: AFuF++kNsTOr6QeQ0drT4011W2ZlW7PiP+CCGPws+IZT3aSdHiX28tmh
	XGcN95s7y5/k1kNSJH/5Qvbx0Hlt9ubqbuX3DlNT2wkgz4e41ow2mgqVioOE1RYxBDmRwJJ+12M
	DNOOkjTJPwq/gwWBpTAa8WCJu+D8luwnN2RjaBuHEd0ycDiwFoV+x8EH/cdkIpk6vIYY=
X-Gm-Gg: AYBFou36RYAQy+VXKbt6ihGmPEBvwagz83IbG9aSVfKDepqSRVN0TXTUdLiLaLUSWbH
	0L26KGrvm1AICmoFoJE8lyb0xm0y5+TPVGHdhWi02f8sRp45vULAonkRmrhMaMsoSK3rynqkET0
	0/+d0MjkFu38OXhbAYz0M2vut3YaYktHs8WB8nG7ptHq9nhT8k5m08A5+vUG+dOziEJfUxrpovN
	+FgOZlN50KOn3oDLAmXjrFrscFTeOW7ss/bWQTtasnt6YhzbX7O07Gw9q+kxdsiZaRLArU27Wjw
	Z+xpB/LlzqYhB2YVwCeqy7e4eZ2qOyBsg+TVz7C9ahhpzCTfBZj3UD9iMbVGF3eYvgkgZhzFjF+
	uIXryvS/oNv/ljseLLMgBDQ==
X-Received: by 2002:a05:6214:5012:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-910476c940emr268734476d6.2.1788955947927;
        Wed, 09 Sep 2026 05:12:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5012:b0:90c:c716:91b5 with SMTP id 6a1803df08f44-910476c940emr268733556d6.2.1788955947372;
        Wed, 09 Sep 2026 05:12:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036902sm752132366b.3.2026.09.09.05.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:12:26 -0700 (PDT)
Message-ID: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:12:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Mieczyslaw Nalewaj
 <namiltd@yahoo.com>,
        Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260730191353.557494-1-kuncy7@gmail.com>
 <aeeeebf9-dbd4-4f57-847a-5f495b3236a2@oss.qualcomm.com>
 <20260803091003.15285-1-kuncy7@gmail.com>
 <8af46926-fecc-4396-973e-2290ae285998@oss.qualcomm.com>
 <cd5a25ed-76a3-4f1f-b924-06bb685ff426@oss.qualcomm.com>
 <181944c2-2484-4384-9c91-45cc87f31955@oss.qualcomm.com>
 <8286b42e-0314-477b-ac2e-4b410a97d833@yahoo.com>
 <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f8b9192f-fe88-4a8e-86f0-6e2c33ed3f31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yc-bM0BqjUBXZecMzOHgqXASlaMSIDNx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX5bsILqKAVAc+
 UIsnssT/kCjtZLZ8/dEtNNgvbPNIVrFu7pyl+unh2swsHlgaQfKXa6X2I/lOSuPZefv/dZ7h6oG
 7GXENT/VxZBPbHaHFR8tSbjKA0qgMkk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX3CmzUG0JUKf5
 hCxQcRK9Thui3dLJMoIx4PZ6g+NTw6SfiWFDmWoBfq9vcJfIuO6AlxjweoPFG36f6eCklLZhMIJ
 CYjiOe8V5pPdOESIGDbFK9byDxgePsfuFkBtSZZSH3rV/D6ph+gYL5VlpVg3sOkTpjYijG/tsQ7
 9SVEqwwnNk6c15D1VCtxLiU9yts84JRtZDfxbCVzXaWReT94OYyUT/ls2Camvzayvv/FoosUWxL
 srXiQ/CUOq5FkuWvDHYhtF5mLT9IJxxvJJTSglsy3u6Cc2S8oWewRcxqUMNolC1pvrXzaZZSQv4
 erA2eORBIUS/XFD5l0d9ivNwnYICZLaA6yB3gVPkJCMuB8oW4H29h9+5VTs/1qv3nccnd2YEwkj
 L/WJOkLsKmFZPBbx46G5apvv8Q1UmOg1gk0z7ZOhG+CTr4Q48jc1z7ts/VLKKkMtiTPJ2znC15i
 pGFsarJAOS6aMjkdWYw==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa14d2c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=W21wEWUqPQRnM_OgY4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: yc-bM0BqjUBXZecMzOHgqXASlaMSIDNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090136

On 8/24/26 12:28 PM, Jie Luo wrote:
> 
> 
> On 8/22/2026 7:19 PM, Mieczyslaw Nalewaj wrote:
>> On Thu, Aug 20, 2026 at 01:39:52PM +0800, Jie Luo wrote:
>>> The CMN PLL output clocks do not depend on the AHB or SYS clocks. They
>>> continue to operate correctly at the fixed rates even when the AHB
>>> and SYS clocks are disabled.
>>
>> The PLL outputs keep running, but the AHB register interface does not.
>> Once autosuspend gates AHB/SYS, any later register access to the CMN
>> block hangs the bus. That is the bug we are fixing.
> 
> As far as I understand, there is no expectation that the CMN PLL
> registers need to be accessed after the CMN PLL driver has finished
> loading on IPQ5018.
> 
> Could we identify which module is blocked after the CMN PLL driver probe
> completes?
> 
>>
>>> On IPQ5018, the CMN PLL provides a 50 MHz output clock that is used as
>>> the reference clock for the connected Ethernet device.
>>
>> Correct, and that consumer is hardwired in silicon — the internal GE
>> PHY and uniphy blocks take proxied this clock without any Linux driver
>> calling clk_get() on it. Therefore no device link exists to keep the
>> provider active, and CCF rightfully gates the bus clocks after probe.
> 
> The UNIPHY block is the consumer of this 50 MHz clock. It divides and
> gates the 50 MHz clock, then routes it to the connected PHY or switch
> on the IPQ5018 platform.

Is it only the UNIPHY consuming the 50 MHz one?

static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
	CLK_PLL_OUTPUT(IPQ5018_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
	CLK_PLL_OUTPUT(IPQ5018_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
	CLK_PLL_OUTPUT(IPQ5018_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
	{ /* Sentinel */ }
};

What consumes the XO clock? What consumes the sleep clock?

Konrad


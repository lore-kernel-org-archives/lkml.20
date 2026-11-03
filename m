Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683775;
	b=N8el+HABqly+W8/hUE/IomA+DPi/6gTrlk91hccNykaOPd6cy8HlFEwXHMOlYqJdtj2N
	 tBD9vJmmy0RMkYtCXD8bEmeiY/e3qV6BWU6zpvJwc5P48AEGx3SfH0FcTlE/KxdcTai/x
	 wBFDx3W2XNIMPZg1j2kyrUqzKf0HyT/zXccPSVXDhP26y3XjIYjn3FXmkoDUDSsWKw47O
	 +MuO8bdYd56aE4ZWQjHcF4mLxkudf6kXYL011hPCuO7+l50OcLGNrLcQFUSclg6ikengT
	 oESQHj5Mp0fgFoIjbs2CaMRuwCSmt/kzdPgWI3B2OfFO/thwhLp1xzN6Cv6C9DpXbzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nauR3Qpw4qDzU3M0MToUxdKJrlvc0tM2JwXipe2UNKk=;
	b=f01pxao8urRt6o4GyRZI8KKrYJHUPD/i5v3YNxY4gFiZkqmh8pqxJjP1XpWryydHTng4
	 ggq+PGAfjVqoqb65OIcpKCBe6w1y7E79KZH1M4MxSjWdnD0KVKP5bAkeDFTTuVuzUuUYb
	 hJWXlyGrWCnt57F+zKJuu9Qytj8ms+JgB+zp5D4OlNV35KT5bWvuqZIGvzXL+EdWmuHVu
	 LoZBEnNdSTzdnRi1IiP1gJdLQSWSqnGeKLhMPM9//jerHIPBRUe0FQfWGPM3Xxo3b9B/9
	 Ol4Bl20ytm46uY6WkTClJFMeuV6yV77uqdLt1wXUjFTTmIbOkJMZHuJhrrsPw3jAs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q9GBgtRQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bU69q46f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD49606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD49606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q9GBgtRQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bU69q46f
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eKCF470786
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 05:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nauR3Qpw4qDzU3M0MToUxdKJrlvc0tM2JwXipe2UNKk=; b=Q9GBgtRQxImJvKOY
	7Ikqd4ulqysMzq68hoqVh11FXvbQDDuyCDnJhAZ2zfD2nuYN2KY6K6pliIrhh4PX
	DKOArf8UsxsbNLt/6tpSl5R2q8T5oyx92eRidHrtxNrtf8ahgd867C2exppBMnDH
	iYfXrgI2xU4FXvnEa1tTw8UpF0wfmt9FprF7ggY+PwDBJULp+1gMnKD4V1a5qzSo
	oFk4JMSdS+xNthtrUmcfhG92Q/UW/EJhW1WNHUBflv07tTd19aGwbqvHWDIC0P+2
	bctHeDnl0BhYgvGQJjmF0zIHz+oaHGk9PZ9AK8FU6F1hQPfmS370Eick7uy6LN7a
	RZcB0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081t2gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:29:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e954d87b48so56687045ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793683769; x=1794288569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nauR3Qpw4qDzU3M0MToUxdKJrlvc0tM2JwXipe2UNKk=;
        b=bU69q46f8fRtC3RVqsjaS351YsmeEbDx+xAlBg4trIRUyMFOGvfdFzFOD18ercfo6O
         i3+TTXypCp2P8AXm6loII9wgXgh0Y5Vb7kFN0xU6FEhE9EXmO+iSev/NhRa2EthmKWUV
         mJC/23eupq9SfKEiQGB+ZG6AdJHaYZxh9f6KfCnJnJze8WApcjb1RMdV9PQqdYWam8i9
         HrCVSY0k6vvsq05SwN+YMKIxRnMav1GVLR85Xjz/BXwH8V4Gg/E9274QevzSHA3ZsSgf
         mQmyYsmCmtzWlunpy0ngsuHV2g2YQuVMPLvdKgWTSaHVp+T863El2Iici1Zok/If/8uF
         t6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683769; x=1794288569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nauR3Qpw4qDzU3M0MToUxdKJrlvc0tM2JwXipe2UNKk=;
        b=pUWyTF2P9Y+8DHkkUmgdgtARjNYdEiJ693ijUd76nIu9HHONqqZCj9y9l6JCe/TuGz
         +FTEUObmAp0ZTHeIEFrr/Jmt30ymTYL6eHlget8x16O4CGgaYgG/wsIZEkVyMFGJHCfL
         K44hOkEMyz0p+uoH5UkWRk/mTc8ruUcWN3KURr5161HE+PyyZoLXp2+9X5oXPar+xuG6
         pqFcbjmgAtYPxANbyXaM8BWR+TesB7A045UihUaVxz7sKSsOudFLEwr49xE/SWYQ0piN
         GbJH48SJzYA5iPV5MWwD/7PQEwoGO/rZLS3Q6+mWgK0XEEsdnfxsyp72Y4YaLXivHHUM
         R6eg==
X-Forwarded-Encrypted: i=1; AKwUvBwyIr9ZH+jOCH6vlpVmPZurckTvY69H3rBxdSeLgi5VfA9ZG/gTEm+UXfjTGNnUftRgOM/0+X7UvRdUy+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z95VrKOT3sVPd6bMe07ESqCUazTRoGb+yQ/GkbmeV7aH3Uy+YPn
	xG2rGcBpHhz9bVij/AVH6nfQvW7e4+dqgewJWeXtQefOi1bGE1iRDaTqUXlyxFDculNmKTAaspH
	5QeaEW1jkcE59S6P4F/vMCJQoDW2zZb4m5lguOUiO5fcIgtWB0ViWVapkYiS7LyFRRQI=
X-Gm-Gg: AYBFou154uEJxncWrVv7wuP5k+54bG0uUVmEvol8r1uBKi4kQl3/dC6wEKLTEuGGMCP
	czv0XvhsrLEWzD1PoV73tJiEKJYZNfhQb+W1wD5ol+fcN9nWWL2GpBcP5qtABdOgZ1jZhfkznPd
	ka3M33mOpoCbcI2tC2vg70SSwBfw8Qp8I/2LfpCAcrnKHo1hXeVdEq0wr/+iTwRjkNSgcSLMFq2
	mgnd4rMhHVqDLe1dp72z+BUJUCvHSchzIT86eEJMHJlfGebYmSLy72OCLiXbBChanfezKeiWMV+
	dleBNEjuhviRF2gBE4k4FnynVku988w2oudSCRts7oyZrm2nkxrYUAnKqW8tUwRDdhampXmne7v
	Zf+i1FEIgkjGXCSRRbcqPi4OAJa+FWCLNWVkFRkfIFWIqowujjls/m9PjfoO7SF1u5XJf+A6zy5
	lefBooDOdwe7HRq1fRSkZGNlKey5eESSpK
X-Received: by 2002:a17:902:f68f:b0:2e9:7dda:bfd1 with SMTP id d9443c01a7336-2eb364c45dbmr110155065ad.30.1793683768698;
        Mon, 02 Nov 2026 21:29:28 -0800 (PST)
X-Received: by 2002:a17:902:f68f:b0:2e9:7dda:bfd1 with SMTP id d9443c01a7336-2eb364c45dbmr110154855ad.30.1793683768154;
        Mon, 02 Nov 2026 21:29:28 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f56bsm35371005ad.16.2026.11.02.21.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:29:27 -0800 (PST)
Message-ID: <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 13:29:21 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
 <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfX7qFAzJL5GHrC
 x2X0wTHfLvJNNfCU9OZGSw6LBoaK8A4l5KGXhMmY2VDNPtnm8cwrajEzuNrjHapEnl8Q9czSsT/
 cK2UuBGxEA0XzicU5gcTHcrTqlqKdDc=
X-Proofpoint-ORIG-GUID: L-fwV46-NBPr6q7psiHAVQqif6200dFs
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae97139 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e403w2VLNo3D9SQJzk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: L-fwV46-NBPr6q7psiHAVQqif6200dFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfX8jLxA5VDegjv
 +wuYc8E6vRvmVfn0/92m47dogwGiXVWM+AaRMefgdiINvNKpib9XzGVqk/xkSSVpzZkwTN3mlJH
 rl+L7Netqkf92N+KCxNDZUsv898+bi41ReNBNcKbrRFgIAGu5jSapP3Tge1+nzvijlRoDlnXTr/
 TQpDx6O5AKx3DHyR39isMuGu+eX5xUJLEei5WeWjpXVSMVzCTgdtqiA/T62La+eCqsogaErpr/a
 0D4iH+m1LueHHIVn4L9YQ6ahkR0BVgegH5LnSyIL4VjouNJMWV8jc+58iEfoCPvWuAIWQ0C+SZ2
 0+MmbgpmgdmIIXm9MkLbNKr56dzTBphD0oXf2PEAb8x5JDj8nzEbydmuOg8+zqjviRaD35kAgcJ
 8kK9VuVOFLzfRw4NyPQj8stzMecSa2jdSz27FgUm5kiO8NZ/qWQBzlDHgR1JuYaF8OKYR/O1fdR
 jBbVBKqrxtimIJZDy3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030021

On 11/2/2026 8:58 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 15:25, Hangxiang Ma wrote:
>>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>>>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>>>> +    /* CSID0 */
>>>> +    {
>>>> +        .clock = { "csid", "csid_csiphy_rx" },
>>>> +        .clock_rate = { { 480000000 },
>>>> +                { 480000000 } },
>>>> +        .reg = { "csid0" },
>>>> +        .interrupt = { "csid0" },
>>>> +        .csid = {
>>>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>>>> +            .hw_ops = &csid_ops_1190,
>>>> +            .formats = &csid_formats_gen2
>>>> +        }
>>>
>>> This looks strange, why is there only one clock rate ?
>>>
>>> ---
>>> bod
>> Hi Bryan, the current CAMSS CSID code always selects the first 
>> frequency listed for each clock in the CAMSS resource table.
>>
>> In camss-csid.c:
>>
>> [...]
>> } else if (clock->nfreqs) {
>>          clk_set_rate(clock->clk, clock->freq[0]);
>> }
>> [...]
>>
>> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
>> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
>> 200MHz and 300 MHz is not sufficient for the sensor's output pixel 
>> rate, so we need to use the highest rate, 480 MHz, to meet the 
>> bandwidth requirement. Thanks a lot.
>>
>> ---
>> Best Regards,
>> Hangxiang
> 
> We have a series from Antans to address this though.
> 
> We should list the clocks the SoC supports not constrain that list for 
> one specific sensor on a test-case.
> 
> ---
> bod

Good to know that Antans has a series addressing this. I agree that we 
should list all the clock rates supported by the SoC rather than 
constraining them for a specific sensor.

One additional concern: if the clock selection logic still always picks 
freq[0], listing a lower rate first could leave CAMSS unable to work 
properly with sensors that need higher bandwidth.

Could you please share the link to the series? I'll rebase the next 
revision on top of it.

---
Best Regards,
Hangxiang

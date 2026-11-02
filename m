Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630362;
	b=Iq0ewsO9c8aZysg0/zjqPKCUgMl+8WbyWndhB/Z987cXqmyoF3H6rj9dg4EC4fUVfrmj
	 U+28o23z+ouGl7hOK6bQpszZFl8xRqbh8t2h11N1jgmB657fd8ptWz+1YFIeO7lFsnjEP
	 8S+J21MekEaWgw4gr6WNrWjRoIbvDV7LA9CNoUbLekqRSZxng9Fup2KCBMVfmxZFvq7us
	 pjLhP/FAeqSHJo/dOTMbr/w4Y2zexcysNpnMN2TKYdS4RjqnUT7arXx1UsuS04ABvC+aG
	 Cyv+MwW2PLw3u96DN7m2jhV0Ve+uiFoBRFU8xXMSrPesPg7urkbVomsYDkfrfAxwXZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eSQPv9J+QlCFTNzamqkT43tzwOVTKcOK6QBTK/tnv2E=;
	b=FQtlhV5oZpgahaRBfBwgx3YP23J8PI9BKHvCRmY396IS9F7xmXHN+AMqfyJCiw8cGaJx
	 t+inyM9HyXhEvZ2W81Nm+lycaqOPDVyXd3jLn4Geynqsbi8kxRLPSWQ9IUm/UXMj1qjeO
	 Tq8u3L9zhtCa0lO+2JtQSsUyZJdDyDA1MTcxptcCwtzX5DxIAFr2j9mqgZ8SytSnVUivb
	 JP0nOjfLzJ8B9rqpVyTr/rPUOw8Bu1iX10lLB5S2Ttok/4QSuSTQw+T839kIcVecyQn93
	 +DEVPEuJqaSFDCX0ZgQZLXScJKgBNchXIDsT5giKp1UB6m1FitnCw1BqdFx35EZHiDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKgJ+Bvs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWfT5v7i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF5B606E011
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CF5B606E011
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKgJ+Bvs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWfT5v7i
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIEl3102577
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eSQPv9J+QlCFTNzamqkT43tzwOVTKcOK6QBTK/tnv2E=; b=iKgJ+BvsSJcCQgGa
	mJSVvfoMUao9w/aRtCvYNnMCnBDeW7YnEv84V6gfcPnAulp4PULt8v7TDDQMqVSt
	2+fBcox4doGhkA5V+YeqgOYxhvd0Vs5b7FRgP65/71jD6EyljLG59ksaTXV+YF2D
	zD8VSY/ZDhY74AQ6HAqyrXm6oZQVuhzBU1hK+/J9bMKjzJJNdahXXMeu8cBh2/j6
	AOwewqBOUUhEZESuJA7TOe9B0wjRj3XJlE1Po4i/Ymw9qtMLADp0U1tV75Q8lZAV
	5ZWebiOgf6FnbpY3iFZOw/sCVabS9Hvk1R9xNB6Kfl128DpWJSm8hzBHim7oqY7e
	adkkjQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rj98r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:39:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso171644e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630360; x=1794235160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSQPv9J+QlCFTNzamqkT43tzwOVTKcOK6QBTK/tnv2E=;
        b=FWfT5v7ip5XjQskGOoQIpn/9PXq7cifQ2XWFTDrPdK/mIRP2HS7zWJKJjSLUjbMMjX
         iWnM7ipK1xMCBISyEOn7G+Gsa/IDH8ohm5Zz9KskLMpBMjQS5zd/3lbs+3grbU1J6RPy
         9LwV6QodjRDmelNdUYmxOqUQsQazgfXwN6MNs4pA2tsGIZtxRQDuuYErlueeRKQaFtun
         KhgCr2gyCm5Wke81Ijxp+noqZUb1SIKUyYX1M8dupVUUnbutXeO0a7QeuW8LgHbNE/KW
         lHSy2ofHZHmP9wVSar0a0KvgKm0/AiWxZtqJcpZJVMyCdlUkh9d5O8weOLWj+uaRtEWa
         KuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630360; x=1794235160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSQPv9J+QlCFTNzamqkT43tzwOVTKcOK6QBTK/tnv2E=;
        b=EiUw/dpIt8/mETDPsmaEWTx4vJVjzHdEoCjH/+oqb3y9lfOZAo4Nhe9g/8e6/g2qS4
         a4TxkLItJ/zlJxwhbNyUzyk0SROLMOhbW0rE1lK+zkxR8tS0NKcoZQcnb20YmEIg+xFm
         vLU6tSn+fDnrLWFo1SH4bdgY9X40lNvt8w1+DSVCbKPLJSsuSiUtlKK0+01wVNHR2YEh
         4h7YtgByLUh1Plzgmjd2qbdQukonnQnGlKlHzjbZdTiRO4xCQiS2Ihtmt9DMoAIv/i52
         kf+2UfqcA625BrdkhpdyP+QuZUhwfuMffCX7TYhxAm+9DcXoS4yskoVQyljD4tW54fDw
         ASSw==
X-Forwarded-Encrypted: i=1; AKwUvBwIsK/p0kW7cmcT2WbukZJMmNaHudwrta0A4s6CeqGPbvjL4+DG7xgRPbK3PYEgpkLjMHVNxqsqO0lgIDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lJKTMGctRDL7kEb3eKo5XLQkumOaTEEuOZ7aLxx8v3+aWx0YD
	AqPQxjIM1mBgOejbG2kxko/ABU0rArvXRwL/0G7L6WJOmeGCUfmfsV4bwp3LUZUApSv76UZA/Kt
	saQBclbLTImd/L46WoiIzkilcN09JjmTHwYoVgs57bOLxC5iXu8i3Yd65Z4NShPXfP3ZYuGZH+a
	c=
X-Gm-Gg: AYBFou1ObCgePyMTKqdL+7O5JbXGdkxVgbodQ7BEYZwCg/YNvIfMwaHKt9CGZVUhDcs
	GXgUCLxmAlHKviV51LevO9hQpQHlQLMa5fS2Mt+Kh1pT5QXzEc46lXu/flKKEZOf9+NGRdpzEJT
	PVc9ebHnVaRovgDBfQt8bIVpO5hfRJcm+oXGYJqPJJt4JfxKAkwiT8WgqfwXWE5YSwaQHc775FB
	Xi8f6Ym5/9YzWFjlDsVTBUu69Gns/Wb/KhqZThGByG/vymT7mLh7KY+J/pV5TKq0Hy9l780zZop
	kgYJ+Ym0bI/g42b+JFX62xhnyt7OmpPS/+ok/eka7OvyRzHnZB7lPlG042hqgqv7LNjI5+JGaRt
	KDSpYuqaEXz7dEAXqBo/vlK76HasnLljirJ/e2fYu7NIST71JN1wOdmGpksaTeyUrArIuRSMNch
	Egomnvs4wxD052V1eEdim0BMIrVS5Y1w==
X-Received: by 2002:a05:6122:2b01:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec6897ccbamr4412993e0c.5.1793630359991;
        Mon, 02 Nov 2026 06:39:19 -0800 (PST)
X-Received: by 2002:a05:6122:2b01:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec6897ccbamr4412976e0c.5.1793630359426;
        Mon, 02 Nov 2026 06:39:19 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe3c449sm403461466b.49.2026.11.02.06.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:39:18 -0800 (PST)
Message-ID: <e23b0980-4759-430e-83da-52f44cff37d5@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:39:14 +0100
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
 <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
 <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
 <a05ddb1a-a84b-4db0-9806-918958f3a962@oss.qualcomm.com>
 <9f7c605b-e7ec-49d9-85af-7dd9d00a9079@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9f7c605b-e7ec-49d9-85af-7dd9d00a9079@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b6Fi0bglbBzEyBHoHRLqsTafSvQi2lxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX6A0MhJ8WiLs8
 MvbeId+BoWKw+0eHCI5T/ZapFgfC7wiPqR5csVTGLcpc5aWqM3SVBwT74IGVkBWYNY2S5+f4Ovh
 KYIU2ZKOTnts6RjGqBbFX2lvWPGncH/FKd0AV15dgHY97k0KiRfNRvOyvOyNCYx+2zT+n01byNc
 FQPUMYYh8njwvFjML/9NNRF3/iRvPm5yQalQXWzCw/fBIeaJeXWbYs6/Dz4lPruUBbZ0qhdJ7RY
 f+AShgoq8g6gwjHhGZjJV7fMEAKng6FFLKQuvBujBXVqyM1JhkauLXSKkbtu6KAAAlvFt5QEzX1
 H6vlkM8Qpl8OTI9NerjibbGVqEph8L/1I9u8ubR2DWlEJTAtWEYT/M2exawOKYQQHoETQmugVN3
 EwcAQ5uS2hUSd1eKesfZ1+o16G6x9qPzqSsPGtb9KbUH6zjLfJFgrhpvu81Bm0MsLg2UBHeUgQn
 dp0pyqvljN6aKyOpzRA==
X-Proofpoint-GUID: b6Fi0bglbBzEyBHoHRLqsTafSvQi2lxm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX6Da5nzFndGiB
 CueLoGtPWIzfRPuXa6JKNo7HjJ9eSuALt+kOT1CI09PKKBRhEjtoSWkhw6q9UCfovE223A+l77H
 zNZZTmBinf/PbBYq9+jlkte5MQi6WPY=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8a099 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=TnnhYUFuctcyKAmn-PYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

On 11/2/26 9:15 AM, Prashanth K wrote:
> 
> 
> On 10/30/2026 6:54 PM, Konrad Dybcio wrote:
>> On 10/29/26 7:11 AM, Prashanth K wrote:
>>>
>>>
>>> On 10/23/2026 3:53 PM, Konrad Dybcio wrote:
>>>> On 10/22/26 12:43 PM, Prashanth K wrote:
>>>>> Currently when we perform system suspend, the phy clocks aren't
>>>>> turned off leading to power leakage. Prevent this by adding PM
>>>>> suspend/resume callbacks for the qmp-combo-phy which toggles
>>>>> clocks on/off correspondingly.
>>>>>
>>>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Well this still leaves pm_runtime_forbid() in the probe function..
>>>>
>>>
>>> Not sure about the history behind this, I assume its for controlling RT
>>> behavior from user-space.
>>
>> Long story short it was an opt-in because it was broken.. can't recall
>> if the issues were on the dwc3-qcom(-legacy) side or somewhere in the
>> PHY code itself.
>>
>> Konrad
> 
> ok, I'm not sure if we should modify it in this patch, I'll enable the
> RT PM operations and check its behavior. But this patch is intended to
> enable the system suspend/resume ops for qmp phy.

> While at it, you had suggested to add mutex guard on RT operations,
> I think we can add that also as a separate series since it needs
> addition of mutex on qmp-usb driver.

Please assess whether it's necessary. If it is, it's a prerequisite for
the other patch. If it isn't, there aren't any blockers.

It definitely is in the combo PHY case as Sashiko points out

https://sashiko.dev/#/patchset/20261022104321.306679-1-prashanth.k%40oss.qualcomm.com

You can also use:

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)

instead of adding custom runPM-as-sysPM wrappers

Konrad

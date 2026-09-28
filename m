Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30F45D90F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582324; cv=none; b=GopGR/3BpjM+GT58jPy4l1Le6fFngodLT+QQpJEjx+MVe/MVeE/3OZQTG+taTkKOKDZJakMxbULsFnPtGhQqPq+FKrnmmvFYte5utU3JUdls1ihL2a/90zjPmo4YqoqlG4cp9DQ/NJcXAW5LnLOFl8WkoN6EfjjbSHKwfMZmRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582324; c=relaxed/simple;
	bh=oINfMFzwgmFUF8JnPJ7Uumdy83saBkH4GJpPh/hFZ1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5gQswrnO9bRxkLrH4yerwPQ4oj3y5FmEu8wnXo4SnnTtcICR07V3cIIgXGJqpCtYoGejNQyFdzMr10z3WHKTKt7bLGEReogqJsY2aTybq2jPi8wxE/nblgRMwQgzvSF0V7IY56Y81Cn689F8x0JYrC6lpQ5eNW4qx4Kn3YOT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVkk5pUP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkAwyzIc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVkk5pUP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkAwyzIc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S0PWHW893068
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLePkQK14oDgXmWMoUR6/Kqp6Ke46jg/FT4UUQ96oBU=; b=jVkk5pUPMZuhdiWZ
	F6Ts7niLnMxiE/z/r9JIknubpWcPWU79Of7QW+39aHP/LNdcI9U0he9fc5CRPFAb
	VaYx061TaQymdzGjRBytgGU2wvzgGawYIjiFDHcDAHlWbVeIRjdbYDhRrg5tF6ja
	FWmU5rxFAb8euh5hrls2/aW71WotwuuXdYgr24B7riEDGbaYDCVjMuuRbVTIJv0d
	YGqKoh0eHKGekrE1MM7FkCnbNzuEmPODsQR9TRxJ1bvpTZeknWcA1WoHAGu0tzIb
	BioiK/cG8+rJtGKdIHfuzez05HU3hLSsBiflN/u9bVY58xQnBPgaRzcgGULUH8UV
	0sQXzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp5e2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:58:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5333e3f5811so14944741cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582321; x=1791187121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oLePkQK14oDgXmWMoUR6/Kqp6Ke46jg/FT4UUQ96oBU=;
        b=FkAwyzIciX9L/6vapRnq+7ew/FrKTHkNAHUOEw79Pj06ZoDkxzjF0Wz2t8BMskV6SJ
         w7gago4Uoo++2MCsXHXqvaTwLOYLXT6UHY38ZSshrki0IC3rhSviCLBrYAWIFYevSJZd
         IwK/2kLCBSvtYjH9O+kjM5EA85XUcTh4hlJuUQ++AwipHtS+lC/QTYkKa7HJZ2k6Sa+x
         zfZbwik8p1tzLV98YeUFiDqYcmT+EOKPdbkvDb0sHhHIJ1fqrcCE/6T8rnmEft7vI45O
         HUv6htExKYJv61F4/pqOewTE3AQjRpqQAsrUEwz825s74mO7JdDnRrY+t8OenXMfUoht
         1QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582321; x=1791187121;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLePkQK14oDgXmWMoUR6/Kqp6Ke46jg/FT4UUQ96oBU=;
        b=rdRJQL1MRWkZgXAxhi1paUiLLDEKeNJczxLsWv78hR+mTrIoN/xeJo+Rc5mBba9uqa
         XHEUQe4xHqYmIbh5DOx4O/Vn+Q6TVpBAEcPgseyBtKY3nY+FqxNL2PA/M4oLyeWSP2Q1
         I1QkiQz+Q+gatpF0WFCBNbbVg5rEUF2mDUoOOuunVDcKkNfxj+KxxW0D+ZR2S6NZCUXh
         Rp1CSWMinem4X8kOVA4v7ZNXOK5PnNq4jSg7YSw5z6zcWDBPlVOKcfWwXzNDkC3H1iWX
         zQppwFUiZgMjGVETCcxm+gf107DpVJDaqc5TekMfYSbPL6wsOaRP8bJr5ufPceDca+ly
         5Z7g==
X-Forwarded-Encrypted: i=1; AKwUvBxKG/Of+q87/CoI5nlis9f/fAOgYpxAgLuzlQXovF/TU0eBCWhc1OIvl/ipVgaMpdck7VxdusFkM+jOLLk=@vger.kernel.org
X-Gm-Message-State: AFuF++kAiLbU5fURmV5EOKWi3+LvkCeuIkYvKUaYWz/FrjR9UooJsq3J
	VokOnXZoY6GGf+S0IkVMwmhdqCJNn+TXQRTXpebk/dPy7cu2LM5yZtaI4CFliVSlStYXMVzOFHF
	2nuiHn8gT6AyvlvnaFNtDr7uEk49dCcqDzjHwRQiyZFVERoGzWvnPl5oKEzflgjc8t4w=
X-Gm-Gg: AYBFou0Ut5r8yIkwzxCWjOW35SzXKg7vvi2krO7qJgMxqQZ0iPFYGY88salZuYuiPTe
	0ru0MygQJfJ0n64VCZtWyslsGR6UQ17Lx5EeOVAfz77crgcFaxp1Mvt8rP8IoohexUgzZbXHGl4
	9mMsVJniV2/bwM50zGIYWMzPt4QXHXFibcQJNqqLgwAdx+FXvRYGq8oW7CckeqA7qVkKKtc/hPs
	cNj+7iPGV97NCk3BlGD+2siPXMUBfoM64gklWWHQAvQ6D1gF0M6bkP95h1o3gHDQeotMvpXE0Ks
	XzrJivPtSaU29q4G/8e6NG+OeJ6Kaghxlqs9qiVXOLPppva4AYNW2/nAL6j7TMrszdN2epYNpay
	mrfEW5scL+4HxzBj0YZqdfF3ftBE2+NU8IL6g7aXnL+1DO+F0XEoo6cT2ZMqck8lB
X-Received: by 2002:a05:622a:1341:b0:533:36d3:1c81 with SMTP id d75a77b69052e-53336d31efcmr76941871cf.2.1790582321092;
        Mon, 28 Sep 2026 00:58:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1341:b0:533:36d3:1c81 with SMTP id d75a77b69052e-53336d31efcmr76941681cf.2.1790582320648;
        Mon, 28 Sep 2026 00:58:40 -0700 (PDT)
Received: from [10.111.171.191] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223efcc4sm57093321cf.25.2026.09.28.00.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:58:39 -0700 (PDT)
Message-ID: <c6a4a9b2-b7d9-416a-a4b2-b669bcd52b74@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:58:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org
References: <20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com>
 <20260914-sk5jn5-v4-2-386e84cfb2b3@oss.qualcomm.com>
 <f653e9e3-6426-4e20-a095-5e2490afbbb4@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <f653e9e3-6426-4e20-a095-5e2490afbbb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX4ndwXlI4ZAsd
 mmwxNIvqDrznBKicH7y0+NFRNxH6NZgEJI+5OJFhwOvk/gMXPhwCRHP7JMzbnLXNkAz3UnisyGH
 FZB2tn9YzHrOs0udU6uKH5WBLIRb4Ascsa6TLYSwKvOCNDALaO1NoPLFplqZOjK9b5MS1LX+h4Y
 JeBcqNlCDfauq5SKZwBuRMAkRBT2LjFbGmhBAiAUtuLs4eGgt49/pn1I20ZbdZi7ew7lIoBcQ2f
 lulcNVX3G0N3Gt0noINbLcFaKtc6egIgcojj5qxDAiLjpIvPG3dme8dbgY5QfZG82ChFQtMdoDJ
 9XuMmJBSJYyZgOv/KABPW6ncYz+t9PpuMYEjPzpRkRIgV6cpL6TY8a/6FsW8ABQlId17wFFg7ZQ
 EEicA/Fg5ZXi4HWb2bKp3Y9jpl5eGz/H9ZEKUGoOkwRtXtjYlvqrtRfyA52n2aHfKY7uKLj2Ggv
 BbRBXFcV8Bg5mg1xp7Q==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6aba1e31 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eETrMs8bDw3qfd9Ur1UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: z_8LjTNTggWO8IFg9TSF-manVLnFWsIU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX2E5soT9KGjDp
 qDQ4HxUCy8NOJbtiANctuwobjcuqDJsHK0uHPGqceq6PkEF+EoOnibDn7qbXEGbm54cz3l3eU21
 fbdQRO/zjjhe5hfi+vg9+041FtjeO6M=
X-Proofpoint-ORIG-GUID: z_8LjTNTggWO8IFg9TSF-manVLnFWsIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280031



On 9/23/2026 7:11 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 14-09-2026 16:40, Wenmeng Liu wrote:
>> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP 10-bit
>> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
>> exposes the standard controls (exposure, gain, vblank/hblank, test
>> pattern).
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                |    1 +
>>   drivers/media/i2c/Kconfig  |   11 +
>>   drivers/media/i2c/Makefile |    1 +
>>   drivers/media/i2c/s5kjn5.c | 2861 ++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 2874 insertions(+)
> Hi Wenmeng,
> 
> This series fails to build against linux-next(20260922) after:
> 
> 7eef49c16461 ("media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops")
> 
> s5kjn5_set_fmt() and s5kjn5_get_selection() need to be updated to
> include the new 'const struct v4l2_subdev_client_info *ci' parameter.
> 
> ---
> Regards,
> Nihal Kumar Gupta

Hi Nihal,

Thanks for point that out, new version has been posted:
https://lore.kernel.org/all/20260928-sk5jn5-v5-0-19aa0a0a68eb@oss.qualcomm.com/

Thanks,
Wenmeng

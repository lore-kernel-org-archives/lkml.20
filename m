Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427C253340
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956647; cv=none; b=lf4kX9CfrYBJc67xQqhDVjDx4BYlezn4OHieeBs4ASDcz2FXWxkaqY4d5raEkwdYKjcP3ZFlKrOQyiQGcEnFRqugNrfixGkYoe4ycjpJ6Z1LXTQdLV8AJjdpJiCinIcXY2gqGBNono2P4uuXPNOADkCtw3zTmGYbAfbTPut4/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956647; c=relaxed/simple;
	bh=pffDxeTqTUR6LQjSZCkYskAt9StsM/o4yFboMujZs9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoPL00ruVlTeB+tQzAJM1qRa6zM10yhYRVGcjyk4VC3idq1tlgkXm6y24018od6sqxVHMH7N90DZT3gI/vzT4noLoSXUk8pyBa1wb3b/Lb0WADlgSFWVb+ZAoCSgw4cmUU1XmyZM7rHhy+KgYWdtlzK9lHjAj1T+sLJeppvzPMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtqAUbXX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDEmL0LJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtqAUbXX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDEmL0LJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGrGS2823096
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STbt/EQ5IYGf9hd0cIP+poyGBZ+Wud5KuSCXYG9Stw8=; b=FtqAUbXXrEynI2sH
	U5Py6Di06ElBCw/2qYdT+TROS5RUYyxFYCDp4gehd/VIJ57MthOzRS8Iqo4wquyN
	CuaeIVFSfvY3pzslvIvFsUl0rsADCooK/hx2lwUH6elqFyxT7m4lwhDzcfR2YUaK
	ZP4SIHHqMHTYt5f/CRx4Wy3co0hk9XipUdR2vmoetdQqJrW1pZs1Sk4XNOE7oTpo
	ytdSQYQUKXZoyPzLgB6iaw4qDWQaeRcInwPlDzOqIzxpMix59sfXTzeeSQnkikIR
	b+CZTtq833n88kJP+k/j7fhauCPj5hvIpFWGEvacrU7nnO3akIbCnW+rGn7FROd6
	Yh45sQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp25ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:57:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so40492a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790956644; x=1791561444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STbt/EQ5IYGf9hd0cIP+poyGBZ+Wud5KuSCXYG9Stw8=;
        b=fDEmL0LJeO9hg7lr+T8qIaOx3NjJEzKz8p1UgOvn9he8Y/o0RWS7zmZIwOPI5PchbT
         gzqfoq7m+i8Q1dx4SXEn6vsZL1qWnKhrPUUxEM1dCh75PvvFYkdpNmJi3yN5RIe6EvR9
         05xJcHTfeKTgqgfzyoTCRWwFw/kLgfWsnLgYvgON9efTySHfq8JQ2xf5B5v0NCJoFml4
         5R5YGxBEDir3qjssTCTz8PDIYosvb8fmgiWY/ZE7W9k+YPwMQBv4jgeCqps6INLclkB1
         UZGc6Dz0N6XhWlLw6H/YFp9yXAE/Y6AuS/iL44CA9ER4+3jRfcMMPCa7M4e9uqvByGAt
         ADZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956644; x=1791561444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STbt/EQ5IYGf9hd0cIP+poyGBZ+Wud5KuSCXYG9Stw8=;
        b=FeN8zHFct1E1JJURdnT8S1kDuX3ZO3ObDUUWHp1BPTqR8t6Allh9eYhwmD4G6a+KDe
         E7qST/8Kz4Gbmkkw9524NlPtRqj0C5MVzVL7919MH0aUzQP1knIlePo9rpOvutIP3P5O
         t3IDH92OZ3lL8UCpkTdhlR6UCh2PFYxYHBJWovHKCQpI2KdFXAkRoYoAM0sDqfqXgeQb
         qYpMC9BwzYU5WqJYptTaQPmq1zgXGKi1F92Cf1zGnp8fk5E2ldOKn4T1yJ4TdrO2+Tf0
         4058GJOFvjhzNeYHwCtxpo5YE+uAlr98UdPq0yh09LwtAQqjZmFdsxIddoUQHJokZzUX
         Ii7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEMFdfyRXuQyI23yqiXJPP8RzlrXLgw25jD9vCKh0a5JaQWVpgmI2cRW+q59+1gkEhuE15ar01O6EO8z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8MTYv1LzCzudrXbMCNoNLGtl7FjgdLKj2u6meFe4kC+1dCJsl
	h7z8gii9WFfcowWX0D90OQ26ic93MXmqrodgtRCmz005hGloyDERt2DnboEb2l8F2PttaESbdsq
	WB7hb4wxMY80cBhwX1mS7i431/8Pijf6aPamoKbSgDyeafInrMNQsLf2ND1guyM/ore8=
X-Gm-Gg: AYBFou3zcIE5pTq4BZQGHI8+bh/Aqz1frZjkNA+SAmA4+IwVjMDHyM00Eq4PcwVrJ8d
	klwhFqyZX5Tsxprl+w/RAm9pMvjbz5jixCtyhfVfRK6g4BJg30/qIhy8TyaLxNjwSEEAusCEv+/
	jcfvBz+9M9dC7rg3JVZsYaZlKnbp/8gKlvNgU3Olk7/+2aVHa2+oZuG8ROxgP/w3st8HGPx5FWo
	rAgAILX8n/H3frPhvfNY8C4QTUxO4lALKeBHDxIIurqnmF9TOeWiqKO5ZvTMMuQ3IzKZ5yg7mO6
	hNn4LvzDeVfwbukT6X0oufzoiyU/1S34b76+KVLUxTMYuzdHdxtnvIst/Yj0ju6/yeWxIhJkLww
	ZBorxq1DMuvDgCuikVNPlX0/cvvaTIZWZfayTe4jE0aIesmqNjg==
X-Received: by 2002:a17:90b:5805:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a6ceca1622mr1531884a91.44.1790956643911;
        Fri, 02 Oct 2026 08:57:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5805:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a6ceca1622mr1531876a91.44.1790956643331;
        Fri, 02 Oct 2026 08:57:23 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd0cd76bsm1943615a91.2.2026.10.02.08.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 08:57:22 -0700 (PDT)
Message-ID: <2cc22f12-25c2-4e01-9375-653b39d8b62d@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 09:57:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
 <20260908-lb-v6-1-66755ceb16cc@oss.qualcomm.com>
 <xji3thurj6lnez56opmh5xoxzjiwtlh4o5qd6iqokbqkcb4rxu@mblahsfmtioz>
 <d05a60d1-3787-4318-b28d-9901d7fd7a00@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <d05a60d1-3787-4318-b28d-9901d7fd7a00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6abfd464 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5RwuaTuKtwK3GDd0iDsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: t22f3AIIpZJThYx9XnMSkbpeCZ86rc7O
X-Proofpoint-ORIG-GUID: t22f3AIIpZJThYx9XnMSkbpeCZ86rc7O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MyBTYWx0ZWRfXwsMz/Pc2+2OC
 ThS8izKZOmRggezmj0i5eKYma3QUBpp41WKWNFP3fXbH9mcqGjw3TE6is9lc87KY5dJ6IVOPvUt
 BKQq2jgUya1dPAzI0mtTLfmTjYq7nn0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MyBTYWx0ZWRfX5TcDDsEGJe04
 Wo3unFJ4izW3GM7G1AmqnIQPFZL/y6Kkuu0Qhd2YGL9pIMeXIqvpAODV+S3559z6bJZTPZMscCc
 Aqky6qt/PhslEtlf1YfzzkBlSfJNmX/i4hGLWcyNEPF0IrgHc/dd0CJplUlXHlmpwanmWrZK0Zx
 lDAv88Xc7DVh+O6xVnkKkysBCV0HgR8RiOUHWdOlRUZr4LJ2rtHBEkNH2JXMLx4k0bYPMDeCOS9
 MMHGSb3Y6e6bQJWMo9n8WQ9lDItkJ/TLRBUo3cJbgz5RQl+YUbDlP39HWeC2lsvMMnnDmIpbZFq
 WuXfxepcYoOr7whoh8UIp7taru9BbAoUBBUoo6J+FBTUDpAKtG5abRtw0wxEV6n2bOj/3UXDDBc
 U7Z9dJzw+YdzLC0lMxdQfRvOskuXNMAfVifHA/DbVPZY1NRCBV9R46AeDJdgYFstF2Vb+6es+vc
 edT/a4jjWywO/uCAmnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020063

On 9/29/2026 11:56 PM, Sumit Kumar wrote:
> 
> 
> On 9/26/2026 4:36 PM, Manivannan Sadhasivam wrote:
>> On Tue, Sep 08, 2026 at 02:57:22PM +0530, Sumit Kumar wrote:
>>> The MHI specification defines a LOOPBACK channel. The endpoint firmware
>>> echoes back whatever the host sends on this channel. Without a host-side
>>> driver, there is no way to exercise this channel to validate MHI data 
>>> path
>>> integrity between host and endpoint.
>>>
>>> Add a host-side loopback driver that binds to the LOOPBACK channel and
>>> expose a sysfs interface for data path testing. The sysfs interface 
>>> allows
>>> users to configure TRE buffer size and count, trigger a loopback 
>>> test, and
>>> read the result.
>>>
>>> The new sysfs ABI is documented under Documentation/ABI/testing/, not
>>> stable/, since this is a new interface without established API
>>> guarantees yet. It is unrelated to the existing stable MHI sysfs ABI
>>> documented in Documentation/ABI/stable/sysfs-bus-mhi, despite both
>>> being covered by the same MAINTAINERS entry.
>>>
>>> Co-developed-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> Signed-off-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  40 +++
>>>   MAINTAINERS                                        |   1 +
>>>   drivers/bus/mhi/host/Kconfig                       |   1 +
>>>   drivers/bus/mhi/host/Makefile                      |   1 +
>>>   drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>>>   drivers/bus/mhi/host/clients/Makefile              |   2 +
>>>   drivers/bus/mhi/host/clients/loopback.c            | 287 ++++++++++ 
>>> +++++++++++
>>>   7 files changed, 349 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback 
>>> b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>>> new file mode 100644
>>> index 
>>> 0000000000000000000000000000000000000000..9e47e8443f309199691a50d70adadf84f3237037
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>>> @@ -0,0 +1,40 @@
>>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
>>> +Date:        August 2026
>>> +KernelVersion:    7.4
>>> +Contact:    mhi@lists.linux.dev
>>> +Description:
>>> +        (RW) Size of each Transfer Ring Element (TRE) buffer in bytes
>>> +        used for the loopback test. Valid range is 1 to the value
>>> +        reported by max_tre_size. Default value is 32 bytes.
>>> +
>>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
>>> +Date:        August 2026
>>> +KernelVersion:    7.4
>>> +Contact:    mhi@lists.linux.dev
>>> +Description:
>>> +        (RO) Maximum allowed Transfer Ring Element (TRE) size in bytes.
>>> +        Reading this file returns the upper bound for the tre_size
>>> +        attribute.
>>> +
>>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
>>> +Date:        August 2026
>>> +KernelVersion:    7.4
>>> +Contact:    mhi@lists.linux.dev
>>> +Description:
>>> +        (RW) Number of Transfer Ring Elements (TREs) to use per
>>> +        loopback test. Must be greater than zero and must not exceed
>>> +        the channel ring capacity. Default value is 1.
>> How does the user know 'channel ring capacity'?
> If the user enters a number greater than the ring capacity the error 
> will log the max num_tre value.
> Would you prefer having a new sysfs entry similar to 'max_tre_size'? 
> something like 'max_num_tre'.

Yes, a new sysfs entry sounds like a reasonable idea.  Having the user 
guess, and then try to read an error log which they may or may not have 
sounds like a way to cause frustration in users, particularly for any 
kind of scripted use.

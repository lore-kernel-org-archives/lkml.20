Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65B2370AF5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328992; cv=none; b=Oadzztt/ag/YK+aibkA15aLkSElWOQdhcOz89miQ9OtS12CXlIfq6nYBGiR7dby1m+2BgdqCckssHjD60tynKub5OpaREygvBkqxxRI/is+3R3NoRlyCax8fcmHxcokL6ktkRgdbXqQjt5ncbzGoWvWAQW9oxqPGNnh0/o+Rfok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328992; c=relaxed/simple;
	bh=93Fi2a94/689HquZuBVRzuwfVM4Qj056B2wHbhMKB9c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k/StzeO3xrqoE9Hngl3wGRhKF33J+YRjhynmabDA75/ciZY1dPmKDZ4nT0wy1qX7/sR9mjdO8zF4efqSzCLL0l6piJ8XzOeRe96/sfJPupWqhs/Z0D6wR+MzG6qGvVoJU5WO2ZHmL/xyjr09dCgX56OZPUrUzNmhLR2SVeYAHZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h52AA7W6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWo9pruv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h52AA7W6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWo9pruv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YJEv076850
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 06:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJhf1GDS5idtVPvyzrZu2UCFwC+H8S1K+CUx3Xz6Ymo=; b=h52AA7W67dUb1xZb
	xsncIoidYsMkXd1TkruC+EzS2O9eTYMPZJWnFvM9O7PdTNyxaa+UG75mQZZIvb7d
	XBax+TGIpFL3r4jCQi5mf8qnyCI23nvW2PSyraxrSXdA+q2T/tIiSSNUIAJUlPAV
	zxzCaNcjXpunDter6S2I4m6bUVoVL/o7NbImdeVKCI1oEF505yq71k4xQTnu1R8G
	4X9PAvQPfc8tUyVMI/K8/UMVycZmN/kaT/FpGGusjFpTBenAZRq5uYbQBr9HSAqi
	61XaP3086cwhMQ5A0pH0GXJAIPL/nTYvsGh/Nw/9oQyfup0/XUBGTniIzvhuwoUZ
	xYjRmQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpaw0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:03:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso681672a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788328984; x=1788933784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJhf1GDS5idtVPvyzrZu2UCFwC+H8S1K+CUx3Xz6Ymo=;
        b=WWo9pruvsSNXd9R/Zeun3r2g9wk6ZK9ZhA5i+KVfseEcXZoddh+EAkx1HOOVL6lPV3
         4tw40EnIwQX/dq3/OlicJ3jlNNKjf2FmxwaemzqNC3LC09S9X1hpD6bZ63YX++NkoUAY
         V1osSJ9PG+FfHEnAxC9UVP6cSc9pmh6y6ZCmd3jEoGCG4g537ADJWxOB/207vgE2mK5B
         g/jdNpZr2hyrcnc7VlbGWKKp7m57OlnC533aP0Bm+jXqoPXG5K/NN1SaNdzucrtH8oVf
         LAYt0sncpLXL12NwKaqaqy7qyCXUsp7H3AcrjUtG5Bnj1aeYm3hG1ACCjk+JaMbXApJl
         GRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328984; x=1788933784;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJhf1GDS5idtVPvyzrZu2UCFwC+H8S1K+CUx3Xz6Ymo=;
        b=d6L17OS1Kq9iX7+/dyh7Wq54isW4BiKjH6ySYc/me9QPR/EPGL7Spv5UnRJiZjqkpR
         VCJDIIR2uUf5HsOo6q4qaUmpRZA7FDC+74KEh5p3G5WGiMNn9t2uZsTaP59pJZp4LNRm
         vHq4/3VPXEvN8QgkwuSLCtcheIctuIyKQfjcMlSgZIDrdEPRy12bcUX7bF8AyJ5tdZDf
         OIqdsFNBU7rRI7r+yDqDC4M87B1HeSi/g8tQEH+Rcar21zTrpaHONmJ+li7dQWLS/ZVW
         WNXyWCE75hiyz5vqs9fxS6M9w0NDsFK+kF4v0b/eNH7uw01eKGvwuq0dFcvKElixan/J
         3O7A==
X-Forwarded-Encrypted: i=1; AHgh+Rr/D6+B/xMAYTO3FHkyMFrnoyQ/tUcjo36m1SWpeCuYYf1zbZRTXYX3yNW/w8AEw97vuUnqc5Xcsjk97qI=@vger.kernel.org
X-Gm-Message-State: AFuF++lyOBsTKIJmKxuebC7wL0PwYzc3wheM7wb5ClQDn4Vau7pqHDjA
	yPXed9mthk9ey6BXb5eGrE9yFNpBxAcUKsTJp1c9UJLWt22vw7XRER7mCDSDHLKdUsPuvnnM1fD
	Ya5MIXsTAc5vGJF3n95D9eViI1w6Lt8OFiwDrbFsHAWUt1K/tsZa3wVAnQ1L+Rh0iX+w=
X-Gm-Gg: AR+sD13actR+oRzjzjJllGmT4fqS++d1oaVVCLEh0u4VnZszYi34QX7ci/x5TEGRpDB
	se9k9SFlSJD55sTyKuc3ULaf+Sr/BM7njC4RxBC6iaRnNzJYY3yHiGQVjQo+IomtxeKf/PZ6UL7
	eYYy8TTZrQeriuat/6yhD/o/I1af3fBUIVA8o6qQmIpHfwyExpbWJJzSELxJL2lGnDIvuI5C6WP
	T6Wyt3SEJfwtOf52eMkSobzYfDuasHeyCB2jz/Brafn2amrI8vbBn+YFInFZIaWl+xf01/LZWBd
	00Bohc5eBAgJ8lrLsVypUMn2Y8SzHhcjQ9vXq7JHpTscVMKFSVc81uAc2ng7YcTNfQ6FMkDiDo7
	2JFYS67tgKC+9xcPJEuviqPyA5mImQikMT8Uy5sHfBvuXJk80cCrutjSlCVlM1ZBweM+ec5RS
X-Received: by 2002:a05:6a21:3944:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3d9ad2681c9mr4462780637.6.1788328983418;
        Tue, 01 Sep 2026 23:03:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:3944:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3d9ad2681c9mr4462607637.6.1788328982653;
        Tue, 01 Sep 2026 23:03:02 -0700 (PDT)
Received: from [10.133.33.218] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d006c7bsm523420a12.21.2026.09.01.23.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:03:02 -0700 (PDT)
Message-ID: <717eb49d-3565-413b-94ae-0b88eb77d9e8@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:01:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/7] Provide support for Trigger Generation Unit
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songchai@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <77859de2-62b9-4575-ba6e-3ee6bd73125c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77859de2-62b9-4575-ba6e-3ee6bd73125c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97bc18 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=5eLzQ0bWK4boSlSgYO8A:9 a=MVWzkhXIBweMGwdD:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sK1fDOeyuYFlbb2sBeZvSa-jNDQwL_R-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX2ut9woXOiup+
 XomxR2VzNJJmJClYhP1RArVrFdSXQVmdAqDM/s9sb49az0ZpR5JvA9OXfG3eDR0pW6LUAj1nEzZ
 5vHeW5tuC5m2UJzfWndZMOGTp7/7d5E=
X-Proofpoint-ORIG-GUID: sK1fDOeyuYFlbb2sBeZvSa-jNDQwL_R-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX0g7ojHeJHv5g
 Qkd5YwN0w+axShVI9f/ofcg5skrTPoxijW2F2roraVTr2LBLCDhJ299JY/1MJmDLaD7TV7Ljqi4
 rK2985TghUQoInEEk+X80YW4F510CURMA9qkGaOV1qX6rch0rN1UbbFACQHv7GgMykx5zqirklX
 DqRuBqwJLnZjnAt8evs2FxRkyL4RDPH+kslAIMjtzUnCRxgnvvPt7PDL3iE/Zq89jSgwVaMDCWC
 mhzLvxcPGhbXxEwfgnjinJSDihHmV9OnYCyEQt4mnpp5zwKOqTcv3wj3MzK23YCj+NQHmPQ7qMN
 RZwn29f65nre8mOgyfxR6Ez5KxjReEwc2k4Od5t+3Tzwy+6uweFc4l6KQLsUeHXGewjXuo10ULI
 qHAKUcZ44ylC5+hD3tV79KISQFCk6o9sY5QdRMUou4I3GRYAvxVedYyGz9NcI4bXfELVvs9q/sm
 ltoXYWuT+P2iU+zmfNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020051

Gentle ping.

Any feedback on this patch series would be appreciated.


Best regards,

Songwei

On 8/6/2026 1:30 PM, Songwei.Chai wrote:
> Hi Suzuki,
>
> Hope you're doing well.
>
> First of all, thank you again for agreeing to take the Qualcomm TGU 
> driver through the CoreSight tree. We really appreciate your 
> willingness to support this submission path.
>
> We understand that, as a maintainer, you are naturally cautious about 
> any code that goes through the CoreSight tree, especially when it 
> involves introducing a new driver. That's completely reasonable, and 
> we appreciate the level of scrutiny you apply to code entering the 
> subsystem.
>
> Since the initial submission, the TGU driver has gone through several 
> rounds of review and refinement. In addition to multiple rounds of 
> human review, it has also been reviewed by Sashiko. For the issues 
> identified as false positives by Sashiko, I've provided clarifications 
> in the corresponding discussions. Each review cycle has helped improve 
> the overall code quality and robustness of the driver. Hopefully this 
> helps address some of the concerns around introducing new code into 
> the tree.
>
> As some background, TGU is a new Qualcomm debug and tracing hardware 
> block designed to improve developers' debugging efficiency and 
> flexibility. We would very much like developers to be able to use this 
> hardware directly with upstream Linux rather than relying on 
> downstream patches or additional integration work.
>
> When you have some time, would you mind taking another look at the 
> series and sharing any remaining concerns or review feedback? We'd be 
> happy to address any issues that would help move the submission forward.
>
> Thank you for your time and continued support.
>
> Best regards,
>
> Songwei
>
> On 7/30/2026 4:06 PM, Songwei Chai wrote:
>> From: Songwei Chai <songchai@qti.qualcomm.com>
>>
>> We propose creating a new qcom directory under drivers/hwtracing
>> to host this TGU driver, as well as additional Qualcomm-specific
>> hwtracing drivers that we plan to submit in the coming months.
>> This structure will help organize vendor-specific implementations
>> and facilitate future development and maintenance.
>>
>> Feedback from the community on this proposal is highly appreciated.
>>
>> - Why we are proposing this:
>>
>> TGU has the ability to monitor signal conditions and trigger 
>> debug-related
>> actions, serving as a programmable hardware component that enhances 
>> system
>> trace and debug capabilities. Placing it under drivers/hwtracing aligns
>> with its function as a trace generation utility.
>>
>> We previously attempted to push this driver to 
>> drivers/hwtracing/coresight,
>> but did not receive support from the maintainers of the CoreSight
>> subsystem. The reason provided was: “This component is primarily a part
>> of the Qualcomm proprietary QPMDA subsystem, and is capable of operating
>> independently from the CoreSight hardware trace generation system.”
>>
>> Chat history : 
>> https://lore.kernel.org/all/CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/
>>
>> Given this, we have been considering whether it would be appropriate
>> to create a dedicated drivers/hwtracing/qcom directory for
>> Qualcomm-related hwtracing drivers. This would follow the precedent set
>> by Intel, which maintains its own directory at 
>> drivers/hwtracing/intel_th.
>> We believe this structure would significantly facilitate
>> future submissions of related Qualcomm drivers.
>>
>> - Maintenance of drivers/hwtracing/qcom:
>>
>> Bjorn, who maintains linux-arm-msm, will be the maintainer of this
>> directory — we’ve discussed this with him and he’s aware that his task
>> list may grow accordingly. Additionally, Qualcomm engineers familiar 
>> with
>> the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei Chai],
>> will be available to review incoming patches and support ongoing
>> development.
>>
>> - Detail for TGU:
>>
>> This component can be utilized to sense a plurality of signals and
>> create a trigger into the CTI or generate interrupts to processors
>> once the input signal meets the conditions. We can treat the TGU’s
>> workflow as a flowsheet, it has some “steps” regions for customization.
>> In each step region, we can set the signals that we want with priority
>> in priority_group, set the conditions in each step via condition_decode,
>> and set the resultant action by condition_select. Meanwhile,
>> some TGUs (not all) also provide timer/counter functionality.
>> Based on the characteristics described above, we consider the TGU as a
>> helper in the CoreSight subsystem. Its master device is the TPDM, which
>> can transmit signals from other subsystems, and we reuse the existing
>> ports mechanism to link the TPDM to the connected TGU.
>>
>> Here is a detailed example to explain how to use the TGU:
>>
>> In this example, the TGU is configured to use 2 conditions, 2 steps, and
>> the timer. The goal is to look for one of two patterns which are 
>> generated
>> from TPDM, giving priority to one, and then generate a trigger once the
>> timer reaches a certain value. In other words, two conditions are used
>> for the first step to look for the two patterns, where the one with the
>> highest priority is used in the first condition. Then, in the second 
>> step,
>> the timer is enabled and set to be compared to the given value at each
>> clock cycle. These steps are better shown below.
>>                     |-----------------|
>>                |                 |
>>                |       TPDM      |
>>                |                 |
>>                |-----------------|
>>                         |
>>                         |
>>      --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
>> ------
>>      | |                                                 |
>>      |                  | |--------------------| |
>>      |    |---- --->    |                          |  Go to next 
>> steps  | |
>>      |    |             |                |--- ---> |  Enable 
>> timer      | |
>>      |    |             v                | |                    | |
>>      |    |    |-----------------|       | |--------------------| |
>>      |    |    |                 |  Yes  | |           |
>>      |    |    |   inputs==0xB   | ----->| | <-------- |
>>      |    |    |                 |       | |      No | |
>>      | No |    |-----------------|       | v         | |
>>      |    |             |                | |-----------------| | |
>>      |    |             |                | |                 | | |
>>      |    |             |                |          | timer>=3   |-- |
>>      |    |             v                | |                 |   |
>>      |    |    |-----------------|       | |-----------------|   |
>>      |    |    |                 |  Yes  | |           |
>>      |    |--- |   inputs==0xA   | ----->| | Yes       |
>>      |         |                 | |           |
>>      |         |-----------------| v           |
>>      | |-----------------|   |
>>      | |                 |   |
>>      |                                              | Trigger    |   |
>>      | |                 |   |
>>      | |-----------------|   |
>>      |  TGU |           |
>>      |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- 
>> --- -- |
>>                                                               |
>>                                                               v
>> |-----------------|
>>                                                      |The controllers  |
>>                                                      |which will use   |
>>                                                      |triggers further |
>> |-----------------|
>>
>> steps:
>>      1. Reset TGU /*it will disable tgu and reset dataset*/
>>      - echo 1 > /sys/bus/amba/devices/<tgu-name>/reset_tgu
>>
>>      2. Set the pattern match for priority0 to 0xA = 0b1010 and for
>>         priority 1 to 0xB = 0b1011.
>>      - echo 0x11113232 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_priority0/reg0
>>      - echo 0x11113233 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_priority1/reg0
>>
>>      Note:
>>          Bit distribution diagram for each priority register
>> |-------------------------------------------------------------------|
>>      |   Bits          |       Field Nam   | Description              |
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      |                 |                   | 00 = bypass for OR 
>> output   |
>>      |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND 
>> output  |
>>      |                 |                   | 10 = sense input '0' is 
>> true|
>>      |                 |                   | 11 = sense input '1' is 
>> true|
>> |-------------------------------------------------------------------|
>>      These bits are used to identify the signals we want to sense, with
>>      a maximum signal number of 140. For example, to sense the signal
>>      0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
>>      represents 1010. The remaining bits are set to 1, as we want to use
>>      AND gate to summarize all the signals we want to sense here. For
>>      rising or falling edge detection of any input to the priority, set
>>      the remaining bits to 0 to use an OR gate.
>>
>>      3. look for the pattern for priority_i i=0,1.
>>      - echo 0x3 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg0
>>      - echo 0x30 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg1
>>
>> |-------------------------------------------------------------------------------|
>>      |   Bits          |    Field Nam        | 
>> Description                |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |For each decoded 
>> condition, this       |
>>      |      24         |       NOT           |inverts the output. If 
>> the condition   |
>>      |                 |                     |decodes to true, and 
>> the NOT field     |
>>      |                 |                     |is '1', then the output 
>> is NOT true.   |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |      21         |  BC0_COMP_ACTIVE    |comparator will be 
>> actively included in|
>>      |                 |                     |the decoding of this 
>> particular        |
>>      |                 | |condition.                             |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      20         |   BC0_COMP_HIGH     |the decoding of this 
>> condition.        |
>>      |                 |                     |Conversely, a '0' here 
>> requires a '0'  |
>>      |                 |                     |from the 
>> comparator                    |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |      17         |                     |comparator will be 
>> actively included in|
>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this 
>> particular        |
>>      |                 | |condition.                             |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      16         |  TC0_COMP_HIGH      |the decoding of this 
>> particular        |
>>      |                 | |condition.Conversely, a 0 here         |
>>      |                 |                     |requires a '0' from the 
>> comparator     |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from Priority_n    |
>>      |                 |                     |OR logic will be 
>> actively              |
>>      |     4n+3        | Priority_n_OR_ACTIVE|included in the 
>> decoding of            |
>>      |                 |    (n=0,1,2,3)      |this particular 
>> condition.             |
>>      |                 | |                                       |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from Priority_n    |
>>      |                 |                     |will need to be '1' to 
>> affect the      |
>>      |     4n+2        |  Priority_n_OR_HIGH |decoding of this 
>> particular            |
>>      |                 |    (n=0,1,2,3)      |condition. Conversely, 
>> a '0' here      |
>>      |                 |                     |requires a '0' from 
>> Priority_n OR logic|
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from Priority_n    |
>>      |                 |                     |AND logic will be 
>> actively             |
>>      |     4n+1        |Priority_n_AND_ACTIVE|included in the 
>> decoding of this       |
>>      |                 |  (n=0,1,2,3)        |particular 
>> condition.                  |
>>      |                 | |                                       |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from Priority_n    |
>>      |                 |                     |AND logic will need to 
>> be '1' to       |
>>      |      4n         | Priority_n_AND_HIGH |affect the decoding of 
>> this            |
>>      |                 |   (n=0,1,2,3)       |particular condition. 
>> Conversely,      |
>>      |                 |                     |a '0' here requires a 
>> '0' from         |
>>      |                 |                     |Priority_n AND 
>> logic.                  |
>> |-------------------------------------------------------------------------------|
>>      Since we use `priority_0` and `priority_1` with an AND output in 
>> step 2, we set `0x3`
>>      and `0x30` here to activate them.
>>
>>      4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
>>         are met then the next step will be step 1 and the timer will 
>> be enabled.
>>      - echo 0x20008 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg0
>>      - echo 0x20008 > 
>> /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg1
>>
>> |-----------------------------------------------------------------------------|
>>      |   Bits          |       Field Nam   | 
>> Description                |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This field defines the 
>> next step the   |
>>      |    18:17        |     NEXT_STEP     |TGU will 'goto' for the 
>> associated     |
>>      |                 |                   |Condition and 
>> Step.                    |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |For each possible output 
>> trigger       |
>>      |    13           |     TRIGGER       |available, set a '1' if 
>> you want       |
>>      |                 |                   |the trigger to go active 
>> for the       |
>>      |                 |                   |associated condition and 
>> Step.         |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause BC0 to 
>> increment if the|
>>      |    9            |     BC0_INC       |associated Condition is 
>> decoded for    |
>>      |                 |                   |this 
>> step.                             |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause BC0 to 
>> decrement if the|
>>      |    8            |     BC0_DEC       |associated Condition is 
>> decoded for    |
>>      |                 |                   |this 
>> step.                             |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will clear BC0 count 
>> value to 0 if|
>>      |    7            |     BC0_CLEAR     |the associated Condition 
>> is decoded    |
>>      |                 |                   |for this 
>> step.                         |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause TC0 to 
>> increment until |
>>      |    3            |     TC0_ENABLE    |paused or cleared if the 
>> associated    |
>>      |                 |                   |Condition is decoded for 
>> this step.    |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will cause TC0 to 
>> pause until     |
>>      |    2            |     TC0_PAUSE     |enabled if the associated 
>> Condition    |
>>      |                 |                   |is decoded for this 
>> step.              |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will clear TC0 count 
>> value to 0   |
>>      |    1            |     TC0_CLEAR     |if the associated 
>> Condition is         |
>>      |                 |                   |decoded for this 
>> step.                 |
>> |-----------------------------------------------------------------------------|
>>      |                 |                   |This will set the done 
>> signal to the   |
>>      |    0            |     DONE          |TGU FSM if the associated 
>> Condition    |
>>      |                 |                   |is decoded for this 
>> step.              |
>> |-----------------------------------------------------------------------------|
>>      Based on the distribution diagram, we set `0x20008` for 
>> `priority0` and `priority1` to
>>      achieve "jump to step 1 and enable TC0" once the signal is sensed.
>>
>>      5. activate the timer comparison for this step.
>>      -  echo 0x30000  > 
>> /sys/bus/amba/devices/<tgu-name>/step1_condition_decode/reg0
>>
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |      17         |                     |comparator will be 
>> actively included in|
>>      |                 |  TC0_COMP_ACTIVE    |the decoding of this 
>> particular        |
>>      |                 | |condition.                             |
>> |-------------------------------------------------------------------------------|
>>      |                 |                     |When '1' the output 
>> from the associated|
>>      |                 |                     |comparator will need to 
>> be 1 to affect |
>>      |      16         |  TC0_COMP_HIGH      |the decoding of this 
>> particular        |
>>      |                 | |condition.Conversely, a 0 here         |
>>      |                 |                     |requires a '0' from the 
>> comparator     |
>> |-------------------------------------------------------------------------------|
>>      Accroding to the decode distribution diagram , we give 0x30000 
>> here to set 16th&17th bit
>>      to enable timer comparison.
>>
>>      6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 
>> once the timer
>>         has reached the given value.
>>      - echo 0x6 > 
>> /sys/bus/amba/devices/<tgu-name>/step1_condition_select/reg0
>>
>>      7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>>         i.e. when the timer reaches 3.
>>      - echo 0x2000 > 
>> /sys/bus/amba/devices/<tgu-name>/step1_condition_select/default
>>
>>      Note:
>>          1. 'default' register allows for establishing the resultant 
>> action for
>>          the default condition
>>
>>          2. Trigger:For each possible output trigger available from
>>          the Design document, there are three triggers: interrupts, CTI,
>>          and Cross-TGU mapping.All three triggers can occur, but
>>          the choice of which trigger to use depends on the user's
>>          needs.
>>
>>      8. Compare the timer to 3 in step 1.
>>      - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step1_timer/reg0
>>
>>      9. enale tgu
>>      - echo 1 > /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> ---
>> Link to V15: 
>> https://lore.kernel.org/all/20260701055529.445819-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V16:
>> - Fixed enable/disable race and PM refcount handling.
>> - Fixed sysfs exposure before driver initialization.
>> - Fixed priority allocation and access races.
>> - Fixed uninitialized return value in condition decode.
>> - Fixed sysfs attribute naming collision issues.
>> - Added ABI documentation for the default node.
>> ---
>> Link to V14: 
>> https://lore.kernel.org/all/20260417073336.2712426-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V15:
>> - Add a maintainer for "drivers/hwtracing/qcom" in MAINTAINERS
>> ---
>> Link to V13: 
>> https://lore.kernel.org/all/20260402092838.341295-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V14:
>> - Fix some typos and formatting.
>> ---
>> Link to V12: 
>> https://lore.kernel.org/all/20260317032639.2393221-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V13:
>> - add ":" after "KernelVersion"
>> - add an enablement check in the enable function to avoid increasing 
>> the counter each time
>> ---
>> Link to V11: 
>> https://lore.kernel.org/all/ee1ca8e6-8e5f-47d8-8a24-f904ee2fc6d0@oss.qualcomm.com/
>>
>> Changes in V12:
>> - Remove the in-ports property from the bindings, as this device is 
>> decoupled from CoreSight.
>> - Update kernel version and date.
>> ---
>> Link to V10: 
>> https://lore.kernel.org/all/20c5406d-3e9f-4fdb-84ba-4cbe629c79b5@oss.qualcomm.com/
>>
>> Changes in V11:
>> - Change the names of members in drvdata: max_xxx -> num_xxx, enable 
>> -> enabled
>> - Use "FIELD_GET" to replace "BMVAL"
>> - Use devm_kcalloc to replace devm_kzalloc once create members of 
>> value_table
>> - Keep a consistent \n above return
>> - Keep reverse-Christmas-tree style
>> - Add checks so that the enable and reset nodes only accept 0 or 1
>> ---
>> Link to V9: 
>> https://lore.kernel.org/all/20251219065902.2296896-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V10:
>> - Modified code formatting based on Jie's feedback to improve 
>> readability.
>> - Applied inverse Christmas tree order to the variables.
>> ---
>> Link to V8: 
>> https://lore.kernel.org/all/20251203090055.2432719-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V9:
>> - Decoupled the tgu driver from coresight header file and registered 
>> it as an amba device.
>> - Retained Rob's reviewed-by tag on patch1/7 since the file remains 
>> unchanged.
>> - Updated the sysfs node path in the Documentation directory.
>> ---
>> Link to V7: 
>> https://lore.kernel.org/all/20251104064043.88972-1-songwei.chai@oss.qualcomm.com/
>>
>> Changes in V8:
>> - Add "select" section in bindings.
>> - Update publish date in "sysfs-bus-coresight-devices-tgu".
>> ---
>> Link to V6: 
>> https://lore.kernel.org/all/20250709104114.22240-1-songchai@qti.qualcomm.com/
>>
>> Changes in V7:
>> - Move the TGU code location from 'drivers/hwtracing/coresight/' to 
>> 'drivers/hwtracing/qcom/'.
>> - Rename the spinlock used in the code from 'spinlock' to 'lock'.
>> - Perform the 'calculate_array_location' separately, instead of doing 
>> it within the function.
>> - Update the sender email address.
>> ---
>> Link to V5: 
>> https://lore.kernel.org/all/20250529081949.26493-1-quic_songchai@quicinc.com/
>>
>> Changes in V6:
>> - Replace spinlock with guard(spinlock) in tgu_enable.
>> - Remove redundant blank line.
>> - Update publish date and contact member's name in 
>> "sysfs-bus-coresight-devices-tgu".
>> ---
>> Link to V4: 
>> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250423101054.954066-1-quic_songchai@quicinc.com/
>>
>> Changes in V5:
>> - Update publish date and kernel_version in 
>> "sysfs-bus-coresight-devices-tgu"
>> ---
>> Link to V3: 
>> https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/
>>
>> Changes in V4:
>> - Add changlog in coverletter.
>> - Correct 'year' in Copyright in patch1.
>> - Correct port mechansim description in patch1.
>> - Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' 
>> from dt-binding
>> and set them through reading DEVID register as per Mike's suggestion.
>> - Modify tgu_disable func to make it have single return point in 
>> patch2 as per
>> Mike's suggestion.
>> - Use sysfs_emit in enable_tgu_show func in ptach2.
>> - Remove redundant judgement in enable_tgu_store in patch2.
>> - Correct typo in description in patch3.
>> - Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in 
>> pacth3 as
>> per Mike's suggestion.
>> - Remove tgu_dataset_ro definition in patch3
>> - Use #define constants with explanations of what they are rather than
>> arbitrary magic numbers in patch3 and patch4.
>> - Check -EINVAL before using 'calculate_array_location()' in array in 
>> patch4.
>> - Add 'default' in 'tgu_dataset_show''s switch part in patch4.
>> - Document the value needed to initiate the reset in pacth7.
>> - Check "value" in 'reset_tgu_store' and bail out with an error code 
>> if 0 in patch7.
>> - Remove dev_dbg in 'reset_tgu_store' in patch7.
>> ---
>> Link to V2: 
>> https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/
>>
>> Changes in V3:
>> - Correct typo and format in dt-binding in patch1
>> - Rebase to the latest kernel version
>> ---
>> Link to V1: 
>> https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/
>>
>> Changes in V2:
>>   - Use real name instead of login name,
>>   - Correct typo and format in dt-binding and code.
>>   - Bring order in tgu_prob(declarations with and without 
>> assignments) as per
>> Krzysztof's suggestion.
>>   - Add module device table in patch2.
>>   - Set const for tgu_common_grp and tgu_ids in patch2.
>>   - Initialize 'data' in tgu_ids to fix the warning in pacth2.
>> ---
>>
>> Songwei Chai (7):
>>    dt-bindings: arm: Add support for Qualcomm TGU trace
>>    qcom-tgu: Add TGU driver
>>    qcom-tgu: Add signal priority support
>>    qcom-tgu: Add TGU decode support
>>    qcom-tgu: Add support to configure next action
>>    qcom-tgu: Add timer/counter functionality for TGU
>>    qcom-tgu: Add reset node to initialize
>>
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |  60 ++
>>   .../devicetree/bindings/arm/qcom,tgu.yaml     |  71 ++
>>   MAINTAINERS                                   |  11 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  20 +
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 782 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  | 318 +++++++
>>   9 files changed, 1268 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>

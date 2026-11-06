Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933960;
	b=FuePjQZPyepvUC7oYlF4A6wnCW2ahnIqpEw4TQqSM5DF1e9SNgKECKwicEzxrCRnLcfC
	 ecqqjZ4X7rvyxEmzbAdIjNnF1xWV5+6jkD2imDxXpg27c9OGkbujUi7/Qkh/Ftuo1NWC1
	 UTDsM+xT+yEMbrsEVo+8JfPZXopiAZKb0mHGiAwZ2ScSKh29bIUDXmLYHfy3P2BSYhfvN
	 7092m6mNuakf8qG55ZqRXRrbyTRu+RNRIVUj+3ulhXC7iu031sLsZPEVRP6NJhNeptQCx
	 i6fr5ml05Sni2EO9CFmhDgYfbr0tb2UZH9CtcTOlboHjwnW4hzW00/WFOwWoTr6QR1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=;
	b=IIKTtbM6in5sgcBVkTYlOKYGvZUCCcW8Zv2qzyMAulR81vKhqizuNZJSvDfs4WnEVP1p
	 Wojnz215y3hQD1Sv4VUsq+sBWJ7WcYuNgxyNreYgzIeR7YKlL0MTbygPiSI38CV8nnS1f
	 SClH2byElGDvXJtypL95vMetCnwVwIJy97Wl7+8Rrr7nPTYrUMy+dIHvm0FbeX40rEO68
	 /VkPTvVps9dCOurbf++fE91fzNGQLH6SGheCxp49WTF93diZscD05mwWC/vG/j1+BE1Qb
	 U0gki20J26OYJwOI1mPluw/IN3DSu1pXPNKbBK2AdjYpwA/n1caCLJGFIkEyyuo9IfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hCt+KT9s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDMBGmMC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC4606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80CC4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hCt+KT9s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDMBGmMC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NerdC2880934
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 02:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=; b=hCt+KT9szoPmBrXO
	7aWKsIr4E9ufS5X3KSJur9ekTkisEdoQLibRYufbcsQCL9ghPzS3V6edaZ2duuGq
	ztNGm6Lc+R8Or5CbeKhOn4aEXR7+Wl42n5T7Kjdbt3Oh8vRGVSpwRgVoedlnE5nN
	+APFXvvhdkLj5d95/kAfOk6RiE1T8oCMiXmrUuTchYt0tIANceC4HMemmsDnTfTT
	gzYLwkHzMK66EkAVCRNlndK9DsSKnnCW13VO30q9VEj81giWCvGdi3U3FA2D6lNE
	bR+2k20mnK/3UsSHyBgnyPJ5JJaW2JphZzI8hwFQQT4seRTJw78c+GgQeN1ao7bt
	g3dxVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3parm1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:59:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so216280a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793933957; x=1794538757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=;
        b=iDMBGmMCGtNYPgPHSai1PLqHk1hBk80YNKlPZ5gWOFWFL4N+G/aO8qQPdMn/tumnw6
         unRFTJs+1C93W4ewH0m+yzvNTZb6EXEaBlGtO2dC+seGsT17Vyavq9dAsmM4jS4PDjfT
         QW3jOrjsGTZgEO3FdbpaNcBCtHCkgOPERxtC6SPnqDwjJ/2LLXFsRGBfnFpQ2foptd4p
         zn9K5l3C+Uu4n4CMrb/ceGjb9NwCuLUYIbkDqqLpvRSreQaYI/Fw5CwnJtCxBSEMvuoD
         YTKPFsEleap6d6BzWQpWGTy9M9B+g644g9l1LrFNmjdOh0zPNUMuqr8qwmGCJk8BefBw
         aw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793933957; x=1794538757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=;
        b=e6pQ9ijnxVq3/VrOx45lZTqf5ce+NmfZOXDZ9HGEtwLupXIcBPNVdHrlP7Nuo5sRyB
         52X5aKUCpxFu9PE3Huryr+dixF6EpeaDCGNs+6HtBLwzRb1UBbBzR4tjE8ANoEeAhuZO
         I43UQXUv4/uEiwMbMTADSK6V0scc3n8JKphqUJkkTo6wyqPfGkpa7VHYIXygZogtTWUR
         SPMNzyBpGSlEbNdFwKCI8bunL4aw48t2KgFx+ajdrLxxjbJeDz3pCmb2T0K22RZxKE49
         4pXx91bMdjdiagkp77S9y+LCkdKHc4y9E6kLnhK+sIlbm+wKm7gOumMAm1elUrGKL/xc
         Dq9A==
X-Gm-Message-State: APuU4Z+4+m6eTNJoK52UFvYzUABM3o5YfA6++WASnlrM5x6k9VCFzzSJ
	H3al6uechW02DAxXfB4uNjRb/b95ks2dbyAPmeF452+Uig3/BrNG8yGvV4jBfJi+kms78MsZaWU
	982XsgIBeGt11m/CIpazL1SWFxoSSpXrpJ0Nzb//sNwGdvaS6MjrPdE3OJfgL0dQP5cs=
X-Gm-Gg: AYBFou3LNqHtTMQA6UpuwGe8WgtM5XTTPTx0GDCd6/6s+tUfAB91EB0rWZPZsYOyVr/
	g///FayhfalhYPlb9NINqRPRqrXzUdRAoDXJEXQhLcKLcHEz8Sd3Kx44WlE4BkrHAD+yqaC7hgc
	G47E0rMCq4bsiyvfgga/ST0Rzy4XGkXDO92ZC0/RL6g8irlNvdU+YT/EZN6YcqWSY+xGqRNoxTY
	T/bs+l+QhWgobn0QSDSZn+FHasZSX23AXrpMEWT6flhwOJnHTO4PXgDt5Jlx+4NDQcyt083+emk
	n7O4vPoHqZXX0ySzTQmxppSPwy/jqXi4/yClp9R1xa+KpCGEpBoSqcj2r9yswBGb3IXOoWWHhmY
	gI3g2JNjb5wPjQwZsciYNMX63B6IexhOlMGBIeTbFpeGkLOPlobdjsEpK5ceKSzV6jZZaetGYYr
	SqmoRZab5qwWsIV3nW6cZn7lQYLbpTZqpLNtQnR3z/eYg=
X-Received: by 2002:a17:90b:4486:b0:3b0:9deb:d994 with SMTP id 98e67ed59e1d1-3b0db7251bamr994552a91.64.1793933957081;
        Thu, 05 Nov 2026 18:59:17 -0800 (PST)
X-Received: by 2002:a17:90b:4486:b0:3b0:9deb:d994 with SMTP id 98e67ed59e1d1-3b0db7251bamr994515a91.64.1793933956541;
        Thu, 05 Nov 2026 18:59:16 -0800 (PST)
Received: from [10.133.33.115] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b72d5asm4603741a91.4.2026.11.05.18.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:59:16 -0800 (PST)
Message-ID: <6cab89dc-04f0-4d54-a935-eee2254b054c@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:59:11 +0800
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
Subject: Re: [PATCH v16 2/7] qcom-tgu: Add TGU driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-3-songwei.chai@oss.qualcomm.com>
 <55e1da04-1e8b-4783-a4db-0f154d8ec10e@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <55e1da04-1e8b-4783-a4db-0f154d8ec10e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX+rHFW9NSC6C3
 fKjSHs8oBF9mpwMN8L78za3Rpo4rIQQrEdXk++9N9Oe0g5sAOFIwa0Nh9UCe0rWYawraHWZrNxa
 2Tj4QcuAlIbnR9GWSvMhRcQDF7nMaPsSoH4qd/sb+nBOu9phgbFT6PmyTnIa9kxaGB9BlihiPsn
 i5asxFlLtuXFdrsra463SJLcrxAPj5vAsrCARjGK6D3VVjQovbq1mwusetludusj/JDJa/x05AU
 ZIkdrhnnWxuZsUeGMC++zaRpzgeI8/ZYwCfAGohakK9OZ+/MeYl5wFzWgV3OnQRA22MpG+yoO5n
 n5Ro0NucKFoTz2K6VZTnmmgLHeAxhYCB3ed2f4kaHJp9LCav3ZNu+rBVc2T6PdTfdt1Y3Kq4w/a
 8/OxS3GqiWxiipBT/hRXW+b7FJFgHVyvdvVtRGlsL+WI7zyR39DbpbfPnjxpx8ZnldMwlO0QbVC
 fMvAFq917aTkCYfpxKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX//xed07aPlis
 pYHY+uoLKJKF6g3MTJ3B741gCdqJ5nE1wXAT+ngyfEOkWuIx9BcFF6fhzhypqPd4niLYyQ9bkeU
 kATfS1yP1DaoJPAph9GUW7Sd9OJOTiU=
X-Proofpoint-GUID: 20ZHBT1tZUTetOmwpDspKn2nXgJZ94Nz
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed4286 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=p-U3weD7bCxB8QOMAjgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 20ZHBT1tZUTetOmwpDspKn2nXgJZ94Nz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060011


On 11/5/2026 8:32 PM, Suzuki K Poulose wrote:
> On 30/07/2026 09:06, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   MAINTAINERS                                   |  11 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 192 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>>   8 files changed, 289 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..36ab64f1e301
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ce5c5185c773..4789321cca6d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22360,6 +22360,17 @@ S:    Maintained
>>   F:    Documentation/tee/qtee.rst
>>   F:    drivers/tee/qcomtee/
>>   +QUALCOMM HARDWARETRACING DRIVER
>> +M:    Songwei Chai <songwei.chai@oss.qualcomm.com>
>> +M:    Jie Gan <jie.gan@oss.qualcomm.com>
>> +M:    Suzuki K Poulose <suzuki.poulose@arm.com>
>> +L:    linux-arm-msm@vger.kernel.org
>> +S:    Maintained
>> +T:    git 
>> git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
>> +F:    Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +F:    Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> +F:    drivers/hwtracing/qcom/
>> +
>>   QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>>   M:    Bartosz Golaszewski <brgl@kernel.org>
>>   L:    linux-arm-msm@vger.kernel.org
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index 0841ea851847..6a2cbe5b340f 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-y                += hwtracing/qcom/
>>   obj-$(CONFIG_STM)        += hwtracing/stm/
>>   obj-$(CONFIG_HISI_PTT)        += hwtracing/ptt/
>>   obj-y                += android/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 911ee977103c..8a640218eed8 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>>     source "drivers/hwtracing/ptt/Kconfig"
>>   +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig 
>> b/drivers/hwtracing/qcom/Kconfig
>> new file mode 100644
>> index 000000000000..5c94c75ffa39
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Kconfig
>> @@ -0,0 +1,20 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# QCOM specific hwtracing drivers
>> +#
>> +menu "Qualcomm specific hwtracing drivers"
>> +
>> +config QCOM_TGU
>> +    tristate "QCOM Trigger Generation Unit driver"
>> +    depends on ARCH_QCOM || COMPILE_TEST
>> +    depends on ARM_AMBA
>> +    help
>> +      This driver provides support for Trigger Generation Unit that is
>> +      used to detect patterns or sequences on a given set of signals.
>> +      TGU is used to monitor a particular bus within a given region to
>> +      detect illegal transaction sequences or slave responses. It is 
>> also
>> +      used to monitor a data stream to detect protocol violations 
>> and to
>> +      provide a trigger point for centering data around a specific 
>> event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile 
>> b/drivers/hwtracing/qcom/Makefile
>> new file mode 100644
>> index 000000000000..5a0a868c1ea0
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_QCOM_TGU) += tgu.o
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> new file mode 100644
>> index 000000000000..9c7dd4a09f02
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,192 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "tgu.h"
>> +
>> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    /* Enable TGU to program the triggers */
>> +    writel(1, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +}
>> +
>> +static void tgu_enable(struct tgu_drvdata *drvdata)
>> +{
>> +    tgu_write_all_hw_regs(drvdata);
>> +    drvdata->enabled = true;
>> +}
>> +
>> +static void tgu_disable(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    writel(0, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +
>> +    drvdata->enabled = false;
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    bool enabled;
>> +
>> +    scoped_guard(mutex, &drvdata->lock)
>> +        enabled = drvdata->enabled;
>> +
>> +    return sysfs_emit(buf, "%d\n", enabled);
>> +}
>> +
>> +/* enable_tgu_store - Enable or disable the Trigger Generation Unit 
>> (TGU). */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    unsigned long val;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret || val > 1)
>> +        return -EINVAL;
>> +
>> +    /*
>> +     * Hold the mutex across the whole check-and-act sequence: the 
>> check of
>> +     * drvdata->enabled, the PM runtime reference counting and the 
>> state
>> +     * update must be atomic, otherwise concurrent writers could each
>> +     * imbalance the PM runtime usage counter.
>> +     */
>> +    guard(mutex)(&drvdata->lock);
>> +
>> +    if (val) {
>> +        if (drvdata->enabled)
>> +            return -EBUSY;
>> +
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret)
>> +            return ret;
>> +
>> +        tgu_enable(drvdata);
>> +    } else {
>> +        if (!drvdata->enabled)
>> +            return -EINVAL;
>> +
>> +        tgu_disable(drvdata);
>> +        pm_runtime_put(dev);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>> +
>> +static struct attribute *tgu_common_attrs[] = {
>> +    &dev_attr_enable_tgu.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group tgu_common_grp = {
>> +    .attrs = tgu_common_attrs,
>> +};
>> +
>> +static const struct attribute_group *tgu_attr_groups[] = {
>> +    &tgu_common_grp,
>> +    NULL,
>> +};
>> +
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id 
>> *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata;
>> +    int ret;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (IS_ERR(drvdata->base))
>> +        return PTR_ERR(drvdata->base);
>> +
>> +    ret = devm_mutex_init(dev, &drvdata->lock);
>> +    if (ret)
>> +        return ret;
>> +
>> +    drvdata->enabled = false;
>> +
>> +    ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +    if (ret) {
>> +        dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    pm_runtime_put(&adev->dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_remove(struct amba_device *adev)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
>> +
>> +    /*
>> +     * If the device is still enabled through sysfs, disable the 
>> hardware
>> +     * and drop the PM runtime reference taken in enable_tgu_store() 
>> so the
>> +     * usage counter stays balanced. Use the synchronous put: the 
>> driver core
>> +     * disables runtime PM right after ->remove() returns, and the 
>> barrier in
>> +     * pm_runtime_disable() would cancel a still-queued async 
>> idle/suspend,
>> +     * leaving the runtime-PM state inconsistent.
>> +     */
>> +    scoped_guard(mutex, &drvdata->lock) {
>> +        if (drvdata->enabled) {
>> +            tgu_disable(drvdata);
>> +            pm_runtime_put_sync(dev);
>> +        }
>> +    }
>> +}
>> +
>> +static const struct amba_id tgu_ids[] = {
>> +    {
>> +        .id = 0x000f0e00,
>> +        .mask = 0x000fffff,
>> +    },
>> +    { 0, 0, NULL },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(amba, tgu_ids);
>> +
>> +static struct amba_driver tgu_driver = {
>> +    .drv = {
>> +        .name = "qcom-tgu",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe = tgu_probe,
>> +    .remove = tgu_remove,
>> +    .id_table = tgu_ids,
>> +};
>> +
>> +module_amba_driver(tgu_driver);
>> +
>> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
>> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> new file mode 100644
>> index 000000000000..ebba49402a20
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QCOM_TGU_H
>> +#define _QCOM_TGU_H
>> +
>> +/* Register addresses */
>> +#define TGU_CONTROL        0x0000
>> +#define TGU_LAR        0xfb0
>> +#define TGU_UNLOCK_OFFSET    0xc5acce55
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        /* Wait for things to settle */
>> +        mb();
>> +        writel_relaxed(0x0, addr + TGU_LAR);
>> +    } while (0);
>> +}
>
> This is simply replicating the CS_LOCK/CS_UNLOCK.
> I don't mind those (and relevant definitions) to be moved into 
> include/linux/coresight.h and reused for your driver.
>
> The rest looks fine by me.

Thanks Suzuki.

I will add a separate CoreSight API cleanuppatch to this series to move 
common definitions such as CS_LOCK/CS_UNLOCKfrom coresight-priv.hto 
include/linux/coresight.h, allowing them to be reused by the TGU driver.


>
> Suzuki
>
>
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +        /* Make sure everyone has seen this */
>> +        mb();
>> +    } while (0);
>> +}
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generation 
>> Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Mutex serialising enable/disable and the associated PM 
>> runtime
>> + *        reference counting against concurrent sysfs access
>> + * @enabled: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointer, the lock serialising
>> + * enable/disable, and the enable status.
>> + */
>> +struct tgu_drvdata {
>> +    void __iomem *base;
>> +    struct device *dev;
>> +    struct mutex lock;
>> +    bool enabled;
>> +};
>> +
>> +#endif
>

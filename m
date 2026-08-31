Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B9262FD0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788135857; cv=none; b=JOtIvo4kQccTbZvk02FqRddeZozD4rk3Ge7MRmrb25BHka7s3fVmzfnhx9hjFyQo38RTszf+5RJI6f/sbvzZ3y5OQPe3ByY1vFqa/ygVfCYyh0Mq/Ur7ZFNyV70sqrLovfOGLHzl61U5+K1n412rjh18S3HL/2x/HRLShVviOgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788135857; c=relaxed/simple;
	bh=6YIHXqDUJ/SGIN4IgKl1wQt+dbTm0xIWC7JpfWou+vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDc6zmpCZJXfrk0cVHFn6N1bieRj8GDGsDDBHahLm4Pep0+RhZQik/0WNcWrOnDbRkOfb3UV0JEEu5g9Vg6hylgg2O2cNaicDO+StP/4RF8ptzIZoCXtu7PGLqdqZy8iePdkb5bNF4wk3Eg1lstwxejklGgEgie4j0mi1Ulp304=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5VVaw4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azNdelAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5VVaw4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azNdelAc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UMfteZ1263578
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pd8erokzzkEWmKV5QqgUd5p90sn7H5zyhTLLdFPMX58=; b=c5VVaw4OCpzNF1r9
	/rx3hxU21bcsutBp4q1bbe6x5cdEAyumFaGvmaChcQI9aNUZ4e9G6N9twkWfNX/O
	k15NjflQvPOtvvKOWwYGlu0BB0NLhe4K+pxGGjbfLPP5s3AXISNCGkToXm0fC/H8
	xdF8bg3Y+//ocvowB5vys+fXG4UE8CnoTye5gJ3UOqPOuydmdczoGCXdyFmRh3Os
	f1Lm+7bnKW5MMIXdI9LrKmT2Vcuc13soVXdRw2JHX9BLMnDNNmy8+Z/CmwSXtVmz
	AFwl77Pd9OC3J3YLJPmjQ60mQr5t4STy5hsOlyIeJHvIH9JnS4QLkgiGOoLO+aVY
	lE+91A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6duush-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:24:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso831293a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788135855; x=1788740655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pd8erokzzkEWmKV5QqgUd5p90sn7H5zyhTLLdFPMX58=;
        b=azNdelAcLjxeO47/VOmdC9rM2ueLVlOW9f1x6AsN9BtW47w321Eyo3sQQ2hBoCGl5V
         e7FJ1txj57gjUiMc3GFBy4hE7EyAMW36+5RFQEfCbrHTuIegsPXdLM3Kt288MzOsHzqf
         TvIoarX0QmH2WgleVOVqZwbi17QkDLRqJfLhm7/4tvZU7rznAqmYUSvmPpBo0lc//RH9
         hHZj4vMDTZbcDqP2N6N2lR5ln2Vj2XEB5Trnni/2L76lQm6rNAUJgLVDJ8efq+XLhjJR
         6NrUXOEBhJBin8RiD+a9WjFxAkgEz8GpAASUn5dcYh2GqYoWWJL4xAe57qDY6Sp5AZmZ
         LMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788135855; x=1788740655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pd8erokzzkEWmKV5QqgUd5p90sn7H5zyhTLLdFPMX58=;
        b=QcedDHes/aJo/K9PiPmrZpY1ZrdRin2bXYKKJRVOji1E3nYb7DD/tGkaJkILUsdo7E
         oLM3Rm60kONQGfRa4j/AaUiXE7qcWyoSozJ4pDhdt7vTzspUfZ7TDcv4hHRXZO6X8CX0
         jJAy3LQob2FYqSJn102p5qdwT6m2S1w8DwPc6BmV0791mSqZV9/Un5iCbhhBam8+ZmiP
         FjuY7GWT97gk/CLrTLZlyCXh8hOMlLZFO3zKjWXAvOLSVQachy10xp6mO5uIvKA2edKU
         84QpxOG63LICaMc+bFCp3Krpz7Go8tfabf5QWJQm6WltziEcg749dtDvErC0Yi9x+fH3
         ZT6w==
X-Forwarded-Encrypted: i=1; AKwUvBxP/WaxII76akCqGMqeTmPjFO1USB21NsEO1lOY4ftp3u1tf7NQgya5o7P2LRWejT8/S7Tu1uQxeu1Ldpo=@vger.kernel.org
X-Gm-Message-State: AFuF++kTpBz8EUNyAM2TVDVQwMzovaCJzC5zjNevQGM4V72qrKEVW3Yt
	6cW2w1Dcshgtsz6vwaqYS+K29YhbiUaeOg9cRlt87knMhu6DFalFMWma3KwhhxfEjCv0F8pX9i5
	8VImFNP4tkI487UxakCdhGVdzmHd68QK21wgrqkstLCJYJ3eq9eWBQ4xCcZsclNT63b0=
X-Gm-Gg: AYBFou10oa/TjkbSva4bclq32nQS7osv/PtfNHCPyBr8Sokng9TDfLkiaRgNz0H1KVR
	ntYdUFtHu6s5bT0jTNPA8Hk5bPlsn6h91Fo9BIHxgcv+SzmbCU4YttclkI8diIasrZdYzElarOK
	+JKn69Rpl08pIldnfrPn/AMrJXTKzSmvbOr3iuL7F1EBWJN5c4+5RrYckicL8d7h9ASsIBLXP6H
	7K/EquG5MVZeqItrlI6eMzxWg3sYA2ebMQK4seyrJGr0E2J5oUhzfSYYUWiS9C1YoBielXR/p7K
	BsKBm6cHHY11m49f1fJgyClWjV7y8mKHwXgzmdXq9idKDbx3JT24zMHuIi56hV68AvxvJG45Zqz
	89v3dTfWj8GMv2etGQZ/zLAB7SDMZ2QuIV5BcD1/xXck3kz0d6TVDQFnyx3KkF0U2EFTeAg==
X-Received: by 2002:a17:90b:3c8d:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-398da58f3bamr4020601a91.3.1788135854390;
        Sun, 30 Aug 2026 17:24:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8d:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-398da58f3bamr4020564a91.3.1788135853797;
        Sun, 30 Aug 2026 17:24:13 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm18299048a91.6.2026.08.30.17.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 17:24:13 -0700 (PDT)
Message-ID: <7dc6b68a-db8d-490a-89aa-596d70d2638c@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 08:24:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828-qcom-spmi-haptics-v7-0-0367b3ac2e1e@oss.qualcomm.com>
 <20260828-qcom-spmi-haptics-v7-2-0367b3ac2e1e@oss.qualcomm.com>
 <cfa1d6c7-267c-4e9d-b3ab-2c483503a1e6@ixit.cz>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <cfa1d6c7-267c-4e9d-b3ab-2c483503a1e6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAwMiBTYWx0ZWRfX/qTYHayC1p6g
 en+1EEqmtU5P+p3dmHXFDIik14ZxfpYJxQNwNR39tvRh0DtPMkwRk6K/yodNVfdox16tUpUnttF
 Hu0MVIWtRNHQOmTC23rwimJV+4srsW/SgXLIiGQVBWMKQgr79/SIQYUAUE+3dEOKvscIZ9m4ABg
 Cs/sfhI5vajAgTOoaY2+W2lJOX81SVCJZXKFRtiW+I9xspA7hKL0PsOUTGoOwTvWYXuGuTLTDRP
 GjRt6JDThlS38GSYmbDcLt10NHMFyKI1zPdUiGbAF5vF4do+bPdE38WU1/fYeVQoDWAptb97q0Q
 XqRtrc7PE66EcviL6PGd+Z74nFFYv7Yu9eE6tUFiJNWcZyRIgQf8O35oEUDRIR9Dsbv8bGeG1o+
 1171J/xyPYcN0LH8B1Hc7uxek4b8HiQJ7APQI663fNWrY1AMWYZiLk60asIIKzcJ2G8KxWbFJ6F
 5PWUuaQLXfdzQjMm0Og==
X-Proofpoint-GUID: cFN9cgGZzWC9g-79iQyY_nAyvsco85-p
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a94c9af cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W9oJu5yFqjHUb1IVf5IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAwMiBTYWx0ZWRfXwhtQdKKsbTLV
 XvRNGIxw7fZFwAQL1bIE7VIKe7F1bznOqQHcKy22rsfuX08JoGyH3jCmW45w+Skchpd8GLUQvzp
 49uaz4NlMB+zu+FKfzSInZNTKLpgIrE=
X-Proofpoint-ORIG-GUID: cFN9cgGZzWC9g-79iQyY_nAyvsco85-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310002



On 8/28/2026 8:12 PM, David Heidelberg wrote:
> On 28/08/2026 11:49, Fenglin Wu wrote:
>> Add an initial driver for the Qualcomm PMIH0108 PMIC haptics module,
>> named as HAP530_HV. This module supports several play modes, including
>> DIRECT_PLAY, FIFO, PAT_MEM, and SWR, each with distinct data sourcing
>> and hardware data handling logic. Currently, the driver provides support
>> for two play modes using the input force-feedback framework: FF_CONSTANT
>> effect for DIRECT_PLAY mode and FF_PERIODIC effect with FF_CUSTOM
>> waveform for FIFO mode.
>>
>> Assisted-by: Claude:claude-4-8-opus
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/input/misc/Kconfig             |   11 +
>>   drivers/input/misc/Makefile            |    1 +
>>   drivers/input/misc/qcom-spmi-haptics.c | 1251 ++++++++++++++++++++++++++++++++
>>   3 files changed, 1263 insertions(+)
>>
> 
> [...]
> 
>> +
>> +static const struct of_device_id qcom_haptics_of_match[] = {
>> +	{ .compatible = "qcom,spmi-haptics" },
> 
> Hello Fenglin.
> 
> Same comment as for v6. As you mentioned, this driver won't work for:
> 
> compatible = "qcom,pmi8998-haptics", "qcom,spmi-haptics";
> 
> which I'll be upstreaming soon, can you please use device specific compatibles 
> here, thus listing the devices which will work? e.g. qcom,pmih0108-haptics or 
> any other you tested?
> 
> Thanks
> David

Hi David,

Like I mentioned, currently this driver is only supporting pmih0108 PMIC
haptics but it would be easily tweaked to support other haptics modules
inside pm8350, pm8550b etc, as they are having very similar HW design.
PMI8998 is an exception in which the haptics HW design is very different
from the ones that we have in the newer PMICs, so I would suggest to
treat it specifically. What compatible will you have to support pmi8998
haptics?

Thanks
Fenglin
> 
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_haptics_of_match);
>> +
>> +static struct platform_driver qcom_haptics_driver = {
>> +	.probe  = qcom_haptics_probe,
>> +	.driver = {
>> +		.name		= "qcom-spmi-haptics",
>> +		.of_match_table	= qcom_haptics_of_match,
>> +		.pm		= pm_ptr(&qcom_haptics_pm_ops),
>> +	},
>> +};
>> +module_platform_driver(qcom_haptics_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm SPMI PMIC Haptics driver");
>> +MODULE_LICENSE("GPL");
>>
> 


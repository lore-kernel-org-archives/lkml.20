Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3E5733E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791418136; cv=none; b=XgSzkk5CG1YUYmvy/y946XRdw0sPT0qT6oPRDwhn3Shz1qRco98ZM09EnJhH9tqb6WnqsN5o78IYdPbTBcUL9FtSn+KasU6Dna5j9JI/IwBVtQGU4bh+yRvQnLkq+Ye94SXkqceUjOmQ7lMIqNORnX0TgxuNoSksU4DBo9ymtNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791418136; c=relaxed/simple;
	bh=x2KkVoMQI1NXabI2h0N7BvI/fSRL3yWbK0MtUn7sBiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXonArPUIFUyjWspAcE3lsFirJ5LlaS6CVMgIR4oUIvJzmhvUCAwgHkrWLfgq/CJv2CKzBh0wrFdXGRigu759WKUCHOsc4NUroGWKroVOqe42JndS3K02QlztbfT5vouet2WrMilB5hvVhkUM4zbGJANVC/QGpgURM9Lr5SEcIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BiKb4yPm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZlgjjt8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BiKb4yPm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZlgjjt8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697LuNli627278
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 00:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=; b=BiKb4yPmNEbSAUIb
	14/I5FvUmndSoBTWkx57rSDWqaiDeLehQ5sxGe1Sn98VlfxJT91h0QuQaO4On1fb
	MH6TJZXimpc3VSgdRISOrgU+mBS9Jb7TRbAEDnV4xgWCUgpHzDwsT05EcGedJ+SG
	hkUyqBPEltDltkRKzjhU54UMgC6Gc9jVkho8TxSqVVaTegarMci1ett/Xsi5ssba
	R17vmJ76UwRl6ryUN0DdPfaG12Cxs4bShJpTkqGsoofitle/EKMn5iJFB0XS7ZbD
	FhhmJbb8H8V2AlCMDyBx06SkNwRImIAdiZig1f2kskhpe+EIpbIDQP7AdvgC1SI4
	zF71uQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3gfm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:08:53 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so16750813c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791418132; x=1792022932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=;
        b=aZlgjjt8dRdLa14ang7d5wSHVO3Nv5zHX63nzRCgun8VoZoDwn+foFyT+bsg2yuq3y
         77BzWB+Sb4DCsoI/Renajlte6Z8i6iKSNKeQYSxcTVJEycb9WrFmhJk4NMwwLpr4fbkT
         xyCynggGnIgOgmsCUjV+aLTbpRMweCQ/uxQRvnkGXFo5BLq+t3WOK4Tzd0HTZGfd1DCI
         dfMc/Q/D9HAFJsqphrGHi3TSiF8ax6T1hHYqJTsf8oVwNggQRY66IBvRi+hpkQBhLAaX
         2MwqunqIM1NxWIp7SNu1BGfwe2tQKr5qD0baOZkFdNf3CsNgJR5sXAPTYioZ4NPYUTAr
         sBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791418132; x=1792022932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=;
        b=cG5h7zgkNe5ikzj1RT89wpJuuzu8qJNj6tmLrxuh7rViHDwb/3SDAgnl4sADdE2YGl
         SU5v8Xx6aucfpf0KZHF2iwdkPutmWxox2Rt4VEUkUXTliSpk1vgOalfFYYoLOWqIi1rN
         P9V1xw/qff8kpn5QsdCNlxdycpE/TKF2KuGoGKvm3J/b7kvDQ5PMoHQsi1+o2iS4/hB/
         HKhY0ZOuuxRPexuE6iNuFrBeHChYQm7trWZFKl1n4NhRzo4AUeM0yHQYLL5lKMxKyGMJ
         w05WGNu7UL9ibaSLsWfYVp2FgFhRlmGK1gmQgrFxf+uc0VBc7Fl8t1nwsan9jkfHuvMQ
         Vy6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwi5rxWJx4yxm0wuHtqg7JbJrApL+oAAjPOzWNMi9FXstWZMqyzXk15aYnsPZ7gMwHJIvrdmhUf4o948Ac=@vger.kernel.org
X-Gm-Message-State: AFuF++mEPajEywHaAv/7kHcUubsCMG5LZN+6s90Ln3AKBC5wJ2xoRm3F
	HZvTxt878sDQZq9sm2GCOr+Mwi0Y3ryL84JK5MywqIbYAK37Q3kDL3HgxiR4+DKqu4hT2BMa0+Y
	+RxzqyYxVa5A5pDnpoR2PND5QDoFQPBDhTAsIJeKbzA7MAIfK/s35SrIWpWMqgh6KAaQ=
X-Gm-Gg: AYBFou2u69Eqxt17D7YxTW00gSIrEWzMFGsyjui9lat5MvHOCHv/CA78MMCNkfVUsnI
	QBw1XdwfNjjQOTKZ6pZcLSNxcJKzcKats+VRaCqaK2L+4kpRj6f3Sgyfr7CjsxaoHjTlwFRsdwa
	QIzILHiQMVVqngehThx8q5gNsZsJnqeQkFFPxcD5Sr4p1qRBFEpd65EE6mbdi58fYV20s+bogLV
	ORB9hiywNYT1cJ9o0U0ZZcnQZxQqSGsHIegjT2gZVyCTxajsSzr/ZwDeenddsUhYGulUkOe2Jf7
	8Zp39FKTi0tNHaPbaWJwMKIg9/2dZ/yIfMJov5azn+YHBr7c1weICA4I2LMzd603+hIuLKvZp3b
	z3F0gElimtoccP4odF5mCAj8SDVw75+UZje725awoSXShbgv/O/+4XsmFJFQS46g=
X-Received: by 2002:a05:701b:241a:b0:151:ceb3:e105 with SMTP id a92af1059eb24-162047a17dcmr4490628c88.11.1791418132393;
        Wed, 07 Oct 2026 17:08:52 -0700 (PDT)
X-Received: by 2002:a05:701b:241a:b0:151:ceb3:e105 with SMTP id a92af1059eb24-162047a17dcmr4490583c88.11.1791418131519;
        Wed, 07 Oct 2026 17:08:51 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166216f39sm11910314c88.6.2026.10.07.17.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:08:51 -0700 (PDT)
Message-ID: <46903bb4-67ee-49a4-bf53-e7ba2c34256d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:08:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] soc: qcom: qpace: Add Qualcomm Page Compression
 Engine driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk,
        rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-3-georgi.djakov@oss.qualcomm.com>
 <20261001-hopping-belligerent-spider-876e7b@quoll>
 <fed665c5-3062-462b-928d-ab60976ce839@oss.qualcomm.com>
 <b12214fc-2e06-4e52-8bda-6c6f9a76bd7a@kernel.org>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <b12214fc-2e06-4e52-8bda-6c6f9a76bd7a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX6HMusZltuV0z
 DRKDhidAu8t7rPa4QQXKJ5q/qARorj2OEG16sPvqWussIu8qNmSjQSBCDf7EwhtWzOIZcfPVRJ/
 Q5LBZF7jBhf28Qq7lQ/uonDU5h9Bbgw=
X-Proofpoint-ORIG-GUID: 1D9HSDENSIOoDxscmY_OiiSr0279Vu88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfXzNILY/l/fXGm
 qep7+PyJohD0nc4YvYGR/YuEtF/9F3Pg/msaDam/k8Md6nmaYKt7uOY2rctwX0DMFByqDBjGeUS
 21Fohz/DaGnM/uPJ/8UYGG/RI8E9tFhhzdDOqewGK6nHQR2N0nhRxAN4I7O+kojVAB2GxAMOFAM
 34PJ2bdi4ubc6H8oLkhuZTnhu+2fUvY6Rn7eb7WlQJyW2Gl/pPcwGCmnfIrLwcNjOUKO26Q2qbw
 8ixKiucpKNbr7/qktJVLoRj9it97fG+r/oQJXlcWG4H0d48LeEsK4TodJAPnwOfgM8lTD5araco
 v+oHM9LRmaxvouqeojIqgSLslN2XBr99tN4+ACy8gEPusqKva05ABWlspr+uJKFTvS5H5m6Y/gz
 DtWVVEUqHiyyF6KMsORD2ycEbsQDRPQgT9ENGZF6eZHE3n+X5ukoUtX+45AmxDFu/iSn/N7RCan
 1CyDaQBn/t++BpfCK9g==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac6df15 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8u56npouWohDfDDlGUsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 1D9HSDENSIOoDxscmY_OiiSr0279Vu88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080000

On 10/7/2026 12:51 AM, Krzysztof Kozlowski wrote:
> On 07/10/2026 01:51, Oreoluwa Babatunde wrote:
>> On 10/1/2026 1:50 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Sep 30, 2026 at 07:52:11AM -0700, Georgi Djakov wrote:
>>>> Add a platform driver for the Qualcomm Page Compression Engine (QPaCE), a
>>>> hardware block that accelerates compression and decompression of memory
>>>> pages.
>>>>
>>>> Provide the urgent command path for synchronous single-page compression and
>>>> decompression. This exposes the low-latency operations needed by
>>>> compressed-memory users such as zram, especially for page decompression on
>>>> the read path.
>>>>
>>>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>>>> ---
>>>>    drivers/soc/qcom/Kconfig          |  14 +
>>>>    drivers/soc/qcom/Makefile         |   1 +
>>>>    drivers/soc/qcom/qpace.c          | 764 ++++++++++++++++++++++++++++++
>>>>    drivers/soc/qcom/qpace_internal.h |  84 ++++
>>>>    include/linux/soc/qcom/qpace.h    | 154 ++++++
>>>>    5 files changed, 1017 insertions(+)
>>>>    create mode 100644 drivers/soc/qcom/qpace.c
>>>>    create mode 100644 drivers/soc/qcom/qpace_internal.h
>>>>    create mode 100644 include/linux/soc/qcom/qpace.h
>>>>
>>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>>> index 535c8619197b..6bcb86dcd726 100644
>>>> --- a/drivers/soc/qcom/Kconfig
>>>
>>> Sorry, but no. Soc is not a dumping ground. This has clear function of
>>> compression offload, so it should have some dedicated maintainers like
>>> other offload engines.
>>
>> The reason for putting this in soc/qcom is because this is a qcom HW
> 
> Every qcom HW driver is a qcom HW driver and they DO NOT go to drivers/soc.
> 
> Again: soc is not a dumping ground.
> 
ACK. We are looking at the crypto driver to see if it fits our use of 
the qpace HW block.

Do you have other suggestions for where this would better fit besides 
the crypto framework?

Thanks,
Oreoluwa


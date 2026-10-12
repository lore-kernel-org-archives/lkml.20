Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E2475333
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799892; cv=none; b=ojbtq0zJPWG4xy12b4BpWP54iQoL7GCktXFmBp/G6URcJfBZaz3O6kRNWNObESJoAgADKT5k9Oe5rkJwrzvAqsyNVsLdnnfUJB+/XzJ3UrXHZhQNXuw+ZpvBcLtle/Vkv3lT4Yf39AIzsBhbyWGXAUc9/R+ttsgYE5DbW23YeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799892; c=relaxed/simple;
	bh=TvsucdrpRWbg+nMNXlqHZpLBasZrZ8y3ICHplgkyc/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THMJLkisyX0itC6o5IcBjlW5q2SJssK97Pao3ulFk2O37/wu3GnZKl66D7+nvtaNjLRy+B5MwgbYlh9NdXQO+4k5H7WNavBoJKlbb69KnRwGQ42p8IAvneu1+VvVCtS8Q2c+kUeAbF6DU4Ojc76qu6TGj04V7V/v2baS/Dwy/10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWgNbi01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtynH2/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWgNbi01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtynH2/o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA3iBX2527365
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=; b=MWgNbi01PvSuV0K/
	GF5vPCOZWMSjPDap+X8gxQFGn0AxFPzoOlEuhclgJlQoh+1EyVaLIEMI9aDt6V2u
	E4JTNI2xJ2WVBWFmrlPfqMd2FmMKaNzPOnQX9w0OdTYiFZ9E/sCmOwbgOUgxbPc+
	q9w/HB3hXhNDqntAfxEeSUNgCQapin4GrYsI26ruhS7cJrTeNRl9fGHnaUJximpn
	bZBRC/015zibDeqOHhuGE9WpdFLSI0wob5SUYSompRBWtA8qOEQfxY6fFD8hafTN
	N0/YQkRBLX1o4zVMPipBGfCyZ/0QUFVz7Fu3bHqYdDwOAb48flvJXm+DxewaaALa
	xQY4Kg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffg1a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:11:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88a10162189so2724479b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791799883; x=1792404683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=;
        b=LtynH2/o5e941oyZD91zQJulXDLQbS3nIsxGl5nlsAceCmjBmOF86aNs50ncpWXC8O
         wQHLBl7Oy6bIfCqNKmhNQZn9QhS/+fZGzVvLN2cMNJz7zBXZ+Rgy2vObyj6K0jr+uTeD
         zpwT5PRhTPa8nOFZUHgiaMukche9EYFSdTmOhzkftxOGkvkKaHb7ywvZ2Sio5CJEGTPn
         HjpHd2QManuPoezrHVpoZq4LzBowz6BW1wRP8SbA9nXKeOym1E5hxkPRQ55VREEWZ8a0
         c50URIiYnos13RhK/NqHNf9SrkUxHE8mujeH3e1fHLgD59N86FWZTN/8XtHYk3pJNsEc
         jgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799883; x=1792404683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=;
        b=HYvFB0ZhSKmfw70sZnEUPxJRSy0tQxjKWLzgXKcjqc+gi5Ic7UQ0grIBhlOyq+uB9X
         YRYzw1d2pjRdX4NLfkDE9TWM8Rz1d8INeVPXJl+9AQNsUiEk7A9Riwrff+H67+OmRrN1
         aulNySZjWYqic/kuPoh0pAIQniD5/W+RI9lF7u2g+UEaXzpwmDlUVk8OUDpvT7BKXWlt
         2qI0NxZzemj1foBh2RW6/KZ7KmDd/a9HS38AxX4vEeK0BgkHIAt3D/tE5hk3eQL28eRJ
         VbjbgPKXxYzSSw8dGEVGEbt4NxLQlc7tZXUcNc70OsppxV9f39Y09VEsErxz0JJjywFu
         mQcw==
X-Forwarded-Encrypted: i=1; AKwUvBwij9Andz+sJUtWlOO/JbxhRiagnk1ahE1tYna1DrJeo14h2nCMp08/q/BLMuztK7NB3cCfAhtIm74Gaek=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7FnXrQDssytLDT8Mq2WvJ+t9UBhiG7ibUAtC8foiwsJY83J2R
	7Kq4hMeGmNwn5hOYV7rCY3ecJwTS1p5Lx1s1Y8EOWaEacck8g4DIQZjnislMlPfwobJ677Dn5GK
	V5kwtRIEOstWGG1sjhNiybi+JyDy8UJn2dvfzdY049ATQqrbcGW5JuyPYt4TUQ8/R6mk=
X-Gm-Gg: AYBFou3uBwnXH/hqyY0AQWDJ6EpEkZ+ehF32K4uAEYffZS9GikOValM6OsLPO3gTlfq
	/BBVJl0XzDEF+X45KaLfsSh6V6RR5Wp34+3AH647xsPHIXk/N8BfuhKOQS3mCl+7uZRmKLkOHzM
	UO8IeK9DsPU5QneYO8dfFUO61WNdNkavLB8hxHS3UBGR+jLUD/oq1fISnMdAtGPZqBkVrGhm+bB
	xd8dJSCciRSX+1A7xxsNE0QEcu8I1Feh96HFiO3cG18DceFODhyAw/JjqM92u/EBPYbxVssqOip
	b6rJe1PYAtkJzJg9DLQYGNkzkYpMyUbkLFfJHP12Um5dnBPD5lmYUKsOKKdrwNph7Lf/5Kcj+61
	sTn87Qi0BhGRl8ETrOQ==
X-Received: by 2002:a05:6a21:329a:b0:3dd:a00a:170d with SMTP id adf61e73a8af0-3e16be79864mr7616192637.40.1791799882409;
        Mon, 12 Oct 2026 03:11:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:329a:b0:3dd:a00a:170d with SMTP id adf61e73a8af0-3e16be79864mr7616168637.40.1791799881951;
        Mon, 12 Oct 2026 03:11:21 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107348sm3869973b3a.13.2026.10.12.03.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:11:21 -0700 (PDT)
Message-ID: <e25158f9-9fda-4561-8bb0-d05a21f420e2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:11:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] arm_mpam: Add support for memory controller MSC on
 DT platforms
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
 <20261008212904.GA1450868-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261008212904.GA1450868-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX/YV4Le3cGRB+
 9UIw5PfIPAWw2oUP4G915KptQe7+q7tbR8a3SNMSUkfpY2ITlEtie3z3P3ZUWT/pEnuIuiZmyKQ
 1CtNTKR04CsmxK0qZYBet0LoszcaUc64eT446xH1p9WX0alKXOqmmMAJrlgj2py4rxI/fZQK0cq
 cWlAg6qiqrU4VBXQ6VVqL2bWmu54dI3TIdtbhL5bU3xS6dm1FQQAd9QX0dtfMZTwPLljpKkScBk
 bwFnYF3GNW5w9r+bKVPfpRedoz7W9KrjWdfpsJpEadLhKmx+taOhOj6Vs0Yzx88zdQscGPWrBMu
 3h9j03vDBVmAWL+VMlC7/CGlEJ7gYstKVAWcO0SZIwefRQuqflfU1XqhpIkiFo0NAnJozEABE/T
 ugFV1YXHvM5ZVbu1ktU7Usr9v46bxR1zePZcEJwzfhWvAVHo1HHpIv/K9IfTay5LVsLq1EgPnst
 U0PCA7e7aoX8IUV7jsA==
X-Proofpoint-GUID: 0ak2dFBhZeljLp7NdVMkHF6x20DbGMye
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX60XeiRLEefvC
 a8QfoJuNLe3b7pksDUtIwyRSjVZ7AR4B93fZt/jknKRwR41ev8h0lBo0XTSZSlLXPfaN3quMHB2
 MEAVnX6zPJRp7BK+6yTqB7ld+84Yj+c=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accb24b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=urU-21cbkK_4QL_mq_YA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 0ak2dFBhZeljLp7NdVMkHF6x20DbGMye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120039



On 10/9/2026 5:29 AM, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 02:41:15PM +0800, Yin Li wrote:
>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>
>> The MPAM DT path only handles cache MSCs. Memory-controller MSCs
>> cannot be probed yet.
>>
>> Add support to discover memory-controller MSCs from the device tree:
>> derive the component id from the NUMA node and create a 'memory' class
>> RIS, and treat a memory parent as accessible from all CPUs.
> 
> Where's an actual user?
> 

Hi Rob,

The Kaanapali platform in this series only uses cache MSCs. This patch
is inherited from Shanker and James's work; They may have a platform in 
mind, but we do not have one to point to at the moment.

The binding already includes 'arm,mpam-memory-controller-msc' and the
corresponding example, so if the driver support is dropped the binding
entry should go too, to keep the two consistent.

We are happy to drop both. Shanker, James, please let us know if you
have a platform that needs this before we do.

Thanks,
Yin


>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> [ morse: split out of a bigger patch, added affinity piece ]
>> Signed-off-by: James Morse <james.morse@arm.com>
>> [ Yin Li: fix context offset conflicts; use of_node_get() for the memory
>>    parent to avoid a refcount underflow; use u32 instead of unsigned long
>>    for component_id and compare against ~0U ]
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 55 ++++++++++++++++++++++++++++++------------
>>   1 file changed, 40 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 0640690eae2c..048d32e69f55 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>>   				  u8 ris_idx)
>>   {
>>   	int err = 0;
>> -	u32 level = 0;
>> -	u32 cache_id;
>> +	u32 class_id = 0;
>> +	u32 component_id = 0;
>>   	struct device *dev = &msc->pdev->dev;
>> +	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
>>   	struct device_node *cache __free(device_node) = NULL;
>> +	struct device_node *memory __free(device_node) = NULL;
>>   	struct device_node *parent __free(device_node) = of_get_parent(np);
>>   
>>   	if (of_device_is_compatible(np, "arm,mpam-cache")) {
>> @@ -275,27 +277,48 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>>   			dev_err_once(dev, "Failed to read phandle\n");
>>   			return -EINVAL;
>>   		}
>> +		type = MPAM_CLASS_CACHE;
>> +
>>   	} else if (of_device_is_compatible(parent, "cache")) {
>>   		cache = of_node_get(parent);
>> +		type = MPAM_CLASS_CACHE;
>> +	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
>> +		memory = of_parse_phandle(np, "arm,mpam-device", 0);
>> +		if (!memory) {
>> +			dev_err_once(dev, "Failed to read phandle\n");
>> +			return -EINVAL;
>> +		}
>> +		type = MPAM_CLASS_MEMORY;
>> +	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
>> +		memory = of_node_get(parent);
>> +		type = MPAM_CLASS_MEMORY;
>>   	} else {
>> -		/* For now, only caches are supported */
>> -		cache = NULL;
>> -		return err;
>> -	}
>> -
>> -	err = of_property_read_u32(cache, "cache-level", &level);
>> -	if (err) {
>> -		dev_err_once(dev, "Failed to read cache-level\n");
>> +		/*
>> +		 * For now, only caches and memory controllers are
>> +		 * supported.
>> +		 */
>>   		return err;
>>   	}
>>   
>> -	cache_id = cache_of_calculate_id(cache);
>> -	if (cache_id == ~0U) {
>> -		dev_err_once(dev, "Failed to calculate cache-id\n");
>> -		return -ENOENT;
>> +	/* Determine the class and component ids, based on type. */
>> +	if (type == MPAM_CLASS_CACHE) {
>> +		err = of_property_read_u32(cache, "cache-level", &class_id);
>> +		if (err) {
>> +			dev_err_once(dev, "Failed to read cache-level\n");
>> +			return err;
>> +		}
>> +		component_id = cache_of_calculate_id(cache);
>> +		if (component_id == ~0U) {
>> +			dev_err_once(dev, "Failed to calculate cache-id\n");
>> +			return -ENOENT;
>> +		}
>> +	} else if (type == MPAM_CLASS_MEMORY) {
>> +		err = of_node_to_nid(np);
>> +		component_id = (err == NUMA_NO_NODE) ? 0 : err;
>> +		class_id = MPAM_CLASS_ID_DEFAULT;
>>   	}
>>   
>> -	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
>> +	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
>>   }
>>   
>>   static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
>> @@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
>>   	} else {
>>   		if (of_device_is_compatible(parent, "cache"))
>>   			get_cpumask_from_cache(parent, &msc->accessibility);
>> +		else if (of_device_is_compatible(parent, "memory"))
>> +			cpumask_copy(&msc->accessibility, cpu_possible_mask);
>>   		else
>>   			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
>>   	}
>>
>> -- 
>> 2.34.1
>>

-- 
Thx and BRs,
Yin


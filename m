Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961493;
	b=zq1RTdnQCqi+pkkotRai4u3WiGRQnVQ9nr08D95dGPplDcuT11stZnDN9/0Y5Lw5iN7r
	 /WPBWIQoLaXWDCkOseDVclacqtQPhtOK77e/VvcGWZZweaJ4NIDGm12AMrj/kW5SZbFg9
	 UUSmesc1tomLLYHeiNzxpEiNomY+ciIqaUedie4ZgtN9QmpbcGxNWnHYHzmVufCkeXxqY
	 fs9l0gwMDTQFErTAsM+eDHwAr+LepuksHYGNP3ycV81xk4SNADuA1jVeeOlgWI6Wcq1U5
	 068KFbWBqtiS81iPUafuWt4RIqUy3Q0/NDDdjk1U9juhXo511ybhzGvB9LGlZuFYoGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DyCrYP+arTiB7/cTGUoXo/XRtH3sRHAhV8u4R/DUbFc=;
	b=pfsukOhXvhhDDq9axS8gcwTXHaF4yQME2WwCXFwT+N8mUsesEtplAkH0L5uzS5kY1Dau
	 PkVEXBYy1zkRWXTrsvvJZk2EQtWWxSw0RY95Sbo/uiU9l/fbOdcwVImdEc8i1Ji2WXJTs
	 kMe5sE10YZetg8d8BVl3AIBMX1f83//TIM+zoBzw19NbIiuuz1eblb3/JXhjkI7CsVom5
	 G8Eiv6tTxYCizrEqceGJ8CZjQO/lcD083gZDdBRVJPcnaEw4yV8MBPi0fJ6D+OBlz+3wm
	 ykwOueIWuI0FizhCeOaZRjy0e3w/3iK+8DBBmHbEwZ7lCrRs11dRq1RtjjQmb7R/iRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=omGGguMY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKUbLALy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524B4606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524B4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=omGGguMY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKUbLALy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APJXe3684854
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 10:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyCrYP+arTiB7/cTGUoXo/XRtH3sRHAhV8u4R/DUbFc=; b=omGGguMYBzrdrvVJ
	5zcf4qQbl9gCkqfimWau9b9I1VlUde5wnumfSOFHdFEcCUWE0aiGB80nRN9eEX7q
	r7I7N4Xfo9VQzxez1VLnh4+6U5Hw039O3YxO/zNEMvcVGEiSvlfFL25t2ZJbsLPZ
	QNDUcL3vbhzkAA8bEXk2LkiD8Cry1Gdu+1nNcpens8NiEZ+gvIjEvNHNIR4Rb0EJ
	ZUfdiHnOi6kJ0tnPf3eqIrjcrRNH5pYANDkr8gd/DktvBKqTBjYlb6w4C/G0EuZQ
	fhStuxFU7HIYnpuortIGrh7h6mbZhPX6buB3oMTLnhWT3+7UZD9ZpaHlSDL7uEnp
	hIcKMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2d3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:38:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed34e33913so3376855ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793961491; x=1794566291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyCrYP+arTiB7/cTGUoXo/XRtH3sRHAhV8u4R/DUbFc=;
        b=IKUbLALyIGrl3JckBA0FiFYs4fH6Ad+IJ08GJAYNZVxH8UVO+lo0ZYZt+pf0AMVQoz
         eSJaYPZGhdMexy/PUF1bUpXHn32xYtfu7q2ghr5Ok3G1Jr2diM4LSdWn6oFByrjVE22O
         8GJrP49kBq5+e48cz2dXtp66WBJIDXWtF5SSWCGWG9yjrrD4UVl9TewfvRV0Kb57MV+K
         t8pJuz5HKud9DQfcQ/E757XRU/sLymIhOAVkFOfMVDh2bKEO3HUDLf03qlIjegyACKce
         9CtqBTubNddFFSbJC7Mnrd8o5UG7gdRFyO2w4ryBne0PXXa22Y/jz7HnZLoL35Rs1gZH
         s1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961491; x=1794566291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyCrYP+arTiB7/cTGUoXo/XRtH3sRHAhV8u4R/DUbFc=;
        b=CKXkPxJSzZ1CWscLPeHhwPr6YXaH9uvEZXkVpuJOmpspememhBgdPBt5QaNNEuitTv
         IjjcpaDKS4X3IyW3XqKGU7rTf7+iyOuibrZyA1cUQ/GF2NzwCBGES6eQLix3KnM3Jmh7
         YNn3y7EUvjVZyUPLP+AfvLvfYWJUG2yhgmrKdl9JqfAORRFm0i//Jj/aNASDzWDCAdrI
         tWqBtMgUb5uqn73LaYMBLKjEgoReOrGbJRttsDTkoWzAspN5CIMZJv5p3TCkQ2N2IaxN
         Z3yvfKDuN+Jaa3dyh2TemsG6ZOxnH6gGHoF+uFnDxa8GoP7p3XEjv9kDZOPeRJCeqtot
         OrCw==
X-Forwarded-Encrypted: i=1; AL+hErFVIbXBKMF8STnzSS3XIfJ1fqNG7Kh1M7wjrNr9lpTv9kSdAHISX2koYeYOVIfJzYrxcb0wW05IxYjgazo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EGvS+IOOLIQY2ogFhFj53Px1VnNoaiQ6IYO8EjqNft897JhF5
	sh3QqSLMgTxa0EhJLBK34CsF80tyNvnk78wH+Gz4uNveOoAAwBDN5Dd1jMeOFUPrBCSsLQSepBI
	45B5+mN2uo5mSX5ofo5WkcF7eqC2ot3GImbOdVV9W4dJvIjxUMbVo60Q7eALHzpaATBg=
X-Gm-Gg: AYBFou3cCJtea6qzUKi41hXI+z8rdP0X6yoX34VixVWxwKyiUEx/Do3XkqgnIDsRTLl
	e4di63aXqIDl9bQnJn0EOUj04tPfYsYEzkelfA0USucJ4Vhbd8GAKHNRw//j5MLT469+9usBjml
	N+FdYGP3H+ozoP1alOUXm19Hc3e/4CBgiGD+UywchRGzJfIdnfW/xK14v7oL38Tgqd9OkNiuPeX
	lXMR0LWfDE/0hFjt4zqJsW39YsQvz4COTtNhsGGmYLm5PRNDI+WkbmwcXCInOTydYdrvmFJmfqV
	dZdQvwmFvC1RpjZwQofb5l67dv194SJq17GFJDbB3gGBtX7EAsF8qC0f7goO871b2Po1xn8E/+V
	M47KoebKaiN5rWG1aCgrrMrZfAXkFfpZ+pLBeEdjDvg0VhxswgL5AlWdxbLe9/7YlPypQU5+z9Q
	==
X-Received: by 2002:a17:90b:2d0d:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3b0db6d45camr2003524a91.18.1793961490739;
        Fri, 06 Nov 2026 02:38:10 -0800 (PST)
X-Received: by 2002:a17:90b:2d0d:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3b0db6d45camr2003491a91.18.1793961490106;
        Fri, 06 Nov 2026 02:38:10 -0800 (PST)
Received: from [10.217.219.8] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3280378sm7235684a91.12.2026.11.06.02.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:38:09 -0800 (PST)
Message-ID: <67f05266-77ea-4018-bb0a-e877e288f9da@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 16:08:04 +0530
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
Subject: Re: [PATCH 2/2] mmc: sdhci-msm: Add support for firmware-managed
 resource platforms
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
References: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
 <20261102-sdcc_scmi-v1-2-244dbd893051@oss.qualcomm.com>
 <afa7f2f6-17f3-468a-a7c8-4b1b7840bde8@intel.com>
Content-Language: en-US
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
In-Reply-To: <afa7f2f6-17f3-468a-a7c8-4b1b7840bde8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o5Ke5uvrFKVvKkkyANm3nJMRVvpQzWWS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0MiBTYWx0ZWRfX8P0ECeh5JdH1
 OXCnCok7nWgoQW5OcDscH4gdsZ+wta5XuGPuQSl21BSkZu3be1WvjZy4WvO3pOBlwZ1RBVUlAYS
 dl/vJTIVYyoZq4lH65Kc+sgvzKwUh+8=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aedae14 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=6dTfJ8FaPMCXR5VNEZwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0MiBTYWx0ZWRfX8/NnLh/tizqH
 VXVPvUqOpkSkufOICEXfvXwzbZyD1CJfjFrUnxMU7Z+MTHC0WQMdh9Qvn4QMxezEvawmkamTdwj
 zBsY2i3A3rxdn0URteiLyQm8xpHRJD5oSBeibQ6huprkEmykdeMVvZgV5e1ILIeObWSUMM/vPgP
 bBAUftLSLDWZIx6LePfiZAGi9G8+uHzcY9IxJQm1bhaH9w/LE8GEadsg4IKk+4Leh9sFFINw2Km
 teR4FT1wnvAiY+7TF/M6Ww8+hKVETM8mKrS9cxfPCilNcSYQ0wSUV1VI+JgTOaDNGRJqBxcFDYG
 yJldfotL2/RGay2o0Bm0zyYH3OQHqZOQC4RdOwHIB8ogqGwmJ89fuV47vRyscvZPppzWX3ZY9vf
 M2OxnNNfAb9IR+yXnUYTk/3H8MUslpGIyNTI+4hsc1pwP+ImfOCSWhS7S70aZHJsKZ9D0ittQ4N
 moa7fKDjqdCM8PqLjRw==
X-Proofpoint-ORIG-GUID: o5Ke5uvrFKVvKkkyANm3nJMRVvpQzWWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060042



On 11/4/2026 5:32 PM, Adrian Hunter wrote:
> On 02/11/2026 16:03, Anjana Hari wrote:
>> On certain Qualcomm automotive SoCs such as Nord, platform resources
>> including clocks, interconnect bandwidth, resets, and regulators are
>> owned and managed by firmware rather than directly by Linux. The
>> firmware abstracts these resources behind logical power domains and
>> exposes control through the SCMI power protocol.
>>
>> Introduce a firmware-managed variant of the sdhci-msm driver that
>> operates through this abstraction instead of directly programming GCC
>> clocks and PMIC regulators.
>>
>> The firmware-managed model uses two logical power domains, attached at
>> probe time via dev_pm_domain_attach_list():
>>
>>    - "power" domain: governs SDCC rail power state. It is activated at
>>      probe and released at remove via pm_runtime_resume_and_get() and
>>      pm_runtime_put_sync() on the domain device. These calls are
>>      translated by the SCMI power protocol into firmware power-state
>>      requests.
>>
>>    - "perf" domain: the SCMI perf domain driver populates OPPs at probe
>>      time by querying the firmware-reported performance levels via
>>      perf_ops->device_opps_add(). Clock rate selection uses
>>      dev_pm_opp_find_freq_floor() to locate the nearest OPP at or below
>>      the requested frequency, then dev_pm_opp_set_opp() to apply it,
>>      rather than directly programming the GCC clock tree.
>>
>> A new variant sdhci_msm_fw_v5_var is introduced with the compatible
>> string "qcom,nord-sdhci". Detection is automatic at probe: a non-NULL
>> pd_data.pd_names in the variant descriptor marks the platform as
>> firmware-managed, causing probe to select firmware-specific platform
>> data (sdhci_msm_fw_pdata) and ops (sdhci_msm_fw_ops).
>>
>> The firmware-managed ops provide:
>>    - sdhci_msm_fw_get_max_clock: queries the perf domain OPP table
>>      using dev_pm_opp_find_freq_floor() at ULONG_MAX to discover the
>>      maximum supported frequency, replacing the direct GCC readout.
>>    - sdhci_msm_fw_set_clock: routes clock rate programming through the
>>      perf domain OPP path, reusing the existing bus-mode multiplier
>>      logic to derive the target rate.
>>
>> Suspend and resume sequences bypass local clock and regulator management
>> for firmware-managed platforms, as firmware handles those transitions
>> autonomously in response to SCMI power-state transitions from the
>> runtime PM framework.
>>
>> Co-developed by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
> 
> Doesn't compile:
> 
> drivers/mmc/host/sdhci-msm.c: In function ‘sdhci_msm_probe’:
> drivers/mmc/host/sdhci-msm.c:3105:1: error: label ‘fw_detach’ defined but not used [-Werror=unused-label]
>   3105 | fw_detach:
>        | ^~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Please check other Sashiko issues also:
> 
> 	https://sashiko.dev/#/patchset/20261102-sdcc_scmi-v1-0-244dbd893051%40oss.qualcomm.com?part=2
> 
Acked, will address in the upcoming v2 commit.>> ---
>>   drivers/mmc/host/sdhci-msm.c | 213 ++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 208 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index aecd425bf095..da52a45203a5 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -8,8 +8,9 @@
>>   #include <linux/module.h>
>>   #include <linux/delay.h>
>>   #include <linux/mmc/mmc.h>
>> -#include <linux/pm_runtime.h>
>> +#include <linux/pm_domain.h>
>>   #include <linux/pm_opp.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/slab.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/regulator/consumer.h>
>> @@ -168,6 +169,9 @@
>>   #define ICE_HCI_PARAM_CCI	GENMASK(7, 0)
>>   #define ICE_HCI_PARAM_CE	GENMASK(8, 8)
>>   
>> +#define DOMAIN_IDX_POWER	0
>> +#define DOMAIN_IDX_PERF		1
>> +
>>   struct sdhci_msm_offset {
>>   	u32 core_hc_mode;
>>   	u32 core_mci_data_cnt;
>> @@ -275,6 +279,11 @@ struct sdhci_msm_variant_info {
>>   	bool restore_dll_config;
>>   	const struct sdhci_msm_variant_ops *var_ops;
>>   	const struct sdhci_msm_offset *offset;
>> +	/*
>> +	 * pd_names != NULL marks this variant as firmware managed;
>> +	 * see fw_managed detection in sdhci_msm_probe().
>> +	 */
>> +	const struct dev_pm_domain_attach_data pd_data;
>>   };
>>   
>>   struct sdhci_msm_host {
>> @@ -285,6 +294,7 @@ struct sdhci_msm_host {
>>   	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>>   	/* core, iface, cal and sleep clocks */
>>   	struct clk_bulk_data bulk_clks[4];
>> +	struct dev_pm_domain_list *pd_list;
>>   #ifdef CONFIG_MMC_CRYPTO
>>   	struct qcom_ice *ice;
>>   #endif
>> @@ -302,6 +312,7 @@ struct sdhci_msm_host {
>>   	u32 caps_0;
>>   	bool mci_removed;
>>   	bool restore_dll_config;
>> +	bool fw_managed;
>>   	const struct sdhci_msm_variant_ops *var_ops;
>>   	const struct sdhci_msm_offset *offset;
>>   	bool use_cdr;
>> @@ -414,6 +425,45 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>>   		 mmc_hostname(host->mmc), achieved_rate, timing);
>>   }
>>   
>> +static int msm_fw_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>> +					      unsigned int clock)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct device *dev = mmc_dev(host->mmc);
>> +	struct dev_pm_opp *opp;
>> +	struct device *perf_dev;
>> +	struct mmc_ios ios = host->mmc->ios;
>> +	unsigned long clock_long = (unsigned long)clock;
>> +	unsigned long desired_rate;
>> +	unsigned int mult;
>> +	int ret;
>> +
>> +	perf_dev = msm_host->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	mult = msm_get_clock_mult_for_bus_mode(host, clock, ios.timing);
>> +	desired_rate = clock_long * mult;
>> +
>> +	/* Find the nearest OPP at or below the requested frequency. */
>> +	opp = dev_pm_opp_find_freq_floor(perf_dev, &desired_rate);
>> +	if (IS_ERR(opp)) {
>> +		dev_err(dev, "Failed to find OPP for freq %lu: %pe\n", clock_long, opp);
>> +		return PTR_ERR(opp);
>> +	}
>> +
>> +	ret = dev_pm_opp_set_opp(perf_dev, opp);
>> +	dev_pm_opp_put(opp);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to set OPP for freq %lu: %d\n", clock_long, ret);
>> +		return ret;
>> +	}
>> +
>> +	/* desired_rate was rounded down by find_freq_floor to the actual OPP rate. */
>> +	host->mmc->actual_clock = mult ? desired_rate / mult : desired_rate;
>> +	msm_host->clk_rate = desired_rate;
>> +	return 0;
>> +}
>> +
>>   /* Platform specific tuning */
>>   static inline int msm_dll_poll_ck_out_en(struct sdhci_host *host, u8 poll)
>>   {
>> @@ -1253,7 +1303,10 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>>   	 */
>>   	if (host->flags & SDHCI_HS400_TUNING) {
>>   		sdhci_msm_hc_select_mode(host);
>> -		msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
>> +		if (msm_host->fw_managed)
>> +			msm_fw_set_clock_rate_for_bus_mode(host, ios.clock);
>> +		else
>> +			msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
>>   		host->flags &= ~SDHCI_HS400_TUNING;
>>   	}
>>   
>> @@ -1847,6 +1900,28 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
>>   	return SDHCI_MSM_MIN_CLOCK;
>>   }
>>   
>> +static unsigned int sdhci_msm_fw_get_max_clock(struct sdhci_host *host)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	unsigned long max_freq = ULONG_MAX;
>> +	struct dev_pm_opp *opp;
>> +	struct device *perf_dev;
>> +	struct device *dev = mmc_dev(host->mmc);
>> +
>> +	perf_dev = msm_host->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	opp = dev_pm_opp_find_freq_floor(perf_dev, &max_freq);
>> +	if (IS_ERR(opp)) {
>> +		dev_err(dev, "Failed to find opp for freq %lu\n", max_freq);
>> +		return SDHCI_MSM_MIN_CLOCK;
>> +	}
>> +
>> +	dev_pm_opp_put(opp);
>> +
>> +	return max_freq;
>> +}
>> +
>>   /*
>>    * __sdhci_msm_set_clock - sdhci_msm clock control.
>>    *
>> @@ -1892,6 +1967,40 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>>   	__sdhci_msm_set_clock(host, clock);
>>   }
>>   
>> +static void sdhci_msm_fw_set_clock(struct sdhci_host *host, unsigned int clock)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +
>> +	if (!clock) {
>> +		host->mmc->actual_clock = 0;
>> +		msm_host->clk_rate = 0;
>> +		goto out;
>> +	}
>> +
>> +	sdhci_msm_hc_select_mode(host);
>> +
>> +	if (msm_fw_set_clock_rate_for_bus_mode(host, clock))
>> +		return;
>> +out:
>> +	__sdhci_msm_set_clock(host, clock);
>> +}
>> +
>> +static int sdhci_msm_fw_power_state(struct device *dev, bool power_on)
>> +{
>> +	struct sdhci_host *host = dev_get_drvdata(dev);
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct device *pwr_dev;
>> +
>> +	pwr_dev = msm_host->pd_list->pd_devs[DOMAIN_IDX_POWER];
>> +
>> +	if (power_on)
>> +		return pm_runtime_resume_and_get(pwr_dev);
>> +	else
>> +		return pm_runtime_put_sync(pwr_dev);
>> +}
>> +
>>   /*****************************************************************************\
>>    *                                                                           *
>>    * Inline Crypto Engine (ICE) support                                        *
>> @@ -2550,6 +2659,17 @@ static const struct sdhci_msm_variant_info sdhci_msm_v5_var = {
>>   	.offset = &sdhci_msm_v5_offset,
>>   };
>>   
>> +static const struct sdhci_msm_variant_info sdhci_msm_fw_v5_var = {
>> +	.mci_removed = true,
>> +	.var_ops = &v5_var_ops,
>> +	.offset = &sdhci_msm_v5_offset,
>> +	.pd_data = {
>> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
>> +		.pd_names = (const char * []) { "power", "perf" },
>> +		.num_pd_names = 2,
>> +	},
>> +};
>> +
>>   static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
>>   	.mci_removed = true,
>>   	.restore_dll_config = true,
>> @@ -2566,6 +2686,7 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
>>   	{.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
>>   	{.compatible = "qcom,sdm670-sdhci", .data = &sdm845_sdhci_var},
>>   	{.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
>> +	{.compatible = "qcom,nord-sdhci", .data = &sdhci_msm_fw_v5_var},
>>   	{.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
>>   	{},
>>   };
>> @@ -2587,6 +2708,21 @@ static const struct sdhci_ops sdhci_msm_ops = {
>>   	.set_timeout = sdhci_msm_set_timeout,
>>   };
>>   
>> +static const struct sdhci_ops sdhci_msm_fw_ops = {
>> +	.reset = sdhci_and_cqhci_reset,
>> +	.set_clock = sdhci_msm_fw_set_clock,
>> +	.get_min_clock = sdhci_msm_get_min_clock,
>> +	.get_max_clock = sdhci_msm_fw_get_max_clock,
>> +	.set_bus_width = sdhci_set_bus_width,
>> +	.set_uhs_signaling = sdhci_msm_set_uhs_signaling,
>> +	.write_w = sdhci_msm_writew,
>> +	.write_b = sdhci_msm_writeb,
>> +	.irq	= sdhci_msm_cqe_irq,
>> +	.dump_vendor_regs = sdhci_msm_dump_vendor_regs,
>> +	.set_power = sdhci_set_power_noreg,
>> +	.set_timeout = sdhci_msm_set_timeout,
>> +};
>> +
>>   static const struct sdhci_pltfm_data sdhci_msm_pdata = {
>>   	.quirks = SDHCI_QUIRK_BROKEN_CARD_DETECTION |
>>   		  SDHCI_QUIRK_SINGLE_POWER_WRITE |
>> @@ -2597,6 +2733,16 @@ static const struct sdhci_pltfm_data sdhci_msm_pdata = {
>>   	.ops = &sdhci_msm_ops,
>>   };
>>   
>> +static const struct sdhci_pltfm_data sdhci_msm_fw_pdata = {
>> +	.quirks = SDHCI_QUIRK_BROKEN_CARD_DETECTION |
>> +		  SDHCI_QUIRK_SINGLE_POWER_WRITE |
>> +		  SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
>> +		  SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12,
>> +
>> +	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
>> +	.ops = &sdhci_msm_fw_ops,
>> +};
>> +
>>   static inline void sdhci_msm_get_of_property(struct platform_device *pdev,
>>   		struct sdhci_host *host)
>>   {
>> @@ -2665,8 +2811,21 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   	const struct sdhci_msm_offset *msm_offset;
>>   	const struct sdhci_msm_variant_info *var_info;
>>   	struct device_node *node = pdev->dev.of_node;
>> +	bool fw_managed;
>>   
>> -	host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
>> +	var_info = of_device_get_match_data(&pdev->dev);
>> +	if (!var_info)
>> +		return -ENODEV;
>> +	fw_managed = !!var_info->pd_data.pd_names;
>> +
>> +	/*
>> +	 * Based on variant info, differentiate platform initialization
>> +	 * for local and remote managed resource platforms.
>> +	 */
>> +	if (fw_managed)
>> +		host = sdhci_pltfm_init(pdev, &sdhci_msm_fw_pdata, sizeof(*msm_host));
>> +	else
>> +		host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
>>   	if (IS_ERR(host))
>>   		return PTR_ERR(host);
>>   
>> @@ -2684,12 +2843,11 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   	 * Based on the compatible string, load the required msm host info from
>>   	 * the data associated with the version info.
>>   	 */
>> -	var_info = of_device_get_match_data(&pdev->dev);
>> -
>>   	msm_host->mci_removed = var_info->mci_removed;
>>   	msm_host->restore_dll_config = var_info->restore_dll_config;
>>   	msm_host->var_ops = var_info->var_ops;
>>   	msm_host->offset = var_info->offset;
>> +	msm_host->fw_managed = fw_managed;
>>   
>>   	msm_offset = msm_host->offset;
>>   
>> @@ -2698,6 +2856,32 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   
>>   	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>>   
>> +	if (msm_host->fw_managed) {
>> +		ret = dev_pm_domain_attach_list(&pdev->dev, &var_info->pd_data,
>> +						&msm_host->pd_list);
>> +		if (ret < 0)
>> +			return dev_err_probe(&pdev->dev, ret,
>> +					     "Failed to attach power domains\n");
>> +
>> +		if (ret != var_info->pd_data.num_pd_names)
>> +			return dev_err_probe(&pdev->dev, -ENODEV,
>> +					     "Expected %d power domains, got %d\n",
>> +					     var_info->pd_data.num_pd_names, ret);
>> +
>> +		ret = sdhci_msm_fw_power_state(&pdev->dev, true);
>> +		if (ret) {
>> +			dev_pm_domain_detach_list(msm_host->pd_list);
>> +			return dev_err_probe(&pdev->dev, ret,
>> +					     "Failed to power on domain\n");
>> +		}
>> +
>> +		/*
>> +		 * Skip initializing clocks, regulators and reset in kernel
>> +		 * for firmware managed platforms.
>> +		 */
>> +		goto skip_resource_init;
>> +	}
>> +
>>   	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>>   	if (ret)
>>   		return ret;
>> @@ -2786,6 +2970,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> +skip_resource_init:
>>   	/* Reset the vendor spec register to power on reset state */
>>   	writel_relaxed(CORE_VENDOR_SPEC_POR_VAL,
>>   			host->ioaddr + msm_offset->core_vendor_spec);
>> @@ -2917,6 +3102,12 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   bus_clk_disable:
>>   	if (!IS_ERR(msm_host->bus_clk))
>>   		clk_disable_unprepare(msm_host->bus_clk);
>> +fw_detach:
>> +	if (msm_host->fw_managed) {
>> +		sdhci_msm_fw_power_state(&pdev->dev, false);
>> +		dev_pm_domain_detach_list(msm_host->pd_list);
>> +		msm_host->pd_list = NULL;
>> +	}
>>   	return ret;
>>   }
>>   
>> @@ -2930,6 +3121,12 @@ static void sdhci_msm_remove(struct platform_device *pdev)
>>   
>>   	sdhci_remove_host(host, dead);
>>   
>> +	if (msm_host->fw_managed) {
>> +		sdhci_msm_fw_power_state(&pdev->dev, false);
>> +		dev_pm_domain_detach_list(msm_host->pd_list);
>> +		msm_host->pd_list = NULL;
>> +	}
>> +
>>   	pm_runtime_get_sync(&pdev->dev);
>>   	pm_runtime_disable(&pdev->dev);
>>   	pm_runtime_put_noidle(&pdev->dev);
>> @@ -2947,6 +3144,9 @@ static int sdhci_msm_runtime_suspend(struct device *dev)
>>   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>   	unsigned long flags;
>>   
>> +	if (msm_host->fw_managed)
>> +		return sdhci_msm_fw_power_state(dev, false);
>> +
>>   	spin_lock_irqsave(&host->lock, flags);
>>   	host->runtime_suspended = true;
>>   	spin_unlock_irqrestore(&host->lock, flags);
>> @@ -2967,6 +3167,9 @@ static int sdhci_msm_runtime_resume(struct device *dev)
>>   	unsigned long flags;
>>   	int ret;
>>   
>> +	if (msm_host->fw_managed)
>> +		return sdhci_msm_fw_power_state(dev, true);
>> +
>>   	ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
>>   				       msm_host->bulk_clks);
>>   	if (ret)
>>
> 


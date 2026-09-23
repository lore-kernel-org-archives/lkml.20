Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31EF480335
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159037; cv=none; b=JdVHSx2udzkKRsEfUkRr8ZAbrtQ8Fs5fzUPr5hABW5NT2xw+s7ZONYtXCXuVLmoXk+FTFTWeysAeeS+q2jQxJDu4WEy8+vBUxvMwxjh1PolcnXTDDzff7I8Z8TlPdqer+Zf1S+cUL9IZ9XoQS1z9Cwc73m23W6tvFYwypLiqNFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159037; c=relaxed/simple;
	bh=I36qGOuxVt8F3AlJqr9uyF/OJ9zasBeEUQSsZkyEIs8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K6muCZ/omfYDPpnoBLENLaa7Aaw4PhN3V/2tIuhxwIQqtsrNH4RL1nrXB1AWaJM3AbmHpp//bnPSDEksANXFMrV6rzAXhomYTE0ty0nLT1CZlQJDqtXVO2r4L3HLVv2OE7QC1Tmd8Ss77GDghnFU/JzOOEhsa0VQzMcBSf5FO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TaRJB3UV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giJrPH7U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TaRJB3UV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="giJrPH7U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2fDG2821236
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqAd5JNFcVVUGGHw+F5n3YPtLs+f6/Hd4jYN9BmnscU=; b=TaRJB3UVujqW9vZ+
	voiYv8TnbmOdQJMJ2l/dGQPlR7mYByH0ncy5tgTWY9lxdqGQF21m8KsAWFoCVrbO
	jK9qM/nQPGluIb6oUi+KCLZhIo6r+RNSE79lWPiDv0Z/jhWnASyjliAKrW7FfPFT
	CiaP7R9TPfVsK1QqK+RCRb463A5GnEnH13R/GjGSTnYk14LRcRGcH9LtK39Ht8+q
	kDpp2V6IRUFAhCzgv6Sr46WFTX12CMLQfrLyJyEPtREeJSAEAuUbkYsDxwnNaaoH
	zDCIWWcDRaEk9W5PGnIBVIa38Vko1S1W6zp12LCsyjtm9O4LOLLLn1SmakLHsYxn
	luB1wg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwara7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:23:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e80ce3597so16578316d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159033; x=1790763833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqAd5JNFcVVUGGHw+F5n3YPtLs+f6/Hd4jYN9BmnscU=;
        b=giJrPH7UudZuLrU30o4Qg+cST/Rl195bccZ971HsngxtVlCqnLf318eChlSeoRQYv2
         SC67w2v/zEsmJDWKhMI6gZW2gBepJU1zunBI0dUILQD6qex6AJDKzsGPi1iKomiEm8b8
         xK60s2oo3ZJskERu5BFaLKMbirfg2O+RO3a7GnyhHzxnSc5DN+sdiBGRi8x5ir6CMWE7
         O2zXdo0vK6jhgeibIxFlKFZkOXMoqsWRTAgYBdDx11PAyCrsb7FvYO3bErtQliiho4GJ
         lOUcvFWaia/4WUALkre9T3elZjPViAR7J8VDFzKjR2Ww8f6HHM0/u2NfzOXCqumrHKTe
         IhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159033; x=1790763833;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqAd5JNFcVVUGGHw+F5n3YPtLs+f6/Hd4jYN9BmnscU=;
        b=Vo4jdky4mqKhr3kzAhvmGK0/aGYQzhZGv+yXmleOwI6Yry3M980uF/08YBxF8gIhwa
         AWLFpqqHuUIA+5x3ABUCC/8SBHJS3soRzajtixC+mWltEF4vnBm84yk+I7DjYBClRnu7
         4+Lt6AJQvaSmWiK+vCdG9b1cUjE4vvN6Cxolap1ZKKqnehHCPPLnQPIZ/0jx2Y+d2/O4
         j22+y5mNoi7FI6kDO3DgZi7AfEEU4CqYRel5Zv70DroZiDwePs6/6+0xE5ghM0Iy4Anv
         r6WRqJidTUks9OQ/y0tEh691n46fGKdCE2tASUCm/qbmvCgqILu7uTQgkY94b7vwgivH
         XaDA==
X-Forwarded-Encrypted: i=1; AKwUvBw1pbFRY8Q6rCbtk4jSG+Zcfk/Qzu/C2OvUgvTtKrnBluU/fozhSD9gLF0WWZDCRBXTK7GiX5X58292GII=@vger.kernel.org
X-Gm-Message-State: AFuF++mCercS9vhEZBYsIGiwvSX/T7saD6CFySOQi0x3jE434Sjk9v6h
	1SBR6kyozmmhXxCIbu41pvQyKsK8yA7BPxygvVaSs5Fazw4lIlQGS2IBoOd8opNCekind9HKodZ
	ed2ff3wXhRF66Nt4UHA8UM5VdMB1t2AsBpa83QvxkdG3BZWjjBKC33PXXwqzCf6eBdcQ=
X-Gm-Gg: AYBFou3Mvap4j5csvY6Qpgur/T1pB5gCZXbM/Ntns9IokjU7jS8ET04/mdTtqWZqHI1
	iTElV/TjcSuMavXAEgm2U2MNNPpIpcALcvS21JIvG3tktbDsi1YeZuTCPLQ1Fiq46u83D+g6fNR
	m9/ZIYVdldHYi2vx3zmaXJrfEcdePLbNyJgipYk7NuzlUq8fUCt/OxdWPjQnMfN7FT4oVrLQoNp
	S6oM+wwqb7RfvpewCrA165lua7cSnznsbZS4rTDbiJ5YoNL1XhHlDUr227j0TEmyvFU6VB79jKq
	b6xoG4EJbMsmP9zs8nLBswHeAgOdTD0dyfbyuqVdIaDAO29nR1u72fgMZDVA259Uf4YEclJcZ7v
	0vyUH3kxnsBcjmSkxB9PeWlMLBa8PMaYNucqueq72LX3I6bR3ldd4c6LsNv8YnF7skMveoZKVuN
	U5G4C6EzCpwFoNHl3cfQZhi718dTVs8GJRbLrJ7uLA1g81HyGH62lc2GJY2UsNIu5YH3x/2/PHm
	oo5DA==
X-Received: by 2002:a05:620a:29c6:b0:93a:34e2:b7b4 with SMTP id af79cd13be357-93c250971a1mr331001785a.15.1790159032955;
        Wed, 23 Sep 2026 03:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:93a:34e2:b7b4 with SMTP id af79cd13be357-93c250971a1mr330999685a.15.1790159032492;
        Wed, 23 Sep 2026 03:23:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6610a6sm86540666b.39.2026.09.23.03.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:23:51 -0700 (PDT)
Message-ID: <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:23:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX3VyEg4IozBO+
 spTjeaM3SR6B1qwTvbiQy/KgNtw5q9yTI73v4f3lWp7nLnKXvu1HkcuBdTUfQ5/GC9BwslpCe0a
 IbPmafTKb/tQRhnuqSrZsqQFlv2l5EQCDwXR2g69EnEb3HMAS5/tRO/dngfzR1a3S7yoH4rK98W
 PyM+ZzGi3mZIN/y4dTMujD1MGuVhwll21RYuoHW+QDnvpnIaeUYZKFdiQva8q7hte9FXQUKHbkc
 eUyf5QAgOZ7nzGhZ81BlEeVcHQFDD/+KJTH7xD6yUHNWSabs7uSoHe4KaMhDs1PMl+EGzhfEvTP
 Aglu1o1mqGmTMeTPaW+ti7GOBTbxeeqBnWbnp8RHpvOzec9vFjmSgYR5ZmnSAH/AO8/g4z5PNC7
 oxaX1ooVYpjKIhwdkgobVWznPhrKgmPNHbhTXL0hkJGbc8OL81Bycf952CGCWUP9GhrU1g4icgF
 57N4a4J7ZejYQXy8wCA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3a8b9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=IBvwG5UjtWMghLoup9EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: cWSojSF4rcwZI9fcOeO7vzj5spZLl253
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX3qWiMK87uCxo
 2vdkSPxy+Vnz64IM73u8bYBhgc1EKbgd+aoUtzMbVxENzEGDyWw5M59bu8y3qzdxf6NWyZHrJj5
 ABgrkYBk0YvYx99SbYjYr5a1EBTt92U=
X-Proofpoint-ORIG-GUID: cWSojSF4rcwZI9fcOeO7vzj5spZLl253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Hi,

On 23-Sep-26 11:07, Sudeep Holla wrote:
> On Mon, Sep 21, 2026 at 05:19:45PM +0200, Uwe Kleine-König wrote:
>> On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>
>>> SCMI client drivers already describe their bus match data with
>>> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
>>> SCMI device tables. As a result, SCMI modules do not get generated module
>>> aliases from their id tables.
>>>
>>> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
>>> visible to modpost, add the corresponding generated offsets and teach
>>> file2alias to emit scmi:<protocol>:<name> aliases.
>>>
>>> Use the same stable alias format for SCMI device uevents and sysfs
>>> modaliases. The previous string included the instance-specific device
>>> name, which is not useful for matching modules.
>>>
>>> Assisted-by: Codex:GPT-5.5
>>> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> [...]
> 
>>> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
>>> new file mode 100644
>>> index 000000000000..1b4ccfa9dcc5
>>> --- /dev/null
>>> +++ b/include/linux/device-id/scmi.h
>>> @@ -0,0 +1,17 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef LINUX_DEVICE_ID_SCMI_H
>>> +#define LINUX_DEVICE_ID_SCMI_H
>>> +
>>> +#ifdef __KERNEL__
>>> +#include <linux/types.h>
>>> +#endif
>>> +
>>> +#define SCMI_NAME_SIZE		32
>>> +#define SCMI_MODULE_PREFIX	"scmi:"
>>> +
>>> +struct scmi_device_id {
>>> +	__u8 protocol_id;
>>> +	char name[SCMI_NAME_SIZE];
>>
>> I wonder if you tried to keep this a char *. ISTR someone did something
>> similar recently and they claimed it worked. That would get rid of the
>> artificial name size limit and simplify this patch.
>>
> 
> I agree with this. 

Ok, so I checked and no other include/linux/device-id/*.h file
defines a foo_device_id field with a type of "char *" and
then uses that field in scripts/mod/devicetable-offsets.c /
scripts/mod/file2alias.c .

2 device-id/foo.h headers (dmi, pcmcia) do define a "char *"
field, but then do NOT use that to generate a modalias.

So scmi_device_id would be the first to do this.

Despite that I still gave this a try. Things do compile,
but it results in a modalias for the scmi-cpufreq driver
of: scmi:13:(null) and auto-loading unsurprisingly does
not work.

TL;DR: using 'char *' instead of char [<max-len>] in
a device-id struct field that is used for modaliases
does NOT work.

So I believe that this v7 is ready to merge as is.

> [...]
> 
>>> @@ -1491,6 +1502,7 @@ static const struct devtable devtable[] = {
>>>  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
>>>  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
>>>  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
>>> +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
>>>  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
>>>  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
>>>  	{"slim", SIZE_slim_device_id, do_slim_entry},
>>
>> I wonder if this is supposed to be ordered alphabetically ...
>>
> 
> This may be hard, just the best effort unless it is cleaned up first.
> 
> Anyways, I plan to send PR by end of the week, so I really need this
> in by tomorrow worst case. I am bit worried if there will conflict all
> over the place in this file as I know couple of other patches that may
> come via other trees touching same entries(one is SMCCC)🤞.

Thank you for the ping, as mentioned above I give Uwe's suggestion
a try but it does not work.

So I believe that this v7 is ready for merging as is.

Regards,

Hans



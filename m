Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59463AA504
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422891; cv=none; b=JlcyWA7wDi60GXQS8iWRVFJDvH9uE39CEsMGHZwB89ufa00tEft68FOlgqmbhvNQMcruK0EHXZ8GwZIcxuFtbZOHE7kvsu6c/MmC3fBPzVVxR1aeetISy3F6Gh6A5uthN2FAmnJ4M/NxJb+6ZHVRx6u93oc7U1aRhWSwsIF2xEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422891; c=relaxed/simple;
	bh=rGBBt0AxbtG8LzlxBHHSLHwFFdkl4bkEFjoyJFndGdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNRieQFDP5Lo/fdYmdny4quZd9V+7jdSwo6e6oGZCkuiftERMsXcR7dXm6ex2qcg/uJloI6CGcUhtnta+baX0MpTkom533rKaHbM6SWCFjKLDXG9F6Cep2vyf3cfSVfCl5pO8mv4r/aVKDEEGr8M0cJtMFLfBj6As0tos5B9tYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2m2scho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iewSoW8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2m2scho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iewSoW8Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68382U453549521
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/twb88vPrIOizB1yi/dohC7S8ivyVgg3mYajZILtPNk=; b=g2m2scho9d8g4DQ4
	vhNAbVQhjvIclQC7VYCIav95zlXkbCE+yzy+yE52d9T0Bscjn5NKwmxHUfV4WZA6
	9f4aAIP8akF3YQr3RE32GW2kn/KjdiAaHnA8LFHflrprgYMA7C3RvTb3lUwguZkN
	TTKKyoYZW3/1FN9hMuk2KoDF36491iOLCBlTx+vi26dEb1NAYyANIMAFCZr/nRFJ
	D8o38d4TTxXrIAv+wJwnGD4urk3vQ03fe2EQnZF4psxhW5T2t7Xv1uHx36pN+WlH
	2qtKNqaCpCZ8/fzvf4kkiKw0Ryjybpflw/aBX6Qm1blQZHDUTLBwQ3Mot/f9dQmO
	6Lgqxg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m00r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:08:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso25888795ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422888; x=1789027688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/twb88vPrIOizB1yi/dohC7S8ivyVgg3mYajZILtPNk=;
        b=iewSoW8YAdKRGJTfX/d20OVzGz+SGix6zO07maazlEm2ghXvDYAqL/huGfkO5EnX5U
         q3fKp/MjmqEvg+ggS38489bjbVgnDgJ9JoF62S+30c8x8oFnVd+v7EEQMI0T9tcgCzZg
         4iqWHB6FLIXFLjY+BWhrzz//J7yVePdI+jhbPljHdJXZKN1Rcw+HxCh+c6CWMu6ljPYy
         l1bY/AUZhGXRu15fZEQUYgNtKd8zUz/rEB3HXIhdlsfx0Z0Qz/nOgIdwMdoR31jZg9Yc
         j7DuBxmitHrrkmBUzIYCjBH7OS3+/e6CH/Y6yPyruOWTx/XhjXYxBuaUxcLNta2TLwlV
         TK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422888; x=1789027688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/twb88vPrIOizB1yi/dohC7S8ivyVgg3mYajZILtPNk=;
        b=PU+n0CR6vUjGvgE9aMycVq/i7bh6ZKCpe9MH3xl0ZpGK5VROD52YzBBr5bcLZqoLl2
         gOYTPGW95HsVoFHx/nDphpf5TQH81Ej3OCOE4l/Lgb2bbssVjd+PpCEBkMjtQbWJnG5R
         lu6USXHuBU1F1uaOu/w8nbPjzHygqvWzgC9iMiEthg2q6bdZ+b/cnwB55oVrPyP0MJ3Z
         xCyB9MuvcdL/vJpgf1/VLxGAZZSPBIri0hu2MtCErGF5a6hcfXdANEg5fGR/DyDD9sJ+
         omLDr/ABHq02w7F1Q1IkMz/yCEKLtL8DYLH4jV49TIt3e4w7p8msTkZmQBlb9Ur/D+c3
         QMjg==
X-Forwarded-Encrypted: i=1; AKwUvBycHVlEQZI/lZnZ4dTqTVK75OypE3s6Qk3A4Efz9x+5CSE7WXHiWyoqDcbucH+9CGn7UGyB2BcjV8ZhpEA=@vger.kernel.org
X-Gm-Message-State: AFuF++kQUupywakF/YGJ0yC0ht5pgYq+ikceBAcHa24mCxgJo4nKELNL
	WajZaAPTqq7XkHRcmYSdI2zAhqpcXKj00VyN3VP+aDBggKb/SJZ748C1KmadDyIEjgYmLWeW8y2
	2a2uZpspJAyfrkEUfbGU5Be9DjKBgF3MBstck/RtbvLiuo7Yb4BpxVoMdkMaNZhidbwg=
X-Gm-Gg: AYBFou3YXVLFkT9cymYyRpb5Wf4VC6gy8yvYQPScejNWagNnA6XSSOAky5dhkoJvKUE
	XTR6oOwJO3T7tK4AjVGVXl1x1U9VL8V7mVKnsz+4biQLnvUzdxKiN1fBlB37YCih3NDYTM0W7HC
	V5oj7GgoXEG9o8k/lfSkfAHMfw4/xZkUpuLoj7DtpCo+bkuBl+QVTbdoR862jQClwGxyw2NdrQo
	wAghK6qXbZszVOyvEtUrM6aXVeglL6IUkLrXhNjg+/0TETOmVWOSsM5Q3anizncB48ahhJZWhuN
	Xy1ly8kNlX0/j8DO9qP5zX0fNUv+1Y6aeb9WMNrc5+52RHm8PG2xwyUHWSNzTzzspYqg8+K18R+
	Eakrlsg/j72cKxa3d4w==
X-Received: by 2002:a17:903:3243:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2daec71752emr159035735ad.13.1788422888081;
        Thu, 03 Sep 2026 01:08:08 -0700 (PDT)
X-Received: by 2002:a17:903:3243:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2daec71752emr159034745ad.13.1788422887485;
        Thu, 03 Sep 2026 01:08:07 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafec27963sm6060365ad.49.2026.09.03.01.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:08:06 -0700 (PDT)
Message-ID: <1c4c197c-18fc-4209-b5ee-4ded811cb22b@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:07:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/15] arm_mpam: Fix device_node refcount in DT
 resource parsing
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-5-ea6397bead59@oss.qualcomm.com>
 <e6d4bb93-66fa-4149-985d-87d895081ea0@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <e6d4bb93-66fa-4149-985d-87d895081ea0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vpePj4zzBJNEbIMvrRp34jDR2k07_TQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfXxOOwEGstqzvc
 z342ieyuyyKN/xR++QX1Rq91hjnBLqwqvnz1opkpifbZOq/9/OrcirohnDJgMq7jNaozXGtnwq1
 qKELjtPyFph1x8nRlk16NVB+AG8VMvQA2dwVyq6GBc/qNsKoYA1I31OxkGJJ4z/zgJF///ATZ1T
 Bml+zHuXzUI+rVZHQ7WUsgKkZnxD7IexoSd8ZnRlmZutUF+xGeEaWX3GuFN5GhOKEaOHt+QS0ym
 QofVjcpVcMo0R4f6BGalmfFgUa6pd0AlqV/j/rghQAdsXNuD8uzIKz13HUH5tf3XlDL5Ni3uw/o
 O/ncl6jmudOS343gxOEKeUT5f698ebxZzkBG4BnIeMd28QYF5mlo1EKZtTbJqhpHyrW597Qqvn1
 /agITuz1PnBL5k/EgDDtmvDgS+f+VAcnAgSIq+Akb4Kvi4nVgzXOGmPihuKZQrd+fCAdbyHvuKC
 rOp4uqKVyM+OT4Jd2NA==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a992ae8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=kWxAhM39eUj0LVJEsOAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfXzgea0YYHZvvQ
 TLrRCiKE8Ac31pyj8OqIknpW9uTVLBtRMsN0rhCK/2g/AcjVuF1KsstUw/9idEuEQKUX/dP+deU
 4R2mlfqZaKGAjAdKC3/6nX1adV8ixIU=
X-Proofpoint-ORIG-GUID: vpePj4zzBJNEbIMvrRp34jDR2k07_TQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030071



On 9/2/2026 9:29 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> When a cache-parented or memory-controller-parented MSC is probed via
>> device tree, the parent node was assigned directly to a
>> __free(device_node) variable without incrementing its reference count.
>> Both the parent and the cache/memory variable are declared with
>> __free(device_node), which causes the compiler to automatically insert
>> an of_node_put() call for each variable when they go out of scope.
>> Since both variables point to the same node but the reference count was
>> only incremented once by of_get_parent(), the node ends up being
>> released twice, causing a refcount underflow.
> 
> Yes, looks about right: there is another assignment to both memory and 
> cache, they call of_parse_phandle(), which increments the refcount, so 
> we need to do the same for the direct assignments, to get the free'ing 
> done consistently.
> 
>> Use of_node_get() to take an explicit reference so each __free variable
>> holds its own reference.
>>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 

Hi Andre,

Thanks for the review and the Reviewed-by tag.

> ... though this should definitely be squashed into the respective DT 
> patches. Feel free to do so.
> 

You're right that these fixes should be squashed into the respective
DT patches. I kept them as separate fix patches for now because those
DT patches are based on James Morse's and Shanker's original unmerged
work — this way the changes I made on top are easier to review in
isolation. I plan to fold them back into the original patches once
James and Shanker have had a chance to respond.

> Cheers,
> Andre
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 975ddab771b4..559fa09128b4 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -280,7 +280,7 @@ static int mpam_dt_parse_resource(struct mpam_msc 
>> *msc, struct device_node *np,
>>           type = MPAM_CLASS_CACHE;
>>       } else if (of_device_is_compatible(parent, "cache")) {
>> -        cache = parent;
>> +        cache = of_node_get(parent);
>>           type = MPAM_CLASS_CACHE;
>>       } else if (of_device_is_compatible(np, "arm,mpam-memory")) {
>>           memory = of_parse_phandle(np, "arm,mpam-device", 0);
>> @@ -290,7 +290,7 @@ static int mpam_dt_parse_resource(struct mpam_msc 
>> *msc, struct device_node *np,
>>           }
>>           type = MPAM_CLASS_MEMORY;
>>       } else if (of_device_is_compatible(np, "arm,mpam-memory- 
>> controller-msc")) {
>> -        memory = parent;
>> +        memory = of_node_get(parent);
>>           type = MPAM_CLASS_MEMORY;
>>       } else {
>>           /*
>>
> 

-- 
Thx and BRs,
Yin


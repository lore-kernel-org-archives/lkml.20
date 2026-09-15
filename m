Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542537F8AF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454984; cv=none; b=CW5k05N6kIXHrdwjXM2T6CY5sj7pzFzjYy6WJ5mtHDo+ZKVS3cYi4ujDjnwS4B/yzR8kaJW9Sa2UbiKXYSelF6K+wIHLM23V9uxLzGXI1CI3ZiKpwqDWnphWpHjz6S+J0oz2raeE4pdwBJ0EszIVwOKkBLNwznHVr9Ihdi8FRN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454984; c=relaxed/simple;
	bh=ZbTAF2j0r2Op/LAAPfyyyvdgIIrZok0Yq0iZ9vaa8t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuVOuoZPiYFTp/IZPKpgKBpwLZcikWGCCt/JNmlltKEMgmL55C0PRMh9eHJq8R/p+kO81C+SJdd2zWCgMoJnEj1knHmwSWAoWdWMBA5YAH6jWsxF2NnSMmPXRYV4hVkX6wDfavZ/S266Tk92qEg5HIyvR+q8xTUi5HeiHKLLZVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNmVBalg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtWPHoJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNmVBalg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtWPHoJC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZckA3824059
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Nc4AZwLTj1I7GRxfu534U6zn9icG3vx3KriT4jFrAs=; b=gNmVBalgTx95N20z
	ls/kWo9gIk+XQ8zgF73UzVRMFd2JS8yeeHmAPH1mQuIEROmJ+dupukvO539fHm2D
	eiTrm/TfwukpsAbuSH3+KCaypBEgXxxPBAbhtxi0cw2UDvefnmycL37aaoTP2oFo
	yHxW/p3DORQoaFFvAyfXD37WaAVLe7qZwthRCbNHRkWa42Ecuxvvjrttt3VudYuk
	MEowVnZvfpcxlco8L9+CqZ1s77K3hFLiJy5BrecSs5pv9Ywjua3I5XMzth6CSy8w
	Iu8UGtMC1eIaq/u+Y+uLnf7pKVRq+TyqR79/MpPyAFn5NYE2fjHWjLN9FMPITvAM
	2ynUAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41tvp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:49:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3002113a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789454982; x=1790059782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Nc4AZwLTj1I7GRxfu534U6zn9icG3vx3KriT4jFrAs=;
        b=jtWPHoJCJdvyJ0vmiYXnphe95tAIGX2COFK/V0jByaCKAF6shHoCG2QYtSP9OD94qQ
         vY1hNeeuxyhmMoyMRVyJEPlSQGMg9/SV5eHfcf9VZTQVI3TLjQtCQpU+w+Upe5N8xbrf
         uTJSZHKh2dgKeajQFWxl3Vfoh2xc0VGI8P3kQPP1DbILvP/oqTnESvh3uMKZc0y/Jv8s
         NztI8MbZ9wDoL4FADzCg5czti4xl7/8eRx+QmnVTqOaZgiy+Sg8Sucs5fnw6d/81dNar
         NYAPXIB0RhbrK/yinAaUEH+uZxB3IU0MXuuhlMLRELNGaCePPxSkXf8qaNXlw7D6UcHd
         kfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454982; x=1790059782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Nc4AZwLTj1I7GRxfu534U6zn9icG3vx3KriT4jFrAs=;
        b=gOOMiQFXUmXqBkIM5AnVhoIz5y1BgSTpq2i3+TqtkgWTPM3gHN1RdNuQHh8oZvttHC
         errHpK8+j5TD/pZ5MaRE6abXN0yCUODr1iKRlO4EXNcy97ToYAyxVuTPbxKZ/NhiRR/I
         uFd6RIxjbBfK1Bn8vMVtjJsg1nYAQLnWG5rxEPYfRuZhQO5dGdtGvwwZ68ptPdJKwkuZ
         iTO8uokgJAIzA+LU92pBR2nFzlrqUfvXy9kj3HMv4DjoYAn12MIeBlWzpPHxopj90Pto
         t9VjS9t8dZ7ISwi/lbad6lab1w/BeSwuGxdAGXLUKLN/+N3RdZe6WvDGLYpSD84t+4et
         M/AQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv39al/TQ0Ujsmozfu4IPAR6m85AkfwY3dMe50r6/jfiqnpnkAMxyRBcXYM9jh4MzBlIk0xYPruWJL2YU=@vger.kernel.org
X-Gm-Message-State: AFuF++nr+K2vtD8q++Kao5T6Jbqurj1apMvG7nOvoJMeZN3dN9VIMeSM
	rLj6OlY2BxXvGB0zAT9PTGY7eefn6mGCFCIyvNfkcYwbZ8tsD5TsgfXYpLLsrjQYLjVr8VFb/AQ
	r8VDU3H5Y38gy7uF4qyrNLqsnLQOBaE1hq1NhZQ6BHjExlBBuiiyHgJk3BnJlVayYjO4=
X-Gm-Gg: AYBFou2G+PkUHajopbhJwQR4esWjo9PbsirqIZG5JsoXc9ATIcFrcnr/Q79VyxR2gv1
	Fd6nDY2uI5tIelVZCLZLGeRCkJZ0z7TISt7dg1/woVWG2Gpg2Mv3joa4NOhTeHVTLaWQ+PS4LHX
	tbDxZCI+sfNS0gGH5tRUg4EgsoJGfb7FmNfEDTMcgpNam7F5WN9/RIRWrWY+E3zS4uRCz7c+P9L
	4tXTZhvdJlfncWidim9PQtigMJeycWEdbSpjsuSEewov75j1SmXYPQ75ARSONIcS6mvColPeYYd
	zZWz50aLnbOsPdeRz0y/WNPcJv0vdaTn4bB0cD7wPp+9rhuEXaIByAsqj2wgVOTxE1XByPvsV9f
	K3m0YuWRdaUhV2Dm5TjLR/PI8AdiJT9MP/ItRkeuAsw1oRFv5i5jGxEtsxzilxpc=
X-Received: by 2002:a05:6a20:a120:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3db404b735amr13965343637.3.1789454981789;
        Mon, 14 Sep 2026 23:49:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:a120:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3db404b735amr13965269637.3.1789454981337;
        Mon, 14 Sep 2026 23:49:41 -0700 (PDT)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6529a71sm6207225a12.5.2026.09.14.23.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 23:49:40 -0700 (PDT)
Message-ID: <a340505d-9495-4f68-8ed1-c7e8772c28e4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:49:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
 <317682e8-63e7-4047-9106-deea7bf96388@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <317682e8-63e7-4047-9106-deea7bf96388@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX8jpqjKifmgn4
 MSua2npZ1se9y0LL+/f/5SNe+jA/l1AhklfZSBNUMcJ0NKu1TF6j4wzCtpcCfmJ0esmoryGLWuo
 wvPWJgNWrFRImchH+4fzZTC0mjnWIh2AqsQFkJOhU+z9s0K9PbmN63gIobIdgx8+v8IfeAaXMgZ
 OciOlMOukXat3i3I/7mcK1xP0c/G1XlVfpXnnYfo6WsA1y8Xbj2D71Yzm+dMqE5wkNmk5H6jiz2
 nTCZo99rLbzXvLrUHbJyje2idzkaQrNUuTxiqJu6vc2fjNs9Y61odWMy3/djq4kj4Ba/xed5VDL
 wrzz1wvyyUA0G5FH9uPrKzPN9bZKVoSwg8CkgyNxUR8UCMsXg35wQYb3zbieDQWe6ItRyPB0kl8
 CPyAm54FxT9OZWKqd/E5p0INMKrJHXZHuM7/i3ZnwCPqdiT4/XlYZfIMnNgfMiNbQhWLSrc2ATb
 eUbWyt1vPei1HdY9gmw==
X-Proofpoint-GUID: lR3u11P9iV0yM5GeG0Txxt0lJlbD5Ebu
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8ea86 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=oVi2SUvWo6HSE3DLJdEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: lR3u11P9iV0yM5GeG0Txxt0lJlbD5Ebu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX4l7pPtfj41FA
 fNl4+kWEIa4vhNp7OfJ+KJP8uACmsc/556I5owWpzq5jiUYqR/TJVYtYlDq0auWYCmsQ7AL7iEZ
 CG0FE40tybJFGFc6vnkHyIg3MTLgjQI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150096



On 9/14/2026 8:26 PM, Andre Przywara wrote:
> Hi,
> 
> On 9/14/26 11:37, Yin Li wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> The MPAM driver identifies caches by id for use with resctrl. It
>> needs to know the cache-id when probe-ing, but the value isn't set
>> in cacheinfo until device_initcall(). Even after device_initcall(),
>> the cache-id is only available if at least one CPU associated with
>> the cache is online.
>>
>> Instead of making the driver wait, expose the code that generates the
>> cache-id. The parts of the MPAM driver that run early can use this to
>> set up the resctrl structures before cacheinfo is ready in
>> device_initcall().
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> [ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; guard the
>>    cache_of_calculate_id() declaration with CONFIG_OF to prevent build
>>    errors when CONFIG_OF is not set ]
> 
> You can shorten that part in square brackets: doing adjustments due to 
> rebasing is surely implied, and you can shorten the rest, like:
> [ Yin Li: guard cache_of_calculate_id() prototype ]
> 
> Speaking of which ...
> 
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/base/cacheinfo.c  | 17 ++++++++++++-----
>>   include/linux/cacheinfo.h |  3 +++
>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>> index 9f9c72727a05..f75e7f64038b 100644
>> --- a/drivers/base/cacheinfo.c
>> +++ b/drivers/base/cacheinfo.c
>> @@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node *cpu,
>>   #define arch_compact_of_hwid(_x)    (_x)
>>   #endif
>> -static void cache_of_set_id(struct cacheinfo *this_leaf,
>> -                struct device_node *cache_node)
>> +u32 cache_of_calculate_id(struct device_node *cache_node)
>>   {
>>       struct device_node *cpu;
>>       u32 min_id = ~0;
>> @@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo 
>> *this_leaf,
>>           id = arch_compact_of_hwid(id);
>>           if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>               of_node_put(cpu);
>> -            return;
>> +            return ~0;
>>           }
>>           if (match_cache_node(cpu, cache_node))
>>               min_id = min(min_id, id);
>>       }
>> -    if (min_id != ~0) {
>> -        this_leaf->id = min_id;
>> +    return min_id;
>> +}
>> +
>> +static void cache_of_set_id(struct cacheinfo *this_leaf,
>> +                struct device_node *cache_node)
>> +{
>> +    u32 id = cache_of_calculate_id(cache_node);
>> +
>> +    if (id != ~0) {
>> +        this_leaf->id = id;
>>           this_leaf->attributes |= CACHE_ID;
>>       }
>>   }
>> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
>> index fc879ac4cc4f..c33bb3c8bd63 100644
>> --- a/include/linux/cacheinfo.h
>> +++ b/include/linux/cacheinfo.h
>> @@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
>>   #endif
>>   const struct attribute_group *cache_get_priv_group(struct cacheinfo 
>> *this_leaf);
>> +#ifdef CONFIG_OF
> 
> Why is that, exactly? First IIUC it's quite uncommon to use #ifdef 
> guards around prototypes (unless they are stubbed without the symbol 
> defined). Using types protected by those symbols if certainly another 
> reason, and it looks like this would be the case here, but I had no 
> trouble building the kernel for x86, where CONFIG_OF is not defined.
> So can you share a .config example (or give a hint) as to where this 
> fails building?
> And if it does, wouldn't it be better to always include <linux/of.h> in 
> that file instead? I think I see a similar pattern elsewhere (rfkill- 
> gpio.c, sound/ac97/bus.c).
> 

Hi Andre,

On the #ifdef CONFIG_OF: I also verified that removing the guard doesn't
break the build. However, since the implementation in cacheinfo.c is
itself guarded by #ifdef CONFIG_OF, exposing the prototype
unconditionally could cause a link error on CONFIG_OF=n builds if called
from outside the ARM64/MPAM path. A more idiomatic approach might be to
use a stub to keep the header consistent with the implementation:

   #ifdef CONFIG_OF
   u32 cache_of_calculate_id(struct device_node *np);
   #else
   static inline u32 cache_of_calculate_id(struct device_node *np)
   {
       return ~0U;
   }
   #endif

Would that work for you? Otherwise I'm happy to just drop the guard in
the next version.

Thanks,
Yin


> Cheers,
> Andre
> 
> 
>> +u32 cache_of_calculate_id(struct device_node *np);
>> +#endif
>>   /*
>>    * Get the cacheinfo structure for the cache associated with @cpu at
>>
> 

-- 
Thx and BRs,
Yin


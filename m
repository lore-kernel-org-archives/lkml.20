Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332175;
	b=D05gQmx27eyUSsXQIT1+TDu9GpeoEzXC7h4aLOPB14H0w1cqzXnzvQn/QVPT7VrfawXg
	 G1q6lOAQl8KDPkcC5EYssgDTRDFmBiO0W7KuiPDAW4JBEZ3TtOvKKzeSbpfM/hLwQhVfu
	 rC/d8UoabQ2TpMybWbremvuOaNW3r0gn7VLtXwt8b8l3mOt4xDhAwAvlVZ266VnsbgxxO
	 k/pK6GhVYRt/DLscHiCDwtCn/rtvcTfJFm3AXUqu5/ZLgxnlMNXsftnPhDA3ogx7ABcEe
	 RgsHjUyiBEXDQ3lIAfCpZxgQ0OdtTs8PF/mejoMcF+gzPYYMCVNnxqAqC+qqA0nipdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GF3p2MPJg5NvBdfSy70cPFWgO7XZPiyWiAUXohROP0I=;
	b=Ewt6wWAC1cv7ZHdj9ZzY8YIlrYGSHIFVLtkWc9VYcXfKlVH8L9CiVaDuK4ETfLH+mO+P
	 3tsxrOlbDhYXfoHRQ4jOC1lMwzf0eqUvUu48PUlGeyGUaprJgoRPwIWAhJdiGWp8CfYcI
	 CvBwCNKPDFIyMIEvS8ENU0kBLX5AizHcrXPYxUdeXNWM3r0QuP3nItpPNhomETctRd4j7
	 WiW65wWtvXO3D+gbAVDyJmbbZXiO8KiIbi7SS4HxNfnM0xuKZW5KoXO0rHAe6aKhjxcIs
	 6UVL+EsVw2dVVx99keE0BzBLAFHLcwqdrz8mK6IIbSP8alkDTe5s0QQD7KPQhzQa/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VJXtUa3N;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FC606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7FC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VJXtUa3N
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAFEH5Q1449855;
	Tue, 10 Nov 2026 17:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GF3p2M
	PJg5NvBdfSy70cPFWgO7XZPiyWiAUXohROP0I=; b=VJXtUa3NCJ6KIv9U+iSob8
	NPk9muoMobvH2VFvTIg8pl65OLxOOI9oiL4np4yKhK5EodKyodeEwW4VHsZc6M76
	JIm4CJY0mwHE3d9BOdbx+10ORYT4XKUg2BQoLh5VmvAbl4PhGd6ffzcpByqpZlIy
	E1qCxg+EN6ksbQbs9Fn1ZssWznNit7Eiek2Uyq/YSFRncEsmUCEvB4w05meAw5Y0
	taZBgkXhe/wcPFrIuvKfXbAl5NJCM61lmYrLTvrVUwttAHBoKXNZjoqGpAd0QSlV
	sSWujLnBVGvxgZu6b2A0PleSO8xbJ1byt1ecrU8TdDnzlVBItcE89KF+TwqMHFkQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hstdg5s57-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 17:35:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF4wMm1880673;
	Tue, 10 Nov 2026 17:35:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hv332148x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 17:35:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AAHZcxe40960260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2026 17:35:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB65820043;
	Tue, 10 Nov 2026 17:35:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6765320040;
	Tue, 10 Nov 2026 17:35:34 +0000 (GMT)
Received: from [9.39.16.14] (unknown [9.39.16.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Nov 2026 17:35:34 +0000 (GMT)
Message-ID: <9d64e866-1bfd-4e7c-aa8f-fac4f49e8e91@linux.ibm.com>
Date: Tue, 10 Nov 2026 23:05:33 +0530
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
Subject: Re: [PATCH v2 0/4] powerpc/topology: Introduce llc_override kernel
 parameter
To: Tim Chen <tim.c.chen@linux.intel.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, peterz@infradead.org
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        ritesh.list@gmail.com, kprateek.nayak@amd.com, yu.c.chen@intel.com,
        vineethr@linux.ibm.com, vincent.guittot@linaro.org,
        srikar@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au
References: <20261023131646.2907938-1-sshegde@linux.ibm.com>
 <4a71f654cdc03973f309754a2f61810b4547a471.camel@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <4a71f654cdc03973f309754a2f61810b4547a471.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=J+M/fwnS c=1 sm=1 tr=0 ts=6af355ef cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=s9x9zBqOSCmCEyYDc3wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2OCBTYWx0ZWRfX168KeEo7C3Pf
 Iht2xyNDK1Zo7qk+Boqqp5v8nDxhvGiCcIVuR8IeI0jcZsrNR+AH3NQeNxfit7ZmiO7kHtUt9if
 WfILHOLpYAb5dLPA/t5jQd5l1e91ngNqFfKLwyXbn5S4u0js18IYtHZVWIJIg0ULjtnP3QQ3RKa
 JoTDxjW2KrgX2vo6nVIfhqXw65e9jGmAAVOGGVcCF7RTMhKkDH9n3Z+50hEQGtcy6OYnW3mv96G
 3/DdkU/paVB+K0UJJ4orUutWtq7ZwlYR783OC33G5/1R9o4kzMMld9Hqg5VYPUNYu+6w5ahE4p8
 KT5F/Pw/0DHqyx1dxgId9To/TjeWogDCJ+Wr3gFIqZ1QwUhHOQ94SipONGooQm47PpHvt6MVud9
 cGNcMll9svCa7h4pjzM91nTZi2U5tIy2R2qb8/s5FgxZqA2M6Yl4eA28VQe+MuN/6GdPEqeWz7W
 CxucJljfq5YVsKWVzFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2OCBTYWx0ZWRfX2+lx8KzlT8Sj
 h4iDXBPrqLoZ+2eCbsPVVqOyF3NysSgdeBDCXHS7TKlHXCOCzuBZ019yuYGdSBtIj6fAHbgtvNo
 Ska0ki45VuxS8FDetJi6BKd/IDE3enU=
X-Proofpoint-GUID: HxpX8lPk9VpHsN5sMJufitYsGkoTShTb
X-Proofpoint-ORIG-GUID: MatCVIMhmKxeowZDDHUfQlBY9hcxoJ4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100068

Hi Tim, Thanks for reviewing the changes.

On 10/23/26 11:28 PM, Tim Chen wrote:
> On Fri, 2026-10-23 at 18:46 +0530, Shrikanth Hegde wrote:
>> Provide an option for users to enable cache aware scheduling on powerpc
>> via a command line parameter.
>>
>> More details of the problem and context is in cover-letter of v1.
>> v1: https://lore.kernel.org/all/20261012102037.2477378-1-sshegde@linux.ibm.com/
>>
>> v1->v2:
>> - Move to kernel parameters from debugfs. This helps to keep
>>    llc_id consistent which doesn't change across sched domain
>>    rebuilds. (Tim Chen)
>> - Update arch_llc_mask to reflect the override (Tim Chen)
>> - Limit only to mc, pkg (Srikar Dronamraju)
>>
>> Notes:
>>
>> - A selftest for the functional validation of cache aware scheduling
>>    is a good idea as we discussed in v1. It is a significant change on
>>    its own and likely takes time. I am thinking it might be good idea to
>>    revisit selftests for scheduler in general. (We have very few).
>>    Maybe worth a discussion in coming OSPM.
>>
>> - I am on parental leave. This version is pretty much what I had last week
>>    and I haven't gotten any chance to update since. just sending it out.
>>    Sorry if I have missed to address any comments.
>>    Please expect delays in my response.
> 
> Thanks for sending this while on leave, and congratulations!
> 
> The updated approach with boot parameters looks good to me.
> Some minor points:
> 
> 1. llc_bytes. As Chen Yu noted, get_effective_llc_bytes() returns 0
>     on powerpc because the generic cacheinfo is not populated. With
>     NUMA balancing on and the default llc_aggr_tolerance, any process
>     with a footprint then fails exceed_llc_capacity(), so cache aware
>     scheduling still does not engage.
> 

Let me first see if powerpc can migrate to generic cacheinfo.

> 2. Bisection. Patch 2 moves SD_SHARE_LLC to MC/PKG, but
>     arch_llc_mask() only follows in patch 3, so a kernel at patch 2
>     booted with llc_override=mc has sd_llc at MC with per-L2 llc ids,
>     causing mismatch. It may be better to squash 2 and 3.

Alright.

> 
> 3. llc_override is only written at boot. Making it
>     
>          static int llc_override __ro_after_init;
> 
>     and then you don't have to worry about READ_ONCE and WRITE_ONCE
>     to it as Chen Yu pointed out.
> 

Sure.

> Tim
> 
>>
>> Shrikanth Hegde (4):
>>    powerpc/topology: Introduce llc_override kernel parameter
>>    powerpc/topology: Update mc/pkg flags based on llc_override
>>    powerpc/topology: update arch_llc_mask based llc_override
>>    Documentation/powerpc: Add details about llc_override
>>
>>   .../admin-guide/kernel-parameters.txt         | 15 ++++
>>   arch/powerpc/include/asm/topology.h           |  8 +--
>>   arch/powerpc/kernel/smp.c                     | 69 +++++++++++++++++--
>>   3 files changed, 81 insertions(+), 11 deletions(-)


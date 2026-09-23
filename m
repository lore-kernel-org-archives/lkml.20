Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE4C4334DD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166506; cv=none; b=uznp9kOVt3H17kIW8nE81gI5arjHLOcjXZ/0Z1PAK2d6jg5aQIdPx3j9X4Z/vpX9jRNkFpCgHMMmM1193Sy42H0LogKrel+d2MpPCc/7Nmy92lz0+mJXIrxQWJjIHkWBasiht6ymPx7zbRoqGfluryurrPQY06QcPW2R5IGifsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166506; c=relaxed/simple;
	bh=fVhI/4bAi1asL/O9LvPUPXLCaP3mB9D9lWKlwrt5r9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ff4A+1q+736BDDYpbYEVBoZO0cnVku0kevNpF6MCox28NRfHGw42nLWRIOavOmboyWpSQiB6UkOG/0ssq3Y9uN5KL3MPZb4lpR/46hALvHtNiUIByIwHG78nlOmgoRCHZgZL6XhWZY56arSm9Dh6hgYg9Qn6bu/aG/0vrb2F+88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qOkDHFzo; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qOkDHFzo"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8ZVV41030621;
	Wed, 23 Sep 2026 12:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UG+Y4g
	7sdwAOTITrAgQCTPwCr+uZFBBVJNZl/D9wfWE=; b=qOkDHFzoU97f0bbK1Wzwhq
	Way7QSiYpDLvEvFU/7JWM6YxwCySq89BPu3hlSAe+2ekbBPw1AUkUDKrO+CLKEKr
	7asxPczHvLI4zNENHLDkPL+G3tDNwz7fsQ1mrLm4c6tqfPhwR4bx07fp3oN/Nock
	faRwJtf5WEfdtP3Ijqa/AsCigArrOTBIbLw2XfkU2V7w505Am21ZNKgLSFMJiQ2a
	FRzEoCewwaaPxm/DpGtIQmDz7c02Kc3pm/eEZ+F3xIrf8wPeMm0woAzTOafpsvUL
	HUeASZpYvfY9LyUBNVF6ho89og0RlrvpeTMU0B5hTh9iEb6TqVsNRPdmFL6K7c5A
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1u5tk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 12:27:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68NCPkkC008513;
	Wed, 23 Sep 2026 12:27:55 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gvb8jrvrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 12:27:55 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68NCRsiv33292824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Sep 2026 12:27:55 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E571258052;
	Wed, 23 Sep 2026 12:27:54 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 664A758062;
	Wed, 23 Sep 2026 12:27:51 +0000 (GMT)
Received: from [9.43.102.198] (unknown [9.43.102.198])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Sep 2026 12:27:51 +0000 (GMT)
Message-ID: <e53992b4-eb54-40c8-9421-2aa2e73e92fe@linux.ibm.com>
Date: Wed, 23 Sep 2026 17:57:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/ftrace: Don't restore r13 during
 ftrace_regs_caller
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, msuchanek@suse.de, ritesh.list@gmail.com,
        hbathini@linux.ibm.com,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
References: <20260921072151.35531-1-sshegde@linux.ibm.com>
Content-Language: en-US
From: samir <samir@linux.ibm.com>
In-Reply-To: <20260921072151.35531-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: xYsFoFEK7W2CF8F_A6AS7Tjqfma8goSL
X-Authority-Analysis: v=2.4 cv=EOCTQFZC c=1 sm=1 tr=0 ts=6ab3c5cd cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=yl0TpzIXH62GmPm5xBAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXwHslOvIlp4sw
 eHQYf+8Zcqp1pswyGTgtUaVkim1RVyWrlMW4BcH0Y1zJl4dmg7+XYG1uet42sRn1+nTjmyEa84E
 qafRxaHcQBO1R+h1PCqWNFtEZjgdlJQ=
X-Proofpoint-GUID: roOzAe6v0RSA0IeziWJYwR0JAgDQPUYx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX0U1//YlyT3GA
 EMbvkA4n7lQ/ScW6LloM7ABq1MC8ScNx5glQogTP93J3lGFSpQKVUGLFj4F70iiu7qvAFg8pcav
 FZRAkw8REghc7lA2DqXm4F+TXcyvv2JiGf9e7hfyC7o/nzKVJ4k5U9EyKeqqvOTtHL2reR+Jt8S
 3Ef5B5l1vXXxhNlfbKuNOdO25YV8Y36E6LRzAe+RWH7DtRHKA6bwXwdn1RiSvl6OHdMq+34G32h
 FKnWf2lFXSWApUVd0cqYQUfUBzF4S+GVw65ZDk6SxKcQZb7d9REDPA/zpY3ynXqfODzI7h/F9v8
 /DsgYEvTNsTCW/i7bp+5XgTDK7nHzE1paM8Hpup0W9j81fC/0ZCvaM6Miii8tviwVZHCgpdErY2
 U/t3wGkeMX2DVyWQ3rKgQ05C0aOJ/vRu0TdFY2r0jnzdquM6K8tqRTuANwe2iTv3qhz1qB07xho
 jQF1yLCKsDuXcYKaQ7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

Hi Shrikanth,

On 21/09/26 12:51 pm, Shrikanth Hegde wrote:
> Michal reported a stack-protector failure and subsequent panic when
> running kernel builds. This was observed with full/lazy preemption.
> Initially it was suspected as KVM, but later turned out to be due
> to a bcc tool running in parallel.
>
> Issue was recreated using a bcc tool.
> For example, running below in parallel leads to crash.
> ./funccount sched* -d 100 and make -j 64
>
> The same crash was observed when running kprobe for schedule() function,
> while simpler function tracer for schedule() didn't cause the crash.
> This helped to narrow it down to ftrace backed kprobes area.
>
> The crash occurs as follows:
>
> ftrace_regs_caller entry on CPU A
>      |
>      +-> save r13 = CPU A PACA into pt_regs
>      |
>      +-> call kprobe_ftrace_handler()
>              |
>              +-> ftrace_test_recursion_unlock()
>                      |
>                      +-> preempt_enable
>                      +-> task can schedule and migrate to CPU B
>                      +-> task resumes with live r13 = CPU B PACA
>      |
>      +-> REST_GPRS(2, 31)
>              |
>              +-> restore saved r13 = CPU A PACA
>      |
>      |-> The task then continues running on CPU B with r13 pointing
>      |   to CPU A's PACA.
>
> The stack-protector canary is accessed through the PACA. After the task
> migrates, CPU A may run a different task and update its PACA with that
> task's canary. Restoring the saved r13 then causes the migrated task's
> saved stack canary to be compared against the canary in CPU A's PACA,
> resulting in a stack-protector failure.
>
> Similarly, current is resolved through the PACA. With a stale r13,
> preempt_count() can access the state of the task referenced by CPU A's
> PACA instead of the task running on CPU B. This results in corrupted
> preempt-count warnings and scheduling-while-atomic failures.
>
> This path for example is called when using kprobes and parallel kernel
> builds can cause preemptions during ftrace_test_recursion_unlock.
>
> Do not restore r13 from the saved register frame. If the task did not
> migrate, the live r13 already has the saved value. If it migrated, the
> live r13 contains the correct PACA pointer for the CPU on which the task
> resumed.
>
> On PPC32, r13 is regular register. So do this fix only for PPC64
>
> Fixes: 153086644fd1 ("powerpc/ftrace: Add support for -mprofile-kernel ftrace ABI")
> Reported-by: Michal Suchánek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/all/aqKfsVArHHaIK6M9@kunlun.suse.cz/
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v1->v2:
> - On PPC32 r13 is regular register. So continue to restore it.
> - Picked up the tags.
> v1: https://lore.kernel.org/all/20260918150811.1743769-1-sshegde@linux.ibm.com/
>
>   arch/powerpc/kernel/trace/ftrace_entry.S | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
> index 6599fe3c6234..5eb8eee32549 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -220,7 +220,13 @@
>   
>   	/* Restore gprs */
>   	.if \allregs == 1
> +#ifdef CONFIG_PPC64
> +	REST_GPRS(2, 12, r1)
> +	/* Do not restore a stale PACA pointer if the task migrated */
> +	REST_GPRS(14, 31, r1)
> +#else
>   	REST_GPRS(2, 31, r1)
> +#endif
>   	.else
>   	REST_GPRS(3, 10, r1)
>   #if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)

I have verified the above patch on a PowerPC system and did not observe 
any issues.

System configuration:

  * Architecture: ppc64le
  * Dedicated system with 10 CPU cores and 150 GB memory

Test conducted:

  * Enabled a kprobe on |schedule()|using the kernel tracing interface.
  * Applied a PID filter to the kprobe event.
  * Ran the tracing workload in the background while simultaneously
    building the upstream Linux kernel using:
    make -j100

The system remained stable during the test, and no issues were observed 
with the patch.

Tested-by: Samir Mulani <samir@linux.ibm.com>

Regards,
Samir

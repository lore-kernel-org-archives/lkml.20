Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97A335DA53
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972655; cv=none; b=ND8KsOVPQLR9imOX1mjzx9o4h6L2dY9H64CqNXrIfH80VG9mdnl0MqRjG3oSnX8dFhpYkhJbYvgdeuubrl8WAcNhZ+9ivPi0XlE8NYrikAtA1fue0ZWZ23L6hX0FS76FwChjzyMIRQkPVrWfQgZyZOhIsVnsNb5CSvmArwthASw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972655; c=relaxed/simple;
	bh=djRMOfarFaJ04cPfQq0uoVPfAgcA9s0jPvJfQM2rCec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeOR5DaA99CPIjh0yqdA7CbidnYxEw6iuhqwMTVBJiJ55eMyb64J9Oh8Tr6OddpnKgUmoN4rlorr/DTmMmDc6QVPwleEJpWmdsjnbkhVlpLlmSK1sNeI2k87jodz8+t6/HGV+7Rl9EzPSM8PMQGYOrUycQn69jDAMSmYmkoXVP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kSXbMBuN; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kSXbMBuN"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3aDBM310865;
	Mon, 21 Sep 2026 06:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=12JsSk
	DaFfjNLCd8JRhB+Eq1i86vhIab8AvblKxJ+as=; b=kSXbMBuNHyW58bQF/FZVvO
	pKSu4UNdWpvF6v74CsZBWeeuH9YsL1P54BezqplmPmjXiCYJuj0FwEKJe+NjjID3
	bkaaBGxkzExt8AXxf2ejUpAxSor/LVacXOhwmo8xXdeclBm1v8as4/pLrkTgaROJ
	vQqvdvcOsfoVZE5XcjXYvI22urjsTAIJ/jJhvLPeZzr6CI78DR3MtFy5G15P5Enx
	uyxVCQvoUg9ypuGmiwzV+nfNNabAztvaNgkz5rLBE4j67Lj8/u9XxHOshByCDrex
	5ugePwcJ60yHSbowMVecCiETVvmy8J+LTEG+T+PErCQYpQyIHRYN7YivTeDgyOgQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskduxyq5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 06:37:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Y2YJ685315;
	Mon, 21 Sep 2026 06:37:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gt4qq48kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 06:37:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68L6b4n635848694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2026 06:37:04 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C2CC20043;
	Mon, 21 Sep 2026 06:37:04 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FE5C20040;
	Mon, 21 Sep 2026 06:37:02 +0000 (GMT)
Received: from [9.89.252.119] (unknown [9.89.252.119])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Sep 2026 06:37:02 +0000 (GMT)
Message-ID: <2a1d71ab-dab1-42c8-8c55-f131a4b6e48b@linux.ibm.com>
Date: Mon, 21 Sep 2026 12:07:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/ftrace: Don't restore r13 during
 ftrace_regs_caller
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, msuchanek@suse.de, ritesh.list@gmail.com
References: <20260918150811.1743769-1-sshegde@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260918150811.1743769-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: wS6J-yU6oZ004h54_tY2xyCCIjPtzVeQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5MyBTYWx0ZWRfX5Wyj/mtBgdWH
 9Y67yGksWGECCUd3Cuv0ZIfoBw/28BSHyBcuCwJvanp5WBN3z2efarEYV3BK8IY1QdPdLgf3PSJ
 iCyp8+3Ja4W9L20i+zS/Z5DuY9cdvss=
X-Authority-Analysis: v=2.4 cv=FLiOVOos c=1 sm=1 tr=0 ts=6ab0d095 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=pVpjsnVs9Y3pVwfB6loA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: jVmXZplrYIKhakPXeL1MjlqhDODji_E9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5MyBTYWx0ZWRfX2jJNgz+sEhL+
 3/2YOX+bFf9TCEb8ASWv+C+R3N1e+SMkaWCTy1Ts8i7+g0LvCKhyHEhPgSAAqvuMGhTtjs17N42
 BRUmI+yfCHIQFEIBUjaadNAM35uZ7bh5CBoH/s1YgNtIOHhHNYEoU8xBfP0ZdjkJCTUqP38t+vH
 fRn+96s5ZmBofGBX7lJlNBVlebBSK/MujpHfZPMYXfRZpBmHa9XbM4uBQSy9b64+A0TmhnC95Ac
 1SjRT6/384OEZkvyRuvOdEceq3advBZRRPyZ9nsogErUqmI4ZJsMMndq0T4gZhyCVnGPOehY6oB
 1KuFiWh7CW2pEfUoAtveKecmPlbh3f9VLE0DVuyC+nJa+EGMNTyJYyj9G6qYjBopCtIbom1Ex7Z
 Czt/wSvUWyWA+0gkRCkrnF0tRRFGNnwGGBSrWxKUgB+Lm06SSYGi+/V2MGZ9x/vJHgdE2WlRLFo
 JKpEkddqI137BOIylEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210093



On 18/09/26 8:38 pm, Shrikanth Hegde wrote:
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
> This path for example is called when using kprobes and parallel kernel builds
> can cause preemptions during ftrace_test_recursion_unlock.
> 
> Do not restore r13 from the saved register frame. If the task did not
> migrate, the live r13 already has the saved value. If it migrated, the
> live r13 contains the correct PACA pointer for the CPU on which the task
> resumed.
> 

Looks good to me except for a minor nit below.

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> Fixes: 153086644fd1 ("powerpc/ftrace: Add support for -mprofile-kernel ftrace ABI")
> Reported-by: Michal Suchánek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/all/aqKfsVArHHaIK6M9@kunlun.suse.cz/
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> PS:
> Fixes is the initial commit that introduced this restore regs almost
> 10 years ago, all commit afterwords are code refactors changing the
> code layout. Also backporting all the way maybe tricky.
> Backport can easily happen till aebd1fb45c622.
> 
>   arch/powerpc/kernel/trace/ftrace_entry.S | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
> index 6599fe3c6234..54c8727b48cd 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -220,7 +220,9 @@
>   
>   	/* Restore gprs */
>   	.if \allregs == 1

> -	REST_GPRS(2, 31, r1)
> +	REST_GPRS(2, 12, r1)
> +	/* Do not restore a stale PACA pointer if the task migrated */
> +	REST_GPRS(14, 31, r1)

Given that r13 is not paca on ppc32, shouldn't the above change
only apply to PPC64?
>   	.else
>   	REST_GPRS(3, 10, r1)
>   #if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)

- Hari


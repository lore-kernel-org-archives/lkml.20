Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8081E370D5C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798286; cv=none; b=DGeIMqlQKDC+6DBf95pwa/9DOW2R3XF9amxexgezpJlM5w03nEpGa5ZnQnZxLCF7RsSc4c6kMwGHMI4vyejD4wtEDKHIVnyxoDWg/0kMr/HGGire5BfIXCUq43+rJ9QQ7kMqyjxf2ni16qV3+6I6AsHHH57BE+3nmzKPVIzn2jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798286; c=relaxed/simple;
	bh=v4Dsp8VziA0MtayIX2+ZsKE2QvUYp7X2142WJPUh3F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIoJ8Y+y29R83ts71s0N3p5GLjNK+AxjETUU4p5MuSaRuwGIACB8EqLd0tv9107E3AkRhVUO3TP+CjXxewzOm5Pdd8Py5eEugmrCzsa/JpieD8DMRiOum9YFpWH5/x+djFDcSmO3XLNQfEqKxgmSPEOhIHk7W6RpPweoEJV8aEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOsSGr6c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOsSGr6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D981F000FF;
	Sat, 19 Sep 2026 06:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789798284;
	bh=06PjwJFZE3BfGNUfr/Vv4TUh7POhP7Pa28xxRAW4zdY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BOsSGr6cefyU8A3CtFHg47ZxkeNiIwALqyzGenQgGs0pukynJlr3Y5SOoMqhZ3K4U
	 /Q9iuR4PkWJtmZiEosyA0vItC+wbMA3HzjS5uY89JM3PoXt5eL81atgd/Au2+Dve6S
	 ifYVkuUdKzwLH393CoTMnLKRmF2A3vH+EzQ4Ud2XTUA0twmvJQ/299/a+MrWt0aQE8
	 RAoxG/jutGLbRNdzZtq06Ac0bJehch1djQw2EJbDuISwNj6T6eM05WtJOqDzGvBKZw
	 KGFCq9DiAuTXfnCctenKw8BB4VnCX5tLEI86q+T9NVvyrICbvCu+Qst8YojRQq6pp+
	 NatQn8AuAZLSQ==
Message-ID: <fe7459ab-ddb8-41fa-a770-5bccb504dfe6@kernel.org>
Date: Sat, 19 Sep 2026 08:11:18 +0200
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
Cc: mpe@ellerman.id.au, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 msuchanek@suse.de, ritesh.list@gmail.com
References: <20260918150811.1743769-1-sshegde@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260918150811.1743769-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 18/09/2026 à 17:08, Shrikanth Hegde a écrit :
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
> Fixes: 153086644fd1 ("powerpc/ftrace: Add support for -mprofile-kernel ftrace ABI")
> Reported-by: Michal Suchánek <msuchanek@suse.de>
> Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FaqKfsVArHHaIK6M9%40kunlun.suse.cz%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C47f05d7553a44699e1eb08df1596affe%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639253409091782376%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=yrGFyJtjVk8VFxU5%2BqT4HfxrvTTNPwrQqwn2cLxyT7o%3D&reserved=0
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
> PS:
> Fixes is the initial commit that introduced this restore regs almost
> 10 years ago, all commit afterwords are code refactors changing the
> code layout. Also backporting all the way maybe tricky.
> Backport can easily happen till aebd1fb45c622.

Probably not a big issue. That commit is in 5.17. Stable branches 5.10 
and 5.15 will be EOL by Decembre 2026.

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
>   	.else
>   	REST_GPRS(3, 10, r1)
>   #if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)


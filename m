Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8803749EB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980508; cv=none; b=l3HAvP6e/40P67meCja1EyPXolodqtw42cHp86k01PRseTY0J8MRlpDHTaYzmQIrcvF+1386pCtUqZTsU0sdflbmlqZlX6e9nSLVjvpM2rFm35L3cpEwizySiMhd5gT8WksDkuyuw233xHKbasY8a1ID6Wo6ZFN8i0iwluDzDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980508; c=relaxed/simple;
	bh=zRvUKmO+Djoxhsu9cNPD1xlTyXL/dJlbdvj0F4fWcsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPN1ymcTXJhDgg5/yRSGP62HbDF/vm6Feq64d6QlaDAzZdzX8MhunPEQ0pQd9VsoFDvSSl9lS4qH4HHeOOadIa9EPqudDqwI0txODtJ8Ogfz4tQWxB62CC9w/MUXxfkFSJ99FKtEoyaGLUvxDRrWNjwny2cZamjjG4KpvMSpV20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=an1bAAGy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="an1bAAGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57771F000FF;
	Mon, 21 Sep 2026 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789980506;
	bh=9iL1YWW2QYK9+llrDkhB96CA/vzi9wc36AEnvExuoNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=an1bAAGyCXfni6gi1cL7qJB6SN4oBe80+IcnVmh1bAzaMpH3wQXShiOZgYMBeuZa0
	 NSFV6UdmLrrUx/YdVfg2hKwosmpSXF657FdrpJeU30QC4ha47g3lWvbmJ0zfHjaQsn
	 x9REz7/M0rMboflN2yX0IdDrUJDlRiTl363tT0/hzGQM0YrzITLbQ6MUdGTp3s48bt
	 1wmE7Z6Mp4lJ4q21aUi8+2kwl/dJD+RuzRglVEJxcNrNJ5ePuqkAp0JLPs8mFe9U11
	 qroytOZzpEOKp1Ks7neHHcmvksHPmBiazLT6puspACI/3UdGOq+JaEmGGjCC3d80bi
	 mEZkBopVMzRFQ==
Message-ID: <7c9f04bb-8c0e-4176-b44d-55304e7359c8@kernel.org>
Date: Mon, 21 Sep 2026 10:48:21 +0200
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
Cc: mpe@ellerman.id.au, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 msuchanek@suse.de, ritesh.list@gmail.com, hbathini@linux.ibm.com
References: <20260921072151.35531-1-sshegde@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260921072151.35531-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 21/09/2026 à 09:21, Shrikanth Hegde a écrit :
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
> Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2FaqKfsVArHHaIK6M9%40kunlun.suse.cz%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C3e7a545b53d440a2e67608df17b108e4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639255721258018023%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Wq%2FROZrTgs9UQsuUqNhFpts90JVwEpgxcNI60HlXqmQ%3D&reserved=0
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v1->v2:
> - On PPC32 r13 is regular register. So continue to restore it.

Oh I missed that while reviewing. Thank you Hari for spotting it.

> - Picked up the tags.
> v1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20260918150811.1743769-1-sshegde%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C3e7a545b53d440a2e67608df17b108e4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639255721258040669%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=J9tBTYidx4ZNPZDK66CdicI64HV5naHau%2BYnNnf4XPo%3D&reserved=0
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


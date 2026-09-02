Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB20386562
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327385; cv=none; b=SB/ga43mD4G9dpe/T+RqHwLwTEyderLpxJBnDRzm23mTH1zUcqzc1kv4eaw/qcv+xEWEM26UJgKO424XwjE7e8L0qtqLXh+t+3bNbov1uWhqaoz+58QFn9cL5zQPKPr7LC/M1RQWLVQwyce2CBZD6E756SIhK0bW73PdjN3OR54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327385; c=relaxed/simple;
	bh=/oM7CPITIMu61rw1LJvq7gvO/E7GxeNGur+pmS4KKFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUY/ar2NI90S3snZyT4JMwYThJNLXN+BuIhKfM92E7J9BEgMJTc347f/ndzj/p2l4hK6tgLRxAcPAhR4E6Ug86t0sNr9nQkCldyqKLuG4sY4Fng9xzlkZTsN23qoTEaeP/6F5iIsISaZ2LPBnqP1CM/239H6xaEbRQF25ksPsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHZCCKpu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHZCCKpu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F5F1F000E9;
	Wed,  2 Sep 2026 05:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788327383;
	bh=jyzYoXCRm/+tjQ+fROHfpYCMy4+lHSWupjhgvEHZkcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nHZCCKpuW66tiUxQ1gIcOIpxpVnZrKV+h5ZBhsjzp1xgyZXNHcoHK8tGhCWmuX0GO
	 R7sus+SR6/Vz89lpmbKDNygNkKfZDdrUNNkCPJQoQMIiKR9eftMQ8VJF+CTSDKxwR6
	 Lydg9lzZ2LWwqYQ4PNdhQxgzeNFPOHbCuJdnd8O7gbWkyNhvAOtXMQFqEbRYczJUsM
	 2+8v6lV6OTFMmTyR8KX1xkRJG3a6wBoysLRpxlJqSbAzSlMEEa53CUFwY1PAa0JrOU
	 EcUYw8aH2Ns5akkNKgM6mTvuYZrtIr2TQVEKaMfqTQfQphz4IsFWV7C/ZshVUj71c5
	 8PQADmTkyfjAg==
Message-ID: <cd25ffa5-5efc-42f1-b145-0c1c6539b4c4@kernel.org>
Date: Wed, 2 Sep 2026 07:36:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/entry: Fix double accounting of user time on
 interrupt entry
To: Aboorva Devarajan <aboorvad@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Ritesh Harjani <ritesh.list@gmail.com>
References: <20260902050628.2553909-1-aboorvad@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260902050628.2553909-1-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/09/2026 à 07:06, Aboorva Devarajan a écrit :
> Since the switch to generic entry, an interrupt taken from user mode
> accounts user time twice: once in arch_interrupt_enter_prepare() and
> again in arch_enter_from_user_mode(), which irqentry_enter() invokes
> for the same interrupt:
> 
>    arch_interrupt_enter_prepare()
>        account_cpu_user_entry()
>    irqentry_enter()
>      arch_enter_from_user_mode()
>        account_cpu_user_entry()
> 
> account_cpu_user_entry() accumulates the time spent in user mode
> since the last return to user space, so the second call charges the
> same interval again.

One of them was added by commit 09a9d3a8499d ("powerpc: introduce 
arch_enter_from_user_mode"), the other one by commit 893082ac769b 
("powerpc: Prepare for IRQ entry exit"). Would be good to mention it and 
explain how it went wrong.


> 
> With CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y this roughly doubles the
> reported user time of any workload that takes interrupts. On a
> pseries LPAR, ps/top show ~200% CPU for a single-threaded CPU-bound
> loop, and time(1) reports user time about twice the elapsed time.
> 
> Remove the accounting from arch_interrupt_enter_prepare() and rely on
> arch_enter_from_user_mode(), which runs for both syscalls and
> interrupts. The duplicate account_stolen_time() call is removed the
> same way.
> 
> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")

Not sure it is the correct commit. Should probably be one of the ones 
that introduced the wrong call.

> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> ---
> Verified on a pseries LPAR (CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y),
> 7.3.0-rc1, single-threaded CPU-bound loop:
> 
> Before:
> 
>    $ python3 -c 'while True: pass' &
>    $ sleep 3; ps -p $! -o pid,etime,time,pcpu
>        PID     ELAPSED     TIME %CPU
>       4980       00:03 00:00:06  210
> 
> After:
> 
>    $ python3 -c 'while True: pass' &
>    $ sleep 3; ps -p $! -o pid,etime,time,pcpu
>        PID     ELAPSED     TIME %CPU
>       4951       00:03 00:00:03  105
> 
>   arch/powerpc/include/asm/entry-common.h | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index c5adb5006361..984294e62568 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -222,8 +222,6 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
>   
>   	if (user_mode(regs)) {
>   		kuap_lock();
> -		account_cpu_user_entry();
> -		account_stolen_time();
>   	} else {
>   		kuap_save_and_lock(regs);
>   		/*
> @@ -426,6 +424,10 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
>   #endif
>   	kuap_assert_locked();
>   	booke_restore_dbcr0();
> +	/*
> +	 * User and stolen time is accounted here for every entry from
> +	 * user mode. The interrupt prepare hooks must not account again.
> +	 */

Don't polute the code with such a comment. This is to be explained in 
the commit message. First a comment shall tell what code does, not what 
it doesn't do. And the comment has no added value, when you see 
account_cpu_user_entry() is called you already know that.

Here you feel the need to add such comment, but if you had implemented 
this function yourself and done it right at the first time, would you 
have felt the need for this comment ?

Have a look at https://docs.kernel.org/process/coding-style.html#commenting

>   	account_cpu_user_entry();
>   	account_stolen_time();
>   
> 
> base-commit: fb442a6673ff1046bf67754957d95880fdb394b5


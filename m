Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B591358378
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502146; cv=none; b=rvsTL5JcjznP0IMTt4f3WrbZHrb4RZm8cJeZ6+sOQgmyXJ5JIiXtqJ79TzFOCPAtcQv/7SL70UhbVKhkxEniOtG898UWxyVWuVADNqi/n+YtjxrivppQYtqN4j3Ayglyj6aw2CCVj29niJK6cZLFs6KoVVnIOrVGPVu/wPPLglM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502146; c=relaxed/simple;
	bh=LBPbRZp1f+8cw5F5N0PI862DQqPSwANXb7HOqvJ+NLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Umi3NsmpP3Z5Ugwx0GmvCrp5dlCD7G4pdUlZx8NxsHKYjDFRSrIF2Ckaus+7hCZes5hHGI/tWbDaINgItKmBQK0cpXMGgxN3sdEQIGD+2TiOxIW/j3LCTYs39DwusmGKzF12nP7SGL4OyrLwiKN4KnmowhgfSDMESDZuyabhsKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1fXFY/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1fXFY/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF8F1F00A3E;
	Fri,  4 Sep 2026 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788502145;
	bh=ykfieVvZNqtUa+4jWvCQTTFA2b6xsuqBfoeLrAe0uqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P1fXFY/Say3wJWn/3DLEhCoWyCe4uU/Z6AO/b3p409SgNVUl9xYp6kruuLVDZ3F0K
	 pN9jh74KW6FRGbnzMu9loZiTKh/oudilsJKCVmVzBB/EkJTWNPaB7HREAc73/0jLNP
	 qMS/KiggcALQ3y6RKrap4Nt+w791sW748pityCX7BIKok98/HvOzMrSU0APumOMxdW
	 hTLwYQMyH18P+qFsvS8gwEJyAce8fFmqKwybrqhEOYJ16BrxzYuxRT6oNmuVAanRR3
	 +7wRHhVUGXmw+woevJ4N6pjl27QYzthF8hMiFqiWP8Aeg2Tj0xcgB0oL4cZW7GKq/I
	 S4sKdnz/d6gtw==
Message-ID: <5c42b080-cdcb-43c8-9bf9-15f79339f0da@kernel.org>
Date: Fri, 4 Sep 2026 08:09:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/entry: Fix double accounting of user time on
 interrupt entry
To: Aboorva Devarajan <aboorvad@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Ritesh Harjani <ritesh.list@gmail.com>,
 "Nysal Jan K . A ." <nysal@linux.ibm.com>
References: <20260904025831.3439809-1-aboorvad@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260904025831.3439809-1-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 04/09/2026 à 04:58, Aboorva Devarajan a écrit :
> Since the switch to generic entry, an interrupt from user mode
> accounts user time twice: once in arch_interrupt_enter_prepare()
> and again in arch_enter_from_user_mode(), which irqentry_enter()
> invokes for the same interrupt:
> 
> 	arch_interrupt_enter_prepare()
> 	  account_cpu_user_entry()		/* first */
> 	irqentry_enter()
> 	  arch_enter_from_user_mode()
> 	    account_cpu_user_entry()		/* second */
> 
> The second call charges the same interval again, because
> account_cpu_user_entry() accumulates the time spent in user mode
> since the last return to user space.
> 
> The two calls come from the GENERIC_ENTRY preparation series,
> where each step was a no-op on its own. Commit 09a9d3a8499d
> ("powerpc: introduce arch_enter_from_user_mode") added the hook
> with the user-time accounting in it, but nothing called it yet.
> Commit 893082ac769b ("powerpc: Prepare for IRQ entry exit")
> copied interrupt_enter_prepare() verbatim into entry-common.h as
> arch_interrupt_enter_prepare(); that copy was equally unused, as
> handlers still called interrupt_enter_prepare().
> 
> Commit bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
> made both live. On the syscall side it did the full conversion:
> system_call_exception() now accounts once through the hook via
> syscall_enter_from_user_mode(), rather than calling
> account_cpu_user_entry() directly. On the interrupt side it
> switched the handler macros to arch_interrupt_enter_prepare()
> followed by irqentry_enter(), which also runs the hook, but the
> accounting in arch_interrupt_enter_prepare() was not removed to
> match. The double accounting starts with that commit.
> 
> With CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y this roughly doubles the
> reported user time of any workload that takes interrupts. The
> other accounting modes compile account_cpu_user_entry() to an
> empty stub, so they are not affected.
> 
> Remove the accounting from arch_interrupt_enter_prepare() and rely
> on arch_enter_from_user_mode(), which already runs for both
> syscalls and interrupts. The duplicate account_stolen_time() call
> is removed the same way.
> 
> On a pseries LPAR a busy loop reports 6s user time in 3s elapsed
> (~210% CPU) before the fix, and 3s (~105% CPU) after it:
> 
>    $ python3 -c 'while True: pass' &
>    $ sleep 3; ps -p $! -o etime,time,pcpu
> 
>              ELAPSED     TIME  %CPU
>    Before      00:03 00:00:06   210
>    After       00:03 00:00:03   105
> 
> A 50% load reports ~70% usr / 30% idle before the fix, and
> ~49% usr / 51% idle after it:
> 
>    $ taskset -c 6 stress-ng --cpu 1 --cpu-load 50 &
>    $ mpstat -P 6 1
> 
>              CPU    %usr   %idle
>    Before      6   69.74   30.26
>    After       6   48.51   50.50
> 
> Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
> Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

 > ---> Changes in v2:
>   - Explain which commits introduced each accounting call and how
>     they overlapped in commit message.
>   - Drop the code comment.
> 
> v1: https://lore.kernel.org/linuxppc-dev/20260902050628.2553909-1-aboorvad@linux.ibm.com/
> 
>   arch/powerpc/include/asm/entry-common.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index c5adb5006361..000fa925e26a 100644
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
> 
> base-commit: fb442a6673ff1046bf67754957d95880fdb394b5


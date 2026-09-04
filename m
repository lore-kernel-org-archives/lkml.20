Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C8441B8ED;
	Fri,  4 Sep 2026 22:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561612; cv=none; b=PItcyDI13ZzTvuSvoMF7awVRS4crMB45fKN+0DKvSGGzmORSMuyzE3RBgmJMJZK7DBxps0cq/x+BaUjbuEoCLTHVuOxqrm2Iut1Ym6eT6NRfp1nDVraIw7NlbUCVbdJvvC+gMwPbPqhOLMhk2CXg0qcmaASobiv/rBNL1f3OvlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561612; c=relaxed/simple;
	bh=suYNkVyk22RKfkf8Vk/EL3XzgghGhp1iCCVva3lEhBc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NqlmOJl+ohuIia5fL6fM83q8gF7bVOlBK/TeZyFtnThUms8fe2dI8a48ffRBvWA5OayshwMxY7Rir12VM4jmP2wETwmxDOznrOsYmrT/2zKcKtSjunNk12g1fFO/ZieKbA22++P6XLYeUavVf5ZjDnhuDWKMsz6Ch2iJzSszZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwtAbHGj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwtAbHGj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEA21F00A3D;
	Fri,  4 Sep 2026 22:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561610;
	bh=p/Qs3vFwxbzGHEX+ullHPdUbE0l7go1cBnlVH4Cy0mY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MwtAbHGjlmkuoSueOBEoZGH+XQjU65rual3wafEixqyCRHkFHW5mwWKOB+dtkk6XB
	 0/RUprTxgkqTNT5y5Ycku0QY6lvJJrN9ETsMH7F/dcoDWSoG/u5RPaau2mW11N7lQE
	 vY0CVii0ODRiL5MGpAyUUwTO+eR4VLGyAzQOzPYRepce1d7xH9Sh+PSAmBXlOxju1s
	 QlFJx8NM7PbE1WvTpm87QmxF3Hrrs51bwWzbOz+2iBVjxr6zAzxmW5C4LvZNj7Eaua
	 olBRBps1x0fHs1erl9G6ubYyady0evuTImKGE7yV8q/XDr6EpOimxhAmrb1aTHZsM+
	 ZC6CG1W7DfZag==
From: Thomas Gleixner <tglx@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: include/linux/irq-entry-common.h:218: undefined reference to
 `syscall_enter_audit'
In-Reply-To: <aprKt3OlFvdQN5w+@rli9-mobl>
References: <202609031938.ZvZZaRQy-lkp@intel.com> <87wlt29k5v.ffs@fw13>
 <aprKt3OlFvdQN5w+@rli9-mobl>
Date: Sat, 05 Sep 2026 00:40:07 +0200
Message-ID: <875x0k7i9k.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 21:42, Philip Li wrote:
> On Thu, Sep 03, 2026 at 10:03:56PM +0200, Thomas Gleixner wrote:
>> > All errors (new ones prefixed by >>):
>> >
>> >    riscv64-linux-ld: arch/riscv/kernel/traps.o: in function `__exit_to_user_mode_validate':
>> >>> include/linux/irq-entry-common.h:218: undefined reference to `syscall_enter_audit'
>> 
>> Seriously?
>> 
>> >
>> > vim +218 include/linux/irq-entry-common.h
>> >
>> > a70e9f647f501e3 Jinjie Ruan     2025-06-24  212  
>> > 70fe25a3bc53a89 Thomas Gleixner 2025-10-27  213  static __always_inline void __exit_to_user_mode_validate(void)
>> > 70fe25a3bc53a89 Thomas Gleixner 2025-10-27  214  {
>> > a70e9f647f501e3 Jinjie Ruan     2025-06-24  215  	/* Ensure that kernel state is sane for a return to userspace */
>> > a70e9f647f501e3 Jinjie Ruan     2025-06-24  216  	kmap_assert_nomap();
>> > a70e9f647f501e3 Jinjie Ruan     2025-06-24  217  	lockdep_assert_irqs_disabled();
>> > a70e9f647f501e3 Jinjie Ruan     2025-06-24 @218  	lockdep_sys_exit();
>> 
>> What the heck has line 218 to do with that failure?
>> 
>> This is getting stupid. It seems there is yet another compiler aside of
>> s390 gcc which fails to do dead code elimination but this time it's
>> worse it also points to the wrong place ....
>
> Sorry for the confusion, I give a try with riscv gcc 12.5.0 for the same kconfig, the
> result is below
>
> 	include/asm-generic/preempt.h:54:(.noinstr.text+0x1a20): undefined reference to 'syscall_enter_audit'

which has nothing to do with the unresolved reference either. preempt.h
definitely does not invoke syscall_enter_audit(). I love broken tools.

IIRC I saw something like this before with some broken S390 compiler
failing to eliminate the call because it out of lined the condition
inline which when inlined causes the dead code elimination to get rid of
it. I'll grab that config tomorrow and look at the output.




Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B9A4E1C64
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558102; cv=none; b=C7TPMFb6yCjO80Tlb/Dl9WTR4PrA/6Mws8OwOjqo155+CntqyDPjbzS2UXAWqERjsMFlcDJZH+AI1JS8PZiuSj04Bj1whXyKeoI6ncV0NLjTlIlkxXuf5lcUL1MwT8pOKuLJvwuYtzY3DqjsHrUiCmraZGvSuTYf1Lkh6MtlI6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558102; c=relaxed/simple;
	bh=G+uK33iawjqaOPPLfv9zt4JfC8SJoLJfCoMa/5TQCuw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lFj2/HtO0QE3QI0AkUfLg+sjF3ZZAZ0M4MGZinF3KoNEZXAtuqUpV7yxTHwRsA2atRYbgpxE7xkV56zUoRv0jApHZwGatcu1nKjd6vvsLvGbKNUjQVWjX6NDPoWO54EgXL7QHtNhzdKvRU1xKzYQ1Z04z+Rizk44CRzZxioGvR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BjFweyac; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sF5yJVMn; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BjFweyac";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sF5yJVMn"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791558090; bh=WT1TICo2rkfhE1iJ8fY63iM
	W9zh2L4xBrb9qLgmRBwA=; b=BjFweyac1p5tAz1YeabQbvkt+V/AF5z9yPXK2qjrcrLL6zt+Yi
	XkQAB7f9UP3k5sjpwrTHOzCdZ38a9bC/qqoNG8QZVUossvb6++GVXFfhxeFKPtiigYL8wZopmk9
	eHHUVyXA0LcfirDuVOZ+4eRMUOZj4sJ/Ly0IvalPH9vNYTnjcVH5ySpWhH4RRFLor+S5psKZvF9
	vl2sbJWf5fe5czmXrDiy61/jwgHNJtVhdRy3Qhe0yAW6njKI/Jr9CDOm7ReM8v1c8ZDDBPoRG8D
	a2yNCMexdEDPS9ucCkh/LQyt9RYvnmsDNOFC2j8fGu2JDoZaScRxr0G/XPgR6+YL8cg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791558090; bh=WT1TICo2rkfhE1iJ8fY63iM
	W9zh2L4xBrb9qLgmRBwA=; b=sF5yJVMnyEVApSe2Uhv7dFgwOOj9nUlQVCiZ1b0/nmBAqMrkEW
	2XnXifdDenpNBn2UeGKedzYYgRXoQD81IIDQ==;
Date: Fri, 09 Oct 2026 16:01:30 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
CC: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND=5D_arm64=3A_entry=3A_drop_the_u?=
 =?US-ASCII?Q?nused_tmp2_argument_of_mte=5Fset=5Fkernel=5Fgcr=28=29?=
In-Reply-To: <c53b373b-9f70-42f0-affc-6978f0508b87@arm.com>
References: <20261007185512.2.mte-tmp2@mainlining.org> <c53b373b-9f70-42f0-affc-6978f0508b87@arm.com>
Message-ID: <7414D867-A850-46E4-9145-DE4A4A5FAFAE@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 9 October 2026 11:37:45 BST, Vladimir Murzin <vladimir.murzin@arm.com>
wrote:
>On 10/7/26 18:45, Bradley Morgan wrote:
>> mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
>> used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
>> commit 82868247897b ("arm64: kasan: mte: use a constant kernel
>> GCR_EL1 value") swapped that for
>> 
>>     mov     \tmp, KERNEL_GCR_EL1
>> 
>> and tmp2 stayed in the declaration and in the one caller, which
>> passes x23 for it.
>> 
>> Drop it, both places.
>> 
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> ---
>> Resending, the first send's body got mangled.
>> 
>>  arch/arm64/kernel/entry.S | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>> index f63049ac32dc..c3106dee61e1 100644
>> --- a/arch/arm64/kernel/entry.S
>> +++ b/arch/arm64/kernel/entry.S
>> @@ -171,7 +171,7 @@ alternative_else_nop_endif
>>  #endif
>>  	.endm
>>  
>> -	.macro mte_set_kernel_gcr, tmp, tmp2
>> +	.macro mte_set_kernel_gcr, tmp
>>  #ifdef CONFIG_KASAN_HW_TAGS
>>  alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
>>  	b	1f
>> @@ -258,7 +258,7 @@ alternative_else_nop_endif
>>  
>>  	apply_ssbd 1, x22, x23
>>  
>> -	mte_set_kernel_gcr x22, x23
>> +	mte_set_kernel_gcr x22
>>  
>>  	/*
>>  	 * Any non-self-synchronizing system register updates required for
>> -- 2.53.0
>> 
>
>Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


cheers, sorry for the oopsie on 1/1

--- Thanks!
"I'm not a very positive person" - Linus torvalds

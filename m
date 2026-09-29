Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3E5275A2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685823; cv=none; b=XNhqA13Tg/Vz54l8qqfvGkoRG4CkC2lwXr5vepe5vfN/6vQQ9N+U6xuHiUtoAoiMOQdL2NbA9eg1N4XeW9XgN6gcRYx66DrvZqBeIUeEtu4WDJeJW+hsyCpCCdWZsXfXNHBviSK+kmk/HU33VeD23Bi75UNlzcegJ3F1N2Od6Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685823; c=relaxed/simple;
	bh=Wk0HMCA6fSa91P/9TA6WyIYhLGAauvmsYHIf7CKRui4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwBCgG6OCgrReI/AGyAJc5mR23Ewfm4bbGfeXCSC1JCpdEoJOAqcSe2z/fgkmAuA1w4mVZ6ACMadpEryVSsf+zleSRBZRY+yD+hYJRkGxgg2/uDV6zkTJMD/DpUVJ25+oOLQ9z6ItdomCOKozq/XzUBSz7Kl3s8JnZ1p3gQnPFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcE6zQ2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcE6zQ2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1041F000FF;
	Tue, 29 Sep 2026 12:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685820;
	bh=N3pQBIPeU4kgfNPc2czVGyN9J1uJXh7phrPpqePrvUU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WcE6zQ2QvlWMrtJQUUEZxuamgp5A36S7HaP5MZB0g4eZ9uf2ae9YBaoQgyNavhmPr
	 7InOUoAncTnZO0lY6eJqtBIMTkplBiTSh5ju6aBC09cYVfQgoHdBU26Kq5yu+mdO6I
	 qQHW6N+635UPz5ZimUFjXpPb6emnvZCDfZR7M5JcA+tmjjGU8iZrOsqWMKUZiNHNPQ
	 S9quHn0QXa6tns7dhr5KMFIGyQuUeid3XeYJ/aSaFvO4mav/gBJ0pttuDuGsUFk8JD
	 efMOiYRGZr5e/z0XIs5R2HPCTO8eFY24MNoyi7g3HrvBGlLHvmEdAjkrco2dz3RfuB
	 fPssynLHZetUw==
Message-ID: <b5b736c3-badf-4ceb-a4b7-00415bed19fe@kernel.org>
Date: Tue, 29 Sep 2026 14:43:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/syscall: Avoid atomic test_and_clear_thread_flag
 on fast path
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 ritesh.list@gmail.com, ruanjinjie@huawei.com, tglx@kernel.org,
 mkchauras@linux.ibm.com, ryan.roberts@arm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260929071744.2965058-1-mkchauras@gmail.com>
 <84ceaa9a-79fb-4585-a571-7701750df5d1@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <84ceaa9a-79fb-4585-a571-7701750df5d1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/09/2026 à 11:50, Shrikanth Hegde a écrit :
> 
> 
> On 9/29/26 12:47 PM, Mukesh Kumar Chaurasiya (IBM) wrote:
>> In system_call_exception(), test_and_clear_thread_flag(TIF_SYSCALL_RET)
>> performs an atomic bit test-and-clear operation on every system call 
>> entry.
>> This introduces an unnecessary performance regression on the syscall fast
>> path.
>>
> 
> Do you have numbers?
> 
>> Combine the TIF_SYSCALL_RET check with the unlikely error condition from
>> syscall_enter_from_user_mode_randomize_stack() using non-atomic
>> test_thread_flag(). If the flag is set or entry failed, only then 
>> clear the
>> flag via clear_thread_flag() and return the error value.
>>
> 
> It probably needs a fixes tag.

It is not a bug, unless we can figure out a quantified regression.

> 
>> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
>> ---
>>   arch/powerpc/kernel/syscall.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/ 
>> syscall.c
>> index fbefe1927b10..8529827d697f 100644
>> --- a/arch/powerpc/kernel/syscall.c
>> +++ b/arch/powerpc/kernel/syscall.c
>> @@ -18,14 +18,12 @@ notrace long system_call_exception(struct pt_regs 
>> *regs, unsigned long r0)
>>       long ret;
>>       syscall_fn f;
>> -    if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, 
>> &r0))) {
>> +    if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, 
>> &r0) ||
>> +            test_thread_flag(TIF_SYSCALL_RET))) {
>>           clear_thread_flag(TIF_SYSCALL_RET);
>>           return syscall_get_error(current, regs);
>>       }
>> -    if (unlikely(test_and_clear_thread_flag(TIF_SYSCALL_RET)))
> 
> I am bit surprised that test_and_clear_bit does
> atomic operations even when bit is not set.

It does (on ppc64 smp)

	sync
   1:	ldarx
	andc
	stdcx.
	bne 1b
	sync

It is optimised to clear a bit that is set. When the bit is already 
unset you still get the full sequence allthough it does nothing.

> 
>> -        return syscall_get_error(current, regs);
>> -
>>       if (unlikely(r0 >= NR_syscalls)) {
>>           if (unlikely(trap_is_unsupported_scv(regs))) {
>>               /* Unsupported scv vector */
> 


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278E53FCB10
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355524; cv=none; b=VzqWhl0vSIisDcEUK7I7C3oo3VN9XzZH18Q8vig35hbAJ47vDR7oabgHZUsqqD45OVWB6MP5sA7hzAyiw8lu05pFW/s4DO6w1vargN0AlydkD5OU37pJR7AlExnvxBKTUuz3uKzddgLuyzd+hb+ka4vL6H19WVUxGZSTyNDnF4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355524; c=relaxed/simple;
	bh=uU2+GbXTX8QmmpNzHy+pWqXrVoyqr7YA88Yy1vt6LG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TET0JXfTwXmdNb4JauwFlrH5OqGmTKz7bB8OGFEcQj5XiJiBKvCrhrROTliut/bi93SE9SZxur3xzCCZ6RyRrmFi77A6JY0Vge1Up/x9KncfGefQL+upA1FVrXnUwtqnNHkUmtdN2v9Rly07xPS6YyDNJoZsv3H94EQ8NQbnTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YVwI0Hzu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YVwI0Hzu"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89348152B;
	Tue,  6 Oct 2026 23:45:16 -0700 (PDT)
Received: from [192.168.11.117] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9BA13F86F;
	Tue,  6 Oct 2026 23:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791355519; bh=uU2+GbXTX8QmmpNzHy+pWqXrVoyqr7YA88Yy1vt6LG0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YVwI0Hzur+k5fsg42N+FBWf7NXcd9k6GMaukxrC4x4kRqpAq4U3ceVhRSX29FS0kb
	 PKJAFhPaeGxiKEOyXqdMmitJY5sC9B5Cg0o5HxVMRgfqLEej/QBBWT/CIPLNPNt4KQ
	 2Lz+w3/m73tBOcvxvYni3FEKKV4i1HuVd2Axmho0=
Message-ID: <6376e301-c6ef-4094-83de-83ea9d17791a@arm.com>
Date: Wed, 7 Oct 2026 07:45:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: sleep: factor sleep_save_stash slot lookup
 into a macro
To: Bradley Morgan <brads@mainlining.org>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, leo.bras@arm.com
References: <20260919121044.13883-1-brads@mainlining.org>
 <29F5ED22-7DB5-4AF9-B999-CB3BAAB9A9E2@mainlining.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <29F5ED22-7DB5-4AF9-B999-CB3BAAB9A9E2@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/4/26 14:05, Bradley Morgan wrote:
> On 19 September 2026 13:10:44 BST, Bradley Morgan <brads@mainlining.org>
> wrote:
>> Both __cpu_suspend_enter() and _cpu_resume() open code the same
>> MPIDR_EL1 hash lookup to find the current CPU's slot in
>> sleep_save_stash. Factor it into a get_sleep_stash_slot
>> macro.
>>
>> Since that macro would be the only remaining user of
>> compute_mpidr_hash, inline the hash computation into
>> get_sleep_stash_slot and just remove compute_mpidr_hash
>> altogether.
> +CC more people, polite ping on this patch guys! :)
> 

I'm not sure it makes the code clearer:

- I see that Will suggested inlining compute_mpidr_hash, but to
  my taste, a dedicated helper is easier to comprehend.

- The new get_sleep_stash_slot uses a mix of fixed and
  parameterised registers, which forces the reader to look at how
  the registers are used. Also using fixed registers shifts the
  burden of making them available to the user of the macro.

Just my 2p.

Cheers
Vladimir

>> No functional change intended.
>>
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> ---
>> Resending from my new address.
>>
>> arch/arm64/kernel/sleep.S | 103 +++++++++++++++-----------------------
>> 1 file changed, 41 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
>> index f093cdf71be1..c1bec489ea76 100644
>> --- a/arch/arm64/kernel/sleep.S
>> +++ b/arch/arm64/kernel/sleep.S
>> @@ -7,48 +7,48 @@
>>
>> 	.text
>> /*
>> - * Implementation of MPIDR_EL1 hash algorithm through shifting
>> + * Compute the address of the current CPU's entry in sleep_save_stash,
>> + * i.e. &sleep_save_stash[hash(MPIDR_EL1)], where the hash is an
>> + * implementation of the MPIDR_EL1 hash algorithm through shifting
>>  * and OR'ing.
>>  *
>> - * @dst: register containing hash result
>> - * @rs0: register containing affinity level 0 bit shift
>> - * @rs1: register containing affinity level 1 bit shift
>> - * @rs2: register containing affinity level 2 bit shift
>> - * @rs3: register containing affinity level 3 bit shift
>> - * @mpidr: register containing MPIDR_EL1 value
>> - * @mask: register containing MPIDR mask
>> - *
>>  * Pseudo C-code:
>>  *
>> - *u32 dst;
>> + *	u64 mpidr = MPIDR_EL1 & mpidr_hash.mask;
>> + *	u32 hash = ((mpidr & 0xff) >> mpidr_hash.shift_aff[0]) |
>> + *		   ((mpidr & 0xff00) >> mpidr_hash.shift_aff[1]) |
>> + *		   ((mpidr & 0xff0000) >> mpidr_hash.shift_aff[2]) |
>> + *		   ((mpidr & 0xff00000000) >> mpidr_hash.shift_aff[3]);
>> + *	slot = &sleep_save_stash[hash];
>> + *
>> + * @slot: output register
>>  *
>> - *compute_mpidr_hash(u32 rs0, u32 rs1, u32 rs2, u32 rs3, u64 mpidr, u64 mask) {
>> - *	u32 aff0, aff1, aff2, aff3;
>> - *	u64 mpidr_masked = mpidr & mask;
>> - *	aff0 = mpidr_masked & 0xff;
>> - *	aff1 = mpidr_masked & 0xff00;
>> - *	aff2 = mpidr_masked & 0xff0000;
>> - *	aff3 = mpidr_masked & 0xff00000000;
>> - *	dst = (aff0 >> rs0 | aff1 >> rs1 | aff2 >> rs2 | aff3 >> rs3);
>> - *}
>> - * Input registers: rs0, rs1, rs2, rs3, mpidr, mask
>> - * Output register: dst
>> - * Note: input and output registers must be disjoint register sets
>> -         (eg: a macro instance with mpidr = x1 and dst = x1 is invalid)
>> + * Clobbers: x2 - x8
>>  */
>> -	.macro compute_mpidr_hash dst, rs0, rs1, rs2, rs3, mpidr, mask
>> -	and	\mpidr, \mpidr, \mask		// mask out MPIDR bits
>> -	and	\dst, \mpidr, #0xff		// mask=aff0
>> -	lsr	\dst ,\dst, \rs0		// dst=aff0>>rs0
>> -	and	\mask, \mpidr, #0xff00		// mask = aff1
>> -	lsr	\mask ,\mask, \rs1
>> -	orr	\dst, \dst, \mask		// dst|=(aff1>>rs1)
>> -	and	\mask, \mpidr, #0xff0000	// mask = aff2
>> -	lsr	\mask ,\mask, \rs2
>> -	orr	\dst, \dst, \mask		// dst|=(aff2>>rs2)
>> -	and	\mask, \mpidr, #0xff00000000	// mask = aff3
>> -	lsr	\mask ,\mask, \rs3
>> -	orr	\dst, \dst, \mask		// dst|=(aff3>>rs3)
>> +	.macro get_sleep_stash_slot slot
>> +	mrs	x3, mpidr_el1
>> +	adr_l	x2, mpidr_hash
>> +	ldr	x8, [x2, #MPIDR_HASH_MASK]
>> +	/*
>> +	 * Following code relies on the struct mpidr_hash
>> +	 * members size.
>> +	 */
>> +	ldp	w4, w5, [x2, #MPIDR_HASH_SHIFTS]
>> +	ldp	w6, w7, [x2, #(MPIDR_HASH_SHIFTS + 8)]
>> +	and	x3, x3, x8			// mask out MPIDR bits
>> +	and	x2, x3, #0xff			// aff0
>> +	lsr	x2, x2, x4			// hash = aff0 >> shift_aff[0]
>> +	and	x8, x3, #0xff00			// aff1
>> +	lsr	x8, x8, x5
>> +	orr	x2, x2, x8			// hash |= aff1 >> shift_aff[1]
>> +	and	x8, x3, #0xff0000		// aff2
>> +	lsr	x8, x8, x6
>> +	orr	x2, x2, x8			// hash |= aff2 >> shift_aff[2]
>> +	and	x8, x3, #0xff00000000		// aff3
>> +	lsr	x8, x8, x7
>> +	orr	x2, x2, x8			// hash |= aff3 >> shift_aff[3]
>> +	ldr_l	\slot, sleep_save_stash
>> +	add	\slot, \slot, x2, lsl #3	// slot = &sleep_save_stash[hash]
>> 	.endm
>> /*
>>  * Save CPU state in the provided sleep_stack_data area, and publish its
>> @@ -74,20 +74,8 @@ SYM_FUNC_START(__cpu_suspend_enter)
>> 	mov	x2, sp
>> 	str	x2, [x0, #SLEEP_STACK_DATA_SYSTEM_REGS + CPU_CTX_SP]
>>
>> -	/* find the mpidr_hash */
>> -	ldr_l	x1, sleep_save_stash
>> -	mrs	x7, mpidr_el1
>> -	adr_l	x9, mpidr_hash
>> -	ldr	x10, [x9, #MPIDR_HASH_MASK]
>> -	/*
>> -	 * Following code relies on the struct mpidr_hash
>> -	 * members size.
>> -	 */
>> -	ldp	w3, w4, [x9, #MPIDR_HASH_SHIFTS]
>> -	ldp	w5, w6, [x9, #(MPIDR_HASH_SHIFTS + 8)]
>> -	compute_mpidr_hash x8, x3, x4, x5, x6, x7, x10
>> -	add	x1, x1, x8, lsl #3
>> -
>> +	/* publish this CPU's sleep_stack_data area in its stash slot */
>> +	get_sleep_stash_slot x1
>> 	str	x0, [x1]
>> 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
>> 	stp	x29, lr, [sp, #-16]!
>> @@ -117,18 +105,9 @@ SYM_FUNC_START(_cpu_resume)
>> 	mov	x0, x19
>> 	bl	finalise_el2
>>
>> -	mrs	x1, mpidr_el1
>> -	adr_l	x8, mpidr_hash		// x8 = struct mpidr_hash virt address
>> -
>> -	/* retrieve mpidr_hash members to compute the hash */
>> -	ldr	x2, [x8, #MPIDR_HASH_MASK]
>> -	ldp	w3, w4, [x8, #MPIDR_HASH_SHIFTS]
>> -	ldp	w5, w6, [x8, #(MPIDR_HASH_SHIFTS + 8)]
>> -	compute_mpidr_hash x7, x3, x4, x5, x6, x1, x2
>> -
>> -	/* x7 contains hash index, let's use it to grab context pointer */
>> -	ldr_l	x0, sleep_save_stash
>> -	ldr	x0, [x0, x7, lsl #3]
>> +	/* retrieve this CPU's context pointer from its stash slot */
>> +	get_sleep_stash_slot x1
>> +	ldr	x0, [x1]
>> 	add	x29, x0, #SLEEP_STACK_DATA_CALLEE_REGS
>> 	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
>> 	/* load sp from context */
>>
> --- Thanks!
> "I'm not a very positive person" - Linus torvalds
> 


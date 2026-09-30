Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125F4DD3B7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772288; cv=none; b=GAvczZ9uOfEa3WEjME40eyrfah+Uq54MtIJTfxOrANysmReV+SDzvo17qgfyusCXDJNMoogRByFcBoKw8NZ0LZvArsdm1eliy8hi2/7HYZudfKsghWP6ElvG0bVlNHz4/j7Cf3oFtM13wGhzEVbud7soRWbQ0WdKTkVr+mvnpDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772288; c=relaxed/simple;
	bh=ODdy+OVnMHHnjk8A038fFUYxpLLAHHqArbGfcu+N3Mk=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=bzduVgaEu2ccxtvwT8jdsk0Y2qukoNsVtmqTu1C+DWpWP3QtwL45fFa6OriW9AALo3WDfGMlUruUp9Ky0ptuAzOkR0ENeMUdAkoCRpY3xz/l+hzlCAwNooY7ihJZjB1Rk2FX7ZUACAmjgPP3zlHPPnRecePx0tTyOa2gICwpTAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hvvrS4WQ0z8XrrX;
	Wed, 30 Sep 2026 20:44:40 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl2.zte.com.cn with SMTP id 68UCiWqe008576;
	Wed, 30 Sep 2026 20:44:32 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 30 Sep 2026 20:44:35 +0800 (CST)
X-Zmail-TransId: 2b056abd04331fe-2db6d
X-Mailer: Zmail v1.0
Message-ID: <20260930204435252HHqIHw0fBhdP4X3CWnK02@zte.com.cn>
Date: Wed, 30 Sep 2026 20:44:35 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <gao.rui@zte.com.cn>
To: <david.laight.linux@gmail.com>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jiangfeng@kylinos.cn>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <jmontleo@redhat.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2M10gcmlzY3Y6IGZpeCBzdHJubGVuKCkgb3ZlcmZsb3cgaW4gWmJiIGltcGxlbWVudGF0aW9u?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 68UCiWqe008576
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 30 Sep 2026 20:44:40 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6ABD0438.000/4hvvrS4WQ0z8XrrX

Hi David,

Thanks for the detailed review.

>On Wed, 30 Sep 2026 09:48:57 +0800 (CST)
><gao.rui@zte.com.cn> wrote:
>
>> riscv: fix strnlen() overflow in Zbb implementation
>> 
>> The RISC-V Zbb optimized strnlen() implementation can return incorrect
>> results when very large count values are supplied.
>> 
>> The previous implementation calculates an end address based on the
>> input pointer and count. When count is close to SIZE_MAX, the address
>> calculation may overflow, resulting in incorrect termination checks and
>> wrong return values.
>> 
>> This issue was observed while running device-mapper tests:
>> 
>> dmsetup create testname9 --table "0 8 zero"
>> cat /sys/block/dm-*/dm/name
>> dmsetup remove testname9
>> 
>> Rework the Zbb implementation to use a word counter instead of an end
>> address. This removes the dependency on end-address calculations,
>> avoids overflow entirely, and simplifies the termination condition of
>> the word scanning loop. The final length is calculated using the saved
>> original pointer.
>> 
>> Performance was evaluated with string_bench_strnlen:
>> 
>> New Implementation Previous Implementation
>> 
>> len=0 : 71 ns/call 70 ns/call
>> len=1 : 82 ns/call 81 ns/call
>> len=7 : 83 ns/call 81 ns/call
>> len=8 : 83 ns/call 81 ns/call
>> len=16 : 94 ns/call 90 ns/call
>> len=31 : 117 ns/call 113 ns/call
>> len=64 : 175 ns/call 167 ns/call
>> len=127 : 259 ns/call 258 ns/call
>> len=512 : 802 ns/call 833 ns/call
>> len=1024 : 1512 ns/call 1536 ns/call
>> len=3173 : 4581 ns/call 4640 ns/call
>> len=4096 : 6256 ns/call 6068 ns/call
>> 
>> Results show comparable performance to the previous implementation
>> while fixing the overflow issue.
>> 
>> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
>> Suggested-by: DavidLaight <david.laight.linux@gmail.com>
>> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
>> 
>> ---
>> v3:
>> - Keep the original register allocation (t0-t4) and numeric labels.
>> - Keep the original comments.
>> - Calculate word count as (remaining - 1) / SZREG + 1, removing the
>>   branch from the calculation.
>> v2:
>> - Rework the Zbb implementation to eliminate end-address overflow
>>   instead of falling back to the generic path.
>> - Use a decrementing word counter for word scanning.
>> - Run KUnit string tests successfully.
>> - Add string_bench_strnlen benchmark results.
>> ---
>>  arch/riscv/lib/strnlen.S | 54 +++++++++++++++++--------------
>>  1 file changed, 29 insertions(+), 25 deletions(-)
>> 
>> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
>> index a8911605c248..000000000000 100644
>> --- a/arch/riscv/lib/strnlen.S
>> +++ b/arch/riscv/lib/strnlen.S
>> @@ -73,6 +73,9 @@
>>      /* If maxlen is 0, return 0. */
>>      beqz    a1, 3f
>> 
>> +    /* Save original pointer for final length calculation. */
>> +    mv    t4, a0
>> +
>>      /* Number of irrelevant bytes in the first word. */
>>      andi    t2, a0, SZREG-1
>> 
>> @@ -82,15 +85,6 @@
>>      li    t3, SZREG
>>      sub    t3, t3, t2
>>      slli    t2, t2, 3
>> -
>> -    /*
>> -     * Aligned boundary.  Use the address of the last valid byte
>> -     * (s + count - 1) to avoid loading a word past the count
>> -     * boundary in the loop below.  count == 0 is handled above.
>> -     */
>> -    add    t4, a0, a1
>> -    addi    t4, t4, -1
>> -    andi    t4, t4, -SZREG
>> 
>>      /* Get the first word.  */
>>      REG_L    t1, 0(t0)
>> @@ -125,15 +119,26 @@
>> 
>>      bgtu    t3, a0, 2f
>> 
>> -    /* All remaining bytes are in the first word, no loop needed. */
>> -    bgeu    t0, t4, 2f
>> +    /*
>> +     * Use a word counter to avoid calculating an end address,
>> +     * which might overflow when count is close to SIZE_MAX.
>> +     */
>> +    sub    t2, a1, t3
>> +    beqz    t2, 3f
>
>Is that right?
>The equality check seems wrong.
>Does it work when there are more characters in the first word than
>the caller specified length.
>
It does. The new code is only reached when the preceding

bgtu t3, a0, 2f

does not branch. a0 is min(offset of the first NUL in the shifted
word, a1), and the shifted first word has exactly t3 significant
bytes, so the offset is within [0, t3].

>> 
>> -    /* Prepare for the word comparison loop. */
>> -    addi    t2, t0, SZREG
>> +    /* Calculate the word count: count = (remaining - 1) / SZREG + 1 */
>> +    addi    t2, t2, -1
>> +#if defined(CONFIG_64BIT)
>> +    srli    t1, t2, 3
>> +#else
>> +    srli    t1, t2, 2
>> +#endif
>> +    addi    t2, t1, 1
>> +
>>      li    t3, -1
>> 
>>      /*
>> -     * Our critical loop is 4 instructions and processes data in
>> +     * Our critical loop is 6 instructions and processes data in
>
>The diff below adds one instruction - I make that 5.
>But the instruction count isn't what really matters, what matters
>is the number of clocks it takes the loop to execute.
>

Correct, I'll fix the comment to say 5.

>>       * 4 byte or 8 byte chunks.
>>       */
>>      .p2align 3
>> @@ -141,23 +146,22 @@
>>      REG_L    t1, SZREG(t0)
>>      addi    t0, t0, SZREG
>>      orc.b    t1, t1
>> -    bgeu    t0, t4, 4f
>
>Hasn't that (the old code) just read beyond the end of the buffer
>
Yes. The final iteration loads the aligned word containing
s + count - 1, which may extend up to SZREG - 1 bytes beyond the
logical end. That is safe because the load is SZREG-aligned and
cannot cross a page boundary, which is the same approach used in
strlen.S. The new word-count loop preserves that property.

>> -    beq    t1, t3, 1b
>> +    bne    t1, t3, 4f
>> +    addi    t2, t2, -1
>> +    bnez    t2, 1b
>
>You want to put the 'addi t2, t2, -1' higher up next to the other addi.
>Then simple cpu will execute it while waiting for the read to complete.
>The old code did that - but got it wrong.
>You can do the length check while the cpu is (otherwise) stalled waiting
>for the read. So something like:
>1:    REG_L    t1, SZREG(t0)
>    addi    t0, t0, SZREG
>    addi    t2, t2, -1
>    bnez    t2, 3f
>    orc.b    t1, t1
>    beq    t1, t3, 1b
>2:    // Found a zero
>    ...
>    ret
>
>3:    orc.b    t1, t1
>    bne    t1, t3, 2b
>    // No zero
>
>The count (t1) would need to be one lower.
>
Done. I've moved the decrement closer to the load while keeping the
NUL check before the counter check 

>Did you try just subtracting SZREG from the length-left
>and doing an unsigned compare against the original size?
>I think it should work and saves the setup code.
>
>David
>
I think that approach needs some additional care around the same
overflow corner case that this patch is addressing.

For example, when a1 = SIZE_MAX and t3 = 1, the remaining-byte
counter starts at SIZE_MAX - 1. On the final iteration, subtracting
SZREG causes it to wrap into the range
[2^XLEN - SZREG + 1, 2^XLEN - 1]. Depending on the exact unsigned
termination test, that wrapped value may still compare as in-range,
making it easy to miss the termination condition.

The current implementation computes

words = (remaining - 1) / SZREG + 1

once during setup and then uses an exact decrementing word counter.
This avoids any dependence on wrapped byte counts, works for all
values of a1, and only costs a few setup instructions, so I'd
prefer to keep this approach.

 Thanks,
Rui

>> +
>> +    /* Scanned all words without finding NUL, return maxlen. */
>> +    mv    a0, a1
>> +    ret
>> +
>>  4:
>>      not    t1, t1
>>      CZ    t1, t1
>>      srli    t1, t1, 3
>> 
>> -    /* Get number of processed bytes. */
>> -    sub    t2, t0, t2
>> -
>> -    /* Add number of characters in the first word.  */
>> -    add    a0, a0, t2
>> -
>> -    /* Add number of characters in the last word.  */
>> +    /* Length = (current - original) + offset in final word. */
>> +    sub    a0, t0, t4
>>      add    a0, a0, t1
>> -
>> -    /* Ensure the final result does not exceed maxlen. */
>>      minu    a0, a0, a1
>>  2:
>>      ret
>> --
>> 2.27.0

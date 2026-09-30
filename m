Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465E471410
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757949; cv=none; b=N8NnYnWYMhXQqW8xo9nBLQqBKTBv8VH30cyQzD5Rsv9ZOwVMYl5DRLTHX5vi2HKXwx3xCnBW6zYDUHbDNy4T4HYreZj9ZZrsCVRGNGWEEWi0vPj2GmikPxtP8m/wR2hb/Obe6AaW0tdDjloGbzrHvdB/yF+JXB9763j/iq3zBsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757949; c=relaxed/simple;
	bh=tyUhAZBNcNg45lFRA9Vg88E/IDfDrPp3ysNKbK4ZPN8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WF5BZEKEpdZCDBwvI3D+ukFfZnCfRlgyA63Wb8PZSmrHcZUy+FmbG9gAe14974RfJxs+crw9Ts7JtfmvW31eJo/cG+ONJDW+ArdS7FeVdlwzTOD7g5OWj3t4DugkKQOVaLwiaT1P1mnIvQ6GrEanDcUt93ll8T1oyrAQkmu2HH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HE17g0ZU; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HE17g0ZU"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so507582f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757942; x=1791362742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mF7HlrBlQvO0gfGzj2Av7N0MU2dcxYSnBCQbxi4I9IE=;
        b=HE17g0ZUm58Ze9VQWYJRA0C7K6D/uR7q6SSVx4qJpZuXrmJaX3ofZF6y8/2u552hPY
         I4fNgi8Cfhk3x8Uo6myO85S760DkPismc1QbdJzh0dU371botQbsttzqkCXkaE87V+sQ
         7zySPVRSldjRU76sPDN6lRWkmHZKqsIWcEg66k6VL7fEr6XNBq8QiFenlqP8h8pyNkoE
         FwGEAQFKqIEfVmIb3QfnojrZ0hXESsUVVcHIYx51cV8CIA1u+t9pEErhj4JeZ1nYVjeX
         z1Li8aZbFwLp5j8pPrvumu6Qz3//Mz6ESGSbqKcPUZCAajiybmpzj0ur39ku/jIe4nAV
         ti6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757942; x=1791362742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF7HlrBlQvO0gfGzj2Av7N0MU2dcxYSnBCQbxi4I9IE=;
        b=HT+Xp3NKAZgpAVhCueis3exaIyzoPoZfZjUIAFW7uSYlv7e4DluIwUKw5G/dETOQAa
         EsItCgMe37KPC0HA/1tj56JM6wXak16YQyCab3fryt4t3lL004cepa6OVPgJ1kBtcDYE
         rB+I9qqyrvl1UDQlKEgvXxMKvOb0GstAw2ors0pY32mjNlkG8qXf2zWVOdRt75z/zi1H
         E0im0ZGAk405WY+l8VT2VZvHzDsgMypXryb+h9IVeUoJ5abYsN5fGEx31ispOE2eOyP3
         7D6o1eEnrTUtUCg6nFOkiH0Mp0qhQegqSaO8OlsqofkYbbmiZCRNteX9zvUG7UPtw36V
         7irA==
X-Forwarded-Encrypted: i=1; AKwUvByVKfV9XtYjdwjOXjOWvevCnHLoFbYjspFr//WcmryWiWtYuBaSVeKcodr5Za5QUUyJRvCviLYSiWMfY30=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVoh9vEq1w9bTl+mKBFGlcV3nPMu57Ty+THSW4satNUDrbVOfr
	Ikiy2EpbnzlPt/wmI28mrfwARfsvgVSPqWDdK3/rzsYq6Fg5owZmmPr8
X-Gm-Gg: AYBFou0yy5wIy5U+b7LZPVnot/JkjwBoFm422VBLI70A2dvkDdxUoq+HvOYyw+NMTWH
	vkvzqzBKr7y9eDoRh7mCLuz9LB4RX0s6Anm13Y3fXnRxmpvPA7tXQElpTCer9PbeyGWYNsDlMNs
	5+gXzLgpOxlRcr6vklQ3ULnQ7zsflXnQG9VgeMfY1exGLNCryk2WuAfQnD2kw9xJ4Y82DPjLjYL
	F612e45o2u2eL3X8nwD5hZyZnqOb//8Rp6b0qArBUmtMWAhSQqFU6e4a97ql2qkcTxZwNLULMWa
	hhOSa/uN6uUQkMMvvbwZ/GenM2kxbmcN/I3eAJH8eYjqLLE9RR+sifZyROxMkwEyPak4sAuh/g/
	IWrLpf9gvfLfwRSklNgq3PhQXMQgzy28PVO673Og/j/F4cVJMDYY8xwghUIlSZY0VBXskvmHpl0
	QvJpi6+P8N9TQAOsyPQgECS+gthWN0R7yS8QFewJ67iBcFjpTaqBE5yy+0wnvZpjUejzXDL3gAG
	+kqRRTNmySyKANfLTBsPrbh9WPk1WY1wp0=
X-Received: by 2002:a05:6000:471a:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48b024e51dcmr1351463f8f.29.1790757941376;
        Wed, 30 Sep 2026 01:45:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949f45sm1854526f8f.2.2026.09.30.01.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:45:40 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:45:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: <gao.rui@zte.com.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <jiangfeng@kylinos.cn>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <jmontleo@redhat.com>
Subject: Re: [PATCH v3] riscv: fix strnlen() overflow in Zbb implementation
Message-ID: <20260930094539.6242e256@pumpkin>
In-Reply-To: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
References: <202609300948576198tT3nfO5VwsTwUw23gA9v@zte.com.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 09:48:57 +0800 (CST)
<gao.rui@zte.com.cn> wrote:

> riscv: fix strnlen() overflow in Zbb implementation
> 
> The RISC-V Zbb optimized strnlen() implementation can return incorrect
> results when very large count values are supplied.
> 
> The previous implementation calculates an end address based on the
> input pointer and count. When count is close to SIZE_MAX, the address
> calculation may overflow, resulting in incorrect termination checks and
> wrong return values.
> 
> This issue was observed while running device-mapper tests:
> 
> dmsetup create testname9 --table "0 8 zero"
> cat /sys/block/dm-*/dm/name
> dmsetup remove testname9
> 
> Rework the Zbb implementation to use a word counter instead of an end
> address. This removes the dependency on end-address calculations,
> avoids overflow entirely, and simplifies the termination condition of
> the word scanning loop. The final length is calculated using the saved
> original pointer.
> 
> Performance was evaluated with string_bench_strnlen:
> 
> New Implementation Previous Implementation
> 
> len=0 : 71 ns/call 70 ns/call
> len=1 : 82 ns/call 81 ns/call
> len=7 : 83 ns/call 81 ns/call
> len=8 : 83 ns/call 81 ns/call
> len=16 : 94 ns/call 90 ns/call
> len=31 : 117 ns/call 113 ns/call
> len=64 : 175 ns/call 167 ns/call
> len=127 : 259 ns/call 258 ns/call
> len=512 : 802 ns/call 833 ns/call
> len=1024 : 1512 ns/call 1536 ns/call
> len=3173 : 4581 ns/call 4640 ns/call
> len=4096 : 6256 ns/call 6068 ns/call
> 
> Results show comparable performance to the previous implementation
> while fixing the overflow issue.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Suggested-by: DavidLaight <david.laight.linux@gmail.com>
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
> 
> ---
> v3:
> - Keep the original register allocation (t0-t4) and numeric labels.
> - Keep the original comments.
> - Calculate word count as (remaining - 1) / SZREG + 1, removing the
>   branch from the calculation.
> v2:
> - Rework the Zbb implementation to eliminate end-address overflow
>   instead of falling back to the generic path.
> - Use a decrementing word counter for word scanning.
> - Run KUnit string tests successfully.
> - Add string_bench_strnlen benchmark results.
> ---
>  arch/riscv/lib/strnlen.S | 54 +++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..000000000000 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -73,6 +73,9 @@
>  	/* If maxlen is 0, return 0. */
>  	beqz	a1, 3f
> 
> +	/* Save original pointer for final length calculation. */
> +	mv	t4, a0
> +
>  	/* Number of irrelevant bytes in the first word. */
>  	andi	t2, a0, SZREG-1
> 
> @@ -82,15 +85,6 @@
>  	li	t3, SZREG
>  	sub	t3, t3, t2
>  	slli	t2, t2, 3
> -
> -	/*
> -	 * Aligned boundary.  Use the address of the last valid byte
> -	 * (s + count - 1) to avoid loading a word past the count
> -	 * boundary in the loop below.  count == 0 is handled above.
> -	 */
> -	add	t4, a0, a1
> -	addi	t4, t4, -1
> -	andi	t4, t4, -SZREG
> 
>  	/* Get the first word.  */
>  	REG_L	t1, 0(t0)
> @@ -125,15 +119,26 @@
> 
>  	bgtu	t3, a0, 2f
> 
> -	/* All remaining bytes are in the first word, no loop needed. */
> -	bgeu	t0, t4, 2f
> +	/*
> +	 * Use a word counter to avoid calculating an end address,
> +	 * which might overflow when count is close to SIZE_MAX.
> +	 */
> +	sub	t2, a1, t3
> +	beqz	t2, 3f

Is that right?
The equality check seems wrong.
Does it work when there are more characters in the first word than
the caller specified length.

> 
> -	/* Prepare for the word comparison loop. */
> -	addi	t2, t0, SZREG
> +	/* Calculate the word count: count = (remaining - 1) / SZREG + 1 */
> +	addi	t2, t2, -1
> +#if defined(CONFIG_64BIT)
> +	srli	t1, t2, 3
> +#else
> +	srli	t1, t2, 2
> +#endif
> +	addi	t2, t1, 1
> +
>  	li	t3, -1
> 
>  	/*
> -	 * Our critical loop is 4 instructions and processes data in
> +	 * Our critical loop is 6 instructions and processes data in

The diff below adds one instruction - I make that 5.
But the instruction count isn't what really matters, what matters
is the number of clocks it takes the loop to execute.

>  	 * 4 byte or 8 byte chunks.
>  	 */
>  	.p2align 3
> @@ -141,23 +146,22 @@
>  	REG_L	t1, SZREG(t0)
>  	addi	t0, t0, SZREG
>  	orc.b	t1, t1
> -	bgeu	t0, t4, 4f

Hasn't that (the old code) just read beyond the end of the buffer

> -	beq	t1, t3, 1b
> +	bne	t1, t3, 4f
> +	addi	t2, t2, -1
> +	bnez	t2, 1b

You want to put the 'addi t2, t2, -1' higher up next to the other addi.
Then simple cpu will execute it while waiting for the read to complete.
The old code did that - but got it wrong.
You can do the length check while the cpu is (otherwise) stalled waiting
for the read. So something like:
1:	REG_L	t1, SZREG(t0)
	addi	t0, t0, SZREG
	addi	t2, t2, -1
	bnez	t2, 3f
	orc.b	t1, t1
	beq	t1, t3, 1b
2:	// Found a zero
	...
	ret

3:	orc.b	t1, t1
	bne	t1, t3, 2b
	// No zero

The count (t1) would need to be one lower.

Did you try just subtracting SZREG from the length-left
and doing an unsigned compare against the original size?
I think it should work and saves the setup code.

David

> +
> +	/* Scanned all words without finding NUL, return maxlen. */
> +	mv	a0, a1
> +	ret
> +
>  4:
>  	not	t1, t1
>  	CZ	t1, t1
>  	srli	t1, t1, 3
> 
> -	/* Get number of processed bytes. */
> -	sub	t2, t0, t2
> -
> -	/* Add number of characters in the first word.  */
> -	add	a0, a0, t2
> -
> -	/* Add number of characters in the last word.  */
> +	/* Length = (current - original) + offset in final word. */
> +	sub	a0, t0, t4
>  	add	a0, a0, t1
> -
> -	/* Ensure the final result does not exceed maxlen. */
>  	minu	a0, a0, a1
>  2:
>  	ret
> --
> 2.27.0


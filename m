Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4647126F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327392; cv=none; b=GjiZol81dn1m8veVH/XPOpUp0W1Fuoqq9hiqGz1Uj09l+BlMfLShWIlImeHhZDJDBah3k6gdHrqm4GYK2w0Vl9mGsQSrqLD3R7gl4vYIxXxaojCzzvdmzRqD7G+t1Ha2DjMLCzVW6IgpYdmjGMg6mFBBhE9WXzJ5s+W3BbJSZ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327392; c=relaxed/simple;
	bh=ziqkExW6zk46iaOzNCUmkUDQrko4rpiJdrRTpSfwp/A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=czejsb9TpizlTIyc+NoyslqzGCxUXZ267F37x1CtYfgJuxXiG+uig4Uui2D2fzdTKoB5okOjp1KlXzR/fTHECAmaUgPoP6IKnCwWER8+a+b9333LjkZsSxWqj9xK/DLqtAb6WzAquUtU9U7UqQIJjuhkfO8cifpl0Bltuy7E35k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHM1hN0v; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHM1hN0v"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so349303f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790327388; x=1790932188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vlqi5ipL/fx0oBY6ltjeY+Xbl5LvlZhr3/dMDAYIk50=;
        b=QHM1hN0vkv3//x9TAYi5Sylv9z4jFpYf4E3tPlTQyckr/bSTM3MjF5tGnYqE8Zl7FR
         y7SZEbHfGFzqPhOZUe5Dxw0vj3V3PIAb2C2pjfNypmL7lLaa4WUZRcXQbejfjfiIU+9X
         7i54epfbO51eSrZp+yFoMxfHpAvoD8fQ8OkONgkXZofmz9O4tZA+DPpprliPWIiRizpu
         xV7sQ/vR+BZz8BrzmZ4HyZ+AWaaErKs6Z+ASofeBZf42eoHSxcT9QIaTlFaQy/ycRFcS
         56+vyWBLqKB/i119JzZBpwnNHrqS5Sg+PXsPa0mWmeVCzjnVLYLaBB+BtncCY7sEFh2E
         zc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327388; x=1790932188;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vlqi5ipL/fx0oBY6ltjeY+Xbl5LvlZhr3/dMDAYIk50=;
        b=k5d+obx8CHohtHzqlxnxYViUi26giwQqf60MgdwkkL2teKUKFr3c+OEuBo3muKOjpX
         wMfC/b1Mn0PbnYiC3xQ0scPWhruTGLNo3zY+82S57qwEXAFa67pfFqle3bjsBmRfyS0f
         KFS3M1DoRjAZdB4fqubQgttgN1kPj7IHZBU2suf0yPk9OYo+6I4k0xlSNFu3xRvdpnfY
         EH3FTj1ksCGp5a2ca0n3qfKqfnnM1e/ddGJR1em4jI3mhLvVpbaKeSheQlB8mIg+u4jf
         ZwT/zjqJi96fcge/rXvhMHxP8AKgwaRLYqFGZ8BGbG5k9TdbBe2Kw+FLjaBDpmkCKOWn
         rrNg==
X-Forwarded-Encrypted: i=1; AKwUvBzpoWC9a2ZDsj/B1xloQr7XRsS76SBS03wjweAnTM5hi2sNypGPqT37jo7vxocaipvScIz9wgqPkJyWu+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nSE3O+GVlUQ6aTtT5FIeP9v8kmXNGeDROr3olQTvSKLMX+BKZK
	zyGyZHHcteTACbvHvhGVMdvKcWNK3MWXWImUa/6NXNQHSpZu2oRWoKo3
X-Gm-Gg: AYBFou0X+9rXc0SBuB6zS1gFLCCCTIj/6aNZCYP9HJzQiJppFiGHoLDM/G4AX1cPyKG
	ts/xPFoy7Cly1mQ1MmDkA9kC97ImFcPmjnwwW+pmhtd5MzFFGmqcp4+NCsxwt/lK6ukGcIR95iZ
	irmkC5RdjwYhqrxEzN6YrjsufB/XFHhFsmTmRBwn8wiv5MAQ4qqS8KY4Wf3VjUTa+pu7krDcQ5Y
	p5VWgPVEVnkg00xQJGKkjVPxwhf5xdHrMt2P7F9RywTngyTKlS8T6f+2gy7pJkdRMJ7Hi2u6COM
	jyGmtumdjRnSGIcX/77kHALr0IH6nG/iGl4j8RTgYY7v56nQA3hPPFyLJjKZf4U4n4BteE0Hui7
	C6KxXoPFP7LVtPUOx6vVWaTLL6VFgiGwpQ7Dg61YSTTIe2H8aqE83YAINk7D+Dx5m5q59wMnEGk
	HnokUd5xc87nJsSzZL+aLDsS+A458q4PJJPgMR5TZbqxIXMXre190gV02dySSWLX0zKifqyZy43
	VRM8a1ZYgzb4dFYsoE3+u8u83FhqhOXWZ4=
X-Received: by 2002:a5d:64e9:0:b0:487:1575:ebef with SMTP id ffacd0b85a97d-4887176868bmr9522369f8f.47.1790327387384;
        Fri, 25 Sep 2026 02:09:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm6089428f8f.20.2026.09.25.02.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:47 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:09:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: <gao.rui@zte.com.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <jiangfeng@kylinos.cn>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <jmontleo@redhat.com>
Subject: Re: [PATCH v2] riscv: fix strnlen() overflow in Zbb implementation
Message-ID: <20260925100945.2df80cd4@pumpkin>
In-Reply-To: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
References: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 10:57:08 +0800 (CST)
<gao.rui@zte.com.cn> wrote:

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
> Rework the Zbb implementation to use a decrementing word counter. 
> This removes the dependency on end-address calculations,
> avoids overflow entirely, and simplifies the word scanning loop.
> 
> Performance was evaluated with string_bench_strnlen:
> 
> New Implementation Previous Implementation
> 
> len=0 : 70 ns/call 70 ns/call
> len=1 : 81 ns/call 81 ns/call
> len=7 : 81 ns/call 81 ns/call
> len=8 : 81 ns/call 81 ns/call
> len=16 : 97 ns/call 90 ns/call
> len=31 : 119 ns/call 113 ns/call
> len=64 : 174 ns/call 162 ns/call
> len=127 : 264 ns/call 258 ns/call
> len=512 : 801 ns/call 824 ns/call
> len=1024 : 1578 ns/call 1550 ns/call
> len=3173 : 4541 ns/call 4703 ns/call
> len=4096 : 5984 ns/call 5982 ns/call
> 
> Results show comparable performance to the previous implementation
> while fixing the overflow issue.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
> 
> ---
> v2:
> - Rework the Zbb implementation to eliminate end-address overflow
> instead of falling back to the generic path.
> - Use a decrementing word counter for word scanning.
> - Replace numeric labels with descriptive local labels.
> - Add comments describing the loop structure.
> - Run KUnit string tests successfully.
> - Add string_bench_strnlen benchmark results.
> ---
>  arch/riscv/lib/strnlen.S | 111 +++++++++++++++++----------------------
>  1 file changed, 48 insertions(+), 63 deletions(-)
> 
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..0d074e45363c 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -67,102 +67,87 @@ strnlen_zbb:
>  	 *   a1 - Max length of string
>  	 *
>  	 * Clobbers
> -	 *   t0, t1, t2, t3, t4
> +	 *   t0, t1, t2, t3, t4, t5, t6
>  	 */
> 
>  	/* If maxlen is 0, return 0. */
> -	beqz	a1, 3f
> +	beqz	a1, .Lmaxlen
> 
> -	/* Number of irrelevant bytes in the first word. */
> -	andi	t2, a0, SZREG-1
> +	/* Save original pointer: final length = (current - orig) + offset. */
> +	mv	t2, a0
> +
> +	/* Bytes preceding the string in the first word. */
> +	andi	t6, a0, SZREG-1

This patch is made larger by pointless changes to the temporary
registers and numeric labels.

> 
>  	/* Align pointer. */
>  	andi	t0, a0, -SZREG
> 
> -	li	t3, SZREG
> -	sub	t3, t3, t2
> -	slli	t2, t2, 3
> -
> -	/*
> -	 * Aligned boundary.  Use the address of the last valid byte
> -	 * (s + count - 1) to avoid loading a word past the count
> -	 * boundary in the loop below.  count == 0 is handled above.
> -	 */
> -	add	t4, a0, a1
> -	addi	t4, t4, -1
> -	andi	t4, t4, -SZREG
> +	li	t5, SZREG
> +	sub	t5, t5, t6
> +	slli	t6, t6, 3
> 
> -	/* Get the first word.  */
> +	/* Load and mask the first word. */
>  	REG_L	t1, 0(t0)
> -
> -	/*
> -	 * Shift away the partial data we loaded to remove the irrelevant bytes
> -	 * preceding the string with the effect of adding NUL bytes at the
> -	 * end of the string's first word.
> -	 */

Why have you deleted that comment?

> -	SHIFT	t1, t1, t2
> -
> -	/* Convert non-NUL into 0xff and NUL into 0x00. */
> +	SHIFT	t1, t1, t6
>  	orc.b	t1, t1
> -
> -	/* Convert non-NUL into 0x00 and NUL into 0xff. */
>  	not	t1, t1
> -
> -	/*
> -	 * Search for the first set bit (corresponding to a NUL byte in the
> -	 * original chunk).
> -	 */
>  	CZ	t1, t1
> 
> -	/*
> -	 * The first chunk is special: compare against the number
> -	 * of valid bytes in this chunk.
> -	 */
> +	/* NUL offset inside the first (shifted) word. */
>  	srli	a0, t1, 3
> -
> -	/* Limit the result by maxlen. */
>  	minu	a0, a0, a1
> 
> -	bgtu	t3, a0, 2f
> +	/* If the NUL lies inside the valid bytes of this first chunk, done. */
> +	bgtu	t5, a0, .Ldone
> +
> +	/*
> +	 * Remaining bytes = a1 - t5 (never underflows here).
> +	 * Word count = ceil(remaining / SZREG) without addi-wrap hazard.
> +	 */
> +	sub	t4, a1, t5
> +	beqz	t4, .Lmaxlen
> 
> -	/* All remaining bytes are in the first word, no loop needed. */
> -	bgeu	t0, t4, 2f
> +#if defined(CONFIG_64BIT)
> +	srli	t1, t4, 3
> +	andi	t4, t4, 7
> +#else
> +	srli	t1, t4, 2
> +	andi	t4, t4, 3
> +#endif
> +	beqz	t4, 1f
> +	addi	t1, t1, 1

I'm sure you've got a cmpeq instruction that will generate a 0/1 and
remove the branch.

> +1:
> +	mv	t4, t1

Or just calculate as: count = (remaining - 1)/SZREG + 1;

OTOH I think you can use:
	unsigned remaining = len;
	do {
		...
	} while ((remaining -= SZ) < len);
For 'normal' lengths the loop will terminate when remaining wraps.
If len is ~0 the condition is always true. 

> 
> -	/* Prepare for the word comparison loop. */
> -	addi	t2, t0, SZREG
>  	li	t3, -1
> 
>  	/*
> -	 * Our critical loop is 4 instructions and processes data in
> -	 * 4 byte or 8 byte chunks.
> +	 * Critical loop: exactly one backward branch.
> +	 * addi t4 is hoisted before orc.b to hide in the load-use latency.

That all depends on the implementation of the cpu.
A multi-issue cpu is likely to perform the two adds in the same clock
(and also in the same clock as the memory read instruction).
A cpu that supports speculative execution will hide the load delay.
So the comment isn't really accurate at all.

Having said that, there are loops that x86 cpu execute faster if
arranged to only have one register incremented/decremented in the loop.
So there might be benefits in the alternative patch.

David

>  	 */
>  	.p2align 3
> -1:
> +2:
>  	REG_L	t1, SZREG(t0)
>  	addi	t0, t0, SZREG
> +	addi	t4, t4, -1
>  	orc.b	t1, t1
> -	bgeu	t0, t4, 4f
> -	beq	t1, t3, 1b
> -4:
> +	bne	t1, t3, .Lfound
> +	bnez	t4, 2b
> +
> +.Lmaxlen:
> +	mv	a0, a1
> +.Ldone:
> +	ret
> +
> +.Lfound:
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
> +	/* Length = bytes already passed + offset in final word. */
> +	sub	a0, t0, t2
>  	add	a0, a0, t1
> -
> -	/* Ensure the final result does not exceed maxlen. */
>  	minu	a0, a0, a1
> -2:
> -	ret
> -3:
> -	mv	a0, a1
>  	ret
> 
>  .option pop


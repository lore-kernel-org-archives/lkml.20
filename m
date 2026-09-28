Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31ED49E130;
	Mon, 28 Sep 2026 15:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609967; cv=pass; b=AeAmcTcS0eoBTBzizV6pTXC7W+xhIcdzwEwZVcnEWugHgLaAz3KB3t+/POU3asLEGeM8jQvRLAFRjfNPXhtD648fcS6XB5yMuN02q3c3UG1VD+ZlgQD4acZQ1K5LYcroVY7omsLEBzSoB/Ckj2Jfnx0QauClo1dlXiDt9lGOZvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609967; c=relaxed/simple;
	bh=YIbYpe4p/RH2FSrwgkSGxp7tUd4whuGvG7PD7eJTMWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kQVZ0jhrC/9ZeaHvrpuGDyywk9+S1u+hbiS/F35nUtsWS1K7yFHLp/tKsB7MyG3fPhtii6eZD+FthVbL4IocY3CseRneFZVol/41kHYj8YvdWu65FnETqFMjEAYQkmHVBVkJVdwi83OpkE9fVRoklPKtr2JP8LMPT2shtJH7gyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=evpTtjxU; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="evpTtjxU"
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: ske@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6659E201E30;
	Mon, 28 Sep 2026 17:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790609955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iAS7Xn20eHnu7nBLirj+NwXWifXwpNJP+zHNGR7v4EI=;
	b=evpTtjxUS3KmUUGdG8lfr6zB1fuFYQLXOD6opEvb1BbaIyt1tWUF+gPD9j26G1ooKuzelL
	nelAKgqvKlf+7JjQmhk6kkXpu32fGfbhbE0drlfV8tcNVaS0HrOikkMunRrso3UTc+PUkH
	1lwGWMCpHLTWwo6wVMETBxPHWZ17aMWHHdFiJ78L99p+cKYjeYH8fLuMTHGsqwefLWfKmD
	VD3wTpvyGtG/TO7lHFeixXsbAWYbieRDA3TpNlZlP3Zz3gwW/r5fz1FIxnEni9fYl46vhY
	gzYnj7s7B7xHBYNIVa0n/9lny238AxHCOl06pq2dVmL+1z2TGXKvCf+V/277tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790609955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iAS7Xn20eHnu7nBLirj+NwXWifXwpNJP+zHNGR7v4EI=;
	b=VEr1o+O1dsRdc0mfp4yy4bbrN3o1Q2zKTIioIWALKdiggpVgNmD9kG5PlHZnR1s7FxIpJu
	GSbwVAiYjo3hPIaCUFjiiQQdSY9RzfATjdBf9c2wjmttNVcDBMerBxp+bUw308Ywimng6Z
	AupFTo+MVspETZ8xyOYnZS85H7EA/r1MPGQixPTwlByWCqb8yUYcZlBX+QkKK4SFdsMLMG
	mgHvQP44B5f1dcebCpwjz8EgYBYM++CBRGLTr8rkasCn8DGB3fCMSlD3Qe0KiZVgSvwvnW
	8i1MHJEPg6eggrRb4Yd6edFgZJXAlsHz0vfSo47RqOGZv+rD6SAfcrOIEutpuw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790609955; a=rsa-sha256;
	cv=none;
	b=CFrDFy27ko2UuuF0YapYe1XYDzTOknQidWrdgFvYo0j6nfXrGl4Eh76+sbH5gTiTdaw6Xl
	qHUCAsEGzcQ0HnlLc9aN5KyyIRQySZB3TDAuG3v1HenzGVdjvi0NaeQezeQauebkGTQuTv
	Et06ICSMV7w5qCLIaeVbUG8+8NSW0oLwRjSeJC0n+stzvT0dQJmAadat8rBgAOUYHhvk9l
	UKWAHkHTInJFjtm6jZg6TRK8HV9x5AJxDjzhuTWlUbWfZ0v0M06flNZNOKoI2rBP1mSCcy
	XzOWXb6AMdV3xoF1oLutqqMG/S4+of1IaNAY9uVK4+1rF7a86A60GLVJ0tbtPA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=ske@pengutronix.de smtp.mailfrom=s.kerkmann@pengutronix.de
Message-ID: <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
Date: Mon, 28 Sep 2026 17:39:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Ian Rogers <irogers@google.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
Content-Language: en-US, de-DE
From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
In-Reply-To: <20251016205126.2882625-3-irogers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ian,

On 10/16/25 22:51, Ian Rogers wrote:
> Type punning is necessary for get/put unaligned but the use of a
> packed struct violates strict aliasing rules, requiring
> -fno-strict-aliasing to be passed to the C compiler. Switch to using
> memcpy so that -fno-strict-aliasing isn't necessary.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  include/vdso/unaligned.h | 41 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
> index ff0c06b6513e..9076483c9fbb 100644
> --- a/include/vdso/unaligned.h
> +++ b/include/vdso/unaligned.h
> @@ -2,14 +2,43 @@
>  #ifndef __VDSO_UNALIGNED_H
>  #define __VDSO_UNALIGNED_H
>  
> -#define __get_unaligned_t(type, ptr) ({							\
> -	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
> -	__get_pptr->x;									\
> +#include <linux/compiler_types.h>
> +
> +/**
> + * __get_unaligned_t - read an unaligned value from memory.
> + * @type:	the type to load from the pointer.
> + * @ptr:	the pointer to load from.
> + *
> + * Use memcpy to affect an unaligned type sized load avoiding undefined behavior
> + * from approaches like type punning that require -fno-strict-aliasing in order
> + * to be correct. As type may be const, use __unqual_scalar_typeof to map to a
> + * non-const type - you can't memcpy into a const type. The
> + * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its required
> + * expression rather than type, a pointer is used to avoid warnings about mixing
> + * the use of 0 and NULL. The void* cast silences ubsan warnings.
> + */
> +#define __get_unaligned_t(type, ptr) ({					\
> +	type *__get_unaligned_ctrl_type __always_unused = NULL;		\
> +	__unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_unaligned_val; \
> +	__builtin_memcpy(&__get_unaligned_val, (void *)(ptr),		\
> +			 sizeof(__get_unaligned_val));			\
> +	__get_unaligned_val;						\
>  })
>  
> -#define __put_unaligned_t(type, val, ptr) do {						\
> -	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
> -	__put_pptr->x = (val);								\
> +/**
> + * __put_unaligned_t - write an unaligned value to memory.
> + * @type:	the type of the value to store.
> + * @val:	the value to store.
> + * @ptr:	the pointer to store to.
> + *
> + * Use memcpy to affect an unaligned type sized store avoiding undefined
> + * behavior from approaches like type punning that require -fno-strict-aliasing
> + * in order to be correct. The void* cast silences ubsan warnings.
> + */
> +#define __put_unaligned_t(type, val, ptr) do {				\
> +	type __put_unaligned_val = (val);				\
> +	__builtin_memcpy((void *)(ptr), &__put_unaligned_val,		\
> +			 sizeof(__put_unaligned_val));			\
>  } while (0)
>  
>  #endif /* __VDSO_UNALIGNED_H */

commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to
memcpy()"), which landed in 7.0, causes a performance regression on an NXP
i.MX25 (ARMv5TE) SoC.

I found it while updating a client's board from 6.12 to 7.0. A fio 4k randwrite
benchmark on a NAND storage with UBI and UBIFS filesystem was the only workload
that showed a clear regression between those two versions, so I bisected with
it:

perf stat -e irq:irq_handler_entry --filter 'irq == 49' -a \
    -- \
    fio --name=rw \
    --filename=/var/stat/testfile \
    --size=8M \
    --rw=randwrite \
    --bs=4k \
    --direct=0 \
    --fsync=1 \
    --numjobs=4 \
    --group_reporting

| kernel | irq_handler_entry | fio bw   |
| ------ | ----------------- | -------- |
| 6.12   | 155783            | 401KiB/s |
| 6.13   | 162317            | 395KiB/s |
| 6.14   | 168741            | 392KiB/s |
| 6.15   | 168556            | 401KiB/s |
| 6.16   | 166090            | 403KiB/s |
| 6.17   | 162541            | 385KiB/s |
| 6.18   | 157527            | 386KiB/s |
| 6.19   | 183675            | 381KiB/s |
| 7.0    | 190372            | 297KiB/s |

The bisect targeted the large drop between 6.19 and 7.0; the smaller 6.17
regression predates this commit and is unrelated. Reverting a339671db64b
restores throughput to the 6.17 level (~385 KiB/s). The commit is still
present in 7.3-rc5, and the same codegen problem reproduces there.

Digging deeper, I built 7.3-rc5 with my config and GCC 16.2, with and without
the commit, and compared the object files: 114 of them differ. As
<vdso/unaligned.h> is included by <linux/unaligned.h>, every
get/put_unaligned() call site depends on it transitively. GCC did not inline
__builtin_memcpy() and turned it into a function call, e.g. in crypto/crc32c.c
(__chksum_finup(), inlined into chksum_digest()):

Without the commit:

<chksum_digest>:
                   str    lr, [sp, #-0x4]!
                   sub    sp, sp, #12
                   str    lr, [sp, #-0x4]!
                   bl    0xc0 <chksum_digest+0xc> @ imm = #-0x8
        R_ARM_CALL    __gnu_mcount_nc
                   ldr    r0, [r0]
                   str    r3, [sp, #0x4]
                   ldr    r0, [r0, #0x20]
                   bl    0xd0 <chksum_digest+0x1c> @ imm = #-0x8
        R_ARM_CALL    crc32c
                   mvn    r2, r0
                   mov    r0, #0
                   ldr    r3, [sp, #0x4]
                   lsr    r12, r2, #8
                   lsr    r1, r2, #16
                   strb    r2, [r3]
                   lsr    r2, r2, #24
                   strb    r12, [r3, #0x1]
                   strb    r1, [r3, #0x2]
                   strb    r2, [r3, #0x3]
                   add    sp, sp, #12
                   ldr    pc, [sp], #4

With the commit:

<chksum_digest>:
                   push    {r4, lr}
                   sub    sp, sp, #8
                   str    lr, [sp, #-0x4]!
                   bl    0x124 <chksum_digest+0xc> @ imm = #-0x8
        R_ARM_CALL    __gnu_mcount_nc
                   ldr    r0, [r0]
                   ldr    r12, [pc, #0x54]        @ 0x188 <chksum_digest+0x70>
                   ldr    r0, [r0, #0x20]
                   mov    r4, r3
                   ldr    r12, [r12]
                   str    r12, [sp, #0x4]
                   mov    r12, #0
                   bl    0x144 <chksum_digest+0x2c> @ imm = #-0x8
        R_ARM_CALL    crc32c
                   mvn    r3, r0
                   mov    r2, #4
                   mov    r0, r4
                   mov    r1, sp
                   str    r3, [sp]
                   bl    0x15c <chksum_digest+0x44> @ imm = #-0x8
        R_ARM_CALL    memcpy
                   ldr    r3, [pc, #0x20]         @ 0x188 <chksum_digest+0x70>
                   ldr    r2, [r3]
                   ldr    r3, [sp, #0x4]
                   eors    r2, r3, r2
                   mov    r3, #0
                   bne    0x184 <chksum_digest+0x6c> @ imm = #0x8
                   mov    r0, #0
                   add    sp, sp, #8
                   pop    {r4, pc}
                   bl    0x184 <chksum_digest+0x6c> @ imm = #-0x8
        R_ARM_CALL    __stack_chk_fail
     188: 00 00 00 00      .word    0x00000000
        R_ARM_ABS32    __stack_chk_guard

Is this an accepted trade-off? My understanding is that the kernel is always
built with -fno-strict-aliasing, so the packed-struct type punning was well
defined there, and the __packed annotation is what lets GCC generate valid
code for the unaligned access.

Best regards,
Stefan

-- 
Pengutronix e.K.                       | Stefan Kerkmann             |
Steuerwalder Str. 21                   | https://www.pengutronix.de/ |
31137 Hildesheim, Germany              | Phone: +49-5121-206917-128  |
Amtsgericht Hildesheim, HRA 2686       | Fax:   +49-5121-206917-9    |


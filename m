Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C91A357D1D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203051; cv=none; b=R081GJAh3oXZw31h8HQnGbNZlqtUesYhW53sqc3k4aqwhULq1ASsPJuO/QBMm4VVObeFypBW117AarHG6Smav7rIJB0r8eqmgfptBz6tGG/HQWjPzZVGjnobxIqYDrWo8IhySvc3uJnmb2Xw0WXfgy6BlqJlC/E5QP/JBRrl2rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203051; c=relaxed/simple;
	bh=yP95nTGtvsy873nNSB+nfupYly/y1xNvRbmiSaWnyqE=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=eg8OhNhIYUePx79cFDrmmK1JP1KlT0nsLHfOKz/YcPiDKPGqJ+0c2s7uMfGOMSEatoYbXSKTjR4nq4VVwB+lTBBT3KrbyglI/a4Y/d6N2CfPu7aaKzGnLr77EioUQJ9qHNAT6q1civPuYN1QQEBCQo4BIDzukrySC6+xMoYWPac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtuRP4TL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtuRP4TL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3273508a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203049; x=1788807849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc:to
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaGTRAWSBUw2/SKz8a7uyMoVqzIL+CJjDVztLjnCEd4=;
        b=RtuRP4TLaq9aPepURkrkR3mSfo1KkcXs6aNVpgwtOlD9mo1QZdQyqT8v6RDyl83/aW
         h4hgme1ysUYkGWMHm2BnUzYfrrBb653OQ+GCo4TMRcXwUYyZXYT6SO6m4329pESBqZK+
         wh6eSw5wecb7W31+vjoVjG+GTAE8KIO/nM1G6RyEGGsUciHLrcbgy3xYBVyE+9ib4W+4
         CRaUIlwtnO0/zVb53SGxyi+yDkaocFK3K9DwQIJ+PtDa1fmNjngr4m9s0eqQjoDa+erC
         Uvjp3RR+wCHxvx26A9ieBDYYfcWkjq69ACzU+cVBf9fcwsoxKHsn2rfcB2h2UDjskOXe
         f8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203049; x=1788807849;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc:to
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaGTRAWSBUw2/SKz8a7uyMoVqzIL+CJjDVztLjnCEd4=;
        b=c4p04kRNIcGS7Iw0uvSKVXgPxE9dlkhwA6C3De7iYsZQJvPcelDEZ2nq+uZdPbjQlM
         nKtiGv1e0M+rauzol5WE2i5FY1AbVx52ltqMNmH931Iqd7ffXOu6oejFLUIbfs5oUwQ2
         ARXXwLT20XstW28GnR2oH5ajir7jEhvHATKrlrZW7XwCrxmTAa+cEbqqmhx0tJmVqnw9
         +tyH78E2HVAyaozH2+2w/YUhBOZwoTIZvmMCztHBCyg3H3ScOzz8Ca/JbtAzoh7SIfrc
         xEaLiVrlWzwICHMLoJiv8U2PGNplk5eRacg6qsUDnsteyMTdDgeevJcnWPIUmHNtfqNi
         9TkQ==
X-Gm-Message-State: AFuF++nX5U33IWAWSykH+mhd5pxp7QoaXFqvzxYdt5RVJho+x8zWn6zK
	5BEZCdjqXRAIEOA/D3P1T6yTg9s/FHwKVS6h9DGpXlxPenrB0MLeKfDD
X-Gm-Gg: AYBFou1mNEFAgPgGX4HP1TafbGIRx6Q+e6dN44f8cXry6byndJ4nrEwD9lUpvFjdYgk
	eRQJThKCIEFZslTCZo2GlmVPhOy19/xt9PVRrCpqQUbq2Letij6S6QHFxNiZiBk3+TetiiFwguF
	l2oQ8jlc8ZCOZEG/9K+UCp2z49W5v6WNiLfvQNltIrZQlMkevtQiEYO/4+gSnFqsX2C5xIypl7F
	ZPwwiLy19d+DFKnIfXu6Z6eWCy+FzURLBw3C4DUc8/rW0xgpcKET0SQD2xn/EbNIPirxXojX2+e
	qkinUk20ZSaxvBZgHAgJYh0Tzru6zQyFodeqf61+hcuHsv45JaMyDgXqc1VRig5TU0ScX+zxSU2
	jqzALlyk9AfvHWpVU2VJz/mEyG6nZKK11a3fMNaEZeZDhuK9PrSgSFdAYVSCCQXHLNLJlkDgXLk
	wbajNnOy7UG4Xn4mWPsvvKmaIapQebHyGOU6wfLFMrQiHP2g36udpZwfg9vL3meuwi377o9wvFE
	wKvCABLzH0M4gy6OtLC6dOm
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr3102531a91.2.1788203049355;
        Mon, 31 Aug 2026 12:04:09 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm37141411eec.9.2026.08.31.12.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 12:04:08 -0700 (PDT)
Message-ID: <27f2418a-e54e-4af7-b554-c0d1fe18a4a9@gmail.com>
Date: Mon, 31 Aug 2026 12:04:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] sparc64: increase kernel thread stack size to 32K
Content-Language: en-US
References: <f3719bb0-e892-49cc-af82-79e2569a8a90@gmail.com>
To: Stian Halseth <stian@itx.no>, Andreas Larsson <andreas@gaisler.com>,
 davem@davemloft.net, sparclinux@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 David Laight <david.laight.linux@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, thuth@redhat.com,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 nroach44@nroach44.id.au
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <f3719bb0-e892-49cc-af82-79e2569a8a90@gmail.com>
X-Forwarded-Message-Id: <f3719bb0-e892-49cc-af82-79e2569a8a90@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Stian,

**Revised for clarity.

Thanks for following up on this. As I mentioned to Andreas back in 
May/June 2026, the current combined stack usage is already very close to 
the 32K limit. If you need an immediate workaround, increasing the stack 
to 64K is probably the best option to provide enough headroom and avoid 
the stack overflow panics we are currently seeing.

While I haven't observed any panics with a 32K stack on kernel 7.1 so 
far, operating so close to the boundary is still a significant concern. 
It is worth noting that sparc64 definitely crashes with a 16K stack. 
Additionally, the Nvidia/Mellanox mlx5 driver allocates a large stack on 
sparc64, which pushes usage to the 32K boundary, and other drivers might 
do the same. Therefore, a 64K stack is far more ideal.

Regarding the kernel compilation, when I build the kernel with 
-fstack-usage to generate .su files on the 7.1 kernel, the static 
analysis shows stack frames for USB core functions. For example:

     hub_event: 2457 bytes (static)
     hub_activate: 1892 bytes (static)
     usb_control_msg: 1248 bytes (static)

However, my runtime stack tracing paints a dramatically different picture:

     STACKTRACE: hub_event():entry: 31856 bytes used
     STACKTRACE: hub_activate():entry: 31680 bytes used
     STACKTRACE: usb_control_msg():entry: 30768 bytes used

P.S. I haven't actually tested a 64K stack yet—I am offering this 
recommendation primarily based on how close the current usage is to the 
32K boundary.

Regards,
Tony

On 8/31/26 10:29 AM, Stian Halseth wrote:
> From: Tony Rodriguez<unixpro1970@gmail.com>
>
> Kernel stacks on sparc64 are 16K and this is no longer enough:
> several machines (SPARC T5-2 among them) panic early in boot during
> USB hub enumeration with "corrupted stack end detected inside
> scheduler". sparc has not been converted to THREAD_INFO_IN_TASK, so
> thread_info sits at the bottom of the kernel stack and a marginal
> overflow corrupts it first; CONFIG_SCHED_STACK_END_CHECK then fires
> from __schedule long after the deep path has unwound, which is why
> the reported backtraces look shallow.
>
> Measurements with CONFIG_STACK_TRACER on an UltraSPARC T4-1 show the
> problem is frame count, not any single large frame. The high-water
> mark of an ordinary successful boot is 12616 of 16384 bytes (77%),
> reached in hub_probe() with a printk console flush and then a timer
> interrupt (which runs on the task stack, and whose scheduler tick
> performs load balancing and IPI delivery) stacked on top. Of the 66
> frames in that path the largest is 408 bytes, and ~85% of them are
> 176-224 bytes - at or just above the SPARC V9 ABI minimum frame
> (128-byte register window save area plus 48-byte argument save
> area). An equivalent call chain on x86-64 costs roughly a third of
> the stack, so a 16K stack on sparc64 provides far less effective
> call depth than on other 64-bit architectures.
>
> Double THREAD_SIZE to 32K (four 8K pages). The PAGE_SHIFT
> conditionals are dropped: sparc64 only supports 8K base pages, so
> the other branches were dead code. Kernel stacks become order-2
> allocations; sparc64 has no VMAP_STACK, but stacks are allocated
> once per thread and the trade against boot-time panics is a good
> one.
>
> Link:https://lore.kernel.org/all/20260519075809.8993-1-unixpro1970@gmail.com/
> Signed-off-by: Tony Rodriguez<unixpro1970@gmail.com>
> [stian: reduced the diff to the THREAD_* defines, measured stack
>   usage with CONFIG_STACK_TRACER and rewrote the changelog]
> Signed-off-by: Stian Halseth<stian@itx.no>
> ---
> v2:
>   - drop the CONFIG_SPARC64 / PAGE_SHIFT conditional chain from v1;
>     thread_info_64.h is only built on sparc64 and only 8K pages are
>     supported, so define the three constants unconditionally
>   - replace the panic backtrace in the changelog with stack tracer
>     measurements answering David Laight's review comments:
>     https://lore.kernel.org/all/20260520144104.618c75ca@pumpkin/
>   - retitled from "unify thread stack sizing and add explicit 32KB
>     stack"; the sizing logic for other configurations is unchanged
>
> Tested on an UltraSPARC T4-1, booted with the stack tracer armed
> ("stacktrace") before and after this patch. The boot high-water mark
> is 12616 bytes on both kernels - the worst path (hub_probe with a
> printk and a timer interrupt on top) is deterministic - i.e. 77% of
> the 16K stack before, 38% of the 32K stack after. DEBUG_STACK_USAGE
> agrees: the peak boot-time task shows 9208 bytes left of 16K before
> vs 25592 bytes left of 32K after (7176 bytes used in both).
>
>   arch/sparc/include/asm/thread_info_64.h | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/include/asm/thread_info_64.h
> --- a/arch/sparc/include/asm/thread_info_64.h
> +++ b/arch/sparc/include/asm/thread_info_64.h
> @@ -99,13 +99,8 @@
>   #define FAULT_CODE_BLKCOMMIT	0x10	/* Use blk-commit ASI in copy_page */
>   #define	FAULT_CODE_BAD_RA	0x20	/* Bad RA for sun4v		   */
>   
> -#if PAGE_SHIFT == 13
> -#define THREAD_SIZE (2*PAGE_SIZE)
> -#define THREAD_SHIFT (PAGE_SHIFT + 1)
> -#else /* PAGE_SHIFT == 13 */
> -#define THREAD_SIZE PAGE_SIZE
> -#define THREAD_SHIFT PAGE_SHIFT
> -#endif /* PAGE_SHIFT == 13 */
> +#define THREAD_SIZE (4 * PAGE_SIZE)
> +#define THREAD_SHIFT (PAGE_SHIFT + 2)
>   
>   /*
>    * macros/functions for gaining access to the thread information structure
> @@ -128,11 +123,7 @@
>   #endif
>   
>   /* thread information allocation */
> -#if PAGE_SHIFT == 13
> -#define THREAD_SIZE_ORDER	1
> -#else /* PAGE_SHIFT == 13 */
> -#define THREAD_SIZE_ORDER	0
> -#endif /* PAGE_SHIFT == 13 */
> +#define THREAD_SIZE_ORDER	2
>   
>   #define __thread_flag_byte_ptr(ti)	\
>   	((unsigned char *)(&((ti)->flags)))
> --
> 2.53.0

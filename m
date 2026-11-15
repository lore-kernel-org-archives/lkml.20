Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705206;
	b=l9BrfyIVx5yauol26qSnAC9iPS6Ee+ruK+9TPhrLwQJ42P73aYCW78hUYGIHdXi+s9aj
	 +rC5hayp17SYXCS3WeFGa72AtrOo1471v1QAOI7+xueLw6IRasEsM0J84tXXk7+09xz7m
	 rQ/Ylq6gc9MSZTnH3xE/w+O88U3vjTkSZXozur/Zd6HcE8LzR3JtOyRhRE4eAlHOIDfKB
	 sAbblGn+h3PTBhdoq/9nJa664TudXsMgK+ZTcxdwjhCny0Z8UZdRIWnqh9mCREsgeqqDg
	 +dxau+9W1+U94D5YE26xNdGPKVyasYH/dwRgxXQd88DfQBOMo1NHoSU1Z78m20SqUNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UI8zlSuuYeyEvkH8m4fC9E/a2u7b1gVYjwuT2B3/r64=;
	b=hGJ6/iCYEUu35Vuj2wFhNEGzkrvwV3F//V18jkl/lCderMCSFUEwudIOc2Ud0biW4MA3
	 xBAq2Ml23QVyW60gfW34S3bl0Rq+fFCR7N7vT2O3xytVXd84up7+CqNFYkxlTzJIX5Apb
	 eSm310eEuDLxzK+r5f0DpC3rU/wNIb/1PtQQb2l8DQSbXm+Fw8YExZDYOUCFOaNrBpwAT
	 gkpuDVLQLMj+osyGPnTprjAgEqaeUTfvQ/jvAPRrWWtSRdiqOMCFZ2pkBuVdKNNnwoAcf
	 0x1vDNLjNZxnk7KzMzDu9PxNnMv0ZIYRyYK/J5cg7gWaPrDV1vwCnXtnWtRKXLkBGrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YIQzOx+M;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5D606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YIQzOx+M
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso8437655e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705204; x=1795310004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UI8zlSuuYeyEvkH8m4fC9E/a2u7b1gVYjwuT2B3/r64=;
        b=YIQzOx+MIxCX4mKKAFU3lDwY+E24s3BfRzh/ORQGZc1CCDUOWLKBcO9B+3VT6Iifcj
         UC28HJODq+pH0aOUz92zTzX++eOlFota38d5EAXT3I6tNCFHX0Nqp1mDsv8mH29CFdzc
         IlJqE0zq7uZj5+m56/aW/miD1rPvWOkTCCKP1KmiHOKjn0ppuOocfQIisMvRyMxpoTyC
         F03x/su2MCJtUrvlUtYacR2qBR2eNhI3+ISuaq+9vQLazFDkVM1yAqSYrc5g4bvtNYI0
         7KdTcAuyTP2QmiE4ymj2IsPhX6gwKCZHvkqKbDnRCH7BIExw+QkigBxqvXtquTLwzmbo
         JZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705204; x=1795310004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UI8zlSuuYeyEvkH8m4fC9E/a2u7b1gVYjwuT2B3/r64=;
        b=LqqkxMWchjbZ2mQFmQ5epIaVSSk+EzWUudTssNzGMCy5i7hGAvDYdDnizD3c2Jd1EN
         Y+LakXN2Od8AScPJ4jF5KsmDpEFWn7Yfjmu5mExSG0SQncJWgK2TVULLNEqkicNSCTyV
         X4yElbj0XbzshMpF7EUZigECqY4wZctta9YhGzA5ydTS9pY94Dqv/sg8qK/Xi8+hKZPQ
         ZUWaNZcf+9D6RuBYAy8ux/+mvITr0ubgFooOoxW4KoQ/6FcVijgJQyUZ4IVTq0Z3n/tT
         IFmwscQTeT37/v8mdhWH4gG/xzAHdg8j5K33tS5Gxy4iY2yOzv/FXJQzxhmZuhdQ5HbE
         VsSw==
X-Forwarded-Encrypted: i=1; AL+hErHSrXQrQZgxGlvI40zG0Nt6fIIDLcIGvYYIFijQ0c6SEArSgO70EtvMaON8P/2qdSxRewLkRGzQaplsH6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wSf4Pmwz68+2Rrf5CbooxmC0MVWPR6jEaiMyu+gtIoVSQnMYh
	Zvn2ud9rA+aoh5wQuoZUx9h1VxK+gRRdrqtmsJyLXMajCaD5/jkTzz3A
X-Gm-Gg: AYBFou3OPBMk/6uxuQng6eC6vl0BkzymuchL2timwqTTcnH3InwTSNcBRo+qBr4Zg/X
	Trg7P0v4vYGqFQV8ZmrdRl5RisDwx4D+VonWs17a9da2wXo3H45MyNmORng7rTgNpQbp6tjc7ul
	inHhnlaT3Vo4IYTWfGWb3JX3wHkFZdDybQHJsKQzCDYVnL6k/UEZ4SeGRx+2i+6OR2OI/MA9RUf
	DCnzZf5oEMGKo4rLC/5JQiY0W7lz43Bc1QpCix0ujTl/kjZTJYWuFG5K4XBH55zf0wlCnd5i71M
	9k1POJle1Aw0Bds3hPx0dqeS/VJ9r0bx5df/I8tiVYkfo/Xt8rI6OeeSLPP6uk9S86cW1sbYrkZ
	HWTXb5dTQVito4WjCC26PoNjWZTZFwZeUZq57Vu93GuyxsnZZ4FJaQuNXr3zXzaHekRymEbysoy
	DYZPKM7kW+bEHihgqCJB62QGdQdmgZDJ1+1lWnalPMVq1VtEfWK6uNKfNOLlnbJyjDkzMpchNvq
	SjbESTJZw+kC6mHWy+kFhzyg3re8JgmaiAIH2FYgpyOD0tU1LFT6Rhe0NXi+LjbOfWHRgh0lBya
	1SH7P8VqDyyE8OtTqT7r+hZnG9nd4uTQZuiqe/69MSPgjp75ySr4hlNAWaRNlb2Mr9KqG7qubrf
	5s/nxsFk=
X-Received: by 2002:a05:600c:a10a:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4bb55a4f1d8mr101009845e9.15.1794705204022;
        Sat, 14 Nov 2026 17:13:24 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm85013725e9.10.2026.11.14.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:13:23 -0800 (PST)
Date: Sun, 15 Nov 2026 01:13:22 +0000
From: Stafford Horne <shorne@gmail.com>
To: Sahil <sahilcdq0@gmail.com>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	naveen@kernel.org, davem@davemloft.net, mhiramat@kernel.org,
	pjw@kernel.org, wangruikang@iscas.ac.cn, namcao@linutronix.de,
	kees@kernel.org, linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] openrisc: Add utilities and clean up simulation
 of instructions
Message-ID: <avkHMp3Qa_C01Nd8@antec>
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-2-sahilcdq0@gmail.com>
 <au7I8FNoMcsoh54X@antec>
 <52c3ae66-4165-4fc3-a440-fcb76931382a@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52c3ae66-4165-4fc3-a440-fcb76931382a@gmail.com>

On Fri, Nov 13, 2026 at 10:41:56PM +0530, Sahil wrote:
> Hi Stafford,
> 
> On 11/7/26 12:15 PM, Stafford Horne wrote:
> > Hi Sahil,
> > 
> > Thanks for your patches, sorry its taken me time to get around to them, my year
> > since summer has been quite hectic.
> 
> No worries. I completely understand :)
> 
> > I will do the review in chunks so give me some time.
> 
> Thank you for the review.
> 
> > On Tue, Oct 27, 2026 at 01:42:37AM +0530, Sahil Siddiq wrote:
> > > Introduce new instruction-related utilities and macros for OpenRISC.
> > > This is in preparation for patches that add tracing support such as
> > > KProbes and Kretprobes.
> > > 
> > > Currently, PC is first updated and then saved in the link register
> > > (r9) when simulating l.jal and l.jalr. This can result in a corrupted
> > > page table (bad page map in process). Fix this by saving PC in r9
> > > before updating it.
> > > 
> > > Move branch simulation to its own function, simulate_branch(), so it
> > > can be reused. It's already being used by do_illegal_instruction().
> > > It'll also be used by KProbes in the following commit.
> > > 
> > > Introduce simulate_pc() to simulate l.adrp. KProbes will require this
> > > instruction to be simulated as well. simulate_branch() and simulate_pc()
> > > need to be handled differently since branch instructions change the
> > > value of PC while l.adrp depends on PC but doesn't change its value.
> > > 
> > > Use a static key to check if delay slots are disabled. Delay slots are
> > > a part of the CPU's configuration and won't change at runtime. Since
> > > they are often enabled in an OpenRISC CPU, using a static key will
> > > reduce the overhead of checking this flag in the default case while
> > > processing KProbes inserted at branch instructions and simulating them.
> > > 
> > > Link: https://raw.githubusercontent.com/openrisc/doc/master/openrisc-arch-1.4-rev0.pdf
> > > Signed-off-by: Sahil Siddiq <sahilcdq0@gmail.com>
> > > ---
> > > Changes v2 -> v3:
> > > - arch/openrisc/kernel/insn.c:
> > >    - (simulate_pc):
> > >      Handle case when rd=0
> > >      Add function to KProbe blacklist
> > >    - (simulate_branch): Likewise
> > > - arch/openrisc/kernel/setup.c:
> > >    - (setup_arch): Set static key before calling paging_init()
> > > - arch/openrisc/kernel/traps.c:
> > >    - (do_trap): Move handling of Kprobes in commit #2
> > > 
> > > Changes v1 -> v2:
> > > - arch/openrisc/include/asm/cpuinfo.h: Introduce "delay_slot" static key
> > > - arch/openrisc/include/asm/insn-def.h:
> > >     - Use macros instead of union
> > >     - Use better names for macros
> > >     - Use genmask() for masks
> > > - arch/openrisc/kernel/insn.c:
> > >     - Use macros instead of magic values
> > >     - (simulate_pc): Update PC
> > >     - (simulate_branch): Handle rb=r9 in l.jalr simulation
> > > - arch/openrisc/kernel/setup.c: Use "delay slot" static key
> > > - arch/openrisc/kernel/traps.c: Use macros instead of magic values
> > > 
> > >   arch/openrisc/include/asm/cpuinfo.h  |  3 +
> > >   arch/openrisc/include/asm/insn-def.h | 58 ++++++++++++++++--
> > >   arch/openrisc/include/asm/spr_defs.h |  1 +
> > >   arch/openrisc/kernel/Makefile        |  2 +-
> > >   arch/openrisc/kernel/insn.c          | 88 ++++++++++++++++++++++++++++
> > >   arch/openrisc/kernel/setup.c         |  4 ++
> > >   arch/openrisc/kernel/traps.c         | 53 +++--------------
> > >   7 files changed, 159 insertions(+), 50 deletions(-)
> > >   create mode 100644 arch/openrisc/kernel/insn.c
> > > 
> > > [...]
> > > diff --git a/arch/openrisc/kernel/insn.c b/arch/openrisc/kernel/insn.c
> > > new file mode 100644
> > > index 000000000000..619d8080d822
> > > --- /dev/null
> > > +++ b/arch/openrisc/kernel/insn.c
> > > @@ -0,0 +1,88 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * OpenRISC instruction utils
> > > + *
> > > + * Linux architectural port borrowing liberally from similar works of
> > > + * others.  All original copyrights apply as per the original source
> > > + * declaration.
> > > + *
> > > + * OpenRISC implementation:
> > > + * Copyright (C) 2026 Sahil Siddiq <sahilcdq0@gmail.com>
> > > + */
> > > +
> > > +#include <linux/kprobes.h>
> > > +#include <linux/ptrace.h>
> > > +#include <asm/insn-def.h>
> > > +#include <asm/cpuinfo.h>
> > > +
> > > +DEFINE_STATIC_KEY_TRUE(delay_slot);
> > > +
> > > +void simulate_pc(struct pt_regs *regs, unsigned long pc_insn)
> > 
> > Since this simulates l.adrp, maybe the name makes more sense to be called
> > simulate_adrp?
> 
> Sure, I'll rename it.
> 
> > > +{
> > > +	int page_offset;
> > > +	unsigned int rd, op;
> > > +
> > > +	page_offset = sign_extend32(
> > > +		(pc_insn & OPENRISC_ADRP_IMM_MASK) << OPENRISC_ADRP_IMM_SHIFT, 31);
> > > +	rd = (pc_insn & OPENRISC_ADRP_REG_MASK) >> OPENRISC_ADRP_REG_SHIFT;
> > > +	op = get_6_bit_opcode(pc_insn);
> > > +
> > > +	switch (op) {
> > > +	case OPENRISC_OPCODE_ADRP:
> > > +		if (rd != 0)
> > > +			regs->gpr[rd] = page_offset + (regs->pc & OPENRISC_ADRP_OFFSET_MASK);
> > > +		regs->pc += OPENRISC_INSN_SIZE;
> > > +		return;
> > > +	default:
> > > +		break;
> > > +	}
> > > +}
> > > +NOKPROBE_SYMBOL(simulate_pc)
> > > +
> > > +void simulate_branch(struct pt_regs *regs, unsigned long jmp_insn)
> > > +{
> > > +	int displacement;
> > > +	unsigned int rb, op, link_offset, temp;
> > > +
> > > +	displacement = sign_extend32(
> > > +		((jmp_insn) & OPENRISC_JUMP_IMM_MASK) << OPENRISC_JUMP_IMM_SHIFT, 27);
> > > +	rb = (jmp_insn & OPENRISC_JUMP_REG_MASK) >> OPENRISC_JUMP_REG_SHIFT;
> > > +	op = get_6_bit_opcode(jmp_insn);
> > > +	link_offset = OPENRISC_INSN_SIZE;
> > > +
> > > +	if (static_branch_likely(&delay_slot))
> > > +		link_offset <<= 1;
> > 
> > Why do shift left here instead of += OPENRISC_INSN_SIZE? Since logically we are
> > adding one more insn for the delay slot, not doubling.
> 
> Since link_offset is initialized to OPENRISC_INSN_SIZE, shifting it to the left by 1 would
> update link_offset to 2 * OPENRISC_INSN_SIZE. This is a little more obscure than explicitly
> setting it to 2 * OPENRISC_INSN_SIZE. Initially, I thought the left shift operator might be
> less expensive than multiplying.
> 
> I was going through mor1kx's design and noticed there's also a pipelined implementation for
> the multiplier [1]. But it looks like the implementation for shifting is simpler and can be done
> in one cycle. Please let me know if my understanding is incorrect here.

That's correct, but my suggestion was to use += OPENRISC_INSN_SIZE instead of
2 *.

> > However, It may be more efficient to avoid using the alu and write as:
> > 
> >         if (static_branch_likely(&delay_slot))
> >                 link_offset = 2 * OPENRISC_INSN_SIZE;
> >         else
> >                 link_offset = OPENRISC_INSN_SIZE;
> > 
> > what do you think?
> 
> I am not sure if I have understood the alu part. WIll it be more efficient because 2 * OPENRISC_INSN_SIZE
> will be optimized by the compiler to simply be a single number? So no alu operation will be required,
> just one store operation?

Yup, since 2 * OPENRISC_INSN_SIZE is a constant expression the compiler
will replace it with 8.  Then the above code would be just one store operation,
something like:

    if (static_branch_likely(&delay_slot))
	    link_offset = 8;
    else
	    link_offset = 4;


> 
> > > +	switch (op) {
> > > +	case OPENRISC_OPCODE_J: /* l.j */
> > 
> > I think these comments (/* l.j */) are no longer needed sinc you have
> > the named macros.
> 
> Got it, I'll remove the comments.

[snip]

Thanks,
 -Stafford

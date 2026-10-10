Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E797E387596
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791645368; cv=none; b=hhYMJEeUq4OYhHioryOMi15KPSRZceuTIarMNYZZzpe8Uzhuvw/JvHhEkHFLy0Edoq2rnxqIZis2zeL/SkY01cQpA0RmTbHEQuN/IWVZZKeoPdfUO6ws7Hbm8r42cTBH/GinhOhsI8NJWUwa48uBfpJVUDKGUnGzfrRqUuXweg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791645368; c=relaxed/simple;
	bh=pBu865joFVe85JVTOBwNVQFZC3vq13cNHGr43GQYHcQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=bLIQsOZKZ9rrA8qeM9v+DMOATv/hOh8co/a5QzKg6NzbtlM+Yzq6U+vAbVVSsDxG1K/gBqxTIWTMODqY/IDi+1Bkv1t6D7uJ75WoWI8ZRo8dWV3JRaYpN0Jk8yYlILffRrCECmGr0+tN2IU//gvNF0RDi936o4+fk7Cb7kU/eA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kr3kEv5V; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kr3kEv5V"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398b3c37877so262460a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791645366; x=1792250166; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAhU/f94yA5MJ19+HwlVBcw68pCp5HAO2C8k5hVfaXY=;
        b=Kr3kEv5VYzpCLDV+fk/Po0cxqP7Eiayod/RuRukGZQGi3WOv6SICRRBD1KiHLRHOgg
         WnmS0KODbqrf32a3YTR949CZWAI+v/LTR2bnyzz8hmJKzEbQNjMLJmIh7V8oceKaWG8M
         +tE+hYhRYmgk7rS6pmI0Ed4A8Us5bVoJ+M3a4Yggaed4CnOBNNMKZQ+mEfue5Ki8WRxj
         foq3rg6qu/mCFF3OBrdgO31QEWEC3tl5++8YGM8iscivBu0LCSu1RCrcqTgk1dZXUE26
         MjhbMCZB7q59AddRhjkOMlikkyoa4arlqjMJsNNaHaywrykSy2HGI4w6xvlq/YO/iLgn
         eL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791645366; x=1792250166;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAhU/f94yA5MJ19+HwlVBcw68pCp5HAO2C8k5hVfaXY=;
        b=wqReSr0Up56LzjSMG9Ohv6SbmnKEkbVx/MLavdoBifQNwnQsfO9Joem7s15FQiLDKL
         gZBqZZGer4jPIFXmwUTsfUA0fCR00t1m3SdbMNc19X7zdqzQ07thbCU+rT4/KvNBuU/j
         he5PB+K6FT2e4LB/Rtq7oIX3rsU0GYIZ3tFeWU9B+0DK9YLd/r83KBmuWqlZrn4GvuhJ
         pc6T7GzwoNw5xweFbCombAExsQUrREJd4C6zdL99wSnMZaU1OLCPfj2bEZB2pm9H7aoj
         EJdt9BJI81kbvIP0XOW5uxMY+BkervMmoTJpOMHLoM3Dqwr6PMxwNzYbg/Vdmi1Sd0Ev
         9CUA==
X-Forwarded-Encrypted: i=1; AKwUvBwAoHeUu4rCpN+t9YXPGZg90dkabjtrNtPytGzKiPG1gPQ87SYPOf/8xNM4F7I8hvmYq3LSFdKm5S5RR5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPaPLCvY2J5FX+9bZbz7gtFi2DnU4EyZxH+7AjUx2qtBqukxw0
	rKzreudQCkGtyVvmRnzST5nj+/+2wRa9TUKvMyk0Qh0CwhMhOaaV9fFC
X-Gm-Gg: AYBFou1Nmw6feRj8SrS+I10uI+CCX6kdL8XzogYuW91BUhheXzXRHLitQOsHwY30HFd
	w3Dfdk+XziKQuXavuN6fKoUHj0upntOH4BiXLc/3KIHJmsVZp/sRrAMiVZqfSKfgx7nuO8V1WEr
	Yw9ZwMjLTfg+BgJeMHS2iFFu4f8mULorAsNtjnetL2dQqBt4uk1kB8aaA/5XaNF5yKpjOQyQIvf
	fQFVGYORUHNv9S0yA8nqpcNEjXfJYnXTz7bl4sT0MbNQ6OSjVgEtneiluP8Bcd79FpQQpjT8b0N
	xa4EWIB8FbaeTSAevACA9MjKuYpEvr00IgyLY/r7ttkfAsi27XltKIDXjdArfuRioZ/PrWF4xza
	EPdcmWnPGOdq334SKBpEDoMg5yveJ5JBEpvIuxuLr+BVndWY4L32EWu5IfvymgI95mj5+gUQLUT
	B+dwvJB1gvfQOCqfd8q9KwqHFREcxHjcEbk4AN+WPrjHuL5sRb3IxB/T/tqvGjsXZ7P/XaTYdIT
	eh9v8pkgMTN2fpLhQo3abr/RNuOK7wDNI/Cw0Ayd9U+YAyeuLFQMWoupYVBFGouSfy1wgrW6spT
	Aqyq
X-Received: by 2002:a17:90a:d44b:b0:3a8:e1e:3390 with SMTP id 98e67ed59e1d1-3ab3afd49c9mr4437717a91.56.1791645366135;
        Sat, 10 Oct 2026 08:16:06 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f4737esm8539860a91.7.2026.10.10.08.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 08:16:05 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 15:16:04 +0000
Message-Id: <DM199Y25XQ6Q.X5YFLA8I7RSJ@gmail.com>
Cc: <rdunlap@infradead.org>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <jserv@ccns.ncku.edu.tw>,
 <marscheng@google.com>, <eleanor15x@gmail.com>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-m68k@lists.linux-m68k.org>, <bpf@vger.kernel.org>, "Daniel Palmer"
 <daniel@thingy.jp>
Subject: Re: [PATCH v7] m68k, bpf: Add initial BPF JIT compiler support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>, <corbet@lwn.net>,
 <skhan@linuxfoundation.org>, <geert@linux-m68k.org>,
 <daniel@iogearbox.net>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <andrii@kernel.org>, <gerg@linux-m68k.org>
In-Reply-To: <20261005185251.2422114-1-visitorckw@gmail.com>
References: <20261005185251.2422114-1-visitorckw@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Oct 05, 2026 at 06:52 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> Tested with the test_bpf.ko:
> test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]

test_bpf.ko doesn't go through the verifier.
It has no bpf-to-bpf calls and no callbacks.

> Changes in v7:
> - Size subprog stack frames from stack_depth instead of MAX_BPF_STACK.
> - Preserve callee's r2 across BPF_PSEUDO_CALL for aggregate returns.
> - Clean up state on extra_pass failure in bpf_int_jit_compile().

So these are fixes for bot findings in the code that was never run.
It doesn't work. See below.

[...]

> +	emit_16(ctx, 0x4ee8);					/* jmp d16(%a0) */
> +	emit_16(ctx, CPU_IS_COLDFIRE ? 48 : 44);

When the target prog has subprogs its prologue is the is_func flavor.
It's 110 bytes, and 44 is in the middle of
move.l %d0, BPF_R2_LO(%fp). The cpu executes 0xfff0.

> +static void build_prologue(struct jit_ctx *ctx)
> +{
> +	int bpf_stack = ctx->prog->is_func ?
> +			round_up(ctx->prog->aux->stack_depth, 4) : MAX_BPF_STACK;

stack_depth can be more than MAX_BPF_STACK.
may_goto adds 8 bytes on top of what the prog uses.
See stack_depth_extra in bpf_do_misc_fixups().
When the prog uses 512 bytes the counter is at r10 - 520.
That's where movem.l saved %d4 and %d5, so the C caller of the prog
gets them back corrupted.
The target of a tail call reuses the frame, so every frame needs
that extra space.

> +	if (ctx->prog->is_func) {
> +		const s8 arg_regs[] = { BPF_REG_1, BPF_REG_2, BPF_REG_3, BPF_REG_4, BPF_REG_5 };
> +
> +		for (i = 0; i < 5; i++) {
> +			int offset = 8 + i * 8;

jit_subprogs() sets is_func for func[0] too, which is the main prog.
It's called from C as bpf_func(ctx, insnsi), so 8(%fp) is ctx and
12(%fp) is insnsi. This loop makes R1 = (u64)ctx << 32 | insnsi.
Every prog that has a subprog or a callback reads its ctx
out of prog->insnsi.

arm32 and x86-32 JITs don't support bpf-to-bpf calls.
Drop them from this patch.
Add them in a follow up when you can run test_progs.

pw-bot: cr

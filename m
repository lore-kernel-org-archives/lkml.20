Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D24EFFBB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563586; cv=none; b=SCxPoWnpMu6dG2JrkYUJqnck4paHt+tgJ/hGwxiRLHBqXAwkLsTziLhrGt2gVHb0jkIK3OWswF4udKmSJAuWp2XYh5TF/meMd+RBN6WOMYbHwiBl0g3dzvBcoxd8YiMEQr2qRTAozIMlVoDjUUVIRW3qFJBUv57kfXLoySfslL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563586; c=relaxed/simple;
	bh=adtJZs987/cifFrpNc95S6HlhnQjFutbkv9UM1xx51k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KN177N2FIGKIF/SBeY2rg0+STezi4kGbfrAbneZHCnd+NjyjlXZsvLeM3/IcUTNu126dSQvlJ1Phdi87vkla/QUT+cSUqae+D4/eLOF2nDLtC6x/JoS9PHt8pYbNM3ZsDcNvvQYOwEt13anp8betpmauNWQCzqe5Klo60zH3SBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xkv2GSE4; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xkv2GSE4"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53519e20d7bso71378911cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791563581; x=1792168381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9sVGgzlu6+ENWUoJYb78q+rgs2zxlV0DomchfrV7sKg=;
        b=Xkv2GSE4g+z7SHr1obSJIZCEiaWY2EfLCAZJe7rIrqEj0QuJX0bgJEc0u+x22LbIQA
         DhjhQzg5rVBUKdMGsHpvJed+mfZ/XRxnvmwVUWke2Lv3vFhycVbljvWUBHVyNPyugh2Q
         oh5hZ6poIfFB2sMpU+8X9pcoIw2PpyJRcK7Q2ZHRJvfiQ5HpdG2S5Vbz9HVry6c8qSPb
         AttF+tUCXFUcC8aEMbJByr8BOFdl/t4XOCE5OuCQFSWZcYg/pGTcoE7cPyDmIi2ts73p
         X2wQXa3BU01PNabkM+2JUN7cW4fM1+cO3HskT4i1IH8KmroYGrK6RHwhH7nhhQYo8SWy
         9FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563581; x=1792168381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sVGgzlu6+ENWUoJYb78q+rgs2zxlV0DomchfrV7sKg=;
        b=1PHYE6bvhr15O0szyLHXdKhjg5BAMIgdjjmK8wjFK/cQ7FcP8kNAL2EBpV55qEQtGW
         LGpAiWKHJtoY890+lvZ/LRQ9ikqX7HMSWkBosSQLfyQuqFaYgD3L/5KlwvrK221LBjjy
         CfqF3/TFU5Hg4Hh15Z1V1Rb9vd92BH5rdTN6wUsY3UtQjYUWCH6vbnsW/IRzH39fUZVg
         weMAkqwDKpdl8kv5+/q1AbZ4aqKnf+qYsDuIF7E5Dov4XlcvsdYfh7xqY/OyiI+3EA2M
         3FlVC0sKwSqjb9Djnudnw4PtEchYmDDf5wbs42KOBdtMFOjBCdJu+t5dGC0UEqs0FxVP
         XJKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIDwBV/Ays3LYRfJBEWWwh5fj8qk1ANzsIalfWogqBxF+nAQv2AxcDTIp4yO2cFk+mxAhpovDWP/r7PHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYQAyTjucJWEBNEShPv/Jfg7x/kLDLYoHysIbdaoKCp9ZR7hZP
	GuHxiFYrQuLRp9ZpqA8Z2Zj4TbBlmo+4POGUxZpojvja3Yq+4tGOdol3LT7jew==
X-Gm-Gg: AYBFou30rn8KYfThnnL5AZjUA+hVTvJwuBYEaec6EanSQVEChsO4TXHjW9ToJoGYb7s
	f0EdjfVGc8JsyZfVb6KIhY6fBhZuvdA5nQSPIE6rXqmbglzErUcZ5ppdsSErlURYs2Nr3Af8qgB
	lUBiQlQBTYM+nnBpi31o+3ZzT81wyfezLM5a2t4BQvgxKFCcxYsHL/OZMN5Pv5UFChcXK4LF5Kb
	BsiDAcWbs7hME6Ludwta9nPaPwoaFAyhJoAtmKYK0gYI81ZRJo4R5mcL4rLPnwlO7lkyZjSr7/o
	Bq5UVttmrj9GT5dSJDploNV5lTTR4KkbjNNvBOgPDew1BCbZcOBjgGef2sO4DmF87+rIFMOQb7j
	mVCIkHvrzqrT002UFiY8osscawVD6grICGMBhy+wmzatTOHjjc1Y009qVd5kbOGQS0HFW+aTnpB
	d4ptb0BuRMR6IS6SZt7utGHl8Z0fQ1Ls4Z/A94lI64g+qw6CpdnD6QWYsOTqqmiqAcTltkkjRJ1
	YzI2hihEyITKYqDRVBcP5DWH1/jZpH8Ag==
X-Received: by 2002:ac8:59d5:0:b0:535:1d5b:a7fa with SMTP id d75a77b69052e-535a6101048mr25000311cf.14.1791563580780;
        Fri, 09 Oct 2026 09:33:00 -0700 (PDT)
Received: from google.com (61-230-52-229.dynamic-ip.hinet.net. [61.230.52.229])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b6fa0f9sm21647561cf.8.2026.10.09.09.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:33:00 -0700 (PDT)
Date: Sat, 10 Oct 2026 00:32:51 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: bot+bpf-ci@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net,
	eddyz87@gmail.com, memxor@gmail.com, andrii@kernel.org,
	rdunlap@infradead.org, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, jserv@ccns.ncku.edu.tw,
	marscheng@google.com, eleanor15x@gmail.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	daniel@thingy.jp, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH v7] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <askXM-fN-olasi7l@google.com>
References: <20261005185251.2422114-1-visitorckw@gmail.com>
 <506b804c97aaa3a66660bb0eebd85c6041e241532c1227f1012166785d240fae@mail.kernel.org>
 <342ca584-c4ef-4d73-9017-9d21bbf9ce10@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <342ca584-c4ef-4d73-9017-9d21bbf9ce10@linux-m68k.org>

On Tue, Oct 06, 2026 at 11:53:22PM +1000, Greg Ungerer wrote:
> Why thank you LLM review :-)
> 
> On 6/10/26 05:48, bot+bpf-ci@kernel.org wrote:
> >> m68k, bpf: Add initial BPF JIT compiler support
> > 
> > TL;DR: Nit only, not a bug: the ColdFire byte-swap instruction sequences are
> > open-coded repeatedly in emit_to_le16/32/64() in the m68k JIT; suggests small
> > shared helpers, as arm's bpf_jit_32.c does.
> > 
> >> diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> >> new file mode 100644
> >> index 000000000000..6c40d358acd4
> >> --- /dev/null
> >> +++ b/arch/m68k/net/bpf_jit_comp.c
> >> @@ -0,0 +1,1840 @@
> > [ ... ]
> >> +static inline void emit_to_le16(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> >> +{
> >> +	if (CPU_IS_COLDFIRE) {
> >> +		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> >> +		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> >> +		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> >> +		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> >> +		emit_16(ctx, 0x8080 | (d_lo << 9) | d_hi);		/* or.l d_hi, d_lo */
> > [ ... ]
> >> +static inline void emit_to_le32(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> >> +{
> >> +	if (CPU_IS_COLDFIRE) {
> >> +		emit_16(ctx, 0x2f00 | d_lo);				/* move.l d_lo, -(%sp) */
> >> +		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> >> +		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> >> +		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> >> +		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> >> +		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> >> +		emit_16(ctx, 0x8080 | (d_hi << 9) | d_lo);		/* or.l d_lo, d_hi */
> >> +		emit_16(ctx, 0x2017 | (d_lo << 9));			/* move.l (%sp), d_lo */
> >> +		emit_16(ctx, 0x2e80 | d_hi);				/* move.l d_hi, (%sp) */
> >> +		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> >> +		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> >> +		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> >> +		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> >> +		emit_16(ctx, 0x8080 | (d_lo << 9) | d_hi);		/* or.l d_hi, d_lo */
> >> +		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> >> +		emit_16(ctx, 0x809f | (d_lo << 9));			/* or.l (%sp)+, d_lo */
> > [ ... ]
> >> +static inline void emit_to_le64(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> >> +{
> >> +	if (CPU_IS_COLDFIRE) {
> >> +		emit_16(ctx, 0x2f00 | d_lo);				/* move.l d_lo, -(%sp) */
> >> +		emit_16(ctx, 0x2f00 | d_hi);				/* move.l d_hi, -(%sp) */
> >> +
> >> +		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> >> +		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> >> +		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> >> +		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> >> +		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> >> +		emit_16(ctx, 0x8080 | (d_hi << 9) | d_lo);		/* or.l d_lo, d_hi */
> >> +		emit_16(ctx, 0x202f | (d_lo << 9));			/* move.l 4(%sp), d_lo */
> >> +		emit_16(ctx, 0x0004);
> >> +		emit_16(ctx, 0x2f40 | d_hi);				/* move.l d_hi, 4(%sp) */
> >> +		emit_16(ctx, 0x0004);
> >> +		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> >> +		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> >> +		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> > [ ... ]
> > 
> > This isn't a bug, but the ColdFire byte-swap sequence (mvz.w / mvz.b /
> > lsr.l #8 / lsl.l #8 / or.l) is open-coded once in emit_to_le16(), twice in
> > emit_to_le32() and four times in emit_to_le64(), differing only in which
> > register receives the result. 
> 
> I did consider using helpers for these during coding, but ultimately decided
> against it. The open coded versions allow for a handful of extra instruction
> optimizations - due to that flexibility of producing the 16bit swap sequence
> result in different registers. For example I could combine a stack pop with
> the or'ing of the result, and more efficiently store an intermediate result
> into the temporary stack storage.
> 
> The patch below gives an example of an implementation using helpers. I am not tied
> to the open coded version: Kuan-Wei if you prefer the code with helpers feel free
> to use this instead.

I don't have a strong opinion either way, since it sounds like you
already made a deliberate judgment call when writing it. Maybe I can
switch to the helper version for now to make this already large patch a
bit smaller. If anyone cares or if it ever shows up in benchmarks in
the future, we can always go back to the open-coded version to optimize
it.

> 
> FWIW, the to_le32 coded sequence is 1 instruction longer (17 instructions to 18).
> The to_le64 coded sequence is 5 instructions longer (34 instructions to 39).
> Total byte count differs less, due to use of offsets in the open coded versions.
> 
> Regards
> Greg
> 
> 
> 
> --- arch/m68k/net/bpf_jit_comp.c.org	2026-10-06 23:08:25.924094287 +1000
> +++ arch/m68k/net/bpf_jit_comp.c	2026-10-06 22:51:13.099505355 +1000
> @@ -640,14 +640,19 @@
>  	bpf_put_reg32(dst[0], d_hi, ctx);
>  }
>  
> +static inline void emit_cf_swap16(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);			/* mvz.w d_lo, d_lo */
> +	emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);			/* mvz.b d_lo, d_hi */
> +	emit_16(ctx, 0xe088 | d_lo);					/* lsr.l #8, d_lo */
> +	emit_16(ctx, 0xe188 | d_hi);					/* lsl.l #8, d_hi */
> +	emit_16(ctx, 0x8080 | (d_lo << 9) | d_hi);			/* or.l d_hi, d_lo */
> +}
> +
>  static inline void emit_to_le16(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
>  {
>  	if (CPU_IS_COLDFIRE) {
> -		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> -		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> -		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> -		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> -		emit_16(ctx, 0x8080 | (d_lo << 9) | d_hi);		/* or.l d_hi, d_lo */
> +		emit_cf_swap16(ctx, d_lo, d_hi);
>  	} else {
>  		emit_16(ctx, 0x0280 | d_lo);				/* andi.l #0xffff, d_lo */
>  		emit_32(ctx, 0xffff);
> @@ -657,25 +662,23 @@
>  	emit_16(ctx, 0x7000 | (d_hi << 9));				/* moveq #0, d_hi */
>  }
>  
> +static inline void emit_cf_swap32(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	emit_16(ctx, 0x2f00 | d_lo);					/* move.l d_lo, -(%sp) */
> +	emit_16(ctx, 0x4840 | d_lo);					/* swap d_lo */
> +	emit_cf_swap16(ctx, d_lo, d_hi);
> +	emit_16(ctx, 0x2000 | (d_lo << 9) | d_hi);			/* move.l d_lo, d_hi */

Should be emit_16(ctx, 0x2000 | (d_hi << 9) | d_lo) ?

Regards,
Kuan-Wei

> +	emit_16(ctx, 0x2017 | (d_lo << 9));				/* move.l (%sp), d_lo */
> +	emit_16(ctx, 0x2e80 | d_hi);					/* move.l d_hi, (%sp) */
> +	emit_cf_swap16(ctx, d_lo, d_hi);
> +	emit_16(ctx, 0x4840 | d_lo);					/* swap d_lo */
> +	emit_16(ctx, 0x809f | (d_lo << 9));				/* or.l (%sp)+, d_lo */
> +}
> +
>  static inline void emit_to_le32(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
>  {
>  	if (CPU_IS_COLDFIRE) {
> -		emit_16(ctx, 0x2f00 | d_lo);				/* move.l d_lo, -(%sp) */
> -		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> -		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> -		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> -		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> -		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> -		emit_16(ctx, 0x8080 | (d_hi << 9) | d_lo);		/* or.l d_lo, d_hi */
> -		emit_16(ctx, 0x2017 | (d_lo << 9));			/* move.l (%sp), d_lo */
> -		emit_16(ctx, 0x2e80 | d_hi);				/* move.l d_hi, (%sp) */
> -		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> -		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> -		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> -		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> -		emit_16(ctx, 0x8080 | (d_lo << 9) | d_hi);		/* or.l d_hi, d_lo */
> -		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> -		emit_16(ctx, 0x809f | (d_lo << 9));			/* or.l (%sp)+, d_lo */
> +		emit_cf_swap32(ctx, d_lo, d_hi);
>  	} else {
>  		emit_16(ctx, 0xe058 | d_lo);				/* ror.w #8, d_lo */
>  		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> @@ -688,45 +691,12 @@
>  static inline void emit_to_le64(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
>  {
>  	if (CPU_IS_COLDFIRE) {
> -		emit_16(ctx, 0x2f00 | d_lo);				/* move.l d_lo, -(%sp) */
>  		emit_16(ctx, 0x2f00 | d_hi);				/* move.l d_hi, -(%sp) */
> -
> -		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> -		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> -		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> -		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> -		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> -		emit_16(ctx, 0x8080 | (d_hi << 9) | d_lo);		/* or.l d_lo, d_hi */
> -		emit_16(ctx, 0x202f | (d_lo << 9));			/* move.l 4(%sp), d_lo */
> -		emit_16(ctx, 0x0004);
> -		emit_16(ctx, 0x2f40 | d_hi);				/* move.l d_hi, 4(%sp) */
> -		emit_16(ctx, 0x0004);
> -		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> -		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> -		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> -		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> -		emit_16(ctx, 0x8080 | (d_lo << 9) | d_hi);		/* or.l d_hi, d_lo */
> -		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> -		emit_16(ctx, 0x81af | (d_lo << 9));			/* or.l d_lo, 4(%sp) */
> -		emit_16(ctx, 0x0004);
> -
> -		emit_16(ctx, 0x2017 | (d_lo << 9));			/* move.l (%sp), d_lo */
> -		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> -		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> -		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> -		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> -		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> -		emit_16(ctx, 0x8080 | (d_hi << 9) | d_lo);		/* or.l d_lo, d_hi */
> +		emit_cf_swap32(ctx, d_lo, d_hi);
> +		emit_16(ctx, 0x2000 | (d_lo << 9) | d_hi);		/* move.l d_lo, d_hi */
>  		emit_16(ctx, 0x2017 | (d_lo << 9));			/* move.l (%sp), d_lo */
>  		emit_16(ctx, 0x2e80 | d_hi);				/* move.l d_hi, (%sp) */
> -		emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);		/* mvz.w d_lo, d_lo */
> -		emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);		/* mvz.b d_lo, d_hi */
> -		emit_16(ctx, 0xe088 | d_lo);				/* lsr.l #8, d_lo */
> -		emit_16(ctx, 0xe188 | d_hi);				/* lsl.l #8, d_hi */
> -		emit_16(ctx, 0x8080 | (d_lo << 9) | d_hi);		/* or.l d_hi, d_lo */
> -		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> -		emit_16(ctx, 0x809f | (d_lo << 9));			/* or.l (%sp)+, d_lo */
> -
> +		emit_cf_swap32(ctx, d_lo, d_hi);
>  		emit_16(ctx, 0x201f | (d_hi << 9));			/* move.l (%sp)+, d_hi */
>  	} else {
>  		emit_16(ctx, 0xe058 | d_lo);				/* ror.w #8, d_lo */
> 
> 
> 
> 

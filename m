Received: from mail-wr2-f37.google.com (mail-wr2-f37.google.com [74.125.225.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEE36920C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790492551; cv=none; b=lHVT5ksIdaOB6G7D5PWOdWr7ypTCnzHdKCx+hDwRdw44zFGIVSzIlVbFsMKMIkNyZkluSou3wHXBzuOsiLMpuWo7rMvXPO/g7ZGXthB6yoz4p/vJ7GmgQZ06SuSsh4r8kwXFdE338g+378N4xMpi5KHdJDN1FfZf6DjOSo4lyZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790492551; c=relaxed/simple;
	bh=EZBGaGu7g268yBeLa/NPbPJzutiCHGfKPegWoTP0nS0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BFppAxpwezyQdSjLSv5vbSN9C+Pll1dLcDNwAi1tmLljzgMwFgn+Rrhr0Na00kyteTRX7r76vaZxfjDhk0rqGyPv4AWzHNQHvkthY8tzn5dI6GhhWWBneL+PHfz0YKBvyrNuPmBdf/LdEXSDhk2CxjLcPKMOCK3LyerPyO5EjcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhhbGWcS; arc=none smtp.client-ip=74.125.225.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhhbGWcS"
Received: by mail-wr2-f37.google.com with SMTP id ffacd0b85a97d-4887840c529so725885f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790492548; x=1791097348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJKp/brBpZ8U6kwJIcmM4FiZnVhsdc/GYabd2hj9ep0=;
        b=fhhbGWcSs98KWNIPjQAwwy2Yzwiu5DdepGYGIryjir0puqjg/9ax8hBsUb14n4wWBn
         8/MqsllnNi5kpq79icgdS4NmoAWnuLTQpDPY9Zs7HYADGy2VjYEdHzkMYQu8dWggLjJq
         9swI1XBLBjnEVsGoMV5b3e4jtkhvmTswyFxQLcoDEddYigQ6xn8YXWDj5xGSyU87Fn/j
         GyeNGdi56lUom7g/riLoAaddFOVw2U7u+q7SXU2tn4dm5gsALpXWfnOUbhjh1282tE/P
         WVgPhbVvuHe/LsVhRDPywC8+lBvqoMD7t6xh0CkWhIo0amWuUHNnV2m2KpNAliIvZHaA
         0NMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492548; x=1791097348;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJKp/brBpZ8U6kwJIcmM4FiZnVhsdc/GYabd2hj9ep0=;
        b=PA939ISgEuxYqgqqa8pxtkHVbexkB/2yptayz2kz2UpblrWnnTbHSiekGpR2CbYM83
         yaczak1LX/wvDDMhT/bHC1Mlan05xPMP+ku1CDJeU0yxYZ2NAyC/usWbOyFFpvFHs42P
         nrR1eyONyHyuYdYxpiVeQEsJgruXZYcSiEoCAH25S/zYvFTICFLmvTs4tGLvLv1V6McB
         LJHrLEim+/AA8Vf/UE+Wd4TMY29gc9DdYYKO1zDcVe610Nfh2b6axGfDyMmisp4+bCCQ
         bUetOTje2LKQEwTJVbrrZW3Oh6Fgmklgint0Fz3N/wOonbxWAbh8oVkTaA6P3QLQ1TGd
         gkow==
X-Forwarded-Encrypted: i=1; AKwUvBx1GLqYn2ox6XmWSdW3/BRSihVpPUb/4U2T1Tm3y4FrpHx9t76mebFI76GMYDw1dwMlEoMhuk/ShvJYgck=@vger.kernel.org
X-Gm-Message-State: AFuF++llm77eqXOqLCY1i/tWozkfTZv2zcZT8C8LmwTO+SM93qZ4ru3K
	q0P+ESI3v7L0CKfq0pqPxkcGDo1z51G+2LZbedjcg14/uDilxbTo3XRb
X-Gm-Gg: AYBFou0NnJni7ES88B8WSe39DKaO6Etnl3MR+UoMWC/MZ6gpyYHMnin2ZP8IivP1DFk
	fNz0SbyBrANPuaIGTB9RAwNZ0AVRTJvKZoHTDkr/lMka68kTfpEmhXgQUWgq5u6I8+kEpljMhqI
	1PfkEjxjsBEBreottzwZ/8cqc+ROTUxsnlGuYMKEMWzuXFokUotgP27qT9q5qeVLRc7GFj+d0My
	M8HQ/EN6zvnlRN0Zg+EUENGe2Lg5j/PP90IE6fap1L4dinqXKgtzGvYNysBnoJxGVn2bCFJx/i+
	mpH0PpQWx3t4UqDcF2nPDLaEBmUKECewKoAZqIGP3inUaBT89YfkJxodKpeEiv6xwxqKtFzuKsm
	irqjDxrjNzKW2MZh+qjeCXentjmDFKd+8hvdZdfAirRQfJkzhFde0A7vsrOEQdAlXOTEO+wtRCo
	Mw/qEZwa8Mkdn3GT5C3fghVqofVvwHHSVIOkXj3bk0p40z60HQTg63Kd1qARlX2SMRdy7vIs7+E
	Z2W//ZcVpKXBesO3QZ+T0/fSsvD8EABxoYf
X-Received: by 2002:a05:600c:1f83:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fe66c8087mr175447355e9.3.1790492548064;
        Sun, 27 Sep 2026 00:02:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f0e79sm57015315e9.7.2026.09.27.00.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:02:27 -0700 (PDT)
Date: Sun, 27 Sep 2026 08:02:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260927080225.37534e7c@pumpkin>
In-Reply-To: <are7cfMIHZZn6jLz@zx2c4.com>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
	<87zex4ic68.fsf@linux-m68k.org>
	<20260926121927.GA1486962@ax162>
	<are7cfMIHZZn6jLz@zx2c4.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Sep 2026 14:32:49 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Sat, Sep 26, 2026 at 01:19:27PM +0100, Nathan Chancellor wrote:
> > On Sat, Sep 26, 2026 at 11:39:43AM +0200, Andreas Schwab wrote:  
> > > On Sep 25 2026, Nathan Chancellor wrote:
> > >   
> > > > +#if __has_builtin(__builtin_memset_inline)
> > > > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, value, size)
> > > > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > > > +#define memset_inline(dst, value, size) __builtin_memset(dst, value, size)
> > > > +#else
> > > > +static inline void *memset_inline(void *dst, int value, size_t size)
> > > > +{
> > > > +	char *d = dst;
> > > > +
> > > > +	while (size--)
> > > > +		*d++ = value;
> > > > +
> > > > +	return d;
> > > > +}
> > > > +#endif
> > > > +  
> > > 
> > > memset actually returns the original pointer, not the incremented one.
> > > Nothing uses the return value of memset_inline here, but it is
> > > confusing.  
> > 
> > Whoops, good catch, I guess my fingers gave up on those last two
> > characters :) I will fix this for v3 once there has been some time for
> > further review.  
> 
> Do we even need to return a value at all? Might as well just make the
> function two lines:
> 
> +       for (char *d = dst; size--;)
> +               *d++ = value;

Wouldn't it be better to add a barrier() or similar in there to
stop the compiler playing unwanted games>

David

> 
> (Technically that could even be one, but maybe that sort of golf loses
> clarity. Your choice.)
> 


Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2B4A92C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375256; cv=pass; b=gXNNPd1ddKJ7rf6pH5sG93/ActJbjsq5Ifh1itIZi7A4T+NLIX4rdAfUyqsX/geeWTHha8WlWlc2D+j4BSDGkOJ+oKPEtK7EIYuoj8Ywo7R9q5atra1VbathoH+AZqgyozVt2XPor+gPP8h6jZbwZvzLqCfJPI8MI2CRgXw/4o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375256; c=relaxed/simple;
	bh=cpaZKjlU7B8ILrdB4fGgnu6+0vNZxjeCWYeXvEw+9R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RsD75SjRWLUzc7CnFyK/EjcSXWaG2gcyianMqVVLJND3hk9fRoKBJzPo2Z5+hh/Bq5LDcl73TuNsVrgLYC7HIFhpQxFgImRqEMWbdWnBn5BIttapExBQViPZWniSd50LqPK7utooOhBIk7R9A5slUWuq9W3Jsg6AyR0CmL7eM0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCEar4yd; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCEar4yd"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so2570646a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788375252; cv=none;
        d=google.com; s=arc-20260327;
        b=jTmJW4qgj93C58Y4O9cYsPsZkjUGA2BZ/QaOD5hN9gyr99Wa3GXoFIaC+80KZ9EmQg
         BabHmXu8+Gzmgcdcc5aC1VQO93Ntn20upORN32kbwAHa8S7dhirnaAMiqfABH+yv5FvE
         etzWXQPHwuOOtkEis7MAwHyMTZSn3PsSTV1S+hNrv594PY1aVwiV4UK5M2CLPS4eN6tD
         zPm6kcj/YrQjf79OwdKfi1qRQLrgHZbqVlQHa6gThc3jubAr7ZixQ46NU3IOMCSblaPJ
         50jVRv9IdmQ0hPpjJfjtbiCGIZ9Qt0AcIoxP6NjsNOJdigGNy5pgJeUkywnl4Y4hjhcw
         FSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IY8poiMupLJiaO+7G5dNdyPTPj0jxqqwAYgGEytSFFg=;
        fh=Cfm8JQ0hTzVV6NApANcTj6SpTyL1QBvOJ5pIZB6SG8o=;
        b=mwwgo8MvK+O1eDS32PJVUErgOvM9OSys7wdYCetW3j9PMj+0u611R7t0svoa7D5oos
         AnqVKaUJPFcMZlbb7qWvCzPyPo30bUkig1YHrP3YKiEVLf3Qr91sgdYhGXkFPdQZPeG2
         fLbc8tI9GpMBK1gAIARhOY9VolWfWWt92JH9FhEjm+EB/M4RoSSD5MNdACJr3CdNdCgI
         slhwlO1R/z3W3D5dTEnmcrubgLToeDExt7+hHUGBJL+PJXjj0IikWmPfFY781JcnKGbI
         jBHGeegf+Koz3HH4+wSgz0AZTY8r7IsX+h2JoYVD8WBfWJJTn+V5BKJw+bGXlSfRcsJV
         X4JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788375252; x=1788980052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IY8poiMupLJiaO+7G5dNdyPTPj0jxqqwAYgGEytSFFg=;
        b=NCEar4yd0g9+qD77HNidjrOSE0bYsdpiTLp7xS6kBgXL0uASvAM8WmQTxhPpSWzB+W
         zt3Epuw6uBSgQw/R9z2tJaLjA6lGp26K40Pwhz8/tPc2km1vCfnMlaI6bme5ULtzn7kH
         XpBIsmq53U3dzV3OjxDPFL/wvcrg8ibWgd3Xiaq4Nqv4XixU1DlXc2eWJszXglPpJcQL
         pGbgUBBdqEkWuN5rKcuqObjNHsxlCMgCtKY4+KUMwdudLw/+inZ+riZAX3HnfCmwSWs5
         RO3pNQo0tMmuq/h8+hVmgZarwvSA2dNbo+YxMKCbzaW/os+i7RSfk31JiROpc5o4l0d7
         cFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375252; x=1788980052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IY8poiMupLJiaO+7G5dNdyPTPj0jxqqwAYgGEytSFFg=;
        b=CMbZGSqlUvuQ9p7OrRbCG0PCDX8Zn+Y1zp41mnfuVoQC2m/rXyvUhFerIFcGazQ1FE
         riHpPYBgUvF5Gs0Q5bLHzaGeY3Il/pU1PhAekG5gKUyVNWaSPue40xCEobiR27LLjuF5
         CdSdM2hlXw9aESs8tYveDgrPO94jiTqmY5XkHw5LkMNt/oz8hX/D45EhnewrnrFr7FoV
         3z4MUHYljjbq7/XansRRv6PGc8p8Et2KUAwGTUwAfoEgG6zLwdZH71DmtlJPX0PiQafO
         N2ZlfQl0y3ofdPgi8E/AsJg3nUFyfX4qPpp8bop7Ea7+WWKLJiwf4kxD7tJHGZD4t+l2
         CWbw==
X-Forwarded-Encrypted: i=1; AKwUvBw3aXiZqFTDLvTSS3TfK5N0MWC5mi+tc32Or0JhrQJWuPBqoTfqTP0Kk4qDg77RAwCfmzYRnFNdCmpXAEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nuCro5899FBYvkLvq/g6+6xzR/bIUC+BsEWRhw6t1eB03jh05M
	Ml/h15PauVjXQn4KcOTFuxPWViFzsKaEHcUc1/ursmiOMgxs43W+fhqCxWbQe2S4LxdaE0H76H5
	uQiZe5KUxaAN1jUqzqz00z8TBrL6wiYU=
X-Gm-Gg: AYBFou0urhfG3tbf5OvPc3XOsRw3x19caAXR/GfQIwSez3mU5D+pCfrodooVeM6qpJt
	SXsQCScOpTVJGjQfgTWgaE1K5Mo8ofWpiEimw7L/fqBR2nLbQKZI3brqKhAER9Dg4KDPl2hNeCC
	UTQS9UF+zUKyLN4tM2foKxYh2ts1FA7UwvBj7jmYNYTudhaQcRijoiPRZRgDtj8qbwmhRasDKua
	uW5mV7Vq8QMJbJNmYtzlp2u7drSxtIvpNzkRLCr4lYBi8xc5N+oC8DL1Mr/+YIGAJvtkGrsxEtz
	pCqojUeCrhjAkjER8HYC0jHt6oxGIa8VHF2oJAkheuLAyMCimFNnwKO43F+abfBfw6tXlgIZB94
	OGw/2DOnel9g/d/hP53jgOKFlMDUZRxY=
X-Received: by 2002:a05:6402:460c:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a68313fb0cmr4668745a12.6.1788375252245; Wed, 02 Sep 2026
 11:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com>
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 20:53:58 +0200
X-Gm-Features: AcwNN1UU8QuPrPkYUGlA9muacN9VHIAgsz6786GXhDvk6mo3Pz0VToDkYHYK2tM
Message-ID: <CA+=Fv5Tze+34x+pZDeWb0kjeDsY15yd+pAh7weS3kai7mr9TXA@mail.gmail.com>
Subject: Re: [PATCH 00/24] alpha: catch up on architecture Kconfig options
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha is missing a long list of Kconfig options that other architectures
> have picked up over the years, some of them for no better reason than
> nobody having gone through the list.  I diffed the select statements in
> every other arch/*/Kconfig against arch/alpha/Kconfig and worked through
> what turned up.  This series is the result: two fixes it depends on, and
> the options that are either free or close to it.
>
> The patches are ordered from least to most contentious, so the front of
> the series can be applied on its own if the tail needs discussion.
>
> Patches 1-2 are fixes.  arch_irqs_disabled_flags() only reported
> interrupts as disabled at IPL_MAX, but PALcode enters handlers at the
> IPL of the interrupt being delivered, so a device or timer handler
> answered that interrupts were enabled.  handle_irq() also called
> irq_to_desc() before irq_enter(), running generic code with the preempt
> count still saying task context and RCU not yet watching.  Both matter on
> their own; patches 23 and 24 are what made them visible.
>
> Patches 3-11 are one-line selects with no Alpha code behind them:
> instrumentation (UBSAN, gcov, kmemleak), EDAC, and four properties Alpha
> has always had but never declared (LL/SC atomics, hardware multiply,
> __int128, the existing asm/compiler.h, and the non-overlapping user and
> kernel address spaces).
>
> Patches 12-17 add a small amount of code: an empty thread_struct
> whitelist, _PAGE_SPECIAL on a free PTE bit, the page table check helpers,
> and then the three things that follow from those - the page table helper
> self test, lockless GUP, and the early memtest.  Note that early_memtest(=
)
> is called from arch_mm_preinit() rather than paging_init(), because Alpha
> calls paging_init() from setup_arch(), before parse_early_param() has see=
n
> the memtest=3D option.
>
> Patches 18-20 change something visible.  Unhandled user faults now print
> the usual message under the debug.exception-trace sysctl.  .eh_frame is
> discarded: gcc emits it for Alpha regardless of
> -fno-asynchronous-unwind-tables, it was allocated in the loaded image, an=
d
> nothing consumes it, since the stack trace code scans for text addresses
> rather than unwinding DWARF.  That is worth about 1.1MB.  With that and
> the relocation sections placed explicitly, the kernel links with no
> orphans left, so the last of the three asks the linker to say so.
>
> Patches 21-24 are the ones I expect to draw comment.  Patch 22 adds a
> uapi header, so the perf register numbering is an ABI decision.  Patch 23
> is SPARSE_IRQ: without it Marvel carries a 12.6MB static irq_desc[] in
> .data for 32768 possible interrupts, of which a real ES47 uses 87, and
> the kernel links at a fixed address just above the console reservation
> where that 12.6MB is the difference between fitting and not.  Patch 24
> instruments the entry assembly for lockdep hardirq tracking.
>
> Tested with gcc 17 under QEMU (-M clipper -smp 2, an ALPHA_GENERIC build)
> with PROVE_LOCKING enabled: no splats, early_memtest passes all four
> patterns over the free memblock ranges with nothing reserved,
> debug_vm_pgtable validates with no warning, a vmsplice() of an anonymous
> mapping through pin_user_pages_fast() returns the right data, and an
> unhandled SIGSEGV prints the new trace line.  Patch 23 was tested on an
> AlphaServer ES47.
>
> Not included, and worth mentioning: ARCH_HAS_KCOV.  A kernel with
> KCOV_INSTRUMENT_ALL boots and runs, but CONFIG_KCOV_SELFTEST panics.  The
> self test deliberately arms kcov with no coverage area so that any
> instrumented function reached from interrupt context faults, checking
> that nothing escapes the window before the preempt count says hardirq.
> On Alpha something does.  Patch 2 fixes one such site; the panic survives
> it, so the entry paths need an audit first.
>

Thanks for taking the time to do this! This is a nice collection of patches=
.
I've started on the review and testing, I will keep at it.
As general feedback for the series, I noticed that several of the
corresponding architecture feature matrices still list Alpha as TODO.
The Alpha entries should be changed to "ok" for:

  ARCH_HAS_GCOV_PROFILE_ALL
  HAVE_DEBUG_KMEMLEAK
  ARCH_HAS_PTE_SPECIAL
  ARCH_HAS_DEBUG_VM_PGTABLE
  HAVE_PERF_REGS
  HAVE_PERF_USER_STACK_DUMP

These correspond to patches 4, 5, 13, 15, and 22.  It would probably be
best to include each documentation update in the patch which enables the
corresponding feature.

It would also be helpful if the next revision were rebased onto
v7.3-rc1 and applied cleanly on top of my Alpha GENERIC_ENTRY v5 series.
I am currently testing only the patches which applied successfully.

Alpha GENERIC_ENTRY v5 series is available here:
https://lore.kernel.org/linux-alpha/20260902184058.198679-1-linmag7@gmail.c=
om/T/#t

Regards,
Magnus

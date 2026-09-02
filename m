Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6497549B211
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356645; cv=pass; b=Y5u8Dvvw/htpAHei/5gfLRS1WB6EO4c2q1z6v8l6/oeKBBaLUwfT1HcYC7H2NQPGw+oJ0ZSvJSico5m3V7FLc1A8bOUvW1Det2DqxFfzH0w6P2Q5xLy09usWNYi/JQPFankOkmcUKG5HhWwrjthC7HBpEj50ItoVrry9S32hDXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356645; c=relaxed/simple;
	bh=eBCVbFvfA2xMyMFovGTR8cuVY5LDneB7UwxZBqbyciw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coEd7lxzXtLdLFedX7IaMHLawc9GnABcfacK+d3DR2p/7Z2Xr31UvfxMxLR8iFgKjGi6GsvgT1IPoiSk4e6tpK8aer/EXMYg+4tgUt+2YvO88Ax4uVw7tHzIN7+xWi2SVIvfr2D5U/Y4rvfA4G9t+LBtiFIon1sYiVCADG+TgRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fe8Jj+mz; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fe8Jj+mz"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b28d9537bcso848875b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788356640; cv=none;
        d=google.com; s=arc-20260327;
        b=gzIYegp+Ngn9buwiHMx3Uj1rJCSm9AqB1UGGmZ8108YjIV8gMa4cDoB1yU3NhocRUt
         zJ+ph+2n2pzA8FX0+bdL7pGO2T527B062j7oURSkGqFq/0MMufTeWMGybp/gfmQFq2Sk
         1yzXu/Hp9j98f+FLVUOv3IkYfUq6fHmktESyeKSIhQzAfdWyvyKLnT6Cx0QbfeU/S/+7
         dLpV1yJuX3X2SxAAW45B2l9Zfczp2SH08z7RKHZAU2bpGDQ+H0MMEAT0T0mr3O0QEwIM
         7X0RtQEbRcjfbqXnqzUGaq84gk3BJQ0RWAWDQhYi8/FYpL1eKtoPmWpM7K5FS9n29nYG
         UjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OH53ybijunYoNfJAXp5YQ5Xv4Y7ODEOPTSxs+1JBmaY=;
        fh=zC5U7MZXsBfSM3VAM0li2ZNOMg7Q0Y8/XqG+6MzKWOY=;
        b=X3GJIgHYrghfI0VoSqFFFJEEujROGS94nzLqNm3VbEyZr1jwbQKQrd6JY6Uu8PlPj1
         q4LPXbhoI+hnayhfuPIeGhaXbdtR4iosuO5WeOPu32J7lctP3a4DeeIH83YfZCu/7kZS
         eJ7vPvAfMYhB1FJXLEIkEABye9OHzJNAU4qN8TNftal+RhRAs9Clni5Lnmm0x1TnhuBz
         WBK/O0BsOoiJ6WXEwU4e2wHVLRtp0Y1LwHj6+FN1IDEKGqoBFtZCAIJCuWlLb6E0lH1v
         EhRMh8jZZzFhT4Mp8IcHSM07Oas8/MUTSHLL7FJQMRMH9H8NInttFrt4nMaYer7xCVBr
         XleQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788356640; x=1788961440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OH53ybijunYoNfJAXp5YQ5Xv4Y7ODEOPTSxs+1JBmaY=;
        b=fe8Jj+mzV0HBPmT1irD3IWiUL3bWO00I0Pag084m6W50e3SlWnzoDqpmQOKZ6sw9i3
         m/dYQdXbkiBfVC/PxCwdmCZI5y8pT85Z62w9xjsemQdg4uIpbuy+FaYm7l31me0JOInk
         qHHt+HTKrrtOmbXVOSL0xdGTT+QuX2mihitLFlysqzomh2yQu4MkOujNkS7VrwbDH2uC
         u1/6WoeNij5U+TejCMIlB914QXDGPZEes+IW3Dv0Kq1+q6iC/6jdb6rNTDHJrh2jgfYc
         QbOKmy0fk8aZy2A9nk9cNg3xg/xxL3C15pobUrKBrC9PIw4nJfm/o3aHK/pi2p+mxcjr
         nADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356640; x=1788961440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OH53ybijunYoNfJAXp5YQ5Xv4Y7ODEOPTSxs+1JBmaY=;
        b=lWHsTT31GMynQnjFIZSMLnh2rE9RraqiOIMB29JWDyae6iXhRqc4T9k9jde2+5jBr9
         eb9MMfuKMGhgnrWa8KRxGGhixiOVK26b8v4BSF7O9ylTIMQCXK722L6c5hsOGvXcIHbi
         MSbYDVcjchMx/cet+M49B1VoCgEEwlmQ64EFUucCSDTELkTFEBzP6LAqxsoVVfoZGEgU
         KyCJZwKZmOJAQh0CnBFNTFc9MBMwYoC57Tktgr2GCjkn9gK18elPdEfPS0hlcRouGe3C
         0YW3H+m+p11CcwPQR2sl+firX6/MaSPyPS7td4Vi6DMeR/EDIlPCzi47mxhrUadVtZkw
         yvFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqkWjlmscwGqo4FVdPYny0Mgsdmj6DyZbJDyhVqLItOOmiQOA8S99nw82YYiWVhrb9IK+Hrbp+t3IR7MA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwaZiWOJM9WnqJ2+mL7n+KprNx7MC2TnuSpMvYpNOINSipzAPT
	9Q6vLVCjOAmUwN6pduCxnMgSZ4t1vvrHAIZjncJif0Unax+3/0Ry3xkBnxoDN+3Ev1DUsi5nldB
	dipbaPpzP47+WQYHyiOVJBqMqFXkzrvb5mpgABYiV
X-Gm-Gg: AR+sD1124y3ndyQ9hvWaMLf7xXJu0bdZG+N22Tm2kdkIGeDvxaYobYSUFI/9FWeg7jc
	zFZai0LYI3C/J25C5LR5POZXheCSIkxJpSWh4H4XLIDg4UOwmmd81ljSFv3aWwZdgQLNRSIfQtE
	mlkQ6/fwPkuppGmkMLb+qSuiCA2XeIq6ueAn3E+v69/y0Xt0Oe+LQcMTJeEHKpGpX042yyr3qd4
	C2U79LosSfix48ur01GEIoG71xJJstNb3A0Owrb5GLNwt7L5CiUtRBPMQ2fAk6Rnwsbs0B4aT0o
	UY4OY/YKKUzIEYI3MfLluRoqZZYG1P+XevsTC5FnHw==
X-Received: by 2002:a05:6808:1795:b0:4b3:5da8:1da0 with SMTP id
 5614622812f47-4b71c52e940mr1827413b6e.5.1788356638926; Wed, 02 Sep 2026
 06:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com> <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com>
In-Reply-To: <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com>
From: enh <enh@google.com>
Date: Wed, 2 Sep 2026 09:43:47 -0400
X-Gm-Features: AcwNN1Ugm9qaNtJA4BValHn6hwKda3ef1jRT8zcSOcPUdm-ZVB0BjO70Z0pKBAc
Message-ID: <CAJgzZoqAqw6FzGVzr1=5n69xUFpE3krkzc4tbCDPjohFhz0zdQ@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:45=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Aug 21, 2026 at 3:46=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > The register offset macros in <asm/ptrace-abi.h> are guarded by
> > `defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
> > were left unguarded for 32-bit. This causes havoc for userspace that
> > happens to use identifiers colliding with these short macro names
> > (e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
> > userspace is forced to be super extra careful with include ordering to
> > minimize the chance of collision.
> >
> > Wrap both the 32-bit and 64-bit register definitions under
> > `#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
> > User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.
> >
> > Assisted-by: Gemini
> > Link: https://github.com/llvm/llvm-project/issues/217413
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> + enh (who pulled this into android for testing)

for those who don't know me, i've been Android's libc maintainer for a
while now [was https://blog.linuxplumbersconf.org/2014/ocw/proposals/2337
really that long ago?!]... i applied this patch to Android's libc's
copy of the uapi headers (because Android uses the uapi headers
directly, unlike glibc, and exposes this header transitively from
<sys/ptrace.h>, also unlike glibc), and everything still built without
problems.

this does solve a real problem for us: llvm's coding style means they
have a lot of "FS" and "SS" identifiers that conflict with these
macros, and we see a conflict every few years.

Tested-by: Elliott Hughes <enh@google.com>

> Oleg, can I get an ack/nack here? Or someone who knows better the
> history of UAPI headers?
>
> (I think the Assisted-by tags need `LLM` now IIUC? Assisted-by: LLM Gemin=
i)
>
> We've worked around this now in lldb-server, but figured it might be
> nice to clean this up for the rest of userspace, too.
>
> > ---
> >  arch/x86/include/uapi/asm/ptrace-abi.h | 4 ++--
> >  arch/x86/um/asm/ptrace.h               | 4 +---
> >  arch/x86/um/ptrace_32.c                | 1 +
> >  3 files changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/x86/include/uapi/asm/ptrace-abi.h b/arch/x86/include/=
uapi/asm/ptrace-abi.h
> > index 5823584dea13..3656955c6faa 100644
> > --- a/arch/x86/include/uapi/asm/ptrace-abi.h
> > +++ b/arch/x86/include/uapi/asm/ptrace-abi.h
> > @@ -2,6 +2,7 @@
> >  #ifndef _ASM_X86_PTRACE_ABI_H
> >  #define _ASM_X86_PTRACE_ABI_H
> >
> > +#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
> >  #ifdef __i386__
> >
> >  #define EBX 0
> > @@ -25,7 +26,6 @@
> >
> >  #else /* __i386__ */
> >
> > -#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
> >  /*
> >   * C ABI says these regs are callee-preserved. They aren't saved on ke=
rnel entry
> >   * unless syscall needs a complete, fully filled "struct pt_regs".
> > @@ -57,12 +57,12 @@
> >  #define EFLAGS 144
> >  #define RSP 152
> >  #define SS 160
> > -#endif /* __ASSEMBLER__ */
> >
> >  /* top of stack page */
> >  #define FRAME_SIZE 168
> >
> >  #endif /* !__i386__ */
> > +#endif /* defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS) */
> >
> >  /* Arbitrarily choose the same ptrace numbers as used by the Sparc cod=
e. */
> >  #define PTRACE_GETREGS            12
> > diff --git a/arch/x86/um/asm/ptrace.h b/arch/x86/um/asm/ptrace.h
> > index 2641d28d115c..439c4151f6b7 100644
> > --- a/arch/x86/um/asm/ptrace.h
> > +++ b/arch/x86/um/asm/ptrace.h
> > @@ -13,9 +13,7 @@ enum {
> >  };
> >
> >  #include <linux/compiler.h>
> > -#ifndef CONFIG_X86_32
> > -#define __FRAME_OFFSETS /* Needed to get the R* macros */
> > -#endif
> > +#define __FRAME_OFFSETS /* Needed to get the register macros */
> >  #include <asm/ptrace-generic.h>
> >
> >  #define user_mode(r) UPT_IS_USER(&(r)->regs)
> > diff --git a/arch/x86/um/ptrace_32.c b/arch/x86/um/ptrace_32.c
> > index 3af3cb821524..9e9155b0e918 100644
> > --- a/arch/x86/um/ptrace_32.c
> > +++ b/arch/x86/um/ptrace_32.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/regset.h>
> > +#define __FRAME_OFFSETS
> >  #include <asm/ptrace-abi.h>
> >  #include <registers.h>
> >  #include <skas.h>
> >
> > ---
> > base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
> > change-id: 20260821-ptrace_uapi-462350036cbd
> >
> > Best regards,
> > --
> > Nick Desaulniers <ndesaulniers@google.com>
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers

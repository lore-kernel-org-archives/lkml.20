Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB2B2F290B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299122; cv=pass; b=LPnjVIO6xMFdCNOJ6ukGmfRwbOFmRS1FX4ZUNU+ZaI2+cF7UHd835Wpi8leVnfI3HAOMMMvgPP8b/uflNKai5i6taNwgirEn6BZpf0LczuNVhK+21lJziSjjf6M74D7HivpS87DhYCEgIOPnQ5jKvOtkUyeU/dEpG1B0ET4nUoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299122; c=relaxed/simple;
	bh=ywHIx/tXiCmtCZoDEckTSBG98GZ7RVOV9Q7zo0qlC7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGXGiYhNQoC4eljBZ6SrzeKrOVp0Td/SNu9L8EL3K3ascSzaU2jFW/iThaJYJ1K+JxVP8F5sGo1nM/Vfp+5iArPimvkN5p3Vd0/Eadx7FZKOZsP5UZAe/WAX7GIhrcsnXeBtVZGc2IxPwG820pqEehLksFxKrRMsnX7pH1CD5Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MPluplX6; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MPluplX6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956869750eso1726515e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788299119; cv=none;
        d=google.com; s=arc-20260327;
        b=L6oW03cyD2NEu+7iBCGB5P4XXjpkpUTzZ2RgA/mj4A2483USBXzFHhedFK97v1rZTo
         1qci5l1oy3CsKPP+roGZLMy6r+Wjoc8JZCu03YLbm/MA+6N7EfnxwxfUTpA1PUem63Eh
         vQcOXKRLQaZWGlCAu7YygHPlOVz18ncJhDBaLbuA1aYdwVutLQ7mu+oA5Aeh6dRynAqt
         /3aZYv1c3UMz31Z2vZIuOZIs8BHuE6kLTgZAmqvMV/zO6gsdt87Us579979xD+wRIHfn
         XV8A6fQvCHCaj+zOMUiIC838Tow+o+YUY7quUblg8NmP3X7EmLUtWcx3u8H19/dyYG6m
         PZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cgiBuN8pwAqtwrYzI+JS4k8m7KC3ziuw/j4zEg8Z38=;
        fh=KTnL2VMU8/JW81iMPUL0Vs0Ms03dwqwC3xvbDsufQeI=;
        b=ZjZvNHF45dp18ZrUJ8gRTEjrfFDDh+9mKspPkuVXH7XE/t6zD3Lm6knsfPQ0sMPDGr
         hZaqX8Yg97L1pn0We52SJNZls9HWRg21FuiZDgjUB5HGx/JNyvJAe41sLvd+DrtkiU3w
         D4VFUxE2W5Ootj9wkfx/IelQivRd/PZHoQgZ6OBp2DCbkyS8BjRoDXod1lWQemj1GjTw
         4FsDyKOxBWydOUfRBPWrf0rdvHJcppoZfIQzmVGnGc6u9HAjzuqCsf2Wmko8Qw+ER2GP
         lQDRPxzpuLsBwEBrVAdTDUEq1pZ/k5QxZEPtKwTv5b2nR9ZfCldyQYGg2NhX0u9dwmG/
         U7tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788299119; x=1788903919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+cgiBuN8pwAqtwrYzI+JS4k8m7KC3ziuw/j4zEg8Z38=;
        b=MPluplX6bInOnHb/Tqtwc7VVXXAIgg+L0B/0GGnZRKifKNHqSkXrE10gd3xRiEZi+d
         rweymQCyMvvuKWSh2FcFfbGP88x1Nbvbj5C8r1R/lOzdv9qIbpKIsYDMx3dopGUNJv9w
         yiLRehjxyISZzWBrIa98yJwLp0/zyKlk63i9GMFQvSmMwY1+ShA89qHEMPRuA1X2Srt8
         e2FpwZEW/LrTM9iXA9qPW1bizoEiBthGL6apOUlcRUoFG5iBsa0jCN5O6SgyY6E8Pvc+
         8k7+F8Eu7ypihNKovZBxYIC8BFwNmeqIbUM+fPzZvsCmiAMe5toFjyk7HPPubZtYh2CP
         +Rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788299119; x=1788903919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cgiBuN8pwAqtwrYzI+JS4k8m7KC3ziuw/j4zEg8Z38=;
        b=WikKWAnT71wgRSItePbNxiOBKoCnNtZCP3K3z/gWTEN7JAJmB3OqFrMdTuXf4gAyDz
         nYZ/IG6boBCWkgcTUiOPqOsHIuB01jjrUgDGa1OR7uwi3N0t/bGxHmiN3wryV62Q53kp
         Pib/+MBSZnvD3SQgTJKj/eg3hmrEh57M65qnTTju+y5gGZC2+j/56VIYIT59h2EtYM8c
         xBhZa1PJVYF0WsUdo25W/x+ka4KiYLdaGEQQmuAQQyEbg+FsF2iW4xHcXE6+Ja3AoH/0
         I37qZFaiYpOiI5Gx6uRydngwhN+K5hJ9YT00YDP5zHGUQ+oOmJJmcEGdEg+XWxYPZJzm
         KbRg==
X-Gm-Message-State: AFuF++mwkT2k4WUrSjr/XgcdU0u3Egua31E5Z3OELNdTLefikkyJHf0+
	xkmXSghiJdMKNI1h9gMFdHWMjuqInmm89cHddxBrmzx+ewMhXO21iW8dhVhRo/dbCUAa/tnF9fe
	ns9rZVrEU7WDOVGhNvK+MQ8VXSRzBG5toEwN9Cldtl+6JZmJ0U3Al5mL0
X-Gm-Gg: AR+sD11z+OvKajhU2UycAq3pjxG95AvYNn16WGsFfyX2g81JIYhh+eTAgk98Qm7ekJH
	yGggRfxEoZxnYLvEwJlczYW9UDueLYtUBErYjo3cbAmPHMgPDL/U7zfUhej+Aepsx8m7RMPnG7x
	a8wpKI9mMPusFi02tGdCgXR3vRzDmmjJOegT4bfdz8U40hTW2Nh2UT0LR0MpvDq7TNY0CghOqd7
	sBykIYmpZhEKu7UUr5Rh+IP6BerjlnUw991h3WfVRJ8CTokSF0KIy2+SiJXW2xTVokG5R6wpULR
	4lKXY42Bfe4BZ0mU0Q3JL5f5ea+kfOjetF5A8FQg3JTrFQIBHyB/wIpOsgr1pIQSzEizGgpLSN4
	nLF9pplVO6KPhCQlNJ0F+V4PmsHqDYpyz/PbqmXrdGeR2yLiElJPiPAU=
X-Received: by 2002:a05:600c:474a:b0:493:aa0a:45ad with SMTP id
 5b1f17b1804b1-49ce55ecebemr7900675e9.2.1788299117930; Tue, 01 Sep 2026
 14:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
In-Reply-To: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Sep 2026 14:45:06 -0700
X-Gm-Features: AcwNN1WJANZf5K-B56FXnnbRv_nEZ-c1YRWO7ycGekrQC4yKcYcwf7zg-0bzQpg
Message-ID: <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Oleg Nesterov <oleg@redhat.com>, Elliott Hughes <enh@google.com>
Cc: linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 3:46=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> The register offset macros in <asm/ptrace-abi.h> are guarded by
> `defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
> were left unguarded for 32-bit. This causes havoc for userspace that
> happens to use identifiers colliding with these short macro names
> (e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
> userspace is forced to be super extra careful with include ordering to
> minimize the chance of collision.
>
> Wrap both the 32-bit and 64-bit register definitions under
> `#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
> User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.
>
> Assisted-by: Gemini
> Link: https://github.com/llvm/llvm-project/issues/217413
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

+ enh (who pulled this into android for testing)

Oleg, can I get an ack/nack here? Or someone who knows better the
history of UAPI headers?

(I think the Assisted-by tags need `LLM` now IIUC? Assisted-by: LLM Gemini)

We've worked around this now in lldb-server, but figured it might be
nice to clean this up for the rest of userspace, too.

> ---
>  arch/x86/include/uapi/asm/ptrace-abi.h | 4 ++--
>  arch/x86/um/asm/ptrace.h               | 4 +---
>  arch/x86/um/ptrace_32.c                | 1 +
>  3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/include/uapi/asm/ptrace-abi.h b/arch/x86/include/ua=
pi/asm/ptrace-abi.h
> index 5823584dea13..3656955c6faa 100644
> --- a/arch/x86/include/uapi/asm/ptrace-abi.h
> +++ b/arch/x86/include/uapi/asm/ptrace-abi.h
> @@ -2,6 +2,7 @@
>  #ifndef _ASM_X86_PTRACE_ABI_H
>  #define _ASM_X86_PTRACE_ABI_H
>
> +#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
>  #ifdef __i386__
>
>  #define EBX 0
> @@ -25,7 +26,6 @@
>
>  #else /* __i386__ */
>
> -#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)
>  /*
>   * C ABI says these regs are callee-preserved. They aren't saved on kern=
el entry
>   * unless syscall needs a complete, fully filled "struct pt_regs".
> @@ -57,12 +57,12 @@
>  #define EFLAGS 144
>  #define RSP 152
>  #define SS 160
> -#endif /* __ASSEMBLER__ */
>
>  /* top of stack page */
>  #define FRAME_SIZE 168
>
>  #endif /* !__i386__ */
> +#endif /* defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS) */
>
>  /* Arbitrarily choose the same ptrace numbers as used by the Sparc code.=
 */
>  #define PTRACE_GETREGS            12
> diff --git a/arch/x86/um/asm/ptrace.h b/arch/x86/um/asm/ptrace.h
> index 2641d28d115c..439c4151f6b7 100644
> --- a/arch/x86/um/asm/ptrace.h
> +++ b/arch/x86/um/asm/ptrace.h
> @@ -13,9 +13,7 @@ enum {
>  };
>
>  #include <linux/compiler.h>
> -#ifndef CONFIG_X86_32
> -#define __FRAME_OFFSETS /* Needed to get the R* macros */
> -#endif
> +#define __FRAME_OFFSETS /* Needed to get the register macros */
>  #include <asm/ptrace-generic.h>
>
>  #define user_mode(r) UPT_IS_USER(&(r)->regs)
> diff --git a/arch/x86/um/ptrace_32.c b/arch/x86/um/ptrace_32.c
> index 3af3cb821524..9e9155b0e918 100644
> --- a/arch/x86/um/ptrace_32.c
> +++ b/arch/x86/um/ptrace_32.c
> @@ -7,6 +7,7 @@
>  #include <linux/sched.h>
>  #include <linux/uaccess.h>
>  #include <linux/regset.h>
> +#define __FRAME_OFFSETS
>  #include <asm/ptrace-abi.h>
>  #include <registers.h>
>  #include <skas.h>
>
> ---
> base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
> change-id: 20260821-ptrace_uapi-462350036cbd
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers

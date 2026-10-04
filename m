Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E83B14B4
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108281; cv=pass; b=YWKotkKcqpod8zrn4OwpJsOlFSHYax18K3NtZnw4XRYW3RDfa5TXdw4LwALDnGr41tN4dnZtSAwHGn67y4SCUJzmP2UdKdnk0jwbv9eYojGcHd7tquIYT7/0IxMiFvAtB4NOZOFhrLlDYzrlekOT77PRdmob7UB7M9K3yH6kM48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108281; c=relaxed/simple;
	bh=EBHJJwH5oOGoEiowKEcXjSeW4zCfzR8fzqJl8Snvci0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QL3ulpQY30Nw8AmCyQY439v3d5xWk0xnzcNBZAEccVcFfxXaS4gNyCvGO7wpmaufh3Dif99qbjB6Yq7jAWJvLHFEwF0v+c8ViI20xXhKcToivErwC/6H59nGG38yzUwtVSEJorc0Wj8nOZRZjgqiST8nCTt+IweqrqYnnNPw7oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekx5YJ4Y; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekx5YJ4Y"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1483518a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791108276; cv=none;
        d=google.com; s=arc-20260327;
        b=anCrZjYLM+HiSkH+xB4ECfz2NOfXB7xZqJi1NUXfQXLlKXX1DBJPwsCipJt47NSjja
         r3etVrn7bKKq67gPnCqcurmVCQJbWwJmvRz2UCxNF/B6TdQei4Ylu6EpskcuhQVFFbnm
         JOFvl2s4BmMpHCTuK3OnEwdGHdBPVCFX8CfmUlrzdZzXXvDneIhbG6hxedzeNKA+m76r
         E6mGMFlMDcUyOo99eJP0PA3yn5g3fnwWRqD5zYezW3dNipvSXVr+IMYJL0dh92Oe89NE
         y4oKK3ZXBtn6bv+b52ICZxkSv6onCOia4Hv1GZlGCVrk5oVsURd2VRuweICjV7E6zRuU
         bVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ihe+WnKzwT1Q+F2TK/d50qmjYhl6srofLOFbWpQYooU=;
        fh=r95qMDSi1rjzzTFRgEthuiwa9PmQTofBtWLG9kWTrKY=;
        b=DKxdfHek6Jf8mcZLU6BXA+nNVa6CAnBRnYyvT8dAydKquu5sGruesRXXXwDAWW74ag
         4bWqzxAXUZeISEyGX829/YWLKFhe2SZ/I5mK7RxF6H+dAxNf9KvHeB3EI2k0w6ZACjRU
         Qp9V/UTOyh8GrA3cf1t2A5ScKtPKCzHwDkN7L21daKA1O+i2zetlAmUieKf9SzmFpdWV
         NaqLkCUih/5G6LJ8FrvPF+fBx1Ud36GVaWFZpwZRLeG7HD9WPf4HypNCvPJAqrhvROIw
         Gb0wX1TOs0ZkPEHLm/AosDdyvqsEevPXq4pocxLRcuASRHrP1Wz3KlDMCZ44524tdnTl
         dYwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108276; x=1791713076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ihe+WnKzwT1Q+F2TK/d50qmjYhl6srofLOFbWpQYooU=;
        b=ekx5YJ4YnCSaVlPJwjoSlH/BUvvQpyOPBG/xyAFerz/WZGXgVtfD0KK6jLSKpwyWCn
         0h6M8R9oUzvjmh4q2ngFm0uMaDFdq5y37w1NzkOFZSP0SRcTseQBKnqxzm7TGA39G50y
         MNYAEpvfzpNQHFPqUBGVZE1QKrG4OPJAHnPu8MTwb/RjZNACsTvTHUlvTC2+T5qj8UgI
         eVgdhoSb+kgePtq8lgfsD1CiUJWxJqSjG33yVYydr8EsF5t8eSvdkv6ZImoAXuZM5tKh
         maRf1yMST7PWfT5aG5NKr4MCpLXZywhV+wogu2rZrbPf2RKW/KZlDQimX5eJ0+Z5ZgGo
         H7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108276; x=1791713076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ihe+WnKzwT1Q+F2TK/d50qmjYhl6srofLOFbWpQYooU=;
        b=J9MCxtS4NX+MsKQXJVYY/19EeYBhKHcRl1e4s8QS/0Kmy1fcn2HEOMjfOc1RDa2xx+
         6oO/aEDz6tAhve2DhZwN7Ytf9YRELOZd/IPLrDYXtwk5OPk2wgsPCk3eaa4DV9/ZA47E
         UJ299IuKjOGXXyqosbsCEZTZlyw+xUtk/Iv5dzhlK356dXpkdwGeWIFEeFH7S4JOfxFP
         +/vxWkjGtjytpazs9sTn5SKuEevkAfwHFyUgYgkZcSxVLeOIcoEudCqxDr0wyONDlIru
         2+MetpStp7tGxuK64h6rXpbYYpuRtlANMtN32wmFhJyQuVXE4qVDUCxTPFVsiij9QM4Y
         SSPA==
X-Forwarded-Encrypted: i=1; AKwUvBzupLKrvarYWbe+LeX85jjz2NjJR8eyppmAo3x/hMeGZHp37p611dnJRKdiQHdQaloSw9zcr+KQ82xIXgg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeq/FpvS2NVyI+eU02vrrLLG3MIlcQG68Ec3HZXRV22N/CjA4R
	7IaQkiANWn9aEJl645uq3wEf97h7PUJoV8AwjxWcSuHZd5HExX8tWDE6FsRKwvC+VdKyocGCGCI
	kQzp1b5CZaLMftITE4ihQ2g2pCYD3KSOnpYR0
X-Gm-Gg: AYBFou33GYNXBf1OjH+uCh3/XQyHF9Bvsrkl1UFR3vY+CTXExygvVlTIJCYvE3r5w0x
	e8NimJfYjPZEZlAvJdBgZp5Xf2pT9PikNrJxLgTKFy7wlk5KSMlqfmPG1xI+wVzWWSRna7yxWMK
	PZJ9hgxnzVIB3DfN5DDTS/dyQide3TOiS23sLpGgjt8j/TfGjxmmR9OHNpx2pbkGJMkniOcfDZ8
	f4r2MwXFBh52kAGf4G1AP3Pz3YB1xQo3WxZr4v/HXf0VBUZeLuRMyclF5p7Qmv4qaIOY4mXDE9F
	2Sl5wZQlhYSnoysFxyMKMRixMt8HO8E9ViUhcJOLicFaqxiOsLCmcB70GhIdgNhPuIiTMqgRUj2
	Iskg+WHr2oKeryunW24S5yUJhrNdniD5v3b1vMVP0a1F2uJVHO26R
X-Received: by 2002:a05:6402:46cf:b0:6aa:f0e:a168 with SMTP id
 4fb4d7f45d1cf-6afad8f072fmr3352298a12.21.1791108276228; Sun, 04 Oct 2026
 03:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927005821.8369-1-kaloz@kernel.org>
In-Reply-To: <20260927005821.8369-1-kaloz@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 4 Oct 2026 12:04:24 +0200
X-Gm-Features: AclHuK87PxQTIKtKGJkhA0-iX0j0bWwmt5flwQrpgs4LwD_VD1XKqUH-YVG12O8
Message-ID: <CA+=Fv5SPfwUVExqExM_cX9yWGa3M1zBo057koD3VRZXVd3DCrQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] sparc32: SMP futexes, casa and idiv emulation
To: Imre Kaloz <kaloz@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Imre,

On Sun, Sep 27, 2026 at 2:59=E2=80=AFAM Imre Kaloz <kaloz@kernel.org> wrote=
:
>
> sun4m has no compare-and-swap instruction and casa is optional on
> LEON, so SMP sparc32 has had no futexes, and user code on those CPUs
> has no CAS to build locks from.
>
> Patch 1 implements the futex atomic ops in atomic32.c and drops the
> !(SPARC32 && SMP) dependency of FUTEX. A LEON part that implements
> casa, found by a boot-time probe, runs casa on the user word; other
> CPUs take the __atomic_hash spinlocks.
>
> Patch 2 completes user casa from illegal_instruction on CPUs without
> it, through patch 1's futex_atomic_cmpxchg_inatomic(), so emulated
> casa and the futex ops serialize on the same lock. It is atomic
> against itself and against the futex ops, not against a plain store
> to the same word, so a C library using it has to do its atomic stores
> with casa too.
>
> Patch 3 completes udiv, sdiv and their -cc forms from the same
> do_illegal_instruction() dispatch: SuperSPARC and SuperSPARC-II trap
> those when the {Y, rs1} dividend has significant bits above bit 51,
> which gcc -mcpu=3Dv8 output, including libgcc's __udivdi3, can produce.
> It shares patch 2's windowed-operand helpers and the dispatch block,
> which is why it comes last.
>
> Patch 1 comes first because patch 2 is built on it. On its own it
> races nothing: without patch 2, user casa on these CPUs is SIGILL.
>
> Magnus Lindholm has an independent RFC covering the same ground from
> a different ABI: "[RFC PATCH 0/5] sparc32: kernel assisted
> compare-and-swap, and futex on SMP" (patchwork sparclinux, Message-Id
> 20260923201830.865553-1-linmag7@gmail.com), with a companion glibc
> series (patchwork glibc, Message-Id
> 20260924064228.867909-1-linmag7@gmail.com). That RFC adds a new
> software trap, ta 0x11 (trap type 0x91), extending David Miller's
> 2016 CAS-trap prototype at ta 0x23 rather than completing it, so
> userspace has to be rebuilt to call it. This series instead
> completes the casa opcode itself, so a binary already emitting casa
> (gcc -mcpu=3Dleon3 or -mcpu=3Dv9 output, or a C library that encodes it
> as a .word) runs unmodified on a CPU without hardware casa, with no
> new trap number and no libc rebuild. Happy to share the futex and
> do_illegal_instruction() plumbing with whichever ABI lands.
>
> Andreas: do LEON3FT parts want the GRLIB-TN-0010/0011 "nop; .balignl
> 16" alignment before the casa word here, or is the plain encoding as
> posted fine for them?
>
> Notes, not for the log:
>
> - checkpatch on patch 1: "Lines should not end with a '('" is the
>   __asm__ __volatile__( idiom of uaccess_32.h; the -ENOSYS warning is
>   the futex API's return for an unknown op, as on every architecture.
>   "does MAINTAINERS need updating?" on patches 2 and 3 is covered by
>   the F: arch/sparc/ entry.
> - On qemu's SS-20 with two SuperSPARCs and the casa emulation alone,
>   futex() returns ENOSYS and musl's mutex, PI mutex and robust mutex
>   tests fail. With patches 1 and 2 they pass, as does a PI lock
>   contended between user casa and FUTEX_LOCK_PI/FUTEX_UNLOCK_PI on
>   both CPUs.
> - The casa branch of the futex ops has not run on LEON hardware. The
>   probe runs on LEON only; its fixup path, which a LEON without casa
>   takes, has run only in a test kernel that forced the probe on
>   qemu's SS-20.
> - The divide emulation has run on no CPU that traps it. No sparc32
>   model in qemu raises the trap, and no SuperSPARC or SuperSPARC-II
>   was available for this series; it is exercised only by build and
>   link.
>
> Imre Kaloz (3):
>   sparc32: support futexes on SMP
>   sparc32: emulate casa on V8 CPUs
>   sparc32: emulate integer divide taken as illegal_instruction
>
>  arch/sparc/include/asm/futex_32.h |   6 +-
>  arch/sparc/kernel/Makefile        |   2 +
>  arch/sparc/kernel/cas_emu_32.c    | 117 +++++++++++++++++++++++++++
>  arch/sparc/kernel/div_emu_32.c    | 127 ++++++++++++++++++++++++++++++
>  arch/sparc/kernel/entry.h         |   2 +
>  arch/sparc/kernel/traps_32.c      |  23 +++++-
>  arch/sparc/kernel/unimp_32.h      |  71 +++++++++++++++++
>  arch/sparc/lib/atomic32.c         | 122 ++++++++++++++++++++++++++++
>  init/Kconfig                      |   1 -
>  9 files changed, 468 insertions(+), 3 deletions(-)
>  create mode 100644 arch/sparc/kernel/cas_emu_32.c
>  create mode 100644 arch/sparc/kernel/div_emu_32.c
>  create mode 100644 arch/sparc/kernel/unimp_32.h
>
>
> base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
> --
> 2.47.3
>

I'm following up on this series after some more testing, overall:
very nice series, this lets us run modern linux user-space on
sparc32 hardware again, with minimal changes to glibc, which I
believe is in line with what Zanella responded on the glibc mailing
list: get the support on the kernel first, and glibc can catch up
transparently.

This replaces my own CAS/futex v3 series entirely:
  https://lore.kernel.org/sparclinux/20260923201830.865553-1-linmag7@gmail.=
com/
As well as my previous fix for UDIV/SDIV:
  https://lore.kernel.org/sparclinux/20260924205646.870950-1-linmag7@gmail.=
com/

This series is altogether a better solution for getting sparc32 userland
up and running properly.

One thing worth mentioning for anyone testing this: a stock sparc32
glibc build (mine, with its own kernel-trap fallback) does not just
lose a feature on this kernel, it hard-crashes - cas32() falls
through its HWCAP dispatch to a fatal abort the moment anything
needs a real compare-and-swap, which in practice means every
threaded program, including sshd's own connection handling.
Confirmed this the hard way on real hardware.

The glibc fix this needs in return is smaller than my CAS/futex
series ever was, once the kernel completes casa
unconditionally, cas32() collapses to one unconditional casa
instruction, with the whole HWCAP dispatch, the kernel-trap
fallback, and the fatal path deleted outright. Built and tested that
reduced patch against a real portage glibc build.

Tested on a real SPARCstation 20, on both a HyperSPARC and a real
dual SuperSPARC-II module, so the udiv erratum genuinely traps:

 - casa and SMP futex (plain and PI) all work correctly
 - 8-thread pthread_mutex contention, 1.6M locked increments,
   zero lost, on both CPUs
 - userspace casa-based locking and FUTEX_LOCK_PI/UNLOCK_PI
   correctly serialize on the same lock word under contention
 - udiv/sdiv: 10/10 correct, including the saturation boundary in
   both directions, INT64_MIN / -1, divide-by-zero -> SIGFPE, and
   udivcc condition codes

Individual Tested-by tags follow on each patch. Thanks for doing
this.

Magnus

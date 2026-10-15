Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160134825C8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057019; cv=pass; b=qUhnmnfBvhgNr93FthCozXExUBlvfkWVxLKEgGyPBpC93Xpjlr8P+e93lccYw63AJwg/2Dalf36fgGaI4Q5ULo85dNkozu1xvwPNjJ7R4QkIjz6d2fQVyB1pv9RoioExZu2xlx3kAiS4oRw467pe+tLnIcieJeTcfiNpLmpcD1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057019; c=relaxed/simple;
	bh=q/GsrhTy+J4847NXG0IxiXiSf5PZm4EiJGEMdbBbxB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b27q2SxLW2uvg+qPgik1mXuvVWQONL5yXs3faxiwZ9Rq1LfUE/cwnsgbtMNJtIgMvmi88cOtRQApptr3qkvG+XFxVxX9RsVBRvhlW4+Mmp0VXC8c1kHoOQXzaB5rTIGylMXC8DK8CO973yD9xufl2rtD+pxEnB1E5vQVoPpod94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFcT+2uJ; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFcT+2uJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e6df2742cso774865266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792057016; cv=none;
        d=google.com; s=arc-20260327;
        b=AFGEy2CNqS85I+gjAIgrgJCYOlk3yJWak5CuifRimVn1PPColCm5JAAnXXOsVQBvSr
         F8k6O2rkpQZ99fwUld++0wjkvVD+yyiT1JRP5nbTtbNMUuA3XBP9MWCBZGqUhaPG/QV/
         zIPKtqocbv3cSpXTT/k9VW3yHVdpq8wtE59irYsNEv02/wtrQgxiGxdWoVBfpv7asCL0
         8CJY9UwRe8FcS90ywC6iZBiYIASVmA8wdyIEaHaK+wj9uiQLqZ1BLzPvyHzhcZMdNzvR
         AvDFBPe+pX9Y4e9FKhnwdYj1wlaceETebOUowbAAtFKA4DBPH0gYeE3K08vSCiZapR3T
         teGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TJ4kyHzEXQ+BBuvOCPSYxjDewsZ6QwABlhrdCRZZkoY=;
        fh=THiSzws97mKMXSxMrumh3QKVOk5UQ2MdgkDn6MLymwQ=;
        b=AGtUfeMHjpq53Zatawv3gl45vJua+9+hA9AMoccKPuIxkABHZh6F2WO1ZvoD/AqeIp
         05+wNRTPHHUqtvtlX5TwNLwGH6iV43wghwCR8k0hThMbFOB7p29qA05SWbdThKbQBWME
         kxPvUiuX0IUZBorpuzh5TlyddAsdratM18cKkuxYArNAIShFqiwHOA7zukZahYptU1M7
         3TlW974WBFVOxy0h0/xPAsSSyI+RBnu841vbG7Y51y80IbDuAYXVlT4BujaHiJprwis6
         lbFxUjqDYd3S1FbxENKPICSsBfVPyYh2P0pXNS3YlqUSouEIZf7DQEYlwK3uLR3XLoqK
         TLBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792057016; x=1792661816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJ4kyHzEXQ+BBuvOCPSYxjDewsZ6QwABlhrdCRZZkoY=;
        b=sFcT+2uJbmBg3v7wR6estVWRwiwzSiDnzUS1UbMLFfrRPhSwtIBtsguEsXyv7WusrJ
         07fermYQiBPanGmlYX3TbaUVIG873GxYRU49+cK0Ox5xXI6fL8W+W9mLx5nOvDbErlLZ
         I2kfqmycrGLp5uI5KzR8lT2U2i/hYLybp4xet7482qVGVyZsTNbPrZjgpxrrovqHhOST
         O/LHU4ZRCqZdvOimraoXUwKYMc16IlyJhRvQ1YhSSf+lGs6uHZ9NOqeLKstqc1KkKayB
         9s26e5DZXffLEOxPzjUNw/fBC8Nwe6jzZypp/oJJvl9ig5R8zIu41Syn5JHxpkH126OA
         vgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057016; x=1792661816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJ4kyHzEXQ+BBuvOCPSYxjDewsZ6QwABlhrdCRZZkoY=;
        b=gG4ZOSCxUFlGkKb8mwtRh/BJqfnsB/s5AHV02VZnzr0l7+pXhSwCvpZF0yEBYwjdL8
         6MDGD4Vls27uoDmWDCDV6DxV+6Uaq3YK3DYX9GPd+B6f2AOs4GoMp3qH4Uo9703FhwId
         cDQzORXn614bN1ZoEnVPVqlh+5q88BaXc+jLfOmaeByporOGVhNSfjUm14Ljc6ngQ2eO
         jgYwCZ3/M9AqcAEYV06ShEAU/9jpt3bDZ9AQ3uhVYJwy4G/OqRKvL7CC/AvRSCuWG83N
         W+rT/fOlrv2QpqmHrXVcvMAviJyblIY6+QJfa56OWPqqwzxnuf8jHaLpQMEb/85Lg2Ju
         7zXA==
X-Forwarded-Encrypted: i=1; AKwUvByi6eUwQAevYiCJBHaOzsDgBSoyzlKhWFWZNzUnNQx0fa6ILB1hiK1sCHmqjZpRTy1mff/eei0MzpwCNQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiZrh+kBdOYVS6dU0M0tsMTBvzDk2e0AlYlcoXTOOwLfHZGHD1
	dne8lnOav9e+jfZEQjCTxxp/jZNN5h7IrweesBVVnc4d26WteUWgJ7sLdOBItkiV9R3G7AmSaZe
	dqzpU/hDAcSKcDMBU2vzyiwqZJ0jWNxY=
X-Gm-Gg: AYBFou1ONeVh8q9/jHnwBdDPROA70IWVeezsWjhytv6XW82aOIh7YTHlCFurJcIRRd7
	xBMn2esknN+PHADT1jzv/2EqVuujJAX/LhesStHXXu5VktqsVWMcPfhA/2aL02e5V+dRQZrAuuj
	AQLbg/4q1d7AhXHEN1iPzB0XV6ABux/ROuMqFrXLoJJqYxfIa2EdfY8uEACA3yeCC0eiECrzCya
	YoLblbjHA1Uqmrr2/S6WumFf7zipoUeK2+OJ4OfcxHsv4wGpestf5H7ZITu0AW9VusiuY+FHaTp
	0j1NdNpAWTp+rJSdCL+3M1m3a4aGaWfN5owMeatPyfrNK81xBFxDmsy4SHxf96KXvveaRVKcxkX
	IKf018GLjd8JK
X-Received: by 2002:a17:906:e10f:20b0:c32:8cbb:fb3 with SMTP id
 a640c23a62f3a-c328cbb1b7cmr915703266b.14.1792057016115; Thu, 15 Oct 2026
 02:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015085545.3246951-1-ramin.moussavi@yacoub.de>
In-Reply-To: <20261015085545.3246951-1-ramin.moussavi@yacoub.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 15 Oct 2026 11:36:43 +0200
X-Gm-Features: AclHuK-Al5Sxvm9OnAOTHYLG6D0tERfJTns9gmJtiGM8GcDRIy0QEi19IjJ4MmY
Message-ID: <CA+=Fv5SqcMT4TLUVSnR1j9WxCf_iMn7Pr3vm9ZRKtkzqZoO6eg@mail.gmail.com>
Subject: Re: [PATCH 0/4] sparc32: SMP fixes, futexes on SMP, and a cmpxchg
 system call
To: Ramin Moussavi <ramin.moussavi@yacoub.de>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Guenter Roeck <linux@roeck-us.net>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ramin,

On Thu, Oct 15, 2026 at 11:07=E2=80=AFAM Ramin Moussavi
<ramin.moussavi@yacoub.de> wrote:
>
> This series makes NPTL usable on sparc32 SMP kernels. It started with
> the uClibc-ng test suite on qemu's SS-20 with -smp 4: the kernel went to
> error state under console load, sometimes hung at boot, and had no
> futexes at all.
>
> Patches 1 and 2 are fixes and do not depend on the rest:
>
>   1. The per-cpu timer interrupts on sun4m/sun4d and the LEON IPI leave
>      their handler with traps enabled at the PIL of the interrupted
>      code while the trap frame is still on the stack, so interrupts can
>      nest without bound until the CPU goes to error state. The generic
>      path was fixed in 2.1.129; these three exits never got the change.
>
>   2. A secondary CPU gets 10000 rounds of udelay(200) to call in. Under
>      qemu the delay loop calibration depends on host load, the wait can
>      shrink to a few milliseconds, and a CPU that calls in late blocks
>      RCU and hangs the boot. Wait by jiffies instead.
>
> Both are marked for stable but have no Fixes: tag. The sun4m and sun4d
> code they change is already in 2.6.12-rc2, the start of the git history;
> the LEON variants were copied from it in 2011.
>
> Patches 3 and 4 add what user space needs on SMP:
>
>   3. Futex atomics for sparc32, so FUTEX no longer depends on !SMP.
>      casa is probed at boot (LEON); without it the word is updated
>      under the hashed spinlock the kernel already uses for its atomics.
>
>   4. sparc_atomic_cmpxchg_32, a compare-and-exchange system call for
>      user space built for v8, which has no CAS of its own. The ldstub
>      emulation C libraries use instead is not async-signal-safe and is
>      invisible to the futex code. It takes the same path as the futex
>      atomics, like atomic_cmpxchg_32 does on m68k. The uClibc-ng side
>      that uses it is ready and waits for this.
>
> Tested on next-20261014 under qemu 11.1.0: the uClibc-ng suite on SS-20
> with -smp 4 and UP and on leon3_generic with -smp 4, plus a test
> program for the system call; the details are in each patch. sun4d was
> only built, qemu has no sun4d machine.
>
> Testing under qemu
> ------------------
>
> Three qemu problems get in the way of reproducing this, none of them
> caused by the series:
>
> - leon3_generic does not boot an image passed with -kernel since qemu
>   9.0: the synthetic bootloader no longer sets %sp (92688a91c358 took
>   it out of the reset handler). Gaisler's own prebuilt images fail the
>   same way.
>
> - leon3_generic does not bring up a second CPU under Linux. The IRQMP
>   model never sets the broadcast-available bit, and Linux stops with a
>   BUG in leon_smp.c; with that bit set, the secondary CPU dies on the
>   swapa with ASI 0x01 (forced cache miss) in leon_cpu_pre_online(),
>   which qemu does not decode.
>
> - On sun4m, qemu's ESCC drives only the interrupt line of the channel
>   it was called for; the board ORs both lines, and a stale line keeps
>   level 12 asserted. Boots then hang at random with an RCU stall about
>   20 seconds in (4 of 40 boots with -smp 4 here). That looks like a
>   problem with this series but is not.
>
> The LEON SMP results were taken with these fixed in qemu; the fixes are
> going to be reported to qemu.
>
> These patches were developed with the help of Claude (Anthropic), as
> the Assisted-by tags say. I have reviewed them and tested them as
> described.
>

Thanks for the series.

For the futex/CAS patches, have you seen Imre Kaloz=E2=80=99s earlier serie=
s,
=E2=80=9C[PATCH 0/3] sparc32: SMP futexes, casa and idiv emulation=E2=80=9D=
?
https://lore.kernel.org/sparclinux/20260927005821.8369-1-kaloz@kernel.org/

There seems to be substantial overlap. His approach emulates CASA directly,
allowing binaries already using that instruction to work without a new
syscall ABI.
That seems to require fewer userspace changes for those binaries.
Could these efforts be coordinated?

Regards,
Magnus


> Ramin Moussavi (4):
>   sparc32: keep PIL raised until the IRQ frame is gone
>   sparc32: wait for secondary CPUs by time, not by loop count
>   sparc32: implement futex atomics, with casa detected at run time
>   sparc32: add the sparc_atomic_cmpxchg_32 system call
>
>  arch/sparc/include/asm/cmpxchg_32.h    |  4 ++
>  arch/sparc/include/asm/futex_32.h      | 72 +++++++++++++++++++++++++-
>  arch/sparc/kernel/entry.S              |  9 ++--
>  arch/sparc/kernel/leon_smp.c           |  8 ++-
>  arch/sparc/kernel/sun4d_smp.c          |  8 ++-
>  arch/sparc/kernel/sun4m_smp.c          |  8 ++-
>  arch/sparc/kernel/sys_sparc_32.c       | 35 +++++++++++++
>  arch/sparc/kernel/syscalls/syscall.tbl |  1 +
>  arch/sparc/kernel/systbls.h            |  1 +
>  arch/sparc/kernel/traps_32.c           | 13 ++++-
>  arch/sparc/lib/Makefile                |  3 +-
>  arch/sparc/lib/atomic32.c              | 53 +++++++++++++++++++
>  arch/sparc/lib/casa_32.S               | 30 +++++++++++
>  init/Kconfig                           |  1 -
>  14 files changed, 224 insertions(+), 22 deletions(-)
>  create mode 100644 arch/sparc/lib/casa_32.S
>
>
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> --
> 2.53.0
>
>

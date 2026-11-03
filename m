Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744874;
	b=42HUclBbIBt2a+yNDOYYulxGdUrKY/JOW//epfSQ7046uidG6jQYvBjCzENtp4a3uEhk
	 KiuPr/x/dUKR5EpuOI/6+uVBwB9Q80XkkrJFBWSDZwAy54I1TwScXLR1wZ+W73zX+Io3X
	 kVWjmSAhszM8ZtGnC3jmaXRZLjEEl1z8/1lurlihqmpG5QcG1hJ5zAHpPV4TeGlpT12se
	 N+rj0HqHTl6PUV3hmzhiswwjtIiZU1hWZiDCioH9cJB38vdM+16MsRUW0ZWP6NzGfqBIF
	 qh4XTo6uoAMyELlOVCnd/67QMVzq4iJ6vjwCl+HxdB5BovEaSPnLIPKwVFHv37AgAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:X-Google-Original-Date:Subject:In-Reply-To:CC:From:To:Message-ID:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=W46N2zD8d3M/q6sqBtsamnQ8AkzANHljJG6JB3HVn40=;
	b=SNAisYceLAmQb+VRi2SB+XMSJRPZC++NHgupFfdC2d79JdsP6LkB/SkI9ItokbITftq4
	 PlrWsNTN1ZlF8ottENiE7M0lp8VXSoHG6FJp4zahyXkkoIaPrpdtaSANp9ey6tCnafVn9
	 iE62RQR88+TFhIhavw5gKBe1eS5zPE1OP7k0AT9L4e1UAVfiGOCnj/sDKt3qR3U3DPL6S
	 amYC23QpmwMnihZAXil10Iexj4U7I+K6I6pDxDfS6h68MUQLaKEYf6G9Jh1QMITs04fYb
	 Ffa3VG3JfGl133VAFZpPB1r4Ga1ghjPP5f/kTrLIQZ1OL8Qyc/I54Zb+OUqqteX8kyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dabbelt.com;
	spf=pass smtp.mailfrom=dabbelt.com;
	dkim=pass header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L1tizh12;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650B7606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650B7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L1tizh12
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so67538eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1793744872; x=1794349672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W46N2zD8d3M/q6sqBtsamnQ8AkzANHljJG6JB3HVn40=;
        b=L1tizh12o/Cy+ZVcrcwk8dChyjQgjBWGHHUIdPKYVIyEwC1ZndB+eTkwBpRbYJULK0
         2RFcNWVNV5nu5r4UeUlDLeHQqCWFJvb7u0OnFwOzV+ON8GBQB/fPGH4zIfE5Hl2La15c
         NLZ7R4cZGOvL0ZX9rXDnu2gTQjhA3op+yoqUAKDZwBW0t1hElPbDfCnY0qA/ny+ADZVS
         Bw6Fg8DQAnuRZ5WU9rfKwL3I+O8fwoTYBk25yaIOkbHN1talCcx94/0VHLH94/XpJGqb
         THCVfp258BFxkKtlVmfsJWpSgaMRAxWP70u4/h+K+5jS7r9kI4JUhCN+altbCjTFJFzc
         UtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744872; x=1794349672;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W46N2zD8d3M/q6sqBtsamnQ8AkzANHljJG6JB3HVn40=;
        b=RYjm0KuvZbxk+XOTo+MeahiFgflFqRbpbCEOxtp4fhjpr7KN2PhmcDrHysLDnJvXJ7
         bbsRkkAuN92sH4XUPA9ucUP22LIG0dRlGnwRZm1oyvxZ15jIsKoLtLWEXLmCubeQEgRM
         pYuxnqDbefzoCqoyVFwP1XzAnVq53Cdwgo4s2olNOIKf6+qBvv/jgm28fOc3pg5XDt7g
         KaETF3/UhVdEUjy5MwrKbZisf93ZKE3rV4lh6BN/iC3f9bfrqtGUxLQ1PqVVjN/GZMNJ
         8HgiwnnkxTIud9g4AzMbroZBHAyxdn2HOwEvrSvirGAim/JKRp8FFLy0R8EAOvx8KxJb
         1q3g==
X-Forwarded-Encrypted: i=1; AKwUvBwb7T5JCJcaVx5VsEPecy8rkDC684z2Fy9XGWi+2sV0zHWg6M9UAPZsal2YTWzUZMvjexCxu5isdABrrio=@vger.kernel.org
X-Gm-Message-State: APuU4Z97zFB7AWQBzb7OI9Lbslg0wbvHtDJG4rgl7vMrHFS6arWrBngz
	ec+V3LBByact1FOW44cHn+rLhZA4xQmJib+ctkR3ienLhZ35kab6Se6U5VLDv0cFV9c=
X-Gm-Gg: AYBFou1Jh9dj//6JDOmYwxxW4FIpp7Nul7qI37ZCG/gTbrqs6ZsHTwdzWhRtx2PAYyH
	pg2DKsU2edHuU+fPf5sdxbKjDYFEvFQ5Ao4olH6xjOIXYyy37eiZXhsgtX39ov0t0NsqpYRSAlP
	uy25IzqJDCKtBt3zY9WiX6TrskhVEtTCkjdB5iOmncd7TjPNryLUQGmZmv3WnAf+7t9F9+a8G1+
	mDpj/JhiBqRlc2nn1CTj7hV+ckW9d/E7bBOiTqC9H2bA3dP4vj5E2EHPC+bZ3fezmaizDulyf4c
	202m10BdyyalyMpAV2q/iskn85SWoZkUgkovpl5xas7FarxDNWhOIHiLazCbQkyOmyum1uzRkGo
	1KXkGWdnY7oPTuEhADxFoAaYCwysq4cFx6PZw6CCtDY+bCDQ+4KvmLdKMJVIsPFoVxsaRWIJnEk
	DkNlebbH2atumYYa3uwEzHvAyoQVfPskGFvQSdnayTjKc8GMhSmvKpyxxQJqiB8/gm0TO1gW5Qx
	iXSxBSlU76xnGps7qqCBMCEiXMnDA1Od1wlts7NXZ8/dKJrWxROzv447T5j7D5fCouORMOhSwIn
	Sa55hj78Llj7WMVnkiyMJydwKfDPUuYBtcWD/xNwBJJqVQRNH634ksddB0YDwyLZHRXFId+rnwc
	zq73x6PGZ/MHoBAc8lPWxZpFP8TvO9W+xWQ==
X-Received: by 2002:a05:693c:864d:10b0:369:9062:c392 with SMTP id 5a478bee46e88-36a424261c5mr24477930eec.37.1793744872114;
        Tue, 03 Nov 2026 14:27:52 -0800 (PST)
Received: from localhost ([2001:5a8:4687:d600:d5a2:4dd4:6c9b:a9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm1211516eec.7.2026.11.03.14.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:27:51 -0800 (PST)
Date: Tue, 03 Nov 2026 14:27:51 -0800 (PST)
X-Google-Original-Date: Tue, 03 Nov 2026 14:27:49 PST (-0800)
Subject:     Re: [PATCH v4 0/2] riscv: support CPUs with Zalrsc but not Zaamo
In-Reply-To: <20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com>
CC: pjw@kernel.org, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
  Will Deacon <will@kernel.org>, peterz@infradead.org, Mark Rutland <mark.rutland@arm.com>, gary@garyguo.net,
  yury.norov@gmail.com, linux@rasmusvillemoes.dk, cfu@wavecomp.com,
  Linus Torvalds <torvalds@linux-foundation.org>, Olof Johansson <olof@lixom.net>, aleksa.paunovic@htecgroup.com,
  arikalo@gmail.com, boqun@kernel.org, boqun@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Vladimir.Kondratiev@mobileye.com, vladimir.kondratiev@mobileye.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vladimir.kondratiev@mobileye.com
Message-ID: <mhng-6BAAFBCB-95B3-45AC-9087-C00241996255@Palmers-Mini.rwc.dabbelt.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, 01 Nov 2026 04:51:38 PST (-0800), vladimir.kondratiev@mobileye.com wrote:
> RISC-V split the A extension into Zaamo (AMO*.w/AMO*.d) and Zalrsc
> (LR/SC). Linux has so far required the whole A extension.
>
> MIPS P8700 [1] implements only Zalrsc. AMO instructions are emulated by a
> trap into SBI. I measured typical userspace atomics on this CPU: an
> LR/SC atomic takes about 40 cycles, an AMO atomic about 600. The same
> ratio applies to kernel refcounts, bitops, xchg and futexes, so the
> kernel needs to emit LR/SC when Zaamo is not implemented.

In RISC-V land, things that are implemented by M-mode traps are 
generally considered "implemented" in the context of supervisor mode, 
just implemented to have low performance.  I don't agree with that 
decision, but that's really an ISA thing and not something we can do 
that much about it Linux.

So I think the first thing you need to decide here is how you're going 
to be treating the atomics: are they really unimplemented, or are they 
implemented but slow?  Right now this is kind of a mixed bag: you're 
sort of treated them as unimplemented in the kernel (or at least parts 
of the kernel), but then implemented in userspace.

If you're going to treat the AMOs as "implemented but slow", then I 
think it's best to see some actual performance numbers for a real 
application.  Sure 600 cycles is slow for an atomic, but I was recently 
playing around with some much larger systems with ~300 cycle AMOs and 
couldn't get any meaningful benchmarks to show up over there -- those 
were OOO cores blocked on bus resources, so a completely different 
problem, but just saying they're 600 cycles so we can't use them isn't 
really good enough -- particularly when the alternative is 40 cycles, 
which is also super slow, so it's not like you can be doing all that 
much with atomics on these cores even with the "fast" sequences.  You're 
probably also going to need some way to tell userspace about this 
"implemented but slow" behavior, similar to how we describe misaligned 
accesses (which is all a bit of a messy retrofit, so maybe don't copy it 
exactly).

If you're going to treat the AMOs as "unimplemented", then we need some 
way to deal with userspace.  Right now we have A as part of all the base 
behaviors we expose to userspace.  We used to have the non-A userspace 
support, but we decided to drop it when upstreaming the port because it 
didn't seem useful to anyone.  There was a design sketched out here with 
a VDSO call for cmpxchg() that looked similar to some of the non-A Arm 
systems, but as far as I know nobody's implemented that in the kernel or 
userspace so it'd need to be proved out.

> Mobileye is going to use the "eyeq7h" platform, built on this CPU, for
> ADAS and autonomous driving. Kernel atomics are on the scheduling,
> memory-management and driver paths of that product, so the emulated
> AMO cost is not acceptable there.

Is that announced anywhere?  All I can find is an EyeQ 6 on the website.

Also: are you planning on continuing with these non-A systems?  Those 
40-cycle atomics are going to burn you at some point, if the plan for 
the next-generation systems is just to go implement A then maybe it's 
best to keep this out of tree.  We already have way too much 
fragmentation in RISC-V land as it is, we don't need any more.

> This series keeps today's default: both extensions on, -march still
> contains "a", generated code is unchanged. Turning Zaamo off is a
> NONPORTABLE choice. The resulting kernel matches one -march, which
> userspace has to use as well, so a runtime alternative would not
> produce a portable image.

It's really not non-portable, though: the Zalrsc code runs fine on 
systems that support Zaamo, it just may be a performance issue.  I'm not 
sure anyone's actually measured that, but I think it's sane to just 
assume that native AMOs are going to out-performance LR/SC on _some_ 
systems.  It's still just a performance thing, though...

> Zalrsc stays mandatory. cmpxchg, conditional atomics and futex CAS are
> already LR/SC sequences; Zaamo cannot replace them. BPF atomic ops
> still emit AMO and remain unsupported on a Zalrsc-only kernel.
>
> [1] https://mips.com/products/hardware/p8700/
>
> Changes in v4:
> - Require a compiler that accepts _zalrsc in -march before Zaamo can
>   be disabled. GCC 15.1 introduces that support. Older compilers keep
>   Zaamo enabled and -march keeps "a".
> - Link to v3: https://patch.msgid.link/20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com
>
> Changes in v3:
> - Make Zalrsc mandatory. cmpxchg and the conditional atomics already
>   use LR/SC, so RISCV_ISA_ZALRSC can no longer be turned off.
> - Check AMO and LR/SC support independently. A kernel that emits both
>   requires "a", or both "zaamo" and "zalrsc".
> - Put the LR/SC bitop sequence in its own block so two inlined
>   set_bit or clear_bit calls compile.
> - Remove the LR/SC loop that ran after the hart lottery and accessed
>   address 1. Build the lottery increment with add so RV32 assembles.
> - Add an exception-table entry for sc as well as lr in the futex
>   LR/SC helper.
>
> Changes in v2:
> - Switch from a runtime choice of atomic implementation to a
>   compile-time one, gated by NONPORTABLE.
>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
> Vladimir Kondratiev (2):
>       riscv: build kernel atomics from LR/SC when Zaamo is disabled
>       riscv: accept the atomic extensions this kernel was built with
>
>  arch/riscv/Kconfig               | 32 +++++++++++++++++++++++
>  arch/riscv/Makefile              | 15 ++++++++---
>  arch/riscv/include/asm/atomic.h  | 56 +++++++++++++++++++++++++++++++++++++++-
>  arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
>  arch/riscv/include/asm/futex.h   | 53 +++++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpu.c          | 28 +++++++++++++++++---
>  arch/riscv/kernel/entry.S        |  9 +++++++
>  arch/riscv/kernel/head.S         | 14 ++++++++++
>  9 files changed, 267 insertions(+), 9 deletions(-)
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20260120-lrsc-only-cc06422f5bb1
>
> Best regards,

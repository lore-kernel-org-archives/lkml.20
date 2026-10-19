Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792444491;
	b=rmZGpBo8dB1KraJwcX1Oaof15krdSdYMaIN8W6fJrKdvGCABc3YTQpwqW7jzdDNiayaG
	 8Zk1zeBXUFKc0DwETI2EeFEgFJWonitPL9WxncJ7bZRyyBCHeUzSzkHIwYoW8aurmlTUO
	 QmHZ4I9idiYFMp/i4oJem/FIHpX35jwtbZY8s1b/yQvfQEiFbkKUwRlGVdQwOPj5KULZm
	 2vpRHyzEEK24eck53gAGTB9XRNqrv9z4jl/S/QrUTlphj4IZZJv5lKFBuTp2V75aDU7Rp
	 s2GKCkQjKSY4PWlb9/jWhsHwVy83tCV0d+8dXMF9PAZkrVARQQvCheURyOZrckHvbTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=amK/RH/lhBSdCM1HiSXsr547jckeDqZUfPijQf08JF8=;
	b=E8Kg6l8foZsjTyRNqG3L2Tk0eUdMvgEBxQIN9NGt3CwTRqntzWfdPfY2QoHaRvF5vzqe
	 sqodYYBeJbXmM4omzaKuTY4eLdgnoDuzri0H1YTNCPjtir6o+DYr14RKCT8pgKkivgqaq
	 sxRvptIXpl/YbOoaesCSjzv1FRtux2UnASDDEixsJofN6DZbVpLyALzyE2pdPAgjaLEZu
	 RSvZcWsqqKJCQeY4KhrOjaPNtQdiNc0C3Ntn2Nof7uDtcZC/ogTcTd6zEqvdFnx+7vXop
	 SVt+oO6Hm8Xl/5o8sa6QL9+676idTUnRwkfHjB5M3kUa0JvxIPDT6z3DO+b34aocrvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SuxFPp4X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995E606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4995E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SuxFPp4X
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-535f598d126so36701cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792444490; cv=none;
        d=google.com; s=arc-20260327;
        b=kkZisHjvWXXZedRo53jlVkJbLGhpy/cI0mNe2eRXA6X3cqewjDSZUk9k77Nre892DV
         +hj1SpagrxSSKbRa1isZSd0si6xQwJZ5L7GZYbWjpG4CejldGSyMES+R4QV8s4Ts0+Xg
         3TJs/lidTav63bYJxRmP51oRLL14IwcUZ9fVz8hDCiQCEU9RHzfidwKqEN5U0hFXtado
         dj/qn7EJRawGCKpOZXjQwwkw8HnmhEvD/Z9ydtTyRZZvhtEHNrLpem/VdsiLvS83kgtT
         P4NUUtyYyUw/JbyHww2XdPLBlIGZcqsvTjjRMTC1u07aUa7Ov2fZc8hndF4hf+eSdH2q
         NXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=amK/RH/lhBSdCM1HiSXsr547jckeDqZUfPijQf08JF8=;
        fh=gTRIWM+F3winOKYjEEgRNGpPTAHHoL/TP03mCzANKKM=;
        b=ea8udH/Cd8yGhJTICzklW+PRQUOMgWPIr1bHKmLtqOB79wEXykQ4jRYBS3UYq/SSlc
         NPcS66tnqdTB5T4QOoD+4FR1OIsbiV0GoxYSQZpbbOzdm8pWQse2SK3BRYloQPSr349r
         jV2NYtkyu0Rf6n4qbxKgv3bNeo8l3mjARYY5CxyVubEAQtg6kWlylL9LFcMIgjRYXGHZ
         Ho4itybyKpnmEaCWKtrrfkQOzkylUhB23P9x9uCg58pJGrRgJ4/LJKXKHKjUPM2F6Pi8
         +oVEe8xlB4YPrPIujyVPvDOHTni1r3vef8a/vQPs7KVOuExrBOscrBkzNkjjjSJVR/AZ
         vfmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792444490; x=1793049290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=amK/RH/lhBSdCM1HiSXsr547jckeDqZUfPijQf08JF8=;
        b=SuxFPp4XXFxqIwXrqDh2dk7Q6f9/AzZhrH95XpjL/U/CGr1LATcpbJl+V2rjRKwnmO
         hA/PIXiJqxn0DFi+W8u7HSWHM8/Vh/rBHqMweLIEhg8SFvTLzbNBRobFuE5kCIY2WLs8
         8sE8oQsydwildz9G8nDELmghV+g7b84VDfN7lEcUxuEau2M3Bp3c3zmbAnJRrKxKf/A4
         gIgnz/yaErmJH+csKy2fvUtBEuulbJLh2YTP2ZPoVpHCFFJpdaHziwH2ClZbK4I24d2w
         xdfOgJrQ+iDmnH/K2K8VwzvaiO5pZ8npW2HRXNNw/wkMqPl6SvEB9pWBFZEhlRDq5J9t
         d0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792444490; x=1793049290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amK/RH/lhBSdCM1HiSXsr547jckeDqZUfPijQf08JF8=;
        b=mVgr7aVzZIfvx6qLFXyV38hfJ5R6fmXtgmnX3+7+uOMVP0Oy5+mp3Da9CaXTh0xpbW
         DdsSdVu9d+eXAyoT171rBh8ixETPXIyesREjBYlKuljZtRhZKGDRIOVUkxZQ7MOXfduU
         OoU83Z9/Pm9QlgAU7hPm0+LKjuwPXNkMxSgiTtBtECpoJTn5x4SoeoVnUAxOUlgDV0Ds
         m17NONuezJpGLg4R12E5O8JNzvLoRsXPBrE4Ejy0Or4zaed1fLTcpmBnx2+GEKMWf/R7
         X1BjJfnKpXVDk50Nc5lQSIFR+MtjupBJFTjxnoPYfRUW3ATNJ5b615KTx1l/vE4Be4Y+
         PsLg==
X-Forwarded-Encrypted: i=1; AKwUvBxx9f3seYVMnMOWwUOU7gkO2aakkVAReb1r2W+IaU1ctPgiOoP93gaxjPNk9jRhteOnjGDWlyIVOBycLuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7nNKxiq1h3NKGDX53jYpoM/w3vcTRuUu/VqI+ojWq3W0RinVM
	3pCVZOsuBIHPwlTdK/R7HUzdoMUrJWZRPHTsoy1pQiOSm6BxFUBgOUQb1G52+K6bvVlvHGNmXNP
	ZvW2nJY13wyMMiGE2UOh6uGW+jR8Cjgc+IoLFtoGs
X-Gm-Gg: AYBFou2Rqp4+wxt0cZNPjyW3FTfw35DRBZxQwm1md8bOLk+QMCq2NtW270q5Zi2QiEA
	WsovliHGbA0OausqyCYADIUfwKcC5zfE+uI9s9XYiDzaoRoX+nVPEIO2PJAW0Brxlx5HZ7n8xMU
	WiZZBOMuy5elI9glfJ2V4+22fXwpMuK9bVnVqBx4lyVlPlQDjEaPrFPIMMPR4Dleb0BmLe3BSLy
	tvPt3rYvtx09KChLhZ9zEnDAZBkcBefcLmysAwS+yRb6HlBHSHgZWx4tnFst77p4R8xaYug7LQF
	RwRfGCoqrCDu3lwuLhhH/GuW7xvyBt8NCpCSmjTEAkwvemq33s/j7uss40behEHfteR2nt+pJBq
	zY/wLwJP5Lw==
X-Received: by 2002:a05:622a:1312:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5362b49596fmr6123061cf.14.1792444489446; Mon, 19 Oct 2026
 14:14:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com> <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
 <18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com> <CAP-5=fV5OBeri3T5U9BsKyjDRUiFr7bgFiV62yQr7fO7Hf3rvA@mail.gmail.com>
 <c049b368-9cb5-44a9-8172-fcfc842e79be@app.fastmail.com>
In-Reply-To: <c049b368-9cb5-44a9-8172-fcfc842e79be@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 Oct 2026 14:14:37 -0700
X-Gm-Features: AclHuK-s4u1aQY3TgCGHmFPrXSS7KZ3Ix4ahwNzxadmqIsPlHMVKzJOzvFlUVGc
Message-ID: <CAP-5=fWHDR0--hMYM5UHXaDfggctPbJKxNUnM0hjpupUSVNQ5w@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:00=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Oct 19, 2026, at 19:04, Ian Rogers wrote:
> > On Mon, Oct 19, 2026 at 9:28=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >> On Mon, Oct 19, 2026, at 17:10, Ian Rogers wrote:
> >> > On Mon, Oct 19, 2026 at 5:37=E2=80=AFAM Marc Kleine-Budde <mkl@pengu=
tronix.de> wrote:
> >> As I wrote, we need the packed struct version at least on mips32,
> >> mips64, openrisc, riscv32, riscv64, sh4, sparc32, and sparc64 to avoid
> >> the external library calls the same as on armv5, but I would prefer
> >> to just always use that in the kernel. My guess is that this list
> >> is actually the same as the architectures that lack unaligned word
> >> access instructions in hardware, and armv5 is certainly not
> >> a special case.
> >
> > Is it more than conjecture that these architectures have regressed? I
> > have a hard time believing the codegen on say riscv64 is lagging
> > aarch64. When the series originally landed the issue was looked at and
> > workarounds were added, for example, to PA-RISC.
>
> I tried compiling a trivial function that calls get_unaligned() and
> looked at the assembler output for all architectures. The list is
> everything that does a function call to memcpy() rather than open-coding
> the data access.
>
> By default (but depending on the target CPU), riscv64-gcc avoids unaligne=
d
> access because this is not a required hardware feature and may be
> emulated by machine mode firmware even when it does work, so a
> function call is cheaper than a trap.
> On arm64, armv7 and most other modern architectures, unaligned non-atomic
> word access is always faster than byte-at-a-time, so the compiler
> defaults to -mno-strict-align or -munaligned-access.
>
> >> For 7.4 (and stable kernels) reverting the in-kernel header seems
> >> best to me, and then we can think about what to use for the tools.
> >>
> >> Looking at the uses of get_unaligned() in the tools directory,
> >> I notice that at least some of them should just not exist, e.g.
> >> struct debug_entry in tools/perf/util/jitdump.h is just
> >> needs a __packed attribute to correctly describe what it does,
> >> and tools/testing/cxl/test/mem.c does not need the unaligned
> >> helpers at all because the structs are all packed already.
> >
> > There was supposed to be an 8-byte alignment requirement for perf
> > events and unfortunately some events broke this and we added __packed
> > as a workaround. The unaligned accesses wouldn't trip a sanitizer in
> > our tests because we sadly lack testing on old perf.data files. There
> > is a difference in using __packed as an attribute and using type
> > punning to achieve an unaligned access.
>
> Yes, that was my point: if the unaligned data is annotated correctly
> as __packed, you don't need any type punning to access it -- you
> can rely on the compiler to pick sensible instructions for the
> target architecture, either an unaligned load/store a byte-at-a-time.
>
> >> I'm also a bit suspicious of the usage in
> >> tools/testing/selftests/bpf/test_kmods/bpf_testmod.c, which
> >> looks like it may run into a corner case:
> >>
> >> __bpf_kfunc int bpf_kfunc_test_uninit_alias(int *out__uninit, const in=
t *in)
> >> {
> >>         int value =3D get_unaligned(in);
> >>         put_unaligned(42, out__uninit);
> >>         return value;
> >> }
> >>
> >> The current version of get_unaligned() turns into __builtin_memcpy(),
> >> and the function prototype defines both arguments as pointers
> >> to naturally aligned objects. Do you see anything that would
> >> stop the compiler from replacing the __builtin_memcpy() with
> >>  an invalid pointer dereference? This bit is probably fine
> >> because of the way gcc handles __builtin_memcpy() optimization,
> >> but I'm not sure if that's an implementation detail or required
> >> by the C standard, especially if strict aliasing rules say
> >> that the int* argument cannot overlap a misaligned int*.
> >
> > I agree the pointers should be aligned given their types, ubsan
> > doesn't currently fail for this and waits for use of the pointer. So
> > there is the specification and also what sanitizers enforce.
> > For clang, when lowering from parsed C to machine code the compiler
> > will use alloca to model local variables and memcpy as an intrinsic
> > for aggregate copies. So:
> >
> >   struct point { int x, y; } a, b;
> >   a =3D b; // Compiler will generate a builtin memcpy to copy b into a
>
> The problem I am referring to is specifically where the object
> itself is unaligned and passed into a function through a non-__packed
> reference. In this case, the get_unaligned() must ensure both that
> all address bits of the pointer are used and that each load/store
> is done according to the target CPU definition and
> -m{no-,}unaligned-access flag. We have had cases where x86_64-gcc
> optimized away the low-order pointer bits based on the psABI
> guarantees, and it wouldn't surprise me if the inlined memcpy
> tried to make similar assumptions in some corner cases on
> -mno-unaligned-access targets.
>
> On ARMv5 and similar architectures this would still appear to
> work correctly but cause trapped loads that would be absolutely
> detrimental to performance, much worse than a few added memcpy()
> calls.
>
> > This is why I have a hard time believing the lowering is broken on so
> > many architectures. Calling memcpy to copy aggregates everywhere would
> > be madness. I believe, especially given the period of time this code
> > has been in the kernel, that this problem is specific to GCC and
> > ARMv5. Clearly fixing a bug in GCC and ARMv5 should be done, but in
> > the meantime, a config option workaround in the kernel is pragmatic.
>
> I'm not sure what you expect the compiler to do on ARMv5 and other
> targets with -mno-unaligned-access, or why you'd consider calling
> memcpy() a bug when that is literally what the code asks for and
> there is no easy way to convert it to word load/store.
>
> Comparing the gcc and clang output in https://godbolt.org/z/r8aq4n87z
> it's clear that the gcc version is at least shorter but depending
> on the CPU and caller it can also be faster, e.g. when the data
> is usually naturally aligned and the memcpy() library function
> does a single store while the clang version fails to write-combine
> the multiple bytes being written in the wrong order.

Is there a reason that the compiler's instruction selection can't make
the same decision for the memcpy case as the __packed case? We can
work around the compiler bug with a config option.
The intent with using __builtin_memcpy, as opposed to memcpy, is to
avoid a library call.
It looks like all the unaligned code is using void* so I'm not sure
where the low bit concerns are stemming from. If anything, type
punning seems to be a worse problem, but the hope is that the __packed
attribute avoids it. I know this assumption makes compiler people
uncomfortable and memcpy is their preferred go to.

Thanks,
Ian

>        Arnd

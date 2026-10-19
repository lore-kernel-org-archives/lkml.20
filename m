Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792429513;
	b=R6HHxZO9SzoyiEvADWnVQOKrSmtfo0mD4X5wMoG56ARhcOl7wIDIgUrJqW4amPduld7i
	 sHImbgZ5OC0ANgu8recYYf14OYVJYWi88LwDbl47Ne/ie6QboWmwAPQ105061TY+888oW
	 pYt4FDCL1+Hrdjekw1Zc4BJoof3w+UhFZvDjq96CNvoWFTfU1Kz8gyCG41YYat+igNzdm
	 vDkVF9XqK+U/XzUcZCf3jyaxqFKkG5QAdEFd81NiToWr2RXsKGutWf467e7Yg8SXB7wM6
	 EuvXNgjaAXiq/vS8gty8oDwEr8PRzwhNBa9GUCZvt1HREmwEskKblCsGrP5ypVDoSNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BkBjly+LHsknLECyAEOd0tYT9t7Wy38UeBkcMQMiCbY=;
	b=0qHNA2z/gyo3EoQWmdGNsmNBDi3lKmMCLqGiIUVJyQc5KlfkUh2WrZ+UBQYdmn/FI60/
	 27icVmYTgoAhV/i5Cqq4nS1fgzZct1lLnTyB8av1Kp7jKrCSLZvb4zI7e+FlUP0lvwbSb
	 1t9c2gOo5MHam3ORSb3NKyi6mnnrLaiLOle/dikzyWB+1RbvmvdxDU5ofCa118WF1xNcA
	 ePUPi8ovrTcjab8rPYZNBIFjbZptrQSyRzAGOwVmGQIXu9qJpqbQYlYgij+Wsy0rpnjwz
	 CmD/KhNOfbk40p+asaILmglJ9GSeB7/OLN7F8Z2PyMJpzPH/LS77GBBWGQ2bc29Gv7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vVSHtBh7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B725606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B725606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vVSHtBh7
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so5241cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792429512; cv=none;
        d=google.com; s=arc-20260327;
        b=UsMrWSdyDRZn6iAbgMISVt4tg+SuLNS3a6meuXQSVnE4/cTSc/41F2hK6QhL9VzmGe
         f4QL1Rg+A3JBVViS9szgqy9L/1HZ9X4DvQAeqCKasJxUweNSEht4gyPI4gMjXQQ/3r4n
         LCNFFWayrJIaOn+rD5HQaF1sJ52XY9ENwyBYdslJkRhJUsRArPamLQXzCg3U4pz8tNrP
         wMIdtGyUQiQKz3/dVsQhczAc+OkApsGNvYQPW4vz4k1aEFAEurVcgxZJSS/IwiQbM5cM
         7rapeyCtOk/NtHjF+i6NpI1goCTX3a9WUqf/nJEkN4o0BNEZbkErCE75XBrfq/DCOi03
         UxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkBjly+LHsknLECyAEOd0tYT9t7Wy38UeBkcMQMiCbY=;
        fh=v/JR3t2TrPdVbaIv5hr9VB7yiXYQJ0h3HmW7e7ii9tQ=;
        b=arVF3UAiKuOLMVPBMw/jd2glpr5AqLbJQwYDIj6aY+h7r4CZF6HR1mt+9GVvyVUmqj
         PQYiQdjWG4+EaFizxVdQCSYPXCS1CwwXlFr7T/Md/e7oFMCSGsMzHjVfe9mXipnfQtwO
         v2RKs4LopP/OveUZ8pJdMrgArFo2Xyhtg+2mYwk7DCK+iajFew6Bn5uKBqcKcs2xOO5W
         BXjSv8EAfdLdLwkA/ALUK25NJ8wrXX1+xzrD8EUoMOb8w4lf7UtNSp3b/iKG5EVDPkGN
         XcJaAErr3O7YrWUhgCTmfEj1ooldtGesqjP8zW4RS2PLRWE9ovP5wXLOzEQCtqgBW5d5
         Fu8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792429512; x=1793034312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkBjly+LHsknLECyAEOd0tYT9t7Wy38UeBkcMQMiCbY=;
        b=vVSHtBh7bA3USHSkkuSNXo8JSP6ERd30LPh3fYC/Uky8beFHXnryRPPyadGAuRzE8K
         ULEpPk3C/DHo2iilr2/f4twQdL3dHs2S0FQY5OxeHagyh94uDxhVP/WczTy8IyINFMT/
         uB23BBN5e9Jh1TifQHk9FBpHu1zeya8l03uSwEWwT7IjTzhBeX7Uy3tv2uu0BK3t9PJ9
         lxyBhBsAKLLHzsQ76jPLpaGDiIvSv+CXqzAknkTaj1KmNVAmdMhAvWR+GDIadoXJxx5p
         fJf3NV+3WmpOKfUVTrs7F66mI0xO38D8wvZSGHxFOeTMbL2UW7vqo5ZWRmFIPMoet79l
         LpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429512; x=1793034312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkBjly+LHsknLECyAEOd0tYT9t7Wy38UeBkcMQMiCbY=;
        b=Ma28j+0dSbe42kduZ6+acSyEhVHo8Cwyhvdi98fGFgO9qjt4Kidsi+XZPTFTeq5bUT
         bf62rOAXOXPwuXadgb5EBst9s6xu/SuMxQRM0q1r5ae9UpQxu433LHe7FFZull+hbPyT
         bwe2Ld8uU/TKXpaqyvb6qygwC/ZqdnkqB7e2u2OTPEQw2Lf5zlNTjjV6YEuP2cYof0lA
         EtWh90Fqjlu1sgUXjsf7JxssNMDga3RZnV1VVChWTujm1ajO/KOZVRK5ooGii6z6bQ7h
         gAEHJnm2LTbN94kxJ+VBQvYWJiDBD+a61Edmy3pZfYYlngRH6XCzvN+fWqhjuT5BFQgH
         4nNA==
X-Forwarded-Encrypted: i=1; AKwUvBzMZhUUaKoq3+aFdScj6r3LkLtLsIoFQ9M5Ll/FUztS8D3ZxHhsSQSiDmzxgt4gHu6qdrtDCVvcfa5/IQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPI0V+hvYVsnr8v/9IcLDmVZPJkkxlA24lzEjTqsG6quH8Hbpc
	3y6Xdr+fdktq+QlHSeOHhsq8zSDwwqD2+6LDte5boH4n54ECwR0rXN2rsxrptflWfX6FahXTa2h
	SxMTUtiAfQpxkQhQ8qnn1G7cvFBPhATvG7VwaTE8o
X-Gm-Gg: AYBFou0Ez4bMppiu6IaGdFfwoUUsu7R0Uy/K43sqoA2mtnqDuRHoEoHbaeOtkPghNMG
	cTZZuGkFV1HKRcZnOIhGIlISSPFykjnOyWMeru9GIUA9SCSSkMmUbBX0AwLQDl05PyW5CGBwdjN
	HXhqKDP8ASSMU+J6OC2E3ZkQbalv8cTXAkrcJpkagh1pwkdVTfbmxBBaOK4l1z6Pop8fPNp3uWk
	M+6JC8swrWeNqQEJ+Qme9ikftCz0nd9D01a8tZO3wpvH6QjOXg4ULOyndLdxuvR8qZ+kmAtcgB0
	dnOuUaXNgYINNOnFe0ZDPLZEuwd7Nl4psdIp9heDi48ZqbQ4o8ED2JAPZgwmXtU0ai+1N8UkfCn
	sbziKbFajknddPUbrHHi3
X-Received: by 2002:a05:622a:1312:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5362b49596fmr1327911cf.14.1792429507178; Mon, 19 Oct 2026
 10:05:07 -0700 (PDT)
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
 <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com> <18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
In-Reply-To: <18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 Oct 2026 10:04:55 -0700
X-Gm-Features: AclHuK9s8M81LMMCa7xmlryJvuLxnVX-sdVr-aPQdHuwyY-V8mqF5fwa1fnyc5w
Message-ID: <CAP-5=fV5OBeri3T5U9BsKyjDRUiFr7bgFiV62yQr7fO7Hf3rvA@mail.gmail.com>
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

On Mon, Oct 19, 2026 at 9:28=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Oct 19, 2026, at 17:10, Ian Rogers wrote:
> > On Mon, Oct 19, 2026 at 5:37=E2=80=AFAM Marc Kleine-Budde <mkl@pengutro=
nix.de> wrote:
> >> On 10.10.2026 08:04:42, Ian Rogers wrote:
> >
> > It is a little more manual than automagic :-) When perf builds there
> > is a script that complains if the tools' version of files is
> > out-of-sync with the kernel's:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/perf/check-headers.sh#n28
> > It doesn't break the perf build, it just adds noise to it.
>
> I see that the include/linux/unaligned.h and tools/include/linux/unaligne=
d.h
> headers have not been in sync for a long time, so maybe it's just not
> a big deal there.
>
> > My understanding, biased by my opinions, is that the preferred option
> > is to add a config variable controlling whether to use memcpy or a
> > packed struct. My preference, to avoid undefined behavior, is to
> > default to memcpy but set it to use packed structs for ARMv5. I will
> > vibe code this up, and apologize in advance for any offense such a
> > patch series may cause (ie I'm sure someone on LKML will want to
> > complain at me for using memcpy at all and give me a lecture about
> > strict aliasing being nonsense, etc.). Arnd or someone else may have a
> > different preferred solution, to which I'm more than happy to defer.
>
> As I wrote, we need the packed struct version at least on mips32,
> mips64, openrisc, riscv32, riscv64, sh4, sparc32, and sparc64 to avoid
> the external library calls the same as on armv5, but I would prefer
> to just always use that in the kernel. My guess is that this list
> is actually the same as the architectures that lack unaligned word
> access instructions in hardware, and armv5 is certainly not
> a special case.

Is it more than conjecture that these architectures have regressed? I
have a hard time believing the codegen on say riscv64 is lagging
aarch64. When the series originally landed the issue was looked at and
workarounds were added, for example, to PA-RISC.

> For 7.4 (and stable kernels) reverting the in-kernel header seems
> best to me, and then we can think about what to use for the tools.
>
> Looking at the uses of get_unaligned() in the tools directory,
> I notice that at least some of them should just not exist, e.g.
> struct debug_entry in tools/perf/util/jitdump.h is just
> needs a __packed attribute to correctly describe what it does,
> and tools/testing/cxl/test/mem.c does not need the unaligned
> helpers at all because the structs are all packed already.

There was supposed to be an 8-byte alignment requirement for perf
events and unfortunately some events broke this and we added __packed
as a workaround. The unaligned accesses wouldn't trip a sanitizer in
our tests because we sadly lack testing on old perf.data files. There
is a difference in using __packed as an attribute and using type
punning to achieve an unaligned access.

> I'm also a bit suspicious of the usage in
> tools/testing/selftests/bpf/test_kmods/bpf_testmod.c, which
> looks like it may run into a corner case:
>
> __bpf_kfunc int bpf_kfunc_test_uninit_alias(int *out__uninit, const int *=
in)
> {
>         int value =3D get_unaligned(in);
>         put_unaligned(42, out__uninit);
>         return value;
> }
>
> The current version of get_unaligned() turns into __builtin_memcpy(),
> and the function prototype defines both arguments as pointers
> to naturally aligned objects. Do you see anything that would
> stop the compiler from replacing the __builtin_memcpy() with
>  an invalid pointer dereference? This bit is probably fine
> because of the way gcc handles __builtin_memcpy() optimization,
> but I'm not sure if that's an implementation detail or required
> by the C standard, especially if strict aliasing rules say
> that the int* argument cannot overlap a misaligned int*.

I agree the pointers should be aligned given their types, ubsan
doesn't currently fail for this and waits for use of the pointer. So
there is the specification and also what sanitizers enforce.
For clang, when lowering from parsed C to machine code the compiler
will use alloca to model local variables and memcpy as an intrinsic
for aggregate copies. So:

  struct point { int x, y; } a, b;
  a =3D b; // Compiler will generate a builtin memcpy to copy b into a

This is why I have a hard time believing the lowering is broken on so
many architectures. Calling memcpy to copy aggregates everywhere would
be madness. I believe, especially given the period of time this code
has been in the kernel, that this problem is specific to GCC and
ARMv5. Clearly fixing a bug in GCC and ARMv5 should be done, but in
the meantime, a config option workaround in the kernel is pragmatic. I
also don't want to start a religious war, a solid -fno-strict-aliasing
stance, including with packed type punning quirks, I'm cool with. It
is better than libbpf that has a no -fno-strict-aliasing but let's
violate strict aliasing stance [1].

Thanks,
Ian

[1] https://lore.kernel.org/linux-perf-users/CAADnVQLKv6LOQw5=3D8_ZagRXdU7d=
RPYA+fxJsXiGncqJjZ2hK1w@mail.gmail.com/

>        Arnd

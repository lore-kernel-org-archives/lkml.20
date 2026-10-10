Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A7239768D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644698; cv=pass; b=O9Ks5vsuiE9zTFYkZ5f/fC4i6eb7gBTCt9GtKKGvrLRERoYIFhknQyTA/5Gs+7NlXYIl2Ij6A3o3OORymV2H4OtXK7uwTklyxjxsLzvv10VhLbwTauJTBxsOa1iFLDrV0JUVq5rsbLyvYY0s+vOWgP0Nf58kuWuP2wOpCMCYT5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644698; c=relaxed/simple;
	bh=qKP0WSNcFuAAkX+PM25bURdeQUE0IEPKGPNzUJVA6pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxCpyjhOnA49QPzgsVLmurK/7O+Uru4EH35NDFBxbhdhlibYw676uWm80ikPZWoVDgwQfeGfNONWmRowqHgWlkEiI9h74L7/uKPdx/PwJuGqMF2WE+Rwcnxnm7MygY4wjgkc5uBD2sJvtn1oc9GNEVBRogieNPIPeOzEbgP6IrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RSPENE96; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RSPENE96"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5337fa12431so79881cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791644696; cv=none;
        d=google.com; s=arc-20260327;
        b=fHpKJTT1a2WhBQUoYh+/LPUaJa7GcaJzNM7MvPmUg0t7hZEoZPY67SKUGVdgb9jvpC
         ShmbFwGCC1Lrddg4zNbzMHXCsUpxi09vF24eTLDmcg66r6tt7I6KpOUPgwupt+8cHARD
         5Dlp1RNk6ehvwXeBIC0FHNcXLEWsN/KKeaeSsOfBVZ2rMOzUU1ffJD9kjoAX9gPn3KcY
         OCC66uN6MbWxbaNzV2hNkE19jYAYvJs+kBeQbVpVTwV9zu2o01FxT/KRc22gmTQnTE0v
         AxRizCCRn2eT/UN9FccDtVvhD1RsoBQP+UiKvNgE2KlFfge4iQhqzYpLFLnceJzUApBU
         sjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVL94d7fLPwyZDcajQUwfFhDfKQ8/7V1BaalpbSzdNA=;
        fh=i4UFqxvfvWiDS4upkTbrLpoKn18KRYXZ7Oy3zMZdidQ=;
        b=WjL9mKRIPekWzE8nKeZUEoh9au8ojOpn7nMwwCSZYFlNas9JgUhcu1p1NdrTGxN5U2
         bOn+f3vnwTy34cazpb2TkOHggIpUiYMpQucEhig2GxH++1zIRi5yY8lxz3w3hHI/YGZ6
         73VX7LqWKgUG1Cr6s0+BGuq9APmJejtwvY+mHL50x7qTv6Em1k+njZwbrtv5AsHWVzfo
         bOlRnYCG9UwsnPMM3B8wYIu+oD0MOMVh6r6gvomjCscWsM36I1yVPBkyWuG15rntF5uE
         TbGAHuP006tABhFEcl2l5m5jQu0jW0D/rz6qJSHTNIXNaqrCAgoQ5ODCPYgMeLWbMAc4
         SgfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791644696; x=1792249496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVL94d7fLPwyZDcajQUwfFhDfKQ8/7V1BaalpbSzdNA=;
        b=RSPENE96xyOj2/GDGw9K+7Q0oAKf44FMSpQC7Uma8ZRsYE4giPymkc8AITUYYchUjT
         RyJ9F0LBdwYTEml9icg6S4TKS5JP5T56SMujkjGCJPqKB5PVh9OQZeI4e9s/ur9De84t
         uHlqw1o1alR4iHmalXikrzrWGMwMgfgKMGShKjGfukidiklaY7P/7/7yuN736zjkUqRO
         0wra+HFvh8pDDb2TqrSwXQsbKlGXGQIPFiux3vhKBJ1+pBA3MBtq69O9ywL1s8/oQ7gD
         YD/2fc9/jPGtFJOXPvbIkRl4Bimf1hHnrAAm4bmSl4c7Juk10/32j667fEUAYMH4LUVy
         7aRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791644696; x=1792249496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVL94d7fLPwyZDcajQUwfFhDfKQ8/7V1BaalpbSzdNA=;
        b=wk29LHd0iT3dVzMcyJAwVd7SR/sZ0qACo1mf5V87ZzB643a56gks3FLqPdTnQPQrEo
         VobJPY7cozFRNTabr/j9gKFonk0zEadcTvRBlvUWgwKJVSUAJjyE0ff8XHvNTG11ZXIY
         u8Xwnfgpt5lcuXTWNFumi9tkQCI/hNdzBJdcNWhjCx2aV5noMlB6cfuF0Ea86oMiY2Gj
         XKV7lmPlJQSiWh3JhMzMutI/HLq9hDaVb2upFavdW17xN4AFGYKWm6y6AVc9BNbFMegj
         p+tPuM6fBInKTPvRbWNr7mGwbWyBX8wQtx7iRsvnA6nvmVAjxMPYveTl1DOhurRkw2kl
         NvpA==
X-Forwarded-Encrypted: i=1; AKwUvBy12t1HnZ1DM1eip1nOs2seVhtBf/fbelC2xlJZHOm472FmQk98vBNg3L5d6oP4lHoegNfnSl0Syw0SI6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKT8rVCBgys9266jyGvC6sS+oECEj1MO/cIDfOJVOPfR28jneR
	+KJ4O4YlerlSdAjn2yMEqXEBR36yuxdSKOcgLv4nn1kDFgsruOTzWVP4ozOP9isVvibM/gVNP7X
	0yr9bRE8jbAPtZJZmvhy/DObd0ghWS7/7dj7lqoZR
X-Gm-Gg: AYBFou2YCjqhNsm9SOZNh+pg4UR3fE6a0wNbe0x2kOIAWv40g6yHpZscgVH9llo9+V5
	dGJBGhG3+ZX2k4YwFD42rODg+6V84h/dk/K/3Ss8LXKp/INBWPJ/CYeNzchDrUeQPO0n3rwebFC
	3iwUmWS+vFeifU+qNQyHXgHemT2a0Hh59syYIJctfBMT4ILYUn635EEvdh/qX+Ekh+3zbk5tzpk
	mPqQavzU4ZDdZRkuofRrjs8cFGXhOFBlYX2oLT10FQi2j8w5OxnxKe55gbgBR+sD57qlJe75PH4
	RNEgxwAI2arQ8m5Q1mT/pUz4GQj45uxJstmASlF/VFXUqX2UCbH4hptuVNfGeTWKwVE=
X-Received: by 2002:ac8:6105:0:b0:531:475:4ce6 with SMTP id
 d75a77b69052e-535b4ed04b3mr7329011cf.9.1791644695120; Sat, 10 Oct 2026
 08:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
In-Reply-To: <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sat, 10 Oct 2026 08:04:42 -0700
X-Gm-Features: AclHuK8LQ7voUaQ5iDWw6xEK4vR5E2o28JWfPIq-jnjM1tPowB9wY3mLPMNEGbs
Message-ID: <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 7:06=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Oct 9, 2026, at 23:28, Ian Rogers wrote:
> > On Wed, Oct 7, 2026 at 4:00=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >> On Tue, Oct 6, 2026, at 14:31, Marc Kleine-Budde wrote:
> >> > On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
> >> The previous upstream version was the result of endless discussions, a=
nd it
> >> looks like changing it to the memcpy version was premature. At the tim=
e we
> >> unified all architectures to use a common implentation, this was the o=
nly one
> >> that resulted in correct and fast code on all architectures, so I don'=
t
> >> understand why this was just applied without including everyone who wa=
s
> >> involved in coming up with the version that was replaced.
> >>
> >> My feeling is that we should just revert this. I'm not sure about the
> >> motivation for the change. It sounds like this was meant to be
> >> used in userland code, and that clashed with assumptions we make
> >> in the kernel, but I don't think that is sufficient reason for
> >> regressing kernel code.
> >
> > So the original motivation for the change was that the perf tool had
> > an OpenSSL dependency for the sake of doing a hash when copying jitted
> > code into a fake ELF file for the purpose of disassembly and
> > symbolization. The kernel contained the same hash function, and using
> > the kernel function allowed the perf tool to avoid an OpenSSL
> > dependency. Linus asked the perf tool to minimize its dependencies, so
> > we pursued this change. The kernel hash function used the
> > get_unaligned code for unaligned memory accesses, meaning the change
> > required the perf tool to add -fno-strict-aliasing to its build flags
> > until we could have a strict aliasing safe get_unaligned. The strict
> > aliasing safe code is what we're discussing here and when originally
> > written it sat on the mailing list not really doing anything. To my
> > surprise Thomas Gleixner picked it up 6 months later, and I believe
> > something other than the perf tool motivated this.
> >
> > There was an issue with the original series on Power IIRC, they had a
> > char global variable that they knew was an int through linker tricks.
> > The change caused a correct compiler error of a 4 byte copy to a byte
> > sized address, and I forget if we used pragmas or a local packed
> > struct get_unaligned implementation to work around this. I didn't have
> > a way to replicate the problem locally, I was glad others were helping
> > with the series!
>
> Ok, thanks for explaining the background.
>
> > Am i going to be able to convince people builtin_memcpy is a better
> > unaligned choice than a packed struct? Well memcpy is the expected C
> > way to solve this problem, and C compilers like clang implicitly emit
> > memcpy intrinsics when copying things like aggregate values. The
> > packed struct requires a cast to a pointer type violating strict
> > aliasing rules, but has been sound for many years because of
> > -fno-strict-aliasing. We'd like the perf tool to be clean for things
> > like undefined behavior sanitizers, but separate userland code could
> > support this. I was trying to be as useful as possible and I don't
> > think the patches were rushed at any point.
>
> Aside from the performance regression, I see more issues with
> using __builtin_memcpy() here:
>
> - since the compiler is allowed to always turn __builtin_memcpy()
>   into an extern memcpy() call, it looks invalid to use this
>   in the vdso, which is not allowed to call any functions.
>
> - the original version used memmove() instead of memcpy(). While
>   this was removed in bf067edf5d2f ("openrisc: always use
>   unaligned-struct header"), this was surely intentional at the time.
>
> - the use of __unqual_scalar_typeof() turns a relatively simple
>   expression into a much larger amount of preprocessed code, which
>   tends to confuse the inlining choices and compile speed, especially
>   when this is mixed with other macros that expand the arguments
>   multiple times.
>
> > What the bug report shows is that there is a lowering problem for
> > memcpy with GCC on ARMv5, presumably as ARMv5 lacks unaligned memory
> > operations. It seems the packed code shows how we can teach the faster
> > unaligned lowering to GCC for ARMv5. Fixing the lowering issue in GCC
> > will likely win performance improvements elsewhere on code compiled
> > for ARMv5, as optimal memcpy codegen is an expectation for things like
> > copying an aggregate value.
>
> As far as I can tell, this only happens when building with -Os,
> and I don't even think the decision to call the external memcpy()
> is necessarily wrong here. The same thing happens on mips32, mips64,
> openrisc, riscv32, riscv64, sh4, sparc32, and sparc64. Some of these
> also use an out-of-line bswap32 in put_unaligned_be32() when building
> with -Os.
>
> > Fixing GCC would be best but a workaround is to use the packed
> > unaligned functions:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/include/linux/unaligned/packed_struct.h
> > I guess this could be a pain if there are regressions elsewhere in the
> > kernel that also need fixing.
>
> I hadn't realized that we still have the extra copy for those,
> my guess is that we had planned to remove that but somehow never
> converted the last remaining user in tools/include/linux/jhash.h
> after commit 50b4233a22b1 ("include/linux/jhash.h: replace
> __get_unaligned_cpu32 in jhash function") did the second-to-last.
>
> > I believe I spoke to Stefan at LPC on Tuesday and explained all of
> > this, suggesting the packed unaligned functions as a workaround. It
> > would be interesting to hear of other motivations for memcpy that
> > Thomas may know. Perhaps some config value defaulted to memcpy and
> > switching to packed structs works for everyone. Maybe separating the
> > user and kernel code makes most sense.
>
> Right, that seems easy enough to do: the include/vdso/ headers
> are not meant for user consumption in the first place, so it would
> make sense to use the struct variant there, and the
> include/linux/unaligned/packed_struct.h version could provide the
> memcpy() based code for tools/ and get deleted from the kernel
> internal version.
>
> It's just complicated a bit by the fact that the current code does
> the exact oppposite ;-)

So completely fwiw, I speak to the compiler folks within Google and
there has always been unanimous support for code using memcpy over
type punning. I'm not sure where the inlining decisions would be
impacted, as to my understanding those are made later in the compiler
pipeline and things like __unqual_scalar_typeof are almost at the
stage of the preprocessor. If -Os is not inlining small fixed size
memcpys, this sounds like another compiler bug. It would also be
completely valid for the compiler to lower packed struct accesses to
memcpys.

I was trying to reach an implementation that avoided undefined
behavior and benefited both user and kernel code. Performance
regressions aren't a benefit and fixing compilers can be tricky, so
work remains. I'd prefer to avoid undefined behavior at least in user
land. I'd also prefer to avoid config values, so using packed structs
for __KERNEL__ code is a possibility. It seems a little sad that we've
lived with a strict-aliasing-compliant implementation for a year, and
we could regress that for the sake of ARMv5. I don't feel strongly
enough to argue for kernel land; hopefully, Thomas can say what
motivated moving the patch series forward as I'm pretty certain it
wouldn't be undefined behavior in the perf tool :-)

Thanks,
Ian

>        Arnd

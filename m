Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BC03E4107
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581340; cv=pass; b=WoE4fi/YSnBy/4lsppYnZMxoGxdI9qWSRHDt8VUm0boOfxEZ9xxeBBiW9pQQqgjuHFCI050bXjWBivq/TIcNFgqaRAqhC18oVSKOLwQQnemIPdYLiGzKQX0UwdOe59m/hW9z4VFdsXQw+ZJdglSdDBJ+UUL1KdENjffB8lDE878=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581340; c=relaxed/simple;
	bh=a/9Q3cvAgoFkNiS3mJRSRUF8fjX4whAD6hwvaRo5yys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOjrbZRm9/+bPO/4HRvFsO4jkPkOKIVXnQL7VYsmzLSVsFj/WWqvljROpEbVm20VJY41I0TnF/YCn9Av5IVXIxStPS9A5Hw30PyDlswkAaFG/r8/Vv0TxyqNM2BKn+oB83CmreTvTr/lJLIBMrXjVuNrgMhc8RtCuNcVx4UBJdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WeoUwBqm; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WeoUwBqm"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533202fe429so7421cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791581337; cv=none;
        d=google.com; s=arc-20260327;
        b=qZ9w3hy5XtLzsRyq0PqL+Ivd6JkGVTLsTedzqxrThqBt8Gw8swoL8TefkXq8mTm7Tl
         VAOh4I1VElRt4cu1uLkRvfWFbsOF1hwxRVhJ3Aj0z9SXU0gHq2MbYHQ/GEjMUpsGuXje
         sSdd0sZLcPn1psdBFtlQDXD2C1ZEeLukY79BOym7MaJL1SovFwj+1AX2mpZMlh67KCRW
         Z5QiY3ISU42IFSFtHs9yU5adhW0YfJ9mWBD/ViyBJEVoQtMB6d5gCSHzpj9iEIG2gCnO
         rFu5taht4ar105drZK/AojkG1rM0D19CFzCyDL26MIV56K+OjyoId4tRrYr17NUwjxHi
         vWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IKZfH3sy4oofpBPlk2oE4c17Byi9lu+cjayFH35PqIM=;
        fh=7G9HKaA/X9YrSJtcrhPAIZRt4+EKEslqvR2djeGeBrk=;
        b=Ql32oX8s5hn4flquqHR/pAVla1tXiyWlJV/gyfLBtTvcaz+unSwUdJXYYskMxCmUU4
         w7VXWsgSmKjceEDOKmkPWxAvPwDUDDXlkhx9dPyP8F/SX9wf4pDL2PlIeVAvnOfOiWgg
         zLbqsQCIsd023Km3BG8fXo2KuRFDR58mv9ygPaE1jBiG9eibQUijxHvQmbfkJnIuApl5
         dH0IAo6zXwpRtVi9hHfVR/SlZSVsqwYVV8xLtnfa6FWKjZTQDBBHfvFrC6gcr1jhBgrP
         jIH7O80Gn4geTNC14lThs1J5TL9N4uy+36rBl2g4dOi949PrLjX+i0egmfKnIZhysvw2
         FXbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791581337; x=1792186137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IKZfH3sy4oofpBPlk2oE4c17Byi9lu+cjayFH35PqIM=;
        b=WeoUwBqmwVsUMZoTtFvLEgJk6Wm30mis+G2ws8Z+ct5b2ApdF+VtYb6De0CZy/AWKn
         1L7TLHcQbyUbioB1fy07USLRPtyOhkE0izz9VOJrHz/bWUaXoyhfPIFLNKhxXs5yUb2H
         /nf0Z47jVubKha0paRRDeep/U9uGFH/JEFQInJDFQqudOuBbeValLEVBbdU9Hh4p08zs
         B3nYlwNzrNoF43VQYT1U+PZXm7nAWRBjAQhC8EB5gXQDcSSDMpXTYMstY2RdjmSaOWS3
         xpAdastUpCp5RJiBTcvBMBqFbd7AExZZvYB6jQKM/guFvKdO+m7mwYoEOH6pPdecQOLe
         wMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581337; x=1792186137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKZfH3sy4oofpBPlk2oE4c17Byi9lu+cjayFH35PqIM=;
        b=vhkCP/m3DuwhNRbnmQvfaotAPaHa4e+aCe1BXSyCfPxdSPFXM7pIxSI60GwpYvJDbS
         n/jI9vnTgfAJX+vFs2hxPF6cFuPJe5otUBUNkRL43sn/Sk010jtlstCvJofYaA0rNtMA
         C+7T7vpgDexTmbGgV+SXiV5k6yak/j1tgJ1WBZJyfjU/f7l822OaR0XJnomFEDFsOaSn
         t1PwczqLRPaE0vRVqtRXOVsGRpF1ySB9Zxp3YoFoLiooP5qw8cF4ZarzIZG3rHXgbKvi
         Bnhk9o2lxM5VemOvpT5kw/R6mDyELGNrKya5wAtBQ6EnTDezlNpv8hd4wV9MorpAT6Dq
         Eu0w==
X-Forwarded-Encrypted: i=1; AKwUvBywjDESFG5SD3skKkmpCWtuenuS5+j7ciD7QVNrt+TWiaGifoKiG0Jmnar6LBiwxxt9zY/m5PsspH5TNRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZOXE3O57ZeiduzLcS2jkrQVIV+idmF7lxe53U2dfnK/chDFP6
	/TOEGMHU8tGlPsMTaqUA9szNZce3TosgjxhKQD2Bdxw24ucKGkeRK0/f6D/9DsI/3TRg4JRgWuD
	OEa59SlPCtMgWo9SjyIVuXiuHb6bD02L0gKT1dhHq
X-Gm-Gg: AYBFou1z5JJlRZ1IENrjBzkxQPkEadTDRHHXgFo+cF8NTqXYm9GfkKgGPQYKk1ySMOe
	1gP0p2V4b8dnmyNvxXevlmDm3Q7m6T5tLmuCSOOIxJY2toiOw6VThIsGwV6+Rc2ZpYJ1yR9f+jf
	lGyWZAQ5STTLCF5bHfEG0YCfGVqB1dak8Pua3AWJncdKIEbEA3V9ptKgWDq+I+kURtuz9AMYe5D
	pplo4hCOxAtFlkX1d7D5rElRwuY31uHeXdd+Rz0jo9t8bZUewvSoJExzBEEj4pahfpNcMiBhqR3
	FZ6QO4VW2uc67t03qeWuCJj5pxeSvBrVMUJWmhXNOUKuubCRAwfYBQb/MSHs9/GPhALg
X-Received: by 2002:a05:622a:a0c:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-535b170f724mr1981601cf.15.1791581336767; Fri, 09 Oct 2026
 14:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
In-Reply-To: <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 9 Oct 2026 14:28:45 -0700
X-Gm-Features: AclHuK-VUSoSdxF2IRUEKAo-_KUdN5wKF6M9V7O0h8No-t-g9WPWd7vmeaN_iwI
Message-ID: <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:00=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Oct 6, 2026, at 14:31, Marc Kleine-Budde wrote:
> > Cc+ Arnd
>
> Thanks for the Cc!
>
> > On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
> >> Hi Ian,
> >>
> >> On 10/16/25 22:51, Ian Rogers wrote:
> >> > Type punning is necessary for get/put unaligned but the use of a
> >> > packed struct violates strict aliasing rules, requiring
> >> > -fno-strict-aliasing to be passed to the C compiler. Switch to using
> >> > memcpy so that -fno-strict-aliasing isn't necessary.
> >> >
> >> > Signed-off-by: Ian Rogers <irogers@google.com>
> >> > ---
> >
> >> Is this an accepted trade-off? My understanding is that the kernel is =
always
> >> built with -fno-strict-aliasing, so the packed-struct type punning was=
 well
> >> defined there, and the __packed annotation is what lets GCC generate v=
alid
> >> code for the unaligned access.
>
> The previous upstream version was the result of endless discussions, and =
it
> looks like changing it to the memcpy version was premature. At the time w=
e
> unified all architectures to use a common implentation, this was the only=
 one
> that resulted in correct and fast code on all architectures, so I don't
> understand why this was just applied without including everyone who was
> involved in coming up with the version that was replaced.
>
> My feeling is that we should just revert this. I'm not sure about the
> motivation for the change. It sounds like this was meant to be
> used in userland code, and that clashed with assumptions we make
> in the kernel, but I don't think that is sufficient reason for
> regressing kernel code.

So the original motivation for the change was that the perf tool had
an OpenSSL dependency for the sake of doing a hash when copying jitted
code into a fake ELF file for the purpose of disassembly and
symbolization. The kernel contained the same hash function, and using
the kernel function allowed the perf tool to avoid an OpenSSL
dependency. Linus asked the perf tool to minimize its dependencies, so
we pursued this change. The kernel hash function used the
get_unaligned code for unaligned memory accesses, meaning the change
required the perf tool to add -fno-strict-aliasing to its build flags
until we could have a strict aliasing safe get_unaligned. The strict
aliasing safe code is what we're discussing here and when originally
written it sat on the mailing list not really doing anything. To my
surprise Thomas Gleixner picked it up 6 months later, and I believe
something other than the perf tool motivated this.

There was an issue with the original series on Power IIRC, they had a
char global variable that they knew was an int through linker tricks.
The change caused a correct compiler error of a 4 byte copy to a byte
sized address, and I forget if we used pragmas or a local packed
struct get_unaligned implementation to work around this. I didn't have
a way to replicate the problem locally, I was glad others were helping
with the series!

Am i going to be able to convince people builtin_memcpy is a better
unaligned choice than a packed struct? Well memcpy is the expected C
way to solve this problem, and C compilers like clang implicitly emit
memcpy intrinsics when copying things like aggregate values. The
packed struct requires a cast to a pointer type violating strict
aliasing rules, but has been sound for many years because of
-fno-strict-aliasing. We'd like the perf tool to be clean for things
like undefined behavior sanitizers, but separate userland code could
support this. I was trying to be as useful as possible and I don't
think the patches were rushed at any point.

What the bug report shows is that there is a lowering problem for
memcpy with GCC on ARMv5, presumably as ARMv5 lacks unaligned memory
operations. It seems the packed code shows how we can teach the faster
unaligned lowering to GCC for ARMv5. Fixing the lowering issue in GCC
will likely win performance improvements elsewhere on code compiled
for ARMv5, as optimal memcpy codegen is an expectation for things like
copying an aggregate value.

Fixing GCC would be best but a workaround is to use the packed
unaligned functions:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/linux/unaligned/packed_struct.h
I guess this could be a pain if there are regressions elsewhere in the
kernel that also need fixing.

I believe I spoke to Stefan at LPC on Tuesday and explained all of
this, suggesting the packed unaligned functions as a workaround. It
would be interesting to hear of other motivations for memcpy that
Thomas may know. Perhaps some config value defaulted to memcpy and
switching to packed structs works for everyone. Maybe separating the
user and kernel code makes most sense.

Thanks,
Ian

>        Arnd

Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5D3B47DD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278616; cv=pass; b=nNdOhRa596LlPY0Ojqu1Mr/0BY9Jdx/0ytlw7/qrnIAy/zdZ61HuwBjPHg0rspjK2Tugzkm5I+4otO9k8tH8IboJ4Zw9MSOAU5rGhlxnRlB2tbpmHoNF0T6+udkDLVgoGVnJo86j6keaOmxsHquyQbn6V6emPXNLXcZyeCTgEHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278616; c=relaxed/simple;
	bh=XrDbxp9D5a6x31fsBexXhmb5Tdb4LYGgG402LfoyXuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fb5sE1i9XzBlyYEHw55b0OapBd4f1MUx+Gk5vkoMPoAiU0jMK2qY4ib/BZNpc7oZefg4vPNtYXMpt5NQnqSEj0UbXKAc4P/lJ5rRErdeVpJlYVe9ZKDP9ZnU8sKex/uf+ibNluGruqfPNW82APKWRH3y3HWvRwA9hF6wYq+hfVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a0SwVZYH; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a0SwVZYH"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so1174768241.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791278614; cv=none;
        d=google.com; s=arc-20260327;
        b=jndHcYlWKjBn58KtFdLWm5DSJ5lWXET4goD0JwElT5wLGSHqbTGPtl6QRh0IsCKXKS
         cGMp64j8KQwaKDaOCjeRTeE8u4EPEtUX1GMCffyov+PmuT6qjl3t9ulP0VQFkLpNlFrI
         qB9KiODZveys8/WgFWa9s/+OIP5WCezFV62XzKmpE0Vzj9IwidsaZrPFKpbGi27n+g1O
         aiY3a3WJveCutmRbiF9tyvqZMw0WdQkzZnW76F3s4/DQehj8CTvQsYiU0QQDLjjEVTt+
         RdkRPUhyZChF2/ktVDomV0272HufXKzJ2jaYaFk6ZhRewlcU1PaIRuNNW9EwWy+snxhE
         9TnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9BaGNIm8DyjVQqQtGOe52rBvNqGEalGiaaxbuRoj4Q=;
        fh=ZO2SOS0D90DJrgRECby+Q310eaty6NMCSJdc6uT9ejA=;
        b=qinEOMwwfOB7Lcx6fc25YEfU5UQxJjLNQ2qtNj8JuyHsFNLjZKugBHfFfjQwXtei+a
         43FNNwLcQSpdoXZwO3mPKVGOmoBF9uw8XrORd0PnQIk62SHdEgSdBENK/+fjgdjBQtja
         qyFTmIpldr+uMmDKNqrwzT1p2S0nt5EF+TkIriXjmZ4RbPGUKU4fw6IgvqlBouzr5+M+
         +EtjbOB3Vilv5QftR7LiLqA60ebSgUKJDJMTfs7JtlTD+QYaO1o1K2PrUMX2h0O1jJmJ
         jioQbP5qD+ZEe7nqGr9P9snrhUPiucac87oMbiIvsa8jz+ogWH4qlHKXQiKympbe42a7
         cdlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791278614; x=1791883414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m9BaGNIm8DyjVQqQtGOe52rBvNqGEalGiaaxbuRoj4Q=;
        b=a0SwVZYHRf4wWvqrliLx2fgblB7TG0OQQnfFZgvYrxKBN6E/QbEfAYQacdFmwlJq2O
         25qp2j4n1WDwCR9ENtS/l6Xy85HtKNvC9k0QzwEnNYc1x4o/gODQvBtLnFb5vArII3i1
         J0f419d0FxO9FjmeDdY+rE5emlK/kvYBl8TFlAeimHs//fwa0dGAqddw+U7NGvZPx99k
         SXog1OqtOKVwdPP3yl+VGMU7VXVvb217I+LZFd9LJ5O63p4pI1qO6a5f2RegJl3vMcT7
         yz856PrU0LKS+TFZgy+rMGJNkYTBuR/lIZGfFUJYrWVY53z+Y+R2yosjQDGpiiQ9F09u
         nynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278614; x=1791883414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9BaGNIm8DyjVQqQtGOe52rBvNqGEalGiaaxbuRoj4Q=;
        b=NnQuWbxID1CkxgkhlCWMKgjLOCdHkLa5HcFC3GsXRkEOpgjdImd1aJBlpju/8GLulE
         FxH9b7nV3J/C2ixrJvJk7KmAtJrgw1/zx1CZ6Y08iBjSi/YFIbnHQXrEzbMZLbCjKc6f
         CEFsy7P2UeN5p7h9kbgZYd9kJKJ1QCM2Te+mSLmVVIlQXfAanUxr1Z6Vqe5tDOpupOdm
         qddf0NZzWdcVpO3KNFmS0VqxeUpPgUGFZ5UHQHdecnGy96HZN6zu5rp/FrQfemcRWhek
         /+YBRP0p6bwEav0sgukk0pLU/6JeDjpH7krAw7hMPvMhB3sEY1TH9Ht4LK/xrxUlvLGg
         e4ew==
X-Forwarded-Encrypted: i=1; AKwUvBw7OCpAsb71Qr+7AmQ7TNCifenx8rZ/YHnl3R12Y9zC8iCVykxNJIQRJc98DTzwmVp+vuQWPWZ/1a2z+FE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTgKakx23wLbfiDoXf2n6ZVsDJLStkJXBW+TfcNVQ2aSZDiUyx
	dBNNJzFdDbsa43pFXVj51DxW95fD/WXLCCgGFZVJBdpnO2rK+SpCc/a+kbb9MVHySzbttM1EpJI
	i41J2bRRW2umBfLCdj3xm/asfmiCEux2JLpgXOgI=
X-Gm-Gg: AYBFou1Msab/fXM8ct/IoZt13Ucn+ejysZ9Nrd533DbLMvrH1MK1yZDcpZ0CNAzOp2/
	OH0sMWgpKBxoWg9sAgXZAZdNdLxi9em1yC4X2oBLxvw4WIqeeT8BwoFUi/tmIAGRybOKcrf4HaQ
	M7CR1q/5crn/03mqkj3Cf/MR5V376u8SONJ054VJdSAe3tzJehW8eLbzlLiMYxSvdW9Dlf3gx6p
	qYCdn8Z4KohEJhi30R1JuGSXcVLU6k/r2zYTLMUbsERiEDRU6wuv9ObEVAE0F1YbPTUkdAWt7/f
	S1l77W8+uqRsqCwCgCnUiHsqxeRli/jYm9tuK4U5CBQ9fPphO7cZPWjANceq2n1Z1o46EH/sIbj
	OO+9K73mtP2QJkHhw4GFFAt89wMtg7Dg=
X-Received: by 2002:a05:6102:a54:b0:79d:a035:b6e6 with SMTP id
 ada2fe7eead31-7c87a0038c6mr115746137.3.1791278613354; Tue, 06 Oct 2026
 02:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261005192052.2589382-1-morbo@google.com>
 <3176a197-baf8-4e5f-96a0-8c79d32a168c@app.fastmail.com> <CAFhGd8q3Hs9r6ezCA5bFATcZcq7AZyC7Cai8muk5o-AwOMLW7w@mail.gmail.com>
 <e9e04143-22ff-4396-9b33-333231366f64@app.fastmail.com>
In-Reply-To: <e9e04143-22ff-4396-9b33-333231366f64@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 6 Oct 2026 02:23:17 -0700
X-Gm-Features: AclHuK9qkbH2EI0TJCoQEjGmE8OJ4mfVOULY_WNEwFYu4N8Ri6mQFkkdEf41th4
Message-ID: <CAGG=3QXsdkEEQcfU-QyTW4VA6TsJTScMkidcekrtDtU6H3ubOA@mail.gmail.com>
Subject: Re: [PATCH v3] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:08=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
> On Tue, 6 Oct 2026, at 09:30, Justin Stitt wrote:
> > Hi,
> >
> > On Mon, Oct 5, 2026 at 2:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
> >>
> >>
> >>
> >> On Mon, 5 Oct 2026, at 21:20, Bill Wendling wrote:
> >> > Code that runs outside the kernel proper, such as the EFI stub, gets
> >> > nothing out of the counted_by annotations: the bounds checks they fe=
ed
> >> > (FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.
> >> >
> >> > The annotations can also break the build. A __counted_by_ptr() that
> >> > names a member declared after the pointer needs Clang's
> >> > '-fexperimental-late-parse-attributes', which the top-level Makefile
> >> > adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and =
does
> >> > not get that flag, so it fails as soon as such a struct is pulled in
> >> > through a common header.
> >> >
> >> > Overriding the __counted_by_ptr macro from a Makefile doesn't work:
> >> > 'compiler_types.h' is pulled in with '-include', which is processed
> >> > after all -D/-U options, so it re-establishes the definitions. Follo=
w
> >> > the '__NO_FORTIFY' precedent instead: let a build define
> >> > '__NO_COUNTED_BY_PTR' to turn the corresponding annotation into a no=
-op.
> >> >
> >> > Assisted-by: LLM
> >> > Signed-off-by: Bill Wendling <morbo@google.com>
> >> > ---
> >> > v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we=
 need it.
> >> > v3: Add the version to the Subject line.
> >> > ---
> >> >  include/linux/compiler_types.h | 7 ++++++-
> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/include/linux/compiler_types.h
> >> > b/include/linux/compiler_types.h
> >> > index c5921f139007..8bde6798b4ec 100644
> >> > --- a/include/linux/compiler_types.h
> >> > +++ b/include/linux/compiler_types.h
> >> > @@ -387,8 +387,13 @@ struct ftrace_likely_data {
> >> >   *
> >> >   *   gcc:
> >> > https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
> >> >   * clang:
> >> > https://clang.llvm.org/docs/AttributeReference.html#counted-by-count=
ed-by-or-null-sized-by-sized-by-or-null
> >> > + *
> >> > + * Code that runs outside the kernel proper (e.g. the EFI stub) can
> >> > define
> >> > + * __NO_COUNTED_BY_PTR to drop the annotation. Such code may also l=
ack
> >> > the flag
> >> > + * Clang needs to parse a reference to a later-declared member
> >> > + * (-fexperimental-late-parse-attributes).
> >> >   */
> >> > -#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> >> > +#if defined(CONFIG_CC_HAS_COUNTED_BY_PTR) &&
> >> > !defined(__NO_COUNTED_BY_PTR)
> >> >  #define
> >> > __counted_by_ptr(member)      __attribute__((__counted_by__(member))=
)
> >> >  #else
> >> >  #define __counted_by_ptr(member)
> >>
> >> Apologies, I may have been unclear.
> >>
> >> What I would like to see here is something like
> >>
> >> #ifndef __NO_COUNTED_BY
> >> #define __counted_by(member)  __attribute__((....))
> >> #define __counted_by_ptr(member)  __attribute__((....))
> >> #else
> >> #define __counted_by(member)
> >> #define __counted_by_ptr(member)
> >> #endif
> >
> > FWIW, Bill's original patch had this explanation
> >
> > "The two are kept separate but parallel so they
> > can be folded together once all supported compilers handle
> > '__counted_by' on pointers."
> >
>
> When opting out of this, whether or not the compiler supports
> all variants of counted_by() is irrelevant. The same #define
> should just opt out of all of them.
>
> If the need arises to be more granular here, we can always add
> that later but I don't want to have to add
>
> -D__NO_COUNTED_BY -D__NO_COUNTED_BY_PTR
>
> everywhere today, and go back and remove the second part once
> all compilers have caught up.
>
It would reduce churn in the code base once we no longer need a
separate '__counted_by_ptr' macro. However, we should specify that
__NO_COUNTED_BY should be used sparingly, as there are other, better
ways to "opt out" of the __counted_by family of attributes. Basically,
it should only be used if the Makefile doesn't inherit its KCFLAGS
from the root Makefile.

-bw

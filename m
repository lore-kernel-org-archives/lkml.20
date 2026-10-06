Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C63B637A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791271864; cv=pass; b=TZenm3Aa2OzMyL6cdjMf1zSGmTozUNdYBAN67HfLrkchw8jHwLnsUdGJkuxKig1mEVLnnFD4UpQxn1ncPY14KeZAwV1J2ByhhKBVV0R5Zd1Noqiv1PkiASVZIipE6U3ERqS/7Ymg6bBJO6wqFcbvRgUM7sPau5oTuJV58BWjLZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791271864; c=relaxed/simple;
	bh=HqbDUpGwmU9Vj6DEnJhTzo5Q/I2Bb7O52TujIr0QQg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6aJnSPx1M19oh950tWJ2WCIjyLdVpFpIwHiTWZSbqF2BVIwpcmlwjfLYkthTea7al6SHEgG+1HlgJLrfkrV9ETWuxzlOC33KZmMPcMMfRk2bc4N7v4XPay1OFpVhxHhHY/NEGQ4TSA95flBUZzL9LuMfp9hFiV3nijyiWg1+40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Alzply9K; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Alzply9K"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98b2f32e67fso32101241.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791271858; cv=none;
        d=google.com; s=arc-20260327;
        b=mTWeov54LQEvfy7MyjAMKStgGJwDzgUORrtFEd0Of5h5Ox6tXsmVdh6Tz0ei/1UcGk
         WNxbOq0VvEmGLnZET9Jd4pzn0dKq5Rim2wgokA69+/b5MW0iYb4ukOtV8Jj6qAaJo9uj
         ldrRKEHoU5lNpIKQLBBDotYNGjLEJzIpy8Q9x1E1YftYHT4e5n3MzhLmnFsRwmbPDfkT
         V8GK/9qSjcpTVFXwD2l6BffzM3+nFSKysB+PmK+8Em33SToCrdYTJrHcJ5q0nAbA5h5N
         j7R2QV4ad/1erdLp4lm/BU+2mvZwnCAuAa4VHEbBwgkPSi59W+gcLIBh+vIZOtcbSRV8
         SD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rAhKUuZ8ftg1KrkRjMOJWoz5mwV32k7ntU16rIZRc+k=;
        fh=7TpL8+1+F6XlqDGyFdO3E0ooscqV7KfRDm1LXKXTu5M=;
        b=ILt10M3R48uLK9AcBAE5jjwq9GbMOw5SD8kjupKnwrYhJJ/YbZ+ranpWm5rL29aX+w
         wjHd5gHsTQ7R7F2inuAQnRkCJsBtmRiXpQTI5TSplgLhGtmT1G5jIt9h9jwZE6CKkqyL
         jEmR4euBzy8rdDKZlw6pHibRwkPGE5Vmwk7FwJg5Pg+yyRCx9IO9oZoaYVLEfWK387JF
         jDVWbe1Xk1k0Xlq1sCSlNb6PS7F57TtqkGOGg3RdPmSdgkAfL/wgG/0HzvxJUj/EHVdK
         C4+++BaFcMh8PEAsVbdYusD7gLwg/GGzCn1+6T27H2hw75+c4uuNyHV4rM6UNOGxOQGV
         2C8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791271858; x=1791876658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAhKUuZ8ftg1KrkRjMOJWoz5mwV32k7ntU16rIZRc+k=;
        b=Alzply9Kkcqhxc/bLZLkVszitAi4vZO4u6UMhIjTc0amZKJvRQpeBYlbs+tPbzeZp2
         1XUDNVbhGAEPlzDAjoPOC1MRNF3dtQC3EWf57irSdY/2hRTkCcxtlcYMFRDK3JEyOWi6
         IhlaRcwQi+r0PjXC30AoNkfBmpbqeZhnFpuQLlwsXbBmpY5Kd89p/guTzoyLKz9Hpe5l
         0Ikql+h2PMOtqXv3At9vnMx47b9e5ji+TcQvmLx5/4Cfo6O9EwcWuRtZ+/D1TvXXb9Rk
         XPduWVaM/ILEPWcRc4QQcaI7svqcQ7Ma/9SNMS29lzIlOxkQ2mc24f1+UJ2RdQdvMOY2
         8s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791271858; x=1791876658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAhKUuZ8ftg1KrkRjMOJWoz5mwV32k7ntU16rIZRc+k=;
        b=n4XMvtySSptmQC6Ecat2Q8BGG+H8FiikplzNPiVJy+p/KilzQwI4I54K042u5xkD64
         xt3PlBYXfHhSVez9MzDmuVXjaCc/p9Qgkg8fQDg/7dgT6TshIuHqY9AgCfAZZaZf2m5r
         3F1ogCyC9383rx1nQdmXgtNxV1KPl6grIN2kPJWAfxDNBFhU1VWLA0l6GiwlKCAtgaEI
         OTUVOhyuczp8t4Svfv+d2lbeIIPBCecTpbE16lPsFuRpK5Db28FBcnUNFp4Lb6FA5Rhm
         TLTLcyLwNE1gk+BfZe2378Sx/hwwBy8/t+js9LSH/3TXqm59GUa7QMMG1r69V0TLjxoX
         2wZA==
X-Forwarded-Encrypted: i=1; AKwUvBzfTv84W27ljhz+TvM5coelAN3oBtV6yx5kO6m0R7FOPeRNQOtoAnjKE6H1aTvG5blg0DvmBa94Rvw3IBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYImeiUAfBUktFABHaM/F10mNXqlwfWcaIGoPf2ACsbz45osF8rZ
	xIaGQtatuZVc28UsKzJYHWRThad+jtntPwxTFGIqbnqtSML3Bmx1Ykx7cAhfgC1gxlgqwyKmBAG
	DPS2txCr6yKpgGYv21KqkNqvRzapNT5V2pqFYpZ2w
X-Gm-Gg: AYBFou21g5CZTjX6VBIqhMnNSYjCUUEPjdi5IGK8CCfjavZhoXdMi1CAkYifc5L/5Nv
	ykqj9IWFzUsyilOBnq55gOLIKATIbdy0z0mghmjBm1HH8f7yXLDGdyM9CAqGfYsTxSBVL9faFtX
	u9rT8XaGS5IujTM9JDo6tKyT3R91caFaCOIQidyQq7H0o4UWj6Y2e5R6vHFwFe2g/9N1dHuDaxp
	JMsw8yyoP4i0YHkTGn2CPZKuXl4t39bStAaokbRhPdEN/EUxFFTjpUh9cvjOCT3OEJ2BVZ/nj2L
	6qvD2owmf82n+KhTRbmwGSFe5/q7ITi+ANN0DFRTy1ODAMu5ouitlw==
X-Received: by 2002:a05:6102:4191:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7c86b7a1657mr86691137.0.1791271857877; Tue, 06 Oct 2026
 00:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261005192052.2589382-1-morbo@google.com>
 <3176a197-baf8-4e5f-96a0-8c79d32a168c@app.fastmail.com>
In-Reply-To: <3176a197-baf8-4e5f-96a0-8c79d32a168c@app.fastmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 6 Oct 2026 00:30:45 -0700
X-Gm-Features: AclHuK_GelE_trg9Ql7tfs3Unb-Kel9TbJ-CeAIIKNqsPgvqmn4941q8qguKUSU
Message-ID: <CAFhGd8q3Hs9r6ezCA5bFATcZcq7AZyC7Cai8muk5o-AwOMLW7w@mail.gmail.com>
Subject: Re: [PATCH v3] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 5, 2026 at 2:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
>
>
> On Mon, 5 Oct 2026, at 21:20, Bill Wendling wrote:
> > Code that runs outside the kernel proper, such as the EFI stub, gets
> > nothing out of the counted_by annotations: the bounds checks they feed
> > (FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.
> >
> > The annotations can also break the build. A __counted_by_ptr() that
> > names a member declared after the pointer needs Clang's
> > '-fexperimental-late-parse-attributes', which the top-level Makefile
> > adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and doe=
s
> > not get that flag, so it fails as soon as such a struct is pulled in
> > through a common header.
> >
> > Overriding the __counted_by_ptr macro from a Makefile doesn't work:
> > 'compiler_types.h' is pulled in with '-include', which is processed
> > after all -D/-U options, so it re-establishes the definitions. Follow
> > the '__NO_FORTIFY' precedent instead: let a build define
> > '__NO_COUNTED_BY_PTR' to turn the corresponding annotation into a no-op=
.
> >
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we ne=
ed it.
> > v3: Add the version to the Subject line.
> > ---
> >  include/linux/compiler_types.h | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/compiler_types.h
> > b/include/linux/compiler_types.h
> > index c5921f139007..8bde6798b4ec 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -387,8 +387,13 @@ struct ftrace_likely_data {
> >   *
> >   *   gcc:
> > https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
> >   * clang:
> > https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-=
by-or-null-sized-by-sized-by-or-null
> > + *
> > + * Code that runs outside the kernel proper (e.g. the EFI stub) can
> > define
> > + * __NO_COUNTED_BY_PTR to drop the annotation. Such code may also lack
> > the flag
> > + * Clang needs to parse a reference to a later-declared member
> > + * (-fexperimental-late-parse-attributes).
> >   */
> > -#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > +#if defined(CONFIG_CC_HAS_COUNTED_BY_PTR) &&
> > !defined(__NO_COUNTED_BY_PTR)
> >  #define
> > __counted_by_ptr(member)      __attribute__((__counted_by__(member)))
> >  #else
> >  #define __counted_by_ptr(member)
>
> Apologies, I may have been unclear.
>
> What I would like to see here is something like
>
> #ifndef __NO_COUNTED_BY
> #define __counted_by(member)  __attribute__((....))
> #define __counted_by_ptr(member)  __attribute__((....))
> #else
> #define __counted_by(member)
> #define __counted_by_ptr(member)
> #endif

FWIW, Bill's original patch had this explanation

"The two are kept separate but parallel so they
can be folded together once all supported compilers handle
'__counted_by' on pointers."

Justin

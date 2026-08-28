Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562A31195B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942753; cv=pass; b=B9SRWyu2s8+4bcEqsLgQFp41P6rfQyFIDIeeC6iDob4WYATR65/sqa237/jRtk5aEvfROdDzCnmIt+X6u6fbmZRsxpPFZSGjhOkKyBP9FwHzLJzIpTgumUVtFhyzIRTOZ57qQgQsS2fYMU1R/hbBus5lfhIeppwzL4t+axcbJzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942753; c=relaxed/simple;
	bh=ge4Ljtv1uU3tLDv0qn+CogzzM5fRFylDnv9OiKMMdUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dbo47Sv4bly0GZ+YF0X4PM1LA58BdKbnwLrx/T2xgahOuxyAEQQxASOuowPi+U4DIMtTTLo2x1Y2hDfMHfveKyvH91WTX5d+nfTwujzh4GcdkUUq0MGshiOM+zbuAxyS+yIUCUOpg+v70MBzNv0ZyyMMXtUXIXy0x4UJfNcXVOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=avB0OUCB; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="avB0OUCB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4996e2575dbso6775e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787942751; cv=none;
        d=google.com; s=arc-20260327;
        b=Ne9J8HBMExxpj6oRnZT4czTEjV35JDUbrLb0P1tqejI41RtGjF8fWOpn/FnQQEXoWQ
         Qd3xjwsIYIzSU8Oa1Z2rVn9naSoQq5/t+Eat32+TtxVwb7s9MBxOeJAzBOnDoNv6Aag9
         kpwo0MXSDDOyj1t20qe1GpbeX31uxYSf6SlMVG6IEbWHhIEUkQRnDBy2sQG06nw9OOFY
         lzUIXUunFMRA/AcIZ6BPswaOzb0YnjJBzUabzBitgsGOSLHzlsCg52nlqOOxM/cT/9D+
         E6tzRcefFW0QVzpXQWVw1A9KbtgB/nsGkHgitVWKR/5HcO1AocjguyLSOivq4p53eMIJ
         imsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        fh=K2rPCHYnBxo7zHX851ScJqrWfrkWodfPCvzAOlLE6VY=;
        b=PV5ARxtaZugsXQKc1XFqAnNpSpmtiVHwa0lpDXSp0qTTMm3SqLl94GS7xnibfJYtyY
         rP9dwuNkYPYfDiCCRu/wwfTJ85r+nFJ2tuXiGirpWYvuA9PVjbZ48Jp30FSP1RkphmNs
         coxaaLI5Qgu/8Fxt9eRZx7kWBOXOC49VL1UfmLriVxGB2Bs2a5paaMpFdppwRAWp0we5
         +eSLdHgnQ2MA0JKPeJUJDD8n2LIgK5+RmC+js5Yfe06hErinEunFDr0oLGXXkVhZvBhx
         pogANdtxagijg5Cx/6V/F/8hjQH2/nGz6QqcycGaOAKjEvl2YZ74LTyP6oteS2+/t6Mz
         WqPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787942751; x=1788547551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        b=avB0OUCBiyj8YZEMD1+lg1MWmwJdQwRhUSRs53LrLE6oZ3rZgcOv/J37V1YKQLiM6n
         Nf/4kqbaqL4T+2uPTrwNmUqSiFBKJywR+RTWA7Lc4BDcTF5wLlUh/2fG1OaMsjIffV0x
         1PRD4boPn0yWmYwrXWDv8JY6RUSONepEQZwIhot11QKDNKUYBHBFBPv5B3r7hUcRZAL7
         +W0VUAMLuMv6JQ8UEfxPMr5OsNFYsd3CBZFkwL0ct/ckdPxefUtq0G4F4ibztb8Vtibr
         3E+eJ5gKIVcIBHL/e7jwn14xTHBM+fXf1oNe+7hvLrBUppjrJPtkNtz9AulIiqdk5K0H
         szxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942751; x=1788547551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ko7FEedg7fFwoXFuQeT19PTOVSQvIh4a9+NymvSzdZI=;
        b=XzDOMPB0v/Zy/E4qv6162Bg1UPLXFfCFNeoFdJWKcCsh5O3Y2y3enhYglMrX+vULYq
         tFNID5n7XI9WDAy13vZGd+2n1iXDM4BGyuDSn3f/daZouCl/nEFDh0a6uxOrfdm1Ufph
         UPoELTutVoQMrSFz4zvKBpehIsLaHv1P6KSqDYaAX6P593wjrOMUhbWP5+cH442UMC7G
         YcFWY6XsQxwYHeQAJWc9yf0AeJqu24QzvgpbP9SydTAdffb7g/wAUyKceQKnXDYEpiTp
         FTMM5pjYeJnH0Jyy/ITUTunHlJk5sh0aNV7PydnBExTZ26lnlSCIOSP/ugG3t2JCL6ZV
         y3Vw==
X-Forwarded-Encrypted: i=1; AHgh+RonChm6no7NY+A9PIznYvcROBNFmCuBAuguUo0v2EaBbGtzxBuyofrl6mFK3z49yiYsdvFZGtDsLkUUyr0=@vger.kernel.org
X-Gm-Message-State: AFuF++la8zKC8eZyD0yYMt5kJeR5g7OE/GIP1fN9dLR5tB7kskzPbaZN
	1IZGDGpK/5M5MtNhFkh0mMvkbxEd49kF3NKRsd/x1NzW5aWo9rjRBg/D4yQmUckdSya2kzMgUyr
	+8sVSEuRq539zstFmkQ5ltD12uzbpx3HBojhVChTi
X-Gm-Gg: AR+sD10isNQ6NjBsMZ8QXGMzL6/tXA4HLYHyofnCQ+u8jj8LI7CqRWIWm12anYO4199
	dGhSLPeYLnMzf1BDwE3jdRYipr/203sxF4N3ZnNngLTPosvmYps57dszw4JtEwOBAXfieqsVZrS
	kFpIdkwJj2UdKm1IUK4nbwpxsHBAbFh3qddQhjXYUgOOUFVW7MKFKQquJIH2ySDsKFrkPEpQITH
	ZV72fDqRVYd1Q50Mjog7b4FJvChXTojONeGtZojD40W2xdKMlzxv/e2nYb1j7K4GCWskdb0zU+m
	pJtYVgAbt9hU008E/nmeUMkr3hr91ljzsk7p19mqpA==
X-Received: by 2002:a05:600c:6549:b0:49c:1295:45c1 with SMTP id
 5b1f17b1804b1-49ccbb8a4f4mr63075e9.3.1787942750098; Fri, 28 Aug 2026 11:45:50
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
In-Reply-To: <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 28 Aug 2026 11:45:08 -0700
X-Gm-Features: AcwNN1Wx0I21Z8-gsT0HKzRa32m8c_GTOdvUPjQzxP_d9dv2tDYvd9upqY_kuJs
Message-ID: <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:29=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.com=
> wrote:
> >
> > Note: linux/uaccess.h is included before linux/cfi.h because
> > cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> > include uaccess.h itself.
>
> Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.

Nathan fixed this here:

https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b2=
7015390901@kernel.org/

> > -ENTRY(imx6_suspend)
> > +#ifdef CONFIG_CFI
> > +       /*
> > +        * Pad the location counter so that the type hash emitted by
> > +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> > +        * fncpy() requires the function entry to be 8-byte aligned.
> > +        */
> > +       .align  3
> > +       .4byte  0
>
> I still don't like these assembler directives inline like this; this
> feels like we should have perhaps a new macro in
> include/linux/cfi_types.h. Thoughts, Sami?
>
> One that garuntees the 8B alignment of the symbol for w/e that
> function patching routine requires?

Sounds like arm should override SYM_TYPED_FUNC_START to add whatever
alignment is needed?

Sami

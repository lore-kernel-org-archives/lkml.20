Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B225A2EF653
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 00:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331245; cv=pass; b=osSW1WEF52Lccsn3bQb2dpZa3XXJHjh3w+q7he2nL8xKiy5f+j3pgPFKqfYM6E+bwqcMehbWbjvSugLJ7TJ9yYw274tDaB91gB2rvbtYNdox0ZBKwvIaw0+p3//ngJc7NfrlOUHLNGbqqM1i/zNQYOE+5j9vq8lnB0fbQhnFWB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331245; c=relaxed/simple;
	bh=PIdZWKk7UsAxCtN4qvwS3WBKKGf+fKTzUBUtZtSSqJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzXg9u0zltK1u+gVZt4kOLOc+dQEOF1+6aorXAXWMVlF6COuN6CDo7S068pxCfPtwA5ZWlPF++wr528KYNmqzZXfvtNuXfUU2P3kFOLDjKgvi6RnuQXL2RbiMMe9W/SfxhcoWYczWqq6k9XwY1lVOwncClDu3J8E8RVr8bzYqnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPfKB1ya; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPfKB1ya"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso1734784a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 17:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791331242; cv=none;
        d=google.com; s=arc-20260327;
        b=j+Nc+bi5vGH8/syJUMLITy8hXtsPg8BWJiiLSqvDXEeqdMZuQQXgrkEFTakgpJaTyG
         Z+spGk3bC0NfixE1l0xJbgJ4q7t8z0TQ9DBYqbDq3l2zQNuIF+PjgCGdR2d+RQhcHdj8
         TY7hoZjbUHHKPaa3mRdWN2VSxt9J2FUNTm8jhrXBhZrjMrgQhPmU8fDs6dnR7G4eb+D/
         uK7mCbMxLWVeMH/dYeS/EJbxHu0l9orFjoCWEiukFEg333+igRL0GDJFrhQP0I23IaZ0
         ftUpTNesS/TQuOSEJl/CcASVMfgVWa+RSl/dEpmXWRYzbZNibiEhyQ91Xd8YFJwtNkgY
         ADjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NCYMrF1COiQ5G1aO6E9q5ZQQkQbwsyS+9CvbT88FRDo=;
        fh=v90o1JqBJrJO+sJp3RombjbeS2xMbcTEjLkCifPiIZU=;
        b=gV3rOZE5wfzK+qRwlhQrLMUw6P0Umtu34uFFgPcKeZyFvY3iTOQ6uqBwvRfP/OvD0g
         1AknFlokOOYYTWs0Cdis26ezk848G45cIEKBBzic+SlyS6QDkRQTLa6qUNi7BcftJuvu
         CC0mjnwuB7U+h5KI2xgW06tyuGroqeUYSnpk5hFB8SCOFIuEEF389BfbkPxJySUCU4us
         1yCprBg5iT8JJqmVRui2P1y0p3SLeHeM0c0mUf+rDtP+ShyxzfUskfGTpXNCDrLdPmoy
         or3fhlM0jlK44NgqOND0ws7Drr8yB95L/zxV2W21JGsNvtthKuvdc3zIBCWaE7VomG64
         i6CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791331242; x=1791936042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NCYMrF1COiQ5G1aO6E9q5ZQQkQbwsyS+9CvbT88FRDo=;
        b=RPfKB1yavWSPrFr+K5MqdHP7qWRSOE8zIAPMcPJliLCBmrRSuBfSmGr2bmIpgQDHgP
         cnvzz8I6viQZwdK6FnGCCcvVk0Cqz4UvJYTuPzdBvuKkWPt0KirRpTiYZ/rqDgRBzYgh
         Ap6ecDHQ0ji++OSYrz1hwfAvYVFfzwvM27h2MSWy/W3fieG1/diG65qEkSK3SEFPjTfP
         b7kaEQfZEY/LWK7N27YvwGjSI0ph8bokrPVYtFhLTPba2LrkVknjEt3ow+t35tBo5a3m
         /mxOczSA6Dt4S0a359iYSbeKlFuyMvj6oye4FVYpzAxxhKZLDTqpS51dOrKqBwZ4cazA
         UECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791331242; x=1791936042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCYMrF1COiQ5G1aO6E9q5ZQQkQbwsyS+9CvbT88FRDo=;
        b=dC9n6c2NaXVX4KEhKAAs8Np9q26D67OAryk3kH75VGbXaS1+kWdnzt+Wdsot/dyVBe
         rp/eAQN4XTdFWmvRz7CSn/Bg3SgrcrijIyHVjIzMBP98bo01YzKjVn8udOtusSjtDkXD
         vSfLF7yvS7/mWJXkF8w/hetK60e9U9XaOCSlsJu7VwPsVED6YEHmVyLDX/b4K6+qKMbl
         9+NE2/fZ6WSY9SyrvheUNT3RPqu0yK8d8l1yu3j6lj52WpL4ZmHtxYhkZNQuqjwFfm20
         SbvZO63qLdrXTfOFG55oJ6su3bDrhrFZ82rtvd6wi7lvSMOBafsqa1ZeaJQwRTgYwSPI
         cjdg==
X-Forwarded-Encrypted: i=1; AKwUvBwNjgxufA+Cb6M1djfAgchP6WYnklS0vy7PBIp1VqUc29QGIcwfDCM68gPmPqPnUCkCWtVUpCwwybPF540=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYQK9EY2+RfE1OEePm0cLdy2cxRhyEUxxcH/RMpbR5yfTauIxn
	9RP2gui9SO1MTSlhKO22zLyuYaSSf8GH1v1CiVmxyM23jFrjMpKRSXgWZeIbbGJmqgAcwSnB7GR
	YRDILe0vbSQv5jZDGl9OnrIM8npUF1Nc=
X-Gm-Gg: AYBFou3kGpxpyvsInfsICl42SptDirPmGnyElFqHmEGD7FCtRh81MA6HckjpHbiI/Gh
	+/fsIB4VGddQU9YfaoAfjDfG3tBhazzf5hIpsFugrxTCo+g698kSK66Vum0a9MnIBSaTGQ4gKf/
	l410oJaNgawBXA4JS4ldW0D0DcEW6nvM2S5olyU06uByHrJxC+KSUZGfFnDyjroieDj48uUnuVr
	SlR4JJZif/ydHG2E+cDlrLaCI+PPTkeJdJRfjKz+szKVjDIl4Q8sCio6ll16R7DTWMGMTdf6iIF
	tqcGCOERtM++XhUwG6GcgI/O/Zge2ZEnYwMuX/V0+uUcH9DGQtSvtE+OnYJA9czxEALso1BDwzE
	QfPIRTgjNd3FWEkmYkeeHTEOJjN4gE26ZRcYSP1rUsliNYYu6XnpKgQ0kkpLCIqBuVD1QTiXe2I
	mlGMZS28N4Ec60XNF4Wska1XOjHFMfmlQU/WcB4NXez9GVk/ET0a4VKfX4gNO24Jq+kA==
X-Received: by 2002:a05:6402:13d2:b0:6aa:fc60:60d0 with SMTP id
 4fb4d7f45d1cf-6aff47a079cmr524195a12.33.1791331241682; Tue, 06 Oct 2026
 17:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005203930.246598-1-rosenp@gmail.com> <CALMQjD-udSokCKS07VFWauBQzac5BTPJqbORhskxgddsuX1vLw@mail.gmail.com>
 <20261006083103.GA3041473@ax162>
In-Reply-To: <20261006083103.GA3041473@ax162>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 6 Oct 2026 17:00:30 -0700
X-Gm-Features: AclHuK9oSm_T0yaj7kOWt6PgPFJ1d7MNcK17mxS5H3gv7-Ov32c6fYi7L19EGq0
Message-ID: <CAKxU2N-ZE7dwiGzVgxDYFvm2R0BE0nah2WehGcjpym=Kq68dYw@mail.gmail.com>
Subject: Re: [PATCH] sparc64: Define p4d_page() instead of stubbing it to NULL
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kjetil Oftedal <oftedal@gmail.com>, sparclinux@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:31=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Tue, Oct 06, 2026 at 09:59:19AM +0200, Kjetil Oftedal wrote:
> > On Mon, 5 Oct 2026 at 22:41, Rosen Penev <rosenp@gmail.com> wrote:
> > >
> > > A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():
> > >
> > >   mm/vmalloc.c: error: performing pointer arithmetic on a null pointe=
r
> > >   has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
> > >
> > > sparc64 defines p4d_page() as NULL, on the assumption that it is only
> > > used by stubbed out hugetlb gup code. Generic code now uses it in
> > > vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
> > > used in pointer arithmetic, which clang diagnoses even though the
> > > branch is unreachable on sparc64.
> > >
> >
> > Has this been reported as a bug to the clang project?
> > As it throwing an error on a rather obviously unreachable branch.
>
> Technically the error part is self-inflicted on the part of the kernel
> since allmodconfig enables CONFIG_WERROR. That said, while it might be
> nice for the compiler not to warn in any case of dead code, that's just
> not how it works for either GCC or clang (none of these should be
> visible if that were the case):
LLM suggests as an alternative:

/* sparc64 has no p4d leaf mappings, so this is never called */
static inline struct page *p4d_page(p4d_t p4d)
{
      return NULL;
}

Not sure how to proceed.
>   https://godbolt.org/z/K3nfW4n5f
>
> --
> Cheers,
> Nathan

Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF63B6378
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581640; cv=pass; b=LJc4ZmO5ii8PqJowD8jdYsta6LyLGj7RpCxIBi/Mrr95vvzukUC1l0h3T/yzTx/ra5vdlngJp3TvdX73zKqHkcrINbL/YkBfz5FPJJ+Jb9oMfsZ1LcNcD8xSCS1y1SVE9whXg/t5oaRo+xnZ5Hy5UGJrNt2zs0ayl+/9EB4Lc0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581640; c=relaxed/simple;
	bh=OvQ55FXoErnNKhvc+Qxa3QvWr6A3gB3Z0YvB4C+COTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwgETojpnWPT1r2YYUKAhe5XuQ0fqT1nX8VxP06o3FpJqPdm2Hq8EEGhLTN+W7nP/+ck8JwzbWrpdPpjQwTNdxaeKQA2G25qhRYX4aVKMnVtj2f9B01DklMZxaBBSNl5svY6d/xgrjdqx6r1u6CMsYGgJLYFGw3hPSSW18+za3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZAKLnFz; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZAKLnFz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso251135a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791581637; cv=none;
        d=google.com; s=arc-20260327;
        b=gpb+/yDsytJtZCb9r+Fxvx3VVNQNsjYh9jE+7UhZjHVfH0REBX6CwAudk0pU1VWMnu
         bIt/b/xbVDdOc47L8Pf2N2y9wFyXBypIZnw0R0yjJtVxuD59G/eKnfpwxbiZPdXoHmMj
         WTKAeFyi+yzc5T3lPRnI31NNCq9hBNGDQt2pMvLvlfpdEycgDktrXV0mWFkVndYo0+Xc
         9DunRWP/K+HG8tPc+EvOj6q7eYwSBwH9ZBKj9+TNe58ZzwojX+EHHQEDQLjZfKQ6xaCg
         /JSD0MxnkrRjEnbYvWEfmEHMsDEBIqOsRKV+r9TPEY+6bZz3D+NRikH0vxVt55KkxN9x
         gjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sK8/6wWnGfCrSRA2b4se/1dVCFxfL1CUU24jZL0PDDs=;
        fh=9sJqB38k8peCxwPCh+TxOjFzv4DusDawwMaY0W+7hwM=;
        b=o7rAyAg8v4/r5T1n05azu7mvA9hl6nJ3SnSTuhsCogXoqdmA9DkVMJP4eidV+vNwUi
         GMdNaUKpNRT0hGA6B/7zIZuYXCXKwnzDcFfsx1MSEpQtYVGomadZV1eGmSqR+y4fX55E
         Tocpr4j5LezykS7EfGiEq/F+n4RJuNcfsxb6i7x5FjWUrb0sVVsybWcD15QSgK61o5Tj
         agPKPOC7uNpXWku3sgBKe5GF0nK4r8sXc+QLu2kZgDdr78btJjvl/zxBx8UMguOIlJ9g
         vlSuXillgkWroBcom3G6UKeYW4uKIm1S1puvhDoIeHtvZGEtwdK9TAFuxLIeWq9ATLih
         +9dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581637; x=1792186437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sK8/6wWnGfCrSRA2b4se/1dVCFxfL1CUU24jZL0PDDs=;
        b=oZAKLnFzvM+lXau8YvTXKCwfibrLC4NJxDf5NJ5k0TBn5ybecNYXbF4s/ge/gDMqPd
         giRi5vnL1WFdQHivOGwnnebamzZ2TS7H5cBTAMFbiOvZxAYGUIgOG+k1o9+pjQq7UApJ
         GkArWJByEMnG7jrXYPXWE2aEXJ9Vk4Gr/yO+3r9wIII9MOiGScpFVI120sv1r2SmYRMy
         EZcT41bFaII1Llb42BqnjJ7LbL8rbdGNrPqOG8lJoC+Q54PmGrA7XLcj/QrlORPN+Kgh
         BE4Fpj5CxFGdmD7ZZ0zVOGHnrtT9NAVXiKCwaW80Ax098EJZv8cvnm4MgftmaGbknlub
         GH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581637; x=1792186437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK8/6wWnGfCrSRA2b4se/1dVCFxfL1CUU24jZL0PDDs=;
        b=CFu5trm4o9iQVLnq/QvfzsxWmutVkUoueUhhVZfZ6zbvKNfii0ta2ZsstAgTEQt5N/
         7LnbGQM9UcEjtJ/zIxtWAfahCjuDvTDIzIdwKGQZ4enU7FCfGHrxmDOaOYvtEAqkKwQE
         sU80EAneFG5f4LJNx9Mpw/+S91RxZlB7ErM37HcrWExqrDczX7EAggfvjgUyM0sFOSiy
         KZd1x6BzlOkaJLSgB0FV8VPQwuSTFL3NpA25qZoxrrAt8NdJ+IcTlAk5GSf7gUrjFv5q
         RyjKut6qT44aemEqQ0BKFqdeiuMskdgiGGx2gAZn1Xam0k2qsinBl1NkYmGPaNCuk3B4
         oaTw==
X-Forwarded-Encrypted: i=1; AKwUvBzZQ+UzENWF92Nkm1uznx6R3Isag1gdbkZ/uw+m5ZKMjdcmIU9DrrX0gR62b7sXZ5uN7quKZFyENK/Lo4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI5ktQsX54XZCEc3kVHDbkHvSTdLVW9waV2UXkDEv4UM7ddeOL
	+4y6dwY/gpzG+0bBKl0Ln1XwORc5FrJjO9jTvwlZsE44vJoe2stCsfO4s5qA+c5O/qJ8hkxwc2O
	dGAaa9sfdeIl0pY1GImb+iP1ir5+jzV0=
X-Gm-Gg: AYBFou3MxPVf51LXLYIA9vv6ThmNxn3xT9j0/f/K4PPTyOoRnZGmOaZ5H2cU6Fwm80t
	gcGc0896dLGBH1JKannIIM5RpiUk10jcY5h4MUZco9EeEAIK+/RYR2Dc/BMKk6T3qPV7IObGcjG
	RwAivNW95g8UfKW9YbjPNDgLROZukhkmHuPD6zz9uY6zYEoaAyYxxKZEBRKbMLIkX4bVIIGAQIj
	BsjdVafU6CAcH/TLBsUnvoId+2ELLHh2T5uKpvJZyiw9OTC5u9stOy6ANaACSdcrIKLph3kg3j5
	9r0c1kk/UV2bRXLChScJoYS6VPI3zmINCrpbu5HKzhddlFhbCQNGEUoO7rkB3Cn4/1xouCbDUsE
	Wgz+wJ0af10SjLc4/nfoLFP7ms1REZ1B8a//XDg7OxV5dt0IBzQToRmKL9zYUKA5Pe92DjLZySp
	anLxIzc1TVP6xPnZ5lMDl6cJA2BKQQRVwQKAzUtzBWGmHjZd3VDQClrG77b9G1b7O6bw==
X-Received: by 2002:a05:6402:3548:b0:6ac:8dce:5a75 with SMTP id
 4fb4d7f45d1cf-6b17c254712mr2711939a12.23.1791581636975; Fri, 09 Oct 2026
 14:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008191711.223236-1-rosenp@gmail.com> <20261009191300.GA757048@ax162>
In-Reply-To: <20261009191300.GA757048@ax162>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 9 Oct 2026 14:33:45 -0700
X-Gm-Features: AclHuK8MlV0tZcrPlLYVGSOF_atGwGV-YpvAht_KJ3XEVfnjWvLiyx6HZPct2Ig
Message-ID: <CAKxU2N9iJahKnVJWTHvh0jaEEma1RuthMW_C7AbvHV+4y_m-=w@mail.gmail.com>
Subject: Re: [PATCH v2] sparc64: Define p4d_page() instead of stubbing it to NULL
To: Nathan Chancellor <nathan@kernel.org>
Cc: sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 12:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, Oct 08, 2026 at 12:17:11PM -0700, Rosen Penev wrote:
> > A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():
> >
> >   mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
> >   has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
> >
> > sparc64 defines p4d_page() as NULL, on the assumption that it is only
> > used by stubbed out hugetlb gup code. Generic code now uses it in
> > vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
> > used in pointer arithmetic, which clang diagnoses even though the
> > branch is unreachable on sparc64.
> >
> > Define p4d_page() as a NULL function to silence clang's warning on an
> > unreachable branch. sparc64 has no p4d leaf mappings, so there is no
> > functional change.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: use a NULL function instead.
> >  arch/sparc/include/asm/pgtable_64.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/a=
sm/pgtable_64.h
> > index 35a217bf6e5c..54e563eb0efd 100644
> > --- a/arch/sparc/include/asm/pgtable_64.h
> > +++ b/arch/sparc/include/asm/pgtable_64.h
> > @@ -851,7 +851,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
> >  #define p4d_clear(p4dp)                      (p4d_val(*(p4dp)) =3D 0UL=
)
> >
> >  /* only used by the stubbed out hugetlb gup code, should never be call=
ed */
> > -#define p4d_page(p4d)                        NULL
> > +#define p4d_page(p4d)                        static inline struct page=
 *p4d_page(p4d_t p4d) { return NULL; }
>
> Huh? Why did you keep the macro instead of replacing it with the static
> inline function wholesale? This should have just be
>
> -#define p4d_page(p4d)                  NULL
> +static inline struct page *p4d_page(p4d_t p4d) { return NULL; }
>
> no?
Was not thinking. I sent a v3 and actually tested compilation this time.
>
> >  #define pud_leaf pud_leaf
> >  static inline bool pud_leaf(pud_t pud)
> > --
> > 2.56.0
> >
>
> --
> Cheers,
> Nathan

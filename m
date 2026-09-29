Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417FB337107
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690780; cv=pass; b=DgYPAXGO1RV9++IHdM176yx+w4FjOAAWGK/z3CESlH0IevDWGo9TsnqEPO/Z0/Z42H0+Cgcb/FVQcH/yAO9m15M3mPueXBDEk/+YHO/qpz0Y9C4EEYXqEBs667KHW1mEUULffh19z5SaujJma3PWP67t0BVocF0L/hb4pkdsyw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690780; c=relaxed/simple;
	bh=fhR9qb/Hb1WbvE1d2mf3NQKyepj3kvNi8JDNlOX8T8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAjbuJyuw1ybUxaw9zxQj/+6Yeor1gLMcPU6vnooEbadirDIRTIfnZGAr01/+5502MK7Y+r5THDeF0Ye4RV07tgDtIveJrpE2u3I9lOprYxOB9YgEpaJ3XPfzS/NuVEiarXgR1EKZT74mORpzktDAIJLKvKBvLAN7tf3SlCbCJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QydAqF5e; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QydAqF5e"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8facae850so52755ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790690778; cv=none;
        d=google.com; s=arc-20260327;
        b=DAH1AoRCsBa8TGzsJaQ13jnE0XGIPhCUnwfYcrQ7GmMiOSVSpjUKseKVfrKX81MnYb
         dD/qQOIw0x/mlTQ1Rnbh3wDU3x+yo8pQ2VQPVA9+Id9bZ90gsDAqX+khyTvhTUflbx57
         ibeyz3KmDPJ5qrwpXZF9oeIEVgp/yfy1Eemyhczn4zNDb10n9AqV4L6WZ13SyRgpU1/e
         b+KXnzV7K0lJGY+a+wM7kn82Y+h3RYfmh/SN6cp+qPo9Z6dBDgi6dGkrVs0RYhisD9zi
         SqDqOieKZmh2Qg7ZO4ZnYB6FmQrDsi29quuIBG1Yr4FNCsNy+WwkZTHriXT1PPRc7aN3
         h+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bjuSCtHrD4hJ6bIOwYxSF2S+dabm2wOYtiRT9In2WKk=;
        fh=mnPCIUe4sbSpjzTzfmpNC/lL0ljmKL6WjTV5fsiwztA=;
        b=HJo51/shH292yVeU89/tpKa0B08XqGewgSszz6fCbxdg+Vn/d4OfxalGjYyyYOdf9l
         MHV4APXjUKlDhQkSjonK+/Vx7udM37vqANbyq6e6CWNjelVTthY+hGLfBTqTciNckqjL
         dK0nCuhbud2qQAkA08OXeZqD77TbEzPCd1hPKInpmOJTeRQLz3H/Cb37Tg5mhhPJvN12
         yymXytq1mfhIwrblZHslQKnFBIvK89B3w7EVyoiGODWVLbjdpGIY84/dJtN27oDQct53
         oD0kN7d4b76c/QeVxFU1h/bgT/D9xcXIIL5oPlNgVJYiqUQDrrcLVrYmi+4wB8aVrR29
         1tSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790690778; x=1791295578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bjuSCtHrD4hJ6bIOwYxSF2S+dabm2wOYtiRT9In2WKk=;
        b=QydAqF5eUj6KA5YwOyHVodV8I5FDURpQumR5kyUv/5Z1akvffwH+HqmOzvswRRIhsA
         QiP7zfJQ2e8QR1Pnfm5ZMMcvev1tjcS39GQY7KtSXbYhte06bK9RvGyklikWHsHxVtBS
         hZk5vEnSs1Wj+/qSH0KrhU+qnGNTn92h89UtGpqUy/sz/UgI+SsJLVUxg3a7Du8XLHAg
         AEr4rpHwHan3GDY//PMefThDbX31uymrhWjgg2vKx2ifB6b48EUVC8WnBe34rJE3PURF
         I1bwZcnr2Na50w8c9Wllbp/++A4wXNL0AaB+w7wTBXpsZj3NDyCAUXgtq9ng1aEnoq2d
         e7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690778; x=1791295578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjuSCtHrD4hJ6bIOwYxSF2S+dabm2wOYtiRT9In2WKk=;
        b=HpuQFZT0ESRCJs12ruRlHISs900m3pXs3hr8sF0Oodj2FuleMgsAKyb02+XVn02bqd
         utAYAyliO4SJN5Fgkp3+8H4usZhOxN7JL/Z8XWmTp7dSeKPenpGy7SIOX4hppZyg5C+a
         4fiHq7hIZ/V32Nqnsv0lyB2DdQT46SRssCgsmwY2ZiuaKNGVcY7VSsprLeFxrsK2TSZk
         3R+p4cSWudQ4VD8QuTNzO7oizPPhyklLxcZN8nUBYcUGH9fxs1rmoP6tAWngFR0OPWCQ
         0jbfUBRMzRTHnWR//7GuB6PYl2x8SLgHyRu877LXeF9zvImVPbHWcfIKGGx/S+ck1fwW
         xsUA==
X-Forwarded-Encrypted: i=1; AKwUvByiSepulEszoBW1ssxr+a43xGhkAODcHHYjKheSXTavxSkK1V05O3gS/jOiDUsykaCnAi3d8Q2MKCITOCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4GdCRt2/ZwEUkdyr/LAMXIfvtCsotSmG9umAuqNTvn9r95QxN
	ylVrCOI83ed0f+yGffeSxBcwmg2C0JjLZZ8xeYJz4xGWcsyMufAe1e6MAOdtPXyh1wnnZd6s8NT
	G2oGfIi4ea+nBSGVCGnC4qcbSCXP1gZSOhsMOKNYg
X-Gm-Gg: AYBFou1Y5Py4F2HMYtq+wH35UF8WErAw2r+Mpn/fPCNGBSH17XxqQMmPHmGBCJY2Yub
	B2wtHbMQkqPgJPOQzTz5k8pfSWAsmcZyVY/zXPQsuV1eowjVS8owm64/85guqJ3oMFDZ1couCoP
	8Mh3aQ3syoF9p8bKijWXghSX+ABhaF8RxQY4qD3ab8Hw3FvHy8pbONyby4nGTkWlllZFUq6DgEP
	FYieiH5aMuFvjxA8p1PxfQnHJ+2mI1KIo1ztRLzhneep3GvCXU+QRi4RYsWi22lzc+cHl2xCLyR
	drf9g5lNJJWke2eBuamLW5EV7hsP2ZJrsQPbTRUAImngsoxHrqz0saPPlY7rOxDIymCekYfFAIg
	kJsebIZRFvPhSPORuyuOM+ckCylB3UtV+C3dB4d5bmB217DePJ9Vc
X-Received: by 2002:a17:902:ecc7:b0:2c9:b404:b55 with SMTP id
 d9443c01a7336-2e2c6355633mr3888815ad.6.1790690777520; Tue, 29 Sep 2026
 07:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812-refcount-bug-on-data-corruption-v1-1-c6da63566101@google.com>
 <aru5lCCF50puV8GM@willie-the-truck>
In-Reply-To: <aru5lCCF50puV8GM@willie-the-truck>
From: Jann Horn <jannh@google.com>
Date: Tue, 29 Sep 2026 16:05:40 +0200
X-Gm-Features: AclHuK-fOXsoweB1C7GwlqeBps4yNhb8dBqPbcZDfr5o7KnCnMropqZvBr1B7_8
Message-ID: <CAG48ez3v9uKzoNTj0xz+ec1qV6sAerkmqi8orJE4ghdPfJxz2Q@mail.gmail.com>
Subject: Re: [PATCH] refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for
 UAF-related errors
To: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
> On Wed, Aug 12, 2026 at 08:56:38PM +0200, Jann Horn wrote:
> > Some refcount issues are not necessarily associated with memory corrupt=
ion,
> > but REFCOUNT_ADD_UAF suggests that a UAF either just happened or is abo=
ut
> > to happen.
> >
> > REFCOUNT_SUB_UAF is also an indicator that reference counting is wrong,=
 and
> > suggests (less strongly) that a UAF access might have happened recently=
.
> >
> > In these cases, BUG() is appropriate if CONFIG_BUG_ON_DATA_CORRUPTION i=
s
> > set.
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> > MAINTAINERS specifies no specific maintainer for lib/refcount.c, but it
> > does have an entry for include/linux/refcount.h, so I guess I should
> > route this patch based on that.
> >
> > I decided to send this patch after wondering how exploitable it would b=
e
> > to have a refcount_inc() call on an object which has reached refcount 0=
,
> > but is not yet freed because of something like an RCU grace period.
> > ---
> >  lib/refcount.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/refcount.c b/lib/refcount.c
> > index a207a8f22b3c..c0f0dc5296eb 100644
> > --- a/lib/refcount.c
> > +++ b/lib/refcount.c
> > @@ -10,6 +10,15 @@
> >
> >  #define REFCOUNT_WARN(str)   WARN_ONCE(1, "refcount_t: " str ".\n")
> >
> > +#ifdef CONFIG_BUG_ON_DATA_CORRUPTION
> > +#define REFCOUNT_CORRUPTION(str) ({          \
> > +     pr_err("refcount_t: " str ".\n");       \
> > +     BUG();                                  \
> > +})
> > +#else
> > +#define REFCOUNT_CORRUPTION(str) REFCOUNT_WARN(str)
> > +#endif
>
> Can you use CHECK_DATA_CORRUPTION() here instead of open-coding the BUG()=
?

I was considering that, but decided not to for two reasons:

1. CHECK_DATA_CORRUPTION() uses WARN(), while the refcounting code
uses WARN_ONCE() so that a saturated refcount doesn't WARN() every
time it is touched.
2. CHECK_DATA_CORRUPTION() is currently marked with __must_check
(which can't reliably be suppressed on all compilers by casting the
result to void), see
https://lore.kernel.org/all/20260812-data-corruption-mustcheck-v1-1-5f59bd3=
bc2b8@google.com/
.

> Either way:
>
> Acked-by: Will Deacon <will@kernel.org>

Thanks!

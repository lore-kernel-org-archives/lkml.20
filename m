Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E33CF208
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792104844; cv=pass; b=Bf78QwmDdKttEOHaM8kbZTDbzJn57sgqpO8jw0Igvoct+4R2oGy66Q8SU4DdkPy91Brgbg6HAKGRKlQUOynqC2UOPl9v4E8VdlHSK5YhxlKoRxvTEl1SyIOoMO4+/78EU8YZP1tX9wHOtVxAK19lnnLYhG2T8EBb623+rWQSEK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792104844; c=relaxed/simple;
	bh=akJSZf05dfo8ZB1BNAXdg6JKZt42Pqg3iN8HG2G8ViY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sveF1ZnNvobDeRjgjCsub8mRmGnsc+M3lcwD6NSlhjUPRHdHRjnhntYgLresq65akjplamJuuiPvnVLlewR5AhsogwD5btaoZzKoAp9EkRTQlAxcUuOM2Wxc9h5nuzpAU8ERVFgtNy0cnQLxy/Nq7zXIVUf/sdh1SIr0sN/R9Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQWc7lFx; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQWc7lFx"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so26350861fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792104840; cv=none;
        d=google.com; s=arc-20260327;
        b=DsaZg2gZ1umpB1+vD8WNyc7KnuAJkjK8afpPGlFxUxOhx5rVcT8cDqh6M+KLmzFp6i
         Mrld5IQ1JkCi+Js/ziRMoo6/Bq7e6M5S1xsRalnUmsEP5qqHfXlry295Qab6fTVuWIp0
         JxP7V6VxG9lYWZE6ynouEwTVsqG+NqVG/geEit7bCECJxbj/CAeqo++zfqnY6rr40Jxq
         nBIXPspBPFN7DPZX2ZpU+WAsmParGb1DaOScs0RkHkKNNASbsqbQ00X35Vq7Bo401xxl
         7PM+25rBjceOgbaA2gOdmYRlohZZU5sWoyJrsn2N60CJoH37IyMbQBOLu+gwQNglF27g
         cGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XzxLC094t785DsRLF3VJxAg0mtapcZEnZpiZaHEc51I=;
        fh=jit/cQHW5Ro5S9dFn7vs8CKJilJwyKTGLz85zplNzAo=;
        b=VkzkHX7gK3CaYFGkaMq4KZTz0LoJPTouG8jNugkkGKa300hg5tC8BxmIbLFu5RwPc7
         QnBoq4b4DV3ACX3IayuXgC9L0MgRosjx6XwZMGrSyPvbWu/aqVzWsxsaKPENxpv+KiCR
         Z4IxXEiv2cFqPy6VywR1CW1wwST18fdiwzdNeo94mlS6XkjV5+Q+Q6t3Fl/c90LjJueQ
         e/yuatJAM8jzM+fGcqeMx+AQRawUnlTvBvXZoVIGyYuy1OvMa0uJp+vpkzv4TKGkaH7h
         qXFpc4gnISB9NXGDlfV/2SGD8zN/GPMyghrbT8/qeDyQZzquT0dUjiQUSTkmxLSsEs+a
         1Vgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792104840; x=1792709640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzxLC094t785DsRLF3VJxAg0mtapcZEnZpiZaHEc51I=;
        b=qQWc7lFxJ1RyoCqcSDOjxZ3ETc0DtXIHOCtsy6twsT3sGqlNYQRpT5HWjv9nPGUIh6
         VO9TiWrWriobZtdSf8o1ULX39jDmKJYGf2KKZSmXc+G3gQwaOAN044cycCC93U6RcsVs
         qrypXVmOX1fV3YxZICFwciWbsVVTmwJsf1EBuyZY1Wnc/ZjfPZHNEth2BtrZESrY7+y/
         6ITnDNPSGUVfiVPyZELB9xW8mBI6QqLskDUKz2B9Ct/XRWnLe2Yf01YgLbrw7BuNrRRt
         HegR95tYxLisIYPS7p6d27IFl4+KjZwq+3yb76kRWloxrgZSt6XO2F13UQzJBtQ4SXDp
         bFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792104840; x=1792709640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzxLC094t785DsRLF3VJxAg0mtapcZEnZpiZaHEc51I=;
        b=rt6qpKxRO7d/6gRUZmLfIP7XB+KJzfQR2cc4JC2p3tFrMSimVF6Gyp6z/Z2UDz/zak
         pcQOqXxVZkIjC8IXZIHRWovYmxlHV9AFUX8vrypPGIbs2u+BPSPyqX8RkHsvI76rBmjV
         XVwqax0HAfkfj2SByrKi5GAd2/11li5V+CU379vvv+CSVSenTMgX2MG53KTbLDUfrZr6
         gXn73nLQMqZ4lW8HDIU6Vw5Fz9TDVyxnDnFGB3GXsYw2/5puB5pqSXIDmHBHqoQUpKp6
         e6OyrwRLIy0dQtc9ywIquWHN/+mMDaXiOaYXQ8GwBxnOokluDLbMf6mHgXZVKhckOAbK
         9A5A==
X-Forwarded-Encrypted: i=1; AKwUvByqhmD9sv/DLTJ3wloIjgi5WOs+mfOxlBqetPrsPBNMnPNyp3liEecQCeu4s959nJ/dsgoYBBkVyQgPfmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzJ/+nHSQzSu9w4unpymdlCFYGy5+uIkOJWL0ig072eb86tvMk
	0yAlqbv9LZ7MZreHJ0TZFtvj830dTrYGjV7nt2y1ItnVt082clgwzsZhDiZcwW9iykeC776SFol
	rCNYFv8PY9WjH7EOoJVe8ofdxzYed6WE=
X-Gm-Gg: AYBFou3py5aVWFO3TvodDF9BBzH4woA1KCTCest58Y4nPyyV2mv4sd5oMNrVMGGWQdD
	C1J1+eORaTVwmlNQWjI+1pEqPXW2+SjsfzBff6PYHxbhqDIJDFXuof8RcW8xER+wKRPRXjnI5VI
	k5Jd4I0OuPksnOzdqqX2MxNqVXUMXHtB5DIIDQqe31SIwEn4UGO+eKjpoklmR6+1NNcQAJaxogs
	YvbQScRun2VqFebfO7GvvgAC6KWiC7SLAw5MWiLR61nDOGnq2UaaU4WBIvMQ0Abl6Gwebcc6o8k
	L8WlFOHEZDMOUq4laDjHfm42ooitfZfZOvjaV9uo9SSmnx/0kDeSqEs=
X-Received: by 2002:a05:6512:4022:b0:5b8:f15d:7a59 with SMTP id
 2adb3069b0e04-5bcde362a09mr6934603e87.7.1792104839491; Thu, 15 Oct 2026
 15:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com>
 <20261008182814.27450-8-kanchanapsridhar2026@gmail.com> <as-izeIj5bP01bna@google.com>
 <CACpmpof++tM9MUYgqgenwEBfaaJ60VsDwptK7Ne_-b+-DKMRZg@mail.gmail.com> <CAO9r8zPpmLyMHF+yDb2ZHRmSdAHFTNvsu8PZsQ2Z-EVvF-dc3g@mail.gmail.com>
In-Reply-To: <CAO9r8zPpmLyMHF+yDb2ZHRmSdAHFTNvsu8PZsQ2Z-EVvF-dc3g@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 15 Oct 2026 15:53:47 -0700
X-Gm-Features: AclHuK8XCRmndmlU8lQlUVHlY-_F-OMKekh2ybGWDMTVBykCkJfOyvNAoky4LzQ
Message-ID: <CACpmpodjZ60-r_VWu9ui+5o2WDSJ3gWEY79dRNp5Bei4dPwsrg@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] mm: zswap: Optimally place members of struct
 zswap_pool, struct zswap_entry.
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:06=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 15, 2026 at 2:49=E2=80=AFPM Kanchana P. Sridhar
> <kanchanapsridhar2026@gmail.com> wrote:
> >
> > On Wed, Oct 14, 2026 at 8:43=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > On Thu, Oct 08, 2026 at 11:28:13AM -0700, Kanchana P. Sridhar wrote:
> > > > Place and align the members of struct zswap_pool and struct zswap_e=
ntry
> > > > such that members used together in compress/decompress hot paths ar=
e
> > > > able to share the same cacheline. Minimize holes within these struc=
ts
> > > > while doing so.
> > > >
> > > > Signed-off-by: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
> > > > ---
> > > >  mm/zswap.c | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/mm/zswap.c b/mm/zswap.c
> > > > index 8ae67fd10522..ade84ac4076e 100644
> > > > --- a/mm/zswap.c
> > > > +++ b/mm/zswap.c
> > > > @@ -160,11 +160,11 @@ struct crypto_acomp_ctx {
> > > >  struct zswap_pool {
> > > >       struct zs_pool *zs_pool;
> > > >       struct crypto_acomp_ctx __percpu *acomp_ctx;
> > > > -     u8 compr_batch_size;
> > > >       struct percpu_ref ref;
> > > > -     struct rcu_work release_rwork;
> > > > -     struct hlist_node node;
> > > >       u8 idx;
> > > > +     u8 compr_batch_size;
> > > > +     struct hlist_node node;
> > > > +     struct rcu_work release_rwork;
> > >
> > > compr_batch_size is added by this series, why not just add it before =
idx
> > > to begin with?
> >
> > In patch 0006, where compr_batch_size is introduced, I was attempting
> > to place it in the same cacheline as the acomp_ctx. This increased the
> > size of struct zswap_pool to 248 bytes. I later optimized this in
> > patch 0007, bringing back the size to 240 with the addition of
> > compr_batch_size.
>
> This doesn't make much sense, and the size of zswap_pool is not that
> important (usually only one globally). I would drop the patch and add
> compr_batch_size directly where it needs to end up.

Sounds good. Thanks!

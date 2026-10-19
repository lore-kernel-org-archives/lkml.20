Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792436171;
	b=2sTIl8RU+gGR/VUZ9Byysz2BnmpabiD0eUKolJYcSd4uv4FyC9TFJ0rY7P8tavah20RX
	 gjCbPB88dAFYOAheVGO+4S/ToMZENY2AzKC7ce6szXSNneYRijahgU2WQ0PzniK6POAGG
	 iPgJcndGU1MdtKrrFkT0UHXRJGkmda3bP0QRdMlmB1nCAKKdkKXRcTGxR+gJA/gyzLJvx
	 30rrLc5kNdFmBw/SANdYj0L2lPmPYCwxCUNHxLX5LwU3iuD8YB5HTlykXFb0a7uE8APFg
	 DeJc0O6azA9oJZLPuULHxQuZij/PScWBtq2xvVOw1XudIBCcxEaEZnv2RlpPXy5bOFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YweAkpYKyGj3scLTRzUA6IGAh/m/fJWQQXcdDA+kHZI=;
	b=gkWu9MOK8LwPo2qpemV8qya3d4yCJ74hKejxFXa7KOcGJxZBQegxd0PthVlo0n86RTYv
	 jE849TBDjTxiR7Oq8r+KZelZI0S+2uPo7rity5O2Df7qqxs98LRab4bezWyrC4eqVgbhg
	 fKIb8SK+3ZrUyY0Ej3X4ifMuByIui2UQG+VzSDGMeZdnwkEExGumsCbu2dBHAt5aB51Bt
	 UjBsDkLxcybF2loipMEb1hJqnmphLklpJgMqXoqvPDdo9EMSyjiqwldVISp2FLjH2//tO
	 ZFw7brNvVOVf/tqHvGHrpUipS0egSLKkTmgHPZp1smr4uZgDoZtmIsBbWkC9uQvo3TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oDMD6X2E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6578C606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6578C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oDMD6X2E
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9f6a16afcso9845ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792436171; cv=none;
        d=google.com; s=arc-20260327;
        b=KQh0eDbCRQD5Px6bU4pZvsdDu2a6f5kxldR11ERZCOZvZcKb1rA2hmV5F+m1MaFBQI
         ie7OLgSte+UPdo5TIu+USvZ3UhTazkhrbtRvDdxr+MZutIloC2lUwunWqw1no9HRia0B
         9tiDRFIQjUcUoS/XCZkAnK+7RTLu3xeE3KvzuH+syjs8xwJrvuuv4QBxGgCz4J8nJvBh
         mro7ED3TkUeItbSOAgV3YufEIaTEmM12Ya+OzfNLUVSz1cDFsbYe18vlZX76RioYrB+o
         /K8bJRqQkDeBF4D47P+lmonPm0weYy7F4HcoPujpCcaP/x+xTo1xBp70zzOr9jy2AC2N
         SGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YweAkpYKyGj3scLTRzUA6IGAh/m/fJWQQXcdDA+kHZI=;
        fh=XFflEZZDUD9pTmDA7JW3PKFRNrejW1fTwlOWJahAQgk=;
        b=gP6z99uEWxJHUB8m+HxEJGJL7NmJkqCA+I7CNePV/N9FnuZwonTD5XiNAxmdz7HqMM
         Hn2NF87Qf3p7C5/BKjFAqCWUuGLaam8A0dK9WGvKczsMkX9ZxVBW6NQp52UHjAUswZwA
         cpiPsl+2K1KX/uysv08naBr6Y+R+MWWv1bcjZPN/ByWVyzuonM3SPLj5sJGFnMShAzo0
         IkJ4hE849mhMeZbbXfxCCtxpikoVhxkhxHL3gUGEna/DS/Rv/+9s5QH0ixzGO2AkPHx9
         z8RiPrS6M/ksJPw5YtlUstTRjKz2AWblQCRnGGB0d67mvZ5bei28HIJrcGoemtU0+aWb
         Rj+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792436171; x=1793040971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YweAkpYKyGj3scLTRzUA6IGAh/m/fJWQQXcdDA+kHZI=;
        b=oDMD6X2Eh4w3FF8FEe47ZcJa+Qt0V3MyeqweKl16cI1EEoBLMhYXZPP21MLDprf/hd
         LZ6sDd5RawtsMHDi0yrbLzK6zKod14lmEU8fEs9x/0Mltbw6nR9EkOlq05zMCsuUxD39
         c1Y5fKSxu/5LJKvM5LFLvGe0n531IHMtbOu2qGpfAq715K0cIwNio9FsN4N4h059Ql43
         7OL2hfH1L5TQK/lNP0YqSkqODA8N9z/7mGCHE4IWhDqrZ5NwlJultZSYyTNeGdLRi+uu
         jpmbk2sscX2AjFItDLw2Lhyxq3lcDWWxTvEAcqnQhrDY38rCVku38OcJOWp8CRWh0Xj8
         fyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436171; x=1793040971;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YweAkpYKyGj3scLTRzUA6IGAh/m/fJWQQXcdDA+kHZI=;
        b=AKb3UrxTGlgbAfes/w08+jUcLKK9VPmNBw1M2oHvqdsE+Lr1HMNxCZMWE/zUkZUVoE
         F/F0FKuDfCQzXuvj3F4dzQeKhpxtflfLjipUk1/3BEweHKDoxkzrGyBknJPEjsEgHdTB
         eFdB9E+3qjNjvSlh6zQyY0zuuaA3KI8WC1F650NOCzjFvBrKQDiGh3PHWlkuxG/d99S5
         bbqcGSsNLSm/fmKx/GXZfem6bcBCBWWJ9JNtgfP8SmHUleqN9/Hr1Pq3RPVVhftKy8ml
         50OFwr9c6o+NQu4DWt0BJVkQKT638HeMvY/8VBeaoH3+ufqCDZZ1LNH7+KHQCqpOPGS1
         MwEg==
X-Forwarded-Encrypted: i=1; AKwUvBzWeWC3lu+sHFSxy6Nm8Lc2Pu5ab/p1kQtpxUGeqbwv2I5EhI2zn49lCssfrsRqW+pi7Ct78NmR3q4SHn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe1tnSfKSly4L/N1SKzU55YP7uhsA8YGUv4buMSALBNeCJAHdd
	do2iOHfifqy26exjIwNfB21ihKucxTPkhJdhRGVyNeTBWBVxwzFezSgAmgSlKV2ml7Nyc8fcwDM
	U3CUVs+jj6fxbJzq4u/uuOi4rlnWSX4i55ZnABiqSSj3eRZhd1DnaPvl3
X-Gm-Gg: AYBFou2zluLiOQ7vkdzpox2+RriDn0rjpLhRuKc4PDtGEM4iW9gVp0/vwda65mQwhzr
	94Ou0Hqq09NvGTAQrMzc8r77V1mCzeVy8vVLUgkZAcot8JONA9d6/JZqoDxjHuBvBUBdX7J0BCo
	oLC1V++PiI2IFos8NA4Dosa9oOCjj0WFhhj5Wgv5pQxQeFWpF3KtPVPQ4b6uowAitqjQwN5BxaT
	O8e5CEIQo+28VEHXLJabt1I6w7ReU1WTd7on/TLpPZ1lSEGxG83C9GOQi8T2cgQ3G+2xC7mjHsU
	yVTgVk/8H2BJztEzQw+Uz1jl9G9rNxwbu53NjoipYloLeE6/ANdsgTT+59C01+28okP6DQV5nzW
	/qPwjqsLUsg==
X-Received: by 2002:a17:903:f8c:b0:2e6:23e5:4934 with SMTP id
 d9443c01a7336-2e9b3302552mr10210825ad.14.1792436170142; Mon, 19 Oct 2026
 11:56:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791410885.git.abhishekbapat@google.com>
 <aae089a81ea891e1bc7e3ad171064d37d800ad1a.1791410886.git.abhishekbapat@google.com>
 <CAJuCfpF+kVSa0Rb0pW2gSwkBF57u-JC0J6gwFk62iGUpXVNwSw@mail.gmail.com>
In-Reply-To: <CAJuCfpF+kVSa0Rb0pW2gSwkBF57u-JC0J6gwFk62iGUpXVNwSw@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 19 Oct 2026 11:55:58 -0700
X-Gm-Features: AclHuK-9zWJgFdAaiaHRH5quyks5irCzrBiNc0VLEM6EY4t9qn-35fHPfFLOiaY
Message-ID: <CAL41Mv7cFudV97MEr2gq_NDno8z=BtqiKegDdM-haxUq3WRCAQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] alloc_tag: Extend allocinfo_filter to support
 tracing queries
To: Suren Baghdasaryan <surenb@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 9:52=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Oct 8, 2026 at 2:40=E2=80=AFAM Abhishek Bapat <abhishekbapat@goog=
le.com> wrote:
> >
> > Extend the allocinfo filtering mechanism to allow users to filter tags
> > based on their trace state.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
>
> Acked-by: Suren Baghdasaryan <surenb@google.com>
>
> > ---
> >  include/uapi/linux/alloc_tag.h | 8 ++++++--
> >  mm/alloc_tag.c                 | 8 ++++++++
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > index dafcba2f7e2c..a96054ac2237 100644
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -38,7 +38,8 @@ struct allocinfo_counter {
> >         __u64 bytes;
> >         __u64 calls;
> >         __u8 accurate;
> > -       __u8 pad[7];
> > +       __u8 trace_on;
> > +       __u8 pad[6];
> >  } __attribute__((aligned(8)));
> >
> >  struct allocinfo_tag_data {
> > @@ -54,7 +55,8 @@ enum {
> >         ALLOCINFO_FILTER_INACCURATE,
> >         ALLOCINFO_FILTER_MIN_SIZE,
> >         ALLOCINFO_FILTER_MAX_SIZE,
> > -       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > +       ALLOCINFO_FILTER_TRACE_ON,
> > +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_TRACE_ON
> >  };
> >
> >  #define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_FILTER_=
MODNAME)
> > @@ -64,6 +66,7 @@ enum {
> >  #define ALLOCINFO_FILTER_MASK_INACCURATE       (1 << ALLOCINFO_FILTER_=
INACCURATE)
> >  #define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO_FILTER_=
MIN_SIZE)
> >  #define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO_FILTER_=
MAX_SIZE)
> > +#define ALLOCINFO_FILTER_MASK_TRACE_ON         (1 << ALLOCINFO_FILTER_=
TRACE_ON)
> >
> >  #define ALLOCINFO_FILTER_MASKS \
> >         ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > @@ -75,6 +78,7 @@ struct allocinfo_filter {
> >         __u64 max_size;
> >         /* filter criteria only; see allocinfo_counter.accurate for act=
ual accuracy */
> >         __u64 inaccurate;
> > +       __u64 tracing;
> >  };
> >
> >  struct allocinfo_get_at {
> > diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > index 262f00f2bba9..8e63f347657b 100644
> > --- a/mm/alloc_tag.c
> > +++ b/mm/alloc_tag.c
> > @@ -250,6 +250,7 @@ static void allocinfo_to_params(struct codetag *ct,
> >         data->counter.bytes =3D counters->bytes;
> >         data->counter.calls =3D counters->calls;
> >         data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to_alloc=
_tag(ct));
> > +       data->counter.trace_on =3D alloc_tag_is_traced(ct_to_alloc_tag(=
ct));
> >  }
> >
> >  /*
> > @@ -323,6 +324,13 @@ static bool matches_filter(struct codetag *ct, str=
uct allocinfo_filter *filter,
> >                         return false;
> >         }
> >
> > +       if (filter->mask & ALLOCINFO_FILTER_MASK_TRACE_ON) {
> > +               bool tracing =3D alloc_tag_is_traced(ct_to_alloc_tag(ct=
));
> > +
> > +               if (tracing !=3D !!(filter->tracing))
>
> nit: Compilers are smart enough nowadays to convert u8 to bool without !!
>

There's a similar check right above it that checks "inaccurate !=3D
!!(filter->inaccurate)".

I just want to be consistent and less ambiguous. Also strictly
speaking, compilers convert a bool to an int implicitly, so if
filter->tracing is > 1, the if condition without the !! will result in
false.

> > +                       return false;
> > +       }
> > +
> >         return true;
> >  }
> >
> > --
> > 2.56.0.385.gd3acb90ef8-goog
> >

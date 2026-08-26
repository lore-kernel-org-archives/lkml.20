Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDAE367B9B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760636; cv=pass; b=c0v3bSddEiNLHUJjBo+Xbe/hIXwHp17AHXyyV8t0cseDDvd3vMubeaWaZJ7fnBLQ9yNQZK2k0LmLqRe6uyaiNhOviEb05LHIhmdu2T9T8x6/LN1yryalAls5oTGa+deG1xRTVT7WLHWsdvWjMmMnRgk9ZkHXjWkp98c0g/aH5+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760636; c=relaxed/simple;
	bh=eGPSVYqP46xW8uRKmizGYCbJwSQ5Tsn5uNuLyAdV02M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWlSm2l/WNmEsWdtS8OncocU5i0uIhP3Y++j8fjYVIcg8UBMhr5wodgeOl8WqhAEafC92fURkqmjFKxdmTVI2QX9FmDOWlpJJbqodhcB+IvMITRLMFtPVQ8PM1X5gr7Rpfag7fapVfOzEvx2rK1SjbpC/NGFfHTIbFGMwXE3VDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl0JOEqC; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl0JOEqC"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so9422081fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787760633; cv=none;
        d=google.com; s=arc-20260327;
        b=M8Df+ChpjwZ2mca4yOyGbhrVjiZ0FWWMXUhIuC8cOjpob4f5G2mJ8sR3he2FGOSn/N
         zMeeYCnA+fJTE3loLQXl4yuQchELWbPE4lkpVH1xzjx5oUSz8dzoAEBQPMfNjBHcBnTB
         veIlAjH+RCIYPPx7LadXwr9lBVw3E8eYSb19S4h3QhvfHJfnY4gM4Hyn/TXBo6y9fLQG
         SKmj0+kAJWynoVPJMDhCCFN6vbSa5JA1nJQQXC13FHaODxkgb7f+Lu8712ZMtTjEySVx
         1Zh2KghbeGW9Y+3Qy/MK0MsIf2xePIhV1RUMlSJlnA+zUFI1G6N0oqmtuHhzYzWDP3yt
         7Y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQznmoeBK5/cc88kxGjP5MQTdq2cCbT43FGZpl36kHU=;
        fh=Q4b4Z/0vq4WfHA9Bc8B7WYx6cvQ9ZqmuHSTjwl5jiUg=;
        b=ARbqpp1AkTYE/USQpJNF8CUkzcoJRvWsRD+UxxeNxsPv5ZHg3NGDnRARqrQO3DYLAh
         +vOgp5LHiIAaGgJuK84YzahW2MFxAED/hqw3nfZT6/ajdLDR5GKXeSyx56pKoO6VPp7W
         8Of+fzXzXvQd6CLAOOTJ6/UlM9EkxzsTpv7QuuV4kGOwbw0N9USFe+29Q/+qEPPSk1To
         GquFt9ey0A6KkR4zc3DafmsaQTZuj5cs/7/+k751UvX8g6CsrMkq97gyw0o+8F7zTG4A
         yjb1mehZ+Bls997D6dij4uQflr+giuiEd7phkKgKFZm43iK5n2/KMzvylQg1TytcnWgM
         icuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760633; x=1788365433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQznmoeBK5/cc88kxGjP5MQTdq2cCbT43FGZpl36kHU=;
        b=cl0JOEqCKklTTbIfAhB23eaj3j3gAf6HhA3vT/VCQTm234wqd9961cDzc0oJWfqQjy
         ZHgyfWAy94wehCXdO7ov1yqE6nnRPL0yDsDjC2+u4pRe5FX6u1VATKa6AmDz6P8PnFBr
         eVo3EvxV8YF72CTF6mlYvVXYEtXbwhgV9Hc+QjfGBlw66UsJdvfY7tZ4DDbKS4H6M/xi
         /NKQlCtRlq234vYB83vVhbmsPJXRzV3DXlBsZIvSBQDnFFwc46JZ3GPkzqbA4T4Yc6kZ
         ciQQ6qAvLnuKe8hIo7vOZ9oKFyuV2FjwWCYQ0ECQNof1HPUkO7Nj4qvRFMhxkc38CE6M
         wofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760633; x=1788365433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQznmoeBK5/cc88kxGjP5MQTdq2cCbT43FGZpl36kHU=;
        b=Y0jmRgfitNceqUIBXObBOOhlqvf47z6aKCxW5b31qtkxvPBQbDRYmINB0Ke3OiBnGo
         3gbD5+cjPbyODGoyaXrbXpwhk0ciCIRtdz5kdgRa56r+KYNjVtg+jFIh3hYrwT4Yr4iQ
         3UI9yKyXjZhtzT73GtYp801hbdjAB/krGl8UrjvaB6AAnU5i8aFGlczrSTo/LMmMz1AC
         7vcVPu/5B8jjN1ASKnID8Rt1ipZhKpkUBO6L5O2+k91bGPCdyI9r3jjHI3o0f3rqYtHU
         sRlB+nr6Nc0bYkgaP9xjOuRmfphkVK+Ht26Vwk3+BauercaeyfC7k7RMt9HpQHgF3s5H
         OQCA==
X-Forwarded-Encrypted: i=1; AHgh+RpO/lcUsUtGCRPEtYMd2eg83VzUg77Bf9DaQ18/efuA0h7KJa3i/57Qt1WMeas+Nf+sOZhSU24AuBFV4HQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kA61tWVltkm2regdIxRNSxkpUjgsjIM5m/Quju6UG0oVmYIO30
	CvAmN3L46HQdfiCsYf3UgGZNOL9KxZ7LDf8s9Vyz4xU/dUlJdMwh0zag0heEEYvN+t+dv6yN2Os
	mdxZNFhDOZWHvebvnsrl7z3VV45RMlWw=
X-Gm-Gg: AR+sD106RSEb9ZIl4XEi85GjOvJYVjUqB6gUTaNYQVEWhg2g/hamcyCXdKU66K1vNN+
	ABTyVIzxEfwiKmw2yVKTXCkn9l/nlS4UYNfOUl8m32MvXI4DaoPf3SxVB1M+Plxak8QOslgCycw
	37aieu38H1C821lflCpkYHWZxchjdcB2KeYCk3arO13Z1DxBD24eC7JedXGBPc7Ae0HSJAoJnj2
	U5KwVeGngdnMBmWmrZhP+p8qilaQUnfXmSlOceXlmV1FfdKVnLDDomwsB9o/SBOSc8Rx69C7fFS
	Bu4xDXDxEKM8p3YWi2canaLRcOS/ByoxO9FurC3JkXb5JMmzbEJUGJKe+qH/Uf9Y1DIT4TmVASw
	=
X-Received: by 2002:a2e:bc05:0:b0:3a1:1d3b:67f1 with SMTP id
 38308e7fff4ca-3a1fd6188bfmr19672011fa.7.1787760633032; Wed, 26 Aug 2026
 09:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-shrink_zswap_entry_0815_v2-v3-0-0171bd86a667@gmail.com>
 <20260815-shrink_zswap_entry_0815_v2-v3-3-0171bd86a667@gmail.com> <CAO9r8zNznEiz8nUTpGkdbwiVL_Axe3Sosu1L31is_8b3k_ma_Q@mail.gmail.com>
In-Reply-To: <CAO9r8zNznEiz8nUTpGkdbwiVL_Axe3Sosu1L31is_8b3k_ma_Q@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Thu, 27 Aug 2026 00:10:20 +0800
X-Gm-Features: AcwNN1V_8ciPpMDBF5u5ZIGRoKRfNwzbwc1QGtuXGNZyGNQmrfwoKifqm0e8YRM
Message-ID: <CAJxJ_jjvquHuN40Bddr1nppECOhMVO+avp9+3KM6=es7nE9Zcg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 3/3] mm/zswap: reference the pool by index to
 shrink struct zswap_entry
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:17=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Fri, Aug 14, 2026 at 11:54=E2=80=AFPM Jianyue Wu <wujianyue000@gmail.c=
om> wrote:
> >
> > struct zswap_entry is allocated once per stored page, so any reduction =
in
> > its size is multiplied across every entry zswap holds.  It currently
> > embeds an 8-byte pool pointer, even though the live pools now sit in a
> > small fixed array indexed by a u8 slot number.
> >
> > Replace the per-entry pool pointer with that u8 slot index and resolve =
it
> > through a small helper that indexes the pools array.  The entry holds a
> > reference to its pool, which keeps the pool alive and its slot occupied=
,
> > so the lookup is safe without any lock or RCU read-side section.
> >
> > The u8 fits in the padding after the bool referenced field, shrinking t=
he
> > entry from 56 to 48 bytes on x86_64.  This raises objs_per_slab from 73
> > to 85 and saves about 2MiB of metadata per 1GiB of data held in zswap.
> >
> > Suggested-by: Chris Li <chrisl@kernel.org>
> > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> > ---
> >  mm/zswap.c | 33 ++++++++++++++++++++++++++-------
> >  1 file changed, 26 insertions(+), 7 deletions(-)
> >
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 603fdc418041..3974fca40a4a 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -213,7 +213,7 @@ static struct shrinker *zswap_shrinker;
> >   *              writeback logic. The entry is only reclaimed by the wr=
iteback
> >   *              logic if referenced is unset. See comments in the shri=
nker
> >   *              section for context.
> > - * pool - the zswap_pool the entry's data is in
> > + * pool_idx - slot of the zswap_pool that the entry's data is in.
> >   * handle - zsmalloc allocation handle that stores the compressed page=
 data
> >   * objcg - the obj_cgroup that the compressed memory is charged to
> >   * lru - handle to the pool's lru used to evict pages.
> > @@ -222,12 +222,24 @@ struct zswap_entry {
> >         swp_entry_t swpentry;
> >         unsigned int length;
> >         bool referenced;
> > -       struct zswap_pool *pool;
> > +       u8 pool_idx;
> >         unsigned long handle;
> >         struct obj_cgroup *objcg;
> >         struct list_head lru;
> >  };
> >
> > +static struct zswap_pool *zswap_entry_pool(struct zswap_entry *entry)
> > +{
> > +       /*
> > +        * The entry holds a reference to its pool, so the slot cannot =
be
> > +        * cleared or reused while the entry is alive: the read is stab=
le
> > +        * without the pools lock or an RCU read-side section.  Non-zer=
o
> > +        * pool_idx (slot 0 is unused) also marks a live entry for lock=
dep.
> > +        */
> > +       return rcu_dereference_protected(zswap_pools[entry->pool_idx],
> > +                                        entry->pool_idx !=3D 0);
>
> Please align the second parameter with the first as long as it doesn't
> exceed 100 chars.

Sure, I will fix the alignment in the next version.

Best regards,
Jianyue

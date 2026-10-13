Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B0653978E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917786; cv=pass; b=Y7jQs1Ly/dDQ4teGUMYIM4Gr/8v7R02s9G6JQGLRnv5HtKK9c1R9838v3Fcw9zJb7nf2OsD/B0bIlzxWGeZjtH5ofQB+AtRKZDKCKaiMdeOJNeE9SlusB50MDQP5s0Ur0AwaYZqGXUTLjWS3SNUFDQ3Xyt5nSDSDl2wJX7CEUt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917786; c=relaxed/simple;
	bh=LLB9570GZlD1TXnEKLc4OhUGv79OtGVAQzod4N7fKsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i80kqkdkyXf0a0pWwhGHctlj2+gYdenh8sVKSTeRyNkcOr9CPObLxQexkGAyRpW0zz//Skds/uiQEUDxii6lkNHK2Y2uZDAJBZ3A8+FU/PDfUVzYLbv2ZEbf6W6A3zJDwmCzR1+8pmEeS9bpt9lGLfes63GUY9DOAj1c7Wmn3WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8BArl6u; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8BArl6u"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so221079a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917783; cv=none;
        d=google.com; s=arc-20260327;
        b=LoIcLd0pDLzsdTULrVCkmanjs7zaWrce11/UuuflG9BwYRsGGDB6Y4KOADrAeHK4Fb
         5pRI7NnwUcXvcCwAgTrBM0mXDAFHvotmrRkxnnzuyMOYBKdIPmI8QYUERhTYinwE+suS
         3R2vnTeQIaoYjThL7x3oMK7udZ1vwJ+JD4CIYAjCO0uZvcX8nTd6PTH01CVq+LhF6oDI
         zA/H/FlGUsHdwdBD2YhaLf8LS+JgD9glvnqi1vg5dD4rE4Tvi15XfpPl/NQvIMrQ7x73
         f3RmNl/eq4kNZ39+GebMZlgiDyskdy5BikoRn42LWCEUYBJPefVrKsvtvmxVwFLoe2UV
         b0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+LzBHj4tBeipNi+QlNyJEU/f9POJz901L8zWPKLrZks=;
        fh=55UoXtIdiSo/HYI74+i/0mTZDocxgJLvOLtnCCz4DJg=;
        b=lFD8wkE5dTONODbGR7+FISuFVV0WpjMTquVtKZXu/wBW0JGknoR5A4itxesCo89b+3
         LGtQMTlwURgbkGfP4ZnP6mzx5XhZ7BuTNC1lCk4i078pSFK7HkIRLhiuPKmt+wRiRgt3
         xBKMekJyaQAbGA+C0IkQ49TFD0H8Bv8KerMJRcZGXBea9nYUV2TdzmT3R51KWD+sVKSu
         ZUBjmUjeGrDhHM3A08S9jej96ZHVstfo9L1EHSQjuMdMWPbrZttoBXeqvjPCgrKAobph
         oEtBaU/aMrfFWp3M2IIywDVHT3qsq9IulQOm+PcNi3JoA0Tf1vbtVYRMTRETXY7ok2/Z
         k3NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917783; x=1792522583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+LzBHj4tBeipNi+QlNyJEU/f9POJz901L8zWPKLrZks=;
        b=R8BArl6uczXvhDSJFvKJzx+e0sJApDY1JD/zwODaRzHR85VEsFe9+4yUK/cMU+JKm5
         K/ErDhzw45OTxc879PyXn+6H70CsguNr6vqk58Laxx7e26J662oL3Lyw7LedljPdkOgs
         WdYoQbnTGs8WAO4bmQJO6nHcGI/dmJM9Jlm9YUPrZvbgWZFmWpIGCR9E2rdzXCGqD5en
         wFz2EFe+PapAKzEx/J+iF974D72zCGLtUjTD9FYr+K/hpP/23igM1zzp8CEvLY/xSCJG
         oKleHMY5SBaC9hd0mqQbPOgqCX0zNk7me984SUtSdMTwlyIgYSbscwzOcZVudRlVuZFt
         7yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917783; x=1792522583;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LzBHj4tBeipNi+QlNyJEU/f9POJz901L8zWPKLrZks=;
        b=BcmExpxeEcR25FeOsCtb4vKNc03+QFLTcRW3Yw5C6sjYT5g5WSS21oKOwDAeqIAlT9
         l+yCW8CsnKMIPPkbCF4zeMRuHzGFLW8SeUi1qW477EwH6+9T0CtAo+Lk1sQoVSWFE+3l
         W+CpdzD+Pz2ObvT33/GAbke+Cr2EnI0XDRYRDdz/iqYvdbUxZLpeCxOQ0uQZjvWvkKQr
         h9ex49v8sCXFBbYI6HbkUTmcyeaDMuw69fIFRBE8AXtrOGiRi+mrKyMgu7AUtZRg+F+e
         3LdOv2+ubtqtXjGnFI8sfgEbdXqt0Htu0zThdmTrMIlWzDw0PI1lVWtym9lATS6EFzuK
         +qAA==
X-Forwarded-Encrypted: i=1; AKwUvByXFl8tx4qJdrpP8RQvFn3/O6X93VhwKvqS0uCRw/euheKShLe/IEr7cx40+VXmne0eLoQ13UoIm1Phk+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfRwlaO4iziiYUbeAQ7lug0IcGxvQvtaLetTepRJfzst64ZQIX
	R+NSPLFB9SnMx/T9HbeC2XvktIdFknDAo28Nnq34tCs0yZRwyw+xwnIQNwqnrMj+/haa0W7c7GL
	E1byVW1dgXOcalZZI7Rul6FnK52m0aYY=
X-Gm-Gg: AYBFou0uslsXIBarqDlhrVyrkH/stSj19zdR+wJM/3gZWOV8cN8Di464eJTRMWuBKlQ
	pbUty3IrS1CBrQRRZjlWzrI9zfBvizkv8zRUMFxvo7qRuSS1zgbIFb09w8tmtmLUm/TCZ6g/ht1
	IPphOBdMo+zOBW3LVjIj9cjWZycHyBY7b0pcujyidUcrvEcPYaNooFFgKpJ/hJ5gzsKMM0gBiXG
	0vFXDxfXDKnBv73pZYtY45NYt1G4R1Rh9Kvi3W2AdPNZ+D4B8EEk0DFp4jj85PU5mrY1enbPdrl
	+Oif566KgeETNKcTrh2SBGmL3RuhxGCZANvW/3mXhXYqaR+9c61fcGpAOyrGg6a1GYTS4OMs8Vt
	sQRJXWRYb3oyv
X-Received: by 2002:a17:906:2081:b0:c33:ca5e:8ddb with SMTP id
 a640c23a62f3a-c33ca6dd72emr527062066b.28.1791917782642; Tue, 13 Oct 2026
 11:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAO9r8zMHKmAQT8WBAd+kkQEjETVvyHhfbESzKHpXXPQJUB9nVw@mail.gmail.com>
 <CAGsJ_4x3JL9JW2cBXPo0j_8-2d6XQQGSpBAkSf-8Hw9N=0o=6Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4x3JL9JW2cBXPo0j_8-2d6XQQGSpBAkSf-8Hw9N=0o=6Q@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 14 Oct 2026 02:55:45 +0800
X-Gm-Features: AclHuK_93vX_-JC5eTa0q4jdwYD54NRJQ--m2zl_el2v0JWsmNB2dSzrEZ0gUQ8
Message-ID: <CAMgjq7Dfeh9xV+qbooO_8y00WbCuuEvRRa-62d_YGvprVY+WPA@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Barry Song <baohua@kernel.org>
Cc: Yosry Ahmed <yosry@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, 
	hannes@cmpxchg.org, nphamcs@gmail.com, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, chrisl@kernel.org, 
	usama.arif@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:57=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Thu, Oct 8, 2026 at 5:37=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
> >
> > On Wed, Oct 7, 2026 at 8:39=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> =
wrote:
> > >
> > > Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchron=
ous
> > > device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readah=
ead.
> > >
> > > zswap is the same kind of in-memory, synchronous backend as zram, not=
 a
> > > swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> > > swapin_readahead().
> > >
> > > Here are the results from bypassing readahead for zswap too: it was
> > > measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, sh=
rinker
> > > off, on Sapphire Rapids and 3 iterations.
> > >
> > >   768M memcg (sustained swap thrash):
> > >     metric                 mm-new    + bypass    delta
> > >     build time (s)          405.0       341.7    -15.6%
> > >     zswap-in (GB)            79.5        53.0     -33%
> > >     zswap-out (GB)          144.8       115.6     -20%
> > >     swap readahead (pages)  6.79M       0.45M     -93%
> > >     swap_ra hit (%)          72.1        89.9     +18pp
> > >
> > >   1G memcg (light pressure, build not memory-bound):
> > >     metric                 mm-new    + bypass    delta
> > >     build time (s)          177.7       176.0    ~same (no regression=
)
> > >     zswap-in (GB)            10.2         7.5     -26%
> > >     zswap-out (GB)           27.7        25.1      -9%
> > >     swap readahead (pages)  1.07M       0.08M     -93%
> > >     swap_ra hit (%)          68.6        87.2     +19pp
> > >
> > > Similar gains were observed on an AMD EPYC 7D13 host.
> > >
> > > The gain is from no longer prefetching pages that are pointless for a=
n
> > > in-memory backend: readahead inflates anon residency and thrashes the
> > > page cache (file pages get evicted and re-read), lengthens each fault=
 by
> > > synchronously (de)compressing a cluster of neighbours, and adds
> > > compression traffic when those extra pages are reclaimed.
> > >
> > > Bypassing swap readahead for zswap therefore makes sense.
> >
> > No objection here, I am just thinking about Kairui's LPC presentation
> > about how compressed swap can (in theory at least) still benefit from
> > readahead: https://lpc.events/event/20/contributions/2421/attachments/2=
116/4689/Better%20Anon%20(Swap)%20Readahead%20(2).pdf.
> >
> > Seems like a big portion of the fault cost is still outside of
> > decompression and can benefit from readahead, but that isn't the case
> > today. I assume any future improvements to readahead and re-enabling
> > for zram would also cover zswap?
> >
>
> In that case, if we can develop an accurate readahead algorithm with a
> high hit rate for readahead folios, we will probably also need to map
> them at the same time, as proposed in [1]. For example, if we readahead
> 4 folios, we should map them all together in `do_swap_page()`.
> Otherwise, the cost of future minor faults can still be comparable to
> the decompression cost. Readahead alone would therefore increase the
> total work, which can be quite significant for synchronous I/O.
>
> [1] https://lore.kernel.org/linux-mm/CAGsJ_4xM=3DWnFO-OuwVude-DQ_UkaCi_zF=
_bXBP9Li5+ZPNy0VQ@mail.gmail.com/

That's a really nice POC! We should do that IMO, maybe with better
support for (m)THP readahead too.

We first need a better readahead policy though, or else unmapping
these folios might cost even more.

For the readahead part I'm thinking about evaluating using shadow as a
stronger hint for readahead after MGLRU-FG which helps distribute the
folios based on frequencey more evenly among gens, also with a more
proactive aging (async aging, or maybe lru_gen_imbalanced as Barry
once suggested somewhere) so folios in the same gen with same freq
will be much more likely to be reused. Or something similiar to file
readahead's PG_readahead based readahead. Well more
experiments are needed first though.

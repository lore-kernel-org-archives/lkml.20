Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C74C7532
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367722; cv=pass; b=SfeKmBU0+2Gz6idBc03XIFHjrYBQu+aFVmq8Rj9aflsf5Hx6G3Eqtzd9PuNYHjoKl0CwZLg4bqis4Z7YWrQxxDRAOdYyQUIom4j1+4Gi52O39xfvrfBRf5zRDEqtoHVoocuqerC4FhitDm6Bth09cBtVcbOh3/2e5E2maLPRNxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367722; c=relaxed/simple;
	bh=sOt1Bryk+Oxa7Fxrt6mMhlSIFpbqXbl83ndSRGg9HlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtCLl2QPyNuQ0o9uwDZmWig5iNrjxIFx6BvizTv2XM8ihVVKddiz2x+/OG2IvdsF7/sS5bj6aWLp2dZ9CQvYSeo3bkZOIcZAx+q0zJ/Icjkcmc/jviW4rJElK1QVQJRMxvhua9Wol+DA4RMyrIz5lXvEBx5QjPFYwQsRVJXOJS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mK/sgXo6; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mK/sgXo6"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52faa58bff5so73891cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790367720; cv=none;
        d=google.com; s=arc-20260327;
        b=cvPnuU1FJkyi2ys5FyfDy4uyF4oA0GdgkSpKLcxkyCAouS8jxZVHYv2Z2FprFAM9LD
         25NiKXvyoO1K7CKNcjmnkGZD8O9VEHpn8zWL2mN9E6oFJLudjS9RtrLkgKcKIJhPzuWZ
         nuTTZXtT1KozljDGCmGRV7MB0b4rs9akhmJM3GoSIG0xeDaglXSFvfl2Pfc/cxrTcEIP
         oWvBIxu4VXtHUlABsJJ3OONE1PJ2j4NjRpFY25Wbk/SfbRSBXuysGl3hZceO0EKd6/zp
         dccELSCsd+eHGicLdjeERjkkiFJp+l8qjt1/TfwEjv+eiEpC0MmmTvrGEapQdQjunVFI
         2Kdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0gi+G5GK2ryrXr3Dgeum1cineZZb5AvOJsf1d2sjyI=;
        fh=cvbGjEQZJNjQinZ2qRVWf5koH6Hn6iKAZ3SX+5JTrVE=;
        b=mHpfQriPg+Z2gm6r2mokd9Ds4T8YfFYB0FbuHlV4tgMimGthYcvfrUlO18XJcW/RuU
         0Na2zHQPw+4KemufRQYDRpvU+ItR1FyzslkO0wroMCeewaZHLGFHRkdjohy1hn4xB+jK
         yV5tLupDyt+5HNxHaRgX9ZY7XPO8cDdOn75ifpIflVRVxqGM/wevPcx9rK10is+Rhxnm
         0uAOM7H5+o7CecHbZZUi8v/u8Pv0OD7LiD7C5IcsVFCF8U9YRrEYWlFtWKxPn+OcZR2H
         dxto6et9zeDBYs+SBwNDfwJpvlY2yNpXflxSbBpNpt+me6+5esD/gfaGIMaSt4a22IIA
         kxJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790367720; x=1790972520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0gi+G5GK2ryrXr3Dgeum1cineZZb5AvOJsf1d2sjyI=;
        b=mK/sgXo6SlZjzoJ1dHR5FgiJcFt47jOQUTR2uslH/t1W7/NLTR0JA2X/YCTgnLDFdO
         HDfDxPOpe2YMJuiSGzX6MEMaSr+pM8pLFEBkWveB/okQDYyTR1bvy64mJioE/lwJh3f7
         3lxJW6UhwvkyHeMPBZIO5cQltQY9UCaJ2/hM9mVqMN8YBr0a3luVTrMJGfU2SoSwbmxd
         In+mKy5hNpNFfCgXgkHIATtOTwt2n0AKsv4kEumRVZYNTxjNT+jvsZ2fZMEDb2CHt+bv
         nJSgsuctH61y18UHXutk+bcvsqYply1nsNn5QgAbScD8l1hSVRVXzd8YS34kZ2XP3rmb
         95yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367720; x=1790972520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0gi+G5GK2ryrXr3Dgeum1cineZZb5AvOJsf1d2sjyI=;
        b=VbRwYUMSad+Ke3/YlKVjhr5a+r0awWlONgVl7b96Q0y+ABPiYlKyzbTOeuskjI14UX
         T7fRiT84VX3Jc/S/Ou5Mzs6PmTxXfkvkCwRbQu33wejvyJObn6znAnQvNudLKyPbcTBF
         6PJnco+0zvbq0u7PzzOwG0PlUaiY9WENhxzAo+2QshysLEJluQeuo7RaDz18aUz21NU0
         SDReeDfoVRHdyUEljzHO7YfrgnIXuaP4noQL+VFM9fQ5lDPj6CaFp85E6bi0fQNjhKkE
         qCfx/NAAVTx25JSe2DfZegmGwje9fdm9rrKENlfJ+Y2Lb72kfalMqQQw2haWyzf7QiIy
         Mxnw==
X-Forwarded-Encrypted: i=1; AKwUvBxYkHagtnnqZ2gWpKueW3X4l252gUvwM61Vu0kbVh8rwD4sFtzocca0WFGjK8qH6evETXRm6f5PA+cszrs=@vger.kernel.org
X-Gm-Message-State: AFuF++m/u9mj5+fqXzJL3ZAb+9pdHFpmseKZl7qW8C6UlMvGcEjMWQhZ
	BHCwnmU40GuNYZbpm1a2Ob+b8NSDey3SrvYM8+4xY5qCLIyLZoMVtyYhTSB4c9SGKbuy95Irj1F
	PqikJNQARx0mtjiJnMW5YxfGjWwslAph1rriEPLur
X-Gm-Gg: AYBFou3XC+hqMHjg71LzNuXs4pzPLKWFAQhmBTZlE06CWq/1sLLElVMwSc2mqHohn9l
	ftnoNKr6xRD992YIGq+ufjfF/q+8JMjekdBACgvAoxRNi8hqEi+RHyLYGNLYLnpSQizlNY+yCLg
	ijy+KXS2JGLTJLuxmXa1quLLRhL2+gsXqwXlM4rvJsMYXh6+v/6/6m6+8APx8141nuKc6znmRXq
	s3qjbmBiKxpW4U0WNj1mnDj2aEW/AM8iolSFrTCClU3IRgsbBW1OLgvzvjdBbd4G0nLSFz1/sPL
	89o0U1c+AaeyCrBkVI1GRScDkJoEUptRRTap2q5bCkodX/quDObYplJb/JtQmTgA4QxCU7rVxho
	6n5IVfBo0nHQhIpzY+IZF
X-Received: by 2002:a05:622a:1a8f:b0:532:c8ca:5ae9 with SMTP id
 d75a77b69052e-533226f9f89mr660001cf.11.1790367719382; Fri, 25 Sep 2026
 13:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-perf-symbol-memory-send-v3-0-3e4e234c363b@uber.com>
 <20260925-perf-symbol-memory-send-v3-3-3e4e234c363b@uber.com>
 <CAP-5=fUumhE1-DT3a-EBYQADy6Az=nViGmz==n1ocqXiXAEQjg@mail.gmail.com> <CA+w=M=RJYSCuk1SoU+OR53Odf6OyKMsjDMUAtaxSmD_4Zyq7oQ@mail.gmail.com>
In-Reply-To: <CA+w=M=RJYSCuk1SoU+OR53Odf6OyKMsjDMUAtaxSmD_4Zyq7oQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 13:21:47 -0700
X-Gm-Features: AclHuK_Ev_ywUg_xKDVZaUqkULrA-zicLebaCnXdtLmoik360d-0oCFEYOm-qog
Message-ID: <CAP-5=fUm_MYpz+K9qc9T-=Xy2FT2=FRgWpkmQaZvqrO1tuVYsw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] perf symbols: Factor out duplicate symbol selection
To: Alireza Haghdoost <haghdoost@uber.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:55=E2=80=AFPM Alireza Haghdoost <haghdoost@uber.=
com> wrote:
>
> > > -int arch__choose_best_symbol(struct symbol *syma, struct symbol *sym=
b);
> > > +int arch__choose_best_symbol(const struct symbol_candidate *a,
> > > +                            const struct symbol_candidate *b);
> >
> > Given you can change this function definition and only change 1 C
> > file, is there any reason not to make the function static in symbol.c
> > and move the struct symbol_candidate definition also to symbol.c?
> >
>
> Thanks for the review. Patch 5 calls symbol__choose_best() from
> symbol-elf.c: the lazy index resolves same-address duplicates from its
> index entries, not from struct symbols, and uses the same policy as
> the eager loader. That's why patch 3 makes it non-static.
>
> struct symbol_candidate has to stay in symbol.h as well, because
> arch__choose_best_symbol() takes it and powerpc overrides that weak
> function in arch/powerpc/util/sym-handling.c.
>
> I can say this in the patch 3 commit message in v4.

Thanks, I saw this when I got to the later patches, sorry for the noise.

Ian

> Thanks,
> Alireza

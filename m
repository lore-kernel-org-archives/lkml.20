Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A7E1F938
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985188; cv=pass; b=GqNKT8Mo1BzZ8W7oB4pVY0tRIO3kymJO4Sq7v5lhn4RAMQHD7S87TwZVyo+00qDKmzphY+me6zN0ZdszOuACwejYKLT9UCnIzUsvqrfgoJ7jcb9aNRFpsTTlJhzzlbKmr2QGi2bem38RYzYqiTatNiKVFmUKBUCIVWkcHnp/1TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985188; c=relaxed/simple;
	bh=TSRxsIng2LPiyM2hNH2bG7x0/DCnogvfIBYewgQ58xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6Ws93fq6bvlvGVFsuKGZXWQ4/FHHIUvwb0Y8u/U/Sqol2F5PKgVLZu1+cAb3q2QFeY+7p+3/CWtgJePVXXzHTKjtWtu7HhJCkSGWZOfqspJfdXrYMRNJZ/O3yAplW8eVePA+USHG997VQcFIDo+L3yX8i9AFa4QkV5BZ6Vx+6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=q8SF/OHS; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="q8SF/OHS"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d881so45810d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790985186; cv=none;
        d=google.com; s=arc-20260327;
        b=OeixCT2nlhun1c6U3pCrRO23y2t3mOKATpEhC4e3Nuz5a4V1YA3JcpU0xq/4DoSy8I
         vubqYrhGh1doB7lbGheeMbs6/NZ4gYNJJNN+EuAPi1jMRZqKG3k3pnfX90tS3Im5DXrQ
         0EhtKE3fGOT+s4OoOOn5hktaaGtFEuIbjYt6MVNjeFr2ZDzLGep7FcfdJXsEMz+ECxOM
         Fsp9SEOP2E32Zlph6LWOU7G4VacWEmvE2qCtCUksvYf3BL5bgX5CodJfoPN1CQP/E4ty
         10qr/0WJ29VTN+KxTTv3xJNQTwBZoqgbKEtnaek5fT5XT8LnT8okx4jK10NkisKVWHaS
         KEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=snMBNVyodSm2QRZvcyx88wssCDSjiEt9T08zFclT1E0=;
        fh=hmzUzF+4l+FVvrQZKhXhdBF86pitGqGAlS9TXsHjEp4=;
        b=XmLFNL2/yuoZsnbavArrRzgYRfCMB2r42x7c5c4KJPbHWUdJO2oCo1Kr38d9Ne837z
         OsoJ/LMnMcj5pBAGEKRJAieZ5DQEBVS/FBgnnw2ebT2yM5F/VCg27xd4y/xvyFUqGHdd
         XxQPibFJfF0PVjbO5lB0uUvIpoGKB5jeQ9MhHWFG8Xu7Yn4B8U2xwpzacZ3r3CFnX8o1
         ACSVSl+NTN4vHLDhE1/f4QmuimxuT+p6VBK3+leGGp9KboggKRqdeNCXjLBp5DTMPTYv
         LGOpCbyYgZev4Z30PJOFEVbkuzu14wDSd92XTrqb1bvTjPrdShN+VdKbfzIIJbkGuoST
         exEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790985186; x=1791589986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=snMBNVyodSm2QRZvcyx88wssCDSjiEt9T08zFclT1E0=;
        b=q8SF/OHSdg7NbMsCsGRcn5xGocA4nDcbGLUPZoU4g/U+zDXtA6GYX2IAcp9qX/+isX
         BXDRu7OlEKrfOJnEvO+lHUAD4PBDlvxJLT5dFTYaqY25zOeHoByi3RMGDsZtZI394Yzr
         Bo/7OPSOh4ROJjEpzViryUlmyBSnwkhfX2Ql0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985186; x=1791589986;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snMBNVyodSm2QRZvcyx88wssCDSjiEt9T08zFclT1E0=;
        b=IrxcrhieP8wbkRJiGABn6nsRnUrFotDWsVQpMWw3wMmxZcnFoogOM8f8NZdO0h+b0A
         +p9e2NMPMUuYYIsUFW5+5VtUANmecq7GL6+jNaEz6gm6NqUFvR9IyC9OJjbQXR+vXvh0
         scin2iYcwbFO1nia0PMPUvVpxzfu+4vpJebH5DUzRFfSf/yGVRLLPPr3xEIakle2K8N+
         h1xddfzCJbrWBcuNskSCmmh+k40iF0BNGm30NxY6mSRtnPs2XzJIflPRFHJKwrVqCrJt
         8ht9wSbjzbpjiQ2q0J9/dhbbjueL3tgOD+Re7s1/cYmPyBeDHkjzC2gjee11UFa95RfR
         j9Lg==
X-Forwarded-Encrypted: i=1; AKwUvBy6l8MzLlNmjAo2xpA44t1adPoPwY/JPgjqm6CSbOOFVc7OoBbOEnsPVu+AgIcmhPwrsezUBykCPHrMc4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2lIJYY0xPBXhA53+wWkZuWSq0oVcUBnEtBgHSEiu78zuwc9DQ
	HQ0W0C1sEyIESJnJ93znqrTuiTNpdr4KX9Yqr5nWDIc/LtmxS/ZBNOd74W2mazhdfK35yJjRxS1
	E5iOb9nL7NxYc+pKjzra/8e53W5ENhkBizCxoh/Mz5Q==
X-Gm-Gg: AYBFou2M2bogfkS5LyKqnu2Jr4x4fMWHIiKz7YZomszqZ6dkhbOtIiE7qs/trjzI83f
	AFmJ701pdNPSJn/wAMTL3qF++34wt0cnwZLulq11Fr6gcV8F0/xP4jFOqEABUfZBu4XMP77zXI8
	i+TI2Yxbx4b67wb+1UwGPPsF+BkFQYW4edMW4Pk9+S8ixFWOEOPE/DrJkA0ZnVBefJFx4N9lO1U
	W9pzZf3PAkWad2f8uSbJC0jx8CQ+ptLH7XWGwECr+X7z9M6BWb13WjfAAittOYOHy/WVx6hg6oy
	Hvh2tmwhmboktWg8QAa+bzx8wBWBRYen2d7t3byrYtvtYrn0BsQ/FyMIVinGaK2NPSv5VKvAT7a
	ZFA15xc6KMl4=
X-Received: by 2002:a53:c407:0:b0:671:3843:62fa with SMTP id
 956f58d0204a3-677ac0ca3a9mr1478803d50.84.1790985185963; Fri, 02 Oct 2026
 16:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-perf-symbol-memory-send-v4-0-0a592bb2539e@uber.com>
 <20261002-perf-symbol-memory-send-v4-4-0a592bb2539e@uber.com> <CAP-5=fUMvUU=kGkGej4FSTYAMjO_ygZ5uQ4pdb+5NwivdjMwkA@mail.gmail.com>
In-Reply-To: <CAP-5=fUMvUU=kGkGej4FSTYAMjO_ygZ5uQ4pdb+5NwivdjMwkA@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 2 Oct 2026 16:52:50 -0700
X-Gm-Features: AclHuK827T4jon6f_COBhtcH9C1xH434yiGa8Buid9-rGjvKkgkVXDkkQWBvBzE
Message-ID: <CA+w=M=QL7TrqAhd1urQg2BEj2jTxLGU4aDWku8OuF=c1Tbxeyw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] perf script: Add --lazy-load-symbols for lazy
 symbol loading
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 3:39=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> > +
> > +struct dso_ondemand {
> > +       struct dso              *data_dso;
>
> Could you add kernel doc for dso_ondemand? I believe it is keeping
> state while resolving symbols, but the name makes it sound more
> persistent.
>

Yes, will do. It is persistent per-DSO state that holds the compact index
and symbol source used for lazy address resolution. It remains attached
until name sorting materializes all symbols, or until the DSO is destroyed
during teardown.

I'll add kernel-doc documenting its purpose, lifetime and locking. I can al=
so
rename it to dso_lazy_symbols if that makes the lifetime clearer.


> >  struct symbol *map__find_symbol(struct map *map, u64 addr)
> >  {
> > +       struct dso *dso;
> > +
> >         if (map__load(map) < 0)
> >                 return NULL;
> >
> > -       return dso__find_symbol(map__dso(map), addr);
> > +       dso =3D map__dso(map);
> > +       if (symbol_conf.lazy_load_symbols)
> > +               return dso__find_symbol_ondemand(dso, addr);
> > +       return dso__find_symbol(dso, addr);
>
> Why not do this logic in dso__find_symbol?
>

Good point. Will do.

> > +/* Return the number of entries starting at or before @addr. */
> > +static u32 sym_idx__upper_bound(const struct dso_ondemand *od, u64 add=
r)
> > +{
> > +       u32 lo =3D 0, hi =3D od->nr_sorted;
> > +
> > +       while (lo < hi) {
> > +               u32 mid =3D lo + (hi - lo) / 2;
> > +
> > +               if (od->sorted[mid].start <=3D addr)
> > +                       lo =3D mid + 1;
> > +               else
> > +                       hi =3D mid;
> > +       }
> > +       return lo;
> > +}
>
> Would the upper and lower bound only matter if symbols were
> duplicated? I'm wondering if we can use bsearch?
>

Not only for duplicates. Lower bound finds the first start >=3D addr, while
upper bound finds the first start > addr.

For example:

  outer: [100, 200)
  inner: [120, 150)

At address 130, a range-based bsearch() may return either symbol because bo=
th
contain it. Upper bound selects inner, and at address 160 its outer link le=
ads
back to outer. At the exact start 120, upper bound is also needed so that
decrementing the result selects inner rather than outer.

Duplicate-start aliases are normally collapsed by sym_idx__dedup_aliases();
they remain only with allow_aliases. The lower-bound callers also need an
insertion point, which bsearch() cannot provide.

I can combine the two loops into one helper parameterized by lower versus
upper bound and document this behavior.


> > +static bool sym_idx__from_sym(struct symsrc *syms_ss,
> > +                             struct symsrc *runtime_ss, Elf_Data *secs=
trs,
> > +                             bool dynsym, const struct sym_idx *symtab=
,
> > +                             u32 nr, const size_t *strndx,
> > +                             const GElf_Sym *sym, struct sym_idx *idx)
> > +{
> > +       Elf *elf =3D syms_ss->elf;
> > +       GElf_Shdr shdr =3D dynsym ? syms_ss->dynshdr : syms_ss->symshdr=
;
> > +       u16 e_machine =3D syms_ss->ehdr.e_machine;
> > +       u64 adjusted =3D sym->st_value;
> > +       GElf_Phdr phdr;
> > +
> > +       if (!ondemand_sym_ok(elf, secstrs, sym, shdr.sh_link, e_machine=
))
> > +               return false;
> > +
> > +       if (e_machine =3D=3D EM_ARM && GELF_ST_TYPE(sym->st_info) =3D=
=3D STT_FUNC &&
> > +           (adjusted & 1))
> > +               --adjusted;
>
> Worth a comment that this is stripping of the thumb/not-thumb indicator b=
it.
>

Ack. I'll add the same explanation used by the eager loader: ARM Thumb
function symbols have bit 0 set as an indicator, so the index strips that b=
it
from the address.

Thanks,
Alireza

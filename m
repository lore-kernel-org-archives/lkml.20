Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8787918859B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789965927; cv=pass; b=SgpLrs2yO+xWg/M8e0oAf+QMTBUYU+Ob0Y2ZP3RxaaOP0S62vI6AEmYepEbdpWR6j8TwWeQ37UXr5JiL95wjdesFvTzJOKBXSw9L7ao4IzIQ8aIR46DbL+25QvsBxT8kb1XP5WBA2ksxF2LnrE1jwBEmL+L/MT9o9iTAdRI3KPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789965927; c=relaxed/simple;
	bh=3HIETohqPRiYfSTVCCWaaA/j95DFfsx7y+xQJdoYbzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3SjSLMtEQRLYTXqtLg+znXRUWuwGvIDaaqqc/O3N+diyzSXZcx48CFpSQpw3+b7qPJrqRJVPOai777tLCJeidlKrAyCbpj+nADgcvsKWI+1chrSrOW7YCuL6yL6amHQrAA5mUyJch2IiGJDKw3qOYuwYEfDbpY03bOdNV9gBGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=3lY+SgFF; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="3lY+SgFF"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1fe83so2086989d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789965925; cv=none;
        d=google.com; s=arc-20260327;
        b=QFTBRcdVLnPm4w8oy60qWxAis/G8r2X8PwLYGObPEbn8MfDAMmGJYWGndFIrabbwj8
         WlVUYoVsN+o+sbEf+xoH/WAsUUtxHBg5o5aQPTyi0MDHAmRkBNkMwQkcorTj57ztSGyh
         KTV58Gj1yeVDYPTQEony67WvWMeEh/zXXU5m3QJrmOF+2AFQkkXwJ61qjRBi0isfADMf
         gm7QuuwP5+UlPlNZ/ki7+D+f0EiqIfVNmZL8d+Tss/7OT/+UtPjv9tEpyLRqLDgQNmJp
         7YsVTr1gZ/jgGLW2wWjrrmfH54rC6GFlYSNHNaMFf1yJrbYZR7ShaV2nzf8Hy36V86MB
         S+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BI5PV8JEsmgNBkZ9uF5itWDVqgLrnZZn4wXuURr5w1k=;
        fh=/vbcQg7W21J9JEfr/w77E6hba+b3bEKgxgTuvAcqsSc=;
        b=K95NBDZ1/rCTsYyipzPdkskHaZ4SFcAY9p9ZrfV9yooXa6c6NIL2Bk4/E1/fqmiHLe
         AlSKrZCMUMk6QxPrT/aKvAsEFHfOyK7jKHb+MUK4hwTuP92EO1X/rHKZgY7qBvB+W9Yz
         sQgMzPb3nDDDAwMs3sYX25ORR59WY6p8KizBHR80Q/yj9kmJz4U2pVnis19fzCFIH1d3
         81Aa0ifXTVU6AFIUseIpnpyQbrtbc4p4azqODIkjpRm+eWDRKgoDb/FeqaTSAc29M0lI
         s6WWR606plRu7nMH4kPK/yFgoLwz1TLPUxki2h3pj7ZtLDXg2Ic79iJpdN8UckinRte+
         ICnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789965925; x=1790570725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BI5PV8JEsmgNBkZ9uF5itWDVqgLrnZZn4wXuURr5w1k=;
        b=3lY+SgFFQBwsvGrfy8CaWjC7ilWULy1BDuOPv1rEK2ho9plmgQOumNOHBiIIJieF9Q
         vx30netqkxm/DebN2WnRLLCYaPK3bjwJKsVZhD+f39WRgLe4sj5bQU6G8DWRNrqENiQi
         muZDpormgflcF1kNGUgwShoKt6nr0qjXyoW94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789965925; x=1790570725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BI5PV8JEsmgNBkZ9uF5itWDVqgLrnZZn4wXuURr5w1k=;
        b=cbWhGF46SUr4KT6b/yrByW+aK6vLVlyES2Mue2N0ZaVJ/oOAcSguIGyWwRwrUGHbp2
         AEC9xT60LyvFhCTxr1wsHtrRyxpOB9cNu/peUSmG0RqHsVl3ZKK/A98aSdRkCaItnqsE
         qj47F0NXxbp5zdulK79G5oPul0GiFaXq9SspHXhXxzujEONnHGQjr1iNCrNvuFXNUCTM
         Ch9hxj2w2WMR4JbD1k9S7I4HdShUVQCKOXU7jAvYgeuc4Hmepf7gK3cXY5r+QcCkMTD0
         YGuQYmsFchFEmCrZcseGUYMIjz5EjzUYPJ25JMMTuGWlk6qY0aJQu6uC8TSOlvN2u1EE
         wXcA==
X-Forwarded-Encrypted: i=1; AKwUvBzrf+IlnzOq7ZIgl/bD1OF3YzP/rwsjuQH6lJ9iTlX36Qfgceo+0RuqQtPa/CYcOe8RqLVOm5z2jijb0Ds=@vger.kernel.org
X-Gm-Message-State: AFuF++nIPvg4UF8KuGgrh2hUIZ/CiQJ1qOZe+jBeH0rpAWcFgTRY86wC
	qs04XARm9Fitn4J/lqXjQiWEduYhfp8ScYO2IEssHIXHTMor7xYT1jqPY/2MTi+MYOcqbS7Jh9E
	4t2mxWF2uUaE6zN/Vv9hgWWO4faNVIp++2mprDzh4Xw==
X-Gm-Gg: AYBFou2wXfQFm+CtDuzhHE2maTWkmQfKZRUbq84JAu989wJsZwTL1ZH4sGcCtRbsYeZ
	6LOWVNEAm3sdCCrXiJzyXsJQlD9fL+iDk3GR8SjAsQ65kZNv9Anwvoy/ZxQwn18D2OgkWpfN5Ur
	msW3KFe93u2lS5Rr0Mnrajjv4GRZBnGkGBmcZM3KD6QH17a11LH3fa4ViDE68jPlvDcRnz0G3sC
	8ad6pdBdYyAXw2hD+Wgq4Wj/d0DfBMZIUpbQP0Y35aHq5IiTDG+mAYw6Uw/2y5yiCuJ4cSOKZ+c
	hEaBElZwFnR9VeJGVLEhU0sQgIOa6ssbvzwKdDtC29vW+F7008GDeyDTs5iZFkskgPPHWQOxtx6
	PWTlmw/nIFb1d
X-Received: by 2002:a05:690e:806:20b0:671:631:785c with SMTP id
 956f58d0204a3-6717fd9b0d7mr1841359d50.57.1789965923516; Sun, 20 Sep 2026
 21:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-perf-symbol-memory-send-v2-0-495b8f00ad7c@uber.com>
 <20260919-perf-symbol-memory-send-v2-3-495b8f00ad7c@uber.com> <arB4G744iWiSPAnV@z2>
In-Reply-To: <arB4G744iWiSPAnV@z2>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sun, 20 Sep 2026 21:45:07 -0700
X-Gm-Features: AcwNN1VO_qCFY9m4mP87ZE5UPrksR7jfkJOOvczZnZ-njyecDFIgbzlRdTw4DNI
Message-ID: <CA+w=M=R-i1+8p7SDLueMHV8Fv5yupXR+ongVCbeAKGyq8UjsQA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] perf script: Add --lazy-load-symbols for lazy
 symbol loading
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +
> > +     if (!symbol_conf.allow_aliases) {
> > +             u32 out =3D 0;
>
> I think we agreed to factor out this block of code.
>

You=E2=80=99re right. I interpreted the earlier request too narrowly and on=
ly
factored out the pairwise selection policy into symbol__choose_best().
I=E2=80=99ll factor out the complete block in v3.


> > +
> > +     /*
> > +      * Keep an exact-path data DSO for the symbol source.  This may d=
iffer
> > +      * from the runtime image (for example, split debuginfo), so usin=
g the
> > +      * primary DSO's data cache could read an unrelated string-table =
offset.
> > +      * The standard DSO data cache manages descriptor eviction and re=
opening.
> > +      */
>
> Yes, it's a known problem and I hope to address it soon.  Can you please
> make the path handling a separate commit?  I think it's an independent
> fix for split debuginfo.
>

Ack. I=E2=80=99ll split the exact-path DSO data-cache support into a separa=
te
split-debuginfo fix and have the lazy-loading patch build on top
of it in v3.

> > +static int choose_best_symbol(struct symbol *syma, struct symbol *symb=
)
> > +{
> > +     return symbol__choose_best(syma->end - syma->start,
> > +                                symbol__type(syma), symbol__binding(sy=
ma), syma->name,
> > +                                symb->end - symb->start,
> > +                                symbol__type(symb), symbol__binding(sy=
mb), symb->name);
> >  }
>
> To reduce the size of the patch, I think it's better to split this as a
> separate commit.  Please consider minimize the patch size in general to
> help reviewers. :)
>

Ack. I=E2=80=99ll move the shared duplicate-selection refactoring into a
separate preparatory commit to keep the lazy-loading patch smaller in v3.

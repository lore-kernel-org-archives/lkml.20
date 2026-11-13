Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587655;
	b=ij3l53/Z4GhDTgL/f4O+U1T6os431hDLuihDEgMVb224EFBBwvyP+4v3JZ9w/SwaIaHv
	 90virIRIousdccPoM/nd208aLHyzJ15Vbuj/T5vrrDtjZbqUPXscB9efJP3sOXuXcSNBZ
	 ldtJyU0Cn1k7h9PdCIS0Olvv1a+rk+sE3LdyXnSNB4qK0QVGcvoDvwVrhwyPMJdpTd9qK
	 McOT7/vB9AEQ+XGbLMOuJmzoz9zgLQR/zAIv/YC4VeA6X2Vd0K9Y9XL0BbPXI4Ubgfesp
	 s/+aNY0NEGKsD8W8C8F4VN9lHTYoJr41+IIMcaAgmrQ7e5ZGbpLb0tgpsmUaGdBtkAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b7eNSuyQa1tFtsvn3toNo5OxAf5vVLIkRrt+TsETnhM=;
	b=pCvQNtVGkuUb4Rj+uvxKEah0K6l4BSrCprP6Oq1K9Searjp1BGLZmSVHy5FQdpoEBLjW
	 oiDXR7RIgX/iYyA9EjACuW6owxBoq8MJW+N3Ffd5dgJMzAgKOrpgTdOpQYI4Y64SvjmCY
	 0zP9ouT9SH59SlWLYbnrtwQuaOlZKAk4DegqcR01QoOZc4wi9HnyI2nupV2ZZ2DLJcU87
	 SwgVRQGms2s5t1WXFXSQEj+q/Lh4AHuII/PGvN3TleomAQXqix7X9EgfCpY0kfrQ4wMte
	 LtmxGyOTuGydk8aNtCmbRMOhV5kEioohMaEC3JSFbsnV24qUM8/S/eDpm0t+q3DYGog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mtbbepee;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9125606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9125606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mtbbepee
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54492d8a988so458261cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587654; cv=none;
        d=google.com; s=arc-20260327;
        b=htLdLjWAUxcQ82A3JIgc0UO4kYpSrOSJESrWvDE66zFfoQdkzNLwST/DCrr0drYLMp
         Sa1CgSORugynZTOG7GOaK5Tt1wj4kacQ6+BG3kIKm3jCALfh7HkxQSib7laRQDDpHNgt
         dtUAgmPgJ/roRN1OPrYTGXaj3GNTJ3M3zLyXH8eo25JqzoVwkDHo7TDiffWfaPUCDDwa
         Pw+ztEWAw9Su1jiqOmgYxtzR+Ucl4b1bC5d1tAtLTmJjamaSX6abgNA8Kqmb242bw9hh
         +QU48HTwd6r0hLzo9335tL1bSxtAsYqdewFT+i/RxB+Ez/zQ6pO75s+BNP8NNQYgfEq9
         LXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b7eNSuyQa1tFtsvn3toNo5OxAf5vVLIkRrt+TsETnhM=;
        fh=gjYfphgMde0EP4cGD1uLyzgrW8wS2Zn97fmvLYZyC9g=;
        b=ADTHhk/myJT6+w+J2LanTgLKOr/7ggrabibpNxu7zc8QFZXeLqpG+TXyKRVyBZ1l7f
         0yMe43yHOaahb0IMB+kSmYkwRrAiiiZhCrldtkS8KhZUO984Q2TWNTsx93ZZYc/wiW9C
         /Dk+d0ckERYElRj3XU13cPZJTzzFtYqa8Z7xyQ2dwC2N9AUlf0QyS/7deGCOoiUBkA1z
         Bk1s72UHeZzSpSOr63oNm/JcG+5zWWEcyYcgjsSNsbWA0BtBNp09airhcErB3OcViadI
         KqlRhgN17NOh/aq0S/hGMZDCte+8zWA/N0M7oZ7XT366et7hcjcLPwUdFG8S91jvr+5y
         RjNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587654; x=1795192454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b7eNSuyQa1tFtsvn3toNo5OxAf5vVLIkRrt+TsETnhM=;
        b=MtbbepeeZ10d7k60k3KA4r8wO+9uBNo1Ay6NO1CPPfexW51Z6McEmtPLakjEgtm6Iu
         SsWZkQ1m/znOTYaj/z6nEhVPa+8Ey1K5NhsrMDIMPhSIB7X10z/P6NuiovCjixfURv+F
         jgsrtZWo+oME1eyUKMt4dIyZfu3kwb7DSgIYDWHi9ZcTd7GbHKWLyOWZo+iG2Hron6N4
         WsXBFaWbnQkltWHvAlU3uPaLNknvX+MOQ2opJSmwz95dClEuVWW92x2hwpESHJ1BMWvQ
         5KoszhijZJ9FT4cfferIRgnz0fJjsPUSufXo/vppPbBdelJMtL6ngROd9nbzbEMqd/S3
         Mhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587654; x=1795192454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7eNSuyQa1tFtsvn3toNo5OxAf5vVLIkRrt+TsETnhM=;
        b=jgfaS+hLQO/is/LZXWpoJVzl8zN47qLpkyVZTWHiubcOVW4urUtsCexL/QfBDUL22M
         ImBpnF4HKC54V+mACgn6PbI30TVySHJ2ANIbeOeBJSxV9zcTEMkv8ixoZRS2k3qf8PZJ
         VROqJXkU0tWKeqZxSmY6I5/YAqiKkgeAVRMw1cc+eWNeelMdi7kQMm/RQ1PBHl9tRAAH
         /mI/xCDacqqnH7sv3JjF8pdfAOoxhjugE9O20hSew3ZCiWDr1o7xwPPfbESNe5Xrg/0M
         PzFSJBgezL5didXft8NLtJ/ooIYF7rqpW7k/ItDdjBU3SgtdgwaMbk7X5dbzeTPb0DDP
         obKg==
X-Forwarded-Encrypted: i=1; AL+hErGiDrNXmmAOVPKP0B1afgGEFX9CJh9pqtvBOr872sMsLRWsVpfWOAs2hjR6xomuX2qmZEJ/vB/q91CchWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WG8+3LO0YciGQIV2tDoSaCO1DBbjc3sLqSQJGrSdu8HAVoLd+
	HZC0RdSQYlJl7j/VBKw8VtSUjLQfMpFkNzYGAvTdAO9th5nD1qcIbIT+6UO0aJsjluTefNFoY/v
	Tf+nu4CzQ5jzHp5f42sZ0KRoUICUBHmuJZ2YHtDAQ
X-Gm-Gg: AYBFou3goqUKhDjdzHGkCKr6hb+5G724CjeOir/mAHVk0ecwf2UH5wEg/41m+jT+J/V
	M09iwO+Oz31DTKPgJhRnNUm0Jrlr2Z+m9hGAxZVXd1RulS1du/JQ9aWCdPJo3exSJvXdgK83L8B
	IX/ofx1wOCQhs3kL7x+KP45q520Q7NGfWqFSWXdiZvFcmFP0FeHC5RMQ+5Fq/TwDKGWS0gV1pBS
	7AYVvvccYK90iC9JlNHJq/+ifAonf3kLB6Jt43Lfc6B3TOCVbIlGhSKaXcASveHBiVDEQ+4y5mL
	kUPfLn9ei1pChtXecQPAcntT5QRYIWdMRgHXxb17n1Un4TvLqt3ArvZ9EGsN3vmxZWBFTOWnVO4
	HoY66jOaeVyABqGxfQrX8gwbsOpmQcL4t5Jjng+Dua4F8Hgy9E21p8ifVFv2w+SbBuUs=
X-Received: by 2002:a05:622a:408d:b0:530:e335:4ef with SMTP id
 d75a77b69052e-55ad7e74d7dmr15053831cf.2.1794587652968; Fri, 13 Nov 2026
 08:34:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-13-irogers@google.com>
 <avVicOfEPnzFYChm@google.com>
In-Reply-To: <avVicOfEPnzFYChm@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:34:01 -0800
X-Gm-Features: AclHuK9OqGSk8ck1I4JLjB0pnpSD93w92b8e_EbtkFL6s6Mk7Zb6EDKfDxyZGp4
Message-ID: <CAP-5=fVq3rovyLZCKBRSec2mOtpoqQizgLmPPg4n=WEtTRTk_Q@mail.gmail.com>
Subject: Re: [PATCH v12 12/20] perf dsos: Use read lock fast path in dsos__findnew_id()
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:53=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:04AM -0800, Ian Rogers wrote:
> > In dsos__findnew_id(), try finding the DSO under the read lock first an=
d
> > only acquire the write lock when a new DSO must be inserted or an
> > existing DSO needs its ID updated (checked via dso__needs_improve_id())=
.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/dso.c  | 16 +++++++++++++++-
> >  tools/perf/util/dso.h  |  1 +
> >  tools/perf/util/dsos.c | 10 ++++++++++
> >  3 files changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> > index f0e02062c09c..4dc518f7cb7d 100644
> > --- a/tools/perf/util/dso.c
> > +++ b/tools/perf/util/dso.c
> > @@ -1685,6 +1685,18 @@ const struct dso_id dso_id_empty =3D {
> >       }
> >  };
> >
> > +bool dso__needs_improve_id(const struct dso *dso, const struct dso_id =
*id)
> > +{
> > +     const struct dso_id *dso_id =3D dso__id_const(dso);
> > +
> > +     if (!id)
> > +             return false;
> > +
> > +     return (id->mmap2_valid && !dso_id->mmap2_valid) ||
> > +            (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_gene=
ration_valid) ||
> > +            (build_id__is_defined(&id->build_id) && !build_id__is_defi=
ned(&dso_id->build_id));
>
> Don't we prefer build-ID over inode?  I'm curious if it needs to check
> existing build-ID is defined first and return true.  Any chance it'd
> overwrite a build-ID with an inode?

struct dso_id keeps the maj/min/ino fields and build_id as separate
members rather than a union (unlike perf_record_mmap2), so build_id
wouldn't be overwritten in memory, though setting mmap2_valid did take
precedence in __dso_id__cmp() and `perf report --mmaps`.

Agreed we should prioritize build-ID over inode. In v13, I've moved the
build-ID checks ahead of the inode checks in __dso_id__cmp(),
dso__needs_improve_id(), and __dso__improve_id(), returning early when
the existing DSO already has a defined build-ID so inode metadata isn't
added on top of it.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > +}
> > +
> >  void __dso__improve_id(struct dso *dso, const struct dso_id *id)
> >  {
> >       struct dsos *dsos =3D dso__dsos(dso);
> > @@ -1692,6 +1704,8 @@ void __dso__improve_id(struct dso *dso, const str=
uct dso_id *id)
> >       bool changed =3D false;
> >
> >       /* dsos write lock held by caller. */
> > +     if (!id)
> > +             return;
> >
> >       if (id->mmap2_valid && !dso_id->mmap2_valid) {
> >               dso_id->maj =3D id->maj;
> > @@ -1715,7 +1729,7 @@ void __dso__improve_id(struct dso *dso, const str=
uct dso_id *id)
> >
> >  int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
> >  {
> > -     if (a =3D=3D &dso_id_empty || b =3D=3D &dso_id_empty) {
> > +     if (!a || !b || a =3D=3D &dso_id_empty || b =3D=3D &dso_id_empty)=
 {
> >               /* There is no valid data to compare so the comparison al=
ways returns identical. */
> >               return 0;
> >       }
> > diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> > index 9e38b3b69e9b..df1748763d95 100644
> > --- a/tools/perf/util/dso.h
> > +++ b/tools/perf/util/dso.h
> > @@ -802,6 +802,7 @@ void dso__delete(struct dso *dso);
> >  int dso__cmp_id(struct dso *a, struct dso *b);
> >  void dso__set_short_name(struct dso *dso, const char *name, bool name_=
allocated);
> >  void dso__set_long_name(struct dso *dso, const char *name, bool name_a=
llocated);
> > +bool dso__needs_improve_id(const struct dso *dso, const struct dso_id =
*id);
> >  void __dso__improve_id(struct dso *dso, const struct dso_id *id);
> >
> >  int dso__name_len(const struct dso *dso);
> > diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
> > index fbbf98c4ccae..1b3f8b84ed30 100644
> > --- a/tools/perf/util/dsos.c
> > +++ b/tools/perf/util/dsos.c
> > @@ -349,6 +349,16 @@ static struct dso *__dsos__findnew_id(struct dsos =
*dsos, const char *name, const
> >  struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, cons=
t struct dso_id *id)
> >  {
> >       struct dso *dso;
> > +
> > +     down_read(&dsos->lock);
> > +     dso =3D __dsos__find_id(dsos, name, id, false, /*write_locked=3D*=
/false);
> > +     if (dso && !dso__needs_improve_id(dso, id)) {
> > +             up_read(&dsos->lock);
> > +             return dso;
> > +     }
> > +     up_read(&dsos->lock);
> > +     dso__put(dso);
> > +
> >       down_write(&dsos->lock);
> >       dso =3D __dsos__findnew_id(dsos, name, id);
> >       up_write(&dsos->lock);
> > --
> > 2.56.0.542.g3ef89b7020-goog
> >

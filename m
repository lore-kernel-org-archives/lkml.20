Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587601;
	b=Uw0PlL0jPd91HhoofLe37BubI6bvaP4ZZB5SbVqd+doT9wbyLBiOXOj0mgld8FBT15cf
	 JyamJz5BG6paZwdnM8oXSFR0XBqhtr7tZvpRz3DB9iAmSSP5K1ZDz3bMokaoJaPFM/M8w
	 fM03GUKZqFWKSnzCtTfv20eUd3BSQwNB00Nj8Xc0Bz61TKT7/AOeuj5gUOaos3I1QZ4vd
	 BO4M0j55l/9umUfzgX2KX313vWiQz/nYoSSZ+3g1uKG0oc7H/1Yqv/kUDKWd0w6v1cZoU
	 eQ4T+cQ3XxAEtGr/MYs+Cp8adFZVVEkMGGdKiPJCYXerQ/sHfgU63R/GbbN+VuTnuwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AdWoW+YMAuhD4166hiUdRwKU0699eDdRXcepk33gue8=;
	b=qHDcyeW3NFZ4FAX/JP4IDxYwhHHt3dGd0I8F1YEkSkEPrXSDgp4p8XWMa9NFFIx0Bxjs
	 aqGBp/z7xZKt3Mooyjax2IvmuTZO6jc5j1+HdMPD3f+Cd6n0zDuAIzkLit36wAUqEfKy5
	 hnqDHaVeEQsFksseveX0EiY/NJ0icjjly1zjt/Po8352HSpKQcERWxdeQzyA5EGoFOb6F
	 JZ5/MEg0XhaScxVSHs0PZMKmioP6+Q/h8imxXRfbDyYIVeVCmvZ9HjPabWlt4KtivD8P+
	 K0mygndBSPZ3eEQrXeyjug0ujkRkrs29txwbL8ZOp0vHqLJDKPFF9uDLBRgWC4O29Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcSpgE7g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D1606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70D1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcSpgE7g
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so424851cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587600; cv=none;
        d=google.com; s=arc-20260327;
        b=J3bGQ0maFOvWj1cJSkSHTukJKVVenGYf9KPo7WXGVgxRNuOgBYUKT9PV0wUOj57QT6
         TnM5KLfFlX2wOnFkVsbJtK4+rBUtVXV3uV6uAmBaXv+MZLcRV6aPO3qWnOgmCg3eAa4R
         gL6HmOAGJp0Hqessk3ScS+IPHGu2HCPNvtJB7UEyBJVUWND/FXYZu4eHMdjYVly5wmXn
         ODgL/rJ9523knjS5xUekQ5ybCRjGqi7+e9+dq6MtC3Q/1PuDpB3il4uirEvv3cahGYd7
         OQLYTs6cC38Ff0Wz6bMft2S5z3mag82W3TUIAqqfFFQf2arRgK76+g+BdgYogBvmVmBP
         EOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdWoW+YMAuhD4166hiUdRwKU0699eDdRXcepk33gue8=;
        fh=6AkOQq8yoWnGl0J3jovyFeaIcbeQ48rpc6zrGP0NtJk=;
        b=Q319FusDq3yQVEEbDySXB2eDYdQnA7cXsOyCrOla16qb14wzL854qOTvFwRNyOwr1m
         /Sa8cGaf448BrUUoGbiTNeK6ZJKktRyh+98qXlyQeJcBgE30D+okeY1Ppk9ZfohUhbzU
         M8L8LkydyKWYBJWAzr5DRQ4swQC+wNUDAIA6fzvz3tukWJOoY6jLKi2ZAAmWq0Q9ByYe
         rlTXwUAFbm6foQXpc212TqU0pnvLwMTE0rAPxbiiaOwXAJ1EHpIswiFqd/gADYzyepZU
         Gkk43DD2oM0xlLuRkM9z4HScwTOQ3lrGiAfvr8ZPiVefeaCSrffNgQjPcWmaMsILKqEf
         Bv2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587600; x=1795192400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdWoW+YMAuhD4166hiUdRwKU0699eDdRXcepk33gue8=;
        b=YcSpgE7gf4jdpKyCLLUWz3GIqf43PjzI9Tf0sHKF3DQD1JSIyDYc/KE7dZ/rm18PxX
         hCyuPzMUwRGNk3XiNUXu5wK0lNnZJ/6fHClxg8H8lrHyBJAKhox90eEW7IZvR9A6Zhlu
         lSFYNsMrWMduxzXVOHF/hUEcBdb4Q52fMCZSUnYmXbJWL9sXj3LbiO305yypmQc9ZClc
         JOq8PkYxP6y0pMd91ErNEmyDECv7e8eWr3G0YP04uwzynuwZQJIoq6eikjytPuRyDL4w
         YT/ZWzl6X9P5swNpigfeAIL0kJERDsNXEefvYl//LONc6kDzzkqVJ8sPs5rCQ0luHO4H
         WIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587600; x=1795192400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdWoW+YMAuhD4166hiUdRwKU0699eDdRXcepk33gue8=;
        b=s6gVNmC1Wpyr5jMckWzDLDXshRGXrmZPDl9m3Nh5HXT6b6N763UUFjQUpTBzGrmLjS
         6I+PrniZyMX0qYeZQBE1kQU6fdpRkpSBwEnTNCA8d3M2Z8PUk3SvU3VC3jnT4ezvWzwE
         dL6HrwS0feLexQ+nFRnn8iJc9dHMNkbwP8E4orHFwMNvNbfFBAVPfn4MjMSMLXynm33E
         87g2nCM3zhKZZH0bOH9kxSt5yORlwJzB9wg2okvF7b0QVzaYbtKZEnjCMYCL1wGa1Z92
         tai7FmLK+emiRcjL4W032wvaTem8Zc/hYW9Fdg/v0931g739UEWntdbija8mgwUCVNWA
         s0Rw==
X-Forwarded-Encrypted: i=1; AL+hErGZBQj15wrojIoT5/e2M0qvM7azE0zZNa+YmP5SdDl9ZJJ83jjmft0c/DX8k+GIdg6Neh+1hECw+lnAYu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/blaoKLa5rqlPwShAuvAfnIKMUcVY5OKcDhfefaDoyHbI1YI7p
	UYNQtzi1DrZztAznj/X0BXBgFWRHoB4O2TcxOLfIpL9yWQpoG0TzajNEHKhRxMoxf9lnEfXV+n3
	+3blKRcBJNqrQLZJOeGPVoUQ0BJVkgBGpwWDsOIk9
X-Gm-Gg: AYBFou2yThQMOArrqS5+RzFU2+6k3q0OBkZvfyVfF7gVrxItRB5AHVRkihlMnH7FVLX
	qOpSrO3DCfn66lt1zz4cQ2gmxY5A80jqIf8GamkinNM3zYjpbTy5dEKANpE+05KSXg6f1lidCgP
	iF3XcMT/BQ7x39lBEiDdJOYB+eBQG2rm+5Dn51C+mxFf1nKx6Yi73o+kJoJZPS6nX8M0LOhYiM4
	4117iFx0xJu/R0Zb9Axb5dYro/bGdmrQUawGfBy3opyEczauB5tilEXyOYmnWuGEMj/WQa6Anqm
	zQMANyR79DwzJh7s9d+hMXzZ2ut4pFp62TlTOJ/Gu5g97/nFJEelZKMLTNEpH7EAkVA0jjIU2m+
	7KPiFRO39UYf48xs2L9gQiqI4c03GlVXMqZGCbCLrNVHl6K1O53KanZ/nV7RAyLR8iqs=
X-Received: by 2002:a05:622a:124a:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-55adbb72c40mr15083541cf.4.1794587599092; Fri, 13 Nov 2026
 08:33:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-9-irogers@google.com>
 <avVgPUFGCPycCWSI@google.com>
In-Reply-To: <avVgPUFGCPycCWSI@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:33:08 -0800
X-Gm-Features: AclHuK9L-E3dF8YJnLshs1tY7VQqvZTZoGdVDHChKgorJQHTyeGB3QWOADeecfk
Message-ID: <CAP-5=fVy8oN3okjJKHYvtqT0ZWWx=8uT24HkPhgvwwcKzvG4Aw@mail.gmail.com>
Subject: Re: [PATCH v12 08/20] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:44=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:00AM -0800, Ian Rogers wrote:
> > In machine__process_ksymbol_register(), set the binary type of non-OOL
> > ksymbol DSOs to DSO_BINARY_TYPE__BPF_IMAGE (which
> > machine__process_bpf_event_load() upgrades to
> > DSO_BINARY_TYPE__BPF_PROG_INFO on PERF_BPF_EVENT_PROG_LOAD), and update
> > dsos__find_kernel_dso_cb() to skip DSO_BINARY_TYPE__BPF_PROG_INFO,
> > DSO_BINARY_TYPE__BPF_IMAGE, and DSO_BINARY_TYPE__OOL so that
> > dsos__find_kernel_dso() does not match ksymbol DSOs in machine->dsos.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/dsos.c    | 3 +++
> >  tools/perf/util/machine.c | 9 ++++-----
> >  2 files changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
> > index 1574c8885d78..fbbf98c4ccae 100644
> > --- a/tools/perf/util/dsos.c
> > +++ b/tools/perf/util/dsos.c
> > @@ -475,6 +475,9 @@ static int dsos__find_kernel_dso_cb(struct dso *dso=
, void *data)
> >        * is_kernel_module() treats it as a kernel cpumode.
> >        */
> >       if (!dso__kernel(dso) ||
> > +         dso__binary_type(dso) =3D=3D DSO_BINARY_TYPE__BPF_PROG_INFO |=
|
> > +         dso__binary_type(dso) =3D=3D DSO_BINARY_TYPE__BPF_IMAGE ||
> > +         dso__binary_type(dso) =3D=3D DSO_BINARY_TYPE__OOL ||
> >           is_kernel_module(dso__long_name(dso), PERF_RECORD_MISC_CPUMOD=
E_UNKNOWN))
> >               return 0;
> >
> > diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> > index 5eb5efa4eb90..0334cb01349a 100644
> > --- a/tools/perf/util/machine.c
> > +++ b/tools/perf/util/machine.c
> > @@ -769,6 +769,10 @@ static int machine__process_ksymbol_register(struc=
t machine *machine,
> >                       dso__set_binary_type(dso, DSO_BINARY_TYPE__OOL);
> >                       dso__data(dso)->file_size =3D event->ksymbol.len;
> >                       dso__set_loaded(dso);
> > +             } else {
> > +                     dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IM=
AGE);
>
> Shouldn't this move into the if statement below?  At least it should
> check if the ksym_type is BPF.

Good catch. Setting DSO_BINARY_TYPE__BPF_IMAGE unconditionally was done
so dsos__find_kernel_dso_cb() would also skip bpf_prog_* ksymbol DSOs
before PERF_RECORD_BPF_EVENT sets DSO_BINARY_TYPE__BPF_PROG_INFO (or
when --no-bpf-event is used), but that mislabels BPF programs as
BPF_IMAGE.

In v13, I've moved dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE)
into an `else if (event->ksymbol.ksym_type =3D=3D PERF_RECORD_KSYMBOL_TYPE_=
BPF &&
is_bpf_image(event->ksymbol.name))` block, and factored out
dso__is_bpf_prog() from __map__is_bpf_prog() (which falls back to
checking the "bpf_prog_" prefix) for dsos__find_kernel_dso_cb() to use.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > +                     if (is_bpf_image(event->ksymbol.name))
> > +                             dso__set_long_name(dso, "", false);
> >               }
> >
> >               map__set_start(map, event->ksymbol.addr);
> > @@ -780,11 +784,6 @@ static int machine__process_ksymbol_register(struc=
t machine *machine,
> >               }
> >
> >               dso__set_loaded(dso);
> > -
> > -             if (is_bpf_image(event->ksymbol.name)) {
> > -                     dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IM=
AGE);
> > -                     dso__set_long_name(dso, "", false);
> > -             }
> >       } else {
> >               dso =3D dso__get(map__dso(map));
> >       }
> > --
> > 2.56.0.542.g3ef89b7020-goog
> >

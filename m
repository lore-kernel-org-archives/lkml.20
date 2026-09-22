Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C8A244687
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096415; cv=pass; b=ZSm2SACOpbvKyZwxPoYJjC8wRhQLWBJf7n3B5KZlg0ywgeTdUo4j4kNLTjbN0RmbT20a+jOzQASR+p0VQdk0qZmAm9xUPYWuIUHYnBqTg+jkN66XBcGAUyO2tYoB5OUSmGGKpi5Wysh2EpyPcI9d3xojV6jedhLv17FNI7HBM0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096415; c=relaxed/simple;
	bh=Nh11KCvv29s1wzVo2hjgCVz2jvRdnaGOg1wLpMrLhVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOkurhZTO8hz5m0gZ6jsM/tx0jfi/DJhKoXN5QDUPQbmWT57Vz2LvoU4pFWZTUxl3sefOEoQdJVx54ppfN5fJJYUHN1oU+vlb1HgTyt8VJh/sPJ8LT0zEJrW4f8q8m6MVjXrO510XHKmj07aGxnBE8x2MLbIZJwhb+Bnmm7y7gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qhc3Pn4G; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qhc3Pn4G"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-532e9ad9a1eso5841cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790096413; cv=none;
        d=google.com; s=arc-20260327;
        b=QaR+Pd+9wsajqmLBp9GkQGmvu2JL+EMtZJy3jYxCjEcH1b8lZY+EzWlz5mUK73pNBn
         2tje/1R0gQ7sWDpCKO/jX6uvoc+jbhX3DjF91oKol/1HmVvYn/oXDtu6K84h2IemRnAi
         saz8IiWkCKPHJSibnJlcK7QjTLgzYx1KQwnrSJprfP/xN6YFWCuswdOJpf2Faktu2X3F
         N737HoFSr2j9ba6dWGZ1+X0YwfRGFkiX4dbWIG24W9ihrvNVd3RByawBDjc6SsWcf+U6
         GFsCHzqcwFLibsOLcXI0bPao7y6t+JpOHkcJ1o0HFl5WLSLdNs8lSPxFAUf+WWWrO0oV
         hePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HhXuMRWtj4EoahoIpvu3m5yJyJGMHZPq0qdJI+IBC5I=;
        fh=UJR4qyr5gfAI/Sv0boKtzXRHHHJrqO1LLkLq5zjawzQ=;
        b=Zw/L0mZKz0LnQFvrMCpg5ATuueO9wcTlwuYCx7MoBAk++wBa63Eqx/PYA3T2CA5J4m
         698DQPn2Cv35RuQ8c5caVVR119Bi5rPhmYRI52fDX2tv7gP+wmCWs4x/IwdVyXKauOKR
         ySNRXv+r8JFoWNjOdAa0eB8npE8Z70asTvGIErZvNRE90Q1AiBJvltU/fhTq7nfc8mPA
         bvw3eeuVYdOplg6vxLihUUkXWiUqri5OZ31sQU1wujmQ2KmBVoBkozIVF9/uGS0KQGUz
         3D7a4eYA41tw99d1Qs3g+ASp4wjT29ioU0HGsBLkCtTWkPl2nu975WP6vfjj45nB02PB
         CnhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790096413; x=1790701213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HhXuMRWtj4EoahoIpvu3m5yJyJGMHZPq0qdJI+IBC5I=;
        b=qhc3Pn4G1bov55QzP9fmVML/eJ+6EFqXCpolstAt26yFMS10M2Ku6NIPUVhlN2r4PY
         JfiVU13R0OdQIyzPGe4kcojq7qD2U9eSq5A1wIoqRkGD6JnwmLRf+dRnYHY6FCRAXQPa
         CCsdHnV8o0MOB4//Bs37393j3/Xar2yKwsfyiKUx/WhJ/AAJZ8zGR1ikmmISEij7oAxq
         oAFpTqEDZ87zbuTkf0zoMPDt1sifh76g+you7Qw/4bh655LypXmDjZEkHU6JS0iPqbsL
         jogjnSpv8czqWn1ejPYBVVBj5lLDis3tlW6ii4LgDKuVhLBoRQG/DmWDf58QN0FKekNZ
         iPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096413; x=1790701213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhXuMRWtj4EoahoIpvu3m5yJyJGMHZPq0qdJI+IBC5I=;
        b=nu9/jiXIB+JoG0Rm3Sx0scISrW/M7m68rRa0DpaZAXHY8Qxwu/rhv9592xlsqSDBKN
         qCvOaHdfPLxjvFIbJ9JlokuYc+TXxaTb1EexnrvwEGSxwLYX3PEmW2Yrj/72btHgECbl
         x2GX+6i1DcClnKDMSZGFjxu7DrV97TNGtt2tal0oreWF2pdRz1kVKHIzmHkySFWU1+2u
         lxPoJpFO12Bm8Z23rZ2xjxepPgQKEQXSJKerSaIAiDWaZGPh7vdKdbHRqWFgvYLUgvIE
         Hng0MjLUFYNHE0Y43vyD7g/YKUja7O0QPhwhUIHV0Rz7Km7tuPKxpV2Fph9nDeV9UM1g
         UT7w==
X-Forwarded-Encrypted: i=1; AKwUvBzbIEJ3Q9TjF2mR8JwPJYauEaMrYlyInhtXMvxZaYjUCr7HUjyzgMeru03YL6vEV9HFWVSK/cx360oFSNs=@vger.kernel.org
X-Gm-Message-State: AFuF++lrDupNEo2AZaR9OPIsRbG5ZdIWVQ9SLjDZ4DyYWi93vzqROBS9
	rUhQpUZvJRh4/ea/+ua/D5nypBgrUW6InceAcOYkjMOU2438Qfb4uevrfJ8/VsXDv9Wh25QBpbJ
	qirzFvGRz8L9w2twleaB1ZapacPyR9i4CHDCPFZMZ
X-Gm-Gg: AYBFou2IqitfMc/8gHpVxuuzJ0Cmm1NaOKeIVkLfHeiwVAj20kX867EC5Jm2gTiS4Jb
	sB9JIuFOU51RpnVlp618AIUQNVxbYyDiQloU8nlbgzWSTLKEPEsNfbFnvzxWe73SH0QEDBRcYAq
	+Nkt8WeCqq4WUFKHR2nZS/BeADfHMZAXnndKLl302otBA6n0O1ZjGTsii92/9aUHPpltYAXkLu6
	1nu9a2eZDVHbZ1ABi/6V39FYCJs9jWyKMVXlY33OpQTIY10GjirXnpk3IzUfNtF6x+/b29tkV4n
	oDHJjqiQqQ1H7w5gU9lQKERof+4BLCWQGoWksdHtrOpR3nN4OHZS8B2ObrKdPkxax/Hruav4tR7
	UxsE76OgxuCai5+UzHw==
X-Received: by 2002:a05:622a:4d09:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-532ebb77793mr114661cf.4.1790096412307; Tue, 22 Sep 2026
 10:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <b1d417e1f28afa565fa01b4997e3c31140e4772d.1789966896.git.irogers@google.com>
 <8e3ed898-5134-40df-84b0-b7cdaa777731@linaro.org>
In-Reply-To: <8e3ed898-5134-40df-84b0-b7cdaa777731@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 22 Sep 2026 10:00:00 -0700
X-Gm-Features: AcwNN1UI-VG5bkPxC40nmqZB4RtDB35hxd84ZBx_ZtNi24VFwq2lDUI0HWTpv5E
Message-ID: <CAP-5=fUxfMNAaScod0YBXf3ThZ1rbwA1AEhhvBVFFqDR6H6Ang@mail.gmail.com>
Subject: Re: [PATCH v2 09/49] perf python: Add Intel PT call_return and itrace capability
To: James Clark <james.clark@linaro.org>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:11=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 21/09/2026 06:06, Ian Rogers wrote:
> > Add support for Intel PT call_return events and itrace options to the
> > perf Python extension so standalone Python scripts can decode and
> > inspect low-level instruction traces.
> >
> > Specifically:
> > - Add a call_return callback parameter and itrace option string to
> >    perf.session, treating explicit None (Py_None) callbacks as omitted.
> > - Expose the perf.call_return object with db_id, parent_id, insn_count,
> >    cyc_count, comm, pid, tid, call_time, return_time, branch_count,
> >    call_ref, return_ref, flags, and call_path (resolved as a
> >    perf.callchain ordered from outermost caller to callee).
> > - Export perf.CALL_RETURN_NO_CALL, perf.CALL_RETURN_NO_RETURN, and
> >    perf.CALL_RETURN_NON_CALL flag constants.
> > - Expose session.e_machine and session.is_64_bit properties, preferring
> >    recorded thread ELF machines (perf_session__e_machine) over perf_env
> >    so pipe-mode traces do not prematurely cache host bitness.
> > - Support optional vmlinux, kallsyms, and symfs symbol configuration
> >    parameters (and PERF_SYMBOL_VMLINUX, PERF_SYMBOL_KALLSYMS,
> >    PERF_SYMBOL_SYMFS environment fallbacks) in perf.session, resetting
> >      symbol_conf pointers and freeing vm_tm_corr_args, cpu_bitmap, and
> >    ptime_range in
> >    pyrf_session__delete().
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   tools/perf/python/perf.pyi |  35 +++
> >   tools/perf/util/python.c   | 624 +++++++++++++++++++++++++++++++++++-=
-
> >   2 files changed, 632 insertions(+), 27 deletions(-)
> >
> [...]
> > @@ -4161,23 +4585,40 @@ static PyObject *pyrf_session__new(PyTypeObject=
 *type, PyObject *args, PyObject
> >   {
> >       struct pyrf_data *pdata;
> >       PyObject *sample =3D NULL, *stat =3D NULL, *context_switch =3D NU=
LL;
> > -     static char * const kwlist[] =3D { "data", "sample", "stat", "con=
text_switch", NULL };
> > +     PyObject *call_return =3D NULL;
> > +     char *itrace_str =3D NULL;
> > +     char *vmlinux_str =3D NULL, *kallsyms_str =3D NULL, *symfs_str =
=3D NULL;
> > +     static char * const kwlist[] =3D { "data", "sample", "stat", "con=
text_switch",
>
> Hi Ian,
>
> This needs to be "static char *kwlist[]" to support older Python versions=
:
>
>    Changed in version 3.13: The keywords parameter has now type char
>    *const* in C and const char *const* in C++, instead of char**

Thanks! Fixing in v3.

Ian

> > +                           "call_return", "itrace", "vmlinux", "kallsy=
ms",
> > +                           "symfs", NULL };
> >       struct pyrf_session *psession;
> >       struct perf_session *session;

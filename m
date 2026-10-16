Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F52AD35
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166487; cv=pass; b=MtPLv+scakoAR2dyQs/W4LmSxama0pO0fnZxkJTHEeEYtSbWRs0UtWp9OwZ5QAR99s21SIdtqlIF9JtxfiHDXtyP8odri+XigzZJU2ixrSNAdQEQJnvKvvlLj/Xzde5Wx2kyLFB93306Hgj2wvk66VGYFhMRCTWN9weUmq4+YyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166487; c=relaxed/simple;
	bh=su3x38WF9ESfHlQ2lu0nGc+WmoW5v/5KjcpGwujr9M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5qQxRh78XQ4Das326XT7nQBY27ca73aqY5bCTLMI57fw6q5N0+2taOYOWLWWH/IVVql+hS4IpNeBGOfTIZZ/ABpvcCObA2RDjlwFo1FB6+OEnY3r3qDlAxps4CgbJ3JmO/Iyihuvwl3VnuDpzfW5jVgouhBqrqj+dxel7UbWMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aiNXfKNs; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aiNXfKNs"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-150ef97e790so9642c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166485; cv=none;
        d=google.com; s=arc-20260327;
        b=CGI4wDlCH/mlRdvm+NHSUj0AaWHpa18pN10w+D0WdSHKKPd29QLy9ht/OaNIWXoQUS
         i9Qu9KCRmf8TczZnwUIiq45GAD/hZpCd4QcPulef5uQ/AO/8W20Pgq20T44ZoKPgQ2eg
         fh0MBMxGNyYAECTghlHYKYANCkLVNc54qsMa9oaLd33WfARddNiOhYC7R4un/Q7j+vNV
         yZ3zZOl6NCpiOF1kpxw3INLXksAZsgrRnsqbB4h/16FjsYOVdENPBX/7pL9LAEbNnS1r
         u4hqBMZyj523qQ/7ugg+3M02C5lJ2q/kabi0wOk5xl+AmPtjWMuCW0vr6BKiO16hOQ8m
         Rmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=omjJiHG4DMcEiTl3Shd+1lm1YosdvYSAbHcTPN1mW38=;
        fh=1dm/tYnz4sT9Jl87QrEi5KGVQCqn42faPJW6c3HZKlk=;
        b=mp+p9RYSSYmQ95U44rqYJ6alk81InHs4cL/MnciQsUiWlKCICWZRewFNmOABt5GhKZ
         1/pz59DDejdxLzpg+Gpbks69jnLiLUTNsDS+uSkMF9UqeXmUaNiAmB0KyvQmf4MsAGI1
         J5xZkZfifpXRCbkimXb83I9A2l37eBURu6VVHzezYJqPyEKID56s0onY2z7vv7fuKvQG
         yDwA/QDuACygm7n82h010SqV5238bbsovk7g8n6zXrFWAiwspGZRkPhyZNDy6D2ApvZR
         eGL1vr/hk/QeDL/CSw2YMsbO2kX67xuCBrXBC1oaXPRay75VCeILD6ygmCwYSOxm7TUr
         jcHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792166485; x=1792771285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=omjJiHG4DMcEiTl3Shd+1lm1YosdvYSAbHcTPN1mW38=;
        b=aiNXfKNsVgXy3Kzb0KtHrxzqb1iOkfoArgLUoctTvMWeQsMBq7kGzpN5fyQmGDwMnm
         TXU8wg/e/WQB6kmy/dt7XC577J7pr+OQtlF1JgiiYpP8PDdCDsMsPh/6Ls26Sn2qi8vr
         kEaREwAEZ6rGSjwxDTxERsH2/ZPgt048f7Rur69WV1D4bK/4YTcHIqSIhQYdXw+88//m
         uyKABI9LqHLSulAEOQe3GHYBgsPWuU2E/JOrGtFNpNc1PDah+xYV8EWvIJOxucwkx4xM
         IQDaKs3uf9KvWuyo5TAh2AH3QW4DCODJrMM7yMF+N/IJw8nqN2ZCQhmOwm1oRClaWWoZ
         DfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166485; x=1792771285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omjJiHG4DMcEiTl3Shd+1lm1YosdvYSAbHcTPN1mW38=;
        b=okjCny1pqFapim21D72j/jF14EzwwP8LL7LDRF/4DUbRHo7WlTavx66bT+qOtAFhjV
         CTAxw9hAzuc8HyCUXaG6zS8YgFjjWsF/PFhkeun+x3+wo+ZpylrhoVUdpFVEMqKlUomJ
         JXen+xrVtS7jjTnW67oYA1u+8XPQqNGmcNDBvoDCBm52BshL6rfzJ49FCByN4MfTW/QU
         ek43U/HV+xvJE/Ya3llxSmG5nvuwpmV4rw6L4yt8xaJxFCGGnIX5mylSnjnLazk/tVyq
         mqpfLnX9In0N6eCJGo96KKL77HNMf+6EGzuIVSUwiRLztmR6DHAF0dp2Mk7ZveMDeGzf
         zx4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+fbgKxGSFIhVuFZTOWBJrxmS/SvruARjEp/RkvMg9h8ySnfgNHQ5ROFHdnzHN9EStIYyVr6aWZft8Uhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ13FW2p6f2ZaeZK/ZgS7ZVjAsiD0pNUEDtLSiOdsZ7swv0Vjh
	tJt4uzOpN+n4Qvd1D37ZU7a/Ge3hWZtm3s7B/PuO35nAHRj+QEdelb5YBFDOW4OpuuEdeENL7PC
	NLrUA6JL/H3SQktVxcpT3uuAoHhmoxICdi2Mk+sxkULhYYluZ1bob2a4U
X-Gm-Gg: AYBFou2OMAetiqy/Id5tigFdj+XAVWARTXjHnAYF25RvmLj9OoT0DrYtO7mXrVT8rfd
	wJtdqT4PibJuzNf0kwF3YrvUrJStqDCNe80VIXe1zKt0eq3Ig1Js8v/jENjnPugcaWRb1ZZA6a0
	OrLBITJyQmpzVi5m1HNwn1FtPOd7veQ+/OK741mFAJhfc5/lRu1Ju31Qg4euHYrEZABonR4uhii
	oPXg++4nabT0hcPMBzH5+Ub/ty/CYuOuutTf+XRznZQ2WESsSfZpHl3hSq2EH2neU43gv3awMU9
	ltD2D77G+UUdhPOBHEfMaTRy4M0NRw4Qn0HBpDXTOHUncsjeqHne7r0CGWBYKUdT9Jx1LeFVThc
	o54H/7pB6zw==
X-Received: by 2002:a05:7022:ea8c:b0:16d:a8b9:140f with SMTP id
 a92af1059eb24-182b0ca6175mr427365c88.0.1792166483960; Fri, 16 Oct 2026
 09:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015233237.542258-1-namhyung@kernel.org> <atIImjxxXKUO2os8@shell.ilvokhin.com>
In-Reply-To: <atIImjxxXKUO2os8@shell.ilvokhin.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 16 Oct 2026 09:01:12 -0700
X-Gm-Features: AclHuK-C91GMbaVoBKGkfP2nvN8OyYYYhAjdJeyYsefwsHeseQJAtyhWdsx84Jk
Message-ID: <CAP-5=fWCwLuFah70DQCbmmDvjQYJ5DiozBj=YawZK6eVFGNnDw@mail.gmail.com>
Subject: Re: [PATCH v2] perf c2c: Fix memory leaks on output fields
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:21=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> wr=
ote:
>
> On Thu, Oct 15, 2026 at 04:32:37PM -0700, Namhyung Kim wrote:
> > The perf_hpp_list was not freed after use.  Let's add it for the main
> > c2c hists list in perf c2c report and a local list in print_pareto().
> >
> > Previously it was detected by ASAN like below.
> >
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   =3D=3D42183=3D=3DERROR: LeakSanitizer: detected memory leaks
> >
> >   Indirect leak of 1064 byte(s) in 7 object(s) allocated from:
> >       #0 0x7f17334ef24f in calloc (/lib64/libasan.so.8+0xef24f) (BuildI=
d: 61e8165ca90f7a4f06b73f064a938c76deaae079)
> >       #1 0x0000005fa099 in zalloc  ../../lib/zalloc.c:8
> >       #2 0x0000004faf6d in get_format  tools/perf/builtin-c2c.c:1978
> >       #3 0x0000004fb45e in c2c_hists__init_output  tools/perf/builtin-c=
2c.c:2004
> >       #4 0x0000004fb7de in __hpp_list__parse  tools/perf/builtin-c2c.c:=
2047
> >       #5 0x0000004fbae9 in hpp_list__parse  tools/perf/builtin-c2c.c:20=
85
> >       #6 0x0000004fee13 in print_pareto  tools/perf/builtin-c2c.c:2563
> >       #7 0x0000004ffcd7 in perf_c2c__hists_fprintf  tools/perf/builtin-=
c2c.c:2708
> >       #8 0x000000500ab5 in perf_c2c_display  tools/perf/builtin-c2c.c:2=
949
> >       #9 0x0000005045c3 in perf_c2c__report  tools/perf/builtin-c2c.c:3=
522
> >       #10 0x000000505caa in cmd_c2c  tools/perf/builtin-c2c.c:3676
> >       #11 0x0000005df50e in run_builtin  tools/perf/perf.c:383
> >       #12 0x0000005df9b1 in handle_internal_command  tools/perf/perf.c:=
436
> >       #13 0x0000005dfd7f in run_argv  tools/perf/perf.c:480
> >       #14 0x0000005e02d6 in main  tools/perf/perf.c:581
> >       #15 0x7f1729450680 in __libc_start_call_main (/lib64/libc.so.6+0x=
3680) (BuildId: 85075e2ae2e13352a1413d41c327dacf6461526c)
> >       #16 0x7f1729450797 in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.=
so.6+0x3797) (BuildId: 85075e2ae2e13352a1413d41c327dacf6461526c)
> >       #17 0x000000409c34 in _start (tools/perf/perf+0x409c34) (BuildId:=
 36a64600776d92e4ab7dfd5ca20c92280d72a645)
> >
> >   SUMMARY: AddressSanitizer: 1064 byte(s) leaked in 7 allocation(s).
> >
> > Fixes: c75540e3160f ("perf c2c report: Add dimension support")
> > Signed-off-by: Namhyung Kim <namhyung@kernel.org>
>
> Reviewed-by: Dmitry Ilvokhin <d@ilvokhin.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

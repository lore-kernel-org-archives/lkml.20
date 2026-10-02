Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EEE36B928
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790983735; cv=pass; b=lzATKX1dDtGPCYoqs+k5mVQBGHnandcEmTPHDz7kvumhXrFTOw/HSlV9bM1jjw5rOVMVL+BVBBjfgJH98PEXZzLDuGx7lq5mFe77xoHTb6yaVDtTisVyT5XRsPLKFvjXTnEgJSubH1xvlsc6Ls0Sa2MaEeBCmfdCRsDFzRweBZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790983735; c=relaxed/simple;
	bh=rOs5frUl7ApBA1qQpObFxVYYelIhp/dTTYYpB+JInF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4AkzFqkv+WTqZyAt1wtZAjDLyB6o0G1htROpaiSAtCj4vGhX0IRkjgKicHdY+hJQasqkN8YKeA49x2LiM85PeFCemi3i3IRGAdtsIOtsr0Ash82rDi+ykM2lcLSzOI5syddEbOFlJ0BN9KPP5kdtnb7Jc5ZhwlszhvbRpcfjyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=uH+dAZW4; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="uH+dAZW4"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d881so38984d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790983733; cv=none;
        d=google.com; s=arc-20260327;
        b=R4G6vXFXz8BzUpM3sZO+Ddj0QJATAxv4tMa8W+vRH4USuA2wlpGs40Oh5xqkz6QhfW
         RJZxDGYlBBNRSRyJN5WoXTApIAMxNXEJTqIuQaSIDjGrkjE81JEsQO1xjgtN6hh8VvLL
         IIdza3YKMF4xQk2qWsCMnatrriJ7jPiSCdGi/G28r4wrl4ntR3dF+OY/59H3genvEBrz
         3sxMSqWp04FQ8Fo4q5bTRh3c4Au3NmvKz8QofEHMRmFhUlDEKKHZPXiS/wRlQBEyVUGC
         khOGqqAQfT2YVv9N3hHm02C/AsKfMniPM1C3Z1d1sM5TnblLTpmqPI3PrMqx0v6li5kW
         ntMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOs5frUl7ApBA1qQpObFxVYYelIhp/dTTYYpB+JInF4=;
        fh=57QsaBQoKTjU5DYM0QRPlhtEcxphVJGT2SbtUT0H1OY=;
        b=ocwEhVXPAjK8xPj+W6XBl9mms6FsuVBPit/3TGmpDLobftJP551GuJN91O+wHBS19/
         c3YsNTDzFeBLRkmb8eSczNwqSgE1Uz8hrBamdJ31Jo3QR8VDBM38HPhnalmyNcs0KUCy
         kwJusUAzPfwF6vPvB/LKLCvtQkMtwieEHeCYC3rBA3UpDNvskp+0wLGWv4JTlLewzUmG
         SRSQMVFiqiu+70yNrqSpj2ahcgDLZn2xzAdNZj+lp/tKmlTJry1ksj06PfL2imYzs8sh
         2DCAejPVtrd4ZZnudFxUoWnW2Uayns6yeD9DBTtXcngozkbCO+fxW12zD6WjySCXDAmO
         lAzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790983733; x=1791588533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOs5frUl7ApBA1qQpObFxVYYelIhp/dTTYYpB+JInF4=;
        b=uH+dAZW4JR9oY/1sYMJGNbEfqp8zPsDMJMGETPWhwWnJX7FXpbBujnuUlNkoZNGY83
         +iO9SOE0BKdFf5NnQ71MWZ2w9iZbgc11tObQGDsLxg9ayf3cGd+WoA9qWRpx6TsC28aQ
         065DQyEoPRNO4tTDB5umP8V78HwGbLutIOi6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790983733; x=1791588533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOs5frUl7ApBA1qQpObFxVYYelIhp/dTTYYpB+JInF4=;
        b=yKT+ZQxTMH7F7w7AklQLwvg+dBwC8iA2yyg2jt6GQ2b/Ye+lHqWCVXSQ6PROkTEveF
         H0Fzq1Yn8cUSgmaDosHzvVt5WtH/E5t1ni8CSBFjQtb4l7c+f7i6rk31lOg0IzYK5kVl
         a3/7We3RqWHbmE76+KJ5OuyUHdmi6ECbp6cY/D8uQcJkOMQmJzcV3R2fo3mdiSQV6qee
         oakUliFd7qPw97TCcw0v1SPFJLZgFk3grronAa9/a10jZdfd0O3FIehPptK5T1m0uJvu
         S5RVkRsVxF+8m1fqKkKwEj05h13LTr0diK63yhWr1soZ2uT2UwDOCNmdHLc2KaGkGZO7
         2Whg==
X-Forwarded-Encrypted: i=1; AKwUvBxZYusbw0nxrW9FNRZibEbO60TPZdbCK8lAkg/rzJwx/txlgaF13ajhuElbQ/10nxmDn0x7LbmBI9LOjEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc5L6e+00Xiau+R+lpkpZyNWiUoQNVWru7KgC0LgKkXQ43XnHo
	db2RQHB9EPdoKl57xqUXZH0Mt8yoAj3McDr8NHrSPhkQlYAkeanmNb/n1kYR7PE4a9QcDFScoLI
	2hSYv2DjWaQ/OUJvgibM8M3Xvn2K1+Ay4k2HgUh/iHA==
X-Gm-Gg: AYBFou0L2EFutUzkVbvdtJEtJ5h45DwWAXNHPXoqXZQoVcHeTuqniXhHx9ENPXwHOCL
	70mlmRdLya1qtt4nRn5jU3kdT651CcXbVuCjFFZDibP+cvG0rPhF9eG/N4ZjivzMkFu7DZg7w/V
	3EHe74TAdQ14wow82rv8E0yNLYghFkNqT40sweP/IyhVpMSorMVQWGQgAobt2SaIOLuMdChbkqM
	vhTLUhlm3rafJoJINQ6K/01reDHboB5hT4Lmx3y1TDNRcrmQL9bwa165Bk9KmNxaVUU/aMjZ3eH
	fD6CCtqD+1+4EV81S8tiay3Tf3JOZdoaF0tlbsyNpIOhhPPwoaiZLcCqfC22uZgVmcut/zfEXDv
	BOwxY/0t998SMAlLrvv4hOg==
X-Received: by 2002:a05:690e:d59:b0:677:aa00:24dd with SMTP id
 956f58d0204a3-677abf9d5a7mr1984885d50.22.1790983732433; Fri, 02 Oct 2026
 16:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-perf-symbol-memory-send-v4-0-0a592bb2539e@uber.com>
 <20261002-perf-symbol-memory-send-v4-3-0a592bb2539e@uber.com> <CAP-5=fW_gTX3oXi5_tzsFo2VYxhcsuuoTBxFAzkP-yPsroAoOw@mail.gmail.com>
In-Reply-To: <CAP-5=fW_gTX3oXi5_tzsFo2VYxhcsuuoTBxFAzkP-yPsroAoOw@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 2 Oct 2026 16:28:36 -0700
X-Gm-Features: AclHuK_XNZXq0VLPIzQnZJ8iQoLi5tbRYCcG5bg7Q-IHQTqgF8BemgGQiDZtpSs
Message-ID: <CA+w=M=T1arGfG8NhhuL9WEBf5myoJ8S8MqqJ2MG=TkMhRwn1Dg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] perf symbols: Factor out duplicate symbol selection
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

On Fri, Oct 2, 2026 at 3:16=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Fri, Oct 2, 2026 at 11:46=E2=80=AFAM Alireza Haghdoost via B4 Relay
> <devnull+haghdoost.uber.com@kernel.org> wrote:
> >
> > From: Alireza Haghdoost <haghdoost@uber.com>
> >
> > symbols__fixup_duplicate() chooses between symbols with the same start
> > address through choose_best_symbol(), which needs fully constructed
> > struct symbol objects. The lazy symbol loader added later in this serie=
s
> > selects among aliases from its index entries, before any struct symbol
> > exists, so it cannot use it.
> >
> > This patch moves the policy into symbol__choose_best(), which compares
> > the size, name, type and binding of two candidates described by struct
> > symbol_candidate, and passes the same description to the
> > arch__choose_best_symbol() hook. choose_best_symbol() becomes a wrapper
> > that describes two struct symbols. No functional change intended.
> >
> > symbol__choose_best() is not static so that the lazy loader can call it=
.
> > struct symbol_candidate stays in symbol.h because powerpc overrides the
> > weak arch__choose_best_symbol(), which takes it.
>
> Could we have symbol__choose_best() that takes struct symbol
> arguments? The struct symbol_candidate doesn't appear to add anything
> other than a cache of symbol values, and these could be as well cached
> in local variables.
>
> Thanks,
> Ian
>

The lazy caller is the reason it cannot take struct symbol. In patch 4/5,
sym_idx__dedup_aliases() (tools/perf/util/symbol-elf.c:1765-1808) selects
aliases while building the compact index, before any struct symbol exists.
Creating temporary symbols would require allocations and name copies becaus=
e
struct symbol embeds its name.

struct symbol_candidate is a non-owning view of the four attributes shared
by the eager struct-symbol path and the lazy index path, including the
powerpc hook. Without it, the common helper would need eight scalar
arguments. Would a different name for the helper or struct make that intent
clearer?

Thanks,
Alireza

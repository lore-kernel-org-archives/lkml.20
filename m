Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045273C988E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841304; cv=pass; b=SN6HwQqCYLhwdEyJX+LryVE5iDNRxkJ27RXM5sDppJ+wSwD5RKDSidWzv0nP7HFXo+5wmEdg0osTF0PpwlvbcMQ3zupGNtfheWwWVJwtMJgbVD7GyOtvpFMIjcSixoGftSv3Ri/co5Wd/EW05J7o7qJWKxi7wikQfn39WKdBbrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841304; c=relaxed/simple;
	bh=UjiMOoGqKl1AFGTKXUXfK6wWEi45TqjVJvcBDz0JCew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMFgGKegnQnGkeiwMyar6SytaX0Hil+9RDlm9gu8EqdKydstCRdu9DMzYLeo1jSnc4agkE9QilH0B23aow8+RaQ0vvVyxWzwCcs+xNE4IzwZxCGJ1/tGgz3nF+x0hE6pczpRPjXLtgqF+hTY00+6jTG/53fTaDxkIMu29OU0I5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n99QKw9v; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n99QKw9v"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53584e7c349so559691cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841302; cv=none;
        d=google.com; s=arc-20260327;
        b=esU4RW+k/Je1EtzjsfRjoa63DyZ/VC7wpAoe8tOfdVfsLgpHcpcD3/UYv5UyEuf2R2
         cYITA1KpdB0pzVRKNDbm19GBBuhVZDkTjwyRT3whXqCospXxbeDyDkZGuMj6XKnXBIs4
         GOKqDrc8FtBrVHTjuv07Sy8LYKWFW1r91S2T5Dt359Op5LGBjn0QtLY1HkFkwTa93O5w
         6JS+aGT2mkMYkowtISAQysRF9cz9CN9ey2yleQFevHMfpgNuQ7CA6xntFkXcl+Ja+LTQ
         pJS2F+znu9F31OM6qvjk9JBvOKOzZEiIHFW3W9trmBwfe+0qD3ND5TrLUb1cMcfegLWu
         OsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ujfOyylHH0+Qcr6VmePM6uJ1Ba5lYDsIUszcZYvjorY=;
        fh=I3RjVwz/Sjj8VIHGhTE/hE6747O+ARTnszdVzsMeeAQ=;
        b=c/UwhPQO2wdqoMulQbmWk5eIJpaBWOtokBJcdIpJGBD5I0mELPt56nvvdy3rbTLme4
         1yTtu+wC9LVHYQOkCChh/KIAAQWz+q+uCfAq/zv4vEGEy11EoZTU2Z7zErZleInmPYQl
         PBqaF9pJ2UtNEWv2hUIkGPV3izaY+T0JXU848T6q/jvsjAlOuECCWC4QO4ooBcOzTMQp
         Bg9dv5pAYOfzR+xzlL5DLvV+ANbdnmYqlZu2nNNH9uAeXdTFszJibpbNjBBZW2y9IoWx
         RaE9jpd0NzL4FPzexa9zGQbKqf+YnP5RhMvJTiaiHwGRTQqso8FRVgeQmppD6ULbN9mc
         LYHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791841302; x=1792446102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ujfOyylHH0+Qcr6VmePM6uJ1Ba5lYDsIUszcZYvjorY=;
        b=n99QKw9vB4HKb7BaZf3M9oE8wWPVicgRur/NnWKO5TafVzMjscz7556pSCn9bd3rt1
         NmfKX9R0w3CzUCh19iIjwucVg1K6qfuq6OMc9yl/MN7sGmmYEIdSfI3O8S+iAUDNdTwf
         zS4iI0ZZ3VXt/73uFiZvjEAouPoiG39XRg6IrAhuZGu9GAyXN/ujSreRFKu4CAA6dhkb
         vEk6hSCi+6mLOFc0idwpA5bZ880jF1T8HRRZmWEh87KlmYdyHbal+uwW9qbT0xSdHG4n
         8AeNJ1acMQwKImscW2W0XDQvmUALDuxcr/mMDCwMio4XoB9u2jmatdgUZUi70Q5iKz8u
         h5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841302; x=1792446102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujfOyylHH0+Qcr6VmePM6uJ1Ba5lYDsIUszcZYvjorY=;
        b=apm1DHwOZHn4ywvG1FflMM2GVcpCnH+HYI9FRtpvsJEI71I8zxNPgWe2+xhAX0nRAK
         Pn1KfmF9Uis8Q+qRwjBZ1u71xzu9kdwDvO345Ra6x0CsTexTmA4bVNA0pmyVx05w0PGE
         I8+N3EMmRQakQwePr2yA94jSMhG+ugCGgSiAqpPFQF8pgn7mtYQgcPeohsvWY2sVF3jz
         KafviYkkJXFC9ZVx8RWwNutMTzjB5L69N0WRzKbBmBwnq/pRKOLv7pRDHsBMmsqFfSUE
         O7GBB0QT2SYPaUp0YgBNv+euAEUHmfYaa64ohb3by9Nt6scrTAd5KwoTvqe83ewaYn39
         c7bg==
X-Forwarded-Encrypted: i=1; AKwUvBwJZdPLu5SPavOK9owDsI7OoJ605fUNBARLtWeywOfWYYqu6IVhQ+yLGo14DbYWEehHIulHcrT87pBAPy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuYGu9zUptr1dkE4lWSKByPA1ys4M3BfB+vjoXqDavR3ptOT/c
	Tf4pmPQ7mOa9KSBYQgl1iUJ/Wn3P/0xLBsx78Y6usUeonrp+5EocNBYSBKxV1l0c3sq1QttXV7l
	x9jmtePB0yioTnkmv/Wzone++3x/n70ENxl0519Y1
X-Gm-Gg: AYBFou2e1CpBikpemWzvieSA0HbxDV8ZegnQcvBbL98aY9m6MyUKwvhQ5sgjhCbBXE7
	/9eUpXE6S4lrHC9Q1kYml3/S6BSiEDhJ1Z/d0pfT7OWNMrhY3SYa8EQXG1RHY2DzzHLoe2Fy9mC
	SYc704HmJ0v1Tgk8Gbu0+nGTWLqZ29nmD+pfBV3SrB4eZwohIthofCmPddtGtDniiNL7Mk2myJE
	Il5u3CHpH6nveAqAlfig2irMe5KQmAmgLL+eIQShIi+sj+2lCvwwJFR2wmmwVyJEkHC2ohsfFnB
	4zUwrpnq11S06LSjGtRqd077a52J0OgoUn8MpKxVB0e/vemjdZe9aR8ynrT0s9SscHVwC8XlZko
	kze7HTZxjXQ==
X-Received: by 2002:a05:622a:2b05:b0:531:16a:5a3d with SMTP id
 d75a77b69052e-535b4f41d7amr34879941cf.12.1791841299643; Mon, 12 Oct 2026
 14:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012052601.13920-1-namhyung@kernel.org>
In-Reply-To: <20261012052601.13920-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 14:41:27 -0700
X-Gm-Features: AclHuK_xa6jARGF19pV0rzh8vArCUJVzxFb883MZyiwMHhKkagyeLFaZzXoCBXs
Message-ID: <CAP-5=fXg3LYS0ftt1WjDXgEh6DLjZcYQiVNv=ym7CAA9PyiQ1A@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] perf symbol: Properly set DSO binary/symtab types
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 10:26=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Hello,
>
> Currently we have 3 types for a DSO.
>
> * binary type: determines where to read binary instruction or data of the
>   DSO.  Basically used by annotate.  Some (special) DSOs like kallsyms or
>   JIT may not have the data though.
>
> * symtab type: determines where to read symbol tables.  Set when symbols
>   in the DSO are loaded.
>
> * debug info type: determines where to read debug info.  Used by srcline,
>   DWARF unwinding, data type profiling and so on.  Often debug info is
>   saved in a separate file.
>
> Some DSOs may have the same type for 3 and others can have all different.
> Previously it generally assumed binary type would be same as symtab type
> but now I think we should not and only set the binary type as it's used.
>
> Also it should make sure that symtab type is set properly after loading
> symbols in the DSO.
>
> Probably this patchset won't make any practical difference in runtime
> behaviors but I think it's good to track them accurately.

Except for nits and resolving the remaining Sashiko feedback on patch 6.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> v3 changes)
>
>  * set KALLSYM type for split kallsyms DSOs
>  * take dso lock in dso__find_binary_type()
>  * handle EMFILE failures in dso__find_binary_type()
>  * drop the libbfd change as it need a separate patchset
>  * lookup binary type in dso__e_machine_endian()
>  * get rid of machine_or_dso_e_machine() due to a lock problem
>  * fixed a bug symbol__disassemble() for BPF and kcore
>
> v2: https://lore.kernel.org/r/20261006234315.920817-1-namhyung@kernel.org
>
>  * add dso__find_binary_type() for checking ".text" section
>  * make perf annotate use the dso's binary type directly
>
> v1: https://lore.kernel.org/r/20261005063411.114244-1-namhyung@kernel.org
>
> Thanks,
> Namhyung
>
>
> Namhyung Kim (10):
>   perf tools: Remove redundant dso data init
>   perf tools: Try linked debug files for DSO debug info
>   perf symbol: Update symtab type of vmlinux from build-id cache
>   perf symbol: Set binary/symtab type for split kallsyms
>   perf symbol: Get rid of machine_or_dso_e_machine()
>   perf tools: Factor out dso__find_binary_type()
>   perf symbol: Set binary type for JIT map DSOs
>   perf symbol: Do not set binary type from symtab type
>   perf annotate: Simplify symbol__disassemble() with dso binary_type
>   perf test: Fix dso data tests
>
>  tools/perf/tests/dso-data.c |   7 ++
>  tools/perf/util/disasm.c    | 124 +++++++-------------------------
>  tools/perf/util/dso.c       | 138 ++++++++++++++++++++++++++++++++----
>  tools/perf/util/dso.h       |  13 ++++
>  tools/perf/util/symbol.c    |  50 ++++---------
>  5 files changed, 182 insertions(+), 150 deletions(-)
>
> --
> 2.55.0
>

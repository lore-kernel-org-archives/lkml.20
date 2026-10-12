Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A1471432
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844734; cv=pass; b=g0Iln4ntIp84dKfNbg3VOW6t3bnJx7RExrplmeltzKOTnTqnPAXwcR+/bHJx3vOGiBop7x7JRHM1dtR4P0Uw2us5lzSCgHFs4DwaGc58p0Fhhu4z5BZcBKGJDXZVoozPmbUULOdNWoHKMtMoU1U93IIy6f2YE27eGJl5nvj0DAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844734; c=relaxed/simple;
	bh=2EJZ/MdSdrcAt4BslODEOUqzbJqgXodfdsD9g+6uKJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxfzvdlXH3z3me646UUvMfz9+R2vsdaZfqFR+cIsWD9uhpFsBNFnUbaQ+AHA4yBxxzc9Aa8UMj+VKL+P9AbSy4mz+hx60aA3D8pXTl7l1Xp3I7LBVUW0qzl+4om0MG/PV8vdcs17Y5x6RO/mMON8BxJO4BwpFxfh9tUQIxnswUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMQvW1W5; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMQvW1W5"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so2467635a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791844732; cv=none;
        d=google.com; s=arc-20260327;
        b=ktICwKZByp+2nfTqM1QRJapQ5yafH2xLzPsPYdAO+AHLyK6l0VaMsqSCUIXmXVd7aT
         9g1MBqO7oX7fd6U7GCrMdtrIBKd6WBOx74GjkZ+IcLBAtCy7NDyRFZd4vYDe8lXS26IQ
         5le7niPoKsk5QbN6oNu3anFviS7/6e2B1cnJEQK3QY5Ks0qw5ZRLOSPn3G/jG+vtGecz
         lw2YFXS6IQ7c+XzwAWbYuPsebFH6uZi0AY5K4QnAqdUvFerFiUmytw255i2DavcwvKjC
         Knep1QVZRY4Ef36JTWmG7+Uossuhv0nUcmZRPK9g527ALOs+0dicaZkY97sZMCas8/++
         5rxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EJZ/MdSdrcAt4BslODEOUqzbJqgXodfdsD9g+6uKJw=;
        fh=DbBqjMRGcfLrCAX/Oa5v2PEc3nxqMm1YbniKPSpW87I=;
        b=P+FuQomJ3i+vsce26PRNZs5/yOAOPAJgyTCu6UrErBHspFmGeji4aJj8wj6z4kLhRX
         1OpjVdW0KklbE/W7mObXwFCeWFGRcYb4J9oteoG2KSbhinrDrdsx/NbxiajIUBWZmTUu
         Z1i6KlNQ2PVtfu16x0en5x1Y89h0MT9th7axvchFLUHeTjfcK+qHWEG6RV6VLHGJI+TX
         yJLqaf6OEDBqLPIYFHFiZFg7GmMmAPgdt8vSQDJRqHccEpRINWNQjnAGH2hIXu7AH6KF
         NvublZH+2HLBY5lVoucg25j+QYxWO5xR1674Z/K6j5iauj/fagNGS6uWj8z/h3z8A2/A
         Zt8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791844731; x=1792449531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EJZ/MdSdrcAt4BslODEOUqzbJqgXodfdsD9g+6uKJw=;
        b=lMQvW1W5arme6ixZ/aPNWep+Rrs+GcP4aV8lHrQ4iUhbtsMBlwe1NE5okST2S/vvZb
         598dQIj0bETPe5nNCWR22ljw7qCw7crHlwAGSqN5rjpyr65YOSV0gh/bGqeYShSmz4a9
         VmxRHk9fQx83xvs9f2q2Kx82Ek6yjIE38RhWA4tf0mQlMar/pAamtDARUduSICxPg2jO
         pLLAkO7Pckfn0WcZAz5EkupuEUakVHPssbe7maZFeH2vdYDzCok8WfZtul/TUkLOPHA9
         3k00BwKEfPm2IC4i0fXOEVw4FHBzwTbAEoxCl7f8/Qjswf2UDvxe28dIW5I0zgogH75z
         b7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791844731; x=1792449531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EJZ/MdSdrcAt4BslODEOUqzbJqgXodfdsD9g+6uKJw=;
        b=A6fYr6qsB6T050q8gQVsfyTH2l82CqXk9UYX5X2JVCYvwsZzXDpfV/K77Z4VaWOqTU
         +KqiDfbW7z5JlD4OiWntv4tajh9QresYAL8kfhXtvzh58/lMu1lq3Q+puDveYYSjCpDb
         w13IQW+djcmJfeMmOWx5Lfd1q3Om7KWrek1BFqT82WzElls1KfLMO9U6wt2qI0p6y+k0
         TrsvVnD7G+ggGNdlNbW0VbGmDn5RbHj7tH85ScTLPXJUwuTdiOyKE9lRRLz7ccNWd/VG
         EFwHekXEgz1xIWa3v958lA9HqgCtMgsEgHxvV0V8bfX5SJxhX9xt/ecmlK5u3xPK42yr
         FW3g==
X-Forwarded-Encrypted: i=1; AKwUvBynxE4hg6+TX+WVMcLl5Ysfn5GXPzm/Od9Z4qOoP89aBKFV9qeY6g1CpGZnDVmuIf/i2/x7nYDEi6c8lzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR4qGRwImaAMoUmXyosGoevd5qLKGALwBaJkbTWQBsX1NakNPj
	LYChhx+5Ra3t0FpXsGaxdROn0BUPOwG/YIct0cjWBctS52qgCBKpJIda+C0//aJpqN6H2xT26PK
	0xR8rCbnTQyTcBoyO+/yHJPJLWxuSnYQ=
X-Gm-Gg: AYBFou2hT6DQ3aOeBQR1aH4aLTKc2gONAdudyjBvj5WywwV2qQrxmeHq8lLxqm20SDd
	InHqSp8rxupdg1rJe7gfiJySoMrO32h4mbVKol2oyIq6YBVLjcupDQRjkYL2PN0q5WzmLhiiAu6
	TeBVDkpTHNGctuGnsIY8t1QpVO1++JsSAc5ytxKnU1TM2ZxriZznXjjrgWFrTpW6fnH071+ItYR
	YtTu2t8NM49pe/v+SMLjvnYiXGNZKEezInqdg4MXiC02tdjNXpGNpx5OK+Y0fuzHi9/L1qTObhZ
	m6tr7P8UJMLuZRQjSyQNWh8VZHF67GmsBfyP0IfsAcOU5zM6txSeeyjMwAA/O1/MSi/rPoVfxx6
	uMwCrNHC05PVkt9ML5WCWHLYkodbRwzV7T0WAx35OxQ==
X-Received: by 2002:a05:6402:13cc:b0:6ac:9a44:d404 with SMTP id
 4fb4d7f45d1cf-6b17c161c2emr8836767a12.0.1791844731550; Mon, 12 Oct 2026
 15:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com>
 <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com>
 <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com> <CAP-5=fXFYbuV9MtJsVX5hUPKDOxcjtNTHM4-qR7Q+ncsPq59UQ@mail.gmail.com>
In-Reply-To: <CAP-5=fXFYbuV9MtJsVX5hUPKDOxcjtNTHM4-qR7Q+ncsPq59UQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 13 Oct 2026 00:38:40 +0200
X-Gm-Features: AclHuK9jpDSnMmxaQ8D-fp2gCjn8tu1qfqdLAoGiaBjhGMcvT3oSv-_wxieiSxY
Message-ID: <CA+=Fv5QHzus2HUPJNFeWMCFSrOjvr8xhkPie2CLSbdjgK=+j8g@mail.gmail.com>
Subject: Re: [PATCH] perf regs: Add alpha support
To: Ian Rogers <irogers@google.com>
Cc: Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Mon, Oct 12, 2026 at 11:45=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> On Mon, Oct 12, 2026 at 2:41=E2=80=AFPM Magnus Lindholm <linmag7@gmail.co=
m> wrote:
> >
> > Hi again,
> >
> > On Mon, Oct 12, 2026 at 7:37=E2=80=AFPM Magnus Lindholm <linmag7@gmail.=
com> wrote:
> > > > base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
> > > > change-id: 20261001-alpha-perf-tools-regs-c206a84dec7f
> > > >
> > > > Best regards,
> > > > --
> > > > Matt Turner <mattst88@gmail.com>
> > > >
> > >
> > > Thanks for doing this!
> > >
> > > Register selection, recording, decoding and user stack dumps tested
> > > on my ES40. End-to-end DWARF unwinding remains unverified because the
> > > installed elfutils 0.195 lacks Alpha unwinding support.
> > >
> > > Tested-by: Magnus Lindholm <linmag7@gmail.com>
> >
> > I just pulled your elfutils patches and ran some more tests.
> > With your elfutils patches, DWARF unwinding now works on my ES40.
> > Both existing and fresh perf recordings recovered the expected
> > leaf -> middle -> outer -> main call chain.
> >
> > As documented, samples whose CFA depends on r15 stopped at the
> > sampled frame, since r15 is unavailable. Tested-by tag already given
> > to this series.
>
> I'm finding this fantastic and exciting to follow! Being greedy, does
> the cross-platform DWARF unwinding work? perf record on an alpha and
> perf report on, say, an x86. It would in no way block this work, but
> I'm keen to check Matt/I wired this up properly :-)
>

Tested recording on the ES40 and reporting on x86-64 with patched
perf and elfutils. I hit an existing offline architecture-detection
issue in my for-next-based perf tree: it selected x86 registers for
the Alpha samples.

After two local corrections, both perf report and perf script
recovered identical seven-frame chains for all 391 optimized samples.
The r15-dependent workload stopped at the leaf, just as on Alpha.

Both issues predate Matt's patch in this tree. The places to look
are machines__init() in tools/perf/util/machine.c, where the host's
machines pointer is left unset, and thread__e_machine_endian() in
tools/perf/util/thread.c, where the session->data check for is_live
appears, to me, inverted?

Locally, setting machines->host.machines =3D machines and changing
is_live =3D !!session->data to is_live =3D !session->data resolved this.
These changes still need broader review, but the Alpha cross-platform
unwinding itself looks good.

Thanks,
Magnus

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765713;
	b=ViDVwHbGKPM6ZoF2GBPIeIVEtRx0tFosu1La7T8pKBhtCmvFeoc0+YQy0VUkrBCjyyLL
	 wnvgwQUO63ddFDa4J2ORGR3vO7a71YW3TVwuF/wG3+MX5++SFtdyNT65G4F64Mjapo5Od
	 /JpoyehjVrxdTDEImVWhHIfiq2kHf+qs9QhEL3ZqU78H/kVdgTZZzeAOa/WlZTxS58C6O
	 XtRgU4ZxQ9uYDglnAHBrFcLbn48dGECEgKBBYxSxpU3Z2sffEJVX6k0c/6mpBUsthfpMo
	 E31SamuAky4elh1JrNrZq5wj4JLTq53UP74M6Sb5XMqz0KxbhOvQSMvZiUvEaklaYKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IpjoFAQdvouRdlXBjzoC7wJxtan+tyigmF2bs4+iRJA=;
	b=Q0co/fp9RMR8P3jxhG7/0G27ILQ6/wgk5Wn7PFZWdygkqLdJrMOX6qN1cP//PdQAaxTz
	 rIs5RBJTTX7Mv826xEtjl5wAJxjZCRAHwEzn0h/LBcsljqF9AcVX7nhRxuwHPGqVSXDB+
	 xfDeGDrEZjtajAUnIuEzUAomroch+WhuNO+9StaLglxKQESsWfd/RepjBfZ/B4oWmKEC7
	 J+HIMrE905qaT9LtsmfqthNTEbSYzG/tb78w7xOhCqebV8cPZCxEh19d7jgJX0YGkhor+
	 s1uwHNlYfUeAnWjfs0EuYVxR99JNB2QvbGP7yT8QU8cQTIKG5fgI34tuCaYBAUZPK5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=enY0xJqW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529D606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8529D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=enY0xJqW
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so196181cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765712; cv=none;
        d=google.com; s=arc-20260327;
        b=a5aTJF0dkCYhXgHBdeSDby4INHi60aGOCg/e/WOyOdt6uy9NUj4lv7Lvq8t2Av30mJ
         Y+V++WrycuJRXdMZXAVjUEPdDusGF+cXk8yZb5yPCYxvzVKrVe0HyKBp3FWBaz8Kz9Wm
         xzxkXyI1fUAZbc0nZOXU81vMcnnj93sdikP+4/OfonmJaifj2ghbnJ9X1seMTL7yT0O0
         qemdE1273Q223j8q9gmMqGg8KF+VQMakk8bGMQEJ671B7pPqf8G4EMq+p7bzx3gvDJ00
         HmqNrze4INUTC0da8Ev18EI/AIXPP7L0jbw8wXi6H3/HhVondrheLk4B4uAPpWMPQsxC
         mqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IpjoFAQdvouRdlXBjzoC7wJxtan+tyigmF2bs4+iRJA=;
        fh=hR0cppLKLONv9/kRAQtvRISDf5du0yuWZtJ5Ct8+C/s=;
        b=cty02Hy6zWlayhM2zBBvgLi+r0+Po9bImiDYcH1xJONfGYhUELRw96+BnLWzFoksaW
         6J2h743im3gMZEZSpMbzIOyQyuxz1LFs5s1Kgpy+77fC2T8taYreffhUZS/lgRBV+x07
         JFBlHWse41crMDRUEeiZkZRWVohs6YlGyKY4slYrYAzRpIyjsSIQMx0BjaDA0IimU2CQ
         ASgp+f1mvW+3jmel32jmqCzQpsZyCVPmZXqzW25h7pfwY+HMG334AEzOzarBoBiWmFED
         4s+WB/o2wpd9D53eKvEZwI+3qFkLNyuNm2D+e72HUKhTHWTuRNdYxOdM+4xg9YEmg9Bs
         By4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765712; x=1795370512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IpjoFAQdvouRdlXBjzoC7wJxtan+tyigmF2bs4+iRJA=;
        b=enY0xJqWgu4I0upCp3MGG4xd0ic+I88iy6YvAB2xeb44xIIaRd1V97l9e/O3X1esey
         BnNdsx9NVRdayNtq/A8mpmYF+DWuejtCena6aeqE1B8r4WZg9rfZjatH6PoldzwFIPkh
         A/iyPcFje2hsDMw9LN/jailmtUhxxg+hKowXSOr+gFOKnA3BQN7oDM15qH/NAF4ClEed
         1CnCFv+htqcFcDIWqjY8tUMaH+z1BPEHYPBwGEej0Vt+UJH+yLOn1PkUZTk/npHMNjkE
         XBmds7gtd6a4hk2QvVtj8pYVxBfM9lyR0fKWKNrQqME9vV9Q+2SO1m7dZJ8ahipjumOG
         q0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765712; x=1795370512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpjoFAQdvouRdlXBjzoC7wJxtan+tyigmF2bs4+iRJA=;
        b=1VLUAq0LV1IiJpq5pqJbwiF8JN3pnTk2RcllWyzMLosfUr8mB+taSelz6mHJfBJcTt
         IdETd9ltce2C6k6OBiFek8Dr6Sg8mjxPxDngkp4ZPDbNl8SOKcDp1HJc+Qn0kCt0k4eB
         AKQJF/KYwFKyPcsuVO/LArcH6m69FRORbsUh0LqraHeBV+9R7IlcXBtVyucYIG4CC/MC
         Z6cNK7uw3bwg0LmOSL/mgl0+uGo0WXMYVi6US8kHTN5G/QXJC7qVgNd0ebCb6XbfhMkh
         lLBDJsDzHknu8gF0PxxBpRgQjgC0G+0FrWLTWI5MAdXOWX7F+fk4ThyCH1Cooxn0F95m
         XpVQ==
X-Forwarded-Encrypted: i=1; AL+hErH3CFB6MLwLGHihoMKtpIpUQknFN9/giJQPm4XbxiTghJw5wpMxvaD335uYQGMAa4HO7WtxCrwEp2EIyTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bvkLxnwHUjpFrA4e4iPKolZupRwrKjqyVkQwoYswMjRvtTUZy
	k9mZJDR4H234Y2oDn1NVKMwhh9TfzD1db4wPFzm8uZsnwPqUkxI4ewRSv0SCEVOVZKKJMUY6gwq
	oVY5ybbwzASblAXPR8nC8e7WtuwUFNbrSJ75U+Vox
X-Gm-Gg: AYBFou2R/siY/iClfcOg2xORjWJd4g5FNnfhtBo2Y2hhrEBIj0rSHPGeyakMeMR0+9o
	pmqiiWw1Qz/ij/2BSTKhyWGbh1WDU0wmzMiydqRcwQw6RXqKZXdoFsUGGI38J0gVDWYEu/hPiJu
	rUmHnPGyJqKhc/z1Pu6HaDxeyQxbuR22McWtfnadRjYUZvOQnSu4i53HjqnNRVRwk6xYpaeG4el
	B0zUkLyTh5n00uifuUQ0OJ7Q/AjOla88gvgNKmZ5p+jz2aGwkg44yVW4OLQU/+rbrZAOofVHkw9
	ua/y+OVzpkLU8QxP8sB0D0DizcxeT28868iNvTa4taiMlT4ecd20Vo2BPY4vnKiXVD4DkJ83STv
	1BzMmyeAhkqOoGwiNuhKNA/DAplMvtLcPhWDR
X-Received: by 2002:a05:622a:4d9a:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-55c69c30437mr24722481cf.14.1794765711631; Sun, 15 Nov 2026
 10:01:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
 <CA+=Fv5RBKVAdGgq=BGPmLXpczcB3qvQcSw8aat7nB2ePXcG4yg@mail.gmail.com>
 <avQKb-vBxTvMn1yF@z2> <CA+=Fv5SA6so5VjPzjj1tCNKxwOk=5ejj0YhEG483u_-RY+7NoQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5SA6so5VjPzjj1tCNKxwOk=5ejj0YhEG483u_-RY+7NoQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 10:01:40 -0800
X-Gm-Features: AclHuK-kcTOLPOTUA9hzFX_1_ZcS6vTo6b5Nqcec6CO684apf7lqlfr30UJRR34
Message-ID: <CAP-5=fUqDU4qcjHH4=t3NQpjS0m-nsHEw0YkXY9FVTchO0+M-Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] perf alpha: Decode ProfileMe samples
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:47=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Hi,
>
> On Wed, Nov 11, 2026 at 7:25=E2=80=AFAM Namhyung Kim <namhyung@kernel.org=
> wrote:
> >
> > Hello,
> >
> > On Tue, Nov 10, 2026 at 08:31:02PM +0100, Magnus Lindholm wrote:
> > > Hi all,
> > >
> > > On Wed, Nov 4, 2026 at 7:53=E2=80=AFPM Matt Turner <mattst88@gmail.co=
m> wrote:
> > > >
> > > > The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
> > > > ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carr=
ies
> > > > the profiled instruction's PMPC and its I_STAT and PCTR_CTL status =
as
> > > > PERF_SAMPLE_RAW data, which says whether the instruction retired,
> > > > whether it trapped and why, whether it was a mispredicted branch,
> > > > stalled before map, or was killed on a wrong path, and what PCTR1
> > > > counted while it was in flight:
> > > >
> > > >   https://lore.kernel.org/r/20261104-alpha-profileme-v6-0-63362e929=
0a3@gmail.com
> > > >
> > > > This series is the perf tool side. Patch 1 decodes the raw data in =
perf
> > > > report -D and perf script -D, as is done for AMD IBS. It copies the=
 new
> > > > uapi header from the kernel series into tools/arch, so it should wa=
it
> > > > until that header is merged. Patch 2 adds a script that sums the st=
atus
> > > > by symbol or by instruction, in the style of DCPI. Patch 3 gives pe=
rf
> > > > mem a ProfileMe event, as the kernel series reports the DTB hits an=
d
> > > > misses of loads and stores in the data source.
> > > >
> > > > To try it, with the kernel series applied:
> > > >
> > > >   perf record -R -e cpu/instructions,profileme/ -- ./workload
> > > >   tools/perf/python/alpha-profileme.py --pc
> > > >
> > > > I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
> > > > branch tests random data reports that branch mispredicted in 21% of=
 its
> > > > samples, and 0% with sorted data. As a normal user, perf mem record=
 on
> > > > a loop that loads one word from each page reports the load's DTB hi=
ts
> > > > and misses.
> > > >
> > > > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > > > ---
> > > > Changes in v4:
> > > > - Patches 1 and 2: ignore TRP, and MIS and the trap type with it, f=
or
> > > >   an instruction killed before it was mapped, as the kernel series
> > > >   does. Thanks to Ian Rogers.
> > > > - Patch 2: record cpu/instructions,profileme/ in the example, as a
> > > >   precise event now samples only retired instructions, which leaves
> > > >   the killed% and invalid% columns at 0. Thanks to Ian Rogers.
> > > > - New patch 3: add a perf mem event for Alpha, cpu/cycles,profileme=
/.
> > > >   Suggested by Ian Rogers.
> > > > - Link to v3: https://patch.msgid.link/20261102-perf-alpha-profilem=
e-v3-0-4bf6e1dda733@gmail.com
> > > >
> > > > Changes in v3:
> > > > - Patch 1: silence -Wpacked around the uapi header, which breaks th=
e
> > > >   build where __u64 is 4-byte aligned, such as sh4.
> > > > - Patch 2: only read raw data from cpu PMU events, as a tracepoint'=
s
> > > >   payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
> > > > - Patch 2: print a table for each thing PCTR1 can count, so that mi=
xing
> > > >   events no longer averages unrelated values. Thanks to Magnus Lind=
holm.
> > > > - Link to v2: https://patch.msgid.link/20261030-perf-alpha-profilem=
e-v2-0-9ce2f0b0e622@gmail.com
> > > >
> > > > Changes in v2:
> > > > - Patch 1: copy the raw data out of the sample and convert it from
> > > >   little endian, so that it decodes on strict-alignment and big-end=
ian
> > > >   hosts.
> > > > - Patches 1 and 2: follow the new 28-byte struct alpha_profileme_sa=
mple
> > > >   from kernel v2.
> > > > - Link to v1: https://patch.msgid.link/20261028-perf-alpha-profilem=
e-v1-0-f46c1938d001@gmail.com
> > > >
> > > > ---
> > > > Matt Turner (3):
> > > >       perf alpha: Decode ProfileMe raw samples
> > > >       perf python: Add alpha-profileme.py
> > > >       perf alpha: Add perf mem support
> > > >
> > > >  tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
> > > >  tools/perf/Documentation/perf-mem.txt          |   3 +
> > > >  tools/perf/arch/alpha/Build                    |   2 +-
> > > >  tools/perf/arch/alpha/util/Build               |   2 +
> > > >  tools/perf/arch/alpha/util/mem-events.c        |  17 +++
> > > >  tools/perf/arch/alpha/util/mem-events.h        |   7 +
> > > >  tools/perf/arch/alpha/util/pmu.c               |  11 ++
> > > >  tools/perf/check-headers.sh                    |   1 +
> > > >  tools/perf/python/alpha-profileme.py           | 178 +++++++++++++=
++++++++++++
> > > >  tools/perf/util/Build                          |   1 +
> > > >  tools/perf/util/alpha-sample-raw.c             | 156 +++++++++++++=
+++++++++
> > > >  tools/perf/util/sample-raw.c                   |   2 +
> > > >  tools/perf/util/sample-raw.h                   |   2 +
> > > >  13 files changed, 412 insertions(+), 1 deletion(-)
> > > > ---
> > > > base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
> > > > change-id: 20261028-perf-alpha-profileme-8010299be323
> > > >
> > > > Best regards,
> > > > --
> > > > Matt Turner <mattst88@gmail.com>
> > > >
> > >
> > > My plan is to take this series through the Alpha tree alongside the
> > > kernel ProfileMe support. Does that work for the perf maintainers?
> > > An Acked-by would be appreciated.
> >
> > Should be ok as it hardly touches the common code.
> >
> > Acked-by: Namhyung Kim <namhyung@kernel.org>
> >
> > Ian, does it look ok to you?
> >
>
> Thanks for the ack. Taking this through the Alpha tree will keep
> the tools support together with the kernel changes it depends on.
> I'll add your Acked-by when applying the series to my for-next,
> pending any further comments from Ian.

Hi,

The v4 tools series looks very clean and addresses all the previous
points (masking TRP/MIS when killed, updated script examples, and the
perf mem arch support). Taking this through the Alpha tree alongside
the kernel series makes complete sense to me. I have some refactoring
patches sent out, but the alpha changes are small enough I don't
expect collisions.

For the series:
Acked-by: Ian Rogers <irogers@google.com>
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Thanks,
> Magnus
>
> > Thanks,
> > Namhyung
> >

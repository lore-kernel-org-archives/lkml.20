Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794739658;
	b=g5BpOABMSMYO3J1hp+eq0nLWbVP4y2jbpXxxStg1U5Wlbxq9Fkrk4fOdYLzeX5OefUXP
	 Ab8DaopdWja5bg3GHooyThdoYaJ5/KorerFacERUFQUShIh9d932ZRQ2HbzDL/QU6VwJV
	 zBcuAUQllm/YFFoPI2ppG+9jTM/hQabhEBXiYzVpwTHWVFHuP1Wlnhp5SoPlzRhq+tICs
	 eM5eCfBtUL9tcnVV5aN+UEgL8aB5ERHuba+jtidkTbTuRMzffRgKDoA54de2G1KrgBh00
	 aHCaSi3/lW8N+u1ig0U4sRv0ShwvEqIvGl2FWLLYyEysKiNB2MYUbQhae/62Ua82AKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7hNKkJJ70oe8gF6M+CzP6oDsWzOHjvQZU/Y9Gmdl08c=;
	b=LPlJguom+w1mV4jERK/a53NBni+wi3UxX537u9ua2LprpAlMQu+Mgkc5Oq4P9jggL14w
	 OfXP5ISY7VqHyt7dlhGbQqHWTb/S8d5zYMkSdmhQN4F0+K7I2FESxKRqShfqKACg5c77Z
	 xZ9OIjlAlGoLRg1S2FKZuwxaFy0l0tfAtthBcrjrfFXXFFFBS0Saf8L5kgoqSuGcpE7eU
	 5Jjzwn6tt4uLuDilxjgbA5gXqHIZWbO/+ORb174ICdMDPAdQK1xvWQGoy2/FpZ2ZvWQBt
	 7A1292wkqgQo68NauzeaDi/yHGLEdDAdaiinq5NvT6resaIq8Mgeq2jXWGkfeZp1HAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0yaroapg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E64606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E64606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0yaroapg
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so4144026a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794739656; cv=none;
        d=google.com; s=arc-20260327;
        b=C6dWJr1CpnSUYUfnSId+6Fp1k87ZTcXbJzJFlowbK8RElhIlGU6v/mX2+WVl5wKLre
         /NSHqkmV+TJQ3i035i+JVy6L7mpRQI3U+7e7Mx0kqDH6nZ4yiA5YZwr7I0swcgdryo+Z
         jNnwCgQv6L3yGfYCwAkB5fKQaDpWqo3zt946PjZL1PDlH2iqQfbdhEYjg0bxQMNHj3WL
         OCFjrfcD7zuvzWCy5/UbqAjgc+1ZiMAa1RNydhUK/W+GGGjYgWvWvrMxRkegaNTuPYXM
         aBlrGddP92DJ+LBFFdRJCtU/FnKN8pbciDtauRXQy2S6aIGtne/FufLPVs7ymN170MME
         A9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hNKkJJ70oe8gF6M+CzP6oDsWzOHjvQZU/Y9Gmdl08c=;
        fh=O7pg2+RqPL0vyaG0hgTm6ZmbzABAVHWjLqHxHmS1OmU=;
        b=Hb8oO5pfn0VJhw2XL2QQe8I+ne9rhEUVT6YS9vR4iBp15MQbbJkjmkcSITVIxdEelE
         p88szD4sezuSwXD+19geaBNMYZsMTCCh7NrJCa0e0xYwDDzE2Pj4O681mJfdM2BfGHic
         alDDaCdmoCEm6t9XS+k0QpdMqHsPdyjXb2PjGeHK64F9ec/yIYA81HR5VcKPM5XAQk5z
         Jzd2kWFL1tFLVBuWpoiwuWQ82cw/97KmONhCfK2tLBbv757H583AFHRgjUihkR6maPcm
         c72F1hhU+9yOBy1NmYLl91xJN0NtbPr1XG2riJsJpAn93GG3+Al6TrONjK7ZAzVTLwBB
         v1Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739656; x=1795344456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hNKkJJ70oe8gF6M+CzP6oDsWzOHjvQZU/Y9Gmdl08c=;
        b=0yaroapgliwOF0oOHtWneHn+AdMq1iwYFupBALuhtU3xq7N0C0+ZXMXQBOyAD3GGj3
         ADZtTTRBEDnocmSTov3Wwyi37rGwqCr+HLlstUHOgnypSOW+E+KmursMGa63W6Tnkeb0
         2HJa350marYhNYgiyC9Mhal5zMx0fYTLVN9pK5TFrnev2h3xNhv6Kq+AKp1FWzQW/iu3
         waXFyfO6tsZdUYlhT01bX8S3mtvCYQubF6Z2TTIJiS+atpCFkVXvqr1oc41709tBLZ4F
         jY+ntJosrKvGTfIAPqlra6oMeZ6Tr1ifs4X6fhNMK39u2/RNTfI/rAysCKqQrMoUqKDA
         Y6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739656; x=1795344456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hNKkJJ70oe8gF6M+CzP6oDsWzOHjvQZU/Y9Gmdl08c=;
        b=Q9sDhS/3MPefD75P7ZR4ARKfZSsczGdGnTE2QZZzmuPIAO24qhviRktatEpxIiEAU2
         GxcZuQTga+8z4kVU+O5aOLBZhrR0llT4helSNdFobx/li/7toQeImFhWDL+eNoqmd0Of
         WR1yVBZ20rqJQNx0/p7GTuUN5Wc+gWJ0X9imFPsaUpAEjSa6yaK7OhfA2LEOOmr5lVkM
         lL/ah9iJPnXaPrt7VqtRp1rbYm6X3Qb+xcGpHyBYa6Azkayxns0FSad9RcS885wJ8GRk
         xIsh2BFsYfM4uSdQKo85WLhvio417K3KPSx0iue3DoCBok8fZumKJHFCaO5mVya5r4o3
         kDIQ==
X-Forwarded-Encrypted: i=1; AL+hErG/rI5r+Z081Z62P5YTQGxn8inqnAoli21YL4AKEoTAX8MB86mbpbBLifCxmhcP3NfnVs5G80yCBpt1yik=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DljxZGM/2W+puS9mOQBe0tjPI4tfbNxitvHYg8HZmT3Qe+mmG
	H7I5FVhzXugnylHKOqluog0x8flDsK1FpTnvH2csa5dNfKmFoabZkb8y4dhgc2bKj6uvmUTVQSn
	ysQE5Rzqx8AWdarH/0twxCOgGEYt5/Ls=
X-Gm-Gg: AYBFou1cUT/yW0pnfv7/UEO9u5q9lhvs/MSo/Y38W5OmeqmWkjdDyiB4VmUubzP53LP
	x9uF9MVkegcywUxHyLRZahN9/hWqZdD35z4iX6NbE4/MRmH0xJgTihJItZCBBsQUwngpEVG/Ha/
	OMFP+f0dtyMJYWltfZLUfIVf7dn/WaUqriD0BZBA4sWY0+Clv+KJghIrz5UGXPT7vI52EAHNolt
	RUjAqUMXZbknP6E9+rVuLVSPJ8D8wFrPC9RbM+N2th3by9QVKmiPvQXHuazgSDiDmp5DMtIFy0y
	gBQK7+Rr0xW/1UQNUoOv2gyXePDW+m9eXPjvNZ9+eX4AhkbYRqRNjYZmMLVQFblkI6bTbYMJVYC
	R8mh9w8DNd98x/B6aWY33IXYAol5k1L3y5NhuLSXS+hKMuyRQVQTxy2g5NhVTP+mTod22f5GhSJ
	7s4HtZFbaWxjoj176IxK6wURI=
X-Received: by 2002:a05:6402:13d6:b0:6b5:74dd:37ee with SMTP id
 4fb4d7f45d1cf-6b7c0d2d212mr5900328a12.44.1794739656036; Sun, 15 Nov 2026
 02:47:36 -0800 (PST)
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
 <CA+=Fv5RBKVAdGgq=BGPmLXpczcB3qvQcSw8aat7nB2ePXcG4yg@mail.gmail.com> <avQKb-vBxTvMn1yF@z2>
In-Reply-To: <avQKb-vBxTvMn1yF@z2>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 15 Nov 2026 11:47:24 +0100
X-Gm-Features: AclHuK9Mu_cJKLZOoV0Y-yZCRrVtpzl_e4de-VMWVu7r7OWJeMEUlQrpyeZtftw
Message-ID: <CA+=Fv5SA6so5VjPzjj1tCNKxwOk=5ejj0YhEG483u_-RY+7NoQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] perf alpha: Decode ProfileMe samples
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2026 at 7:25=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello,
>
> On Tue, Nov 10, 2026 at 08:31:02PM +0100, Magnus Lindholm wrote:
> > Hi all,
> >
> > On Wed, Nov 4, 2026 at 7:53=E2=80=AFPM Matt Turner <mattst88@gmail.com>=
 wrote:
> > >
> > > The Alpha kernel series "alpha/perf: add ProfileMe sampling" adds
> > > ProfileMe sampling to the Alpha cpu PMU. Each ProfileMe sample carrie=
s
> > > the profiled instruction's PMPC and its I_STAT and PCTR_CTL status as
> > > PERF_SAMPLE_RAW data, which says whether the instruction retired,
> > > whether it trapped and why, whether it was a mispredicted branch,
> > > stalled before map, or was killed on a wrong path, and what PCTR1
> > > counted while it was in flight:
> > >
> > >   https://lore.kernel.org/r/20261104-alpha-profileme-v6-0-63362e9290a=
3@gmail.com
> > >
> > > This series is the perf tool side. Patch 1 decodes the raw data in pe=
rf
> > > report -D and perf script -D, as is done for AMD IBS. It copies the n=
ew
> > > uapi header from the kernel series into tools/arch, so it should wait
> > > until that header is merged. Patch 2 adds a script that sums the stat=
us
> > > by symbol or by instruction, in the style of DCPI. Patch 3 gives perf
> > > mem a ProfileMe event, as the kernel series reports the DTB hits and
> > > misses of loads and stores in the data source.
> > >
> > > To try it, with the kernel series applied:
> > >
> > >   perf record -R -e cpu/instructions,profileme/ -- ./workload
> > >   tools/perf/python/alpha-profileme.py --pc
> > >
> > > I tested this on an AlphaServer ES47 (EV7). Sampling a loop whose
> > > branch tests random data reports that branch mispredicted in 21% of i=
ts
> > > samples, and 0% with sorted data. As a normal user, perf mem record o=
n
> > > a loop that loads one word from each page reports the load's DTB hits
> > > and misses.
> > >
> > > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > > ---
> > > Changes in v4:
> > > - Patches 1 and 2: ignore TRP, and MIS and the trap type with it, for
> > >   an instruction killed before it was mapped, as the kernel series
> > >   does. Thanks to Ian Rogers.
> > > - Patch 2: record cpu/instructions,profileme/ in the example, as a
> > >   precise event now samples only retired instructions, which leaves
> > >   the killed% and invalid% columns at 0. Thanks to Ian Rogers.
> > > - New patch 3: add a perf mem event for Alpha, cpu/cycles,profileme/.
> > >   Suggested by Ian Rogers.
> > > - Link to v3: https://patch.msgid.link/20261102-perf-alpha-profileme-=
v3-0-4bf6e1dda733@gmail.com
> > >
> > > Changes in v3:
> > > - Patch 1: silence -Wpacked around the uapi header, which breaks the
> > >   build where __u64 is 4-byte aligned, such as sh4.
> > > - Patch 2: only read raw data from cpu PMU events, as a tracepoint's
> > >   payload can pass for ProfileMe status. Thanks to Magnus Lindholm.
> > > - Patch 2: print a table for each thing PCTR1 can count, so that mixi=
ng
> > >   events no longer averages unrelated values. Thanks to Magnus Lindho=
lm.
> > > - Link to v2: https://patch.msgid.link/20261030-perf-alpha-profileme-=
v2-0-9ce2f0b0e622@gmail.com
> > >
> > > Changes in v2:
> > > - Patch 1: copy the raw data out of the sample and convert it from
> > >   little endian, so that it decodes on strict-alignment and big-endia=
n
> > >   hosts.
> > > - Patches 1 and 2: follow the new 28-byte struct alpha_profileme_samp=
le
> > >   from kernel v2.
> > > - Link to v1: https://patch.msgid.link/20261028-perf-alpha-profileme-=
v1-0-f46c1938d001@gmail.com
> > >
> > > ---
> > > Matt Turner (3):
> > >       perf alpha: Decode ProfileMe raw samples
> > >       perf python: Add alpha-profileme.py
> > >       perf alpha: Add perf mem support
> > >
> > >  tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
> > >  tools/perf/Documentation/perf-mem.txt          |   3 +
> > >  tools/perf/arch/alpha/Build                    |   2 +-
> > >  tools/perf/arch/alpha/util/Build               |   2 +
> > >  tools/perf/arch/alpha/util/mem-events.c        |  17 +++
> > >  tools/perf/arch/alpha/util/mem-events.h        |   7 +
> > >  tools/perf/arch/alpha/util/pmu.c               |  11 ++
> > >  tools/perf/check-headers.sh                    |   1 +
> > >  tools/perf/python/alpha-profileme.py           | 178 +++++++++++++++=
++++++++++
> > >  tools/perf/util/Build                          |   1 +
> > >  tools/perf/util/alpha-sample-raw.c             | 156 +++++++++++++++=
+++++++
> > >  tools/perf/util/sample-raw.c                   |   2 +
> > >  tools/perf/util/sample-raw.h                   |   2 +
> > >  13 files changed, 412 insertions(+), 1 deletion(-)
> > > ---
> > > base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
> > > change-id: 20261028-perf-alpha-profileme-8010299be323
> > >
> > > Best regards,
> > > --
> > > Matt Turner <mattst88@gmail.com>
> > >
> >
> > My plan is to take this series through the Alpha tree alongside the
> > kernel ProfileMe support. Does that work for the perf maintainers?
> > An Acked-by would be appreciated.
>
> Should be ok as it hardly touches the common code.
>
> Acked-by: Namhyung Kim <namhyung@kernel.org>
>
> Ian, does it look ok to you?
>

Thanks for the ack. Taking this through the Alpha tree will keep
the tools support together with the kernel changes it depends on.
I'll add your Acked-by when applying the series to my for-next,
pending any further comments from Ian.

Thanks,
Magnus

> Thanks,
> Namhyung
>

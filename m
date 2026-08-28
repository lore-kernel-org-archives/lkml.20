Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5CB3B6352
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894926; cv=pass; b=dNV7YaBXK6ZqioFhczAt8XbYlnR+rFTSw30vpao1r+/+K9OlCkntoaHe3oxI3q8GPWKyA0kdvkvTIwQ0fToMXRXNqXcrlyzCHEAAdCWIatZ170YNR3DU7W1HCPUruwqBYiXIi25dYsxyT6aESiZKjZ2z+KKkmPrOX5O0ZlIFg9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894926; c=relaxed/simple;
	bh=UofT5mRmM760GSuIfZ6U6mue9iONe0bEnw4zvcDNh4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nx5sJdND0GvUJEJGvt8wOBW8d7PPzGKJK7ks7ClKGN/PbRcDivnZjWj/2TEoyRGUYuR2Exnyst8hGrRCgLgWyEAslJck2CygOI/+BOFXQ7+4ZVJSoHb0EGzC6XcEAqTl6lBJYVq/SQxTceKPxUt7xiqb4ZHj4m6yEr7F3N/eYak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UWUWzwdX; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UWUWzwdX"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c10e86e52so111971cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894922; cv=none;
        d=google.com; s=arc-20260327;
        b=YyN/6g4Wn8P44/hoaukwuM6Lucc/ApFcUGl+UyB6b1DrFrYO8CG0CLGdUrn5tFz/zW
         NyUO4VrIAWEp9+BixRg/rYQyeSATbPRsyaC/SVdFWlX4zVt/J0YIQQ/Y6cnyprYDjC7U
         3I4lGDyedviDdrYLO7w+dXWbtnXXZEzkS3HA97t515wQvoc/3FBYuiQxB17NYXUbJWZ6
         PqQJRT1VAHwQZzPKzSjOMeBU5ROP903xwTCW3RvkMy5K7NUSrXQDVPH/AHg3jFtigqNp
         5v/GRzrilWu3m/L6wUAvQGjKqc0M0hu4+Sj0vH13C4miMUzYofgZj3EaIv5hU2HRUHqd
         D86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lHN/QltBvD1McrbA5b6sCOVj97NzYlG2hizEslR8/Uk=;
        fh=WvUQ4Rnft3XTEatvYSRUHYGbmj9PW6rNBwGcC1PgYZ4=;
        b=U79NhXYjMWAyll5F8yt09I9Ecf270S/wZvVDY3mrqDjSKfd5Bhg3MXpLEF4oeT39zS
         XsmSzD8GKWMYRUwDxTUctqbyaW5FkGx4mpGjP3VsXhWRITA7hjgwIObYDRd70BidXuOm
         0Q0FCBh07SF3hxHjPPheZ4mha1yHwFYUpptNVCGsAIT43ZPavbp+U8P6izNlSSDtr5Pm
         3yj8QElgcYof2Q1btibsTkk7D7++7VvliV8yXwbooHr0FGooZVlNbzXhqTGKznJ/DC3o
         sC4+E6JEH1dr5jNlTc2Z5v5ZvV1Guo7tYWlLqxCrnx+9ZyDGZdniAwjaTjx/MxoLGbMR
         Rvww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787894922; x=1788499722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lHN/QltBvD1McrbA5b6sCOVj97NzYlG2hizEslR8/Uk=;
        b=UWUWzwdXtzXK6PSrBLW6+0FXunAvToqSDbJsRS3D+x9+5KhmuS21Pe1JGMNOboJ3+n
         /FRtPt+g70us7HGmIMVWT/f+Y/JkfGdRrDar5fgGYubXctyarUViXaOlX/NanjuGRo1I
         NIhoie215qbwBZam6pAh4hVXeHoDM6dcX2QaAkwHrf3dP5GBaVBo9lG678FCyUclrjtj
         j3gYfcxJ3Z0djl8wneH974jFCYKpFORIkYoYNufL9fLPel/7/gRp9uczd3E40s0x3UJ3
         l62pDtaqzcbAUrp9kntRxroROUjFaxSuTxtrMfhyiF9OWNdeN5dz0vUtGJ5yLNIkFUvD
         BeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894922; x=1788499722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHN/QltBvD1McrbA5b6sCOVj97NzYlG2hizEslR8/Uk=;
        b=lCbU8MW2Mkif3zKKm53Jcl6SEoS5gH/C4Q1cy0wouNu9RU7VVNQmOBUNXekZxtk96M
         CaHklbsJJGp7JbAZcalxJk6Slmz0rfLdO3Zl+PwgtIzocfiyE+gGqVg6TWvVhsPEwm4D
         qKlEzPrIdnl/D1fu0/FpBB/ZPFqrGNb7Dnj0kCcb8dOyUXLj+i+2ZOHWdKXTed0CIkjf
         Yclj4GLIA2jRAjOPjVLLM+74CB6V13Pj08Qy/MQ8V1jg3uU+wcPyvZjiipM+I/sxl+yu
         17c+r0IOduhP/AJewzg5aRiNUhDSSqe+iUaxSV2pXMPA1oqcDITJQ2QBufYWmkkml5KN
         4VKw==
X-Forwarded-Encrypted: i=1; AHgh+Rph5PzKmHyzbpedZecWz5Rc/0fRenpbc1QuOiZ89tTWZOjUeEOFXA4C6QYdbn1D9qGXAcN/u5Jxe4OexS0=@vger.kernel.org
X-Gm-Message-State: AFuF++m7MLdxg9MDk2bXWbEH9NW6rupptu/hnDlAGXYcqU8oJ8lnQpqW
	ioRTZfi0qZBFasbhgPZFJqPKv6ENhcKVtafJl3UZVyTt/NRGGnYrE6jH/D3eeOlk814+OE9ZXxo
	dUQIo/TwsKysfAC3+X6VuPQPc7TX2ZLtuCUjt8VBX
X-Gm-Gg: AR+sD10sh5qK7Zp9XRE4KrFsQ1YfzBub3U6KwiLIvw61T1JmjZyzI/mhDz5I6kZNerx
	vI+J47z1aR0+W4MrcIA1ChvXEj88cLL8Rt4DyD51QtIc9wVVx5GO/Fce8AUCvu8rIjKLeMUWFXk
	U9s4xr84eWSQWQm7q7QmrCCWnZbr31zKMhgN/2UnSnLDCRxzF/bidHVzJ5e4lWLy1+dSdws9upm
	c9Kkg4X1IOXFSMWSopU8aEpke8jODvUMmqdukWPC8MaURBf5LJ5HJNRurF0OURYTx6OzOSmOup/
	Dtc3VleAMT/7FclnXRAnwE+XOYheI2CTiKu4nBBgAgHgOQ==
X-Received: by 2002:a05:622a:4c89:b0:52f:6e06:89ac with SMTP id
 d75a77b69052e-52fbc9cdef7mr8352721cf.13.1787894921905; Thu, 27 Aug 2026
 22:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527221934.3830896-1-ctshao@google.com> <20260528001117.3BBF11F00A3A@smtp.kernel.org>
 <CAJpZYjUiNdN3a6y+8rs=YP2Mgtj6EQJnkiB9TN_suWd8fGkoEg@mail.gmail.com> <CAJpZYjUhw8+ouKTS82G6ih457=pHn18AtvwMCAcaTL9csKmdTg@mail.gmail.com>
In-Reply-To: <CAJpZYjUhw8+ouKTS82G6ih457=pHn18AtvwMCAcaTL9csKmdTg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 27 Aug 2026 22:28:30 -0700
X-Gm-Features: AcwNN1VmxtjaqiJtU04BwRwhshiUh2oD2ByScKUOA-7C4gmoRH7Q6VHbWd_zlJU
Message-ID: <CAP-5=fVAckZihxg4djQn7iTGbNNT1vFLXt2En8mm8+COSs3GcQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 1/2] perf pmu intel: Generalize SNC cpumask
 adjustment for multiple platforms
To: Chun-Tse Shao <ctshao@google.com>, Zide Chen <zide.chen@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 11:44=E2=80=AFAM Chun-Tse Shao <ctshao@google.com> w=
rote:
>
> Ping for attention.

I suspect Arnaldo and Namhyung are waiting for feedback from Intel on
these patches. If someone could check them it would be appreciated.

Thanks,
Ian

> Thanks,
> CT
>
> On Thu, May 28, 2026 at 2:31=E2=80=AFPM Chun-Tse Shao <ctshao@google.com>=
 wrote:
> >
> > On Wed, May 27, 2026 at 5:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > >
> > > Pre-existing issues:
> > > - [Critical] An integer overflow in `uncore_cha_snc()` can result in =
a negative Sub-NUMA Clustering (SNC) node index. This bypasses the upper-bo=
und check against `MAX_SNCS` and causes subsequent out-of-bounds array acce=
sses.
> > > --
> > >
> > > commit be394e8b7ddbe730c3fc40fb608337fe19c7b33b
> > > Author: Chun-Tse Shao <ctshao@google.com>
> > >
> > > perf pmu intel: Generalize SNC cpumask adjustment for multiple platfo=
rms
> > >
> > > This commit generalizes the Sub-NUMA Clustering (SNC) logic previousl=
y
> > > specific to Granite Rapids to support multiple Intel platforms. It us=
es
> > > CPUID to determine SNC support and caches various PMU configurations
> > > to improve thread safety.
> > >
> > > > diff --git a/tools/perf/arch/x86/util/pmu.c b/tools/perf/arch/x86/u=
til/pmu.c
> > > > index 7c9d238922a6c..9b00d5720fb7a 100644
> > > > --- a/tools/perf/arch/x86/util/pmu.c
> > > > +++ b/tools/perf/arch/x86/util/pmu.c
> > >
> > > [ ... ]
> > >
> > > > @@ -121,46 +142,73 @@ static int uncore_cha_snc(struct perf_pmu *pm=
u)
> > > >               return 0;
> > > >       }
> > > >       chas_per_node =3D num_cha / snc_nodes;
> > > > +     if (chas_per_node =3D=3D 0) {
> > > > +             pr_warning("Unexpected: chas_per_node is 0 (num_cha=
=3D%d, snc_nodes=3D%d)\n",
> > > > +                        num_cha, snc_nodes);
> > > > +             return 0;
> > > > +     }
> > > >       cha_snc =3D cha_num / chas_per_node;
> > > >
> > > >       /* Range check cha_snc. for unexpected out of bounds. */
> > > >       return cha_snc >=3D MAX_SNCS ? 0 : cha_snc;
> > >
> > > [Severity: Critical]
> > > This is a pre-existing issue, but does this range check safely handle=
 very
> > > large values for cha_num?
> > >
> > > Since cha_num is parsed as an unsigned int via sscanf() from the PMU =
name,
> > > and cha_snc is a signed int, a sufficiently large cha_num could cause=
 the
> > > division result to overflow into a negative value.
> >
> > I think it is very unlikely we would see cha_num > INT_MAX.
> > Since that is a pre-existing issue, I prefer to fix it separately.
> >
> > Thanks,
> > CT
> >
> > >
> > > If cha_snc becomes negative, the cha_snc >=3D MAX_SNCS check evaluate=
s to
> > > false, allowing the function to return a negative index.
> > >
> > > Could this negative index then cause out-of-bounds array accesses whe=
n used
> > > later in uncore_cha_imc_compute_cpu_adjust()?
> > >
> > > uncore_cha_imc_compute_cpu_adjust() {
> > >     static bool checked_cpu_adjust[MAX_SNCS];
> > >     ...
> > >     if (checked_cpu_adjust[pmu_snc])
> > >     ...
> > > }
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026052722193=
4.3830896-1-ctshao@google.com?part=3D1

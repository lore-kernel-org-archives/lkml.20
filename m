Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D614CC60C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498485; cv=pass; b=jMe5cNc5YK3BqXVSxjQ6j5gpmuyMgi/d1aGD90tpO2fO2SuGVG87eWvdourzl3erkkbXCk5qAwa/l2hXdllJLSEztyq/6Fxf1AtZwhv59fJwmF5GOnmjtu4NzulQ0EIIoaZ0ApiFSJIpkwt1K/98EGt94wLnXtcL7nZ6U9jizDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498485; c=relaxed/simple;
	bh=GFVmruL3cPBEfvtAGaHzMJQ7fSP1HiCWYM4XCZnhV+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUQw9xmH0W7DXrDbRSTrs0pwmg++YjRq5NUS3Fg58QT/v42qJgoJ8Uz+tK7BgRKcPgm/MOL9kShU8YrpYvfpUdKg43WBedqNOYlt4tuAWIn3nSLuPn/IOKLz+wHLtufp4IGVKzN+tth5eGx4HHY/IPx9ilONQQzJxJlqSy6eM2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p99GtV8I; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p99GtV8I"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b917769so16885ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789498481; cv=none;
        d=google.com; s=arc-20260327;
        b=e/V4YJjuA6qR5DXuiqf4EpYXQPQvUxfee+PlUANlyYZyv/91oeP391E9+Sk8p8NDfQ
         jKHfB3/oF2PTiMmjQN4U2nGk7LLmsjgIagq91mH/Rb0hRSzqbtE/VPvu/hJlJQsc8QOq
         Mh4bcX4Bb5PfbwcKrXrG2xR/AR/ZQIfHZs9h/ljcpsRnMnR1qsgNjntNZiM7DARbJi9F
         ZF/j2xeHZfsP1A8LoMmXiiVzlB1UT06VLz7scwCjGBOa3Sj4qauIJxxojtiUkZq2rK6l
         HJwnwqU0Uye3GKFVkpX2Eb0/3vpvcvq1aaNiOifzjajwd4THqLgDxRIcw4aekOLNVmjU
         WY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=arRFlThrQDHJouWNW7pmtVkTmqxo0HW/M/+9WZYjCjk=;
        fh=sDU7mG0qe7YF1/OJrwzSLQ6tBz6bujiF9icpq+qf+I8=;
        b=r7CNx95UX04HNjEWD5VCm/reprTS2s6Ljlu7oFfJ1FescODS9LmwzsGudBIi9V4h4R
         xlCbtpBQsxmGxmQ4vS+/o9w/6kugyfpjg88g1SOO7x5U3aAgTbuw34wABXbdVW0NC/Qd
         V85TwExOxI6QhZnI9/CUxSJczErNhjUe0tiy/kxwOuggfUxtiRe37AxArCtTBRzV7SxH
         9xeBF9iYuNs31hsDkHK+CPONohIjqJ7QK3ZrzGjyLGjE72uzlUY1wjAd5U0BZX8/aGsq
         njde2JDHHfACGNkRgFuvtVDzxhdV+Uvmyyz49JOqKkQ4UnhMbpWj/Ab57k224qVqeymS
         y0Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789498481; x=1790103281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=arRFlThrQDHJouWNW7pmtVkTmqxo0HW/M/+9WZYjCjk=;
        b=p99GtV8IJbaqgDDJdNBocD5smW+ZzW1gB4uhxBvMkMwnD1gsUtP/V3t7ce5J660JPK
         jL+3uwMTNmmHqWrshe6k8m3A5FuhfjpSrqK7LoGxfT6jnoxdJTmhgNah2C2aX5I6kN4M
         gUF68Y67iogmamaZRAbP+o/ca6/PQvPcYgQDmXfTRUT6LwxqsLUrD2/sQm9Kkmp8p6cn
         aA2P5tXNJhrd3QNJJiGeP51AKvxUJTjyHFsDsUlITX4HABzlv3fsdJXuBwf6FVrnnd/E
         S8YKUT3f3y5N5NN4WpYl0Q0rqV+RwhhLUiAz113mua69C/N3ZzwGM0z1+RLLVEDWrm+H
         /cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498481; x=1790103281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=arRFlThrQDHJouWNW7pmtVkTmqxo0HW/M/+9WZYjCjk=;
        b=24YhgebImQqZSUWmu2KXzGgC25xenm6QV4qYpQT804DnWoDQ+UgOkCfotGbvMzEeu3
         WHz9tSu8ln2xwJUqYfXsRCW+GfiX+BfuUDjSbk1yelNOK6co4yf76yeqiRzu8lVgs1MN
         KgFnFwg7lJ0a6qXq44z8FpN07IIvDaPiPNaqOYZ7rxufkygsdMIVbTjFDpNtGcNGSliu
         VJGYHE9qmZUZSWGlARh86kVSYgTkqfQ8J5nmdyNjh/noJBVJgJOnt8/p5hWcaLiN2B1w
         4AmyMxi29qPbBU/0NeZT8lnAP8PZkqvoO7vZ6cayc9Re5lNkSmALA3zmAw3SvidnyH8P
         uGvA==
X-Forwarded-Encrypted: i=1; AKwUvBzpDZY7IvCxD6/f162HaKqkcFJUfeC1cmw/hzFYFs13fumNqjrcr7Z7P3OddIPHJ/Sjf180VlZFU2jRJc4=@vger.kernel.org
X-Gm-Message-State: AFuF++l5JswDYc17grh9jtxxdmJHjyvtdIGG2M1K3CInFqKHwmnbidM2
	TlFtZHK1GMPO/lZ0FLWJckx999GT3wf56z9MClgntkVeHiEty2Z6H7/s9bhWNMr2xu8YQNRReSR
	PwX8tXJMazGQYAlmHMbaycUt3aLaGFciaNSVJbmaN
X-Gm-Gg: AYBFou0wJSuRtk3a4oIHtmX7yewKmJLi+W9v1NmJJl4bu7XD+uorg03pmZgUJuTGL0C
	jUhqZAIarsy8YXb8XkpeejAi8zvNuhaE7sobZnEvsQuGLiH5qYEYzPUTVWAZWHayPF72wMrGsZg
	4vYh9Jr/1J6PGQvK5GYwVkyJXZolZ4+rwSNGKFiHWgFHIIF7EYh2s0vV3Le6eOjqa8iK+cMuUxY
	2yOfOtCPyx91B4JYj1Fh/t7Xsy/Cu7l86R1mGY2MS6LQwoZIX6DfT7svA8hqZXtRXEpYJc1jWjp
	3HD1A0LIwtgn+MP0fZSXzPykAWxEI58aB6QaQFAiE6dWzxR6psfCUHQb/5+j+5LELsOrKw19u+T
	40vxl08pcGA==
X-Received: by 2002:a17:903:1965:b0:2d5:db3d:1a45 with SMTP id
 d9443c01a7336-2dd89c53b5fmr918555ad.18.1789498476071; Tue, 15 Sep 2026
 11:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602181349.3969429-1-ctshao@google.com> <20260602181349.3969429-2-ctshao@google.com>
 <CAP-5=fVwLO29i5SoLjOBhPqqUMTiy-z52Wm1mbeBF_941Jbx9Q@mail.gmail.com>
 <aihLa9ezNXXZm9mC@x1> <aqdRi7v_A03mY1tU@x2> <CAJpZYjXT5rrqQuUTePV6WS5XafgtW1Z4FxMoT93uKjYdKU1VWw@mail.gmail.com>
In-Reply-To: <CAJpZYjXT5rrqQuUTePV6WS5XafgtW1Z4FxMoT93uKjYdKU1VWw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 11:54:21 -0700
X-Gm-Features: AcwNN1VVwoWvz_e9gxbcbMEzwLeLB1HYP1av5G-CVgrJRZd7px1Xy6Hu_Vz2LQM
Message-ID: <CAP-5=fWKaSgVF5M-m7fObPdt5=MFZpK0RcmAS_G5thTYSzLXPw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] perf evsel: Find process with busy PMUs for EBUSY
To: Chun-Tse Shao <ctshao@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:30=E2=80=AFPM Chun-Tse Shao <ctshao@google.com> w=
rote:
>
> On Sun, Sep 13, 2026 at 6:44=E2=80=AFPM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> >
> > On Tue, Jun 09, 2026 at 02:20:43PM -0300, Arnaldo Carvalho de Melo wrot=
e:
> > > On Tue, Jun 09, 2026 at 08:58:03AM -0700, Ian Rogers wrote:
> > > > On Tue, Jun 2, 2026 at 11:13=E2=80=AFAM Chun-Tse Shao <ctshao@googl=
e.com> wrote:
> > > > >
> > > > > It parses fdinfo with PMU type, comparing with the event which fa=
iled to
> > > > > open, and report the processes causing EBUSY error.
> > > > >
> > > > > Testing cycles and intel_pt//
> > > > >
> > > > >   $ ./perf stat -e cycles &
> > > > >   [1] 55569
> > > > >   $ ./perf stat -e intel_pt// &
> > > > >   [2] 55683
> > > > >   $ ./perf stat -e intel_pt//
> > > > >   Error:
> > > > >   The PMU intel_pt counters are busy and in use by another proces=
s.
> > > > >   Possible processes:
> > > > >   55683 ./perf stat -e intel_pt//
> > > > >
> > > > > Only perf with intel_pt was reported.
> > > > >
> > > > > Reviewed-by: Ian Rogers <irogers@google.com>
> > > > > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > > > > Assisted-by: Gemini:gemini-3.1-pro-preview
> > > >
> > > > Arnaldo, as the kernel piece of this landed (thanks Peter!) could w=
e
> > > > land the tool part too?
> > >
> > > Thanks for pointing this out to me, I'll do some housekeeping and
> > > process this.
> >
> > I think this hasn't landed, I tried to find the userland part of v8 but
> > didn't manage to, can you please point it to me?
> >
> > - Arnaldo
>
> Hi Arnaldo,
>
> Thanks for taking care this. The link to lkml for this userland part
> is: https://lore.kernel.org/all/20260602181349.3969429-2-ctshao@google.co=
m/

Hi CT,

Would it be possible to rebase and resend the tool part as a v9? This
will also trigger the Sashiko review, which would be nice to have.

Thanks,
Ian

> The kernel part
> (https://lore.kernel.org/all/20260602181349.3969429-1-ctshao@google.com/)
> was merged by Peter Zijlstra and I can see a tip-bot replied on it.
>
> -CT

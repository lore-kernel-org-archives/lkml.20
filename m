Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794248890;
	b=QRqKnMxRR2AGdgYvOSCG3MNBq2h/aIZ9usqsjNlNj2SnAgpKDP7MCVmjiPxrWk3vV3io
	 7PDu0f+aOthxLBhBG8LhhXvzb6ofEHpRVzqHAawhEWWU+8s0lKu1UiGU1TfiSgancyRpa
	 RZ6Yb1HUOrkajRQqEh5hlOMbzRhe3uyHTvx8h9cpIHMMgq19LQO6Ye47TQF74Q/BImJtp
	 AG9TJ3MV6cKbssrYL2uvsyNW/W9CIjEdT0zlRrUq3CTccRMhKgcC+Z0Hj6IKgeyi1YqHN
	 kupPiUlrlgyPMWH8SyGAKMPJzneTifnn/HlbwWgXOzSIeEfg/87MebyClcgUmhKSEZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=onbhuscWzyLZqd/joE4aKkaohJkFteguQkplQKwQm9g=;
	b=nDU9ReYCU99CFw66YURiHrWQ5292j7H41HK8ESaSSyI1gwWja8L8B8Wa8L3SuBLc+9px
	 5AkyYuK3AGILICEZZWpbD70DYjmqy+I8EvOvrXKjDiC08NNp6KRpky6KVXSl9InWUjn/d
	 aSCk2zFQsF3YPohUQjTVcxsgRHfrn2silhI8WlPxawS0o0L6CRgzzwOk6xbDl3YEwocDr
	 pgLSGhUpq6gGaJUPgB6kdqOgna/Do5k//2Ix2Au656iqybRp7z+G5YtBwL+OnreDtOUgx
	 8lGSfTrUb1tH4LuRMf3CVXx1LvaZVhUfydF5RT2nbs3eWvgXn2EQ+GSrS50MuF7Eteg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ae+I+Mhs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D2A60A2611
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D2A60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ae+I+Mhs
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-150ef97e790so689c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:28:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794248889; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGNgIr0GB7GEVyAmKzo+5bvX5GKOg75BY2UQLx2POKTWX7216xANjpNCm4HB6dufgD
         2vfm1mKoeXzrDUFqT06xBhDKHmId/J4/ic4Hfq6qxT7t+YgBab5tt4kunYPIfQVrD9Ev
         E9U+BQpy/51DKnrtes+zMTxaPpYqql3oLVOW8qqzn3o6apKxIs6OjiJsa3Do8BJT2bNR
         M7rJpzBCZ6fGjR2H/lVNX/Auh+rs3iBJG6WFFKI5TyGdj7/G38BI1sxeBupa2apJcl0W
         JDKgOkymC0hFqhiS4IW1wtZHeQZZZJ/lWhEg2TNx1wQFDE4SEzMhT+bgV8pi96rULKpc
         hV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=onbhuscWzyLZqd/joE4aKkaohJkFteguQkplQKwQm9g=;
        fh=x3fZF8/mOd06tvz8YWIje7hRn8/IfDhIuh0RXkY/LGE=;
        b=aJFGr0UiGBw6CGG/HRlCFTiDjmH80LJ0MypfmsBBnQL3gIdtsAVBd3wn20Sqg0UsFl
         tEHns19GFVcOo0Hic9gKeHuA2esfMyyMvM6hSzL14nLWedcOsS5PYhZSnf8Xhf6OMDv9
         ukMQEtMaoc2Svw5UwSQ8luwulR8XAYgZsY1juORXPUxxbTfLp8DgWLPOBpvhe34BePz0
         58O3Jr3x+ow7o7no1pLYXghjtQlWeTzN/yvQR5voKb2WkNx6qcw48emUG0OtO5hAy8fX
         V5zEiNxrrTNcPRlKWve7KIgXIsPjSh04kW5KHQVzP0H1D4jilh15iy18Gc4+LV7w6Ezp
         tHag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248889; x=1794853689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=onbhuscWzyLZqd/joE4aKkaohJkFteguQkplQKwQm9g=;
        b=Ae+I+Mhs6P3c3aeOvgLmKHMqLbQ5Ql5Dtk0E5pVu0HRqYfnDLwtbUTaF8ZSCYPHtY7
         509uVskCE4CCqjmBIqZ2458GQAJCD2lUjdkpsY/6I7384a4kFxVOpeNSUeN0hKURV2mR
         Mw1dzvkFwW2i7iAh6p9epDZhBw8mMyk4IgBjzbzhp9ozHFWi+EZs8dw0gRkpK/GLwQc3
         AJex4UR81dsoySTS5swBwJUFY7c/NpIw0df+ygbhMiykLUD2YRvWoJe/AV4FAwiSuGfx
         aSkT9AiFoBUXzoU1QKQkkwHeJjcSRF+7u2aksdOExyzSUlLAluoxaf61+wKnfKhvbtZW
         aAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248889; x=1794853689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onbhuscWzyLZqd/joE4aKkaohJkFteguQkplQKwQm9g=;
        b=YHgf4wArndtj38Ru4gdyQWPBx0HcAtLZQOosXIwUkAXANkU3pmZ1MPVPF1sYeUz4+z
         kR1JJVi6RzuHPffU32AzD/sIZXPsdZsJreyUIn/4LbLtYLMHC/q113EsjB4UCPCjrZgT
         5L19VLVSxpvx8EFN5uzriYsGwh6tO0Oeamd7gebDPJQZI57/5zPbJMjm0cA2HbjvyZ6u
         WU/0PaX+VcDJgQA7wh+XUeirRcqyakbVguWYuhmVzn7KwLdjATZtCvUzQgCrfAEe2yfA
         v34xfqBKAqnHkKqqSubV3ydMuHPbbJRYiRGK8lcQYQ/tqjmVaBwSMQr/kUyizX64qU8B
         1BTg==
X-Forwarded-Encrypted: i=1; AL+hErHzvbbVVNk3GuEoDUyvWg1SyExkXOFBL6XbQnHwUzsZEDu9UPvejOezEqML4TIGIwduY5vl7rbqD+ZW55o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MiUtyBXYasEDYMucxRTjmbjYruF9Dp4L/MfTSrbe5So/wioIS
	KQ/Ngq7Y5T0hg0Ql11POtqNjdyjx/ew3FmZEGY4ve2R7K/h6nhY93XL+BWOS4MetZ+TfyRKc4Ow
	3mFwSqy1j8eHnnomO60IPe6xoJ1kwD9WqZs8nikgk
X-Gm-Gg: AYBFou1B7evLKLtM4vMw1EX6noDR2n1aq9rxr//PGIj/cQU99MxwfLzJQkpUI/USqVq
	ZV7Lqg8e0D2cosxd8Pf0qYoM4LFSI3kS1I1RsO84aQZ4oUbtF7Iuy7U8y/deRuI53ui57b1zjnr
	P8B8U6j9BQ5DD4jawlAr2O2nZOrvc86WXJn3qoatdhYZu5Fw+xlGsFVr0FX6aDCPB8n5yr7XLys
	UMk6K1IOgglhZ9nEdHgScLwWsJfPrVw7ZHWm56eT8mmadhEPggeSoTgVnlV8N2x9WJ+FKiHTATa
	yYRFri/sH1BsTjv/gbXMWB8rsQs499JsQZyEGl+LAKiJQc1uLi3sxvCIko6hD0Ti05Nl9fhvyyx
	bC0OgqDLOou274TurlacA0wB8DzAgSbotAZwD5CommLSCjfICnmp0cjhURlwIeVdiDY8=
X-Received: by 2002:a05:7022:7f05:b0:175:e9e6:65b4 with SMTP id
 a92af1059eb24-1b3b669eb9fmr17579c88.12.1794248888546; Mon, 09 Nov 2026
 10:28:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018074528.974953-1-lalitmaganti@gmail.com> <CAG2KctqPvou3A_EGiov9yZJrCWMmoEX-k4-Or-RGj_Cxdtc7Fg@mail.gmail.com>
In-Reply-To: <CAG2KctqPvou3A_EGiov9yZJrCWMmoEX-k4-Or-RGj_Cxdtc7Fg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 10:27:56 -0800
X-Gm-Features: AclHuK8pbA3eUUSFeQWBjdS2pws91SjahYa1K85SfJKzJtfTuVy9iTlcIK_4fmo
Message-ID: <CAP-5=fX6aqHuaV5c+Kfk5iY7SWgXKu+kWX+ReQ4agqkHg89tUA@mail.gmail.com>
Subject: Re: [PATCH] perf python: Accept events larger than union perf_event
To: Samuel Wu <wusamuel@google.com>
Cc: Lalit Maganti <lalitmaganti@gmail.com>, acme@kernel.org, namhyung@kernel.org, 
	james.clark@linaro.org, adrian.hunter@intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 9:58=E2=80=AFAM Samuel Wu <wusamuel@google.com> wrot=
e:
>
> On Sun, Oct 18, 2026 at 12:45=E2=80=AFAM Lalit Maganti <lalitmaganti@gmai=
l.com> wrote:
> >
> > Samples recorded with --call-graph dwarf carry a copy of the user stack
> > and are larger than union perf_event, so session.process_events()
> > fails on the first one:
> >
> >   $ perf record --call-graph dwarf -- ./workload
> >   $ python3 tools/perf/python/stackcollapse.py
> >   ...
> >   TypeError: Unexpected event size: 4168 < 8424
> >
> > This makes all the standalone scripts unusable on such recordings.
> >
> > pyrf_event__new() rejects events larger than union perf_event, which
> > guarded the copy into the union that pyrf_event used to embed. Since
> > commit 2c672ffdad4b ("perf python: Lazily copy events and samples from
> > process_events") the event is borrowed, or copied to a buffer of
> > header.size bytes when a callback keeps it, so nothing depends on the
> > event fitting in the union any more. Remove the check.
> >
> > With this, stackcollapse.py and flamegraph.py process a DWARF recording
> > of a two-thread workload, with the same per-symbol sample counts as
> > perf script, also when the callback keeps the events after returning.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lalit Maganti <lalitmaganti@gmail.com>

Probably worth having:

Fixes: 2c672ffdad4b ("perf python: Lazily copy events and samples from
process_events")

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > ---
> >  tools/perf/util/python.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> > index 60dbe2dad5eb..8b4b2f3d0926 100644
> > --- a/tools/perf/util/python.c
> > +++ b/tools/perf/util/python.c
> > @@ -1792,11 +1792,6 @@ static PyObject *pyrf_event__new(const union per=
f_event *event, struct evsel *ev
> >                                     event->header.size, event->header.t=
ype);
> >         }
> >
> > -       if (event->header.size > sizeof(union perf_event)) {
> > -               return PyErr_Format(PyExc_TypeError, "Unexpected event =
size: %zu < %u",
> > -                                   sizeof(union perf_event), event->he=
ader.size);
> > -       }
> > -
> >         pevent =3D PyObject_New(struct pyrf_event, pyrf_event__type[eve=
nt->header.type]);
> >         if (pevent =3D=3D NULL)
> >                 return PyErr_NoMemory();
> >
> > base-commit: 1c90f0a3c8a1c4e38f9edd97af9e20848805a7fb
> > --
> > 2.56.0
> >
>
> Reviewed-by: Samuel Wu <wusamuel@google.com>

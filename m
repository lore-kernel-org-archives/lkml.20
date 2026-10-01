Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00BB48F006
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873136; cv=pass; b=tPMcWZn59iCufbKBrbSzMQY5i7+4PdHcPyODttwRj1LG165jGQfHwP5nqdFTZ1LM3Hc4GOXX2SpmWBwBJT1jqbfZ7ksJJ/9PgON3xgudqXMWYkfubE2M21YzA92yYcIH+KsG93rLce6z/BIcMZng/Ii7Ck/DeCXG9TxdEiQkqn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873136; c=relaxed/simple;
	bh=skO6HOeEOlSoI8HYXQ1xBxBxbaOcIwy1hi5C/W8lSm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7/sefnap5K/wWAjgLReCJsslB/Yu74w4uQ8mpzKX8My3/9BHHlN68v2CoMIIcu/HxHB8dXNtq0ba7HBIlgxSuTWoXlmFseK9qRZK8eVj43Rcn4i99p53KPxQuxWPP74g/HsHikqpJrNxpR2ghJ26ZZBzUzdpc1nmP2VhjxRc3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dSHQvlV3; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dSHQvlV3"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5337c7b9937so1001cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790873133; cv=none;
        d=google.com; s=arc-20260327;
        b=fvcv1RAGFjS3GqJ2G+VTZvhlQ60Dwyclx85PoOWkMnC2E5tYaKOXbyVtyIIrbCeCFF
         8Fns9WPwFV43IDWHtf/TPblXmpam1b37FyQEDvnGq516nLRszNiTSuH7HDcKgagTT1+F
         7g3XegDZTlhJ6cy4uHMaENPiZgmhXYTrWukgy0Th/ocKcFhHSl/zfCQ6kToe0mWVugbu
         KWUzUwW5XxpGs3NW4KyC4Vp839v+ry8/eodnXE6aAB2XgI6KORmCfdYUgvPn5y2kt2aD
         chuyGT4XQK//h5CX6F9t4xbB/sRot7/0LHqYToWki4+3lwY12FeoryUP0GHsmYprHHay
         Ej8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XRgW/0sJOag/ZnUMEgbSJgdYp6WyDMPTuDfsAauk39E=;
        fh=IKpleL5o9WCd3tuO/sOB3CuRb2Hjfu3bQ+JjIoSYvSM=;
        b=BA0hk/x3FsT5PHKPkPW5Nt32yr9cr5DONulbBE1te7VWjZ5q0nrRAe1GdRzcXKgYva
         N22UYuD0rvPQ+rITAt+i+XUFOR2L3VIDKO6i8ALGCs2vuEcQOLVvdQjQEW6rDBM1ozUi
         oBdERuV8gM/xxIriXEbRVunQn6PekhKRVb++7m2AqpeOVoiF2pUbfjMuNk062GAZP8Rq
         SgEjlABKdAcFSKMZ4E8VXawZU8wUkJiisjltSBI1czLAVomgyhIy0Gg68n+JN7mLXfeC
         hWPCBM4g2VNvOjzznrBW6fbwtSkGU1mNumNNS8Rcux7evpH+Tz4wC3ukpZjRwcQl8ynV
         Zkcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790873133; x=1791477933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRgW/0sJOag/ZnUMEgbSJgdYp6WyDMPTuDfsAauk39E=;
        b=dSHQvlV3ttXf+p0UrKNvkc+mwmTE521P+vXOYLKzyAFQ7uoAytn8r+U1gLRKQ5iyBt
         Gjretepz+PLrjFNLaNi9m/aNN2dfHPwCeNxI+sPGsbyY5xmyBUkyalmsoZzzWOQZTGi3
         vzIo96mKt+QGBeyJxX2juiUd1AJZujGhWGxro0WYQG4gmF4/lcJoed/1a5KjkY4ly8SM
         A61aUTGBspAU+wK0M/GpQRhHs4Lk4rFehX/PlJJAqgCJXUR/PuzYT0Yodf928IYWRTUv
         wbmhVrzViTLgEteqKxdBbCSg+l6yj9TrSNj0bl9F4IpsiZSwC/tFQ3LKKDNiaLcM2vd9
         73Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873133; x=1791477933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRgW/0sJOag/ZnUMEgbSJgdYp6WyDMPTuDfsAauk39E=;
        b=2QZnAqBgaDGvHYC0pe/AqQRUcKgIXB8Ink1TQHpwWYP8vru6zidUHmuFR+gooPWmWT
         jp+uCIOQ06Me9iU7VAvREDWnyzqiBxXNbSHU0HXbouBq+p/kQC5WqOKShvkcWoHdOwdP
         w0D+zf9TNzq0r8XLGLVUgiBgSl4XYApYjjzhkb6xlEIygCIEI8NJjHbPTbGc41hlINEQ
         cFXr1UHV3W7G1reJyihbMnDlNbcHXKiGbPit4/b2dwblpFP9QXPSBe7WbgqyeSA38iEz
         N1H2EZC/yzQCh3HItQCpM1fBXhcHZm2oOICpR7LcvWphn4UU+L9ZzL38DmGTNl0qNkqC
         eV+g==
X-Forwarded-Encrypted: i=1; AKwUvBxsN2IeK4hevmAqCp/TC2VE5IRmgD+f4nvn7cyQjeFZNetvq5H884XthMUkQAiT+MzSs4SlO1G+AHElls8=@vger.kernel.org
X-Gm-Message-State: AFuF++mGyxX85nnlc4fALLDsxPNlLq3yAvDPLQFNxJDuuMWZ56ZwAogh
	g2F7B3pmd5l4qW4Lh5IUFe0p6n1w6t24sX8Ekf/J/ctmEc0Xy8ofk23A9ugcuglQo+nUbhN9qbf
	ghemfbW4xyhlOD3EHxJ601XfjukC3GmTwgtJo9ofi
X-Gm-Gg: AYBFou14vglaurJV/1ytXKKPHHrhiKcRsfDKJbb2PJ+gfq5/VXwsKPgDiTAOIWtTq/Q
	wJhhndAYQQGykN0OGtVb+Coul/7K7DiMG0jl7Z0qiMuRWdUTVeYhxqeRFyYNRtcApf/bX7EwjEi
	5a0HeoBYTYn0DsMgwSk7wMuA7nOx3ewMMl5myN4c4cx6mUql42y8qHBfwPMazn+l+/stK4+JhEp
	byd713kvcQD6aVwG5wl8mj1Z+HH2sq6UE+JdKaQpHy6pLCRw71mwsBkNcZs+UaImICR9dGL/zxV
	RasWLAVnIOhDD+YfM/VTtB+aOls+SSnifQ+ZnE5LaUDt170+HR6R7DjyKjwNAON0
X-Received: by 2002:ac8:5cd4:0:b0:532:858d:e791 with SMTP id
 d75a77b69052e-53389203f68mr14532881cf.8.1790873132647; Thu, 01 Oct 2026
 09:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929182108.794434-1-irogers@google.com> <20260929222332.973435-1-irogers@google.com>
 <20261001070755.GQ88198@noisy.programming.kicks-ass.net>
In-Reply-To: <20261001070755.GQ88198@noisy.programming.kicks-ass.net>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Oct 2026 09:45:21 -0700
X-Gm-Features: AclHuK_uPGIN6Z6xFRRwa7F-fBv3kGJch6oICz0HkXG7IE_sZqEVpHGVInH4o1Y
Message-ID: <CAP-5=fXCL7bd08B_i676eVwwvQ7XJua2XTvck2Nu3_ujBD=uGQ@mail.gmail.com>
Subject: Re: [PATCH v1] perf/core: Replace perf_event_header__init_id with
 full header init
To: Peter Zijlstra <peterz@infradead.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ast@kernel.org, bpf@vger.kernel.org, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	namhyung@kernel.org, song@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 12:07=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Tue, Sep 29, 2026 at 03:23:32PM -0700, Ian Rogers wrote:
>
> > Rather than splitting header initialization between callers and output
> > callbacks and saving/restoring mutated header fields, replace
> > perf_event_header__init_id() with
> > perf_event_header__init_header_and_id(), which initializes header->type=
,
> > header->misc, and header->size alongside the sample_id fields on each
> > invocation.
>
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 33210aff3ee6..c1b2d0c9b2af 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -8119,13 +8119,18 @@ static void __perf_event_header__init_id(struct=
 perf_sample_data *data,
> >       }
> >  }
> >
> > -void perf_event_header__init_id(struct perf_event_header *header,
> > -                             struct perf_sample_data *data,
> > -                             struct perf_event *event)
> > +void perf_event_header__init_header_and_id(struct perf_event_header *h=
eader,
> > +                                        struct perf_sample_data *data,
> > +                                        u32 type, u16 misc, u16 size,
> > +                                        struct perf_event *event)
> >  {
> > +     header->type =3D type;
> > +     header->misc =3D misc;
> >       if (event->attr.sample_id_all) {
> > -             header->size +=3D event->id_header_size;
> > +             header->size =3D size + event->id_header_size;
> >               __perf_event_header__init_id(data, event, event->attr.sam=
ple_type);
> > +     } else {
> > +             header->size =3D size;
> >       }
> >  }
>
> I've renamed the thing to perf_event_header__init(). Also, I've done:
>
>         header->size =3D size;
>
> and restored the:
>
>                 header->size +=3D event->id_header_size;
>
> and lost the else :-)
>
> But yes, this is better. Thanks!

That makes sense, thanks Peter!

Ian

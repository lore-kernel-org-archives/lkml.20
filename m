Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF159220A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888863; cv=pass; b=WXUmWhrVCJGpD1F9TdG0Ds/HUBQvtg9GKfEOp8B1MJ5JxX9e6lQivm75D+wwOr6TVrqP/KBy8V+Cd9gLIQrO5jMUpxiavvP4L6eD+sTfXXsihjlVgunN6FHp3aSTZi87mLQgLp70FY91sqjAyQxKVEgn9LpJdSRoKiT1y/quSQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888863; c=relaxed/simple;
	bh=Kpsdib3yveLvtr+TwAAnvePLKmzzJ6hy8KzpROZRl7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2tL/lI0+73221Y6lKfJ27xpBNP88mT1K7ksg3TpCvSLIU2wjYpV25kLh0eS4q6lcfQ9LeSh06J51BJT62r1LNKj7VrYaCzHbgmxfikzIQZ+81RjUB6xL3lmbxXUaxOJ7KlXrTbxkfVGn22xKZP13vw80J7YEv0ant+OYBQW7lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PW1j1Scu; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PW1j1Scu"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso767311cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788888860; cv=none;
        d=google.com; s=arc-20260327;
        b=F6O7+25lvtpUnHyH53MtLGcASicmftCtf4xffGRyk9oqUL0WS+DQ+KZQqJkvxstqG8
         gSrOxHLRJ2781P9zLr+V10vjWMGuWb8Pb9m/WC39jCkOCfsGOJggSzlOWRNPoZaYva19
         4irzXrSTFHu9vLsqT8BFTLnm1o1j4oT6iw/8BMaVltwS10pdLMq5By7bVCI8/10TB9mD
         jTLVAjXmGuGvEriuUQRG7kqeAB3xehadV6BSV6E1ReKQle4edAO4mQ4h4VGlzg6GCFXS
         OYdVTEhahIajNfqwNMaB4vytbjTpaCfo3fcbT4ofvQ4Gj5qPUAcZX4nDjCeATpokw9gl
         g7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=omWZRuBXmshwMIMUzDzFqHdcDfrk6JUnymxZAFhWUNA=;
        fh=VdEJekbBAcGoRDlzrmijFUyTOxVBewr+0c1oymM/DNc=;
        b=ivgd9vjUZjCmYCP0u6gNLRlmntQDoYVuiJ82TSSE4Cs5XYKPs6J8jxV0XUW1QLa3YP
         lr3ceyLDp42/gTPHlszdYQEH0wjrgcEzgaKj/CuYrzmKSwrEOxggQkggV8Is/ChiNQI5
         izsnHkvJtVCbzAW7SQzUrHfmkbnywPPctmct6ByB+7O5/mK0A3SmWPeqnXAbr6Fxe772
         Wm0J1jGoZJc5tKOhhm6P4QkVpGPJvbkmJI8HzLk1PAt1Gctu/B2LLUQq0CqkEY+MZtNE
         BhAFw+kEkdWpQZv40CgRW1IL/F1quHP80NvWe44UUUtfVcqrHtrPZCMbKHyJvSQ15N7g
         H2/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788888860; x=1789493660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=omWZRuBXmshwMIMUzDzFqHdcDfrk6JUnymxZAFhWUNA=;
        b=PW1j1Scum4R6ZOlP90lmIi2jkn/N8nfed7CL+rSoYHNGLjDt8qXzMCaw4J+kEsJbvG
         y+p56y+5dLWOtLFQ/76/9CgoQGWppj0N5goAOZjKX1QoCJpsyAW4c7Im2WFnwETsfuZP
         wWJBKQc4jKyYm8C4aGv8UgNFK2haSYJ9rV6oIG62tJnC/P34FO8unfOdKM6nDSJ/5wDA
         4iH+PdKFDiFXLUIZyey0RWHj9hq/k/NsgYX2VD7fIMWf97kzHybvbg1z13G5atDx9Rtc
         tIm39IV0NkdXX8KokIgFGXPIanf6XlQg6hMfA/w5O405Wh0TcjhZEqG/cWLPADYFNdfD
         IHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888860; x=1789493660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omWZRuBXmshwMIMUzDzFqHdcDfrk6JUnymxZAFhWUNA=;
        b=fki97I0GRevDncGUrsSteqHGKomBDsAsLQjQyNal3ttMLRGsqY5rbb76jHkzHgsLbI
         Sj8Ha0bgwVJT3VB0Qp7KDmeQESU5j8vtw7SCNzKezEj2OoPSY7GBRUCfV3T3qFDhR2Xv
         NR/fNoZXMR+UYl7ZP2Ddj9mWgQgZqm4x8xl3CdsgxpdovMBlXL6OkI6oe8kXDur/av6q
         Py5FJuQmogU1CCc4f+//jiUAe+q1VbsfhOHsqW1nMiZ6LG8rtJA9ZOVjjkM9+wpqL/Qh
         nFR2ZtjCaxsw8zePAZibQE8Gjc5lHO0uP3lRVr15f2bbP7/Y6tQoh2fl/DPaF58bo2fY
         ROaw==
X-Forwarded-Encrypted: i=1; AKwUvBxrcwSGHXe6fNtPVhspCqsEWyVAkdpLiL/DnMKJHCsoEwgUTG6oNTQHAS45tr74wFCsPh53l4rr9xhoidM=@vger.kernel.org
X-Gm-Message-State: AFuF++kxJ5l2m6+GgWVxGAGcq3B+tZNv7QJK5QNor0TQ/kpuBKxM2fkc
	hmsxcUwbXq3+KWalMZF4+zGqy/DVJxkBetXYpOW4lrbey4Ek/gh9pckXPhm6ksY+4fK3kR/YTPk
	TXXQFrXEsNyey0zxS38Pn6I0RMhxbA2w0cp1VsCYd
X-Gm-Gg: AYBFou3dCcE0zUnZH7k/xhd5DpQJCY4TVccOSBpI1HfhnBDTOskTJ/NZqMVgI+scCkm
	UKUo3r7CX9hVZ2pqrPUBXsmQULpzf4YMyTNJd5liJHkLEc8F1hIELxPyMjJpWMGd7IRgDGqVyBo
	Pmmbs/KGv6gxbijSosYny9MAjcGlWdxBwAT29Ftyxvgt/KQ1jn0hK0vANeGz3FK5Zcnq/R3GPsW
	zdmV8VpkzG/78N/D5jK8KxRoD7FFWYiJUQCdlr1xbgynQleCQovCcsXwiqVymgRhVFc3PMRC5wI
	jmRz083gU/pp6Ux3ReVhKsgKnTBdXr6tb7cas8CxR+18E8WmdJPYhiE6/zpu/fO8TIQRrh7AMg=
	=
X-Received: by 2002:a05:622a:1e0c:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-53065e23602mr52855001cf.8.1788888859773; Tue, 08 Sep 2026
 10:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-perf-alpha-annotate-v1-0-97380433ccb6@gmail.com> <20260905-perf-alpha-annotate-v1-1-97380433ccb6@gmail.com>
In-Reply-To: <20260905-perf-alpha-annotate-v1-1-97380433ccb6@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 10:34:06 -0700
X-Gm-Features: AcwNN1VnRSeIMSxxTIBjRtlgP36FAJ13oWgxRAbUHx51GtBEhbZN5UuqcIKyc48
Message-ID: <CAP-5=fUb_GEq+A84pa0Kf_4An_XxEedPpAysTWwmt0Vsz6jirw@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf thread: Fix live-session detection in thread__e_machine()
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 3:54=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> When the per-thread e_machine cannot be determined from the DSOs in the
> thread's maps, thread__e_machine_endian() decides between reading
> /proc/<pid>/exe and falling back to the recorded session environment:
>
>         bool is_live =3D machine->machines =3D=3D NULL;
>
>         if (!is_live) {
>                 /* Check if the session has a data file. */
>                 struct perf_session *session =3D container_of(...);
>
>                 is_live =3D !!session->data;
>         }
>
> Neither half of that works.
>
> The back pointer added by commit a088031c4998 ("perf tools: Add machine t=
o
> machines back pointer") is set by machines__add(), which only ever adds
> guests; the host machine never gets one.  Host-machine threads, which is =
to
> say almost all of them, therefore see machine->machines =3D=3D NULL and a=
re
> declared live before the session is consulted at all.
>
> The session test is also inverted.  A session with a perf_data attached i=
s
> one being read from a perf.data file, i.e. exactly the case that is not
> live, while a live session such as 'perf top' passes data=3DNULL to
> __perf_session__new().
>
> So a file-based session takes the live path and reads /proc/<pid>/exe on
> the analysing host, which at best describes an unrelated process that has
> since been given the recorded pid, and normally just fails, leaving
> e_machine as EM_NONE.  The perf_env fallback that would have supplied the
> recorded architecture is never reached, and thread__e_machine() returns
> EM_HOST.
>
> For a same-architecture recording this is invisible, since EM_HOST is the
> right answer anyway.  Cross-architecture it is not: annotating an Alpha
> perf.data on an x86_64 host selects the x86 struct arch, so the Alpha
> disassembly is matched against the x86 instruction table.  Alpha's 'ret'
> collides with x86's and gets ret_ops, while its calls and branches match
> nothing and are left unparsed, so no call target is resolved and no jump
> arrows are drawn.
>
> Set the back pointer for the host machine and correct the session test.
> The new back pointer does not disturb the other reader of the field,
> machine__findnew_guest_code(), which machine__resolve() only calls when
> !machine__is_host(machine).
>
> Fixes: 70351029b556 ("perf thread: Add support for reading the e_machine =
type for a thread")
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/machine.c | 1 +
>  tools/perf/util/thread.c  | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index f86b3b7df742..a1288fbed833 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -237,6 +237,7 @@ int machines__init(struct machines *machines)
>  {
>         int err =3D machine__init(&machines->host, "", HOST_KERNEL_ID);
>
> +       machines->host.machines =3D machines;
>         machines->guests =3D RB_ROOT_CACHED;
>         return err;
>  }
> diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
> index e483ffcb5d93..f0d3773d87db 100644
> --- a/tools/perf/util/thread.c
> +++ b/tools/perf/util/thread.c
> @@ -536,7 +536,7 @@ uint16_t thread__e_machine_endian(struct thread *thre=
ad, struct machine *machine
>                                                                     struc=
t perf_session,
>                                                                     machi=
nes);
>
> -                       is_live =3D !!session->data;
> +                       is_live =3D !session->data;
>                 }
>                 /* Read from /proc/pid/exe if live. */
>                 if (is_live) {
>
> --
> 2.54.0
>

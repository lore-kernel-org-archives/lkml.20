Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26628443AB7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593793; cv=pass; b=tQeAY1Mo5ibwmelF06FqddOCDzORln1zwhmUieeFBiDwblER2JBhDj64t4q1mFUDcOFV+JhpeZu4MVyCR7acPOXYNQMCmvQbCCHoMOW7QhPvYEj9CTqRL6NBRkB9KVsUzQdmtV5UAIgUPSVjkPpUhEK8tY6mw60NeqFcTykvWKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593793; c=relaxed/simple;
	bh=kJ3qjQeUA1hzBGsnetqxEJPJWR0Sb6vtf5Fuv2RNDYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUJKFPFy93qOlnApjX7VHfyX5+YRl+xyJYJptTGdXqSJJvdW4tZ+LDMP0YhtU80eoTYmNR+dJe41zEff6p2fT8I5He1dbkm2REoC66yRb5l11vWQQwOV8adpiW6xHYlwaD3Dnj56L64nibn/ngL5DUQjd/l3lUQs6EPai0Ywaro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=orX4AZsA; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="orX4AZsA"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso56141cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789593778; cv=none;
        d=google.com; s=arc-20260327;
        b=dLC1WNs4u7Z5rD386FxiuQhPn1083uEVJxfiYxt/K2pK1MAe8yR+22hl8V92BLgR3Y
         d2kHVWw4onw3DoQdqbed5fB6IPl/0tN26Po0k9m+/M7xMRY9ciIdfZtVP3uzvrF7gzD2
         v+029mVRvFGIJI9x6FCn9sktWUCR81I3s47h68ncuGOt7OYnm1iQZpoREDa/OZoXrk0l
         myiNG1c2BqSB+QSsbMDjkGOcW/jXZHYmB+fp2vFTREacLY9DfnunOcQeevNCCq3xr63O
         Bnpc3Kkl+EMhYyIhvMhP6Ez4CO+hZdUgIxycWQ0UacVC+vrsONOVQdcPfRtg/FF68+bz
         UxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+L4ATsOS/ltxA59iLXaFMH5JEUnlPoBgt9xqDRiJME=;
        fh=3mcT9TWAQzGHDmpMiJCnHLMElkGw+glVM28fdpnZII8=;
        b=YuFzrOa2tKt6Vsz9t/h5hpjy3Ayssct9P1l3S4/baLZ21ycr3xX75Hi3pbmWApnAdW
         dwRu8/CIPOQBaS1+328tQW/VY6Ary1iYNWDLqgzG2/+QJ7WFoi044q434mt8GsY8/8OI
         XMWSOqSaLvt8zQpjE0kLwvNc/Tx3T581S/AJCZAlG+zbPikti2A724QB21Bs57iEz3cj
         +4caaW4CJ3EZnx2heqIZDXyVAf5nJLzoCXwpXqolHqnaH0zlPKbqrWaeF0iTg3M25OtA
         3Q+HDGpsGjnzEEaeG0/9IJJwqktchHTO62c0P4OO+cyLuYIlaqQ3/wDBhbxdpYNfuwJS
         TohA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789593778; x=1790198578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+L4ATsOS/ltxA59iLXaFMH5JEUnlPoBgt9xqDRiJME=;
        b=orX4AZsA+hBSN+ha2I0EXUhy11+LHD5FX06w8p5czBp2wx/sFUiAQu/0WOP7JWEmWb
         9nmtIjDZWA8GdwFmoeN8rZGl3AtD4n34MqEgmATKafNMaaMX1/IhZGQmdODJn1QPy3Ua
         +KWLUxDAWcwkKFrreiPBhfYbO6MGZoh1+zCpOQXSsDxxLZbZgDjlYFrv8omFVYR13IMD
         o+L6e/HA0nXm86TgkCMyAcMZBhZnxpZuJxkEEHZZ00GD+EooU1f6XM3vc1uphxeWaiVS
         m+vLnS4+DwoCtg1Ne+lVQJedMih8YZCHGRwd4OOb4yPX8vOcWClpy2yojsSs3judEl+K
         gopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593778; x=1790198578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+L4ATsOS/ltxA59iLXaFMH5JEUnlPoBgt9xqDRiJME=;
        b=XFdliVZDp7fJAZOzzldBhaDfIoXNZTeFOowsgilc+bHxUniORSSssGyh2S5NLToBkF
         iDR2dJZ/Ja/kN1xPRx/N267mcgf40T+5ElLxJyHpjv1n8V5yA7yELbJZlHx37Lb4QwP6
         S2oyrRP4pRcO0jyfV5pbepG75nAin36kk/T9Oyu5WGwO/mULROEtxRxPmqWezZteHVjy
         XqsfYTR5GwW2yHcRDp60DSxbtPrBvLoEfvlXzYJPH+ShGlm9SH0OXXRXNSRDRiK51t/2
         AuhPMp9+Dt+BF08xyDzFn91f1O5iU0DWGybJFUfT2k9pK3EeJXdE/6aa63KHN1ISjJS5
         E0aA==
X-Forwarded-Encrypted: i=1; AKwUvBxI6rihCqwiSaLWwSVBYdF3nY+WhFgzormgwPh9csBF9L7i8VJDvmt1AwteIpapJ/2I+nNct7g5JsQvZcM=@vger.kernel.org
X-Gm-Message-State: AFuF++niGDJ04gYQ5eL9VJD8ilrhrPoNuyKLYo++q7By6WRalKWX7JM9
	mUCl1m79xEZYOXCRJr4Ev8y8burIjsOlFunpbjAL2iUgGbj+eH6B9b5qZSLTVJoz9UjG7LadedN
	CUQeQyTVFsQ/+EYePcru17A/UpXOs5692CWYbrI6F
X-Gm-Gg: AYBFou1MFw01pZqVJZWldfWopXNo6vz4pr7h4UVmgDLo6m/dGuPuiXzOCncg6gyAL3R
	ieVc1wCzB2QN9e+PwWxIPupyYN1sxFnAV4QxhKNuVD293d00dtl2y7KuBvXYOG9aJJ3LX9JMvyy
	TfCKjL9Z+q3VM4OKMJ0FK5fz6GZp8apblQlNFka700bNoGoYz3PYNGbO1IEl4eMfPx+zvYda3k/
	8tGe7c0K/TKFrzm0qQ7CYTdO/nb8B+Fy8+IyB1klWxMCkwMl7HEEo7yNxVMc/XxiyWNQWjZIFyt
	RH6ak0N35KFtPO12o8f8x50yUBRzUSxhonAPU3GyQ59erilPQkzd0Hf5v4pdYTC1z9dPx0BYlC8
	yGL8334uKsQ==
X-Received: by 2002:ac8:7d41:0:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-5328f62cff6mr1774981cf.11.1789593777405; Wed, 16 Sep 2026
 14:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916202740.257376-1-zide.chen@intel.com>
In-Reply-To: <20260916202740.257376-1-zide.chen@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 16 Sep 2026 14:22:45 -0700
X-Gm-Features: AcwNN1UpwmHpsRhkk0-wlxxNxRvn3k6gVDt4JwxuU3lXl21UiCshidAQlI2GmXo
Message-ID: <CAP-5=fV7mJEx27OQra2yaTegwRdzFUYohivFHFBvwD0cdb3=SQ@mail.gmail.com>
Subject: Re: [PATCH] perf topdown: Don't require config1==0 for a slots event
To: Zide Chen <zide.chen@intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, thomas.falcon@intel.com, 
	dapeng1.mi@linux.intel.com, xudong.hao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:37=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> arch_is_topdown_slots() requires config1 =3D=3D 0, so it misidentified
> "cpu/slots,metrics_clear=3D1/" as not being the slots event, and an
> additional slots event gets inserted, which fails event scheduling
> since the group now needs two fixed counter 3.
>
>   $ perf stat -e "{cpu/slots,metrics_clear=3D1/,cpu/topdown-retiring/}" -=
- sleep 1
>   WARNING: events were regrouped to match PMUs
>        <not counted>      slots
>      <not supported>      cpu/slots,metrics_clear=3D1/
>        <not counted>      cpu/topdown-retiring/
>
> Drop the config1 =3D=3D 0 check from arch_is_topdown_slots(). This is
> safe: config1 has no bearing on the event's identifying config value
> (TOPDOWN_SLOTS, 0x0400).
>
> The attr.type =3D=3D PERF_TYPE_RAW check is what actually matters: only t=
he
> core PMU is registered with PERF_TYPE_RAW, and on x86, 0x400 is
> guaranteed to be slots event on core CPU.
>
> arch_is_topdown_metrics() keeps its own config1 =3D=3D 0 check, since
> genuine metrics events have no "metrics_clear" and config1 remains 0.
>
> Add a test verifying that an explicit "slots,metrics_clear=3D1" event in
> a group does not trigger an extra slots event injection.
>
> Fixes: 5b546de9cc17 ("perf topdown: Use attribute to see an event is a to=
pdown metic or slots")
> Signed-off-by: Zide Chen <zide.chen@intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Note, there's a Sashiko warning about a potentially missing #include
for musl compatibility that maybe you or Arnaldo could address.

Thanks,
Ian

> ---
>  tools/perf/arch/x86/tests/topdown.c | 28 ++++++++++++++++++++++++++++
>  tools/perf/arch/x86/util/topdown.c  |  3 +--
>  2 files changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/arch/x86/tests/topdown.c b/tools/perf/arch/x86/te=
sts/topdown.c
> index 2b6f47ce4932..b1ce9f83db00 100644
> --- a/tools/perf/arch/x86/tests/topdown.c
> +++ b/tools/perf/arch/x86/tests/topdown.c
> @@ -229,10 +229,38 @@ static int test__x86_topdown_slots_injection(struct=
 test_suite *test __maybe_unu
>         return TEST_OK;
>  }
>
> +/*
> + * An explicit "slots,metrics_clear=3D1" event is still the slots event =
and
> + * must not cause an extra slots event to be injected into the group.
> + */
> +static int test__x86_topdown_metrics_clear(struct test_suite *test __may=
be_unused,
> +                                          int subtest __maybe_unused)
> +{
> +       struct perf_pmu *pmu;
> +       char event_str[128];
> +       int ret;
> +
> +       if (!topdown_sys_has_perf_metrics())
> +               return TEST_OK;
> +
> +       pmu =3D perf_pmus__find_by_type(PERF_TYPE_RAW);
> +       if (!pmu || !perf_pmu__has_format(pmu, "metrics_clear"))
> +               return TEST_OK;
> +
> +       snprintf(event_str, sizeof(event_str),
> +                "{%s/slots,metrics_clear=3D1/,%s/topdown-retiring/}",
> +                pmu->name, pmu->name);
> +       ret =3D test_sort(event_str, 2, 1);
> +       TEST_ASSERT_EQUAL("explicit metrics_clear slots event isn't dupli=
cated", ret, TEST_OK);
> +
> +       return TEST_OK;
> +}
> +
>  static struct test_case x86_topdown_tests[] =3D {
>         TEST_CASE("topdown events", x86_topdown),
>         TEST_CASE("topdown sorting", x86_topdown_sorting),
>         TEST_CASE("topdown slots injection", x86_topdown_slots_injection)=
,
> +       TEST_CASE("topdown metrics_clear no extra slots", x86_topdown_met=
rics_clear),
>         { .name =3D NULL, }
>  };
>
> diff --git a/tools/perf/arch/x86/util/topdown.c b/tools/perf/arch/x86/uti=
l/topdown.c
> index bafd285119d7..64bc64e335a2 100644
> --- a/tools/perf/arch/x86/util/topdown.c
> +++ b/tools/perf/arch/x86/util/topdown.c
> @@ -37,8 +37,7 @@ bool topdown_sys_has_perf_metrics(void)
>  bool arch_is_topdown_slots(const struct evsel *evsel)
>  {
>         return evsel->core.attr.type =3D=3D PERF_TYPE_RAW &&
> -              evsel->core.attr.config =3D=3D TOPDOWN_SLOTS &&
> -              evsel->core.attr.config1 =3D=3D 0;
> +              evsel->core.attr.config =3D=3D TOPDOWN_SLOTS;
>  }
>
>  bool arch_is_topdown_metrics(const struct evsel *evsel)
> --
> 2.55.0
>

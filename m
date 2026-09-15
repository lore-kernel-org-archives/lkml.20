Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D6D3D954A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501661; cv=pass; b=mxNZ7nOhBO56WYk1OJUZh/7+pZgvAdea1B1M5EWUzlsenovwSAnQ9Z/Axtx78UEPAwOscth92TZEkSawvT4Dh7g7DRQy8aNUT4UW8XeG7MO4CRZYOdMDG7t0o7NjvlR9zhsYdQf84Xt3rJs5HUpT62h3zR5qhMMY36FnY84NuXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501661; c=relaxed/simple;
	bh=XPQeBwzJVFS7E7eRmzzs+WdXKCVvNPBVqu7jyYbAFec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsyVNnT8pLT9dxGFUZ+q/Bf+e5IJkuLm4sjRbcDVmKYtVfA1croAcY9Oa44GJRheXUYmK5Brsqc6DnW7y5iywqSBq9xjVjc/GaHgAhwOiTYPW2PZvOboEdWVCRW/D7A/NnQHlxADG9Cv+q8uoxJfUPrMNDvUHarl8Du0XlcDEcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hBba8wHN; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hBba8wHN"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d5fc2cd8so63051cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789501658; cv=none;
        d=google.com; s=arc-20260327;
        b=Cl7iUmqH59/S4XgkYvbqk6t3z84HvdxbLdd9x4UQ4CvExHwwmowkytoyB59XYijNH7
         kLvcAjOWf8/4BERAbe1fnHJ/eXMXv8GpxZYp/FCbXU9+AhJJ/CBDrwXPZtnDBQFyRKGs
         imta9ir34Zb247JMqtYzjII2LfPPlZfLrJgDZW4RMtYbqkvPTT9R5dYs7wDcnpoufqtw
         zgYA1en6fzwoKEAds5TeM+uFsIFkmMcZir0uaVr+Q1sM8uo1FxpTiag7zfxFvrx7F//x
         S63+7plDKtQbqbTqZfdJ31ak3/FPogP1Wy9zjGivoTAyZhuJj6mmWSZnwJdrybU3d1et
         HbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85J+aiA04EY/KMG60rW4VZXcI33pWG+C3OlEjBwYKSc=;
        fh=kAOqaO0s904KIfF9bXa5AJU7fEiN2GxUTVra06o0NMA=;
        b=sNmMNB7JuotPaiiU00lgC8d95+uWIXoq2jMH7NcJUqMIWskYQeNHwvuvsIfcpl68Bh
         uU5cSmWnqlABSbIYa2m7CpSMgGv6Fivr1YNjZ0qyZFwwPKoMmYmhSIV4J+WWegySSTkX
         peMD4010QaG7Mg6inJyKPYGov+su5GST7IVroONEPSp6HfmhXhDRHfQdN6AaI228odvC
         VLTy10dl1c5o+6W1SolffyEd8/BgCfrD6tKe6Loc2PIs54NRhUbwlaYIT6IKgig7knv2
         FmRfG3u0eXTk82vHQlg2+bDQ1yiOuG/MOL28caA8ycTt8t6aaFPMN0tqoji38884vA9w
         4iUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789501658; x=1790106458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=85J+aiA04EY/KMG60rW4VZXcI33pWG+C3OlEjBwYKSc=;
        b=hBba8wHNjK8wmNIhIRnK3enamrCwSDZSeFUUC0HJpxzMEoggb6yUH+s0mOusUaoStM
         iecVpu8mFiIPXIQU2zT2wRPJKsxcguvD6Xh48o1Kltwo772OwSLDBky5aLfLy9QDh0lz
         8oh2ej8ojvahLjh9aBcqNr0DUtIMgJLcg4sR/k9XWnFXb9CYITT7mLpXCYSsIFWS4QdD
         LSwwJJguqFvZpgCDe1n3fD1dc62A1Xgpq8wmLGR5qGY1lL6fpQgcSb+Jt3HaVb94JCvz
         vCc4C0abu/n6KL07QyQpXKZ1bKfv3dKyzzr619N4rGK3d0WJ3n1G+ax3NFj9uv4rT/Oi
         1OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501658; x=1790106458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85J+aiA04EY/KMG60rW4VZXcI33pWG+C3OlEjBwYKSc=;
        b=NWQqRZZ04DMNN0fng3K47d3mq0zfQVvJ7DAJCe+a5UUUcy1wCtBSrogUlGVVFS0rbg
         fhXXMxm/8q+g6MAytIfc7/s/CdpoAArvAhEXyqZsPKXSufvpsiRkfjvR8XklwF6BdMjX
         zE4idNOH6YlZGG5X6L7+HrGMLVeLGCG/6cwhNy0JmhBDqvpif3+u171X2EE7xOUFRrXo
         2gAq039eec3IZMjwKwr7Ws9MABbV5yXY4c1DDzP6F0UshV4ZxXzAwgTjPpM9JKTIR/CT
         jqN4nfckSILDLp5TX1DKeRFBqn/cgLvCXWpysRBOsRf3WneMqlhoxl4b7nO1GGLsUKEE
         obBA==
X-Forwarded-Encrypted: i=1; AKwUvBxR+JkJQaJkqeoLLbC1iGIy0KWBGY0L5wZEVZQpNcCBMWvB2pNrVimaDUy4WSrPlHIJu3rjCFNMkcdh8/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kZxd7i6smlHNRKSvDJ9ND43YzI4Ya6zSv9ZLJBDZStGoknPKp5
	7rVuh9sL5pbbo3h6BZlBUh3N3rLQjlKoR1FBQN5XApmEP3KXRsNCweREPhGf2Rqjex1QwcgTV7Y
	e1dInJ191CJGdzy6EsV8uaIfnKc4tZF20EbjYxgmj
X-Gm-Gg: AYBFou1sqORJY1Eb2iaGsoCNFmeex8uAOcqGJJHmgCmMErs5/Bl6pHAXTkOFIqw5B7J
	Uw+HjfgUpvYiAOnV59uBQnrZwJEgLvF6uH0FSGEtPz1N6Ws3bS55jBTEsiNpQy5EIf5fvF0Yzr1
	2tuPWERoUTqUQmCsN6+/WGd1xAeeYv1Y1h0E3BmKEvvU+/fDHfIVaYJiFvuGf/RWe8bZtPmauZJ
	7hfQIhAWMDUvblfW5579Zc9XU96+TWTzuT/E81B0VK6x3GzWkkUPa3taLRisFQrmBUWXH3xOATH
	4qhsXviNYU3PJynYscGUk/l/fgTC3vEtHU/vAyUoqIRyh+6ig1t9ss1dLQXq94XLw4CXCCwX8t3
	SebOngfHeH+Q=
X-Received: by 2002:a05:622a:11c5:b0:531:129b:2dba with SMTP id
 d75a77b69052e-53259a9396dmr2409481cf.3.1789501657735; Tue, 15 Sep 2026
 12:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821125538.3721169-1-jremus@linux.ibm.com> <ba75c436-ae41-4754-8a73-80e2e5df76e7@linux.ibm.com>
In-Reply-To: <ba75c436-ae41-4754-8a73-80e2e5df76e7@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:47:25 -0700
X-Gm-Features: AcwNN1XUo01KXBIUBoyjPH1IxD3wuQZzmLQBC8pBcdAs-LnVLvB7_CmYe-5vPlQ
Message-ID: <CAP-5=fXGKJk6VrWTcdC8iUdhzw6djscJ8SBoJiBgFaPH8TWSZw@mail.gmail.com>
Subject: Re: [PATCH v2] perf evsel: Improve callchain warning for s390
To: Jens Remus <jremus@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>
Cc: Jan Polensky <japo@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-s390@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 6:03=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> On 8/21/2026 2:55 PM, Jens Remus wrote:
>
> > Instead, warn on s390 when callchain sampling is requested with an even=
t
> > provided by the CPUMSF hardware PMU, because that combination is not
> > supported.
>
> > diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
>
> > @@ -1078,9 +1078,8 @@ static void __evsel__config_callchain(struct evse=
l *evsel, const struct record_o
> >       bool function =3D evsel__is_function_event(evsel);
> >       struct perf_event_attr *attr =3D &evsel->core.attr;
> >
> > -     if (EM_HOST =3D=3D EM_S390 && param->record_mode =3D=3D CALLCHAIN=
_FP) {
> > -             pr_warning_once(
> > -                     "Framepointer unwinding lacks kernel support. Use=
 '--call-graph dwarf'\n");
> > +     if (EM_HOST =3D=3D EM_S390 && evsel->pmu && !perf_pmu__is_softwar=
e(evsel->pmu)) {
> > +             pr_warning_once("Cannot use hardware CPUMSF event with -g=
 and --call-graph.\n");
>
> Jan, Thomas, could you please do me a favor and test whether this works
> as expected on LPAR with CPUMSF?  Time was running out before I leave on
> vacation.

Thomas, the change looks good to me. What are your thoughts?

Thanks,
Ian

> >       }
> >
> >       evsel__set_sample_bit(evsel, CALLCHAIN);
> Thanks and regards,
> Jens
> --
> Jens Remus
> Linux on Z Development (D3303)
> jremus@de.ibm.com / jremus@linux.ibm.com
>
> IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsra=
ts: Wolfgang Wendt; Gesch=C3=A4ftsf=C3=BChrung: David Faller; Sitz der Gese=
llschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
> IBM Data Privacy Statement: https://www.ibm.com/privacy/
>

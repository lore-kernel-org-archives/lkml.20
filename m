Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA00E48F039
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872611; cv=pass; b=RG2M0DU68LAAHvqhOuQgd2+IvvHbAbruOAPl6AZq0/56Qzd8YWd2Ltj2dz4H6tW8nVUZYBJqWXD3Vsc+fhupd0EJiFaLuGJkgCKmOdtZBQD7ZyvhWiiALeverAvDUxnu0YNWwj+3MfWO+499bX8MxTEzFsoSbF79VPGAI/0x2vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872611; c=relaxed/simple;
	bh=kKsv/L/7XImJi9cQhEQ3QJQ5spSt4fA6qgz8y7mhmv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ainqTj369xzvXIvtPDN2H2X3BAniCtlpp3yfZBhoD+5Sl5pJsa4HgPWzCgamPwwanNKKnrE1IQt/ZWxLWgrJwlS913RA45x5ffwknHfeu49sZnpaqFpeEDRZnwel2kiMonTx3kLS4Xzuu3Imcac2NrRY7gnCCgAmUodQlIVPwLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Snhjsg4l; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Snhjsg4l"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5337fa12431so299541cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790872609; cv=none;
        d=google.com; s=arc-20260327;
        b=lC18EAHUeh3a9/DJC/fg3280NswPsBlk/HsrdHmKv2iGpPMkBa/HcA5g9JlJWbU6bK
         tVixySP1OphlV4u84eogA2CUS8hOt2OrhNRhHbAz/7QzH0kK4c/IxbLHQ01lgayF7Z7j
         PgQd9CFo9XxC/KGJXY8oH4knuuDQluf6H9ngisUh1VfBWywsyZ+1bgdzjt6sFdlQnLtG
         pzAZZDyyhXFlcs9hTybzjH3aqbnvX/91lzRc0k7WfJfDcqtSWN3dE6fmA1pdi83Ri85H
         qO8nol1hi4U+WA8ZqX4PtNmpDO09ieZ7Vbvfo8XKE6ooisty6ZlrgaOCesoG9MQ/adUN
         Yi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=leni7uoQNi24uZIsWMCtaU+tRF5UodmR1qKmfZe45iw=;
        fh=qpbLVagpt8bOVfBB+O6qkrGsNTN9YBrOTsvnS3dttqU=;
        b=RPJtAaklcvvWeMYHQINilF/Q8iOikr2GcsaoHZNNo78sBKiy75KlBnWBwgUE0UHUGK
         XIbXTG60O7UcnSevcJprT4tMT5APPcj9CZ78jwEVT3uRQPuVrz1E8S149rqKksRCUmAT
         UCA1AQqqO4CRAmPmDs2zxl2m7SbtK+107Oo3XGY+3q8c0Vewr67T9lnG67LhI6QAP1tW
         PaaSn1dB7QEYQjg98xVxZZ9+JgdY9oZ00fdGD3jMQHRKSKWKF0imzlKhmHv1Hb0lbLWf
         Cj31RtbFql7ZkPgej3vuw12a+ChuBGOC2Z3omy5gHBGNXBC7icndCMbnEC5gMNuUvVIB
         LMiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790872609; x=1791477409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leni7uoQNi24uZIsWMCtaU+tRF5UodmR1qKmfZe45iw=;
        b=Snhjsg4ltdXg9AoSypx1MDEZSpyc63Xq3WVFt0SA+eGoU6qP6bfMYXzHn6LCj9kFvC
         QLReAX/XP0j0fmlvF7kkW499I34n8QnOC+zmFflRGMV2uEqCk16thYgsVTP1cFmCO/XF
         xmPf/hmZhOm6sEsAAiQMU9wbAddQ49yLYy+veXpeKq/V4KhSrI1hcV06P6J0JCxtLUhn
         4C2PsfadGByFOEGlAAfXxpl2AoEx16t2x5mJ4+p3zF548vrSmK5zWSvOhmYXvyhHKeqS
         bWLwDIXwwhUZIIiVRhGrgb8a6szuisvS8BiNcAPQQGfMKNHi1krs0WDzPJlpVDr8a39p
         o/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872609; x=1791477409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leni7uoQNi24uZIsWMCtaU+tRF5UodmR1qKmfZe45iw=;
        b=SoZgF679rQTWz4MYKuuA3xou8y9R0JdrDfYx4tVtBRfcnlLF1V47Sr69cI5vDyc1IS
         SjcQ2OE1tr013cM8DwA8kmafUlc7zqMzPxtTirVP6/QrJ7CLbIYg2VOvD5mFFXYrAbUI
         6yYiYp89MlRLFKrTeHk9PZ3jDbyOSVT3OCLVr4DaQVhYkebDsdKj7+wX+yu1/v0cVyDW
         Qt4xGSPd4NGm/iwyLeJH640egIdwjf9xvo38tMLN/f/wBtB5nRumZm8pAvO/oRAJoVCC
         19aFspuaJKV44ihV/FH/qdnyqchdA//217RRDc8lGJhXGp07V62soHcrRj94TLF9XEfm
         Fbmw==
X-Forwarded-Encrypted: i=1; AKwUvBxQNBfuQ9pia/xd/gKEL878ldmPw/cR2E1O9q7qKQSOkkjydSqlYIlFFLhiVq+pgqtfKh8kX81aNNJEHfo=@vger.kernel.org
X-Gm-Message-State: AFuF++nOuVpTn1b/71OOGoyJMwe1WzQVJV5kL3wnDLivVD/LZXOwsIUf
	xjyo6FkIzZCodNDGDbwQGV5+1DxiU6TiPnY9gx/B7OMapqXeZ4CI6rdSkP5wTYKvyzT6Wi37OIS
	faZrc1TqcBGdXikQk2cU5+CC4sLV29/K+heHbkJX3
X-Gm-Gg: AYBFou1vFa6ozAiw7zXpvFpg6PXNCcVlVkhlDIT5ry0jM4Kc46t2Gf+avTnDxeK4QGW
	KhEyu/X54VpP/HB3iCCYTrG7WuYFsCareD5SLFzmf5h9WQ0IgTox4/b03yfNqRDFbFiNtx7KhLM
	m96SZtSToeKMUtDPTXmV3VtiWoBUiykArVTwXQhyMX0ZXUaWOLRI+3ZDrZ/G4uwT+P2zswzZymQ
	qAvZwQrETQfjN9BTEGqnJMrVwodsiWkQiNQTaR5Y3hRKy6OG/Q4CD5KkpC07WaxIJ/PWM+OyPL/
	DV7gREp1F1PavixOwq4K87W983JMmvaYVM+/Adus8uXXVTrGJ4wTwQ==
X-Received: by 2002:ac8:5fce:0:b0:531:475:4ce6 with SMTP id
 d75a77b69052e-533892020d3mr13545121cf.9.1790872607892; Thu, 01 Oct 2026
 09:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
 <20260928182605.3649015-16-irogers@google.com> <ar5_pbVm1WYiq8Bg@x2>
In-Reply-To: <ar5_pbVm1WYiq8Bg@x2>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Oct 2026 09:36:36 -0700
X-Gm-Features: AclHuK_DFBCaFEauM_JRCveg75vwAb47yXfKyEr3-KyQDhRVzy2DjGyn1sndr6I
Message-ID: <CAP-5=fVtMaVM5PEoxKR4CF8BqYzKiaS4M9zpyEHyjQPPqhHDHg@mail.gmail.com>
Subject: Re: [PATCH v6 15/26] perf trace: Filter the target's tasks in BPF
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 8:43=E2=80=AFAM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> On Mon, Sep 28, 2026 at 11:25:54AM -0700, Ian Rogers wrote:
> > +static bool task_traced(void)
> > +{
> > +     u64 pid_tgid =3D bpf_get_current_pid_tgid();
> > +     pid_t pid =3D uses_tgid ? pid_tgid >> 32 : (pid_t)pid_tgid;
> > +     bool *traced;
> > +
> > +     if (!has_pids_to_trace)
> > +             return true;
> > +
>
> I didn't look at the generated code, some optimization may well make the
> bpf_get_current_pif_tgid() to be executed only if has_pids_to_trace is
> !NULL, otherwise it would be better to move that to after the test.
>
> I'm applying it anyway, just caught my attention while applying.

Agreed, that's an inefficiency and the compiler likely won't optimize
it. I'll send a fix.

Thanks,
Ian

> - Arnaldo
>
> > +     traced =3D bpf_map_lookup_elem(&pids_to_trace, &pid);
> > +     return traced && *traced;
> > +}

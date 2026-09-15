Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2085420E7C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504913; cv=pass; b=CeLAbjvAvibK1lwChsHEgqUGZBGM9a+okkp/76MLugXbvFHpYbal1Sh2IZSYjZWKfBy0oKoezyULb9MFkEywDmFqVlzWdzHyCk3o6a5X1/SSAnFKsjYcbp9WL1ovJQl4sWT5+w5ygv3U3VjBsCOjtu98R1EMoUbSh2Hx4XC9xDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504913; c=relaxed/simple;
	bh=B9GyP8hNCeGmDtZ9u3NPVxdhHEoU6ZLawhHvneLNg0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jg6KLku2NVkOeMKdshrpynhfSZlwR6wJT3PkIkI0ZzGBjnLGobAevifdX3QAMncFQsv0UcKnQNvNszscfnFhUB9bjsq65dugpGv650hnzWfHI4chtAn1jPULmaRoMohOnRte8znoFUDBO2j2y5SvPiZ6vZOdKmnS0HvmzMx61sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wgq0OtoQ; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wgq0OtoQ"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso13311cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789504911; cv=none;
        d=google.com; s=arc-20260327;
        b=OypxlwkQ9gXSprNd0WJG3ee/WJXeDnIX0EvJq5m/pevYfXI+L+7uIqhDE+1vWuxyjC
         0P9QOVLImznhUiO57y7xkml5XAEnPpph9jR+y6je9dIpjdY2WtcS6KEY/X2R3xP8e1Du
         n5kErDRC0640cGojtlvX8gLM5kDIrsi8vr9eWppxlnbtbOsNCLA0QIsxQjGGyZm72SoR
         GjkyVSf5HkgK3YaHVmW1wtERZWT50xiCZtIY8sP1N/fWIEXFsKF1u6Xsdx4k0/ooZxPK
         3gY6QVSNhi7IdOcsQbgo0X3q2dWQHuV++5MOVGatfv2nx6M+sJniv024WnrYWmFcS/dn
         fgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ke+/Sy/w9JXzVliBlk15+zHdilgXXUHR1OHMAfai0gU=;
        fh=vkC08w7DWs5iJ5nHdwo0z07UaogS3ANpQewbqamW6do=;
        b=Dn5xTiltMt9WhF69xsgtvDgK8BfD1K7sCNM+dJn1KRChfOKuoYTYQ2zzvNTKEBgTrY
         bj7IJIoEofFQdba3GeZSmKGEED67YYWP63G3YOjJOgcvJJIvuNCDA3M3aMggU2V42Dbj
         Eyo6fgo2DGEGmvRQVLHU0vV2du+/JLIfo9/lkHZHlvspUnBcSaVCBBc9mIibxb8Ktnnv
         jqQlDlye2vRvkHakINshT8+8tTtZb+IHcCO9vfYm3row04nimwlENysZqC1au6W/yEdV
         Z3eap93Iqa1SZC7ansO4HNmj9kjzpaRyIiUqTq1JdXHzt3NCe9dKHnXt8VaWZP7pxJVF
         NHXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789504911; x=1790109711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ke+/Sy/w9JXzVliBlk15+zHdilgXXUHR1OHMAfai0gU=;
        b=wgq0OtoQIgKNl7gpmOTuo6NcdezNe6Z+DPAS7kmA0nhSmhrUVhqs6olF5dPZ9XvOy7
         qTgFdc89J1TOmyLUUUZRzIWGmaFsrtSB2/2uHFfW40wI76O4hwthvO6xAi8Dupch0d3P
         zUZgW+6Ot4rbrayaI+cRISXNpkdfDgpbTD0sDztToGQLxSLjKhXweYL9M9YOnRStdhib
         6faImBsfo7FG+WrOXKfQQQzcZvuMRfDcaysVxoxoXdnuLRmHLnJp0rboW9i0j8WAsttA
         BaqIc6leolacHhZgypkAznC+rSN8pbNwLHplXR9JrUXYOwucveGNDO9DSWY0yDmUSxq1
         yTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789504911; x=1790109711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke+/Sy/w9JXzVliBlk15+zHdilgXXUHR1OHMAfai0gU=;
        b=X5YtYDOzPSqcnjWejqZT0DnKLI9yQr8AKeHpwEF430EUWGectzs9LzMeAzHaz9qb4a
         6qGYRjnKZqrOIYxxnMI/M2pIrNYoNicmUWFwOHgnQ2bahRNsoOxMCoyVHDeIlAqqYw4Z
         rjcPb9EhSJf/oIWQGQjpm2vJd8gxXzkeji+d/1coqR9O/uWN2ZmgGDJkcDseoxwVQjag
         CnnsCJbOpnOhOyW4eapSeYMWPYytXfVkAgbm0XPCXy9UQzJNJBVwKhKf4Ohsyc9vFwbK
         zM8smg3WN9ci8UZfZlgMAVYY4hzSHTuNZ3wMrLMbEDzZkx6DQIQZlZ5DXDVZH37Qz49N
         Xr3Q==
X-Forwarded-Encrypted: i=1; AKwUvByNDRz4rpoZkOdb1K3wmeG23JgkgTsnHvFamsWyLp7iQ3Dhln26aCzx+Pv/cDbyrlJ1Kv9GXgMSIbOwbUE=@vger.kernel.org
X-Gm-Message-State: AFuF++mcv+mk3JzVuW70xFcXi3e/TO95UIfUeTNNC1nagS1wvejEO0eL
	7eFgtqBK49A0num39Rrf8Ou6Gzvh15v493ICPXx2aPWNyTn0HdInS5vBAaPK17SkaDTNTNennQ2
	IL7CTe25ZEjZ0l7wI9fn7+lnNOWJQGkce+DZxr0Br
X-Gm-Gg: AYBFou1s+EOcxYnxSa1MMuwj6eSMuTrKOYySaAzXlim4l2e/40PjRjaRULU3KQlU5nc
	1IvgM4LDEDLszdZaTDpFEcfLWars9kpWzH1n6xdgUvV0LYDwOBy3BdNOhoNlIXydu875zOxVygl
	oWMHv5na5SXOwFbFfhnfA8humAujQzkSHdRpLYkMYq/qF7dbfl9J0MzQPD2Who0ndNkcJAgIj9h
	DMwvogpZEZsR8bNvLsScSxZrszIy2ykQLB3ZPgRXuXosoD1lgGpurgEotstVnrZch4pI/IKITDm
	QwtjxFzkIL/Wt4G1wMzAfoL3k/1Z2WMseN/EHuC0MwObrDHC6v6o40CMm+53UqN8J12+FzXladF
	7YCL66WcbnTc=
X-Received: by 2002:a05:622a:1f05:b0:531:219c:2de9 with SMTP id
 d75a77b69052e-5327e8ed0a4mr578601cf.6.1789504910127; Tue, 15 Sep 2026
 13:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528005136.1906479-1-junxiao.chang@intel.com> <20260528005136.1906479-2-junxiao.chang@intel.com>
In-Reply-To: <20260528005136.1906479-2-junxiao.chang@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 13:41:38 -0700
X-Gm-Features: AcwNN1V3pj34wz3FgFuSX1fJjZOqnVT3G0ZwIhWIvUswQ3fN0RhMUtusr0l9OUs
Message-ID: <CAP-5=fUsX9S52mrVOZPAhSEMP5GQsJuv_MU9L6d8Bvff_KYJyQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] perf/core: allow trace events to be accessed from any CPU
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bigeasy@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 5:57=E2=80=AFPM Junxiao Chang <junxiao.chang@intel.=
com> wrote:
>
> Using perf to collect trace event statistics may introduce unnecessary
> SMP IPI interrupts. For example:
>
>   perf stat -e i915:i915_context_create -I 1000
>
> In perf_event_read(), an SMP IPI is triggered when the event CPU
> differs from the local CPU.
>
> Allow trace events to be accessed from any CPU so the event CPU can
> be set to the local CPU, eliminating the extra IPI overhead.
>
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>

Hi Junxiao,

Reducing IPIs is great, but the Sashiko review pointed at a bunch of
issues that seemed like unintended consequences from the change. What
is your plan to address those issues?

Thanks,
Ian

> ---
>  kernel/events/core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index acdb1f02924da..b3a817c0eb3a2 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -11376,6 +11376,7 @@ static struct pmu perf_tracepoint =3D {
>         .start          =3D perf_swevent_start,
>         .stop           =3D perf_swevent_stop,
>         .read           =3D perf_swevent_read,
> +       .scope          =3D PERF_PMU_SCOPE_SYS_WIDE,
>  };
>
>  static int perf_tp_filter_match(struct perf_event *event,
> --
> 2.43.0
>

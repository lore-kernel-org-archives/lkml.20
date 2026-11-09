Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794264708;
	b=mZAAXbFpKpMz67cZPXmbMy/dKcwZP2ODwMeExKtfRAzqdis34mZzZrXnfQVSbhrJHVmZ
	 DG7GlOLvk8UrLe0ZxK84lmFXDRDUZlioK4jSr8h6YghMl4Wrfeo8vdVgwQ/BZuFhNSiL6
	 qwz5WYqOiKa9Om+A7kYvSrd1Byovx8VQvvfATJXww7cXjO3gmnbwCinlQVxnc8PWmleNw
	 Ibyouxm3I3m9NZc15/63vNzD22O5Wk7+naXZJeGaIy5WnKPdr9BSPT00O0/MMneU66BY/
	 9V+P1m1jyjQIxETG0eEQf1FcEHCbR6AwcUy6wG5fedkELD1j2JQAxygZAvsM9MYQHyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OWSNwvalNOHXKLMMlHTD1wk9mqbGrJX4DU8R8+H5KVc=;
	b=Ebv8XjzzG4kw+uUxmPDLi06DSfixQFAIyWjfwlS6Ki8FTecwSdygYwYVegcePR+0Wsjh
	 w/ReupZBU4BV8nbFUFx7l4k5XkEWZ6zD8wNWqcHOMPN9lm8Pz/b3RU7qTl6K+49ftH1/e
	 SSMoIMStDIzrRIC/OecDfg6ChwzcH8G+PKO454uPJHtTIT5ccoWlyZGjgkoBB5gTC25DQ
	 grZmrypCb/QXKKOBInt/D2ZF2cGYTGYFCW0+m0WNMwuIFPFS9Oj+2Qat/PWkzDAed79ZJ
	 WIjyugLVCY0Mel5DoqShqNTISwxqMoAW2dHpkKdYYBgZOC5rZV0u/oE9nKM+9GZ2RNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMsltQH3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F7606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062F7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMsltQH3
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so2057074a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:51:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794264706; cv=none;
        d=google.com; s=arc-20260327;
        b=B4tHLJMlflD7XJWA5xU96caQJtVV8sWztwLuqY89vW2Q0DKp+VoxFJElA64dHcfswp
         pcaacWh7X2UUyX3IKhF4vE/ZXi5zw9nvzKme+XZ8yzNYfYNCWw4Zk5561QPuo0mbEve+
         tzg1WCxJ+I70HOEWKXIP3Dn6rGZcIC/q0B/1ripjZXfvDn8+OibiAt4j54J7U5J+wKLj
         o9A08XzMDQmMeU4GI1S9UmPKOrq4xwuqQpy8pLioEtiyAmPKcloz1+zmswjm3TUmwCgI
         ivGbZIQpDyWuA4z6hOM99A+UtY6Ghq5h3yld78B5EZMhwfqLVNqpE2RmbguoaWxcbyQs
         B6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWSNwvalNOHXKLMMlHTD1wk9mqbGrJX4DU8R8+H5KVc=;
        fh=rubCr5RfuEx5l7JItHdNx2OYcvaTVgQHnRZYSyZVvyc=;
        b=gv0uROYYUgvzJ/ChDTzyYaKOdjqPuyTifc4WFZ9SxIUE1EGfmcCxU5BEgKaHM1YIb+
         tJNYbT2VQptx1nbOQx2DEVtdkoqn1q/DFYuUsHmqeHVf4Db+kMUKBGqyqp8D/JlevVUi
         mbHuOe8RLX3yYdwpgkn0aDT46M4F5bhS5DFfbMi5QLp7KhT2xrA0cDJGS+pHpCd8hZ6d
         asejYPo2wgx6C1F6JWf4ffgH9GO8hbnxRG6npiKfknlKvQb+rsuuup3dlSPaLOrXhYMG
         BJ56FA+xFUJH0sX0T3qfBuvI7LJ9cL1psfDo3Lmw6nACn9Qf2HOOSRqvuadG/dxjollm
         xWBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264706; x=1794869506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWSNwvalNOHXKLMMlHTD1wk9mqbGrJX4DU8R8+H5KVc=;
        b=jMsltQH3itmZCStdzYi0bmXp+Fj1HXIvg7IvfS1CHMum1xbCF/JIbeRe8ClWsuG8pL
         8bElUFjLLmljoLjmxUaVo6ArEzjXsmg6zkTFEz5YFUt+WK049Tk+xtG1de5yRvGpZdXD
         1jDZoUop4xewT+X9GMkZCkPwED/UWggx/VQJyuitisqxmD986RL02C+Pw+Sqc+I3M2wN
         jmElfjsff/itjcLTxX45lJcsvtMZ++ymKuNQIyHcbjXsOI9AJINYpvWkYgFlataTZQim
         TttPbO2LLXOMFArK2iWa/Hpw5ElDINtPk3gzF7jDDibv+nhLFXzndIIX5gGsOtjl1AUI
         /eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264706; x=1794869506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWSNwvalNOHXKLMMlHTD1wk9mqbGrJX4DU8R8+H5KVc=;
        b=1Nz6W2wvLTxTKc5sox5GiTjjkiIj9bTKjJLoGH/d1JVl9hR7aSDcitOIjcaeSsZ1ju
         8Yf8P3xCylAPu36PjT3GCgzL0p6xDK9cWvTEH4xSO5De8FzIsYFGQHEygFZ54sEWNNuU
         rdm8mx0O2ZOFTVPqW7RDqbn4lkDradWLSELIp3td7whOU9KklLxTSWiQsWCtwDloyWx2
         tPi/S3YL3uiJWVumeice2vG25erG9ctWubp64cbVHnbDOoSikgQKdyuyI99tqgvBHlmK
         Wo2gQ7FeRphpdgur8DN/F+yYHP/TET2G1O2Y3Zs7PaBnTpILsbh1wPZiklGoBjZ5QlVi
         /5Eg==
X-Forwarded-Encrypted: i=1; AL+hErGXVOal5Jg4HLSi6uyqJhzwmJWgHOWhIDPBGGc9PFZr+weVwLgKtTJQrKdrJGivNhjx8Aze2QE/nYe4nSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1xyi45cA8PZDUI8a8Chq9RBfefwMtGoUq2ZW1EnBnp4t3SBiF
	8PoKOjpbOuKYEmAscSSVPq5L7k3qkNj8mj5M9NerqvxhHi1dTQNVWfYfJ4yYbxHxPCLSjHDSnhQ
	ZZh59sTP/31uIqkrGk6Hx1LsBMNTsdGE=
X-Gm-Gg: AYBFou07/A6zzR3dmvC1rAuH5A5VpwnXV35qlyxqpYSKGlI4Om8R6qWy4N9iPB1gmeE
	FRToyjJK6FgDKqWyV20+0orjTmbboem1459pA8FSfTcfGf667eR1310eqZkqmua/AY/wEvotOrb
	c6gv+enXxPYFHtQ8PjFLcOc3Iv2d8VLvjN92GdVsE+oskD7N1HUyoe+WD13aVZSLdzF8Ny54lTC
	te48kNJrleYBXV9daqnWoEOcEg66EMx+Ib0FjsezibvHneHNAWLpcwlq82tDANpOWVvoQNT5wZJ
	T+mzr3BJ63Ama5iWKZC/5NHa7r/qXdixvBKozXeguWhsh7q0+lVanDNCKurkew5S5QYtG0UTIDY
	5hhjliJ4zZPpkq2TlPewmGjVzPIRgY6en1nAPRc3cwdoQgPvbQ2FfjNR15vo4B6zu3YqWMjBH00
	G6T8arOotKW6/zz8avqSSrX+Sg
X-Received: by 2002:a05:6402:a509:10b0:6b4:73e6:dc9d with SMTP id
 4fb4d7f45d1cf-6b756b06c8cmr547355a12.41.1794264706391; Mon, 09 Nov 2026
 14:51:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com> <20261104-perf-alpha-profileme-v4-3-1771ea02950e@gmail.com>
In-Reply-To: <20261104-perf-alpha-profileme-v4-3-1771ea02950e@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 9 Nov 2026 23:51:33 +0100
X-Gm-Features: AclHuK9poCE4l8PjGg9oSBI1_steTspM-yIVwxrchfEiyhq-TId8jv-1nN60SLw
Message-ID: <CA+=Fv5QKsbMqiUnKpMkVV8wB+3gP-CcxmzKAK11nfLpjeQjVoQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] perf alpha: Add perf mem support
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Nov 4, 2026 at 7:54=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The Alpha kernel series "alpha/perf: add ProfileMe sampling" reports the
> data source of ProfileMe samples of loads and stores: whether they hit or
> missed the DTB, and whether they were loads, stores or prefetches.
>
> Give the Alpha core PMU a mem-ldst event, cpu/cycles,profileme/, as AMD
> does with IBS Op. cycles:p is not used, as precise events sample only
> retired instructions, and a load or store that misses the DTB is aborted
> and refetched. The profileme format bit only exists on the EV67 and
> later, which have ProfileMe.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  tools/perf/Documentation/perf-mem.txt   |  3 +++
>  tools/perf/arch/alpha/Build             |  2 +-
>  tools/perf/arch/alpha/util/Build        |  2 ++
>  tools/perf/arch/alpha/util/mem-events.c | 17 +++++++++++++++++
>  tools/perf/arch/alpha/util/mem-events.h |  7 +++++++
>  tools/perf/arch/alpha/util/pmu.c        | 11 +++++++++++
>  6 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/Documentation/perf-mem.txt b/tools/perf/Documenta=
tion/perf-mem.txt
> index fe51c5e3333d..cb439940ce90 100644
> --- a/tools/perf/Documentation/perf-mem.txt
> +++ b/tools/perf/Documentation/perf-mem.txt
> @@ -34,6 +34,9 @@ be sampled.
>
>  On AMD this use IBS Op PMU to sample load-store operations.
>
> +On Alpha this uses ProfileMe, on the EV67 and later, to sample all
> +instructions. Loads and stores report whether they hit or missed the DTB=
.
> +
>  COMMON OPTIONS
>  --------------
>  -f::
> diff --git a/tools/perf/arch/alpha/Build b/tools/perf/arch/alpha/Build
> index 1bb8bf6d7fd4..e63eabc2c8f4 100644
> --- a/tools/perf/arch/alpha/Build
> +++ b/tools/perf/arch/alpha/Build
> @@ -1 +1 @@
> -# empty
> +perf-util-y +=3D util/
> diff --git a/tools/perf/arch/alpha/util/Build b/tools/perf/arch/alpha/uti=
l/Build
> new file mode 100644
> index 000000000000..8d924b229470
> --- /dev/null
> +++ b/tools/perf/arch/alpha/util/Build
> @@ -0,0 +1,2 @@
> +perf-util-y +=3D mem-events.o
> +perf-util-y +=3D pmu.o
> diff --git a/tools/perf/arch/alpha/util/mem-events.c b/tools/perf/arch/al=
pha/util/mem-events.c
> new file mode 100644
> index 000000000000..d3cbca1993b4
> --- /dev/null
> +++ b/tools/perf/arch/alpha/util/mem-events.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "util/map_symbol.h"
> +#include "util/mem-events.h"
> +#include "mem-events.h"
> +
> +#define E(t, n, s, l, a) { .tag =3D t, .name =3D n, .event_name =3D s, .=
ldlat =3D l, .aux_event =3D a }
> +
> +/*
> + * ProfileMe samples loads and stores alike, and reports DTB hits and mi=
sses
> + * in the data source. A precise event would sample only retired
> + * instructions, which leaves out the DTB misses, so set the profileme b=
it.
> + */
> +struct perf_mem_event perf_mem_events_alpha[PERF_MEM_EVENTS__MAX] =3D {
> +       E(NULL,         NULL,                   NULL,           false,  0=
),
> +       E(NULL,         NULL,                   NULL,           false,  0=
),
> +       E("mem-ldst",   "%s/cycles,profileme/", "cycles",       false,  0=
),
> +};
> diff --git a/tools/perf/arch/alpha/util/mem-events.h b/tools/perf/arch/al=
pha/util/mem-events.h
> new file mode 100644
> index 000000000000..311448cf1218
> --- /dev/null
> +++ b/tools/perf/arch/alpha/util/mem-events.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ALPHA_MEM_EVENTS_H
> +#define _ALPHA_MEM_EVENTS_H
> +
> +extern struct perf_mem_event perf_mem_events_alpha[PERF_MEM_EVENTS__MAX]=
;
> +
> +#endif /* _ALPHA_MEM_EVENTS_H */
> diff --git a/tools/perf/arch/alpha/util/pmu.c b/tools/perf/arch/alpha/uti=
l/pmu.c
> new file mode 100644
> index 000000000000..d19dfc979b08
> --- /dev/null
> +++ b/tools/perf/arch/alpha/util/pmu.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "../../../util/pmu.h"
> +#include "mem-events.h"
> +
> +void perf_pmu__arch_init(struct perf_pmu *pmu)
> +{
> +       /* ProfileMe is only on the EV67 and later. */
> +       if (pmu->is_core && perf_pmu__has_format(pmu, "profileme"))
> +               pmu->mem_events =3D perf_mem_events_alpha;
> +}
>
> --
> 2.55.0
>

Tested on my EV67 AlphaServer ES40 with the v6 kernel series.
perf mem record selected cpu/cycles,profileme/ by default, and
perf mem report showed 6452 L1 DTB hits and 81 L1 DTB misses
on a page-stride workload.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

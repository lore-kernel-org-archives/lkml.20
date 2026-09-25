Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F180E4D37DA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350404; cv=pass; b=KdY+o74rXUem9rUljDSAQD8/RPTsF0swEWg+5otUpSUUC/j5L26hUz3nmMxtBVxUTnG4/Htnyah06lNzR9qW27cTb3UDmP8AHWsWK2AXWyYm6rJNuhmAG40rUKyoji2DI6uRh97bQwNiFQSKpmk9TNzGOEEFkzDinXq/RvfjfxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350404; c=relaxed/simple;
	bh=BTBoKRsKkhaIY8JcZ9+wHBG7cBrTi6LEsy1fpIQp3fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=N4oedeqTFH+OwFtFecD+mJalclelnEGsOHKjqzmz2cHqxtiXAOmSvp4lKwQRHmJWRlNQDdCsFpzws+/FRPi9Ff8kod0H1nP7O8DQLvrHcDTG7UO4XCpS6e8Tcs/oxA3sj8fv8zYLez5guKQCCb4AIeF3myYV7AfwVTPSrOCYg80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lGd4lK+4; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lGd4lK+4"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53113d72966so257341cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350401; cv=none;
        d=google.com; s=arc-20260327;
        b=YuY8XXYovjTr2znWlHPOV4qpmm+mp2aoTvJkmcqFXWyXq0a0zURVE3mfJ3HOYyVh/G
         gsNye1z0yxK5f5KlFkubSLNcgJe+rie30mYFD+dQzcFTRwSviFgG+Cnd8bzJKhj9+xcE
         wKoYTtGVNEVW8WyZ38CyvazBvRAg/g9SISJ4ctEAIlMK665GkyqN/HZtJoVAmK9b12GR
         wLh8Mt/yYDJrkAMIEDO5ZY49DSqzX/ogBm0z7HOaB+SS3Uka32cfWccD2EljG4M5eH4z
         tQ3L9M7QvBhCswwZ8y/nidSln2HumasZrijLlwVP8LomBoyhGm4lWBfC+i4rAU6SOk86
         jM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WspHH2q7IdJFzP5Ho9Zej6L2+bb6vQF0pB8bvL5RAhc=;
        fh=5D4TFoPmoLn+DI4Z76npnNuu7sKkIg75tSmZlXRW4HY=;
        b=i2rCplU3BKiaCCfxMCa8oRU/S0+GScEhjUmzrhVfT/rNoUT/ggAwtP10sQOcf8fbwe
         7R05MchoU1j0E1tzXYDp/W/aQV4QaBz3biYOLfSsUF6775h//HMm+bT9ZWg0nbedX6SV
         PaOPa4u6dmepqK3ELNVDGGbhjxY95u+GcjiFwPKKaZmMY2X8argmkhWttPF57UMChgf7
         vJ+oKQDmcN+r6Eh6sQ+cwKlzPasjQwm0b+YzatmwCnbjhJnX/bu3a+I0lVqd8o5Ta7Ig
         97RgkuSht3cibJfv8lXsSza01qVjlUylF+TT73WH/QAYEvcbPRSPy5P2zbWBnZjMVV0C
         u/XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790350401; x=1790955201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WspHH2q7IdJFzP5Ho9Zej6L2+bb6vQF0pB8bvL5RAhc=;
        b=lGd4lK+4BX/8Yrv+Y7eiHIFRENOEpbaL+HKEKgp0EU+yA2D8leochMbqvEwoere5AA
         Wv5NEKhwgzcaG0x7mWIaWZY4b3LKMxWQOdtGXTs+iLBiOXRJtYxObQ9LEVyaRR7U+gYB
         laRj8fxpY20QLVCo8m4hc2Q1hR5MgKCKNU1Swgzv9uGs/064GNXwtAdwoDWNv1F/jFI9
         bXiHW1WFxzoRcjJq+YWdeuJ1kQZ5q1TibJ7LY3Sfq9NaFEiNO7jR0sCTu8CuMZuf/ldU
         P4N/8i7oOn6NUcfhUnTop344v1F0WSIrUo2DFojX5Il2ACHDs7VpEaFWjOzGQETa2f4/
         KmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350401; x=1790955201;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WspHH2q7IdJFzP5Ho9Zej6L2+bb6vQF0pB8bvL5RAhc=;
        b=Vb0eh57fNgSnWwkQ4+m8eVHmTY8D9mEgjexH+s+dRdL5anHVwtinl2IqRNxMW/kO5J
         rNa322kBKMJgcRtHHH8yNvhoEseIHIHQEbahhayPi2vkgu73VLgmiFRTpcrXelScG/wc
         8lMJBDRiZm/QrZb5ii4CgNgg1lCu21xF+aJG3NtY+Vt/6KdsKYpmFfZhdPY9BMHmrf2S
         +k9yG6T5hKnZN4eNGyJvX3sXOTQiuY0H6+qCdwyBQJrdhc8xgKgNy3UwNYEb53scHoUH
         VOAmj9rfIRrzLjBD5aFO3L6TqPcQBUvn/oScQKG/dwsEukWUMzJHuTp0mBXoFecYlPWi
         +qQQ==
X-Forwarded-Encrypted: i=1; AKwUvByMtCWyEchO3Gd13E15j1J5/clJ83S4vVm1OHWBKpLiJJdC3dv9lX7h/BaxxkL7+R5tjArTWvgHx3OwSK0=@vger.kernel.org
X-Gm-Message-State: AFuF++lr4GUBQQdJEASNUgh4Jmh0xXFRYnZr1zUTw2pTvOI0OxH0rZAL
	dF6M0M1KFdG+E3ZDdyKKJmdwpwOdOTXfCUcGu2EmsLmXJomdwmnHG696n9pvIdunw6IoW22y7sa
	Alrzt/1Qm/+XLuFgMYURpiG2Od06nf77yXOvFRONS
X-Gm-Gg: AYBFou1T0poGN8pqR2RqW4AaswSIdi4C0Toygq6gkAFtBiwA/UzBaFPSGE9F3Pd8NTf
	lSCsmFLrt2eYdXVIZuqshAjIl9J8sCFEWruP8cMbQkHMeeMMNepXMkQ7y/+AogJTriq4zgfeHOO
	dA6maeVwXHlo3BoJ8J+2+MGghfdE3rtO66TK8faX3qx2A8fqJBsR1y5d5ygF57XOJX/DaggZn0G
	AdVoVwCfEKSVhtnQV8KHrHiCpdNwuxHQk1hO244tkRRuo3lbmi8cDQTAoux5lkgIOPBNEGQA7BM
	SBzd8y19vp32jAJhl5LmCn96ogCy+ZHdMQwgvHob3/QFPmXBISkr6o+rlRPZciNmYJ61tPsnakZ
	t+oUJg2/E6Q==
X-Received: by 2002:a05:622a:11c4:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-5331a787127mr4656621cf.2.1790350400731; Fri, 25 Sep 2026
 08:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917061312.820074-1-irogers@google.com>
In-Reply-To: <20260917061312.820074-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 08:33:08 -0700
X-Gm-Features: AclHuK9bHrGPf8FuyoHNYaQY6jmF3U-YBLL6uatLtXIzCa91FydxfPvQBlHCV1k
Message-ID: <CAP-5=fW36Momg+N_P4vU08Pd_t+8PGK_-KfEn9HZjLPM4UO8nA@mail.gmail.com>
Subject: Re: [PATCH v1] perf test: stat metrics cgroup strip possible slash
 from cgroup name
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:13=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> The grep to match cgroup name in metric output assumes no leading / on
> the cgroup name, however, cgroups in /proc/self/cgroup may have a
> leading /. Strip the / if it exists to avoid failures to match the
> cgroup name in the perf stat output.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Ping.

Thanks,
Ian

> ---
>  tools/perf/tests/shell/stat_metrics_cgrp.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/tools/perf/tests/shell/stat_metrics_cgrp.sh b/tools/perf/tes=
ts/shell/stat_metrics_cgrp.sh
> index d4226ee0ae98..0728f48f21fa 100755
> --- a/tools/perf/tests/shell/stat_metrics_cgrp.sh
> +++ b/tools/perf/tests/shell/stat_metrics_cgrp.sh
> @@ -86,6 +86,13 @@ check_metric_reported()
>
>         for cgrp in "${cgrps[@]}"; do
>                 # Find metric lines for this cgroup
> +               case "$cgrp" in
> +                       /)  # The root cgroup, leave unchanged.
> +                         ;;
> +                       /*) # Strip any starting slashes.
> +                         cgrp=3D"${cgrp#/}"
> +                         ;;
> +               esac
>                 # We use exact cgroup match with surrounding commas
>                 local cgrp_lines
>                 cgrp_lines=3D$(echo "${output}" | grep -F ",${cgrp}," | g=
rep "insn_per_cycle" || true)
> --
> 2.55.0.1082.g2b9226bbc0-goog
>

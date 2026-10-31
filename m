Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793459871;
	b=xE8SZoAGCGVKigzq5YhzmdlHtmm+f1dkj4UtIUobBEqwUgQiEnybgJOtEMn7VLq0GVCE
	 4npr6GdMugeQOfAEFe8sifLc/Mrw6zHeHBD/5nFlgRKPRQGx5HdiQUlorUNFWdBwdS3lF
	 FWIqnJ1xlq34oxG5zqHdaAOYtcnVq4jhe/3/kMUtf6bTwnCbuxvsnMkQL/mPwNF+G27kB
	 B+aOIlfFl/2KmZcLWbP7WbyakFab7XpuMYXlbC4mcWuM6VplPju04526QgBnwX3CHwVuR
	 TijOeNiiAr2+vSEmsNGjQ4dGybHKk2RRaLsG1T6fzrbuxdBtpbix8CEzHc0gWVmivcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ivGTWu4BzmKjaoJGyQkGLOIrnm8Ff1i6dz13M+a0Bvo=;
	b=W0OTJaFfQHUoOJtigck+M6VBIn8RkycbxIH7tyRt2NyGChvtvSG74NAiE/sweCoU+4io
	 /Po3McImiA4mY8UH+fnOwb3P5HPSc2rKK6vr4shtRO0jm51WUB03KYSiwxrOUJFsot+EL
	 ZmKspiOAsFFkKwSx2HhsydgIUDyCxdzzmPxkb8wpgzsKqsFzDFf6PrMRGxldnZ3tFFJFL
	 oaT0IukEQU/Ytxa6IvxB4OlfRSm7QAwdTOXDGGxKqrbnb43ttuH0uyqheNrZKM0iJu/AT
	 Hp7ZgwS08vrLqEMd1pvvVZ9hAFOaBAf5JW2JMIwUBCVXu+GUhGigA1tOZYyN/EFO0QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnxYB9xZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6070606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6070606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnxYB9xZ
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so2697845a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793459869; cv=none;
        d=google.com; s=arc-20260327;
        b=kZ063P0PzjhfQslsdQtoa/Ffo5YJh1eMAsBt0cBUbFRCoaocAswvBrAL5o5juv0wWS
         3bUIS6Ta2qAXyV5zf1gV/4c2tB77v3hv8LOMxn64Er4B+T4ktcUuecLR6LvLABv8i2nx
         VR+GS2kllGDOqqrxOqKqRYpHGqg/2Okit42Oy9eddqg5aOBIrACvsZ6GFpRI/8srEec2
         DivggDFMy+7AEDrDofLz+KqNWKXEC55qvAB4F3QZYdXHfb8ig90vdSJnH6zeihEnP6st
         eA9QDKfK8954TLJiWmahaUVzvxJmTk+5rbpfLBP1ki4rzKoYTT9OxjLNpNyWPhdrulWX
         yJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivGTWu4BzmKjaoJGyQkGLOIrnm8Ff1i6dz13M+a0Bvo=;
        fh=CQScd7dF3Qre3CVfXzFX6iCcMKGL+IJoHKXy5hoUPX4=;
        b=BJQfvW5TTrQc7O/se26u6YPmKeE1DPtEXSKSHAKz8A+wqsMvtega+RlxUn2bqcDjeR
         1fX5FDMGm3clR9x1Iam3iZSi/rePzMUsAaj0voXRaSlWUKBgXM69iU7p7A8QGhtZzDbJ
         lQMwXO4jvt8Pps3JNip5kgya9C4Us7NOGMHpPo3YUziuVgqnMeRUXUCsLBt1faaAKnod
         G1e9EPrVwEvjlpfi91oMFl/rvzSmlKFELTbwwDcCdPctOxl0wABWp4LaLqcjE+yi2HHN
         bZ+bJ25YaTCkwpYJYZG15b+Cf1q4bP7lkKvjTUYlXT5cAZvtTlREjfqHy4FUKuRuD29y
         uZQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793459869; x=1794064669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ivGTWu4BzmKjaoJGyQkGLOIrnm8Ff1i6dz13M+a0Bvo=;
        b=cnxYB9xZtAZ/OPPwfPVy5DokNx7+PqeN31PtirnlApVGJaEXexayGOu0+0FqSxaPKs
         w0itJlM5mY1lcgTnVCd7ocx6fDlGoQ475odcb2GEYqYPmIuVk9z6IXbp0j5RPKO0ZpZa
         2WWnGyWG0FEtUYD/QThxLRdbZm01tJ5lWoZeC24odZpj0/Ly5Ikci+9HW5wZoqYg4Oiv
         bfEZj0RST1PQdKNzaqxziG3Hg5K6MPoPvfDm5/U5NUffHkoKwim355/cNr0GSdoGXIjL
         ORgPg1JZnOafvlligNzc7O75mFJPxq647A3arHncnSWr6gfmjpOrlc4iDpEipGEUYXgW
         eOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459869; x=1794064669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivGTWu4BzmKjaoJGyQkGLOIrnm8Ff1i6dz13M+a0Bvo=;
        b=ZYclfEEuY1G9vKbHLmQK9hGSbaM/y/JVv6u4oEzZRHulzGEOGKHGK2getnEANLvSOX
         wxP/5HmIcu+4QjM0IBdwoYEH/+RxeorhemK7mYBxZr+e2R7Pdp8bmv+mT8wJx9cawpJX
         yMWRPOA9Fa4MWmBWXPnBnk27JEwm38d+ABnXcq3bE+NceXKI883owUjFk5KDs3djDfLc
         +2oqNh+nit6dl+Y41RycHYWtjQj6DNGcvI+Rg9nIUo6QYd97nxuRSxTwav6t4+1gOwLs
         skJknHzDTPdkUVGShhRydQoBcpLnEJWMCttjcxC3kLhxTgK4fygnW/Tjp2M4J8s2pDJj
         OiRg==
X-Forwarded-Encrypted: i=1; AKwUvBzmE12QPYXmcvHWr9GR2Zgja+Sbzz1l2w2epY9SgpSSo2LEGms4EMvlVUVA4GTej+jwyXOts7NcWzXiJlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpM4+HTWO5kxLkHQ9bLo064dI0+t1y5XUPjOTFKJaFZJSFGZvj
	cn9qwiAaGQlYLq3DHAFmVJFRxhjNd40HPnA3Z2ZX367+qGjgEvi9dSOyCnNqjS8/i3xoRw8phC7
	tjGHOylMANA3pSsWJKaCUZIPGyhpFtFJ+n7jHSL0=
X-Gm-Gg: AYBFou0jBV4NYEuYuK9PXGUTVPQdRyGkIb0mMMHtJoIIpyp7hC4YGg9uq3kw0WvdZkz
	7W2ok1oiP4U2cYojHD/CfCn3/kfIh6TcQ5dxlTiE6xtvhzxP2T/sLbfUFUZLW84ce/C6q/1nzaq
	BwlLwdElKd+VjpEK2YPJnr3/hqxQTI8UfOO6lpisF7uHBN910jYDO+s2Pa6+T1jQYnks6i6kELm
	Bk9wsP/QN+gR86c+gxGjwgls9Usgj0mGYI8hD9wh2Y7rcwW5ZNbCRPpWLHmYWqvugoj2w4z6wkZ
	DleojHIPKymYNOYkdGjuTkH96DD6bGsG5kyN0Laajn7DybTouTfxGFv10tRWz2PfiIxMYJFm+eu
	DAv1ctWDAS/4QTApLAcZm6JQr2iTmO5mD9VQMvTeuTDXQSsr8oW1aMcuHJwvOZ+zQOt1L1oxuYC
	AZ5RgLD3HGrIQcr572Xx/qlCcmtSja6C/7/jhx00ssx4zw
X-Received: by 2002:a05:6402:2031:b0:6af:9a96:5324 with SMTP id
 4fb4d7f45d1cf-6b4d5edb541mr2916962a12.33.1793459868935; Sat, 31 Oct 2026
 08:17:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com> <20261030-alpha-profileme-v2-1-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-1-c702f1c65272@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 16:17:37 +0100
X-Gm-Features: AclHuK_R4D8NWUtYc6iQtFezNeMcTpVIFAfFVK5FGtcztQRPo5Tx6TLf5qBIjwA
Message-ID: <CA+=Fv5Sqkh=N+ezg1K4WTvfkVgfDgdFUR0Af7FJWFZUx6sLwtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, Oct 30, 2026 at 5:04=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
> PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
> PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
> logging options call takes a flag in bit 0 where 0 means "count all
> processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
> 0.
>
> Table E-18 of the Alpha Architecture Reference Manual gives bit 0 the
> opposite sense, but the PALcode in the ES40 and ES47 firmware agrees
> with the above: it sets I_CTL[SPCE], which enables counting for all
> processes, unless bit 0 is set. Linux never sets the PME bit in the
> PCB, so if 0 meant "selected processes only", nothing would be counted.
>
> Add a name for that argument and pass it instead. No functional change.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/wrperfmon.h | 2 ++
>  arch/alpha/kernel/perf_event.c     | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/=
wrperfmon.h
> index c97b82a1f7db..1fa9bc813263 100644
> --- a/arch/alpha/include/asm/wrperfmon.h
> +++ b/arch/alpha/include/asm/wrperfmon.h
> @@ -23,6 +23,8 @@
>  #define PERFMON_CMD_I_STAT 8
>  #define PERFMON_CMD_PMPC 9
>
> +/* PERFMON_CMD_LOGGING_OPTIONS arguments */
> +#define PERFMON_CMD_LOGGING_ALL 0
>
>  /* EV5/EV56/PCA56 Counters */
>  #define EV5_PCTR_0 (1UL<<0)
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index a3eaab094ece..2d9383425357 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
>                 maybe_change_configuration(cpuc);
>
>                 /* Start counting the desired events. */
> -               wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGG=
REGATE);
> +               wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGIN=
G_ALL);
>                 wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
>                 wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
>         }
>
> --
> 2.55.0
>

Thanks for the update, tested as part of the v2 series on my
AlphaServer ES40. Looks good!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F03264D4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790140901; cv=pass; b=uzuBZ3uHy6M8JtBwJM3qgMPWkWWTMp7PLVR+IVSpX38h53tghZ2TRrFf/bK2Ub9eqB6NiIfe0Xz/4UYHqrnYEOfs/Q1sXyqHP7QBmFUZ2ps03aj3zQ7rZRnoO4ihFGa8VaP20y47I360fZ2hND6ZtZqmJ5P1Tq1GgTeo0jidHcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790140901; c=relaxed/simple;
	bh=fjeXzgUyPMVpWTsqztlnXmY9TzRJEhenevz8j8bP9HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nb9FbuL/PHBv1ap62C3Z/ZyMhZQF1Fv1TIBETthdI0fdLjTsf77nNzs3Hh66xv1XVFBH2UlQskAU8Lsvw5PAj4LvTWSPgSjK0abdQbgn/qtQTIav9pGaiQaFjQBwHu/AxZzPHXnfFrJT1yzJND78gL6E8Q8jyaPND4aDUngprkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ucxOZh99; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ucxOZh99"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530e8c6fb80so100681cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790140898; cv=none;
        d=google.com; s=arc-20260327;
        b=pcY7uGYSxrlkL/L5u7NTdCl+7iBtKkoPHJuUrzDUqAYq7PQOSwd7oKVr9W4Xln5XWF
         NgWIkLBF1KI+c67J17DvSULxOmLp7m8HodaxVbriQFzYL4MtwT23/7ntBIlHTInohkit
         xmLwBrZ65fK9K9voTa/EpJh5a/jkedQQT8GcwsPRZvLTajIw90O65mDEhSjKUfrByFtC
         Ckxyzt6nuyt2aul7q7F+XcFWFwrRShEDdUXV/Jwo2wUEqw01kA/INpdv3e6he4gLnOiK
         ryBBOH9g8TUO8Q3ERbjI5CQCeMI7DkauPU/Oi6iFZWWkW8dOnHV+4NjgObbVcIY5llfe
         AvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/B9l6mIeZxMxe9Z/zLAxGK1w8KBQ/Nf7Vha7JvI1aMo=;
        fh=yEroXr5kERxjkXA3F1BQssL6p0ejBc/HyRf310ABPMA=;
        b=LP5UlJkDrwDWzNXwX9LNG4u/cKmZdICUhLOUjNttRG0YPD8PgoQrlTK0m95tswm/4s
         KwlU4o/9SVdCqeu1AvCkEOOyQwGULjQv87+g5SoXZYWVVi8hpuQidV2GfLDhzOX9DAXe
         n+22ke/9OVuinzaXheCZ3RMEqpj5XtnVVqjRSeAip68ikhU3C3h21R8weH0AjlTtpn3s
         gRfJ3mK6CbURAEg8YYC5TzMO9dUwKdI6N28kKp0WiGqa1/menFYt/XCzl/OBgvZc3ekO
         u0Eet7w8j/lL9EUkXqo4dnqbERNTDYleh26VUXAlNBn6NNqzif0hEL4firJSOqnQsKLp
         NTEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790140898; x=1790745698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/B9l6mIeZxMxe9Z/zLAxGK1w8KBQ/Nf7Vha7JvI1aMo=;
        b=ucxOZh99qJ1mQkWLHiNQCJEYbeDI9H+rJhnjyHxy/KjFy964amhJyxyvytIi58B/EG
         9bOm3wHJOe/Txq/NMvt+s8JichcpiP7NIBgHD86sJ4ftBaAoDKr7vl7QnUPLWZ5tf4CV
         Xm4xqyyUe/K797tJvjCvjQODiu1WOtON6IiY3/sfh8XJC37UpF+BKlPJypUDTcjinYca
         s6y0ZanM07ItWPOALJCyuRwp13e70MhxvtsjqskFEeILQ31l8UgzWszFLfXDc2IxsAtG
         AKM+E7Rss93pI0aMQxP76AtH+afVkT4EBvH+gbel1/yElfo4WfXfQZfOCiwDHZclW2FX
         xEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790140898; x=1790745698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/B9l6mIeZxMxe9Z/zLAxGK1w8KBQ/Nf7Vha7JvI1aMo=;
        b=2hJqciYu5zrVPkCkhYk+k6+3FaFRFj+PmLem3BvP4wsyfOxzcGv0b/ofqqycKB0+Ba
         /NdBkqiqNPYBxfU0BRGaEkdJjJP29IN6mR7vSR7gU/04yun6kxgOiCQWe4WGdqjAMltv
         crnoXNAF81NOrql1k0idA5L4qCsVYGm/tpRcAPGv959GEQRojuRqpEiQsGl7GJv5pzBE
         OXwFju7LT2/TxZM1Ek78e5RBJyj8/KyYMAK6sWlSZgjtfXnhdxOq2b5zvGiZcpPl1Yxs
         3CLV57hcxHlsS2h2l9An53V0a36LD0ic14VhET8Vz65e6W4uAdtliMcosxvtpMNS7W57
         PrGA==
X-Forwarded-Encrypted: i=1; AKwUvBzCMypcr2095O/KmPu2uda/FvpGsu/tcz0QuXNEnki7Zdbo/4byQzcKUvt2rp+Y7yNO1VrTe6LkOp54m68=@vger.kernel.org
X-Gm-Message-State: AFuF++lgcX0RrAZpkPzvJsP5gVyQ7ldGN27ob3pQGysMVTZUxGb/qsSB
	++APBTNtMFuHkccZYez7UpgUVpN2UU5v4QO0BOthXB3uUbmSaC6nE+oxFzLbtVhxjuCXLigkW+w
	VFnrmtNE9WoYOZBLzz90GJS0oFdpFg1cqmPyPGkF5
X-Gm-Gg: AYBFou217d6xBxkl/24STYCJgHfh3Z1NULM5GQwQ2y4Y23HscZ6+/fM3g7tEP+PuOL5
	FeV0b/TLzhVxlTWDsxkHLVL/RVlBKpQHJ69HoVikYjFqtOmo/Lec0Jt/KedihHreGnZECMAv2aq
	eG1sNNYJo6LUC/Pw02d4XSqsbx5HuSoxzEHHC/jyPpZNSQ0AKVV6KkzJmOMTCVvPgNoPoezmpwp
	BzhBKugNPqe7Zpa1x/87QoDMKHQ9TuQZm3xBvH1YVyaZ9/y0GscPeP+2IZmrURZeXh7YfKJlz9Z
	tecArJNs2+Yask3IynqdtjM8wXMRm2kVgxie4hSSEQGs5RlKkjuHoY8=
X-Received: by 2002:a05:622a:1b90:b0:531:6de:6028 with SMTP id
 d75a77b69052e-532ef055b5bmr6391261cf.13.1790140897968; Tue, 22 Sep 2026
 22:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-james-perf-aux-archive-v1-1-0ede8ed764ff@linaro.org>
In-Reply-To: <20260922-james-perf-aux-archive-v1-1-0ede8ed764ff@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 22 Sep 2026 22:21:25 -0700
X-Gm-Features: AcwNN1W7W6Rlvk6tFuRWSJMCRVxQegU7Pmwo5ix54xSpt0gDfcaZdx4FJDf5iEI
Message-ID: <CAP-5=fWUZrANh69W=aADmSwhg-8ogFBheL+chOHAWbRuhijEew@mail.gmail.com>
Subject: Re: [PATCH] perf buildid-list: Fix empty output for AUX data
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 7:47=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> perf record enables buildid_all for AUX trace because buildid-list does
> not decode AUX data to identify hit DSOs. Historically those build IDs
> were available in HEADER_BUILD_ID, and buildid-list disabled hit
> filtering when HEADER_AUXTRACE was present.
>
> Build IDs are now carried by MMAP2 records by default and the build-ID
> header is omitted. perf_session__list_build_ids() forces with_hits when
> the header is absent so that it processes the event stream. That also
> filters the result to DSOs referenced by ordinary samples. AUX data has
> no such samples unless the trace is decoded, so every DSO is dropped and
> perf archive reports that no build IDs were found.
>
> Process the event stream whenever the build-ID header is absent,
> allowing MMAP2 build IDs to be read, but do not enable hit filtering for
> AUX data, this ensures that all build-IDs are included for AUX data.
>
> Fixes: 6bd89ae7d147 ("perf record: Make sure to update build-ID cache")
> Assisted-by: Codex:GPT-5.6-Sol
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-buildid-list.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/builtin-buildid-list.c b/tools/perf/builtin-build=
id-list.c
> index e0881b0ac38f..5555f5dcefe4 100644
> --- a/tools/perf/builtin-buildid-list.c
> +++ b/tools/perf/builtin-buildid-list.c
> @@ -87,6 +87,7 @@ static bool dso__skip_buildid(struct dso *dso, int with=
_hits)
>  static int perf_session__list_build_ids(bool force, bool with_hits)
>  {
>         struct perf_session *session;
> +       bool has_auxtrace, has_build_id;
>         struct perf_data data =3D {
>                 .path  =3D input_name,
>                 .mode  =3D PERF_DATA_MODE_READ,
> @@ -118,11 +119,19 @@ static int perf_session__list_build_ids(bool force,=
 bool with_hits)
>          * We take all buildids when the file contains AUX area tracing d=
ata
>          * because we do not decode the trace because it would take too l=
ong.
>          */
> -       if (!perf_data__is_pipe(&data) &&
> -           perf_header__has_feat(&session->header, HEADER_AUXTRACE))
> +       has_auxtrace =3D !perf_data__is_pipe(&data) &&
> +               perf_header__has_feat(&session->header, HEADER_AUXTRACE);
> +       has_build_id =3D perf_header__has_feat(&session->header, HEADER_B=
UILD_ID);
> +
> +       if (has_auxtrace)
>                 with_hits =3D false;
>
> -       if (!perf_header__has_feat(&session->header, HEADER_BUILD_ID))
> +       /*
> +        * Without a build-ID header, the event stream is processed below=
 to find
> +        * build IDs in MMAP2 records. For AUX data keep all DSOs because=
 the trace
> +        * is not decoded and consequently none of them can be marked as =
hit.
> +        */
> +       if (!has_build_id && !has_auxtrace)
>                 with_hits =3D true;
>
>         if (zstd_init(&(session->zstd_data), 0) < 0)
> @@ -132,7 +141,7 @@ static int perf_session__list_build_ids(bool force, b=
ool with_hits)
>          * in pipe-mode, the only way to get the buildids is to parse
>          * the record stream. Buildids are stored as RECORD_HEADER_BUILD_=
ID
>          */
> -       if (with_hits || perf_data__is_pipe(&data))
> +       if (with_hits || perf_data__is_pipe(&data) || !has_build_id)
>                 perf_session__process_events(session);
>
>         perf_session__fprintf_dsos_buildid(session, stdout, dso__skip_bui=
ldid, with_hits);
>
> ---
> base-commit: edd8a9fe2eca009599e013a29c421c7a6b5ad1b9
> change-id: 20260922-james-perf-aux-archive-4c00c7943487
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>

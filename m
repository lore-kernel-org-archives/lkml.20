Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D84D0A1C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499942; cv=pass; b=fy0w55Qwimys5Lf/QMJ598KT42nfh6rDcs6I26bFLoiUVd9Z8sxO5X1ygseR82AZ39jq7qfQREPsO3gVlc74fXvnSpuF59Nqz+ZM00jlsRu2muB7yZYm+TOHuHuTl3pIrssmDwu29xH4LtdFKyC21jPY1S4YWOnEYbo68PfFXgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499942; c=relaxed/simple;
	bh=OIMXW2p+LoIfBZQlwGRdiXbHxWCzFXupB1E88y6g8no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rz2DMQ2wBeky4XcMW4xd6DG3gAPNIla39grunNlTJHRrMXNP8yYlRf+ScJ59p2GyRm/+b6UmQ9f4lLUmtVFx2RcwO7zIVaWF2G1fZT4uAMpZSHF6SXd/VCOydwf196SnWKn8h2XvNpNceucXw2nCjroTEeAjPeTBvjCSldkPyTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ob1c7Fio; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ob1c7Fio"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd84862f2bso23075ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789499941; cv=none;
        d=google.com; s=arc-20260327;
        b=eLfXnMGDFZ+0CGsc7oSk1rYWe2FY6RaxLLrZyvyf6ixhkpJL+7Mnzoc8ccSTbVRLAI
         XYcwNyhHaPulmEHDgvL6tXzQeQzMKyz5iHHL72Quq7+BSrNtmMP1pFPilKJvLdH2fEtb
         +46pQtJEp3J6fUo1zSFvaUwHIPZbXEU/7JP8yLn5XqKVhYayLfgVOSHWPSVsgzAMsnea
         IVw01JW/auMW9Zap28bscCpSHX8CgmH63qbkxU7FAxNN2QXY6LWijICJuSjB1CEYcM+x
         hnxfefdVQT5xF8YzyII6pNn3zlKUBCSVSMvUOBnF6Ss2QBuyTSKwX4idOmzVM0OTJDJ3
         xsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMRbSG5pSyQsgrHghUA9Em6/+/sgJSdN99MR2yP4Gxw=;
        fh=M/xAbk1xISFhOqLFtvx6HIfU9dNr3DFCxA6+paO7itA=;
        b=q/IrsY7mTmRTpVbFlcpnDRD1XfiG5glq9M3oeDeEOA5xawp3Ray+PflHowPhdAk/Ge
         i2IIJAlzCGNKN30iE5M/0HuRcen3oH6xZo2CYY4/BQfIkya4Mt6TomEspU8abK8SLJyD
         DTP46bjDxqHZLX9Hp38Oqdc5OMV/zhWiNwEXuiee57PkCoXZZSuCcnmquxh7ehxhwPDF
         se/uIAHwU73WK6wNcP8LzupVjbd+hnNi+OKN+0IOBwf30iibl9SNFEowWeS4DGt+NJFl
         OgVLs9YAwIaod61lbUFklZzqQlXxDVZEUJWnpDGBOTMtpq1mG10w2KzAUAnVrMfhq+dH
         IzQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789499941; x=1790104741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMRbSG5pSyQsgrHghUA9Em6/+/sgJSdN99MR2yP4Gxw=;
        b=ob1c7FiorVkzJfBxjkEPlw9WmJAHlXjyx6ePlJZ7MWkEZHGqzhL/x8PZdEK5JKf8Xv
         nHTjIZWSjr2pNw+J/FLKATkJq3J7fo6swIWk7Sg9rE0V93XHPlq5CWn9jrT5nbDCuWAw
         n6lzqwJdL6bWPoXXWy2jIkcUIwaagvOyPewPkzk09wNSY0OtBs4WP7lAK/txJB5G4bIt
         V+iaLCgLf8lp1Dgwl2tNncKHtBlX2DxCCkDC7I5HzBGlw6NkJtil860oX/45cJ6nFLaZ
         0X2q+UnzNDsRTj8WTRzSTDr9SQ4rJWnAsHqUdNCceP3P71wUxCm39BHQUmeMKIMGaU96
         20hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499941; x=1790104741;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMRbSG5pSyQsgrHghUA9Em6/+/sgJSdN99MR2yP4Gxw=;
        b=Pm7UyygLXsr+CvBDh7LUyilhRI25TiWw6zmnlusXLKCxPzd+9w9Q3IXBodZ/FPdRSb
         O1RsoelzvAiICTN9gc9yWGoeRuCiYhKuMGbvfWeQS8ommakZ5VWUMh17XZefcVTmmKgW
         ADERJ5sFMEwBmcAxW/N9VP3AErovgw2KCWgffpXHZfRXame0iWatezTB9/0YZ50ERUSg
         R2ImSXOApvc10ygfKwr9Pw4sV0soUP+z6PDYN2Rcr5f5bKNUa07u+5devtrly/hODGt7
         RcyKbTH87WBeuBP6AOa6nP1Nb9QzKrWGOR7Mpm2rFNMsgye/YpR0xAT9HY2SlAm+sPUt
         +qjA==
X-Forwarded-Encrypted: i=1; AKwUvBxOYyWmpinpwDd5qAEfNM27RWTcM7XNhK3cg9wdClBCJXr6Fl07r9qSk/65PtZQFQcUQmHS219jGIW4Loo=@vger.kernel.org
X-Gm-Message-State: AFuF++kVDMXbrIxL+MxEazcJzQgrWwFx+dzYr4+BNe/Ryt1YzT1Uve6V
	D5VMJOPEHGrLK3ZJPAvVL5IETtR2dRp1I454W2ic/2rQecXPhbxwWceeay+gliD/CkYbikcWr14
	4Ua20jMvEVCRavMu0Uv3PpHojoyQRJIGeU/1yW79j
X-Gm-Gg: AYBFou0JyqvzBocA1pHeYoFGR62++8BW2I87vQwcnd/k2iT470NxKlTDzEPSiuO4M1K
	PcjSslCluX95d1IRzTVGX40n9XPQFtVpqu8uXhrVDK4aBrNNjsZhUDQAbumaY5pVvc9Lc8ZqR1b
	/IQcAKdkSMUUMh4TH+sJd3w5W/Rkx3XBI5cb6AD3ZWZo5WZxe6KDBDSt8vYlltky4afou5b87nI
	MVBvnFpXLy4QtVZcwLRNIi2claQx9qGnNip0MUHKmMfnzi5G7Pd80I627BacC06b5PR1PXsu6R3
	5136nNLx+EzONaGXTmoUDxavvB0h4tNrRL+4o0tCxtKtuIXBrhHhlC2rXfzJZYcM88R2L2v6Zk9
	N17iMkDG9bw==
X-Received: by 2002:a17:903:1248:b0:2d5:db38:8010 with SMTP id
 d9443c01a7336-2dd89dbf2ddmr1048755ad.15.1789499940135; Tue, 15 Sep 2026
 12:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-perf-cgroup-refleak-v1-1-eac12ba28be6@google.com>
In-Reply-To: <20260914-perf-cgroup-refleak-v1-1-eac12ba28be6@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:18:47 -0700
X-Gm-Features: AcwNN1XanfpCtnrHGIBtSqSu9U-FJkIK93jfG98UT8RBju0HE6_E_2re-cRIeik
Message-ID: <CAP-5=fUSYh++yo1eQBVMv=2j4pRtQA_bhh9c=V98TTe_GHsyjw@mail.gmail.com>
Subject: Re: [PATCH] perf: Fix refcount leak on perf_cgroup_ensure_storage error
To: Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Ingo Molnar <mingo@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 3:37=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> If perf_cgroup_ensure_storage() fails, perf_cgroup_connect() has already
> acquired a reference on the cgroup_subsys_state.
> Drop that reference before returning.
>
> This probably doesn't matter in practice - it only makes a difference if
> a kmalloc allocation fails, with allocation size depending on the cgroup
> nesting depth.
>
> Fixes: c2283c9368d4 ("perf/cgroup: Grow per perf_cpu_context heap storage=
")
> Signed-off-by: Jann Horn <jannh@google.com>

I see that on the non-error path the css becomes a cgroup via
container_of that is handed to the event and css_put is in
__free_event/perf_detach_cgroup. Making the error path also css_put
makes sense.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> I've tested manually that forcing the failure path without this patch
> causes the refcount to go up and stay up, while after applying the
> patch, the refcount drops back to its original value.
> ---
>  kernel/events/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 33210aff3ee6..557c950eae06 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -1143,8 +1143,10 @@ static inline int perf_cgroup_connect(int fd, stru=
ct perf_event *event,
>                 return PTR_ERR(css);
>
>         ret =3D perf_cgroup_ensure_storage(event, css);
> -       if (ret)
> +       if (ret) {
> +               css_put(css);
>                 return ret;
> +       }
>
>         cgrp =3D container_of(css, struct perf_cgroup, css);
>         event->cgrp =3D cgrp;
>
> ---
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
> change-id: 20260912-perf-cgroup-refleak-b9b7e5417683
>
> Best regards,
> --
> Jann Horn <jannh@google.com>
>

Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F195208B3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790354; cv=pass; b=er8iIWKSQ3W2dZknuh60Xk/cHVc7AZ4AlK7bkXC9rSYXmZCqlN2NjFbjSwsOWxBcnWJjdwZGFLFVhU3Hqk5odMX9PABkYnJKWg6j7R+22PUUZ/qwjcoc2YNXeI2yoA/XSPiZhb6jIyEZDBD2ERVlsa0yCLM+t5ULHazjZyIXIMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790354; c=relaxed/simple;
	bh=pVumn0Fo0Z/w/+LO3c6ave9SWS9g+8WQZ+u7BTWnxvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vm/kXVqvbavWG7Nbs3ESiHMZtR3/OW9d1ahyWxTTL/AcMGwbUIvb547ThhaxQ1qturDHk89IMWJkhm+LxVAQSNR/YbNdtz5KT9MYyuT+RnfFeBxVf2XWl6K0MsR7CP6jDbmgK3tDEgRM+TumMVR9FNGfkfB4Csv3tzsPuAJoFsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EJFjUS/o; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EJFjUS/o"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so6805ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790790352; cv=none;
        d=google.com; s=arc-20260327;
        b=NAYq+sLiGcf8kRJ0vmFPIGTP/61ej6Cs+svVa6ZPX07utMd7C9fUYhbaY6oHOMp3EL
         /9T1qC5Bs5oZWEW+WRI0zg2yIG4AESVynz66hOzORB7bhtgo3LYFM1MmPVHdKQo8JtrY
         JfWIFI0htt4UfZ95RvelH6aweII01jiy4bJSTz8zZLGhM3ZhvXpB0hLYYq0TFkpnZdh8
         8GWddSfa2bURJIBN2qfGQvpW7ZtTT5vrgq1ZcSw4MEn8TN0Af7GpafPrmxCp4lzQ/jIn
         olMyKtcwizG/WsZF4+uDSdqYSHkwXSFmgMSyLFtMBFaRL8TAe1c1gVp08RvbHQcFA2MR
         IYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=745lyEoVbjciTEzOpvKdu3hogLTn3ptSICKnH9CyO6A=;
        fh=pS5T3mrRPdmeWmXs8vWIquzfrkdsAALpCErAPAjLUEQ=;
        b=ThAa04bVk2/YQe9DUXdK2wwHgcqCZ1BVEViYBDKeahxrXv8KCiv9M9/1gwG3dQEpjz
         7MF6/dB6yRovhvy+bpwqSMEmEDP0QcQdVU0YViMOOWfsPxtun0YC8IRZ05OI7MTiX9Yd
         mbD6ehVxajfY9kXjtXHgiloPHEfD3m4Xp47mjr9bINsr7r9Le1pyGPv1OXI36Ev/QVmT
         4AZmvmbMvj9TKz6gCAMh3dmEHoqbNp3/Z0P4/sTamKf1XDaDe8gRLB1DmDp6tNh9AlHb
         EDJZP5NiqO5B0Y48h9qlVebHJ+XIvyuWWqXS0AlADqaFf8IDAxMDhNLSRNldTvybDYC3
         uJ5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790790352; x=1791395152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=745lyEoVbjciTEzOpvKdu3hogLTn3ptSICKnH9CyO6A=;
        b=EJFjUS/oL3BZt+Y6WK3ESm7MOyNzzaaetWmYRD/xd9fm9OkgLCTfXPRBqiYGpwKrKV
         /xecn1iURtNlI6NFHRHrNNShBlYsJ/Hm3za3jMufMGgKvcIKvHlT3RAiREMrNvbtytcB
         MyDgpbTZ51ZMocv6cAkGrHNluNeW0fgfAgGrVHBmBCQQWRg1BAPAtrLbZM4Gk8xA6y9I
         VYhQjbNln1VFQZbCg8p/fR32xyMFeKO5VlXd9CHBmsnnBFKOo56wPfrTzuicMnbKx8TX
         j4uZNXwlbmo6gOUFVNbIrn9j7VSMd8uceh6/agEbIXG9dnD/+/T+OsngwcD9DK2dJi+w
         SZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790790352; x=1791395152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=745lyEoVbjciTEzOpvKdu3hogLTn3ptSICKnH9CyO6A=;
        b=j1aa0Rq7GA2bl4zs7Bm/RArGUYtaCKjoBDqF4fWwAzJbBo7Fgy8IoN+g06PYNdqVht
         NParqwkSy7HFr7e1oi8EYid37pkguSoNEh/PzxgWXwOZjR9XymC9QqwA9GFfOpBsdkL6
         fVe9ej5yP6+7lIVpqEZ+YvXUu8VqG5WocZQT/+VpW0g2FKbprMqO3vUzFeys4bcIU7PG
         CI9ulECHWDWxaGnLaR7daJKlWI2jb55HXZZLZaGlwgVHVEu4yorGYmblzi8636v0X9v9
         rwlqO0ddvQ3O+kRR3HgEjRtE9XZ4qESmWE6Rr+sIJ6IpB1uMmgOwrURSJYImEQftK5jl
         XXWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1zPDOxyzv0liiMhCqvOzEki/WA1SVqiW70fMvSOBJnN57c7EotnIVd+ZMRKvrAAUSxjMmAjgLz0LVSEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2aJo6+WTyGBrxIH5PKt691Lm9Vg9ZReb1SWiXBIizt5+tX+EZ
	6Se1bfVDIwyDsr8ULQtA4sSI9SvzLHh7JanQulsEJBkr+46Vc/GXEyISsZtpEHtFjNC41A+dNEV
	SpP0OZlMa4XLS5QNjR9XnEJ6LJ+e8OoqXcp22Sdrj
X-Gm-Gg: AYBFou2e5oc1QdNnGN1RXRtbq8uiF52GrAyzTjMuLtAVMb8FUSkKDsMZoQiQjJ9b9YP
	e70qV0boKDGsUp6s8YkSqSpNSOADErTBWKisy/7MsgfW3ay0dw0fqPZGcQ7L+GTNVepFvRghw19
	FeqKOE0JpREb+mzwWuhtsPqo9FmZeAostT2H2+YHlrWqJ6IibNb3it3itz67o0peGxyv9CT9Mv4
	bDJfXvA22Vpy1wOh1S7dkLJX86Dw/QLZiHO2esrPI1l1xeROAmiiukFcvipwwCFvmtjyMefVE8Y
	JHVwXBZ7Z2d46UOtWMEoAds1jZzyUDnxTe4JcHZCJSNjZ6rB8x25VI8GM1rL5K4C63b9pamxe3T
	b/hOzi18EEA==
X-Received: by 2002:a17:903:440c:b0:2ca:bf8e:360b with SMTP id
 d9443c01a7336-2e301ae0dcbmr343165ad.9.1790790351709; Wed, 30 Sep 2026
 10:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-perf_fix_pylint_errors-v2-0-945cd526576b@arm.com> <20260930-perf_fix_pylint_errors-v2-2-945cd526576b@arm.com>
In-Reply-To: <20260930-perf_fix_pylint_errors-v2-2-945cd526576b@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Sep 2026 10:45:38 -0700
X-Gm-Features: AclHuK96gSFJbCoU7KxewvSZZwDRlAoq9ZSjsa8u-XvTg7Cf3dwYi2d78g4fo5A
Message-ID: <CAP-5=fXwsY4DAL3qfNzdAF6SipeGP-YURhVDZzjCgdkXety_KA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] perf build: Add the output Python directory to
 pylint's PYTHONPATH
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 6:11=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Prepend the output Python directory to pylint's PYTHONPATH so builds
> using O=3D can also find the generated extension.
>
> Fixes: 5fe83fb352c8 ("perf build: Make pylint build test opt-out (NO_PYLI=
NT=3D1)")
> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/Makefile.perf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 0eb4e7c29c400021907d3da716bc4871f0df8d88..7ceefc1da774625d9f48d3bb0=
498ceb819b84d26 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -310,7 +310,7 @@ ifneq ($(force_fixdep),1)
>        $(warning Warning: pylint version is older than 2.16.0, skipping p=
ylint checks.)
>        override PYLINT :=3D
>      else
> -      override PYLINT :=3D PYTHONPATH=3D$(srctree)/tools/perf/python:$(s=
rctree)/tools/perf/pmu-events \
> +      override PYLINT :=3D PYTHONPATH=3D$(abspath $(OUTPUT)python):$(src=
tree)/tools/perf/python:$(srctree)/tools/perf/pmu-events \
>          $(PYLINT) --disable=3Dall --enable=3DE,W --disable=3DW0123,W0311=
,W0511,W0603,W0622,W0718 \
>          --ignored-modules=3Dtextual,setproctitle
>      endif
>
> --
> 2.34.1
>

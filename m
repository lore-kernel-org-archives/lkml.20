Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF6042C514
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509247; cv=pass; b=PevLrUEplZ0qOAcTDZ02vmqmN4E3ON0e/bWYaxE44xynrABVkaTe1ntScQ2XYeEqGnBil0V6m+nHRfl34Apz8H8OtNWkg0ho3ZwdqpksXXzeJkJGBuNkgYkGRr0mm+Ytu35rlQdqKusBzX+5fYsVvlnHO+i88GsnCEPHKnrQMOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509247; c=relaxed/simple;
	bh=0TQp8EfFx3Osrinb3pjUeqnZA4DJhjlAI5o7JdUlPZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HufqWqGg8k3EqdKcfiou5aa7yqOxxsYA9qFwgJrUwyZ4a/MJNrnBX9/A9DpqIpml+jrHEebxDXfHY/PIrfc//lAPQ0v7xLPtAgT+E2fmlBkphP4NsSRx4rCDP4aJwAkiN9yv2wckpVVCshHcJ+9pT7OZwxhB8Rqmsok12pozJW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zcbmu9DI; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zcbmu9DI"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5306706e89dso35611cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789509244; cv=none;
        d=google.com; s=arc-20260327;
        b=E6SB9vs0BvSl3wC4K+vfwcxAeGVMsdpPJk56FBxKTk2Wp6qnq8o03qqHjdVi7XaLLN
         2CUa1Kef9LxQfqAUtiUSiptyU/lpgT4T1RemzL8y125zi70spX9DmXfxj3+88geD4zJW
         +92kiU4EPPXE+nI8aAOoukwbsx1vbkeiEYUga4sdTwUvYst09Y/ODzV+sFpSsMkPCmqR
         C6qWhxUSMyzz3cYYVM77n87dr6qrRZ52w3Tz5n65qP+gtWUE/cSezW7WBMfPsZvVuucY
         0llWBLKErUWHgFFhJ+Yp66lhicLFfSbYqJyzpah2ilf2lk+jWabZg3grF+xO0HPY1xs5
         X5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OMiuKQhfBcKvkFwTEw/tDiEQn5IJqyQSscIYNwp1mJI=;
        fh=aXhiNuT7mLIA7KssUzGxjuc011BK9SoiYUrlPvXesc4=;
        b=i7/Xr0zeNFJ5gvEFsRZKRYIpvmCFFhqdu5Rx+nVlG6hFefRNFlpAL0x673pD4h/cpG
         PPkxM21Hg9soxQ3kTMg51PDrc49GoJ0KninGzRdJxbI0LuHBRgxifPJnfLYZknXxIo0/
         vxzMcCZ3wN/2paS1c0NVEMjQxHzAIDDBlcY2tKsut/Mk34UVIWJ+UlSE/c5eZ5MlXsnH
         8BAqYLnZuz4L7sMLw/Kf4BpciOrvDROe8JKtk9kwv7m5Msgj6PDNpO50DXUsdcyvc/X0
         CMuE38lirikut2fqu71crLfX5m1H8MJAs5ysf8LGbcOfrQModqCClk5XwURveNpREQsU
         M5bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789509244; x=1790114044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OMiuKQhfBcKvkFwTEw/tDiEQn5IJqyQSscIYNwp1mJI=;
        b=Zcbmu9DIzKehw4KEw9s04u05bcJ0k9qqAjw0rs2z83W/wak56taTU84HNi7ctToMTO
         /imhVnGyz6pkJrD6iUD5gMSo5D1j4+gf2tivZ40EPa1dHP/kuVa+kcG8A2lrICHGyXEe
         S8C2mmuLv8NZpGen1CF7BCd4npwizh9XrkiOCjN8BgMxAfIOrOyHZBxTsDZfc2GCQiNM
         hTGVKogapzhwaSaHvBkzgUFxkIGigxZHm5GftK5Whn0thJ8YzLL1svogT5WrIq8TTZsG
         2gxS1X1fLgmQH4f/2okQLN4mzs9FpdvUqf2/x/dF4cdaDMLxnikWdlFvbIxkp2ug1dw6
         SLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509244; x=1790114044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMiuKQhfBcKvkFwTEw/tDiEQn5IJqyQSscIYNwp1mJI=;
        b=DYGbWV0gF+AbAlLBifEv8DLMSRgula2mABrJMYDctOYwooezk8Eh8LqJILe1HnnQrm
         faTYZdztgQBrMXFCeeogDHr1ylyFJ8+GRFM6Arv0gbJggJq7df8bGmFZjhoBmvtGe4B4
         NblycVmuM/74Uj7NxszSw1MGaFEfu6eI9LGHCpo7yqFUrO8AeOFmD9cekHs2moB5BPY6
         remKwwxX8UH+30fKzGCESMjiAgEkRpBFw5AldjlPkaSR6L6o2yLvD24Y4z8Wb7pC9aKW
         KXAm4xEMYQIXAE/0edUFBx6mYYm7+L7nc2iSaHDcWcxff38pjRg7WROd37z+jDQwJgGf
         Hd0w==
X-Forwarded-Encrypted: i=1; AKwUvBzbw+gO9RdgMZ1aEX3QGrO0R6aItx8kfBhiaECi3VpgxD7WaKoW1QwSI9ubPUbET221AexfKiMFlGAu5pw=@vger.kernel.org
X-Gm-Message-State: AFuF++mtbOKT4XsI3T1wixIDVG+g6esNgLf+Ud9DpeZau4rX+Z0wQneF
	KaFzfp76jmfh3gWg3dbeQVNF1eJvd2lfKUkogylpxzEklhh+5NFt/5EZI188puFjhv/n3VmJZk+
	i4X6passdMphki6gkFfg1BbAqyaSqaD1gG9piNf/l
X-Gm-Gg: AYBFou10R/7/wTvgWWJ6sa36G7kAbbNxiH73f6jx5h2xTpvnQcy3xgUqfqonFmqiKUI
	asFaqc20X6IOVBTUYDCXViseX7DJQJCwwV2vF+cN+LteFFyXBzrOwH3LcakbIvFDkp4nwqVXcui
	hdjK9wn2E2QLYjfWsf0gj8sCjmLSFuIgoiKzwxZJ1Ljb036EHlxziRZ46SNRBFXnf6oWMQhWVp0
	qYXDTZGNcJ99HmX1321BVkmytUdSE6P+/+G2LBUSNcBgryfc9ZQMwSDOKvkSA4CmfIaNSr8ySSr
	4Xul9zK2ZiQNj2DrcYI0twVMYmbdR1M55DmRl2G/ksMaIcXQPwjWyzLPMyR3Bg34bflPlNvt+4k
	8EjnNeDbwkg==
X-Received: by 2002:a05:622a:4d8c:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-5327ed8004emr1261141cf.4.1789509243807; Tue, 15 Sep 2026
 14:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131122011.492961-2-thorsten.blum@linux.dev>
In-Reply-To: <20260131122011.492961-2-thorsten.blum@linux.dev>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 14:53:51 -0700
X-Gm-Features: AcwNN1UD4Ko0WaR7iNBPqrcMZnYEXf8XodDGvSRhaJ_vRQwim3aRznf3-BfcM1w
Message-ID: <CAP-5=fXA6d=T=+JfNRHWAPaRjNWzrNLNChwYmNzrbu5rxKJe7Q@mail.gmail.com>
Subject: Re: [PATCH] perf/x86/intel: Replace snprintf with strscpy in intel_pmu_init
To: Thorsten Blum <thorsten.blum@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 4:21=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Replace snprintf("%s", ...) with the faster and more direct strscpy().
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  arch/x86/events/intel/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
> index bdf3f0d0fe21..025971ab6341 100644
> --- a/arch/x86/events/intel/core.c
> +++ b/arch/x86/events/intel/core.c
> @@ -12,6 +12,7 @@
>  #include <linux/types.h>
>  #include <linux/init.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/export.h>
>  #include <linux/nmi.h>
>  #include <linux/kvm_host.h>
> @@ -8077,7 +8078,7 @@ __init int intel_pmu_init(void)
>                 }
>         }
>
> -       snprintf(pmu_name_str, sizeof(pmu_name_str), "%s", name);
> +       strscpy(pmu_name_str, name);
>
>         if (!is_hybrid()) {
>                 group_events_td.attrs  =3D td_attr;
> --
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
>

Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F224E73CF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842027; cv=pass; b=bG3wzyaLWO20qCu5I/zx2ATVxQi2wLPZOI2fqhjxty8IufTUm8wPU/+bpI9atFm3ugSSJu43EQLBBeK0QLw0SlDQKIP5KAhcQgXx/I8z8CnzIKUB0NNN3iNVsk6nJVEA7C9u1aYhR19ByWIm9p+cTQ8Vr8/LWhnq8OtschElOBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842027; c=relaxed/simple;
	bh=GQkJdkA7OT/9hMa9O8Q4LEbNdFe7qTbtE31peqa29z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCza24DKn1xyX3K0NLmlU22/o/aWNUd9S5IKrrzlVWPi7y9KsCdfivHe1AMjdtBYGeErOROIt/5QKs4R+zmn0DX1804+JtN65BOMGmnHniyC7prFDu8GrjAjy8i4gDllDUG2of0HqEG3nBPH5h11Jif44g6cs7UnOxMJ+FM7iew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZryMLOc0; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZryMLOc0"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53584e7c349so563281cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791842025; cv=none;
        d=google.com; s=arc-20260327;
        b=RlGrcFi+8RdBWZj7ni9Lq08W53nJqlUt1VG4gCGbMSe1G/DfddKscn0GeUIGdCfLRm
         L8hGrMQp3KaStMOBKX5kmgHZsIXZYQsD5XbG1LuganK3aDPhv9JPA4DTS68RTLqPxOUR
         B8x2LeXdIX9Unor1SL2gZoGGlnikVBIeK+FzCAvvAVkPX8wvE8pubyRhsCUyltL/YLmp
         LbJ6zPkNnzpA3qtjrYDlZD1rxheqvijG9HWK6ib865sNu2CuLiffqrt1j7WuGU6q0jNo
         B1ktlW8i36KjT0cs0oWN/j/nmAIKuDr/Lxo1SgPc2PvoVWmLmN8fHcypPsUWvv/mLT3W
         R4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pi/bWJhyirPFC8++uuaGsmPa6qZLaBSHWg7d4QXh3AA=;
        fh=rNPDBKnUuOPNjLzok3iyfLs0zQXtEcKWhBjUfplRKHM=;
        b=a2VeWyisF94MVwDqwZTKJHifE1L0Q3t8MlHUEzqyXOCj0MKj7u/XxEuKKGws0pCHrv
         v2l77rBKRoSAkg+i0fhNNW4Kzq24DPv0AhtGC8oVVaIsG5tpleS+TXfTw3wcqrPJBhDX
         gvxGWYjSgELCWhyToJTGLJerTp5CxMVKZWccGp74hLm/PN3XNfkYtbC4kHICr8V00Ket
         iJZO9ah4yG2lQWOnw5KksRv4oKyEUp/WEquudQz2eYL+PUOlrDBIXTqVw9bUq+TntuIW
         eWOtWbNvoJLDt6+RFz9WMwRlCEukwLOiNWhC4InOJzMduWor4vILuTpKaZyk05a+lOAg
         t/hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791842025; x=1792446825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pi/bWJhyirPFC8++uuaGsmPa6qZLaBSHWg7d4QXh3AA=;
        b=ZryMLOc0xHjByLcQYTGXgO0dmugn7h9t6we9UvbllQpTJZRkTOFEobOq9S3KRtW0q1
         MKGIZKBTRnkXbl5HcNiuAqNe3zHAlYmN1V2CDcF3kzRmqVjZqpXprfYmeYBj8UYdBcEr
         KHyZrj/hJTW5t4n+ahyrJlqBPFb0GIsQENpfLjk86UzEx+POOvfBVFiFPH7BgTQyB9DN
         8Iw3/oz+jC5oHaivjYy408v2uLC0Q9L1yjT6v8RMWw7/lw9K1IM48qje8vll5nUNEZHM
         JhW4qXFBycbd26RU1UVyxcU/pr0JDT1vE8MFeeqjwvk4CKQh116W+tQKrV8yjuIPdAJK
         TpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842025; x=1792446825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pi/bWJhyirPFC8++uuaGsmPa6qZLaBSHWg7d4QXh3AA=;
        b=jB26g5EGsZAKxUSKNyyqOqmNWLhmvsNDwV8jBx+2FpjSLj3rG+K2SZio5OZli0H6Nj
         ermmspvgspMi6KPJrbie6lXjPpajvvC614OjX5nWb1p18N/ovPkVVZT4bSeK1OYVoZGG
         H7LbU9Z/Xwt/KD2vq6krcklZX0K2xEn6Z7jvbHazMFH4BNVVuxLDY9J/hdMwwkP/hCtC
         BQohFDcJkAD5uuNICjmezINrS9lh0P5X6eADhePWlfODTlbMGETF7BsxDnsq8BpLML7K
         2vlR89aCaRqq7OXweXyIofn/1hXex6lRl5I0+PyetpVFjy7cRR4aGSiGeuLFOBmDN6aw
         j+gw==
X-Forwarded-Encrypted: i=1; AKwUvBxPzuakEPIbrutQ9YL9/Uds9BJ0vezxDQQqLsBEx2yN5UIXlJpoP1wTogbqmbSaynwJEhloACeGliHTNmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpaKT/XW/2feE68/qjaiG2wIcsPesom5m/0rQUHnVxRp7a8E03
	IT3eo7arF3fI/ZE0ahq6J860vuo4Wj3m77Hmw5XugspcI8i9hBjPekiclD3r5V3E/o7ecnhABYz
	i3Ns6Dh5MvIP0FAhwNidOPWTQa6ugtrgy9ek04Cz1
X-Gm-Gg: AYBFou0Uaqt4s27mRVTszusT1WQZUb8xMoI0LBkxYKeYaQqzSW1y87hojwXMb72NSxv
	/H55JMON2oGJ0ZgMh6ySJIgSxRN2WUBPf+Ym0ps0PenrXaId6va6gKpmeHhEXRUdt2Ye0ABlOyE
	jroXCQ39BqNAs/UQr8booWQb0KxuIfSp/jkqcdLvzmRphaoGyRhNg8LiuNb2opD16q2hS9n51Tw
	sw1tndjx16XIOEle5+tzb4MFiNSOF9R1v2zsSGmdlBJIhVfrjnEXQgi+eeQO7WFZIK6fiYcsMp3
	5CBJ/8W6UOQnDX9PEBofVR8RhDZUGp+dNyNfC/6wEruVepoaVb4dBsxaZTP2qtpSOBa4JljSTl4
	PA7sPvj8xuMQ=
X-Received: by 2002:ac8:5a91:0:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-535b2e1f48emr39592221cf.2.1791842023805; Mon, 12 Oct 2026
 14:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012053013.14378-1-namhyung@kernel.org> <20261012053013.14378-2-namhyung@kernel.org>
In-Reply-To: <20261012053013.14378-2-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 14:53:32 -0700
X-Gm-Features: AclHuK-cu6LGqOlFADADJSW-JXKF7LFVV-5siK4pCPAahOQ4557KKmjokTmZfcY
Message-ID: <CAP-5=fVMwm_Rpi2OTVx74uGpU_dD7gSeqRVM_24=NkMUNYfjeg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] perf symbol: Add missing symsrc__destroy() for libbfd
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 10:30=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> When libbfd loaded symbols and there's a pending syms_ss, it'd be lost
> or overwrite existing symbols.  Let's destroy it before breaking the
> loop so that it can safely return from the function.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/sashiko-outbox-162540@kernel.org
> Fixes: eac9a4342e5447cad ("perf symbols: Try reading the symbol table wit=
h libbfd")
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/symbol.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index a394e742f9b18812..55a4b59195a08be5 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -1932,7 +1932,7 @@ int dso__load(struct dso *dso, struct map *map)
>
>                 if (bfdrc > 0) {
>                         ret =3D 1;
> -                       break;
> +                       goto out_destroy;
>                 }
>
>                 if (!is_reg || sirc < 0)
> @@ -1997,6 +1997,7 @@ int dso__load(struct dso *dso, struct map *map)
>                         ret +=3D nr_plt;
>         }
>
> +out_destroy:
>         for (; ss_pos > 0; ss_pos--)
>                 symsrc__destroy(&ss_[ss_pos - 1]);
>  out_free:
> --
> 2.55.0
>

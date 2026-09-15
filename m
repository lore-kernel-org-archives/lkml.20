Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625D044780F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500940; cv=pass; b=MGxBI8dvS6CpwrFziw/cldMCjShGYT15g8gIjFGM6RoBGJAO+XGYHhmEB2vNviH0oRha2CWBPaIOcaD1pErNEGb6pAalIktHBUmtjwy2R7GFVRwMslNNfoNBlaIfaBwPpWJ+M+agYil7UWgSch0T8yHrVVWx1uacWX0SISLOkJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500940; c=relaxed/simple;
	bh=EegVME3jJbuQHyWc1V01y8Y0UN52nI5cYIfZ+hwBI+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8l5o8GkZSWgBqmh41MlgGxeGUKuQVeOralSMo2NQwEKiksvNxkp9bZJ4blrdTZkmvNz8+g6ntNvEEy8ViZ4fnYgi893YSdq6h4ZxCcZ+xF5IeRBlo5AzYWfA1jiVii6fDB1w8e5AHYIlIUT3sdoCveq7Nsit6xVcz0RvuxISvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+7aE1q9; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+7aE1q9"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d5fc2cd8so59791cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789500936; cv=none;
        d=google.com; s=arc-20260327;
        b=j6ooyrMJR2oMsNerUt5kB0BeY7euGPnCIYzZalfK+CEYVuzVs2n/RO3REWD2tz1hyb
         /h6kbX1l6llvLauT2/Qiswqa1hPV/3cKYLYE6dndguc8WJbL92M03Td2kjsG/ttlKp9R
         zYweyhXwcu01E7pxoIBszenD7g2Xkd2Y75e1TvBbpXhFejqL00e66mzuJrfzSoCtoh1Y
         D2Zl2b/tsUvn6afGpg9cOY5Uy+porXSn/w2KlwSQJBB4UlOSy/niIxWzq9E30ziyYr2M
         uRVwMNCPgukTBrcswykRaGAlr3zMdC1Ja9QwKi/2cqUdOPmLxoFqoPUahzAHvt34KrrB
         Mqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cJfPpkkLfvSAtU67yJNBlNgv9fTffV7M0TlsnD4pBA=;
        fh=AH1ctH8nKHLuvrCZzQszk1eCAqxjzxWNqNChey0eQZE=;
        b=ajGnQaBToIpPwpJW9X3CnfDQqTi8Rlk+/0BviCSVH2fSfI5hp3j9Vw635GmAtWunG0
         H1//JxPfxTm1Un84qttZqwefTXb34vwXdEoWxT8bbxWgbXKNZWGfjZ+RVy02sipIIhMc
         Mf6EEyepyrHFT47bKkhNbFu/mknMxYiP7cMt5UzLxZ+FpGKx6UlMppyDMPJ+rSsE4OtO
         YEsPzNhOnGmkW/RHHiNj/Hi+a2cW0c9TfyfJ5l6zjJZDfMeeq7yAxLTmdLGhXt1fWs0M
         7none4yOJY/oVrirzrbz6oaWtS1VDH4HPPC5w3eBeObh+5becKaBcTG+/HA5WTcU6/DT
         eswg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789500936; x=1790105736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cJfPpkkLfvSAtU67yJNBlNgv9fTffV7M0TlsnD4pBA=;
        b=g+7aE1q93WEcJeL7jXczqMbepWTshjMfmYF0jseGQNCVyNSJSYm0cKlfsc6ak7f0N+
         v8WQrhlqnd7msDh+3GmCEguRbKlfhSp6rozAmwJSL1N8r6vrU5E0seFS/fGt5iu41TXV
         xPL3yDhJzBkaq4mZkoixPK97BOdNPJ2wx5iFy4gk2gHxyr4imFF5x1FK4xkXxRlKDdya
         iN7MB0HXD0y6yTAFBce91ZRUXSGInibF0k3HJIRHUxqTrpTZb2jZ6Q9EQjShEZcNwIEE
         LFcx+C5yvuZgBJ2wuigcNFhBD6fSNyu/xbShpbcAZ6g5S2bNzzFTVNU3r8gVPU5XwkBk
         sA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500936; x=1790105736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cJfPpkkLfvSAtU67yJNBlNgv9fTffV7M0TlsnD4pBA=;
        b=rugyHRM6a4156LoSRM6+ns1M8YPAMjDLKTHd8GUguh1+wu9YAoTDKSHHSoiPP3cS+6
         QXUEUSFlLyMVo29qHiQ8jbrRiPATXY9UtiEWNOFVkOde5Ltfjv/aJrpswwVs1oEdf5eb
         D72XKqFbgPyB0vY7C8Xrah3fsMw+SzaKXtiO4oNXmcBq25wL36loiylew4nijTEXvMvq
         WFay7kRuLTbg90aOvyUpjdQ3eryCVWjO8rvDEbMwZ6BDkDZfA0oRnijt+yYrT2O4QYvX
         UyrrHDyJsZWMse69VKNB75gy9UgOLwKwnPrP8aZhVWHs+nhpUgJklSKw+3GgkftQ3DC5
         w4iw==
X-Forwarded-Encrypted: i=1; AKwUvBy0ZOxapJOXP5wJ6ZRlXq+/9iZnw1PLsorWJhevYQPudSiDlrP26KlBkyGKiyPtj4kSkYWvJGOuoACaw0A=@vger.kernel.org
X-Gm-Message-State: AFuF++ll4zwW2+R4IJxsasEPsK5KQK+P7p3vN3uu8bq+mItl9zDE9r5y
	Pure1W2OzNVWjUqV91rHrklapPKQ84lhqdVxMrMxaAFm2POV7ZVwBxHbyUSR1pcVmEl7BXfsAds
	yEBebKHmRaC/W9UV6+nHctmHVGvkZwPfCpn6ALRAE
X-Gm-Gg: AYBFou3zGOl/YwrpPbZpoJrm9J+6XBD4zZS1xRI/bCmcfzArlpIoPS+2yA5KDkji5GN
	g40wsK/txxQ+u+/LVfsvNzruT3jufrEmgWiXLHU2XtNv8UXJSztlW5Rtc5JL015bXFDZ4bicLMo
	ew+2/uTjqUxlh1HEUHYONJMyPIYXoEY3kd+08t89Wy0JG7O8OyZbnK04n4bo/7c7/3IHK/jVBSQ
	n9Aq0uYRmaMSxDhBLR8A6uB30ebWSBqe72rPRB7AJ2FfP0pr+HSJwGKPV8Ob0uF958rnPUY6gJi
	iMP2ry4VY/MErLurxeE/+XlfTWIMqkPU03D+3gxZ4A6vZZbd2Ts/1/Qd8TQ9XYZ5uCe0u8GrrUZ
	DMVEd5F6jGw==
X-Received: by 2002:a05:622a:1a93:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-532583a627amr3002591cf.14.1789500935305; Tue, 15 Sep 2026
 12:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914121903.1212-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260914121903.1212-1-cp0613@linux.alibaba.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:35:23 -0700
X-Gm-Features: AcwNN1VYoT5oxIlcFTffUxjtkWkLWpHOZQGEahUpqwEycg875lihiCow5XKgF3M
Message-ID: <CAP-5=fVW6nJXoh8qf4e_jkLXGUzCGCTCg9YivHkN9kkVJmMa-A@mail.gmail.com>
Subject: Re: [PATCH] perf test: Fix a leaked map reference in the arch dwarf
 unwind tests
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com, 
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 5:19=E2=80=AFAM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> maps__find() has returned a reference to the map it finds since
> commit 42fd623b58db ("perf maps: Get map before returning in
> maps__find"), which updated arch/x86/tests/dwarf-unwind.c but missed
> the arm, arm64 and powerpc copies. Release the map after reading its
> end, as x86 does. All other callers of maps__find() already release
> what they get.
>
> Fixes: 42fd623b58db ("perf maps: Get map before returning in maps__find")
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/arch/arm/tests/dwarf-unwind.c     | 1 +
>  tools/perf/arch/arm64/tests/dwarf-unwind.c   | 1 +
>  tools/perf/arch/powerpc/tests/dwarf-unwind.c | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/tools/perf/arch/arm/tests/dwarf-unwind.c b/tools/perf/arch/a=
rm/tests/dwarf-unwind.c
> index f421910e0709..d4707e9ffd2a 100644
> --- a/tools/perf/arch/arm/tests/dwarf-unwind.c
> +++ b/tools/perf/arch/arm/tests/dwarf-unwind.c
> @@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
>         }
>
>         stack_size =3D map__end(map) - sp;
> +       map__put(map);
>         stack_size =3D stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
>
>         memcpy(buf, (void *) sp, stack_size);
> diff --git a/tools/perf/arch/arm64/tests/dwarf-unwind.c b/tools/perf/arch=
/arm64/tests/dwarf-unwind.c
> index 440d00f0de14..fbc161a49369 100644
> --- a/tools/perf/arch/arm64/tests/dwarf-unwind.c
> +++ b/tools/perf/arch/arm64/tests/dwarf-unwind.c
> @@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
>         }
>
>         stack_size =3D map__end(map) - sp;
> +       map__put(map);
>         stack_size =3D stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
>
>         memcpy(buf, (void *) sp, stack_size);
> diff --git a/tools/perf/arch/powerpc/tests/dwarf-unwind.c b/tools/perf/ar=
ch/powerpc/tests/dwarf-unwind.c
> index 66af884baa66..b4bade5d59e2 100644
> --- a/tools/perf/arch/powerpc/tests/dwarf-unwind.c
> +++ b/tools/perf/arch/powerpc/tests/dwarf-unwind.c
> @@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
>         }
>
>         stack_size =3D map__end(map) - sp;
> +       map__put(map);
>         stack_size =3D stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
>
>         memcpy(buf, (void *) sp, stack_size);
> --
> 2.50.1
>

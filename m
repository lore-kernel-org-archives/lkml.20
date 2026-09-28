Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5845F378822
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631242; cv=pass; b=VVL5vy1SGvMj1XxmsUx/AHvz0iQYnM132gLQwYSoiarD4py3+N51U4f+Oii9T1o0p9e0qZEqLJLKpKnZ0YRfq5dGWSmDFcE6Zu4vpZC6m+VbH4L87Hs23w6lZ/jSzlxbd6OfxNdarUNP8t2cCMaJPqS6aqkbjAZ4fTlv3u1SKCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631242; c=relaxed/simple;
	bh=mvnwzhrAjkxMDQIccUyeWUTpXbWAVvfTvL0DsV5qTxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dq6RLybRQAOJMJuI81oDS1QnMeUFVLRiC2ZB5hQlO+KXWOlGfGR4Hn4hOa/Z/vgZ76pronAuHhV1bOIrfuwhLBS1TJcpIqtu8fL3Bf5P9wjpOThU+lh7p4848WbkkmMzEcJwFy2RSdH+gTLPgFClx51S+83ppp2MakUp2yi8gMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cbllXQMi; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cbllXQMi"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5333401e359so47821cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790631237; cv=none;
        d=google.com; s=arc-20260327;
        b=l9mEd6IC+La287WAmG4fjDfdNP8+ZSqHChuwgQbHOyydthAznxh48C+lVjT7O3gNdC
         6kmvh7jJGlGoI8MevNLN4Njwild+kydPVYRVfuW+2QqHpMyRQhMcPDqiS/UaGf9S3vSm
         SA26A7ykArTFCEPvlginbGzTcIydhCyeb9fgSLQ+SuFHPM0DI3S7KmueKtXevr459ibH
         TFnuxkij1tg6d7ZuJwzEGF9n7cB0c4g7Rs0epED2BQOaVPY+C9gzlIRmO6hGgfHl72U0
         UaaQYibsI4C/k+TNASd2J6Tv9DUv+hX6/fRV+LJ0n9uPg4v7YKLWF4jzl238BY3/PWkJ
         aFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8eEcchkIpkzuM/k/bywXXqMRJi4G2cjVVq0/v/CZCJo=;
        fh=pY6Sgrr3xLYO7B2Lp2dk+g7Lh8V8gD+Jol1sd00OZ4k=;
        b=H3vwYdyDW0d4aOgBEgMiKhd8PelEQBgNfeX/DWaq0nM1RyzNld5Tp1nPnoNjZPYuDl
         dTcCUirKhoATVswoHDupbS6s3KpRnvY9OzIkXiknKgP+m7K1YR3brlqSraeFIgyNAT1d
         tEaIApuRomwr6Hu1BR3qDe+QPs3M4wKzRYiAdoIoGv7vfdk5ONWXHR+Xt9YtckEPi/jy
         dcbejRFDy/QWX7I8+FUXlP9lH8QQDdkzunPArdD3t51tuoNi59KFXsJxm/e2p9tddo3A
         p9EwF3YabLH+rSJo6WCbNjBoMwhDTUK7erp7yEe7rKcUREd8twm7aUosTVN1MXPL2Brh
         TZjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790631237; x=1791236037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8eEcchkIpkzuM/k/bywXXqMRJi4G2cjVVq0/v/CZCJo=;
        b=cbllXQMiWRgOBjxvlxCbIF4a26yBnHX1iIKioPDZJWQ2wKo/7LqE5gT3N3BwlgOv5S
         2UAIJkfPxk3VFbCnjVMAetepDGHLDLyy57grVbv5uTFLCLLTPFIGxckzxETU4SlexBNr
         cXaADWClQ2+fGKPZduCUdsdXNQO4053xfG5XoBYJtHs8V9TWOPH+SqAGvOTfDlKI2MBn
         RoGSbdMWdq9F4hK6Z5BKhVwqU9x2tThmRYh15dYCI0fiFRkHVRTUCAHPhAbyynpKJW8z
         eynbPyGx88uUERHces/CijfFTsf5SkUJ75VMHncF3THsMYPQoIX0qp2w7NPVAWXlkVK2
         YWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631237; x=1791236037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8eEcchkIpkzuM/k/bywXXqMRJi4G2cjVVq0/v/CZCJo=;
        b=jQbn6WEgUlVGTdDFQsP/LoQzXdFmv2XoJf3Ct7KfTMCJ1Ja9MQIxrgR5L1Bwi8TT+c
         tXki+yPW3cva3opWJ6F9HRL3RXa4uxEe9uTCp3TcW5MJHYoItSfDUgClqbPNA/+LRWAr
         Zhw0J2YtS58qX8j1FzV2wd7KZky8Gzaoj89zsxMmFLxeVSUz7xDkRDbvu/VBn/JXvmqo
         jaOpSquYmTbTbdVBu06mKPa3y+ArzJGCwzjq7njk/od8XLpvn6WET6RL62KFBuPEcvmg
         KVqJqy1LEvgS25oJIWkCALj4mMsPoZziqzCQW8WkIvYUFcl5vqxa5yImxGU6YDktsK6z
         Vo/g==
X-Forwarded-Encrypted: i=1; AKwUvBzGAVhJ5d0w+kfRWhyTTdNIpS5bmz9WmVRp/QVYieyRWK4lpLR9UkYSM81odjt9pBuZD8Uhgk11SsGWxus=@vger.kernel.org
X-Gm-Message-State: AFuF++lEsF1RrlQ7bz4OmBYMgn6KmmR8qDYiDl9tnftJneUxTPFhxqCi
	ma8xWC1xgMlcwOPmzFDScMdtv1/7GqorTwnKPIzy7xavK/6UWCNt9FAxryEu4BqNJW0TB/27KmV
	dXBBESyV8jXQpmdy7WW0V4HebZIlCJrZeZekWH/I9
X-Gm-Gg: AYBFou2xBoujChZiIioQnm2A04NaffalmYyOodzV0ErWEIAGUxUKUrHV+IlPVLpWXb0
	Paa4NSdDGsp6CoPFC3YufBsBRjZsu22NCyyRnWw5SVVQJ2SgDJjOeuSxuAx9cn0p0DadhIk+FoL
	Aii9b+hjEdyNGcSvQeyggu5/kZefBQoCJAlJ8v0OmhAeO1mjOsmDlb+aIBylrKWiNdw0xXlAxaf
	rTEORbcI1CxpSaIrMitf9cJIbwqZu9kiKd3qjnF0+MePIRfgO8Emi3Ue7rWCKmhCU7HQOjNwozc
	o1ovV//4yXMTPv5aAQPz1C1MxI5NNeNvrHxJO8dAEx3/9/4GuWSmqsUwlyeO44Y2pwqxG0OpQwn
	FjSFwD4ReiA==
X-Received: by 2002:ac8:5dca:0:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-5332017d9f6mr39094041cf.14.1790631236924; Mon, 28 Sep 2026
 14:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928010227.1903673-1-michalpl2003@gmail.com> <20260928010227.1903673-3-michalpl2003@gmail.com>
In-Reply-To: <20260928010227.1903673-3-michalpl2003@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Sep 2026 14:33:45 -0700
X-Gm-Features: AclHuK8tOhJaaF_R6BCpvZsdIDDniOhALvqDSFCbWhh5mpLbAdq-z3_Ao579OEI
Message-ID: <CAP-5=fUZZkagjaQy0wvme_L_+yif826nPXJzXNJ2YXuYZ6RW3A@mail.gmail.com>
Subject: Re: [PATCH 2/5] perf symbol: Don't return an unterminated Rust
 demangle buffer
To: Michal Pluta <michalpl2003@gmail.com>
Cc: acme@kernel.org, namhyung@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 6:02=E2=80=AFPM Michal Pluta <michalpl2003@gmail.co=
m> wrote:
>
> When dso__demangle_sym() runs out of retries or fails to grow the
> output buffer for a Rust v0 symbol, it returns the buffer and callers
> blindly use it as the demangled symbol name.  However,
> rust_demangle_display_demangle() doesn't NUL terminate its output when
> it reports OverflowOverflow, so the buffer isn't a string.
>
> Free the buffer and return NULL in both cases.  Callers already fall back
> to the mangled name when no demangled name is returned.
>
> Fixes: e20848c317b5 ("perf symbol-elf: Integrate rust-v0 demangling")
> Assisted-by: LLM
> Signed-off-by: Michal Pluta <michalpl2003@gmail.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/symbol.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 163652f071c6..3cb42805a82f 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -2762,17 +2762,16 @@ char *dso__demangle_sym(struct dso *dso, int kmod=
ule, const char *elf_name)
>                      buf_len < 1024 * 1024; buf_len +=3D 32) {
>                         char *tmp =3D realloc(demangled, buf_len);
>
> -                       if (!tmp) {
> -                               /* Failure to grow output buffer, return =
what is there. */
> -                               return demangled;
> -                       }
> +                       if (!tmp)
> +                               break;
>                         demangled =3D tmp;
>                         if (rust_demangle_display_demangle(&rust_demangle=
, demangled, buf_len,
>                                                            /*alternate=3D=
*/true) =3D=3D OverflowOk)
>                                 return demangled;
>                 }
> -               /* Buffer exceeded sensible bounds, return what is there.=
 */
> -               return demangled;
> +               /* Failure to grow output buffer or buffer exceeded sensi=
ble bounds. */
> +               free(demangled);
> +               return NULL;
>         }
>
>         demangled =3D cxx_demangle_sym(elf_name, verbose > 0, verbose > 0=
);
> --
> 2.43.0
>

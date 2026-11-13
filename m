Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587473;
	b=f3t10JaIRFWTLpSDSWrg3oGoPOG/NRLNU80YMGNcCtHgZQSKh3xyqdL0YFxVtu5HVqhq
	 pIAyIwnhSyBod3Q2mID3XxS7fk1cEz0whx8ZPbo/DSKiyF0RGvKCSwZZo2gK74bnXmfRB
	 AgsQmIZcCpF/632PdyLKGcWr+qsVSV7BioA8tHFHVPk4ThNpA8xIIF0X1zkoCTDQKHwi+
	 pV+CNw8NAJUcyP1hupo2c/i2LpRMd2faQcpZRg1j9ed6PqX1oYNWi8XMPrFqaYIrvP+az
	 +jMX0mWQSLuq81j7i2kKpYnz1om/JX6ttytrsmJguwLeOLGeQkgv2fe/avQCx6/yZPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bb6MtTt8fw3gLO1EuXLXH1MyB9ZeehUQm7NFHSQwlcs=;
	b=2WgkYNbhiTXanGbQHdr1UD90HCQBGegUXjIJdyKeJyma0QAdeIA2nWLqrXDNCLSNK3Va
	 kX+TWZ+snSg/8GpIe4xwG6mGdilmQwPHICn29iZe5CZjzvxxaeeAOLFXlNHa0tIxrbfKG
	 LbWKndB5VfYWTgS+v423XNqBabp+RpvRnZgUTaPM/eIUdZNYRGjx13FDfmzHs6unZRPLs
	 jknrLu/G4MSnzlEkgzxRWGhPeWtf1yltEwv0aW4I/sgTsdB0NVDMatjz6yGEM7M8X3VgB
	 gO4qSeaxFmegJtnaG/TBHuZAM9bWvGH2dqE38+KK1FlH0B6quRuBe8kPvZ9MAbSGHng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D0mTq2hB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23633606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23633606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D0mTq2hB
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so423701cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587472; cv=none;
        d=google.com; s=arc-20260327;
        b=lfpKmhXQZADR74QgX5e2htmcXfyASkRGKO/10khNLVV7wmhLw7SPjOlvLECIqxpa0j
         4mJnweSv1udl45E8h9SKUKxZCZWQuf/+bxwpVj3Y5N3qMgml6KOuUCCjrJmiYKoY9rY8
         EGLkFk/FrVDkYwOsRuhKlc7d4PPL09GMrRh9A7daoOrnUKDItFrI3DHlk7QgXuo8NeGF
         Iv5LkuVyvWbaf3IrNYprmR9IbpEgFxKknJXnCfWHfsOwmSTiTDQs5QwL2zLotGNSB6bZ
         s+3FhZlY8/WVRQojU8qul+SXd+QH/SYH6UxMP0rsFjkcAl6G4REFVL16X2kSjActNNRe
         Y/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bb6MtTt8fw3gLO1EuXLXH1MyB9ZeehUQm7NFHSQwlcs=;
        fh=4T+WaJDUg2iERtO/Lw2/fafYKnqOY4u2A3EWq/gxJmg=;
        b=X1ltqiCv+ZtmXlcDEh5hUZlL52fU3cE1/Yc+/Nw3q7gCNRo1tK+fn5HconwrgXFwYJ
         vseSGV8RUtiPOxnmUFTLXCP8aibphrm7MDisqE3juQ3xXqc2L2QqqesG62xxeo1auXOr
         xpQ9QkiOs6OvGkTBmhKYTOiDAAaCzBLpbrrN6cvbzv48QqL+U3g96GBtR4mu0snm0KUi
         tChROka+twnheIf/9RSof3XIniKUSz/VySwZ6f9OMrfxeDpOaCAlhpWWLbJHq4KrZsWD
         nvkBWHMnvm5pcMcH9+kv8VZvpuiapdTx2fUJV1SW2ZaaPte7HOs2KYBgyqEzmEHhu7Cw
         9uQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587472; x=1795192272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bb6MtTt8fw3gLO1EuXLXH1MyB9ZeehUQm7NFHSQwlcs=;
        b=D0mTq2hBUelgvewHcQhK77kI5KOI16mWnVn8ctk/3vGvS2D9ejivZrmR8iQI0DHGtm
         xIPem9ZIL54WiWzk9j7Tceaid1OQx+gqOGDl2fa/5PKDo4N2DP1FOXrwlrgA+1xdlUSg
         UVNi+bNa3M2yt0XBbe/iqtac2nR2OZy7NNeZ77WGumQsfOLAM4yZg50yIesNka4FGjpN
         2xfZStLp2NDwkQDDVERrszqgbXulNVvumAmwYh8O/+e3ZIkSapuqcA5GJ3Duehgwlm+L
         mFSBUCddDsKYDAqV/5MUGaW4aBLM9aaxYkR57yFwYI1Ann5gVDAfy3UlJWYp9shpOzLB
         khGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587472; x=1795192272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb6MtTt8fw3gLO1EuXLXH1MyB9ZeehUQm7NFHSQwlcs=;
        b=L0JPc6C61qxP7ogNFi9GbILw2cWsD11mWwj6KDGjyjMHsfUrgxkFY5IqSzR8vb7D2F
         Po8TQWT/AoDF64YJz3RnrxMVST7iybv5brLkEKB5I7ueW/cSH+irSE9OiLsE7B077/m7
         hgXsmvpRTJGc9//glbYvEC9TFigFm9QyBeW/ZQ9RjdGBv3KfxSIEEkPD3Rw7R0qdWfzP
         +jBMmxMdJQaMdGRblMKaEV5YrQ30hpE1rD5g67xQqc75SYFOF6weOtztY5oVR6dGzYTC
         SncL7auGLcSdQwkDM9FQ/J2tUSA2FTHvnyGlnKycDtzIffU23qP9uqefURYbKpein00i
         D8Iw==
X-Forwarded-Encrypted: i=1; AL+hErG4B6f2ecwNdyxFIsILKc80TrSH+XqxlviInnkl3tUkv2pXr9TJsmZUamvYxNI7tSjqL4O31i1/ZLZ474U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sTXf/XnBRh1Momv5OnSYTxt+Ju8DAwXzl7bySnz6hQ3QOkeO6
	cn2mTGjVvH0AUnhFHvKpiXdJn044byRKwsXdHiPyRWTJsebNiSbQsaSe3ys+gUpcPy9UynbYXlQ
	GVFcs4PjkIJgYM49U4d20n/vj+SXA/0rqCfhj3ozG
X-Gm-Gg: AYBFou2saUteyPkVbGpoSYVoMRpto/3JIXD6awRkSaKRzE2zoIZLmEOOhEpgoF7S8qT
	Lu2k8saD52/uSFOHDfevx1RBTBhP+0DK0GIHswtBJ2I4565wSDAIlz/kH9/tLQ/jUvLRogHgmZx
	j/4UlkKIVMOi1DgzyRgBaRn+vv+BlH0vAT4OfT7FCwymd8qx6EPdjj7OuEG+5DQfwxy64rKHXqt
	Q6N939MceByqL8U6Rr229s0abax0SkgBHjWsc5SQ1yZ8uwYDj2sz7YHan1EkwoNA6b6+OqwRwLE
	GwFU/RB2KL+Q3kke57K5Fps9OzbtgzEFr/n3ATg0Z1a4CfaZL/c1vDrX43o2nyAbm3PPia1Gjy8
	RvZnpJqR62USD0nwA3Ta0yTivPFkU0rLVteHQFvp536Z/6QjN/sCo5xEc3IWCRifOFe8=
X-Received: by 2002:a05:622a:2598:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-55add216af2mr14131991cf.6.1794587470995; Fri, 13 Nov 2026
 08:31:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com> <20261113-perf_fix_gcc15_failure-v1-1-eae592c5ff64@arm.com>
In-Reply-To: <20261113-perf_fix_gcc15_failure-v1-1-eae592c5ff64@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:30:59 -0800
X-Gm-Features: AclHuK81Umb631_b6CHlhoOVg9PPlSLmHdlP3oRotsMVgTGCQSYiylEnl9LWtQE
Message-ID: <CAP-5=fXrP+FSmv35KgvwDkNED921X60W3BWiMYHmLV-AzSG4BA@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf cs-etm: Initialize the Thumb instruction buffer
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Robert Walker <robert.walker@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:55=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> cs_etm__frontend_mem_access() can return zero or a short read without
> fully initializing instrBytes. cs_etm__t32_instr_size() nevertheless
> inspects its second byte. With CORESIGHT=3D1 and -O3, GCC 15.2.0 reports:
>
>   error: 'instrBytes' may be used uninitialized
>
> Zero-initialize the buffer to avoid reading uninitialized stack data
> when instruction memory is unavailable and fix the build failure.
>
> Reported-by: Ian Rogers <irogers@google.com>
> Closes: https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix=
_non_taken-v3-0-7629b52ab047@arm.com/T/#m64fb81c665214b79883d9be815b40ac5f6=
669628
> Fixes: a7ee4d625ede ("perf cs-etm: Support for ARM A32/T32 instruction se=
ts in CoreSight trace")
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/cs-etm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 3e01b401ca6f3a08f44bb69204317efaf2fa18d0..25f12bd110934a204d79244f4=
5317085b7a81666 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1369,7 +1369,7 @@ static inline int cs_etm__t32_instr_size(struct cs_=
etm_queue *etmq,
>                                          struct cs_etm_traceid_queue *tid=
q,
>                                          struct cs_etm_packet *packet, u6=
4 addr)
>  {
> -       u8 instrBytes[2];
> +       u8 instrBytes[2] =3D { 0 };
>
>         cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
>                                     ARRAY_SIZE(instrBytes), instrBytes);
>
> --
> 2.34.1
>

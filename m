Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986744;
	b=0tuPUixn7HSVzqu1KqnRIKzxbcaxYc6lcSb+lS5UeWO4ISHyHSD9Tm8EYo6aAX7eTDd3
	 SX+DtFe+OC6fik9Bzxo+DdlapO05ATYfb9hjNXV4dVSyqZ0b1mo1i+9tSI8eByVsdo+Kb
	 Wb3GY2n6biCWMfBwZC01nZrO+gSIHmPBvJV2KcNXqNMzRGBAHRKhE4pKEQaK6LoVxpDE6
	 YWyoW/qETWLEjYsQFOlXf0LXEtQ5ESZGzFcb328d/4OnqBzTEoiNcaEYPXZIUc4IrOVHY
	 Pz7nuvNJIzV06lP8VnaRJba4EQzMVZe8dgpp0rcI2+K0HGX8Zsi0yUAB1Nvi0zGITbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
	b=1+LowLeiid5A5pUQ6nT+LLkx26JjPBVQXDrC5ugw4Gpmt+E9FkkN35aHjgIV6g7YDMKU
	 gujscw6wpAknBRzoo3Kxxnxpq8qsihOtr1AM4NdGUfGbkVJUTx91Jju2gHCMzQt8TKIKc
	 x/BBcHonr8LZ4p8y39mpZsH2UtfFCBdxrGbQdp/auhQkiLTTSLOj3JgzeFb5C71IcIF1b
	 jVNdifneZzQfzApoK2w391HRQpAirpd9wK6v0aoIWvWSUCLBF5EM6ihi/qRCSEa0WxFEc
	 Mnj2lsSzdwiDWYrBZZQMncv2h66BW7uFPwMZue++D1sLewav1L2m7PIMfuLSIB0lomg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M7CeSLUn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41F2606EEB4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F41F2606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M7CeSLUn
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so571a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986742; cv=none;
        d=google.com; s=arc-20260327;
        b=o6BId3TrJSYhjo94PC4rP38C9NKgKFqB+bO169fiH9TerQHKa+xck0xgbDLzIv3twx
         vGCrM2jjxSX2+NP3uqKOQwk5WGAhQMZ7nr1fVcbKVg8sWSGcVvxstfpEtg8Oi/6hNk9t
         /1rPDxAbewz+i/z8fgBw3r72bl+rpc9TV3A+d+iPILO4pRYTogg25SaLglQKDIHRUU/1
         m5NX1CVpl8aonmZZESvoPaPIVBv0Qg1orz6+Rmz+muNn2EtTOzSX0qB3JyPN+zCF6uy4
         igAMHP8qpFbWVAUkObhILbYg5TZ4vvzzV1pRx2D4GQE6761Ds5wckg5aSLVY1G4I+aSE
         K9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        fh=6NMm+VSmn8L6NodyHPI2KfiNI6AfdqHYKLydhJkaYJM=;
        b=he8OK3o2HbqmQohQvTiRWeHMY11Pe+Yc7l3zOpQTldJiaF4lOAs7etRn2jziCY7s+J
         IfYLlgtkIlhyMmtBKXNQbDyLE8yVqMHuwYG0j00WWtxuR0gqG0cCgjnvaSMa8TQ3CHqq
         VLz0Z54VscR4GAjnn87roQkfytiaEC5Rpyjxh31cxPGrtgxhiUCBlRzRmQis78mNAoj6
         aWbiDoYO+wKEEB9I2FlJTvJHf/PHE5m0rqvNUPNjKAG7eMbhYHT/osx3/dTuBso9b106
         DHDVvlnACHqbNOxKmGBvj5IBrHDL2nJeLh9L5kKvpV3FsCY+QOGF8bMUPbMdgTAVeVx0
         zIjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986742; x=1794591542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        b=M7CeSLUnVxKXHq3kGnMleixotglsAYU0MiEuDhK7fsOjczEHbXTiKqJrfSGezu7e46
         ggPtTI1Xcu1odtYXH4SKP9WaZWktV2qIO6zMGm+ZLwGacmNcYBjSCJ+Z4BvSLjmsHiSh
         cLaAxzY2clUlwKsEJaU1gDoAuVR5YtNggNmVoLOadS+vVCK0RfNM/xzGagX26B70McbH
         OZbtACuWry1k7zu7QSWqfTyKzrhkuWG9u4kIM9/Ehu9AC6M5pzXqspMlwAWO+cFl2+Kl
         hoYlxUsus5SYVc6oVZQN4g3xXo9zkyEDFzFor3ASRDWe4LkSIxvWOavhR5OemRFAxYO+
         i3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986742; x=1794591542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        b=m1iowOp7zUNz7WHJaZZ7ls0oJRJlkQCsHjRjF/k0Kn5UtugeTMNjohSvBi/Bq6rVyZ
         hugWeE4MHB4wdRMdCbNQr6EE7JOhGLDg6z4kZlRrHqYNiH19bi298K7PHuSuvNjKpQcR
         bw7IynLM31w7A9FYNGCKwznhRUofizhsoJvMwoqieVnGZMNxtNTeZ0hCrdU/vcxTvsQb
         7vTXFx5gxIY1qM38tb2HVc8Ojwrhv4v94psENFeHfuJxaYRjZepCbMA6kUAxNoFLPeLJ
         /Ozj+z7/8cSNpWPP6N4EXxuAed564zGs94qLGPOHGw/+T06pjw3YJvTi1TYrDUWDppI/
         JQjw==
X-Forwarded-Encrypted: i=1; AL+hErHfffw/DPUdHzZJ3lHijiv8+8ZA5u0oSWWFjd4SkkHCgAO0tVEGWNuedI/3cMDrkyJgPc+ttmlW5sQ/8FQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V0kqOMR6V/D1NYBVjGFAuRTUny5DvDxUg09wOsEZsdviPX/3N
	eNCTDqy88Rr2yPtGA3o2dh5Xm7itkEyW2j6vLMJZFwO7Ar2VAoUBm5mRRbWjFVBJiXK8P66WRNy
	LlibakdDnb1offUqboLio5YEfXJCG63QO4onCuKQt1rgqsP5naZvl+w02vX8=
X-Gm-Gg: AYBFou33T/T/W6Hy0AR05De2KvhC7l8ae9wAGNoBoXv6IC/ZE3Rz53bTNhtt0r2TRnU
	EhpIUQJhdghDkv90cgA0QKYs116reHgGd2+3q5I9u9H6pNCF3m0tvtzfSUdtCvzQB5tY+MJKIXm
	3oiTrEHMMbEgqHB3okzSJNDBxEI6Ccj2t+S22dapo4zs7G39jVZTcroOEAeERVRFWSU2d4Wsy2N
	F1vBFtSX/l74QaN7BCrk2BFLOpLKjiepmNO/qlJarvj24WNaZ+mLlybnCNl+boJdPoqz00hq5IR
	UBQgeoRTM3ZbnPc3QxNGPwyz3M/waP0jgsxn2lHNqSSLzl1D9+v4AHU5UHusNgf+rgrSYp+/M4x
	TnXHE6PuO6jUI6QN+7WQGZUR7Qmdtk4pj5+MoxyXjNT5UEnJyRYev2xpJ/eexS/a+6fmUdZN921
	xFOMLbvn5cn5f6
X-Received: by 2002:a05:6402:a594:10b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6b6f843548cmr6213a12.11.1793986741181; Fri, 06 Nov 2026
 09:39:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
In-Reply-To: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 09:38:48 -0800
X-Gm-Features: AclHuK9krDICcHvY12_TQOAPQOmYyqI_XtzGscWcqlFs1PTf4lzGC_gvkF1otP4
Message-ID: <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good to me. Thanks!

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> automatically passes -mllvm -sample-profile-use-profi whenever
> -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> inference algorithm (Profi) by default.
>
> However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
> FS-AFDO that degrade runtime performance compared to LLVM's original
> profile propagation algorithm. In addition, Profi's min-cost max-flow
> solver (applyFlowInference) can hit pathological compile times (30+
> minutes or hangs) on certain kernel control-flow graphs when profiles
> drift slightly or when combined with GCOV [3].
>
> Pass -fno-sample-profile-use-profi to disable Profi and restore the
> original profile propagation behavior that kernel AutoFDO was tested
> with. Guard the flag with clang-min-version 210000 since it was
> introduced in Clang 21 alongside the default change, whereas
> CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> used to probe for the flag because cc-option invokes Clang with -Werror
> but without -fprofile-sample-use, causing Clang to fail the probe with
> -Werror,-Wunused-command-line-argument.
>
> RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> SampleProfileUseProfi remains false by default in the LLVM backend and
> is only enabled by the Clang driver.
>
> Cc: stable@vger.kernel.org
> Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> Suggested-by: Rong Xu <xur@google.com>
> Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef=
25522aa17c2a71003 [1]
> Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMAoW=
h-dqLHii3Nig@mail.gmail.com [2]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  scripts/Makefile.autofdo | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..8754b60ad2ab 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,6 +13,7 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno-s=
ample-profile-use-profi)
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PR=
OFILE) -Zfunction-sections=3Dy
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
>  endif
> --
> 2.56.0.455.g6c5a503b38-goog
>

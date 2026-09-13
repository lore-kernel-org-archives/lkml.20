Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B837DAB3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789293494; cv=pass; b=mFZgE9I3q8V+RJ3fmwn74EmUR9DIpGxay1X/0pijLLbReZBTwMqQcORpGaJE0fo9aEQL3GHP06pWvTEHDiuJvfFx4y3ur4m57DZHlM4dOs3spcVVv66MGrbqYKvZB69qXA0M7XM9ZKrAWsLOggOMVVF9pHvAVPYcwxuBgFqdXVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789293494; c=relaxed/simple;
	bh=Z1UxZxGr9l++OMmSedOseueRC248vVuXVNhuqebXfaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q09XtJYCfNYmv5yxqRmXMe6pkjzEruI1L3uagmJXUnF3M0rJfp4Orz6vqt1/fqG/S5hOj2sBE4sMY0sbUruWMxnklC61ebQfMMjGV6isAmeUk8g15JkmqtJ1HMBI4btfQUrCSFBtnE+TWHKcP4PA+lzrcPecXgy1qIDMhtifcAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsrtQlxZ; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsrtQlxZ"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-671061b015eso2259906d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789293492; cv=none;
        d=google.com; s=arc-20260327;
        b=FTbnEl9VfbS428kAUD9v/DT+8lzr4zvwpqSCY6W5gXZJ3ZPsBEH/waWKKXhkHs7GA8
         XQ79WPWpO4QmV8xznAW+XAgHl1vvS5blxDWA20Oe1N9Lz7Cr9LrtpjRVOUPVYnGtG3N9
         jylTiNwVuObtntriFHMpWNZohfr4SfIHulWcrM3lSzhdxrthJAyDVKHHVTmUPiJ3iKMi
         EGYDUZNaAbTeW8Fv8yyNarGcybDNCver+3MZlKq3NZnTBfsEHHIiS56JulL6f0HBUR5q
         p/2hmRqq/ehQyQ6zGSHMz9pjGJYt/0rQcffQ3duaCFx4IHGVPqt+0cUTSjvAB4cQauIi
         ptxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t/fCaWgN5LecoczEsl0ebG8re6KS/OVMTOW68zTUUHA=;
        fh=Uj/rW1oZUUTX/k+1FZT5a0YmGiMGkd+JY360rBGg+vU=;
        b=EiBCzhQoX1cDuOid9Zp+QBz/AHjqL2IQVI31YXkTEOJODjET+N4QJ+iBJCBrj9jH0z
         ZagESMp0kki/nzwSHCKgr1HUi/EZXwNcCbmWNZfU2vFhPElhFLNsOyUJGdl6pWr+FgN4
         T6pqVaKD5C4x+MmQR+nHkMDp5jM36pNxnrcKC8Emsw7NxK1xvDYdGGVppfpNHrYqQN03
         YPdjsEH1elz9GXYj18f9RsULoyi6Zc81/Q7W+AZpomfeaRMCfnmrz8x+ITWmjy/jTdun
         WIK4jId2Py3RjTU/cbKWRP44og7t4iRhH7EOc0fe/ePuvjTRD2HX/JmyPC3WAC9NHJ2d
         nLzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789293492; x=1789898292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/fCaWgN5LecoczEsl0ebG8re6KS/OVMTOW68zTUUHA=;
        b=ZsrtQlxZJrTBszCgZZT/XK5b0kwScm8ahfUq4vZTiUn9BlHQDCnxFGEx4f8LggO1HX
         ufsYSXIw/j3Cj4jUi21hNgNPnk7m4OA30S9W8GdGw63TCcqaIAFgWGlhsO7xEHwsnmhB
         RGUGBKf+O0TSltbG20bvfeX3azitC23MduHPGSuMrAtvnIvEixQ/YFb9KoxlIAAB7fNg
         LQqEkTAhzULrIz1eiCaGhBWbtN8/YoNQAqrvtW1TEonGxtiH+8ZWRvJ1nseTtkZFevcX
         dLKbUyDaFKfPAYx/s3NcKW5aNQJC3qwt6/NLCIqXj/9W9l0lBwMiVugIiWr/Dc4P3wpn
         KhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789293492; x=1789898292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/fCaWgN5LecoczEsl0ebG8re6KS/OVMTOW68zTUUHA=;
        b=sfBFzSTmBmogmWKmGi8m7D91SAzRQ+GiJkhyg7Cn8N+ZBBaZKFcnV8mu/NhZeYRLC+
         2k+CEcdVr5ZEswYcUu09OfCrxRdRYncI6hUZIwhmR9o9JSQtCaFObDQ0a2ozX63M/0Ie
         M/ift7KMlL6Kp2/VJG0B2eBeVgu9BJl+zdKOct/HOC38hAx7avAItuGnJEvAC6wJ8p5C
         r8sHh9D/Opnw3urU9xVSDrcYmKfCKgFOX19X7M9NBW3l0d0mXeH2mrcdKRIBMaEPF4rI
         5O33ygmZH4vSggojj6f5AyHWdZ5e0ifZSGKNwjwrTruLBW8F68ijeiAjuubPHnN8mnu2
         qA/A==
X-Forwarded-Encrypted: i=1; AKwUvBxb3BZwzCyk/jDZM/fehSIU8/wUm851gYhuONmSU7R1CFaip5C40YtKBAeo4KStUjHzwKBn6ijZhARtifk=@vger.kernel.org
X-Gm-Message-State: AFuF++lgY2B41ZO01TQ5sVSAadtxJZwy8yE07XfbxWZTzxF7naaOIHP5
	VlqeVt4GAiU27INVvKsx2noSK62XlRfEWJ2JD3Xdm2YIGHGj0cxE8HQOisP0BKliKa6hwLBlxK4
	z3E8cBhihWw1DbicsTPunyWXXrGoSLHI=
X-Gm-Gg: AYBFou0zo/LCQUR9NrzxwqjM3NGx5N0V0oK9qWMBg8yuow/Z+NXH1gc/Q86wSnpfQ9O
	kIQiNa/s5/iWdPlGZfReuSjlMWUT64B76O4Y9TgGgTQ+VMCuaoWZ4yCO8ZUriBZpjR1OX1dZMEX
	wo+gD2KhqKlDN97nCgx+tm71QGfBeiTa+owi290RJqaapU7P6aMXtKczznZeSSRmfr1yQ95PHbP
	p2okfUVVlOfqs2O64uMLjagrpsrrghlLZ5/t8nsesrznfj/P6/60jv1e2kN5zD0sdz9s0sWhcf5
	ugyLfO5/4q33fBGLPu2+uJzvnB/Ov1BW//P28LrI120TluMPk0NTgRWkD4Clmv0edR27+DmvYam
	H49zICbgzs4+PGbMB3AjbvI9Zwg5W+TYDtxuO4clS
X-Received: by 2002:a05:690e:1506:b0:66e:5fdb:98d with SMTP id
 956f58d0204a3-671246c1606mr3543486d50.50.1789293491753; Sun, 13 Sep 2026
 02:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 13 Sep 2026 11:57:59 +0200
X-Gm-Features: AcwNN1UjOH515ZFAs0rqo3W477-VlkGQGDTh2_Zpt2YFJYsWJyBQLc1fwY1eGXI
Message-ID: <CA+=Fv5TXRbYARxnaKqEeCpC3OVFNAjBGNRZ_2FA+2g2s8OV=eA@mail.gmail.com>
Subject: Re: [PATCH 0/3] alpha: self-extracting compressed kernel images
To: Matt Turner <mattst88@gmail.com>
Cc: Lasse Collin <lasse.collin@tukaani.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 12, 2026 at 9:55=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Alpha is the last architecture whose boot loader decompresses the kernel
> itself: aboot carries its own inflate code, so vmlinux.gz has always
> been plain gzip, and adding a compression format meant writing a
> decompressor for aboot as well as for the kernel.
>
> Build a self-extracting image instead, a small ELF stub with the
> compressed vmlinux linked in, which aboot loads and enters like any
> other kernel. The compression format then becomes an ordinary kernel
> Kconfig choice, and all seven formats become available: xz gives the
> smallest image, 5547496 bytes against 7677280 for the equivalent gzip
> one. The build now emits arch/alpha/boot/vmlinuz, since the image is no
> longer gzip data.
>
> The SRM netboot path (bootpz.c) has its own boot protocol and keeps
> using gzip.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>


Nice series! I've done some testing during the weekend and it all looks
good to me, thanks for doing this.

Regards

Magnus


> ---
> Matt Turner (3):
>       xz: add arch-specific tuning for alpha
>       alpha: add self-extracting compressed kernel boot stub
>       alpha: support the remaining kernel compression formats
>
>  arch/alpha/Kconfig                       |   7 ++
>  arch/alpha/Makefile                      |   6 +-
>  arch/alpha/boot/.gitignore               |   2 +
>  arch/alpha/boot/Makefile                 |  16 ++-
>  arch/alpha/boot/compressed/.gitignore    |   3 +
>  arch/alpha/boot/compressed/Makefile      |  63 ++++++++++
>  arch/alpha/boot/compressed/head.S        |  36 ++++++
>  arch/alpha/boot/compressed/misc.c        | 209 +++++++++++++++++++++++++=
++++++
>  arch/alpha/boot/compressed/trampoline.S  |  46 +++++++
>  arch/alpha/boot/compressed/vmlinux.lds.S |  83 ++++++++++++
>  arch/alpha/boot/compressed/vmlinux.scr   |  10 ++
>  scripts/xz_wrap.sh                       |   5 +
>  12 files changed, 478 insertions(+), 8 deletions(-)
> ---
> base-commit: 4407825b2f96b0e48a4bd08ab196b50a30eb3aef
> change-id: 20260912-alpha-kernel-compression-2043f806fb75
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>

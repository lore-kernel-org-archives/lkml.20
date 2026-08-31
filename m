Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4863C0A03
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167189; cv=none; b=X1JzfWGRdBUWE7Q5cebZh7jgqcUI/3QFoD3jOyMV6hNHpG+2YtuD5f8ln1rIhl38clX+8GKZT/ItIrOZ23de3ld5P1Gy/+IHpHTxIOOCnEUR5MjgpFs9NMRoms5OaRwDW3o2sJWX4UV34W4h5/5FOA52SatkQHgj5jw40kbBgbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167189; c=relaxed/simple;
	bh=tKqWAnX/XUlT7Y31NfwqWk6fb2LHwCqlwTIBGzmaINU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKxTZ2ecAsHIbURbnWLyAUmVEP3Hc7iKVC1NPLCX6f89O3KCk1reX6PBLIa1xlN8/4ss2OGBEKER3pj2eD5srTi5zEuYcJF4crWxCHxqayJ5q4/4nGFw3ijmSmIHTx4ZH+7OlfRlk/auzwcHhTK9giHo5RMJHZMcuRv2T+cHWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V1w0EbcQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V1w0EbcQ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d9201076b3so8406865ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788167188; x=1788771988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=;
        b=V1w0EbcQI3P5dxWkuhdk4EFIaQJk9qHy5Y063GsWY3dbol0e6l7Ab7qU4kqxSRPkvO
         ajRFaVSp7YVodSoyMKFqtELqZAJDJc1Zl5sFUV0QdxC1jV6qfQBIsu4TDSSXrWOL9ykn
         fGzib09FTDxVvIBR9O3GaIxpxv46BfWeEQ8gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167188; x=1788771988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=;
        b=JJ4b3FlOzrHvK65lUqEJTgmVnUkGBlCers3WaViDwqIiQWzMdUVph5TcgLpSX82tE+
         N7udTacomX8unXrM4Imwpi0HfnJnDc/jr0NINDcrIiV7yT/NGeTUmwszN+6XGBf6QTOd
         Go1kRvVDv6jJkzMKPpZHP8IakulrUnZCaXfzWX+hExxvV/YtX2xAnFWJz+NKWfDYZ6BF
         7RzaVCpf6a1oYdUpuKx0DCgVzu5dpVoHT3CMtkB2XOAiyCwwILhfJmGlZXuin58U7yUv
         LIDje2XjUJDFoddjEhABSHeQTpmp3HmORy9FXZMtCOqLCl3AaNNMRybHsMxQEvZjyKQW
         dGyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaGtNKZ1Z7iILXA/+SPX3TmyGbqWb2XaMmwktUlIT8vNuUTDoO87EgbovrGQhH+7lhT+YWIUlF9etE65U=@vger.kernel.org
X-Gm-Message-State: AFuF++mf/ObxIRs9BbeExAcZvzyLdw/cBr8xqU96BFclLRzM1eDBhH7j
	ivSFKjS6GkYL6pZkDUcYz6YMr5F/oIP0LdEE4jcVJI6Bqopsp3hdWMN8eZ6VwQDbyAgYS2sNXDz
	zPvKgkaVP
X-Gm-Gg: AR+sD13sYeJ1f5C6IPQHeu/TvGslDf8ATa7XSBV8TjnKgF7DhF5/nmxjfA6b2LrCQ6z
	R/CL60CI9QE/xyJoxX1GHc/hB7UL5VJt3L/B3QJ6Ka53FQjVMumL7zLacc3D8aA9KPrsDHJ9q71
	zOXhOzvd22TBA3EtJJqfYnbPiCYyiqPytsji1oxh+tEULnt7KRCXEDJ876eE1kdJPppbW0PExqX
	hY3UMP2TsDTuxPoeSYPW/7tJ6+tH6cDDFzR6qyPH4Xqf7uvp26uXi7Q7Fy5ojUDrGUuxzHnoQ73
	jb/mNgGIwwnS9K3yk1nHhzYRcghdo87LIPS4PDJ9ZaebNG8H6kyAN9oG05AmZFEAti0am1aPGZy
	Q5UzktrNdv305LH841Bj8/uzgAmZBYTAuBVD9SwPLvthk6xDsAjRRlqntAAx2tQj75Kf+Y1T1Vl
	X+IKN6+5HGZMw9rlHS/ruFgEPL4cAi0RLwrqfZfh9dBaElzeQnMPMKKhIBwYjHZ6+sBQnVdNO3+
	tK62ewiY4SaqgjrUOOZS8s+ls/z2WqJYbVy
X-Received: by 2002:a17:903:24f:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d74df5fa9dmr377273175ad.10.1788167187455;
        Mon, 31 Aug 2026 02:06:27 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fc0b3sm32471065ad.16.2026.08.31.02.06.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:06:27 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3870596a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsQu/03SVDTsrHUJ6mC0pw5NYCM4M6KwdzAcQuXG83nwGaRvnioiGesk7aaRNDW8hUg/PbqdeL1+ciEiQ=@vger.kernel.org
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id
 98e67ed59e1d1-396d0d7b94bmr39842739a91.4.1788167185477; Mon, 31 Aug 2026
 02:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org> <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
In-Reply-To: <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:06:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCsaQGe9cHCF=oYpWDHm8yP-S5qBnxP43k9YkWmW-iSH7g@mail.gmail.com>
X-Gm-Features: AcwNN1XQTqww76phd4AsllCU6mg1cRdglEfcZzeuamdPB_miugwlSSd3Y9nMY_k
Message-ID: <CANiDSCsaQGe9cHCF=oYpWDHm8yP-S5qBnxP43k9YkWmW-iSH7g@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu

On Mon, 31 Aug 2026 at 11:03, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Mon, Aug 31, 2026 at 4:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
> > adding a depend on OF, the following warning is triggered:
> >
> > WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
> >   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
> >   Selected by [y]:
> >   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIA=
TEK || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]
>
> I guess this happens on COMPILE_TEST=3Dy with !OF architectures.

It was triggered by media-ci.
https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/17368=
35/test_report?job_name=3Dconfigs

A way to repro is:
make allyesconfig
scripts/config -d OF
make olddefconfig

>
> > This patch explicitly adds a dependency on OF to solve this issue.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks!



--=20
Ricardo Ribalda

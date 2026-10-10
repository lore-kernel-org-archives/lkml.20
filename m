Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD1527AC57
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791672284; cv=pass; b=W1nj9jXaWCvtdrItoQj5KMT7ze7fUaVg/+QXSkMvkwNhrmj+fO0kQoWlLQOzkufUiNDfYmdCXPOpk2ubayqRAmDmCoVBZc/zciFJuqeQ5TSjniUJntNXQJn+FkoN2q+j2kVbgNazg+8tQJzkUWm3svAQZYnprtwwWLMyGeuHQlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791672284; c=relaxed/simple;
	bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBJhTxAnCWPhbIwiXFVEl4zH6qR+05EzjtwDZBRaPXSOnwxrr/uc0aPV1i8+qF1p8w0kiKraliX+Dlz3kwyUlGlDVXW1cn8Twc8xONdxrtzUKxixM3pod734pABrB+2znA7qh8yo1mnuSA83jJFLlmU6KGcxgJJDcciwzGMDSKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=orC6hd/n; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="orC6hd/n"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677d35fd168so547596d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791672282; cv=none;
        d=google.com; s=arc-20260327;
        b=A5Akn/v6aGRNCqoKiaoQKdssQhAQnUhfglQNJonWIn1UmTYVcBPlqbYtcThlvRIrcp
         i6o+UowwctaqeFFqwoK/6qHojJUImVlehZkscE1wYuzIDCLN8LiqqVHUzClhxThSB22f
         GJ/I9LQcHZq6839qsODSwdwStnfelhjOCy/6jXayQm6xxhutot9YJ4eKKh5bFMrtT6q2
         O/9F9SRVEh4INNKwQPByUR4MEiyvkyPF1qBXl1R3bZu1tsvAXnYPdHRGFqZoNqWNVvvH
         lAQHTTs6CKjTqmnjzDORb/0kBMnMdtUhSdPBFJSKqrSjaMbmBPgoq+c3TJGYEq8uX0X5
         HM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        fh=Qa2km+TLVQYWknwy9BCOFQmr4FPyO6bT9kExgrPpXZw=;
        b=mnh7vw7n6nJC7CZ3OZDPxa/FRMNF4DQUAtQEfRt8uEJluLYjpLRJGyHjuEWMuC75xz
         mCDpCjQJ3QIMxIy08wOYkC5WEtK/VhTEabLnUKJ9qc6muVCDFKWZpwSFNAQAAUo+BqgP
         GO4pXWbZUAp5++9eYhMopMM2k56tazuZNADabPEK+7TE6akIZgO4O7Vzj8IHT8kLY3Dy
         O5cMODR9TRKOU5k9jV/Y+MsYt90nVQ2Xc/7zEVK1s+pIjP9xLfN9EpXlyeckCSxF+IPO
         LsoBxdc3CC5RW1HeLAP8x2kWfyt71FYTt+UOOB4HOqX17KhRGfHJO8FR4U06N2nfpP1r
         O2PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791672282; x=1792277082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        b=orC6hd/nqS3GlfFeRahgR4tSWZeP905pr156f3/tFtfaKbl0jS6+lItsqxThbcq096
         ChC73FrIB3oD+KHaCgeLn3/1PZDzDDF71+P/qQumLixmjbGCIPFzZnSv9OTBLFxfJT+o
         siWTPyPBL8N5g2LBV9YcFoJlJVkEPL8rTK+XImxGgSrhlcZWp5a4qhJpcz9xdub6akx4
         tl3mStc4+3v4tTJe2YVh/M1iD1Tgtk90b79CHlCg6WKceQWo43UR7SilxTV7TuUj/8Cg
         6UtHm9VRiovZs3XmSGnFO6/AJ+XTdqryymB+SUkI9Af0Pay55hj1J6QzM+jua49vCE8q
         tzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791672282; x=1792277082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        b=b9dG/W4zTPGm6VPC0Iz96kFL374/E3VFqTyu96O0hkfN2lM4pRu0X1ENEXnGGkUTiK
         MopNj0KKC8IVpwT7806B+pINIJ6i3H0CdmpiTDmIDTylSZiLf0886myYc6hkN10hif4P
         EXIFavDElj6+1AFfT9qqlL8WORbriDttcRVnwHdQCtrdgC+TUlCvuAsCRRYiAg8qiUkk
         uuRRj3S8sh8/lACgy6iCG1ir6RYnsSCMrPWlhGtb2r8EwGHGTxkTrtBw3uqOUMuYBUMB
         5km3iajTNv0o0RElatidCnPS30XVq4JJ0eQPVjlYax38wveCjjbw0D7b/qg603EeDq8U
         QtOw==
X-Forwarded-Encrypted: i=1; AKwUvBzI1RYUkElqzmPE26HEOavGgIHCHI8qGDeup+7k5cNEsWkHWBBcKHEhgyIM/XpS0ZsPE14zIM6LTrmD5Ks=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa3iUzTBlHGQFh2aJ9dNKjXgnLVkjMyaaprV2Cuggmg3eWuTgk
	HfCeig5+h3ZMhJb9eTmK8JnQzlX+zftR7OOgQD00037HilSXVD+Wct5RbEVbvwxr4BoAsTfjsTU
	Np1zAmpsC727W8vNpLX2FpbcsEfuIkug=
X-Gm-Gg: AYBFou0mdvD9itEeqTwCdob02jCjaVr2IyLAgd7ep6xYfViVH0KMaWOxpvCH5gOIcfU
	IA/9DBcJdes59h491FGNJKEd5iR4BH/DoXk5VeBrNWDP8hKKAX5rtv+KGcWHtGF4QdsYC7yz3fm
	IBuydE0Va9xcM3HNmgQoigkm1YhqM3WDXUz4b6+QPR5Bt2T/2uLCvgyE8TIit7GQCHA2kI+5hzs
	MWT9f8MmqGI34g94cY2rfAwUh14Zo4SKCsVOQKXgrYr/937L9SpPmLQE297jLYubUPnvIqguZea
	9PzVYE7KbuQ9KNijX911fAxs/Tm1HQOJAQTLSp7VbgPMXfkKyB1y4wU2gSz7083HBVEGGOpPzZ6
	i/uxIY44UomzA
X-Received: by 2002:a05:690e:4144:b0:676:8c58:c607 with SMTP id
 956f58d0204a3-6793606970emr2386943d50.27.1791672281835; Sat, 10 Oct 2026
 15:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:44:31 +0200
X-Gm-Features: AclHuK9SzxfYbidbXHkCFy5EESOculWVRi3ikF-IkFS2nFcOSocjCQZtavNl1aY
Message-ID: <CAFBinCDtwrEpLY7W-VKn=ekCPbwAeq63nDX9y-nuV_TviHFJAA@mail.gmail.com>
Subject: Re: [PATCH v2 02/20] drm/connector: Drop early state allocation for
 max bpc registration
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, dragon@radxa.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 5:17=E2=80=AFAM Xilin Wu <sophon@radxa.com> wrote:
>
> The max bpc property can now be attached before connector state exists,
> and the atomic state helper restores its default when creating state.
> Remove the early state allocation that was only needed to satisfy the
> old property attachment requirement in the HDMI connector helper, Meson
> and DW HDMI.
>
> Update the HDMI connector tests to check bit-depth defaults after the
> normal mode configuration reset, and check that property registration
> itself no longer allocates state.
>
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

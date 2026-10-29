Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272077;
	b=K8pyKeBVyx3IT5kJ5n+UaDJpPecFEeYQRTSqFduKNFdsIBDzN2GsleQVA1BrMeDNSRPA
	 Iva5UBVe25AKYQVJrDy8C9AXvk0Y1e8Jf3/QpBq4HSF8YMnIHd2c+rOb5APCKtrGzNdfd
	 B/ZEou9ctUkRqvPR8mWdE/TSV1b1x32be1yYlmnSoTBlPgxcLDQsCpnQfZiNgVt9vNFqL
	 CGAEk4Z/YgPZJjow8qJgc+Yo77f7Mkd1d0hHEpa0PL0atFfnX8e0MLFOyXiOwvMuWp9IN
	 VdEvO9pFbLzkh86PyLVjlQ4Jji3fWkiMm3vPkFcIB99pa/a6ZW8UjvECdx/7NZ4XSaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zpV8BOzWQIVCU32MdQbmtk3u7cepQKA+eLljtF6aqaE=;
	b=NF3BQ8FW024ZWxyxVeDb7KZVwpcieKNkedZUp31s8C3x3uLMW7IGYWZ0E6J4jIXeGRhQ
	 v0eVWo+B/uT2tiBc79QPu1cmM3HNgVDtnofFz8kYOoe0GITt0zDcylaKJFhHGfEW4rz40
	 JkDeH2nLgu/jiDHwpCy6AnG+JcKyouc0U9KtfA3wKULFovrD3Wcrrm8o+Lgo5xXR4cUy7
	 Tc0Nfq2CgiLUaWbnt2AJfNqvnMzavxmmZMBLEu5yeJGCU5p9EKWJQ9LPkxHbS41xY79jg
	 3J1Bs3LxdfKJiEmUsL3sg/vZm9eD/S7IY5JBAYeO3QmS2verrobflUrT1j+GQzJvC4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E1Q1RHj3;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3DF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C3DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E1Q1RHj3
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1046429f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793272074; x=1793876874; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zpV8BOzWQIVCU32MdQbmtk3u7cepQKA+eLljtF6aqaE=;
        b=E1Q1RHj3t5v0HrC4dd2WgBqjwVwEKuAhl7I5qZymdDVoR8p+f98yW5maZuoIVnVImy
         IR0t3B45iUfeuQclRiiN1E22Vc86Yw/0C5gpuxbYqYqKfoL7DhjtyKKh8Q0slaML1O3U
         k2nNV0TWnZOartvvt8SjO99Iq5cs+1tUecBdeMfW/xVVQvxToakPusly97WoMCjB7L7o
         F+M31VmRDf7F2JeGoztcX0TPoKt3h5a5A2ZAeFrkjicealN9q3rJU4Ncn2HDdLRleAGL
         OGMrfAjV5tJgDTtJmmiqMsGoEFU1rAU0jABF6+CgPMa7IqvRYt3CU7vqisGLNjDNDEXo
         7iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272074; x=1793876874;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpV8BOzWQIVCU32MdQbmtk3u7cepQKA+eLljtF6aqaE=;
        b=zLUltcEuQVQ6PRKxZaSdgRc4uzgR6wBQomkRR1G3q3SghhGf3iNQuHEq49KF0HLpID
         mc5adlYd4RbR4I6mV9JLOsq08ItnwxvNaNFgIjCppYQ8iWFbXtLBvjqyHvchFmX1DZxR
         3JAeBmM1LVTikvpkERTdf5XoDTUG9yF8MafV0XtzZ4q5jYhbEtDmczYC7iDgKQ8S2vWz
         uzDnnVTW0fjSFyUpteom9PKZxCCW/YiOIJL0ZKYofEEEzJocwzBia5iEUehvFnDA6ljp
         BSpsZyUE4kTgfHIm5uN2kBaE9DGFH+Hy6OUAt0rndYkmLDctVJYzZjhJ5xLRaADHAVD5
         LsIA==
X-Forwarded-Encrypted: i=1; AKwUvBwb4d+fNlyEJE9a6W9/dPwu89UJIlPyRvBNhwkGBnlNSSczTlmkuZdeEKrUSrZzcXecuazUEliDG9Ioi9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJilIqiE0FTi+GY/IPSTeLHvUKkp57uHp0efNvSD7jsrMgEWdDu
	1gwxVaIdlpKV9NOz9VS7PQ5ic8tLGDXiJBrrNn6tqvB9WpuDaTnu4DwJMR5cCgAZHR4=
X-Gm-Gg: AYBFou2Z6WH3kjS1jZBXS8oJEW31UPrVSZ+I6hR1KoGMafJS04ENhibD+OoR98FSKXG
	evGfmnY5taqhYCySGRf3CrTVOENIiTFnlUAvmu/z+YeFjUxtGS1Tso2zA75xcfI2d2Od/0w0vWD
	hQVqzX6ROwC7eqTd2kal1Jpg8GSbeu9OOiGFYS3iIIQQV0xE8e5oZYX0QCI5mKanSV4Bq1kCS77
	XKrobAG/FHlZwaAzCZ3XnEzQ3QFrllMYrYMCODQc7Crzblg/wNmOTsmfJESE+BlDj3H/RIOUl+H
	7uIHK/WvfkteKEQQbud7sL9Ew86s92pKfMtXVHORb9KZoyQIN+aUuZw+NBs6ChQbxVcdmiv6wX8
	rjtuYL1IvXkJfjwRYmBWG3su7KiEdOJZd2GHqgSDb7OC5cDPyD/DtaIhn8LIPOw84TUXVhsvwNs
	KujaH+WqAjPSW8TCBNk7LGzB0Kow/PSpK3/0+tGR17tga0z3LDO/omBNVjduVMdmu2LmrP+nqXy
	Y8APeh7Bq550piAqVjEgnoqBS1ihIwYRKh9I8E1mV4WQDwtp+jZocTEya5zJfHZ0YxGx4d2u/7c
	1rbRJZSZRCwVan0hraPZLJtBF2QokQirp6JfwJuqJSzxCIdl
X-Received: by 2002:a05:6000:4308:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e5d5d2236mr12412698f8f.54.1793272073992;
        Thu, 29 Oct 2026 04:07:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm33268688f8f.42.2026.10.29.04.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:07:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] clk: meson: add the missing HDMI divider /4 alias
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
 <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
Date: Thu, 29 Oct 2026 12:07:46 +0100
Message-Id: <179327206664.1865333.17830809789470255011.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4F+x0mrkRCPBzUwfIYOdv4hLerpsS1UqxVbKSxM7h1U=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPNTnULtr1sD2x1TcLbJ/GWLeN7YqGAJtxb777L4/Ov
 vuGuW87SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMBHnD4wMXbJWG3ZvXC29x8C+
 7mFf0TlH34MzVNe8Fv616pd6ZZj2RkaGh8sWl4hsXrPjhRvHxGi+1Kgzid8VAmrqlSMl/v0r433
 NAQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> On GXL and G12A, HDMI PLL divider values 2 and 3 both select /4, but
> only value 2 is listed in the tables. Reading value 3 therefore gives
> an unknown divisor and an incorrect clock rate.
> 
> Add value 3 to both tables. This also avoids a division by zero when
> the read-only rate-rounding helper uses the value read from hardware.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 3 ++-
>  drivers/clk/meson/gxbb.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d0d4c7b6dc82..b23b9514fa91 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
>  
>  /*
>   * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
> - * A divider value of 3 should map to /8 but instead map /4 so ignore it.
> + * Divider values 2 and 3 both select /4.
>   */
>  static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
>  	{ .val = 0, .div = 1 },
>  	{ .val = 1, .div = 2 },
>  	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 4 },
>  	{ /* sentinel */ }
>  };
>  
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 7a7b104182ff..8cb6404c0efd 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
>  
>  /*
>   * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
> - * A divider value of 3 should map to /8 but instead map /4 so ignore it.
> + * Divider values 2 and 3 both select /4.
>   */
>  static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
>  	{ .val = 0, .div = 1 },
>  	{ .val = 1, .div = 2 },
>  	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 4 },
>  	{ /* sentinel */ }
>  };
>  

Could you split the 2 changes so you can add an approriate fixes tag
on them ?

A part from this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


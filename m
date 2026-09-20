Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248124825DD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933187; cv=none; b=lcifvXHpKZ8A64ybhgmO+VnT4X1nJCFKYal/6bnGSuBUnFImEoFQ4/b1XiFVEIgzqbJOgV47QgytDDgigGm6EEtGm2hsQ4LIwYbAiLWr7TNER74ADbrP2/zmmGBQrR1rQeLYmS9XqZAGVvPKlhQ9motC8sDR+DMERyIEsZ7pmVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933187; c=relaxed/simple;
	bh=BFGYGg6hFd6brXc8be9Lc+zgUDV/5uBkffDvcSv8+Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0AQwq5Fmhi8vUrdn5bBVRBvoM7V30mTLx63e3Q+prHeDauvm3IZ+h0DK9GpmLWtQ8cwgiyx51nVq7reDoe/1qeb/O9A/706uJrS8n6xNHZbGKmEQpJLp92Pbm8Y7VbyzFlnZLBlWeW0QlYCX4/XbNEjkxcYFf3qUOTt7ReEtkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UpoFBPzf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UpoFBPzf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso16530565e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789933183; x=1790537983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rF0vHV+0AKSYzey1/84t/+UqW00wC12/mV03L9JGZxk=;
        b=UpoFBPzfbKfC+4D8uflO29K6XHkW8qdKbdmVDw1tYoj/eKVt3nHP1MzSXaY6ZUoCSd
         p7hnNsIT0zNI93b4eLYUjHEF5kj5qiFRMHoCEJ0RctULJQGIayodEkpeVDguNPIemR0F
         4a9/J0UHrJJ1SBRjff6BwtlzH9/TNGQQzYo8BACplxYsL16n6FTodRlhOfj6T5kX0QGR
         HO1EDuCwCngljo+Cg7FOgqJ10xVvo/rTSmAkZL+Top0iJsN5CvBonZJEI0PHxHaJ1/0y
         Amw8ZCKeN5OgC3V7TQ1LLNL+gFdjpLFNtKDlEI+/6Y1LYACCGO6hUQI0RYL9fQTOt3YW
         5CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933183; x=1790537983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rF0vHV+0AKSYzey1/84t/+UqW00wC12/mV03L9JGZxk=;
        b=Na3XWTT9YROB5xfDhiSA+fSEOVO3aAAxAyAWiBImoObuDAp/yXwa4XGN0PGekhIXSG
         47XTrKPHpuJKJMlAnN65MvsD0d9o8Skm2bNUWiXULoObQTVjmQgqFi12AGul5kOER/xS
         FE3vTbsvSaP8kyTcyekj/GAAAeNdL63+enGK0jH8qoyF3edbVYo/7jOHY4AHrheLBDuV
         2xzbLKz4QzFIteiA+6OO5Loo0viLjxLHi8l4Yol2oUvpyWK2Z/8TKufSFuB5XrkNDWeA
         l0c/WUJYs0Ll3BgtFGXIzuhLXCd3X1FfvQMgMgrHqRkQSSKhj5juX5zB541iigt830mT
         NdQw==
X-Forwarded-Encrypted: i=1; AKwUvBztUZ/QvED71ckT2v3oAx6DfbU1DWYa196CyVz0P83iUxrfLj86irJvpRGGEFnTjy9cGm851ybx26un+CI=@vger.kernel.org
X-Gm-Message-State: AFuF++kUE1Ns0bOyfmyHnCPJuNGJ80cCqw2kvg9M9pYZ2thftnp4OsCE
	bJHJCX/pKwxBucIWQUIQpoY+hE9zKMIposmV06bM862Dh9Rnpvn1erhUMBXHs4Y0+bM=
X-Gm-Gg: AYBFou1Flrqr/0RHMHBCWZPS/SlnEu5maHlwojKOscy4jiO1aIHwmY7dbYqRladEhJO
	fPr7QM2p8E9fPDM6sb+mUKKUFAvkj2En7KfzhgGyyfYT6EPVUmIJcM2b65nO3TAtJOetAPGkUFE
	8i4uw23Mfpj6/Nbo8Vt5Zfl03xO5hXzOQuw7U6KaO8U3mqhTzGRCYGv3BwSQ4cNhlnRz+IGLxJu
	rTN11EOLUE1xjTAxdBfixB0fZXV3iwtQMOt8/ezVDAKLITPRml5DK+SBTVEFam8jEBjKM/OhO/t
	U4rT9PsN22G7CsevNnLucjgK6UBtAqhLkbj2+2noUH+AtAgoU+ChfhiHmX+VbVvWjueZDA5EvZ7
	YuJxTfPVmX0JFGUiiQlKf6ilNK+rpNQK0bAcq924nd5kW6Kyv5R24iYAXySaxdiYqL2lF6d42Tq
	wolIpDsRd9Zb9NQJwwmcFJcEANFqekYu9ngyfecOmbs2aBagqVwnTIsL5MFciwcglTaz+IFnQuc
	SA=
X-Received: by 2002:a05:600c:3e19:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-49fc572f27fmr119630965e9.21.1789933183359;
        Sun, 20 Sep 2026 12:39:43 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd0ece6esm234353675e9.2.2026.09.20.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:41 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:39:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, kees@kernel.org, 
	gustavoars@kernel.org, p.zabel@pengutronix.de, daniel@riscstar.com, 
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
Message-ID: <arA1svdQzaj3VanR@monoceros>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tk4w7pucaicwka36"
Content-Disposition: inline
In-Reply-To: <20260918165234.687224-4-elder@riscstar.com>


--tk4w7pucaicwka36
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
MIME-Version: 1.0

Hello Alex,

On Fri, Sep 18, 2026 at 11:52:32AM -0500, Alex Elder wrote:
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>

Please rely on linux/platform_device.h to provide of_device_id and drop
including <linux/mod_devicetable.h>. (If you want to go full iwyu,
include <linux/device-id/of.h> instead.)

> +static const struct of_device_id tc9564_clk_ids[] = {
> +	{ .compatible = "toshiba,tc9564-clock" },
> +	{ },
> +};

Drop the trailing comma after the list terminator please.

Best regards
Uwe

--tk4w7pucaicwka36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqwNngACgkQj4D7WH0S
/k6pNwf+Lem5dcJHNqZeQwO1vn2EY3m9bTRWfD8WbvhlPJ79o5a3UXt/dBcaMHqJ
RquJw/Iwe5AOARXNI2za1AWXKNpjbTyEXg0PG0/xV0FiyYXR+lz33BXvcKDWPl2S
0SilXiIV0VuCARwFkjcibTk4qZaP5tvRg/cD2nsoiDmMdl/2EbQpD5KqEVu1+v/b
ZPj9we1Tm9elAc76W5CGrKLynb8dLHe5kI7balWhxGgV94XZhJCKLvK7Laa9ucYc
abBaruwJGES79c9Uz6Fkn4CxZIcnhc5DwXHEzoTkQMMPt1u1L9ZaAxpPojFCv+D6
SBroUn8lSetw56k5hBWYPlyq5qgKAw==
=ddJ0
-----END PGP SIGNATURE-----

--tk4w7pucaicwka36--

Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A18A48D873
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809159; cv=none; b=TcQhkFFbWrdACtSVbdU42v7dVtAlteoqrpSOWoniyDOdIfo9bR0xb8CooQeuLLHYcJyRvo1VoNs8AfhFMdlwFUxsZiOwd64npjUi9ZmUwR+78cDPatfV4mzs2SF7O46+ixWGl+DlIB0lJZPjoajKk4S2rbjzZgkO56FCMmYKHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809159; c=relaxed/simple;
	bh=NbJ9L28kJ9mjXoB/PIvLtPzBb8AeWfedbTzsf0nW3+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibXq5KqyKIB/ReAqL65jEbpAwpk8Q2ILYhHO0Q83c3LPrlyEfIc3aJn20VHtAlRiIwutK5akho3bGgJ9vR9e+ddQSbdvRWxAy0YNvZ5pahsAkiNe9R3TrlyBRcRFmWmMXqAH+NrwjkxYkbzBC5SWTTEk6FUrYa/dqT+CRGuK4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BAP1RS58; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BAP1RS58"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so17302355e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791809154; x=1792413954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+9ooOxds5wG2R5eVlPySU47R2RJzaza0U+MtqZs7Bk=;
        b=BAP1RS58JAz3g4nCg+E4ivbqBpNNxfd8C1Z4kZ4pOnD08u7AuqUg0KaE7CQX3KPIBE
         wbX8/PCuSU3B61G7Jvc+BdBbBicwuF5+VF/4VwikHjQBrIGyqEL/X+8gzAkzSDsfijTa
         3VMA+xm37yzEY7rJ9gEgcRP544Y4Q8ddevW6r+jxvWel0em1knJ9z7M6PyKG7GJHey1A
         KOpTbayf1Pi41gupaxZGzOLI0Vy7DF/eYDB3YgNEwhsFqZNb7EI0t3h46l7qQxebQdOl
         N/XLAb6yEvwASe331Y0XbTVKReoIt4tRWKnmzDl8moB7p0FtC874Q487gEsEIkszAdvx
         NNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809155; x=1792413955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+9ooOxds5wG2R5eVlPySU47R2RJzaza0U+MtqZs7Bk=;
        b=HOHvGzTeuYCEhyZ50UKSj/c8ptmMoEYPvzLs0mJDPmwCgfrnP+0d93tWU0s5nfC7Ox
         siuIaiUhyYz/orG42bpfhrzTJWKIfnK/hPCxW+EbbfXSgqABEMX/4U3984+zEflFO5z1
         5U3VTdcGOIRCJQv6m7dtt3AFPK6YN9TehoUDN7I+N7ke3yv8XUt3dDSxc8HUhKfUglf7
         na+A9psihprfeRxS4iYBV2W6mS5grX+XA2qHi6nWUL4m2fksKDADljmt7ZIhKXVIYiCX
         2gY2y4VMc5ztw+VuIPPVDIaG43wxH3MDRrDA9tE/GLwuLiPghPjWzrEXCy9w2Nl6/SZ1
         APKw==
X-Forwarded-Encrypted: i=1; AKwUvBxhaUu6f+YqrckFYSaTGkPrGgskOPOWnYgNy4usrtc2dshpGMUTXF7uvONVu7zY0q5WJQSSfB71OtXNy1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZSSf/uoBBQCgCIZSI/KeR7Gap903I+Q25Oi1ml2P1Xy2acDz1
	ZYH+eS4yAuY/SXF1WZJAkXIHdwzXR2m/OU7TrFSuOInIWMjyX1760kOYZpbjAUxO6o8=
X-Gm-Gg: AYBFou1X9YEPGRy6JVunjfrfzvp+HWdW2zG3jBBekfoE+fMx7zjpRdp+qoHz40+KgKs
	jM+QH1vWovrvSl4DvBH/Ffs/9Yx9w6L9kmMyHq2Z9RAbTR0B/KC8nCVWSJINJFFe83/b6Rm5LI9
	Eyak3FZJ/DtHWkGQHATJeOU+ho/dvz7gVjPKh6KDXXtx1h20kPpM2sGWgd9urnPcHG5xrmfNcGM
	s5u8CoPYM3X7sOBdJ7g2hUOh7TWCYx9lgq4hQmA6cM0KbUqfHHD20nQ/FTGF1v7kAC7w5Vcjz5P
	uceZGVJY96UTAq+ikICnDfQO9+VrXijRTTUkjtvUwCwB079rL9ZFo27HjePBAtz9uJrAkK/enEB
	rfrMnzEuSWXJ+8EemmydOKnNqwHZs5KUdzeXDJRR0Wwa0Hf8A/VHG09E/vclJlCxeUeAS7q/KLb
	EMIucJE3y2+GDtb3jky9gcfBSRDvywdrhtJFonpbD/L9HN8atmSxRX8j2BQhN0PH2v35KXDIye+
	gwZyfFUqJ/P6kQ8
X-Received: by 2002:a05:600c:4709:b0:4a1:7baa:7303 with SMTP id 5b1f17b1804b1-4a18e4a5237mr183884265e9.7.1791809154496;
        Mon, 12 Oct 2026 05:45:54 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bf214a1sm328835625e9.7.2026.10.12.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:45:53 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:45:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: radu.sabau@analog.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandru Ardelean <alexandru.ardelean@analog.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] iio: imu: Add driver for the ADI ADIS16607
Message-ID: <aszWHiDLbNZIQz3J@monoceros>
References: <20261008-adis16607-v2-0-7c94df80878a@analog.com>
 <20261008-adis16607-v2-3-7c94df80878a@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g5xstlf4pzlgbinc"
Content-Disposition: inline
In-Reply-To: <20261008-adis16607-v2-3-7c94df80878a@analog.com>


--g5xstlf4pzlgbinc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/6] iio: imu: Add driver for the ADI ADIS16607
MIME-Version: 1.0

On Thu, Oct 08, 2026 at 11:31:55AM +0300, Radu Sabau via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>

Please drop this header. <linux/spi/spi.h> already provides the needed
*_device_id structs.

> +static const struct spi_device_id adis16607_id[] = {
> +	{ "adis16607-2", (kernel_ulong_t)&adis16607_2_chip_info },
> +	{ "adis16607-3", (kernel_ulong_t)&adis16607_3_chip_info },

Please use named initializers here (i.e.

	{ .name = "adis16607-2", .driver_data = (kernel_ulong_t)&adis16607_2_chip_info },
	...

)

Best regards
Uwe

--g5xstlf4pzlgbinc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrM1n0ACgkQj4D7WH0S
/k6VnAf/VjtrhhmMZa7FGOkkKojdnt7WiU/lXeT67R5ejp3x3ljxO4gLmQKg0Jc9
XhrzsbZyTmXQtkBRjxwJDBPkRV00PXyi6Ai2WsFyyrXDXEbN5sJC4ozWIPwM3+9C
JUDQzm0qrRBHB2GWPHQpiWaU89Yr4jJImBZKJoABLmv/Pmhkh+P6Iti/kVgvZHsX
v1PTfeFKB79TZT/v7HpvlVe3yHriA+B54heLguUgndQhbf/UQX+R2HXNTwCNYJ59
px3h8SA3Jp2osMUAnbF5NDOZKhVpqV8GOJqeLS/iZyIk0vJiIf4JZxrx2yRcAxXs
sUCtn80B28G93AfXZAOqCHwJxaPpiw==
=HIoq
-----END PGP SIGNATURE-----

--g5xstlf4pzlgbinc--

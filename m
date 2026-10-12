Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340C489892
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809351; cv=none; b=cV1W5aDO0Y5H4R4iSx9bt57jyRdqfziHJkaEu7zO1WTSDhaGVyP0caPq2mzI+5txwuRxIjl3OEUk3OAtDcY6wmIA9v71+dGeI1EDHVPLEj58VZRgG0NZcNUOeMwylTJfyDYoBVkrDPwieN89Gt5uJlZUV04ezS05tdBlVYLO8g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809351; c=relaxed/simple;
	bh=14phVvYRrJPhd267XL2Fy1Y5N819k4Yyec3jG7Q2YLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPhC6l7+iiMGgmLqkC/RXjn8F2t3eP3RY0anQfqI95NffwCITTyZAUxuMWl+7wA8QESYWEkZcnhap4fRmRDh0FI/yButjkFzBUd4ERsuOOpOReWbg6+h0hSTS3nb/nME9jFfkRW4pcpI5dUUC6dv41TWOJmf8xNUH0UNhm0lENM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ra/N470Z; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ra/N470Z"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1785413f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791809349; x=1792414149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aJj4Wm615H/imfpMwNI2qT79o5fgFKI50ixCq2u6D9Q=;
        b=Ra/N470Z1rsPNexi1MkPGilCztbpAqLRTW6jMpuEWn2YIib0mG1MiGaIyDZLnH/+3g
         hMm1y+CAYDcisPYApU+3yeRA0fM6aI56iIZgsun/ZLG4FEsBP1rlcS5xfSmI63tgncBK
         jobB9tZ6hGPmY/Yt3AMPy6WqFbU397+4GRtz8S+UskPjLIUThPWE2cleFWRO70ASbBSY
         s/QkZz1dxNGwo1hm8ZWq2gizqCmkd/iVz5jpt9KCN6Jkuvmx87Kc5Uj9ZD1Rd0eIsucM
         5rpJDfH9QXlnw8QnI30qPobTJGBY+6OKlH2VOYhXvtoW/mhWmocaOTZut4onJ3T5DqcX
         BHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809349; x=1792414149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJj4Wm615H/imfpMwNI2qT79o5fgFKI50ixCq2u6D9Q=;
        b=m1qGnMaAQp4EOT356H91sY6gDdZKfnPiftGrFNo5e9DLDGk1qw/J1hXEiL8Ngf0E5I
         JVWJBww0vqEeq+yuAM2lTtBd1tduC2W+swrgdA6Il4ikxoXGvbL1u76BAPt/Oxt08qH7
         +Ut4XxCe72RwXg1ojhusHGYwRNgHP79lyB3W6xAqUZfvtIC9q41IwZL/dWM7ayEbF7rj
         KpvolDOGKmSnSE4e2jxmE6+nnmj/HlCWs22vWyLXRxzENjpcS57BNjxFiHBph9p3c/HI
         JjinAVS4HmgkyHtqO8N/fLtdC1Be84VAjznu4nIMS/xjz3eraxo9DS/wkU3DtzhHZCy4
         7ScA==
X-Forwarded-Encrypted: i=1; AKwUvBxIWg9KqIi/HM6az9hFcH6BUgDXGKMlL2tt0F2rs+PCk0RLhZlvwPGYxgF60dsE/gvJYRSzUUc14e9GCZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjb4UrzWuGPI6KurTi1dqTm1P8/Y0lA83tc6/ttYWU6dvPDqV8
	RPPjo5KOI38JMmLPVYnOvw1Q3VtwR+kXIaeTbfpL1+qCZNmK50MAwnmvF/UPzDM69jI=
X-Gm-Gg: AYBFou0HJpQJljiUcE7SF5Ni22DaKlAAvrZk2Zm58xnrmr05kuK1W1JTQXnNFR4mpct
	SwK2sRO06z3m8KPIzKFNuTtWougCbxGXXhDIPpOFXWj/ppYsBkHlhq13FRI9V3Ec9y5dCJjpqak
	L0fSwxZiU0yF4xYNIOEvqquR+pEmhTvskkUGOZ/fE1dZQCRVDs/+iSA5YamRy43u/ZFf9yWUGuH
	0TGh+/wT7tYWawtkvieUZjSZZvNL6dRCkdQhmfwvPG4eMpWcHFnec62WmQwXMRdtARdJjy4YUcQ
	u8XgiG5JGB98SWHR2IfyaV0o0et+R9rur5cUmfvvbqqGQfXE4ExlzkqJ74Q9SzWus7z8Zk5UztC
	MuhlVFr/mNAOIcM+tCxRn4UAhsb2M7JYbHMXzgb93rpSGLtv+UO9ffPaefJ+qQCm4bgb9dU1rg3
	A6zoEJ7I9Hh+NSxVdbs+t+Apnyd9sY6lM/+d9DBwzYc+hOLcKIlMy0tjP98NgE
X-Received: by 2002:a5d:43c4:0:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48dbaae8e33mr13956577f8f.37.1791809348520;
        Mon, 12 Oct 2026 05:49:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48db97ce3aasm19818827f8f.21.2026.10.12.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:49:07 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:49:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jingyuan Liang <jingyliang@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, hbarnor@chromium.org, 
	tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
	Jarrett Schultz <jaschultz@microsoft.com>, Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH v5 08/11] HID: spi-hid: add device tree support for HID
 over SPI
Message-ID: <aszWnnc6RR9d5SYw@monoceros>
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-8-384af01da3ee@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ey244vnbkokc4rpq"
Content-Disposition: inline
In-Reply-To: <20261009-send-upstream-v5-8-384af01da3ee@chromium.org>


--ey244vnbkokc4rpq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 08/11] HID: spi-hid: add device tree support for HID
 over SPI
MIME-Version: 1.0

Hello,

On Fri, Oct 09, 2026 at 10:25:33PM +0000, Jingyuan Liang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/spi/spi.h>

Drop <linux/mod_devicetable.h>, the spi header already provides the
needed *_device_id with less dependencies.

> +static const struct of_device_id spi_hid_of_match[] = {
> +	{ .compatible = "hid-over-spi", .data = &timing_data },
> +	{}

{ } please

> +};
> +MODULE_DEVICE_TABLE(of, spi_hid_of_match);
> +
> +static const struct spi_device_id spi_hid_of_id_table[] = {
> +	{ "hid", 0 },
> +	{ "hid-over-spi", 0 },
> +	{ }
> +};

Please use named initializers and drop the unused zeros.

> +MODULE_DEVICE_TABLE(spi, spi_hid_of_id_table);
> +
> +static struct spi_driver spi_hid_of_driver = {
> +	.driver = {
> +		.name	= "spi_hid_of",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = spi_hid_of_match,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.dev_groups = spi_hid_groups,
> +	},
> +	.probe		= spi_hid_of_probe,
> +	.remove		= spi_hid_core_remove,
> +	.id_table	= spi_hid_of_id_table,

Very inconsistent alignment of =, if you ask me, just use a single space
before a =.

> +};

Best regards
Uwe

--ey244vnbkokc4rpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrM1z8ACgkQj4D7WH0S
/k5u4wf8DQCuk6roFME/n1pKDY6+qOflxre3Nf6NmaZ05olJWzf7xMLHiGj0xlvH
rCXdQWSaJaWnBK8rKxyK28S+MmDDqDnW+WAK6FXQVv8Srv4/7Uiy7+5hoTWAw9CP
Vxuzr9RagEgpRyi0DyMZlaoFh3bqtZmx/IDNDD22FCwEJcVhvEpBv4TVYHn9L/wj
XXmPB4PiOuJszPGD+WIhrsdC1Zz17JoO0v9K42vVKKAkYir7a9ABA4fxMMjVxgqf
ixRyg7HTQo8ggOzmpFjoj/atoZ3XOBVYSQ7RLbU8ZgRcEu4xgL4yKP96cUXwQ334
ebpZbkR6VGklGZOq1SeOk7zN55irKQ==
=nzgN
-----END PGP SIGNATURE-----

--ey244vnbkokc4rpq--

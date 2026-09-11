Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1F36894D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153218; cv=none; b=NLoWekVDoBhVLq2D2dyn9BmD219LbB9gcsT0FhTLGiZahmYSNDOR2nP4aA0vg7LoST9PUF8JD76acRW8kvnV26vav+/mWjMaBo8qtXPzX2KRTBFl/sFtFKcXbCWNzPYKYpKCsuvvYqt80RjBerqoQbRphU5udQFLHVPtlZaCjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153218; c=relaxed/simple;
	bh=4ZtekrvSZt7MHjr4SZHmeMiexH0wFmTPt1K8GIiGr/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXCKxxD/FxfLPj/5EkzU9DnlwMWR6WkNYLdupgYO4K769hsFCVwDBq0+RSA9sHP84TxUQzPH6rC2J8AnGuEB23MErp6k6kG7JSFh48MVl+hBlz3zygtM58YLk8/Y68tywJ/uJXL21ero7BpDBf06+NhtBuOHvszSebXiPKSolgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LmNQGXlL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LmNQGXlL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e65b1cc29so3011925e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789153215; x=1789758015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZtekrvSZt7MHjr4SZHmeMiexH0wFmTPt1K8GIiGr/8=;
        b=LmNQGXlL5Y4S9REa2m9zYM2zbxoICOj106QyTBt2o03oEIUCXfftZJkfd3dCQHBkkm
         ft5dMwkeJLbRLdb81oCnBx5Ku8l0CcZQgFsNfYUGyPoJqq+F8erO1vHxAin0q2zDUSv+
         4QAW6TYZ+dMo7dvD4rawn0pUtBicgfFxaiuKLtlfxslhuedsk0tn396FgW2kFBr903et
         DyrTK+UIXnMSlR1TL9KCxmtHJ+c+HQl84JnARxodseJ8qjGBd3yfnBRkk9Gg5r6wKBuW
         ylSNDogQGAXJUhJkqsHlF6pnCrYLr3lCgddOd8HCJ0TpV+ol9vsqSpV1qfE7RmDlz0cM
         U0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153215; x=1789758015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZtekrvSZt7MHjr4SZHmeMiexH0wFmTPt1K8GIiGr/8=;
        b=KyPc6ST/3/a9cpHoJH49XiYD73I7HXbmNwLZ+q9DKXPue7TisYuGUG3+mVDDdcDiG7
         nVy9hlFazXJEH32dX8cO65IdLq+8WuxJdQSj7buEQjk5TReDWBnAPEbFSuU7SO0ExHNF
         H+O8xxr073bGbHksgla1+HxQrIOPfvGoEaANZLaYeJdefruY48B6Iy5BDrcOoNGSKHE+
         nYEsQsS+TVAdWgSL+05SQh8MI9ayt1fJP5Zs0BpsNTgVcyLx0eNRrzZNzcJc6An9tB8E
         6UT4z9OhFxqqZqSSwrCF2vIWHLjuUALaqnpLDxLNW8f9uhzEDaPKXJlHGZwUut4wcCDZ
         NAPg==
X-Forwarded-Encrypted: i=1; AKwUvBz/HVfE3938+c1YCU6OlsU55YZULhZZrEYf2hDGV3Jt9vODoBLAzw9uUejAlCMcXdN8sgSAVvaafOL0oWA=@vger.kernel.org
X-Gm-Message-State: AFuF++kyoh3+MbhEPAuLYBjL9EWVYqhJWOR9FvUq0XdkT+5uuW1Dfl3w
	6s0eguI6c2hwEgE6klbir9AjUKwLWywqSUnx+A84OjwhKSeqpzEjUdlvQK/TJAVZJtk=
X-Gm-Gg: AYBFou1txpV0B2PMTh04mBzH/691CpCBiFE5TM0pbaqOZofr2HwluT7TAtpFxKYBNI8
	AMUs3gE1c3BXQAyktISljdMmBWHMIOGhKq4JnLsk4wF8puw6FeU9swqcxaAkzf7VAJtOrpbhVxt
	tyupdiq6wQ7WxIUOE/XaCV/9U00A1XZhxdBDgADo1M+XDFEbbY4F8A9MewmflYBDAwQPJLcKudy
	vxd0DQ2CexjWdJPlsWVBUZMV5Mzcg0LfV7ND3cI/XzxScqEe8eIdt2WTpXHOOHq8JuinDfqPNSl
	YLoTAg5bypvs55uYaHH+o2W+2SRkz8WCVOQ8kAzAJ+YUBdnlZ8FrTQcf46p3ApcszIBfrRn7ZCq
	2PIaRkrjnVM02QHd6fVtmsfoASMuuZ3oksR9jD/lGA25JazNDEEiCSahRisrso9y5rbRWi0Y0dk
	ybRYqmc9d72iPO85++kBWvcOl3Op43zzA7x7FMgUU5d06/XESYN8f6AImtV0zn69LeBVIknuOnH
	HDw
X-Received: by 2002:a05:600c:c178:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49e61a15c31mr134264775e9.14.1789153215223;
        Fri, 11 Sep 2026 12:00:15 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49d26be3e0asm191106785e9.1.2026.09.11.12.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:00:14 -0700 (PDT)
Date: Fri, 11 Sep 2026 21:00:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: synaptics_tcm_i2c - add Synaptics
 TouchComm I2C touchscreen driver
Message-ID: <aqRPGt4WJ6aYG3CB@monoceros>
References: <20260910091405.354058-1-sevanevorotov29@gmail.com>
 <20260910091405.354058-3-sevanevorotov29@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qn6sntu7ctfew2tm"
Content-Disposition: inline
In-Reply-To: <20260910091405.354058-3-sevanevorotov29@gmail.com>


--qn6sntu7ctfew2tm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] Input: synaptics_tcm_i2c - add Synaptics
 TouchComm I2C touchscreen driver
MIME-Version: 1.0

On Thu, Sep 10, 2026 at 04:14:05PM +0700, Vsevolod Nevorotov wrote:
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/interrupt.h>
> +#include <linux/mod_devicetable.h>

Please rely on <linux/i2c.h> to provide i2c_device_id and of_device_id
and drop <linux/mod_devicetable.h>. (And in case you want to do full
iwyu use <linux/device-id/i2c.h> and <linux/device-id/of.h> instead.)

Best regards
Uwe

--qn6sntu7ctfew2tm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqkT7oACgkQj4D7WH0S
/k5AlQgAoq/MkGLldNzQZHH9O2QgklRLKn3AgJJy9K4GAIyb5IILN/eM8VDBAFMF
6zykFb9BPjPjOpTxbgL8Xj/QfNTQlUfiLr6O2ftLxnXaJ4XQpGnTjwhuz1B/kL2p
lMUpxSlrXAy5itIgCk6qb7yx/JTGL0LPctqidq5/0FAfo5LDGdQ52nMDYE1u/z9B
w+P3XMncaorfSlMH2r/bN6emTJcrUuLl0ZNqwGNRYr74+EC1qM0pm6yRMb3muqEK
4XSfIOT1Vg2zeA9H80SK6di+VMgy2HpTHhqAzT4/oGgUr2zRYz9bjUgToYGPGFHC
h2X+heeQ1/nTr7EQ2BMY0Rrw6RybRA==
=OVXg
-----END PGP SIGNATURE-----

--qn6sntu7ctfew2tm--

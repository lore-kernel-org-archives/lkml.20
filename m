Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551105;
	b=TjY1ArVo/RTQGxC5V2Im9vkC7wCyJjsUnFJG14ISGIqklOMOtzxDXJWf+zIkX815Ymev
	 SyPHD2ao43vhzPfh7fHWHu4tgRUnqvTp/whu0dnc/Zz8rcVokXtEPK3mnbK75gc9ur/gI
	 oBBlgtEmszaOLlh3H1T4Gx/8sAYQjKSmqNsyR3ozoAus/9QY0zH8uCWhrg1jete9TMvvU
	 6ZUwL55FZ68T3Ls4u8giMXV4s8JOK5tGlP1YXYTh1oD9nJQD95NJly984etemXAXIqpn3
	 UV/pfv833P7d7BJEYqY8mk6mMoUljOi1IhVjxM7NlzdSdlPomZQqNoxSRlj8XVaGQ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
	b=tSis6Nn/aw8NH4FDOTLsMzLCPMFp0b0o0hb5tpUMC+mOfs+pfuJuRFXEigVgoLvtL9Wv
	 3jrceCm8QMHYmIra0MheAtTAG7VpQ/DIefat49k2dPtzvOmh5mZOHo35oeg2GnAL3+0LF
	 9zFXZpvz2r7Cg5WuFvSU6b0Ay0x9QsyJVHyBiCtwxMdVi/4SC2dUny8QyXiek0j9f7i5y
	 fCwrUodmYRaeu6hAlRpnGQ5YdCjjFQ5arkAspoqTLrBF67KjTVXanbZVOhFucZrdeFOQa
	 mBC8ndRwljX+3OJx1yzFR1/t2KBbWjXVjLyki2qsx9oY+S3zVK1M++aTWHYYGlhF9zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gj29W04e;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980C606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2980C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gj29W04e
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5333185e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551103; x=1795155903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
        b=gj29W04eXkb5qIjLAIWJz8pxmukjfb6Kc8tpvLRp2RsZwRrX9TwNBoUGzZfXcbhDM0
         DjIV9Yq7n908GPX1ozQgjByI+/k+qXmFXYKSRJQ8ZyY8yoxXLDnJ/N6LqsbLDqyyRhle
         GEWaq4UHwYY1W7ZbxILKzy+mIUE7SsTqW83XGVFLj9vbHEl1WeDyT7eG6MAgu9KFowV9
         Hghd+RNvxyQjxFXsCxIRW/hoGjE+sM7D1jJuI2+cBGRHGyPn7og6LLZe7B0DMIJNzf7m
         Xydoiw8ZCuOhyb9Q/ZgiZXkZRu44scunyhEVctQm7gyHbu/x7Biuclr66oFGsSFN+j0W
         nZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551103; x=1795155903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
        b=1Px6/+1pB5nZgDqYjO6VbJvxwCmnTDa1uklsf8207Jxy/ySaL81/tf0+jlqDObL8n5
         bp8yCDq29Uxr7fkvyEFIMFexMJxCu7bEKYHgihA0ZJnUw6lFd6QsJr4i76sKuQpF26t1
         UgUmA4wyS4GbJRqIe8aUPOUq4F9JcA10CWoGAKA7imakfepxpT34TSFhFj621N/pXC0x
         R8fxA5zV9zEdqcUuLCKovro+Rjzd4RgM5/jpivSQz9oiI4Qyr0dMwSbbG79QeBqWAmRB
         NuiQZwxjs3y8ryrGlA/GTJEHSwxU4RIO6P3P6fI4b9WlZP7XncrWMcneTC869Te6c2Q5
         FU1w==
X-Forwarded-Encrypted: i=1; AL+hErGrDWkBYvaOi19pqvI/Oi+fpwF94o6FLK07UPx0RKUTBtVzAsFhQVM2mlzLWj53hDcl/Rll5qJsQo8XXGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9czwNKZFsQeoaqRoH27DRqzM0bhATZnJXC5a6r1IUcj4v31XTw
	o5EJv4l751Qx1Uk7sGQWxeETZKsmqld6+iX4SehB58rD16/Ior8VFNWzuzw01HqgPRs=
X-Gm-Gg: AYBFou3lNuyMahBhS8hqNDf9vPp3nMnCyLFQv4GvxQCVKVM76LpUTjlJAU3ZGszGsPM
	4qZEGPs0YGoWBoyMf4wt/h4So88xDJlO/cwnn2MQxBudTN2jErHXCUAXD9CXmhsf92YuHfg74G8
	YI2+u5gN2hlF/FYNqCqohHwecw6o5UNeFrgeZO6eQ3ur/Q3mhWQcx0OwkBErgGoISSBsgJwx44h
	6qW6K69VCVgxTn1nddgszP3C9SVGxejnpb3tvMVDhK9lvrPQ8ktdLTcTJIDg8lrAuk8Fxvts6wb
	pn1+JhxShTrbk8sBhFG0B9hWp+QxBO2hriKyBPArHEySU9/MpZU61Rr5eEtCR9xQcUHbd9L/DPt
	O2nK6RISVQSuB3ceJbrjs9yLblXeMY09nWrXYAPzMNW9rsI1QiAA61D3eBPXO/Vf9Rdy2lJMzr0
	aBK0ZXmWKF1oO1xL+xgczvFJc+fCAe8pxNiuY49qzgm8v1tmYM/ISCg/ew3ErEAWGmqr3HXtMtX
	jmvp/namhEu1NvhcuH6A+Sic8ph5CnOLYHqDO7LtuJkgwrvO0RdKqs5qHcBsNTCEBnVDIAwgTRj
	wqtN6HbfS3xY1s+KEA+k3VtmOgj+Cdu4f4hVxZr3qwz+3KTvDl/EdFA/pKWbpfiSa4t4bCI+uA=
	=
X-Received: by 2002:a05:600c:4e44:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4bb55c5f5admr25342125e9.1.1794551103537;
        Thu, 12 Nov 2026 22:25:03 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb571cfa2esm25586955e9.2.2026.11.12.22.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:25:02 -0800 (PST)
Date: Fri, 13 Nov 2026 07:25:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
Message-ID: <avas_9BOcoyn4j0y@monoceros>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekj7jpy4oarwkme4"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>


--ekj7jpy4oarwkme4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 11:42:18AM +0100, Gabriel Fernandez wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't add <linux/mod_devicetable.h>. of_device_id is already
provided (with less dependencies) by <linux/platform_device.h>.

Best regards
Uwe

--ekj7jpy4oarwkme4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rToACgkQj4D7WH0S
/k7rcwgAuyIO02PIHScObbQSwpTN1bOxntCQuOefipHur6Tv164hiCD+Ows3bueO
hHN81SuXrTS4hzRGcT5jFlW7zlkz9L2tSHYZ0us3Hep0wntBkIeA0JeCZqBCoASn
RuXE5+uHnhkMUlqy+/xZlblQtRTUnoCZmce9NixemtTaCIMPlL9gIeoouNGk9r2B
2Ov8mhk3tjy1A9K9YCE3vdde8NAm9G0myqV85K2q+/6a8k9IqoogrLX5x/9uNZgI
wH/iThyVCnk4MnvbQGHVc7Q3QXDOZAVGeZPck+t/XfvkrsVkuawozxF0NWZO8LMe
ldXWek5P8iobsActxH4I13gTcjgwBA==
=QOFE
-----END PGP SIGNATURE-----

--ekj7jpy4oarwkme4--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551774;
	b=lzm6AW5koa0R94S/4uVoh4dumKyU5lnDoEvBbvSwgW2O6SdA58RuvRa0AeoHDVwf/kT6
	 rvu6LWSooZjexNNODLFpyZcGuGKRw9eCKIQxv8fASYs6hLitpCZvfBXkmt8pHF4hSoumY
	 U5imLWU/FD8U7b3pe+dwzXoT3/M0q0AbNUtlt5bgsK4GbZGM+4c+gQcN10GPSMOV4nJ7a
	 0vqOA7VrbjxPbpsAO2BJDeKLlVm6rIqEpPchOZqEJeGjIAU9F94gnRZzLGIyMw9sEC5tA
	 eFj3Nuyo8NvlZRLOw5S/in6AiQzyl04HXTDoHQdbb7wmH0Eb/RJiqwVq78KC5FDCgDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
	b=Ue6s7BzukkmMkoNKcEYOy2t/eFnr+DkYnqLU+pLqW1bLbk/XvhnDC9B79jsaI9RjJCg3
	 qIBCZfkb4qGgC0W1/oKGqmrcAtGH8H3het27A53m79YiqZo3IkUf2c5kDF0b3fMfk45v+
	 6urzQ0q0M3LjSZr8OmQXLdmyo5Nz2LVhslkfkJfoTtlB0iu+BhFAFbrvfE8G/MLPuZlQL
	 poOMSyX1xw0aeiqsch+iNn+Ey9pwOu1gNJVtpV5mPsOUFWBbcBTjibgAN+Pwl6Wd6/qc2
	 KTJO4BSzytrJIkAS7kcAVH/+Bi+LrNmapmCVvLE6tJtWPsuY3ab0u8VLfdfWyKC1DnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0pKQlVL;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0795606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0795606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=p0pKQlVL
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so3513775e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551772; x=1795156572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
        b=p0pKQlVL7CG9eGWvQln57Smu0NN9pCnm1mnPUVAj/UmTklt/UszoRYj8hQfYXlIrwy
         kMzdLKYUHpFQl3S6frWGST7Pc62GUmKnHPK+NGidwzvBivn0sP6oXJTN9orf5ia2OGgV
         p7fpHcuUr44iI9GaSCGsEKXjElFSFsxUNFnGREj5vxDFrRTtjKIGfXuDdnqZX3tYJDhh
         afc2UFp+4Nur21wZHEuEZ3AiJtdaxUQl8G8wR3Au5J2FZ0l3fgjd0y/MbOuwgoZgkaNQ
         TTtJ04biYuEeePTRzatAs6scDzVrAAfHAK1S/E2uS61rBZxF14AQxTNdJo5tfJ+3fp02
         DuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551772; x=1795156572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oY6Sw2eupDcreXCwLDckh5hNjgWiUywnz949Uvx33tA=;
        b=yy2Gf+iaOxmansqyo40ANklPBNNt9oll+/IMjWDRiiaRDvw10bhA/Mv6RT0MW9Qx4U
         DmSl4t6SLm/pC1w3/iG8qBS3pVuZwjnvlQmVazXe9isd5D6u43bIOB1zdyp+61bRUwpz
         87GcJwI5ZpdRZl+ekuRKAuu5r0khX1Zq5dxEQ5Mqfs8zrsbQT88jDp9fgB0lbiPleH6U
         Uin3OCyL/63OphM3NRu69QzAC+pTbPGFZb0JxVQx1upsGHdSu9l38558lji1PMOSEjTB
         UjVXLX91yhLcdAeJkEU5EgyWmgaVoqUqbtxbAZjP1YLKDzG9vqk9qnyUE+hGeNSUEDXn
         bAXg==
X-Forwarded-Encrypted: i=1; AL+hErGr5GdKoAtZD9b7DKyMaFHBPVaelIN+PdH1SfSkVJxpI/fkbp2M9ZtYV5JXnuejBLQXUQ+RWIof2eQbhtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hz/XgaBzIyJDNrWEGxf0IiurR5bWbCy8qG8YGE9Oj6c+09reH
	rwlw6iXKudygD1kMl2qQNJ6XOhw+rAFfTilBq2r7wIAVGGo+8wE901cBs7sD/Bgr1M4=
X-Gm-Gg: AYBFou0QlpLIgl2M8MJd66Pb6/wWm8cxfiL74TepuoBaQkfg/N3kINY0lxErCkoaveF
	x7uFTh7lzf6MI3bn6hEs2bqH8/+ECqvDwpvSRfbKXudHvUFK3fxuoUbZ0vyIpWP3AL9Qda1WtVY
	ZQVaa5OFEK2Q9k7pZT11UVHUR8X3L5uZAuUbVFymK5PWMXHQnDFF7cTRWy3z9puoznQd76utbEK
	nQ9D2ExqnQt0M62bS3OmLLdDMVFpWm3SwT4VsGCtAzHX61hjwiX0qOxDsPVsnE9f8hkkggzOVVU
	GuTIdDJwmBnIUIAN4fwQBkxXv0Lr0y4UAj4VrPcD265kBX/FjNszrstunRtjmrN8m9DKcnAmZHX
	EfsxGG9VO83XIOXwwl9wPSImZGi2IAUOJbj97mMWsP5djM+hARENFhHXvVi+ppjk2sjgaRGmpVn
	Pk8OUO/k96H05j6Sqz+xJ+jHM+V0D3y1oCmSsrwWV6MONTRPXHUu/eLNhSLLGFhoLVsA0OukwSy
	x7ucuhtKpQ6gahb0tZAFvUmwYivPxdTQE9+c6KtDjvZQq17LTO9/j/cGiNx1hm/0FoNQA14SDPy
	QHVIh7/7/DSxdz9LJBhOPK38F2HOPEiJSA==
X-Received: by 2002:a05:600c:a00d:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4bb55aa854dmr30515515e9.33.1794551772311;
        Thu, 12 Nov 2026 22:36:12 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c8d286480sm4583537f8f.7.2026.11.12.22.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:36:11 -0800 (PST)
Date: Fri, 13 Nov 2026 07:36:09 +0100
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
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
Message-ID: <avavgGbj8WupEstn@monoceros>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>
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
	protocol="application/pgp-signature"; boundary="gkwqr7dnu5cjjahz"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-3-624559bb8ec7@foss.st.com>


--gkwqr7dnu5cjjahz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 02:10:23PM +0100, Gabriel Fernandez wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> introduces a lot of unneeded build
dependencies and <linux/platform_device.h> already provides
of_device_id. So please just drop the former.

Best regards
Uwe

--gkwqr7dnu5cjjahz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2r9YACgkQj4D7WH0S
/k550Af/ViscKIb63+PVQx/zXwL2fH1N+c0J0B6+Wy1MxiLTwJFXkjS0mu9bkBlw
CLifRBkJubxD6KiW9nuvesALuaWyKACFL64L/M8rnUTgMEQtIzbxaJP1/fdakEdU
NGqid7VZx3OLkHgHRSws9AOsMV6rJAKvG29HF2mjA7Sr100t/T7kfAskHU60dDRT
oooiNIkRAXDZzowGQREV0WePP+KhHjYDXNY8XL8kp5fc5oxRJxUcSTCFZCWxxgT7
Y7FkmxVSxQA07Pn07yy0KF4rBoj6O+JrpsfW1vJ25VKLi4BaW4Iyl/EMLXHhi+rS
IiIDqmj4rco9HRt+45lVPGX7qe4gPA==
=gLbT
-----END PGP SIGNATURE-----

--gkwqr7dnu5cjjahz--

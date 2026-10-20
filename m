Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485266;
	b=vl3TdeZ5f4KHTZR9xN8MJDkdo46FOkeWbKcyA7vLpmhDMm8imSrO8OdxunyDk+JlA+2/
	 f+oinAg0msZJnN9Oti499mmvc3xyTJ+87we2U4AIlaQNSut5wdHwrP0A9wXm0/LTfi5gs
	 jNh11+zsX6xHt8p1Zm9f631gzU0lnIUh5QzPXZfTAdTkjZ6sNQp0G77Z/DS2zKzuoyFy+
	 h0oM/UkMojthig3GzO4+QLaZM+QM32+hVRXyRC0tNQ/yRXFeKsJwxHO7lA30P3y3994ex
	 DOp+yZURG/bsd+KwKA8uFpoth63yHhGQvziKaYOW1Udb49A5mmXmHTJ8IwZyEn83AKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485266;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VMFqxM453yLwBXSbcRLMTntPAgtjcAyPnxyGhanIJOQ=;
	b=2CRJRhAp5zBoJ4XnUmpIg4iJzXSBJPb09626yLokUu08MSrjAx2x82/q1UjuppI1S3s+
	 OX6MY5Nj7HUAkwdlQbaeDAaZuvD0ll+9fwwyWuY5FMKgyD5Of8eN4kLEp+fsSPQih1IT2
	 JLhJCK2nMGwzXiSrr5tsULyYVdmlajxOvmnjfvdo1HI83KHCpNJFghzNVYG/kg2qb6XZe
	 iqeUVC9ttx2L6UqRDwyqNsgPHVNrGgX6/7Ny2Mxjrevwi5WTV13iB4CXOLXtrfqGUdQlz
	 YXks26zqnwQ1sn7SP9Uyepi3PVXkLMMhU4GIBaEiAPcS1fOYnVFSkBWToqin/OgdLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0uSOzXq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BED606A31B;
	Tue, 20 Oct 2026 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0uSOzXq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC79B1F000C4;
	Tue, 20 Oct 2026 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485265;
	bh=VMFqxM453yLwBXSbcRLMTntPAgtjcAyPnxyGhanIJOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F0uSOzXqFAoOHDVJSsaHQ5ir1S8o99DRmrazLP6YHC7SDbkmUtJ5y/168C2X06p/i
	 nzMbd29t2E07Lsyc2maZDbwOG0d+L3tr74ddYjqTV3GeXof9FITQ9ycQBbGoAmtY/Y
	 A891IhY0p7egb56CJ5SJSHUWJX9RJkwnOPRxsS7XUxaSN4OhQP8AA83kqtzXBApRik
	 mI+L9CgLCFcD8h31nrF/m1rgO3QCchzQt6c7DO722cTDpQAp99iFgf6k3DmOjx4mPJ
	 34+oL1kSeaOAFUz/kMCFZExcR8wvgtWMEa6R6NkGKG6L2Y/RDskzOzg6sA3uwfnA2C
	 48Qdrfs1AlECQ==
Date: Tue, 20 Oct 2026 10:34:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: display: Add Solomon SSD16xx
 e-paper controller
Message-ID: <20261020-futuristic-awesome-dinosaur-b61d9b@quoll>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-3-devarsht@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019213726.4145532-3-devarsht@ti.com>

On Tue, Oct 20, 2026 at 03:07:14AM +0530, Devarsh Thakkar wrote:
> Add device tree binding for the Solomon Systech SSD16xx family of e-Paper
> display controllers (SSD1683 [1], SSD1673 [3], SSD1680 [4], SSD1681 [5]).
> 
> The binding covers the 4-wire SPI interface with required GPIO pins for
> reset (active-low), busy status (active-high), and data/command selection.
> The spi-max-frequency is capped at 20 MHz per the SSD1683 datasheet [1]
> which is also the maximum supported frequency amongst the family.
> 
> An optional rotation property (as defined by panel-common, in degrees
> counter clockwise) allows static display orientation to be configured from
> device tree.
> 
> The data/command selection GPIO pin is also kept as optional since various
> SSD16XX controllers such as SSD1683 [1] support 3-wire mode too with
> data/command selection bit transmitted as first bit before sending the data
> sequence.
> 
> The first supported compatible is for Gooddisplay GDEY042T81 [2] which is
> 4.2", 400x300 resolution black/white e-paper display using SSD1683
> controller.
> 
> Links:
> [1] : https://www.crystalfontz.com/controllers/SolomonSystech/SSD1683
> [2] : https://files.seeedstudio.com/wiki/Other_Display/42-epaper/GDEY042T81.pdf
> [3] : https://www.crystalfontz.com/controllers/SolomonSystech/SSD1673
> [4] : https://www.crystalfontz.com/controllers/SolomonSystech/SSD1680
> [5] : https://www.crystalfontz.com/controllers/SolomonSystech/SSD1681
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> Changes in v3:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


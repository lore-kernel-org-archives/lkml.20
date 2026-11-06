Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969886;
	b=XRTHICnGc4AuwRh9Gwnbyo1InLE+JWocN7DaOXoa6Ot8BqQEl06MZ89vZd+uENnfdqGi
	 M6FMxsAsEA2z48ba2ittyT9d2jAEqnbPQ57pBsPP/+wKFBUZI9AxULo2RUir1WMfVNI83
	 HE7GAo7rJlTG6kD+sStOCIOOluzYjw7lhbJQH605aZziws33gYgBm1IVLVRI42EMtVXYv
	 L1GxBzYTaK7uVg8RWQzj1uOAmE5lN4RX8tt03QxPM8BItG4cpdG7SyMSRVV5OM+yQlalt
	 RHEUVouuGxyaV3AlAfsaNhhuW0qIOTpagfZmBifSCaJuZwaRELw+RiQfbqC81tFYNLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969886;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sxXe+GvkQh1xmVF/fKR+0ndQLjKjrvqGNJZAq6NZqcU=;
	b=AufrlG4Uob+e2nl4jIMGVL61uhTBIbhStxv+SuekRP18l3i4rAIWIdFQpO0c9j26LPm7
	 1kJQsmwm6Xfl1yowxMt0mcYRYdwYq7xsT5xJBLgb5soPhuE+4PYS1DCzqa3qdoP6VEq8O
	 G6bn1hzIHW4GmkYYGMUrJzHwgt/O239TkWf5Daa5ZvAlE4R/Rp3xVQwACD6HI/xpH4yzS
	 YwdB1vVSSNT3YR011Cg15TzV/IYYIp9SaLQDFqJKXlUvZE0aobtEfD0oiMtTBhOBs80TP
	 7XZS++mHe62xSQLDOtB8daT2w5ttI9nqvqYU7FeLpPFalO5TQFegyOkxSe40qzE6m2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUF+clmx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07D606A32C;
	Fri,  6 Nov 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUF+clmx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B8B1F0089F;
	Fri,  6 Nov 2026 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969885;
	bh=sxXe+GvkQh1xmVF/fKR+0ndQLjKjrvqGNJZAq6NZqcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bUF+clmxKVm/xlk6EhYYDQ9fPSzkeEfppKDprBr30uWIBS+fTHM1uqm8veGa+8VIL
	 urF8A+YRSqqvi/HQp4nEr7ZzoGPlcBv3J90nLzVOG9SOmYQS/PiHyY4CjzpYayNTk4
	 sDiZVM14ROVI7KP3u3aNLnW/hgHOpy8xk2Yh6xFjVQKcPZqdHq5dyOfJPfnY/y8h0t
	 ns+2z/ndqmP6PFhZLqO1hfsVJMOiS8/y2vWYGvSRFpyALfu3f5AYc1EwHXsw7kKnT+
	 yiDIv62EitLzTDzI9kbtLjdt2gkbX5w4L4cm7EidKtCnrNquO9R+Yy30vLr1w+fPlr
	 uoloAf1vt5kqw==
Date: Fri, 6 Nov 2026 13:58:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Igor Reznichenko <igor@reznichenko.net>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: add PocketGo
Message-ID: <20261106-gentle-shrimp-of-weather-dde4f4@quoll>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
 <20261103110524.2812831-2-romain.tisserand@gmail.com>
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
In-Reply-To: <20261103110524.2812831-2-romain.tisserand@gmail.com>

On Tue, Nov 03, 2026 at 12:05:21PM +0100, Romain TISSERAND wrote:
> PocketGo is the brand of handheld game consoles such as the PocketGo S30

Vendor prefixes are for companies and I cannot find anything about
PocketGo, except it is a brand. What's the website?

> (Allwinner A33).

Best regards,
Krzysztof


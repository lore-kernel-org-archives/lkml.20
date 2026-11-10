Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310418;
	b=bNLJyqHBqQv7keapKKaTsZ0iDAMVycMgcNnB/8a5CbUTQK9pozWl5+u7Nk12Xi15wcaw
	 yYDfR6IAg8VeQtwBxQu/mpWWWfW7Ufa55UBSSBB459x4anPYpCE9HXoHyrQRRLqw6jw1y
	 ONpWAUHKwxJqXyw5/E8izxOE1rlusvt2UBlEH47Z+RxhfjszrcB82zm3A7JNKXauw8yjc
	 4nAsvAABRTUiQexk1ILxxehHTSAc2eHSLKzu77eYqGd2pHl/7GEpyUyf3AYJzmPlY/7x4
	 XS1wI/gZQeQP6aFV6r/lG0OG2yTphpqvFDVCqkPBcELy4eiNWKXHAnQfBkCS/QqhdNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310418;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ny+8DZi8eelifueD9rXHxFIgQYOXupMoX+ybaLx5um8=;
	b=BsJsNourJXpyhlfeBOxer/lnWsH9sXWBmHCqXAf6lbIlpdLoLzndIHWtdqKNe0D4JhZd
	 JGIkXxZ1z3SjPcjrU9d/sYDU+2Q3+ZeM1x6g/DEESJt80Ah1xGc525i2I1Ta5BOZTy5il
	 Asul684AYMvwmLT2yaOcgZCSHrZ+GNbKM83xAewwGHgvT6YC0NGi9lVxsKoHFHFflR3UB
	 L27bxDhMkTBeFymbqDZNdNofz6MDoOQuhpLU4cveSi64w29TNa2e7GxIpyph5TgZbLc51
	 bnZgiWUwyA2aXI1KXY+jHANTD57feTZg7aw6JzYlhdhBw6py8qOJfQO7BgN3tHxYYlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KEDUbyMD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C0606A321;
	Tue, 10 Nov 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KEDUbyMD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405891F008BD;
	Tue, 10 Nov 2026 11:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310418;
	bh=ny+8DZi8eelifueD9rXHxFIgQYOXupMoX+ybaLx5um8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KEDUbyMD5hhbMsWpU6v0L9h1O6lWbQCXbtEgPHcXeaUcH0V3RZEcY7wGekvoSfd5A
	 jL6jLQyIpdCp65Gta3eE4hA/Ux048v6zy5vot8W0ZAg4HS8pdlJ3D1b1sSaGkgx0ct
	 auGoPsk54tPhjAdhKiPOJXn5Cbs90KbpxgS+Z7z9E/8SRp+cmU4IDi9CtEZdlsDkCs
	 KIcVHv2ui3oXdzJaGHIUOY2/d0m5Bb3MYzdsz2eKK3gw47vO4b2ipyXa3u1c/fbJ7q
	 yA/G5lTtMvvPqjQvYrlNyx+gJ+4IGcaXiARyahT+nSGyNcUs3ziqI3nLo2fcoIEDZw
	 JQFnS1n0Ll/4g==
Date: Tue, 10 Nov 2026 12:33:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, 
	Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
Message-ID: <20261110-fantastic-jaguarundi-of-greatness-cf150b@quoll>
References: <20261109093353.3757-1-lsa.uz@pm.me>
 <20261109093353.3757-2-lsa.uz@pm.me>
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
In-Reply-To: <20261109093353.3757-2-lsa.uz@pm.me>

On Mon, Nov 09, 2026 at 09:34:14AM +0000, Sergey Lebedev wrote:
> The VD55G0 is a monochrome global shutter sensor with a 644x604 active
> array, sending over a single MIPI CSI-2 lane, with the same supplies,
> reset and strobe GPIOs as the VD55G1. Its MIPI rate runs from 750 to
> 1200 Mbps (UM2829, 13.1), so its link frequency starts at 375 MHz, and
> its I2C address is set in its NVM rather than fixed.
> 
> allOf moves below required to carry the if/then for that minimum.
> 
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
> v3: no change.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


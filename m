Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568379;
	b=DoonruLPXYYUJ9gykaeMNeormOfVnnSTIuTKxpdVHxzXqXVnqARyX6yOg2CmrUWp8xa0
	 G7swsarN+39xk25Gyst3kFsWUPG6NINtSak8CT0A2UgZrdVFBbOq1lrsmune+PXwDDo5D
	 k3+bnAvhSJ2Zq92pFRlJWmcG26OB+FehbvLu7BhwxhrwEOJ3SVgXGzRF2ycZfSnIKz4UC
	 HKgS9pAsHCkwRigBrOTRpr3aN4qRrImkjGERZO1KZxFAmV4WbV3CHlMr6o7+d6q6qp+PY
	 Tx5Mb8/TROUz6u31h1NRavWkFZMw/B+zqnussp359TiO+F0eNM5OZ8oUyORLpy2RSpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568379;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YE/QFiUmU3OYrjYzXRMMATHqXl1z5aveyaIXT6zCXNs=;
	b=ZiN8W3MCXddPexToIAt9hVa++To0xDlB5PEN1H791PdBnRj2iXTVdzK4InGYrYa1rrzh
	 BBasdqCzAOY/SsaEpnSg3kXVxlu1TUFfkR6t1UHe/+VDs83g/Dt43Xr6wU/Ev342vR6wk
	 cVIJrV8k+yFB2hPuQIS0mAswCH7ONMh0L0V7bJGyFtTcRtMnkIJMwLiqSiQriwJBmZ9NM
	 yyH0rA0FXSKGk6EAHv8u5Ilz51EzNXp5UAz3GtJDw39uAEy3j3Dt2wf4R6nQ40Oc8IHVh
	 7vys3DYbGdCRArUOmODxSABfdMaFpPyy0aTGZA0Py3JbEw9JqX2HePapsnA3Y8kwPvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLqQPuwB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05AC606A323;
	Fri, 13 Nov 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLqQPuwB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F9B1F000C4;
	Fri, 13 Nov 2026 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568379;
	bh=YE/QFiUmU3OYrjYzXRMMATHqXl1z5aveyaIXT6zCXNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RLqQPuwBt4mADxbvW1lqlsDuGrKL59sU9HusL5TZqEstdiigTp//KxFNmgVsXiB/u
	 Hu3PxDr+IafRqR34zNggZX0y1A3hBIX4ZABy0DBVICfL8soGxe268Z3/p2CACkRt+Z
	 BTDd8JtoA/QCbfJ92e+rXuoNodBxzTsBZhNF68hVQzUHvWUkMhEnguZWQoMF6250oF
	 WiOQUDmpWl6c743VM14Tj1r9n+7OuqUfxn5rNeEgpaoHH76yzkXAPspFP294JickIw
	 YDd8q6q/qjew/qhiJ53gOolgnmj8hB5+HRsZ5wbRB7pCI73BRDcOKUe6hfff4IOv7a
	 0Q2nl2rRtUhsw==
Date: Fri, 13 Nov 2026 12:12:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: sun60i-a733-cubie-a7z: add
 the user LED
Message-ID: <20261113-shapeless-dodo-of-skill-32b3cb@quoll>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261111134919.90264-4-vinicius.eduardo.pedrosa@gmail.com>
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
In-Reply-To: <20261111134919.90264-4-vinicius.eduardo.pedrosa@gmail.com>

On Wed, Nov 11, 2026 at 10:49:17AM -0300, Vinicius Pedrosa wrote:
> Describe the green user LED on the Radxa Cubie A7Z. It is driven high
> by PM2 and uses the heartbeat trigger by default.
> 
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
>  .../boot/dts/allwinner/sun60i-a733-cubie-a7z.dts     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>

This should be squashed, you just added the file in previous patch.

Best regards,
Krzysztof


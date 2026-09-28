Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8416136A009;
	Mon, 28 Sep 2026 10:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592888; cv=none; b=Z+JygSvBKm0uQnxRwxNiU9R5LLY+H1YuETh9M+56mabwosLDgIlr7RIulfJz19i2i38ogsS60VeWbLb+1Ks7Xs/kZ50omka4XTvFfloyUDZclnc5opUj40bi8I78tnL4nNieQ6IZ+pZ+DrPNfTT1tmJ+dzmat4vcnSUOmZMGHj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592888; c=relaxed/simple;
	bh=ZYMdKFvyz+DZ/JYSokQybixXJqPYmWrl3XHTSgAV8m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFi0Ympb0MBRz5KrURJBf0lzZP065ETrWlAenjLkSYfArOv4jKKMeHBNQ3+s9gUXaKWSKzWgbcQd6FY9V1wCJYv6vCBH4yuffC1uSDvPaA9X4+OBl0Oeh/KLnalnh1HN03zPaicdP4sY3yK2lvEPZbsLNeolRGA7/OKqAl/rQaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxCVS+Cj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxCVS+Cj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2281F000FF;
	Mon, 28 Sep 2026 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790592887;
	bh=ZAk6ig5RLZAUAqcboNXsyjMddluuJwtpXS3c+6S3p8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SxCVS+CjcyinQ0dQAmH/v7SKMAxFwqsky4vwkUD99gstV4sujX2B8rpOn89V3MmIn
	 2h0vMdL/tRkWX78WMDqZuUY8dOBgEaurJPSFddV4ZBTPSubTL0f32yyn1UrsC6Gwnz
	 9magB0KLojV3ThRpVE1SPViG5RAAZ3JbFCZa79zd8lByV1iPI4aqW1ntHHfKxCG2T/
	 nMitGupwKr2pFkWeMiW4rOloFRfUB56n17U5ugYbyghbBlygNCfM7HlCqvVWKXhKj8
	 7rOvi2+QWMOlnFxnT1V12Xy3ukXRMp62ZzAQvRpgAjeyZUAZ6ySwcFgoKOeTTqoMmj
	 1fHFSsV65d7Rw==
Date: Mon, 28 Sep 2026 12:54:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Message-ID: <20260928-nocturnal-robust-bird-a42797@quoll>
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-10-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923201701.43391-10-pmazzini@gmail.com>

On Wed, Sep 23, 2026 at 09:17:00PM +0100, Pablo Mazzini wrote:
> A 6" e-book reader built around the Allwinner B288.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


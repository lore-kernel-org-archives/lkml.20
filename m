Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FA54570F2;
	Fri,  2 Oct 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934140; cv=none; b=gq3WFtw3eylpOKmCMD76MzAKWYs+qWjzp/iADr5MzlEOt628lkOjBLTOxnoghy+SDzxyLcX2zk9mjBQ/d9S6hnobf5JeI9o+Vsg74z/xKLTrvw63Q/GspnGh3ESQpB58y238PCS/dbGxCdIMKPUlmjgvQHqnSB+ew5dQ7GgI+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934140; c=relaxed/simple;
	bh=IDV1284Y8jRNw3qmwplFh09UtKb9DD8AZgh4/3H9cXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfE3OStGcAHkdSpIRakyzs7aADlf3rNisaoVGL0zm4Tn0oE0ZGEARl2UG+zQRq/2FOXHp53pTZi7HguLg4r3h0MkyafBedig+H4Rp08M2WCPtHT4GhqaaEE98X08u+03LWFSN2+hkiBJiaz4+j20lFYayEM2BgJlslTg1onFYCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hplXPbVj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hplXPbVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFF31F000FF;
	Fri,  2 Oct 2026 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934139;
	bh=efL1+n1dK7AWhH37EQ0nV3a1HbjScxl8OApVSmAnV5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hplXPbVjlKdXr+GoZfnOiYnK7paer287vF1PjzJuXNqGHk2hI3obnO02CDrcdGcOC
	 HK0+DIDKOLVNjLw2DN1zOqahPNYa8UOA6GgCTLyHb1TMm4eWTLxK3l+IwiCCj0WcdG
	 K/KF7BRyR/753FfsARs8g+QsOR8V/w9pJM+XPkoAfPzroz/IbU9AXeCSuFvR4jx2JN
	 UFRk1Rg2GVY3Io83a7GKi6X9FcMh84ihpZ+p4SY2dyttmgeyTrweuukhb1VGbP8XJo
	 mfHL3EKRiVulKZNm4OrmxazNailvb1lPBZNNxFkgkHa0sA4jHlU7hZX9bquzVULvbp
	 C+rW/hCzUPCrQ==
Date: Fri, 2 Oct 2026 11:42:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
Message-ID: <20261002-curly-bold-octopus-ade53b@quoll>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-1-2476646118b5@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001-audin-v4-1-2476646118b5@baylibre.com>

On Thu, Oct 01, 2026 at 06:06:26PM +0200, Valerio Setti wrote:
> AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.
> 
> The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audin"
> uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
> added so that differences can be handled later if any are found.
> 
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


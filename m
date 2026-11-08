Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169357;
	b=wAYmGpmBS90j9uoLz0YWE+vR6dsTaYDCsJpGMk8qGeAMSpriQcFKH5SAnKS2wxv3TmMS
	 k53N+Y7pbfvzV6gfN7234kkBrIeREkYCXXF3s3l/+3nO+E7WYmjwCQSGP4ChvheU7v45q
	 oN0HG0FKNMkSfxDg+MCsd4jZdACG9YIURhqy+D3QT2G8fYokO9q+yPLCQA/AxZY74bgFh
	 Bc1lJqEyK3tnnzsz8Xm3CYCZgDO2cDwE5pfh8ARTskTqNHO/vGGEQsM73NMkXpkcZvdU8
	 lp4FSjHudrf0GmxD52uyIgxvrNRxPjT+dCZiMvMAFFl5SzutAeUCqkA5zDl70w8KcNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169357;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=upPLFoD78FXRin8MRh1mfyaTKvL+JMbeOe8yOjqBx6U=;
	b=cqJYiu1ZNvFh0PDvFhG77X3O1pwoMh5Ux1rJii+m5HJOq0oBZYP+7Z86kM2AYLAr/qHC
	 VuYyMsi9jMgO4BK1pJs0otwWg4n1ibDgVBzr6OROAaRK36vrrgvJaYapfhKiFWETeHq+f
	 aj7XpeJ0tKV+M2GbIYFsjQ88wwyWo/6HKuT7STiST3G11yUlijTjL4zTRVIAKLhN5MfG6
	 SpVjv2sZeEw7/YIdY042WjBWvz9yon/8BxFyy5U/N0sr7y9MUu3y8pdo9jCTmtKRlAB2b
	 8Mf0QLO1USj7maFXpGsQYYetYj4J3jo/zRK447uUBK/Iu+loChVPjT9cQc7XrJ39tLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOAqKlGs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870CD60A6F75;
	Sun,  8 Nov 2026 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOAqKlGs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0977F1F0089F;
	Sun,  8 Nov 2026 20:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169357;
	bh=upPLFoD78FXRin8MRh1mfyaTKvL+JMbeOe8yOjqBx6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lOAqKlGsnjXSV21/T5smoYtdNla1zkSW4WkU9OHO4A37KX5l4/hbtlzCwBptD9rkQ
	 jKFROwdGpMXgJXqyadRPWe1e+bWfOvg7+MYptBva3X5SrUeqx/I5tgYK2A6LefGAQY
	 kgJbNbuHv7rvKBto+yH5+irTMC28bAUyUQDu5BGY7+mhbngOffzQ98emsnfLrvDQ7M
	 VeY9bZ10ZgddwXPEqTiPXbbnoyqr21RaPdEBzGSS0zqmkj9h/7pjAw5GywN/9Rt1Wi
	 IgoDkM+cOMt5izIC57HlGg5NnrRG29aYjj5G40Q5eJhuOH+TqqwOopu2io8FW1b5CJ
	 PHs+dTmnslJeA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabricio Akio <fabricioakio@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: Add interconnect paths to the BLSP I2C and SPI controllers
Date: Sun,  8 Nov 2026 14:19:42 -0600
Message-ID: <179416929353.628393.10028590160844820723.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
References: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 Oct 2026 17:49:30 -0300, Fabricio Akio wrote:
> The QUP I2C and SPI controllers move their data through the BLSP BAM
> DMA engines, which reach DDR as the aggregation NoC masters BLSP_1 and
> BLSP_2. No path is described for them, so nothing requests bandwidth for
> those masters while a transfer runs.
> 
> Describe the path from each controller's BLSP master to DDR, as the
> vendor kernel votes it. On a Motorola Moto X4 (SDM630), with the
> boot-time interconnect votes released and system-level sleep enabled,
> an I2C transfer running as the SoC entered that sleep hung the SoC
> without these paths; with them, 5,000 transfers ran through about 3,000
> sleep entries.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm630: Add interconnect paths to the BLSP I2C and SPI controllers
      commit: 0e8c6ca9ac42a99a9cbd760f59ce47b6c61162ab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

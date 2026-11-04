Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803865;
	b=HpjYDH3DxOM6LPxbL/VNlwhTxX5B9cP6sw2tG8a+zSGJIvARTKjvYUiyzgCUAj9Udu5W
	 24Ym0WCOgyltkYnEtVJgJHgxJydgltZUpMlaW5m4EKP649di19MVyqrBMzKp/55K1+yPG
	 ePj5P8kCyqp5JFx6PjAXPnezPjZpg4ZNFDqP1ST5HKyPFUxFawNuqJVeU6aQjMBsSMw/X
	 fRonmk5iGNOg9nqv8wBOmL5ozEcR2Gl2iRk7z59XhjbK3CvHYdEhCjsB1PBICe2vEKXJJ
	 kjimsARtns0xXDgsTR+v6KofojHEFDT1Cq4ZThkeK/y1gEUkxIfqRO+shgxv6XQ5Yww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803865;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=KZ+cSODzQCgfcBpl6SVJcEIqMlZuev5QB51iLkiBvrk=;
	b=w+/nSIUnnR6hTCC1+xGK6c7eJMxLMiACYGh3910YEhXkKGMF9iU8TIzotXbVuSHs1cK1
	 e4lFmDT6SvFyD37we4ag3JvV5iLgpFvg9Sk0aI2MeU3RzRIAOvyjK03N84EhJNxy9hhCr
	 2Btji5vrS5452opl5ytVGyEll+DoAxd8XVmn8l3BhLxdQSmb/mB0AWf4u44wvFlBhhNvF
	 RJzU5tz0Jcw6fH4MITlnhY/YlXkT0BB65tlAOHHcw+lkS71sPjWcl71nuaa6XEJ5omUkC
	 KbTrU/18Gdhs2/EPrNrwzzzCq0CpS48VWdnuzGiGdwmj9InKqVmXL2fYtieXdWNPpZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hEYLohFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA169606A336;
	Wed,  4 Nov 2026 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hEYLohFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F001F00A02;
	Wed,  4 Nov 2026 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803864;
	bh=KZ+cSODzQCgfcBpl6SVJcEIqMlZuev5QB51iLkiBvrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hEYLohFIYjvoBdLuSxCMYOa4+tBioMrRKoOn0Zd/jT9g4EOO9QpvN3p/3FXAzgWW7
	 esXIGQ1oM+hi2SxM1uYJjXqyN2OPSeovFr/0lU4pVqFY/8ztfaE3jYExzg7uSe9hgO
	 MLQhcygksG9R/0WGsdFcJNb1PMPwjMOgyqY6kai8bdC4in3FmxrdWAQpy9U7a6N+zt
	 5PWPnK4J9IzvBj7cL2QpmWMT7SapiHZcNgIhCVc5+62SYGL8qtgdkgqsr3Ni/+ioxM
	 PC+7Ze1AJyXio77uxs2uHyEKkn+IsTCkupZxreazy+ClKBmUnFbt2+FIwd5SedbkL0
	 kTyrTfW2za8lA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH] ARM: dts: aspeed: Correct white-space style
Date: Wed,  4 Nov 2026 15:50:44 +0100
Message-ID: <179380380617.180018.5035897143826922583.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210437.384040-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210437.384040-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=569; i=krzk@kernel.org; h=from:subject:message-id; bh=Okt3ZSzwnfGvkN/VPRaSt/4uaDxDFjo067Mc70YUqJM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60ZFEdlmY28ps779HHOvpcaFb5uiI9gKS045I q3cX4xYIXSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautGRQAKCRDBN2bmhouD 1ypDD/9LsvgMsAEVjEmkOYZG43IflZC8TaSgHFnrB9O0MF4d2lGoamHBT6Bm8H1ACULZAiDjYks cKhZ4tqAa2P11cQH8yKv0P9QaaPAgAOUqag6s5vOPWp0HcGwCMM8wDJApnzmU2sZt/R4un6Ci/4 4OAoFgnvBgTuR3rkJRYScsD4u408LCTYlPVgCU8PZPLtmj3Q0DaXViKgACYykdG5AcuWGChkRbC XzRmn/sJaypEefZgzW+fTOt2zBN3vd/KcN86z6NSg/p6/DI/PL6+Ca34ZF8eyZZndpLmfMeHyNt sd9lWIRhWp5qj/L5yWM7KsDzoHS4FT5wHK2xBAeTtjne3xv6L2+Yt+CRm6w1cP0f9zqAH0uFWqH ul0DSI35KfxCQRSHERIer1YkvmR1Xhs/RPL5Mz5zxjgq9quXmOvfnq5KTft5kS/U+3JCwTOvTHy bQ3DwEcXTuKhDqSnk2ycZbE8wDSAQxu2Sr9tCmp83NWlVhWrZ7P5lbCtPkngEmfVGgn9vqqgYpE ZX8P/VOgAzGVztGOykoGjyDr2jUn7D9k3j++u2KnA+BJYQsrD5qZYxqXhoPiMkwPqHKdxdQax7D EE/N4YHwQPlDoBxPJIfcWnTHI53FhFWKJMzUUTU+uRyN0euIIN8yQLyNUoZhGAeRE2cC/NSZCVK jbohlvttijpc0q
 Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 23:04:38 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

This is waiting for three months without feedback, so just picked it up.

Applied, thanks!

[1/1] ARM: dts: aspeed: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/48481f2f187d2162c89c324c9ead4b6351ea9b50

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

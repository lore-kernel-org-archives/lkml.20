Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CDF3E2AD6;
	Wed, 30 Sep 2026 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794169; cv=none; b=DQRbg7pcK/jvT3PibthjXn/o+QOx0+lEtDQs5go4kVUfYPmSDjKdSn6glSUxUVHYoJd/JLDddaZH9GdAbfAVZvQY29wixR1bCfV/Oy3ZeARPHBVxjq+TWVpYRmEGXCPxkaAjogvpGX+7OXk9zRUjBhtxRTWpxSuHGO0Clq2+iZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794169; c=relaxed/simple;
	bh=g85DarfhHS9VThNV/JkjSKrsZjjhi34Q2e3r4EKcVXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GRfObXeZS9cNdaE7gnN1i0bbepobNsGb/mqVeeXw6XkuFc5y1d0ca2zrzSwpfoFhrtTzGnl19L+o+fXhUC2UxgqXkTRL140vu7I3GyiyyAllynvefvpobHKkcmhX3UyKoS3oc5Wovdo2J0v27iO42CQ0SXKnq8AMCLL1bGqQZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qu5cFbm6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qu5cFbm6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nOkj2/NJ68nu7y5h+AGIOhr5AdQrQ8tR9kgRub30cxI=; b=qu5cFbm6PMl2tQg99IiRVgNG89
	LGuamJDMFlPTNYegtS4dTEubvqlAZyAMtoaaej29CmA5HPa6si+t4qn0ASCU0fznj3fZF7J1mt7PW
	iax5DDvyfGxGWrJaNNmCBr80psChQ3qpGfpkjL7Gd6otk0/W5EYa74XMRLU2TfFsZMqd+8xNv35oB
	R2H7cYHnm8XYuaMuENjWJMu7XsVqggwRbz+BurC5ZB4Vbh2XETeQe5uzw3o4R9TgV29N4tsf4Azcn
	ITR/2HIxl1feGDxicgfF/DmMT0d/g1RbU14y12hCTBX5UcTpYAY83z4/vwwu5+pZ7/3ngAiIGe8ck
	Tnr/mLgw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Rapha=C3=ABl=20Jakse?= <raphael.kernel@jakse.fr>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add supplies for es8316 on RockPro64
Date: Wed, 30 Sep 2026 20:49:10 +0200
Message-ID: <179079409726.2398180.6334756596993767242.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922133643.2730265-1-diederik@cknow-tech.com>
References: <20260922133643.2730265-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Sep 2026 15:36:22 +0200, Diederik de Haas wrote:
> The DT binding for the es8316 got 4 power supplies added in commit
> e9966d450b46 ("ASoC: dt-bindings: es8316: Add regulator supplies")
> 
> Page 28 of the schematic for both RockPro64 V2.0 as V2.1 describe those
> various supplies, so add them to the DTS's.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add supplies for es8316 on RockPro64
      commit: 9f587b25d9db29d180a1e483651dddc80f898db6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

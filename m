Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00D34A3841;
	Mon,  5 Oct 2026 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223772; cv=none; b=gVXGGBOwegYSplDOxsCe7jQIuXow2olFgTFFxr02jBjdfHc1AKyl6YRdqOV0M3Kct3e1TePkZGzzR421yqTR94CjiZq1GjfmNDquOxtcn291pIORmfZi1u/3w6Yi4/YOOYzKOQyWXS3Hl9IaXD+XZvSpfQ/Sl3V41ZIQecE5YtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223772; c=relaxed/simple;
	bh=m63eG4EQqCvB8LtSO/48HhC5Ni1xS6bHRJzac66SfSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNS1VoDD3SXsJgm2+i3YNeVGE9kXlT1qwFR3L4ckHf5l/GZKOZ2C0uC6BabcruRVyfzODgZwARCu2UosVFvZ1acB5pJj1rtSIr+MxL2xRai4eTOYOoBqpUltmyRW138EHAPmiDTbioiaTDI3r1hkTkMZRy8ZYtefOYDEc7kKpfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=wh8lZYdI; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="wh8lZYdI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=KWSjVCVfhYPrZE0ETR+lrH3OHG2RwgKAy0qCp+LBWOw=; b=wh8lZYdIq/+MLr9OmtxrVg5feF
	wI8VSnydL3P+HMY/5BjwvsD2lnnS06rSgU2W8euhhCDVFrefnQ5PCU32v/O7zKxhLGsOt2R6qFyxh
	LwRR5LelPnF25xPtDCvLom2b2ER2TWO0iUs08pyds84ppCK7xdd2KEzTnTM34xe4nT9DVQAdFJkLA
	gMqrn4CzaLBO+4naoyBcls4HYaJ6wiUkERUaXynfy8M6hRPA5FMdGM5rVR9NNB4e3JWF2XLJqlKyB
	jFb2VWcrHXvg4e/81tr2Hl1rjA08pjLEgByzNAMA0U3qSfrxPBv/IvsQXd/Tr//wBAWhOOf5jImut
	+joamz0g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amin Gattout <amin.gattout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v2 0/4] phy: rockchip: add support for the RK3576 MIPI CSI-2 DPHYs
Date: Mon,  5 Oct 2026 20:09:18 +0200
Message-ID: <179122375594.3298998.10291240183600049512.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 12:42:45 +0200, Amin Gattout wrote:
> The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
> supported using the existing phy-rockchip-inno-csidphy driver.
> 
> This patch series adds support for this variant.
> 
> As you may have guessed, this is part of the efforts to bring the
> support for the RK3576 camera pipeline (VICAP) mainline.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      commit: 21792937b01b9c36c9a1c4d039f3e1883856157c
[4/4] arm64: dts: rockchip: add csi dphy nodes to rk3576
      commit: e68360ded44be19051df2cb7e121ba7afd52035e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

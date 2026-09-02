Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973E4756BC;
	Wed,  2 Sep 2026 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347507; cv=none; b=d8VL4o4wfZIZmtX2gqvv/lZwtGUhbcDGqErwk51+G8g+wuJFP/fnK/Ndc5vZf2hQGhywxOC+ETTMxbBMhzgk4rsDvY2eqNZMIbM1cmNTWUvu53JD+Q61uoQ/GH+7iChM0hXnftFK+7ldNOZoEe+QHut7Ex4YcY2ixmkO7NbvKrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347507; c=relaxed/simple;
	bh=giJIw1A7Y50KHDvsBsmNl0+iveF8ucPxXjJTOj7gtJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WO/z36GikzO3uRlWzzD7zAcG1en9lQDM0Cf2u6kWvsC8oNEfD+vKW6Q7ZFWeQNikenDY4ELn3UvUVjyvgs1CJnrhKPgWUYjuQXpk0745gRfJOGAH9MM0hHkbt+1An90IUA7M3zGgmAIVC5aY6S5k1osxc7nOzuRCudczjaGab08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=J0XKTeuR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="J0XKTeuR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NWzAh8NPO04rtRLnNCeigUoQRZfIm1QlqA5u4uhqbpE=; b=J0XKTeuRjTzRKJub7Tyz7N7QFx
	aD0wgIa/Xo37ePrta76cF2xJ7dWbhw7SYWMdrEdXeQ5f80B6SjkFwyaOEGAzMafqkATGjQDqBUqGb
	OzOUaXc0/+4cNPsgNRdzmNh2zQtfYRx/lU2Uzhn6uHhg6ubDLQ3NjZCIiGhUJQP3aX15nIPabf4GR
	2SAho9vaeL8dYhCNs51sAIxCs1AIuPrQWm/uw/+dCm75QukEymWtSYKxaQX9aqVqq2RYhfn4wSoY+
	L7r0OkBdo6b7n0eh5Ycx2cbO0btUpSomxCiOHTMmq/45KsJg1v8e7+OLH2VagN/tgNzlOLevDc/oL
	JVs6DSVg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Cleanup DT description of NanoPC-T6
Date: Wed,  2 Sep 2026 13:11:13 +0200
Message-ID: <178834747217.2268650.5352835281518759084.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Aug 2026 13:43:00 +0200, Diederik de Haas wrote:
> This series cleans up the DT description of NanoPC-T6 devices by
> - Remove unneeded nodes
> - Align pinctrl names with names used in the schematics
> - Fix sorting of various nodes and their properties
> - Fix an unneeded pull_up
> - Switch to using I2S0_8CH_MCLKOUT_TO_IO for audio
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: rockchip: Remove unneeded vcc_3v3_pcie20 on NanoPC-T6
      commit: 05956cc8d96b41cee78322d5fd96365e1755cfd5
[2/7] arm64: dts: rockchip: Fix PCIe 2 pinctrl names and sorting on NanoPC-T6
      commit: d10b733bec0bb2949beec3bbc3625a9909711602
[3/7] arm64: dts: rockchip: Fix hym8563 pinctrl name and sorting on NanoPC-T6
      commit: 21431b76fc0380bb60ec6792492fbdc282847120
[4/7] arm64: dts: rockchip: Don't pull up rtc int pin on NanoPC-T6
      commit: d936b4164c9fef5e3d5a12a4f260c7bd2413f83c
[5/7] arm64: dts: rockchip: Sort usb nodes on NanoPC-T6
      commit: 6c4aacc5956924fd38703b95df7d67a650fb2db9
[6/7] arm64: dts: rockchip: Improve sound config on NanoPC-T6
      commit: 7ac01d4ea7a2c0074d3c92da0272baa6c1591b66
[7/7] arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
      commit: e4392d3f56f686082f62e27131f4ac233ee05ac7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

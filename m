Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D04DAF8E;
	Mon,  5 Oct 2026 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791227229; cv=none; b=IONDr+Gev+mQrPmXtCMSSJTV65pU0bXwX5QQQxBpyfQl69xEAiX6RWpSmQGGLaaUsizXeHSNutU09wOCRmc5SXlhsOXmsNfdAtiY1OeOxMlNXTT6BdJSbXuAf0sA12IDmpPoWFD7QCnGDpXw5ANOKMKRFL4trcoZtpx8guvXxNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791227229; c=relaxed/simple;
	bh=iSEVROoxaiVnWebh5umlgYtbgxY4u4SRPxiOq1nTnv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lojMKDoB3KU4IWMMPoKWuZNKOuo7B+3gIcOscKsFzvh59CfvcK9wljG+h0LPn1/ipKwc24rHNpjq1qjFcnRlJNtPj846aTnUt/NkfM4gEdolDYDJWRYEJzU1uS1JSiMp15pJTfcuYCnw81dOzvyvuR9oXRBgyt7wHWr0yY5R2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LuzOGfVv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LuzOGfVv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=69MHVnGdOAe0SajgriMbKOljFABccXRQ0VGfA+upUvo=; b=LuzOGfVvoW9Jpv8B/8hUo0ZXzQ
	S0jPXwmSOKae+3uANqfqfxTClfmCwMMRiksQSY236dpdqm1PCPW7HB18LRfmvyMqeitBpGPfQFRAL
	XJ62YU7IJi0YkbBXofkTgSyo1ANHD9k/XgZIKrdIzpGW8wNF59tfnrYNPJYleFodMDRUDcnXnuqOc
	+T5/C4XPwNgX3vLsacgau9p8XzncCNXXq1bLA56Coe20mnj3tBYYsJU0MTOHXzBIRL9I/KqKfycBz
	O3lRq4TLpy3HXnZ/p+DbWgf9Wtc8Hmv0932KeB0sqFttWqOUjQs9Lc7GRFOYVNZWR16U4FV2e8Jxb
	BFVHJYjA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amin Gattout <amin.gattout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v2 0/5] media: rockchip: add support for the RK3576 Video Capture unit
Date: Mon,  5 Oct 2026 21:06:53 +0200
Message-ID: <179122712929.3317128.1173871776565894592.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Sep 2026 17:29:56 +0200, Amin Gattout wrote:
> This series adds support for the Video Capture (VICAP) unit of the
> Rockchip RK3576 to the rkcif driver.
> 
> The RK3576 VICAP features a digital video port (DVP) and five MIPI
> CSI-2 capture interfaces. Compared to the RK3588 variant, the MIPI
> register blocks are laid out differently, the ID_CTRL0 bit layout has
> changed, the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1, and the
> capture size is configured in the new ID_SET_SIZE register. In
> addition, the pixel clock of each MIPI port enters the VICAP through a
> dedicated gate in the clock and reset unit, so the VICAP claims five
> interface clocks and five interface resets.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: rockchip: add vicap node to rk3576
      commit: c9f69938f459e80471759008ce7504a637e801f6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

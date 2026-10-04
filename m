Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDF3F1066;
	Sun,  4 Oct 2026 21:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148653; cv=none; b=QB32Li+G20ylec+r385PSaHbjX3JG7tViGLWmzuPgq69PgvhCZSGSbrgA1SsQpX/VL/Enfl6ryxnOCNsIaeiY9mrylidEtBFxzl929Hvk901QH6ULi9BtO3zh88lcrCvGk4hBQKBSSjAP73QmkejGQDPSgucCC+/S677DFBQKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148653; c=relaxed/simple;
	bh=6bAiZD9tk7SgBSs7rcDRgXPd0REu5Es4SE+eYuuEevk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tADplU9WRzb0KgrrKPMDKsWlFxO6jJaHM3w4BFXTntZ0amO+6mCoCrlWLfdlrpgtx8ZPX6TvLXJfAxa6XNG1hc3MngDpTkCZakwmh0sDRvCNGnJex1TiZ6i8w0qjf1ZC8lKxe433UL8ImyHkb+4w80DH++50ZwCR0JToFXoyam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ibdYPqeu; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ibdYPqeu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dznMhbarLMivAgJOVrxX3y7MErwS1c7oJy/giVli5uY=; b=ibdYPqeu4UvBJixwGgOV0bR56B
	grF38h8+aRBuap2gvI/pB76vkbjwVNjbDmxCRRqLZlPfmdwR1IaLVY0uK652c3xaI56PWRHY/6QRJ
	wJlx4VscCBidege7nnpeWLEa/cAeLY3nF8cE2qYbRvk4kPcqg56pGjLoSMNEUY50lsSfvO7FrhmCb
	mcllAv+OytFnvBGN/M6VC9DMPo7Z/XZGVbUclj7SslfP3Si/mGie2+hoN0r66yBFuRU5UcUWZtIsL
	h/fAXw2jo5FJ4cTs2Hh8AUvrRJqaMteazBEV75SQbMVcNoSKCrRLUNEOxy5ZlIrPb9mFPvKCui8Uf
	h9gcOeyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Use GPIO function for PCIe reset on Orange Pi 5 Pro
Date: Sun,  4 Oct 2026 23:17:21 +0200
Message-ID: <179114864094.3283966.7199370518358824006.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002025746.3284691-1-dennis@ausil.us>
References: <20261002025746.3284691-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 Oct 2026 21:57:46 -0500, Dennis Gilmore wrote:
> The PERST# pins of pcie2x1l1 and pcie2x1l2 are used as reset-gpios,
> but the default pinctrl state muxes them to the controllers' dedicated
> PERST# function instead of GPIO.
> 
> Linux happens to work because the pin is switched to GPIO function
> when it is requested as a GPIO, but the devicetree should describe the
> pin function the board actually uses. Bootloaders such as U-Boot apply
> the pinctrl state as described and do not change the function when the
> GPIO is requested, and probing pcie2x1l2 then hangs.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Use GPIO function for PCIe reset on Orange Pi 5 Pro
      commit: e95e4fcdc4541e999888f297174e8f6f5f5f899a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6210472771;
	Wed,  2 Sep 2026 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347500; cv=none; b=INl/LkWS1opmRy4NcaFm1rGXDEElpRb0yDBUIRWwdTWe7C0ttJg+bPrungL41gCzUoI/XOc0FkcU+qznwAl2bqCZDbT6DLYojEr/AF4YTfojJBWpqBcOMcKp+M/1lHuU66Bas0/qFHrhklmWnwjErRGYZenhb+ueKaaGXXX+4yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347500; c=relaxed/simple;
	bh=0tGEZz11Fr+EPKITmYlwrS3aRdG04fIRMtvDN8anP0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqR11z67nHO+e5m1qmwGvgIDb3p1sE+QTzEQCvAuaLOCfx/R/P6wXvynw2jJj7WLYHlUUY2lju1lyc05r+MGMfjq0kR4fbQ1tlBv6ySnRZB8O+qSkQ4UCMcV/vw+xeDN+h0PpkvioMQd26t0Te1ffSQAW12pAyj62QsgH/9Py7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=J5MFQB1P; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="J5MFQB1P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Y+Lnxa8qAtl3sfnYbsfNIbtAod9H5VSN4WCi19YjAwE=; b=J5MFQB1PK3ZEcm5ibvQufTLHUS
	HWpV9V6qfQEPIkzcAtU3BIHBZ0Kt4DsNOXF7nRLahualDqKSoOHbNfWjXBB5Lfe/HQDU0W3SQP9Xl
	jN8iIBtLqash0N94ZgqfWlY/5txdT+2pb5nCCvnLIvgcenvrJCVHyN3kP0xU9Bi/Xmi812q7mDJjA
	6QRBPrcIfVjXNBMhqmf7O/GViI8XeKvddqOG+oOLNnTG1Cg51nLxekReL/x0/aFoi2lHzJyaF1wes
	+0HL/cZ8EKyrGWK2cf+4Dm4ECBs0g0FOeAaxfGJL8ZGjrjcSa4l0ovZgVLAD02MxalzNKLaO01rUn
	EIG0jseg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Cunhao Lu <1579567540@qq.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar + enable CAN0
Date: Wed,  2 Sep 2026 13:11:14 +0200
Message-ID: <178834747222.2268650.15149858790607663038.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
References: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Aug 2026 16:08:25 +0200, Quentin Schulz wrote:
> This depends on the RK3588 CAN driver support series:
> https://lore.kernel.org/linux-rockchip/tencent_76C8BC251C8C3C068C23BAF859351DD3300A@qq.com/
> I send this series early to try to prove that CAN2 also works on RK3588
> as Cunhao Lu stated they only tested CAN0<->CAN1 loop. I cannot test
> CAN-FD as neither Rk3588 Jaguar nor the Haikou carrierboard for RK3588
> Tiger have CAN-FD-able transceivers according to their datasheets.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar
      commit: b217437b8f20cbc745d789ea99244274b9dc592f
[2/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar
      commit: 7aa165b62ccaf340da22c517074e7c6853db55cd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

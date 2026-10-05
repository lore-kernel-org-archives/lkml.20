Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23673369236;
	Mon,  5 Oct 2026 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791227226; cv=none; b=QePGMrWLepjYNDeeh5+LipOPp+b9I039uSplcnUHhDW+gJz5HBXI12UFFX1MT1jh2XxBoHBkJXazdSpOxMHs3aWNrm8mOMmlfwPyB57RWDCZywEVkhlEp4nSov+YlTK9AomIxyEVvRV7QrSUEtdi+VWNH61DPQvM151m0iYeQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791227226; c=relaxed/simple;
	bh=1S8Zl0mf0dDsraJZBSbnCfNnO5dkt/iXG3na8mpRpbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qB2YkkCjcuBnzexQLleNF4rkqTBMwzfQyvRXE+frQhAGbNxxTKuHv3BXpKN//KiLLzOb5k9hMcHw2Nkic6q2oDfucTdEZRwWf7S7gv89E9X4tUTyjSArZId/Uz3p1M8PzBArEdh8C88IWSbeYXK+iOwKtOk6ZZcZg6dg03eUGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=b7fTSn3q; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="b7fTSn3q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2aHfuEbzIFM5SKQ3RDfYhX0clrFStbhhg1qVmhCdGp4=; b=b7fTSn3qHNbB6auHR+55ZWRdmk
	1X+/mkBx9+EqouJ457B2/K56TPydv4UORugGm2WssBPazNa4r/s/+KaGH4WDX0Yj/tLcx1gv5BOZg
	RDOOGVBjHJ4o4YRTyWGAM12C65BD4uWpZxgZ/RpHUfnLoFivqj8DSVThJ2uUQoiX2Mn1aTyIX4mF/
	MjHXpDlb97x7kG7nkdcz9f7s3oOjEJVGiO0mncrX7WDXRhFACp062tEH9HbPqmfls1E5cRxiYjKjj
	oifUjKTGQs18V2IGQJ3pm/TTdS1DK56oLxk/OFZOZ17UU9w7GNU4W9nOayBDq0158CpaGnvHB5pUx
	N5p00AhQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Riesch <michael.riesch@collabora.com>,
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
Subject: Re: (subset) [PATCH v2 0/2] Add MIPI CSI-2 receiver support for RK3576
Date: Mon,  5 Oct 2026 21:06:52 +0200
Message-ID: <179122712926.3317128.11498761891958238263.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 13:56:39 +0200, Amin Gattout wrote:
> This series adds the device tree binding and the SoC nodes for the
> MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
> same Synopsys DesignWare IP as in the RK3568 and the register map is
> identical, so the existing driver is used unchanged via a fallback
> compatible.
> 
> Only the two receivers fed by the Innosilicon D-PHYs in full mode
> (MIPI1 and MIPI3) are added; see patch 2 for the details.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576
      commit: 5a610d237f689cde0a37a8fb3fb7c5a47fef0f84

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

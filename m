Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604097;
	b=klmGSBJV4kuWvjuRxc6Mnxeuzkc33Vcw1+G9rBnWEjdxqxmPAZiEophGQsAze67taQlK
	 f7lZpZlJqvNiID5NOffeI9gED9QxHvfajF+25C4q5qr3HsKNQQlFkkZocleCTrkmndDWL
	 r0GcR5hYTXUS6UJRtuKzFId0zzGir8fpUGFg41S+4op8XL44KKVRATz3Nc1gjpeTNBSmd
	 MsaDwvvuShP9JOE6haRNdguSC8O1Ru5L5SDOMqGP9mr8cz3GTOU1yu+psDWMtmMeXlbUs
	 cGS8A4SVGokSAtQSt4Tq5SSpS2RzNAC3ADGBCNWPmJwP1hdOy6fWs9TJIIunbfn1bLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604097;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uhrSsfkZelttWvoilY1I6PmftUCwaXRwT6836hZLb58=;
	b=ZgZ7p2b6CxilZFNaxItCV4f+PU/dtN+5RE5bB2JERi4OVFRoZIgt+9HiPRSWUvQ+rpN9
	 09K9j3QkelQd+aCS+ccVoffa1b8aFowRnVsoiSm3Z2xPJkyroNvgUzzoURkF3+UZSMC1I
	 gvRefk6QRX0LInnIAXLKaZtblTUUCfCR4ynoevqc9frGKa4fHBK3IrETDJvEaYB9hJo4q
	 JtZOCklWLbcgti761j8bxcz51zw35UXDx9Q076jUDsnAn7hdGxO1/zi/LRhl4jwE9eevp
	 M/j39KxC0pAzGt5zbI5uUeYAxLE3lhUnuTMGuayFQeY3yEG1xwSyd+5hSxnHD13UG+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nZIhhgZd;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBD3606A8A5;
	Fri, 13 Nov 2026 21:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBD3606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nZIhhgZd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uhrSsfkZelttWvoilY1I6PmftUCwaXRwT6836hZLb58=; b=nZIhhgZd1BDwsr7gqq3pDmzr0y
	OkzTVQekJSOoHOCTdGt4OLee0rBFy4DvWXg3zf6nCNeHeSkLrzG+Uy4byNbYhiJJY47gYiskWgJin
	m2mrxyZSozPZUuPIlxnw1ZyB+nDnxTbzWcemNXqEfEm7L4IMviMwC3HKt8xj5w4BiEbl9L56lFWsa
	V840/FGeax3D9SiJ8XCffTMPGsmme/9bpOs34LeWq3YAh8zd2uWs0inbPbcD6A40pLuR4OBOKciEp
	SVCVK8oaTQAA3avGP9amEEroInVrCxVx7OjlJdcgPsCkuWp3kCL2PEWfExo56keHFcv0e8JVbfYN0
	D5uQfp5g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v6 0/6] describe RTL8125 PCIe NICs on Rockchip boards
Date: Fri, 13 Nov 2026 22:08:06 +0100
Message-ID: <179460406449.1165597.15463539316974362465.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
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


On Mon, 09 Nov 2026 13:32:15 +0100, Ricardo Pardini wrote:
> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
> NICs whose PCI function nodes are not described in the DT. Describing
> them allows for stable ethernetN aliases (matching the GMAC alias
> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
> stay stable across boots and U-Boot and kernel MAC match.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPC-T6
      commit: 4eda11fb5710e3de4305d927ad7c9393e023108a
[2/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 family
      commit: cd745c39406cf013a468743426d4f367ab62b33b
[3/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on CM3588
      commit: 2184164a940ca2379995b43de0f6c9149cd65a20
[4/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R5S
      commit: ce3c2a83e2469a7a913fe2b0e0582de95894d7a0
[5/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R6C
      commit: 1d3e2e77edc323215df7a2c3b1aee0e3ff8da38e
[6/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 ITX
      commit: 44020ac2d5ed7b5cce56bbfd29f0a697f70d04d6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

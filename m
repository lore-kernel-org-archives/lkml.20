Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571402;
	b=dxXWC4Wdoqy7iuTDUhoCtL4MRQL3pPfasZmvlPt9SHuPKJg1kWzW6w80ojYCAvoeKmTP
	 q+DJ/qzR19w1Re8xsretkPKfpJJW3Mxs2BYHhpbORaJDlAT4u9CUOXi9qK0Pe7E1wi4gH
	 2dH3kC7XH74SCyxuxsMxnnRSYpKW3tc1weg388BixO2YtmFnOX62ZEOqHvO5K8a9Dy4Hn
	 TsbZgruKUpVht8OgylDWBpMC5XZhGnKKN0RKroUzk/5KGk3YDHD9z8d5fpQ5HZBeYOmSw
	 8lsjLU5YO+GouIz9f+29yaqTHEQ4V8/jDr55qZEhuxUWj3s+GwBRb1y02hRyZTCXWcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571402;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=D/8ujQZQqA3V4KDGStCwEnZN+ncI+5OkOUdViJ1Jw74=;
	b=Ios1ByYGBiUx0LwP+IZJE4TO2JYe715rvIDosPzwttskglieRQuZjJ7ktRUreo6ZmYs6
	 j5mO+ksbdxHCtMsDoZclxa4ta03rEsjL0flHVWCe/XpfveT/Y65WT4Lc/UBcREMwY29el
	 1xDZ9zN9kzimpH/ud9iMloDapuwIe8rcOQKTRwxJHkJiBOu5medJPNjw1H4BJbfiPUaZB
	 +3mXj2VWAPc088gljd3oKtFTwyNbWlZTt9cESSKa+UCv8Y6E6ik1xZt38V5/z6PUiBJwy
	 W324uA7BqBRvT6qPu0HqRTiampBD5Hz6beSMXWN7nibE48ieeZShBed4oxnqKfurrrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JtzFVbFA;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FFB60701E6;
	Sun,  1 Nov 2026 22:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2FFB60701E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=JtzFVbFA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=D/8ujQZQqA3V4KDGStCwEnZN+ncI+5OkOUdViJ1Jw74=; b=JtzFVbFAof+H3fhSP83ULkadMA
	XFFLc/PIYLWHMwazH8l7OFZjRL7HWSgxDx1M6KYo4yyOxwvEeBmetFRJk45EQi3PDWeHa+akf3Gar
	0fP7eQbP+4n/4sPeel1LSHGA8dVneA0OTVw/ksDHrJwKTl2pkWhI5170AXCldzLhL5Y2Frho12qZo
	x90y4HdI+3c8aUZ85kIvK+8Dyrm9vfzWKabz95wIVdSMgkes3oNDsON19TwXooG93xXv0eKAyOecy
	sDyqbGgbVtpmNSIfHNof3eFhWK7JZob89HlteTdCBhlbZZ9+vWEEsWRpCXM7XHXB2ds/i7fs/5HmZ
	pZFkjhOg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pragnesh Patel <Pragnesh_Patel@mentor.com>,
	Akash Gajjar <Akash_Gajjar@mentor.com>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Ethernet PHY on ROCK Pi 4
Date: Sun,  1 Nov 2026 23:16:07 +0100
Message-ID: <179357136487.4108155.14582392361457902889.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025-rockpi4-gmac-phy-v1-1-69ce4d677189@iav.lv>
References: <20261025-rockpi4-gmac-phy-v1-1-69ce4d677189@iav.lv>
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


On Sun, 25 Oct 2026 22:55:51 +0000, Igor Velkov wrote:
> The ROCK Pi 4 GMAC node has no mdio subnode and no phy-handle, so stmmac
> scans the whole MDIO bus. The RTL8211E answers at its strapped address 1
> and at the Realtek broadcast address 0, so two phy_devices are created
> for one chip, and the netdev attaches to the one at address 0.
> 
> On system suspend mdio_bus_phy_suspend() leaves the attached PHY to the
> MAC (mac_managed_pm) but suspends the unattached one, which writes
> BMCR_PDOWN into the same chip. With s2idle and a MAC Wake-on-LAN magic
> packet, 17 of 40 cycles did not wake.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Describe the Ethernet PHY on ROCK Pi 4
      commit: f8d406e3435ca62299cab6975248e17eadc7166b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

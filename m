Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571395;
	b=BRCmbNcMOTmFUpGXtX/ZoD9ozLisXRbYlNSfbraVZXFDhh1uBkyJEtwZkS0HD4h4rV7t
	 WGrjw1WCzeks1FIfLXjqEIEaw8ZszgruLpPLlqROiHNTmN49atWwIZqjwNmyBoDVZcS2G
	 0NyM8iIWdbqPxMf6txuDjJ15eNozriRghThTNvRiulH7Fs0jGkNAQ9DjGbcodarLH67cH
	 +yQfpzeVktOG94z8SLU2GFJcrmiblKuvnS+A+2J0wlswLJ6FMUcQOOd0HzdCmfEvOsO4m
	 qB6CsSaey4owvyn1sulrQTbnzdbeBLC+NKO9xRl+K28UuWF62Gn04R/1ZJOtqadbGYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571395;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QEO/sD+c2E6Sj9HbxkWZHgx/K/Tm9t/CRYMgnWIcyi4=;
	b=asOX+j77Gmfhs6NZs3HwIRvNgmdvfRvqVk38ySSUZb/Csv34bS7aKAFIf+VM+ZAEs054
	 kU4e0IkLDBls9/LWJv7nqvBNOsRGSokELyWch8X1XTrnWPl/pHx0LSH8ELJdY1/mKmrkG
	 Cn8ffprHyjrl+7KwM8NBB1PLpAGDBU3xJ4yPe4y13qSpgaYfDA22bCD6HqNq/0Es1YW2B
	 p1UUP+jSd65jqjyk7rj0n69RLkU4+dX8ZObQoV9UhLaqx2n5es+e9IWxVuOU9N0BjFn3d
	 u1f+7Ix+Lhl5WRpwT7FyAZioQnn1vF1B2ThvISWBAye+1dTBzNp0DNC4X2vcz0+Y9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=OGHnGUhl;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208A606E533;
	Sun,  1 Nov 2026 22:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5208A606E533
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=OGHnGUhl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QEO/sD+c2E6Sj9HbxkWZHgx/K/Tm9t/CRYMgnWIcyi4=; b=OGHnGUhlMmiOtpmvL99Ph1+mni
	z63rLqlPa8OBDtvz7NqL+zjcSpTL6MKJLpwlKD+A2mHYv4b1+jFRZG3HDrv5mmNeVT4vIWv4QJZQD
	b/cBIqOA5LSUWqr4JdxO+31FAhazjOeawWF9JbvvE3YaDqTRnbGer5PjzJJubyoJTTWIAx+wlLZ0B
	P0RM9mmF54M5n8fkf9CJ2eSA70oNQcOFSXWtI22N0exrS1YVCbJTRr/Va57m1JDgASa70s+gsxD+o
	AbWTx4V5KSEeQl2BrDO5xHC3vh0SRnZjAt4QHWsykiS4wXc7j4WK54hXa+xRu7eGpaKWK80/Kx7mX
	Pd3yIkFA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Miguel Jesus Seron Gonzalez <info@gluon.es>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: odroid-m1: use rgmii-id for gmac0
Date: Sun,  1 Nov 2026 23:16:10 +0100
Message-ID: <179357136499.4108155.904162787901062784.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192254.6933-1-info@gluon.es>
References: <20261019192254.6933-1-info@gluon.es>
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


On Mon, 19 Oct 2026 21:22:54 +0200, Miguel Jesus Seron Gonzalez wrote:
> The gmac0 node uses phy-mode "rgmii" with the MAC delays
> tx_delay = <0x4f> and rx_delay = <0x2d>. On some boards this TX delay
> does not work at 1000 Mbit/s. Dongjin Kim reported iperf3 throughput
> below 200 Mbit/s on REV 1.0 20220613 boards. On a REV 1.0 20211112
> board, TX from the board stalls completely in iperf3 and ping loss
> grows with frame size (5% at 56 bytes, 20% at 1472 bytes), while RX is
> unaffected. Other boards work with the current value, so it seems to
> be marginal rather than wrong everywhere.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: odroid-m1: use rgmii-id for gmac0
      commit: 781227c237f16eaf14c57124cca854a5faf8a121

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

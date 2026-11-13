Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604097;
	b=qpy/8VZ9Noceys+37udupxAXbZlOGKpnQaWNXA+P5ZOAxxSUBGv+xE6AoCBG13pmelFR
	 UdNeBEEw0zqVeWP1MYdp/1R0LiCB/q3k2IU4JYwjx7xzWB9KZwGhzHTDqCJCDbSzzPCVy
	 zKegyI54wKYwJbjiziN9Zxonz6ASNPlIC2nabcb9bz7obyFTwkjeKpBomCCopKQgSQwZY
	 EjYRmt0FQAKWjTpM1jF8ddhbYd8JCEWgiKiVZQtFmEBIUsjyzYKnOfvf/t9conNVB41T/
	 nvAS5jt58YzMXeGJ446m7kw1BYlEfcRJfgCaIIijXYtsbar4judlb5latByne3ooAVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604097;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nTWhZFEhQHsmtsz8gu1pvZwk6WEInEV5R1xDIdW6aS0=;
	b=PzM+uVqWXfQpUrR03vSlEe88Wui32U/amNYJeS7SIQjwGtVtQkwakf246eo97XmdQ0Vn
	 b9QLHjrevDHlww10AJ179DinL2bs22u7JEoPg2FUQD7/iyY1HfaiH7oc43xNLsGaxKxQ3
	 gXKYeyiV9FBNqe5E2mj0zHFdkMzf9pbrYpAzHfRjgeFBB7PCvj91dX9i5eWLFcEVpMe8Q
	 3B0xZNoYUMR2ACTvzVXb/r7VmcOC7LEgl0h3jrQYKRMPrcmJdgZb/FN20MZNuOs73Wz0c
	 GQBrwN5sgEOubKbkURW903Ho4R/jw2RZfOTdS9crITaETZke0jRwFw6Jlkqh63ERf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=q7aAchcl;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D58606A882;
	Fri, 13 Nov 2026 21:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D58606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=q7aAchcl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nTWhZFEhQHsmtsz8gu1pvZwk6WEInEV5R1xDIdW6aS0=; b=q7aAchcliIS1W978NdKZEiA7pH
	JrLAMjIddCUv9BUYvV/7IhmKAySpbROufMrQ2rGAyxvZU5vJs9ji5bs+805t7IKRupIlvqWaVhxqJ
	48EgvkQXJYTXQgxjL5WoGnAMMjUd4kBptgAR9dHR1CYl/SpTAxONmlMdOCzQY26OwL+/0EvLCtxP7
	51Ac3prl6nkkiVfzeaKMQZgcQo9JoTS0AZNjfqgIYXzy0VipDqR/L8oEQa8+rYHDWRmI7D3stgCai
	iBDK7yPvCzmAUT8KnuCj6H4yzI20xaxFrNLirea9Ll+MtQ3bk6mAjWF1g/tA7qpOASDPmJ5cY+TlA
	ERt9sCAQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com
Subject: Re: [PATCH] arm64: dts: rockchip: Enable SDR104 on the Kobol Helios64 SD card
Date: Fri, 13 Nov 2026 22:08:02 +0100
Message-ID: <179460406458.1165597.11570162473311943903.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109-helios64-sd-uhs-v1-1-ef8fc370d282@iav.lv>
References: <20261109-helios64-sd-uhs-v1-1-ef8fc370d282@iav.lv>
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


On Mon, 09 Nov 2026 03:45:58 +0000, Igor Velkov wrote:
> The SD card I/O supply vcc_sdio_s0 can switch between 1.8 V and 3.0 V and
> is already described as vqmmc-supply and as the sdmmc I/O domain supply,
> but the card only runs in high speed mode.
> 
> Allow SDR104. With a SanDisk 32 GB card it runs at 148.5 MHz, and direct
> read goes from 23 MB/s to 53-66 MB/s.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable SDR104 on the Kobol Helios64 SD card
      commit: abf495038cc9f0693cecf54bd37d3200d5da942c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

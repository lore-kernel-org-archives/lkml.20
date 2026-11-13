Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604097;
	b=5fbm+0Xcir8tW8bh2U/m+99QMcTUMZLm+w2Mqmc9E1vBq4Ng4427310jBBRCK5uqn7xz
	 crn2zT5zAcgG6iQWMe+lTwfSOCXP8fNabMFBTiJevGxY3ALfJFjMEp43ecjVVQv9BN0FH
	 67FzGbsm7vRHe4xeTxpoPTwJsGma5fquaX3INEcPPgEnW1Zf7LazV+3/c7GXb75E67NOU
	 fcqFor/9tLS5us0kHO85XRqXHjOnZstfrNAlKYQwHMn+6PT21794lPXLczvzS67Ts3Eff
	 A58oZNXwDA1c5qzpqYMhLvR9ttQ3pYjTpKDr9KHQFllbtFlMveCIaGDvxTQYErSvlow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604097;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QuFwSAi/+d10dPqCgFOszj9I6LnlETDJ/cydaZMm5dc=;
	b=DfyZpb1LmkXy2UCx+vwY9ivOTHAC5yLcy9Ssl7d46dL/4Rn2qNX1StFrr8Fzm/ytMb3A
	 eOPrqXyOCLbmQiOsgJ0jOQiTZxg6T9mfaSClDqMZZeIUFAw/1mJ0HFv+L0sByV5infnLQ
	 iQ+K3vS9LrtHRvrpcScui9b7znzkheiZwvYDZwEXmdzDd8dvR1VKGL4i0lWadB3Mp+xFc
	 rTkQssSkTn4gwzcaFplDBX4Dz7jIsKQNPoTwlega6AI6qIpAFTSb8YdHGiP1uJJleVHQb
	 o041meEtg0RN4hXGyWsYji7RoakoiFuyvl5l2BonHqiCDdncvWSkYivDyAwCliB/wAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=HeooFUrx;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01394606A33E;
	Fri, 13 Nov 2026 21:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01394606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=HeooFUrx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QuFwSAi/+d10dPqCgFOszj9I6LnlETDJ/cydaZMm5dc=; b=HeooFUrxRI80cVLbD8RuYzIOAO
	ZPFPV2Kq7Wg+hLjTmJ3qDg3zMaCUU4nsECnm2psXGp2QoPCkUFJU/lI/ug52hcmDHKGVDDsYf/p2n
	PYBnZtfHvfyarN/jgTua30Jg+Dk8GcQGx2hHn+vqNbDI86xyg6n7xzHtE1vilnlYrS/Ag4slcD3DU
	xlLuuM4LIbSQoH8l23PgDRJY/NhacGdHmCDls1Vgfzkjx1PV8F3iW9yLBejm91ytbSbrVKkT9VVJT
	v37QrLbpu5quuVv0VzlA/UWkXT6GQs1X6/VQYIAtKWA6BTgw2VFjTtynIIBGDZIWJmXoC6aST2NNi
	tvr4PWDw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Alexey Charkov <alchark@flipper.net>,
	Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com
Subject: Re: [PATCH] arm64: dts: rockchip: fix pcie wlan chip on rk3588-h96-max-v58
Date: Fri, 13 Nov 2026 22:08:04 +0100
Message-ID: <179460406444.1165597.590397049163238524.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-fix-h96-max-v58-wlan-v1-1-7e918fc85b88@gmail.com>
References: <20261112-b4-fix-h96-max-v58-wlan-v1-1-7e918fc85b88@gmail.com>
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


On Thu, 12 Nov 2026 19:34:56 +0100, Joachim Eastwood wrote:
> Correct the gpio used for regulator-3v3-pcie. This pin was found digging
> through the vendor dts. Also add the this regulator to the pcie port so
> it will actually be enabled.
> 
> After this fix the BCM43752 shows up in lspci and WiFi works with the
> correct firmware.
> 0002:21:00.0 Network controller: BCM43752 802.11ax Dual Band Wireless LAN Controller (rev 02)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix pcie wlan chip on rk3588-h96-max-v58
      commit: e794aacace8ed0f3ee1aa34924e25399d370e039

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571409;
	b=fo+AERO8S63cVTkZh45WccHwZx/nMvlu5w4fFLlgAnB40wMMIqBed6Bm7v+5kA+kw9tn
	 3RiJpdC8yeVq/48eKHYeJOze5+8HQjfw6n+8yUVag23O0SD4icUlYiTyr0ae+/alPbCDo
	 9vp+GI8g8YH90OkFeZlvMvCfQqkZVsLwJYByzxHuSlKCZcRuBzsMpACzjAfCyavY3sL+n
	 Dr4yc+NilX7fqYDCRogQK0W8QPlrDiMCPb/Z5NCa/xmRz7yorZODSWrXegFthrUpgP4L4
	 OKxDfRRMEHss0fb3DCYa/GwGDcTdN+0T8PWE9CfWh3KZIbs089KmfipLvZHJhcqel+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571409;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4Y2ehFsf8JtC09DAQpeBxOgfpmb9qhwVfrzl5WBa4dQ=;
	b=svXbuv2SLiieo61BJqE/wSrfIIllC9qQlUBPENwBjAscXQtc7kbOAEgFrvMzbmoNHM3N
	 37wlZ6Ts0KmD3kPLlg2Ns5PJmYaxZCh4SAxc/Uzmi1FZ9ddkumxo1lP+wANyXoeptTUCP
	 voet8L9jEel2anw33PRel22oheL4QWHwx9HNerUKDZTPXI2SatOX4V8/0LQgf9rhOnP5S
	 eVPE22Lr/mwneG/vexSeY/Av5dtKy+7V1lx4gPoLCsMEM3MMgEHOjE3X/CVtMvxH+ViQX
	 agxFaNjCpYNf3nFWkr1bm3k43Izw7N6Wv9UnLfbUybTMkgwyJRu1QJ0g9jX380trfvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=bZfTDG1T;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4156260A5BD5;
	Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4156260A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=bZfTDG1T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4Y2ehFsf8JtC09DAQpeBxOgfpmb9qhwVfrzl5WBa4dQ=; b=bZfTDG1TIuH4RtSeNhHbvI+f2q
	bWfpC0UGXpnu61J5kXm/zJzoq6nOwcILzFBTeeOhtm+DKRTn3/i573jMJyi36j9PVaDDTBykiaDR1
	r5AzCTorKsE4NvQrQo/S1jiyHxG+4rHQCHPCIvhtVJnvH1Zc8VvrD9Q99OYN8RVlWHM868Jjqk1m+
	iLFZjS74H4W0ZFGKy1MnJyvHBUpDrBJaWtEC5LgjeH5gQ8EON8h2H0Bupwdsah59TXS+pV2JWdwaz
	tmzAPpH6pCfeDyOa8xo2I45LXYk4jLBugE+C3DA76kI3r6l5gnGoVOjkkPA87+XXMNaMf8aiffAtF
	0QQIzTrw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Leung <untilscour@protonmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: add maskrom ADC button to NanoPi R76S
Date: Sun,  1 Nov 2026 23:16:37 +0100
Message-ID: <179357139348.4108484.16587959620452778547.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-nanopi-r76s-adc-v1-1-392993e7a36e@protonmail.com>
References: <20261011-nanopi-r76s-adc-v1-1-392993e7a36e@protonmail.com>
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


On Sun, 11 Oct 2026 06:54:47 +0000, Ryan Leung wrote:
> The FriendlyELEC Nanopi R76S has a MASKROM button connected via SARADC
> (sheets 5, 19 of the schematic [1]). Add the button to the device tree.
> 
> [1]: https://wiki.friendlyelec.com/wiki/images/6/60/NanoPi_R76S_LP4X_2411_SCH.pdf

Applied, thanks!

[1/1] arm64: dts: rockchip: add maskrom ADC button to NanoPi R76S
      commit: 1f624b3b44ec1b0bba0bf219c1d63e127cfa8591

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

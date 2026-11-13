Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604098;
	b=j3dY7mJ6XvAd5yQAfGss18rNP/TDiyk45yf1j7uL4XWUl8q6QNgOuXwKYAE7tNbZ2hEQ
	 nfxuB7xfQCkAvHfAv8BdtP6cUly34YZ/GbohERMPJxVxQtHn/nahNJSv8ObdN1i1lIxR4
	 D/V8ueuouBkl91qyFzELxrTH6sWPHUrOL59zjL2bz7m8w2b5aVS8hRjugCjrnpIeLjeaO
	 9b7hQ/lhKEUw7tEwmO5arHdX9i6YU0xhF2Nhk3PkC9afZLGTrbz7C7rB0ACRTPhf58G62
	 VCs+4Yhm/gTlS4oHSnK9VyfkyqHmMnvdfyJLfmvaAV58cp4koSjeEh+iQ9sTYEfforg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604098;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9HyvOPa2UhLzmeJoxn3FVY6hx1fLNyYLiAGZU5rDFMI=;
	b=O/vQms4qgpWIgeoZNgpVUsr7+1+04c+nS6yz/lk67wd0x5/snqmThJi8NsPzQYP//lcw
	 cBFmlQr1g0Ik/XNwBlAjOHFrcxCROGQ9lU0v4mhYi8YaVu8SS6kNeKJCImWW3Ggxa+btO
	 3guzOPDCTpqhInuTMOejBWipxg+heybrafub7rN7irucNDAu1kEGHU66xBiU8Pmb4I5Pe
	 hO+1PuZ0K3LiSgWl98xFtqIXgf6xpBK2ahicG8HdBMU3w1aNp2gvUJo5CClDvkcURQhTZ
	 Qbpq7vVElBNOXqN3n7MQvmgRUL/rIFAlAZ5U10dplmfs/I12pTIBUmTwBQ+79M3QpGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=RIvUPb5f;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C9606A8B5;
	Fri, 13 Nov 2026 21:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4C9606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=RIvUPb5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9HyvOPa2UhLzmeJoxn3FVY6hx1fLNyYLiAGZU5rDFMI=; b=RIvUPb5fDU60DynvAvDuW4rbXJ
	vuilFTWJBxMAgN7oDMQZT7daazrCvZ3jkoEBJCccTivqbH5NFKEtZL36TcyL/deFE6fEI4q4mLU/h
	MIdDCa6copyv7Kucd5zZ7S2kgz/RreaNh7wkz7+6yf+lP9uUQ56bhB3K03Cua6AAabReO2XynzBfC
	qkrcoIWGKPwY0xegS0CDRpDBHE8kA2oIFnR36kH/eErIHpdx2/BFRIckJtPHR/D5Vu7Bcd1/5JbeN
	TuSMBTWyHs2NvCYyL8sq19BkQkye6srdLU832WTFw9C3Fs8WUQnw1jY+26u0d5k1DNgmtzk33RAaj
	Ad1kRmpQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	kernel@collabora.com
Subject: Re: [PATCH 0/5] arm64: dts: rockchip: Enable more features on RK3588 EVB1
Date: Fri, 13 Nov 2026 22:08:08 +0100
Message-ID: <179460406451.1165597.16868636622919014871.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
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


On Fri, 06 Nov 2026 22:57:05 +0100, Sebastian Reichel wrote:
> Enable a bunch of features on the RK3588 EVB1.

Applied, thanks!

[1/5] arm64: dts: rockchip: Add missing PCIe wake pinmux on RK3588 EVB1
      commit: 57c33a45eab35579a73eb0cf8a742dd54a5e6566
[2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
      commit: 38e2bfcc44fc3694c4ab2aac896ad9fa6abbeca9
[3/5] arm64: dts: rockchip: Enable HDMI sound on RK3588 EVB1
      commit: ea3b5dcefd88c6c433c0c0f05221e058f60b4b26
[4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
      commit: 61e97442ca409f577816699aa203461b76b24e9a
[5/5] arm64: dts: rockchip: Add Bluetooth to RK3588 EVB1
      commit: 914eabb8b872fe1298be5d397525f0a0e39b25b3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

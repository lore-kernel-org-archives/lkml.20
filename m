Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797370;
	b=0W2FYqWJmggeZOQ0h48F1/HgHHBoIvoPbCKa4E3MeWcEtREB4jzQDGWR7UvpvuxLY0Gc
	 5M5FJMwtgDh6P7TwTiZ7+tAX+5WD0zulmHE5vObY11oKFqzBFjxLy27noYC0wy8W6xTub
	 3OcPdrdFfsOdR4rnMD8i8+gA0bPJJZr18iETQzW2Ilx2HB9rqYcLMwSfgEEqL0RhJRWaO
	 /tzeYPYXC+i80uJb6AgWLWdvyXNHgnl5qfpNX8yuMq6X/SAaw7bku5u3QFYCvXUszBvv4
	 5zzfqkIvvP+/70OQ+kJokxBI30ORFp3GClz1HbENdz4Fe8ghSWfOLTy9JpSKSSjdICQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797370;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uJilNf/DuzscctLyLUnhtlaW8CcMOEh7Gq1rB8BFr8U=;
	b=KMu1ERUrA0bEs1ancqbZh/m5BbRM/kahLe0OjJ+VVlL9D6D0J5ve42ehBTu2ru3Mwh24
	 ACaVOIed2z0LAoYS/4rcBB1hC/2NV5BEQmKu2F5wUkDGHj6dj3Oo0HONKy++4SKOltSny
	 26kIMMJz/R4/lOVLti2Ztxvt5dvvYup+sbRqlc/aT4FFRjm3mQK2R5rzkwcNELIjvxty/
	 gcHQ8G5JnXZhJOrrwTEthH4LwqwRmEkZZoDXRk89VOEM+OEJkWMz1pKfYmfNLBe+Ae9uE
	 llbFTKSV/5r2m2fDJzgr8kzkiRuGUfdtNIoqepAW8Dl0nsJIN1/Ley43E3zzdbTpB/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=GdlkD5rC;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F36083610;
	Wed,  4 Nov 2026 13:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 297F36083610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=GdlkD5rC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uJilNf/DuzscctLyLUnhtlaW8CcMOEh7Gq1rB8BFr8U=; b=GdlkD5rChX2w1X58aPkGyzqN0K
	I7MJdxIq98amV+fOJctpJiKV3jDJyDTqhzGdnvgDVHhjKho++BKpOlKsnEOg7SWcAEo5oYtk/NC9w
	ZcU94sJNGEHKJ2MzbpqiofpHczDZGyPF0MJqMM5RD6omxSSYAIjDL4EMHrL6ELyv7CcYR/AmjYn1e
	7Er8449rKWS0JTbPpwokEbUNWP5dEJFv0ybGutfXyhttNA2dYqLqQT2Gp1+E77BjSTK5A9iB1JjrW
	VGJAYESp+6dDN47W+6VwLj8pqE66GV3E24BSausAz/yknM19NtEwBUZ6BH64vPgmMgPaJBS4moRAU
	lD3qk8bw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Vicharak Axon Lite board
Date: Wed,  4 Nov 2026 14:02:39 +0100
Message-ID: <179379735607.665309.15426546617217855160.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730134815.434654-1-hrushirajg23@gmail.com>
References: <20260730134815.434654-1-hrushirajg23@gmail.com>
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


On Thu, 30 Jul 2026 19:18:13 +0530, Hrushiraj Gandhi wrote:
> Add initial support for the Vicharak Axon Lite, an RK3576-based
> single-board computer.
> 
> Patch 1 documents the "vicharak,axon-lite" compatible string in the
> Rockchip arm bindings.
> 
> Patch 2 adds the board devicetree, enabling the RK806 PMIC with
> CPU-big, CPU-little, GPU, NPU and logic regulators, Mali GPU, Gigabit
> Ethernet (RTL8211F), eMMC, microSD, UFS storage, PCIe0 and PCIe1,
> HYM8563 RTC, GPIO LEDs, and UART0 serial console.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Vicharak Axon Lite board
      commit: a9dfb4613bd2c44250d57bec8fc72a08f71d1d6a
[2/2] arm64: dts: rockchip: Add Vicharak Axon Lite board
      commit: 80e2828a00ba4f472289a699727abfd72a31de34

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

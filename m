Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571383;
	b=wlc0kBVuGCfxl19mqGzX/6sbNvMvJL2Jv0iVuLbqbAdtVkP0mwqtMVxZ11xREG1oQSl8
	 lZm5ioe7xq7vpcDzugPlhI0mnf0E5MLJhK3TsbLURI+4zIytwO56E6nkyBZ8vrybXnQLh
	 aZ06knAwEycj1+hbs1l24POEkML6qijmJmXOHsiWCvCbu9eKTmy16QBTAFiAseE1dDL18
	 PpF1IGa/hzL7SHLvGeZIRkZzLsLVYel7AontMkL+puiBXeAXePHR7MR5wsFhedn/mvubJ
	 amKQZlCeQehbB1vE7nKMaGxcHdxnz9IjOwTIsRP+tCnlzNaLFP6hnxBeMUEZg63BxjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571383;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+PSaaDmaOVWUQ+VHhuXHm+ChDICCzay6CedCYV9aBDQ=;
	b=2qnpwEVnPdN5D/DOwCDZL3xi1PgBWUY8py1rGDnYbjP2CFB7zxU7HLhOT044UMjLSV/z
	 6BVxkvSGelLD0rOVGU4ROnicIZBU9juy/1SvDpG0Fye8XiyldMcGWia70xD8EuS/w2gu8
	 bdhFNwTHimA27KFKzcBaO52NjgftSuBviTAC+K3kEiy+/1IH7uUIEeQpgLrcHw8mo38Rq
	 2jikjAqL9jBaRogUI76+vMXC5tlJMP3BtJMVTaPog5/IgK2poO9h1tjqtwH/6NyPoQBXo
	 yhuh9o9+FrsmT1/cexLl3lzlK8wcC99f5gK2jp/qcKtAks0YHmkXYukcP3cz0a5OEzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=OUqoykoQ;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85394606B9EE;
	Sun,  1 Nov 2026 22:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85394606B9EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=OUqoykoQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+PSaaDmaOVWUQ+VHhuXHm+ChDICCzay6CedCYV9aBDQ=; b=OUqoykoQw5+FEa9dg1IfaI3/Wb
	A5+bkqs2+YGj018zeUKDS5sFoJlBQoHa+ogK/4vuKvUyqI4qWEM6hM6NDlz6CedUF4omAchCxXGP8
	isENDwfaU6J66ZpRsyL0BuEiYeEkNhJeS4Ib7eBNJ1Z35l32RlHgb/uGcj/L4NDif9z0eaH4vPSsC
	zd+jV+HV+wovty79e5z3Ku5GWBX1iOGXioMa616tDSW4hm3R/K66xZtP0Bs9ODV6FAtZgJttgMAbL
	7pRmUjtcIoHKOqwTmGVgBepiuQoce1jZ/pPr5L9QF7N0iJT2dRTrfayAzYb95aXodqesT93/TVNB6
	sll/CYMg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add the GPIO expander to Kobol Helios64
Date: Sun,  1 Nov 2026 23:16:08 +0100
Message-ID: <179357136485.4108155.1255031928445083494.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024-helios64-pca9655-v2-1-97210e9aafb1@iav.lv>
References: <20261024-helios64-pca9655-v2-1-97210e9aafb1@iav.lv>
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


On Sat, 24 Oct 2026 22:15:04 +0000, Igor Velkov wrote:
> Helios64 has an ON Semiconductor PCA9655E 16-bit GPIO expander at 0x20
> on I2C2, powered from VCC3V3_SYS_S3. Its 16 lines go to pins 4-19 of
> the P5 GPIO header, one line per pin in order, so name them after the
> pins. Its INT# output goes to GPIO0_B1 with an external pull-up (R59
> to 1V8_S3), so the pin has no internal bias. Schematic, sheets 34 and
> 35:
> https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add the GPIO expander to Kobol Helios64
      commit: 3e8f8468c1a9b42740db986ee07d829696a7b5db

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

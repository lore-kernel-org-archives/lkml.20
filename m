Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86E72FC011;
	Wed, 30 Sep 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794166; cv=none; b=UtED3WV9/A8miwDfQA/J4a568r7uXzBnL09BYuHHNSvh38J0uua7ogAuEh8BtzvL5uxBvyKqMtmS0q8w2fk97cwQyXdbBj80fbKIYXQOqmz6oQVD0C/plbJb8m0YRczUwljGFYB4LI7H/xhKfyyjVOq8EfuCjwlgizUkrpFj+YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794166; c=relaxed/simple;
	bh=xu0qtn0q62gkjnRQ0UggGNnUeQmkLLqjyVoUQlOmjbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oxkVL92E0B+1W91w+hN1GuSkPpGGtHkAiaY6rdLzmGv7A4aVgGz9jRkWYVy6VocpyfEmmX0CVda3giA+dW8/nd3aMINowrGi+5yQRGl2kUUNfVKj7mfW0YtxO1Jjchk6aRtozWFkAHp41VEAR1nTiuji9EKHtfsRFTU7qq27DZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ReTRdxmI; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ReTRdxmI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Onub4mykYcFwhE0hmKSL3j6CDl+1xSaBRFx2WEGfuGI=; b=ReTRdxmIfg0Hye6ZP10wYTJcXo
	HoxN6a0/CEio9IG/FYxT4WtT+lpHnSOb5ZxcP2r8NOi1mmPVwqrSkCjMK5GuBHbL8CENzNfG1ksEC
	1DTlBgjFFjohhv4n8kBpoET4fG+cxcYYr2jXHJcJOaF+d1Zi2l2b/SaYUAymEUDkMfW2Pe4qq2pfZ
	hv353vlB9D5F3bZECkgIRlxw/7cSHuFhd0ckEwoVh3ReMdjQiDt0qnd/PTDWl2hjF9b7pJcSwXSef
	RwgPfBgj6qG7+gCywgP2AwKk2VPCGvTO9k7SQCmWyL2IETpU+I/fyyIIhYnxKc0T47DdG+1SJpIAn
	0cY0qDyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2 support
Date: Wed, 30 Sep 2026 20:49:11 +0200
Message-ID: <179079409728.2398180.15813648897564877390.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919134125.59419-1-founder@crepuse.com>
References: <20260919134125.59419-1-founder@crepuse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 19 Sep 2026 13:41:29 +0000, Mizuno Miotsuki wrote:
> Add initial mainline support for the DFRobot UNIHIKER M10 V1.2. Only
> revision 1.2 is claimed because later board revisions have not been
> electrically verified.
> 
> The board device tree enables a conservative core subset for a usable
> mainline system: CPU regulation, eMMC, SD, RTL8723DS SDIO Wi-Fi, UART0,
> USB host and peripheral operation, GPIO keys, and the watchdog.
> Bluetooth, audio, display, touch, IMU, SARADC, and GD32 support are
> intentionally deferred.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10 V1.2
      commit: 55010621f40c5b129fb0972f07e9d8d52aa6a765
[2/2] arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2
      commit: a2ff7779dd92246bd3e34a2f9600dade3794e6d2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

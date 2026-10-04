Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA234A841E;
	Sun,  4 Oct 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148655; cv=none; b=CeUJ8UeURaSCh1TnyQEtXMBqkHandC8c3bCLRqjnU+/WiLRB6FNMGJsmgiqUNlOQqQIVkyIRRJGmfG2SRoRKOAFSBgA3bnDmoP290wBVrhyMjwP24LYHap724a2YE6xGjcuQ+fTNI66HrCnK9LQcd273+N7ZdG/CDp4u7fgOcRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148655; c=relaxed/simple;
	bh=hHNFAGz3yG5fCdAYVDFCL8Ep5guvqgpIFZ+7cUJrmNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMrkQ489V8129kHskvJfRLG1NtGaemBXwceApxBfv3f8MX8lrc5yplpfqS4D0YaR1kxyTX8AWJgqYJRr4tkfElWvXoDKgY0RXR6fLTPYr1/0D+mYS0by8Tps217CPI9Djud1KH3KL7Y2l9MyzPR+/gi/H1RsspgwRZWOR21NhBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RsaxnTHG; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RsaxnTHG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BSrSEy6BPEM2RoLO/qLhbirfzAUyl0yRgOXrJ2c63w8=; b=RsaxnTHGcrufUsvMhlUiTTYy2v
	WuKXgRUo+IWkkbkfl7LSgw9xTGXM8nre8G1o5y1UEQOtJ6aKCP5cfv6SJoqhqBChXzj1PHWNeTy1m
	O7JJR3LeFf83pq7pxAx7LoHvFPoPstkZ+JpiMNI9u9a/sVW/Cxua1RlUm6YYMh6mwpX8bDGPqIkUm
	qEJlxcWlsZnhWOLkEle3et2UVpMcSGo4wnIXGKAOe74zC3zOjVLMBLumgE1ay956ftix6M9weP0/8
	tGKTgPKXsUv6kkNFZXo0GnPVDySxYep2NzIqm7lfgOYTp4CmjX1wVITMCZuWngcsjkH5IxTGn5XEB
	DAEn+JVA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com
Subject: Re: [PATCH v6 0/2] Add RK3588 Tiger DisplayPort carrier
Date: Sun,  4 Oct 2026 23:17:22 +0200
Message-ID: <179114864092.3283966.12301760233252454837.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002140330.2904616-1-heiko@sntech.de>
References: <20261002140330.2904616-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 02 Oct 2026 16:03:28 +0200, Heiko Stuebner wrote:
> A board that allows easy testing of the Analogix eDP controller on the
> RK3588. Requires Damon's recent work on hotplugging the eDP controller
> displays [0].
> 
> Concerning displays, my current setup is
> 
>   DP-carrier -> DP-port -> DP-to-eDP converter from Aliexpress -> eDP panel
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma Systems
      commit: 3789de522b6902dba9285d69fb22bf2700e9ca4e
[2/2] arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems
      commit: 24ce4253f5f6e65e9faa3f63712cf0aa82d52349

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

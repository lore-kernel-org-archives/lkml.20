Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D7A3E2AD7;
	Wed, 30 Sep 2026 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794169; cv=none; b=PRnw0OhxTvRWLrrFN2b7BXdhuvIxixkwjBs+tzv+WJay1Hwo/SC8od9ZrkQgyJ8s8BLxnQ1lv1tOXGjYCJ7JS42t7Q6q0UK2ePj9VLdlJKNyu4y7yYG8dm+bAiEEzJ+rdKYQ279omDyuaQ/PkEmVbFyEPFl+j5DCgCzD82CVXDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794169; c=relaxed/simple;
	bh=F1qDWa9oxfTnplVe5T6SBDvgdee4ZBezWVwBqFFZPqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3JBCqy9wfgrHJkxrqLu2yBQzENpW0ev03RHDCJG5x6CoprLnByrkPuxFBK+UA6N6ySkEkTnr8DcYjEaXvp6ZD2WIFVi4JiHvx2kgDTxbSVCh566BcfMc6N9o3eqFjcSr+sQX//tmdEsi2h2yUuWfO5sQQ5fYyL6fEhj0QIEl4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=XLcAH7VE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="XLcAH7VE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/PMQbnd1Umh/ykCtK7pbq7KnudwFRJAJCgrnFGdJK4c=; b=XLcAH7VESRih5oS83IYVQYVRRH
	GCyd4Pjd0IxFhdFF60HppLUJ68Ji9QZJLfHogmSrBHmFSBXyCdJAQdKTDkr7AW0rWJ7hphvFkCxHw
	LcDQ4WFXHGlOQ1j14TRyDCrroekkRmI+CS6FEzGRvFgc2Did2pn2voIuSaNnBuv0P2mBRaz2mWmx3
	66XHpB7YQoifucsdxA1z+VI4CM2QD7/zJyOAQo9f99Dme9BYieaIMqLwuufgu0wzQKntbhjkRSxSw
	77460R7t80RemoIBEQjQ7xq11ljvYU5ujYqr3pIkLxZS43BV70ql6TZnKTaZzm0av02AOO6DLz9mq
	KXiJmxHQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	jensen <jensenhuang@friendlyarm.com>,
	Andrey Korshunov <razor1702@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/3] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed, 30 Sep 2026 20:49:12 +0200
Message-ID: <179079409731.2398180.11671143856080790218.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
References: <20260919-r28s-upstream-v7-0-e80a6f8ef521@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 19 Sep 2026 18:28:16 +0800, 安容 wrote:
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC:
> 
>   https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R28S
> 
> It is closely related to the already supported NanoPi Zero2, sharing
> most of its power tree and peripheral routing. Patch 2 therefore moves
> the common parts into rk3528-nanopi.dtsi, and patch 3 adds the board on
> top of it. The split leaves the NanoPi Zero2 hardware description
> unchanged; I verified this by comparing the node and property sets of
> the dtb before and after the split, which differ only in node order,
> phandle numbering and the two renamed LED pin configuration nodes.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      commit: bdcf29a379afecc02c3e99c0d1745363ad7a7407
[2/3] arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      commit: fdb087806e808ccc4963e2e5225fe16581ecb421
[3/3] arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
      commit: c1e23f3425c49fe22e9598f8eea2fcf693950d50

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

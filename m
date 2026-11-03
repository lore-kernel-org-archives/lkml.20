Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719659;
	b=gKQvGvf2evcbJ9vIwrJY7CSZXw/NYSWZqHQg2a1NGRM2Lvu21VssVGuNnEGmmFg5KQNp
	 CNxTndIFpH4hj7CjYSbltxqxIXXs5owVrC16QJEGc2MKi8mMxC42JiIGE6FNNRT3Lkz8x
	 DWt6AoejgN+9tu3nvZezpESEMvf8QvUEnhOpbx/37FlL3qlJifMLh+OChTU1A78lw/X/u
	 rM12o1gZV0Ewfgkacoip++kQ1eJaffz+7D9m5l3YB/OQ7txnwTY2WyLDvmG4E9qtqHZy9
	 aZv6ECrYkh1XVSeeMiSzGBor8tREB5pupQ8AgJN5o3LBybuKZXXcO9Bx2/MYMeddouA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719659;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LAwEtERmohTe0gcgYdg8DRctC7b4UhWjXXjRQv+Gso4=;
	b=b2J1MlhgCaO9fYqOrKPXsipytD7U1/xo0DDTDrxeZ4hwCdBWVEfieCicxbUBN5ZypZs0
	 PKGiw/ZRZmtEC9QUSq5qwPJoTptHF5lGos/uea4j9A1QsbffYLvtLvYF7sTz49VhvC0Tr
	 BfBJCWpc7dZcr+6tGKvi775cHnoU3twPMdEDv5BOkM/jKhgas79BluqZBk75DnpxPY9eN
	 llseQ6hQJfXFEM75JAquft2nTrQyqToxlYz85neDyxx5RtGHyJKklF/gEOhv69VE2NH6Z
	 jSXWomyqCiDt1dKXT5+NPf07SkUIueVRemf9znlI61UhZK+Kei26lJ8ju40Ty5AAY7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=w9d2uCJG;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A907606A329;
	Tue,  3 Nov 2026 15:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A907606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=w9d2uCJG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LAwEtERmohTe0gcgYdg8DRctC7b4UhWjXXjRQv+Gso4=; b=w9d2uCJGfN9U1oYi8t2na1b7jd
	0+t+dIndUkjUy/ShDMVBFHwoR6yoBYhicS6+lFpwf0SbzMQzVds/7MRk5LuTgEZvY7pAPx7Yzooey
	WVGrI7ourwQrhXbf5IIpxMIIxKzJPmIzjSfsqnuarfzLKtZGRmHxdSw5wMn5jy4TIg54WCIo+HtTy
	/+F7fNSWhx9nk/kxZ7P4L/xHn2SzBS97Mk4B8xLKUNWX+RlIuvvWiSqRJRkKSn/hhVIx7kOKT2uU0
	N3MRdik6InzA7gA1A0Czmi6xZ9VizQ+F3FW8SSVXGR/rorIJxO4GI//tqdHxaUwChij93Z8Y7JC9/
	veXBUOMg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Andy Yan <andyshrk@163.com>,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/6] Add eDP support for RK3568
Date: Tue,  3 Nov 2026 16:26:51 +0100
Message-ID: <179371960186.385442.10929129839786622618.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030064905.2248999-1-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
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


On Fri, 30 Oct 2026 14:48:59 +0800, Damon Ding wrote:
> PATCH 1 is to document the "rockchip,rk3568-edp" compatible in the
>         Rockchip Analogix DP binding.
> PATCH 2 is to add the binding for the RK3568 eDP PHY with NaNeng IP block.
> PATCH 3 is to add the RK3568 support for the Analogix DP bridge driver.
> PATCH 4 is to add the driver for the Rockchip eDP Transmitter PHY with
>         NaNeng IP block.
> PATCH 5 is to add the RK3568 support for the Rockchip Analogix DP driver.
> PATCH 6 is to add the eDP controller and eDP PHY nodes for the RK3568
>         SoCs.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: display: rockchip: analogix-dp: Add support for RK3568
      commit: 00e97ec0a614a0a2ee7792160bfa6bde0b6a8aa3
[3/6] drm/bridge: analogix_dp: Add support for RK3568
      commit: 05ebb8bf006df13e330e82d4f42cc225ca5ceb0d
[5/6] drm/rockchip: analogix_dp: Add support for RK3568
      commit: 2ebbeea89df4dae6a7d8a2a9b2d698d893beb283

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

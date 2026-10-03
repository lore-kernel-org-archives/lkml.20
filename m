Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C13FB7E0
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020199; cv=none; b=oTorLSEgGvXOWS91g319DO6VWLva3XTG11zlEqMwfmhEhTvaXa2OPfhpXDhiVIvRsupZiKZ3E6UMAPa1f03DqVMqwy/KY/zAOKK6jeQAX9MgYWf0KkUO8LvtE1UcWtKStUzsZKk8isv1d6V6YcQqH4I6hOBSAoy3nxIruT73g88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020199; c=relaxed/simple;
	bh=o3DT7/5TqqCSOS+mk4/ykl6Z+1diaSISQx2Wl1VCA4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eV6/s1hXJ6pZ/9ZbfEcYG6p1lizomL1C3SRmFsMCaVgUJrfDwBVb+l4jjTujx9tMdCFs8SrABpzkf+8sS/aYuZBe+k9bnZjIDBVU4R5E2kBXfQr2n37Vz2mb07g2OXlpXmYo/MGvEIS8aX+KGxvI3yiiIO2NS8mqXYdYt4Z3Aho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kk8Y7q+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kk8Y7q+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53A21F0089C;
	Sat,  3 Oct 2026 09:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791020195;
	bh=6JL9SGL3PUaJCdUDz966EibAL0TTLzapXaPW+M6rmjc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kk8Y7q+93wUqvE7lnyovNUACThKvjhY8LJsJQcPoDCxHp28z4LMRZ9TXrTEK/cN43
	 DwhZ0KUMaZK0tN6hjJe0Y5IPebYUt8FidVgIlSUfuPZ2Bp0SVuZ28Wik2+1h8Hlx2M
	 faZwY8CQm03V3iSs7QBZfM3HLkCZOvv8gTD/7nqpVm1k0Awl7Uva4jl10uC+U5VdWa
	 YlAjgEqSVVvua0YK5QEtCkQCfGGLButmWdZZd8QR2np4dm4wH1ngLqcVcEhGRi6W/u
	 IT8I6sgARLrUbV+/Ug89nQA9R35Znf5yBppn/VbJG303TE1OzlpWcuKfOHHNV+njig
	 NLG1pSy4BvBTA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Igor Paunovic <royalnet026@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
Subject: Re: [PATCH v15 00/11] phy: rockchip: usbdp: Clean up the mess
 (part 2)
Message-Id: <179102019252.199361.13603467154520106912.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 11:36:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 15 Sep 2026 17:06:03 +0200, Sebastian Reichel wrote:
> This series is the second part of a major overhaul of the Rockchip USBDP
> driver. The goal of the bigger series is:
> 
>  * USB-C DP AltMode support
>  * Fixing sporadic SErrors happening when connector is hot-plugged
>  * Fixing USB3 support when connector orientation changes after
>    hotplug
>  * Fixing USBDP PHY not starting up properly initially or after a few
>    replugs
> 
> [...]

Applied, thanks!

[01/11] phy: rockchip: usbdp: Drop DP HPD handling
        commit: 4fd2c13cbb11f5483a43cc789cb8de1c3bd23238
[02/11] phy: rockchip: usbdp: Rename mode_change to phy_needs_reinit
        commit: fbce9cc28cadb24026a6c061819d42e50d3bfea0
[03/11] phy: rockchip: usbdp: Re-init the PHY on orientation change
        commit: 4d8349799c4be92750c0d73c9dfac09003233146
[04/11] phy: rockchip: usbdp: Factor out lane_mux_sel setup
        commit: cc492941f8e3523648fb1393e3e61a7602a0260d
[05/11] phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB
        commit: b1ca8de219ae6e4d9eec22acfbe4357d8addd94c
[06/11] phy: rockchip: usbdp: Use guard functions for mutex
        commit: f8e38359fde88381c3a7b1134dfd3a406a0e611d
[07/11] phy: rockchip: usbdp: Hold mutex in DP PHY configure
        commit: 619233ce6b2329529c9f0ff9682d6e22d160ebd6
[08/11] phy: rockchip: usbdp: Add some extra debug messages
        commit: 89eb5e8aec232ff494a0261f7fada6390bb3f1be
[09/11] phy: rockchip: usbdp: Avoid xHCI SErrors
        commit: cf3aa34e6f0798544c26ad93a6c3c2231ab09738
[10/11] phy: rockchip: usbdp: Handle rk_udphy_reset_deassert errors
        commit: 35101e2f49c04bf1cfc69b8a0d3f85c742369ccc
[11/11] phy: rockchip: usbdp: Only enable USB3 when not in high-speed mode
        commit: fbbf6c85b08008bf68ef49931175edeaa36ba82f

Best regards,
-- 
~Vinod



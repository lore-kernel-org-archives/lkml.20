Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE883DAAD4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484782; cv=none; b=Qd4bG1A+DqeNhxh+JPqBcsv4SWKYpy+b6wLleAqhU8NZqgkcqpZz/DXq6pnq63OGE08m4ZNzZZ69suk6ucFz7R0n1qtxKOaMCykrPqWc1O3KJ7fcTBj8LxOM6Hq6Gm+PGY2AL04b3WNXUwTzAllsKLK4TN1Ykv2EoOE4dmCEaqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484782; c=relaxed/simple;
	bh=+Ss/spnbXxBqsUZgtRuxS8Ymuy4NMQeP/+qSuLAZr1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S9yz/3PCtFreN+xciY94bE+N7ETFZxTeO6eqZm7W4bm6BByJaJgAe8xC+Fq3e28GItmQ24osCCh+b5QDDCZLUESq/06q2+8EkxQDLzURepIYCYJiQ6hnzUorzUkJ2dbrq23oPzYGaSBG7AabbidWbVZTzBAiyKQNddJo3bu1Syw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gsbAbEfn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gsbAbEfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484778;
	bh=+Ss/spnbXxBqsUZgtRuxS8Ymuy4NMQeP/+qSuLAZr1o=;
	h=From:Subject:Date:To:Cc:From;
	b=gsbAbEfnfPSVgmxNNx18rTQTlTwwsKulDu3GBjqyav7adB/zMtmEuRpxKqgQshfBw
	 koiD8W9RgwQW/2DF1RojpzlXn+6fG82VYySaRUTOVRNJyt8U9kvQn0Xzb5i9Xwyty3
	 7zO1/wBueZiu847oqVhnOrOc6hfntU1wUWi2ZaVTXZJFA0dbKJlMaVs9QAZm/ZHr8g
	 hV0tY8UesekeQv42gBvf+7HAxaHPyfV8o3sB1GA027YFuIvaKXzi9WdJnGlMCuSVCh
	 KPxkEYDoB2OF4tlLgPw4z6ve73yLJF0lJKUU1diBRIUdLOL2AQz4wMu9uf9c8o+QvN
	 Iv+NVm9sQosGg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96D5317E00A9;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5DDBC48002B; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v15 00/11] phy: rockchip: usbdp: Clean up the mess (part 2)
Date: Tue, 15 Sep 2026 17:06:03 +0200
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNTQ6DIBhEr0JYlwZQNHKVxgXgZ0tblfJjmhjvX
 tQmXXU5k5n3FhzAWwhYogV7mG2w05gDEyeEzU2NVyC2ywXmlFe0YSXxk3mYm3UkBd05Yp6gxuS
 IUz5yQuteaKYMVazEGeE89Pa98y/tkUPSdzBxY34XHl4pi+Mx+2kl2qWcFv+kQoum67WomCrkz
 MQG1CoAMdMw2CjRXJ/z2TDcrusHO0Acr+wAAAA=
X-Change-ID: 20260914-rockchip-usbdp-cleanup-part2-07f5b1ac0a14
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3576;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+Ss/spnbXxBqsUZgtRuxS8Ymuy4NMQeP/+qSuLAZr1o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXunAWy7IyK+04a58UQ3mqEShXPELIbNhY
 1wwBEjY2azI1IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7pAAoJENju1/PI
 O/qaAOwP/il7OhR52KgpVF7OjfpDe9uAdhj8lDIPVwhywV/eGaexfVfw24jrnRPNaDGXAW1/k4N
 6zXawTDLahvi0LkJB7zilpSaraRu6tKSoZtFfX1msIvnbsXqGQv7RPq7ENB7ReRhkNxl896H5QH
 +EzSfdo3znyj9Wc5XNKz9mWL5q6DdxXjGaxLmukiGHxKc5USb79VsXO7ERyBU6FqsLjlyBb38/7
 A5QjdTp0PX47rEVptlUfG2NnGiHZGG7acNCgtN569QHb4Di0gPnp0+xpUWy0WX4hoqOiwfGAGZq
 iuAET7AT11o4wuZb/W9m3xy+7SmlcZeEuV5hMVHFJi4Jz9JvZoAqfO6mOCN35U8miWlpfYCi7Nf
 InWiG8jGC1TgqqwUH2g8dKpMb2vH+pUYj6GH9sXP13B7mErSIiDE+s6zJtxTfpJSpQHWZ7WZXth
 ekkf/wBqBYZSnVADeenxYMoyWEl83tthwN+EtkkihDcr0rVZlP+fq/Pz3oE2BKVE4XftGvaRDF/
 Wo7m89X5z3M/RfDZCVYfbfqKhVtuR6VHZQuhS6sJhYMAfPMkkmn7qr4FvSvA3PheB16p7xH3pNu
 Lbm4XZ8ZuhiMXEFTwhw2iRO256i9ZGk62pQ1lTTkg6kPm9k+WTk4kf5UMYHRK9q2K3y7ItjHHc8
 09B4+X/Fc4dObAT7ZYNcx3w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This series is the second part of a major overhaul of the Rockchip USBDP
driver. The goal of the bigger series is:
    
 * USB-C DP AltMode support
 * Fixing sporadic SErrors happening when connector is hot-plugged
 * Fixing USB3 support when connector orientation changes after
   hotplug
 * Fixing USBDP PHY not starting up properly initially or after a few
   replugs
    
To fix all of these the whole set is needed. As reviewers preferred to
get this in multiple series I've split it up. Technically its exactly
the same as the previous big series. Reordering/regrouping the patches
is not possible without basically starting from scratch. This second
batch contains a bunch of smaller fixes and cleanups as well as one of
the bigger problems listed above: It fixed the sporadic SErrors on
connector replug. Unfortuantely this also seems to increase the chance
of running into the PHY startup problem, which is fixed by the last
part.

This series depends on part 1 being applied.

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - rebased to v7.3-rc1
 - group the next 11 patches into part 2, remaining patches will be send
   in separate series depending on this one
 - patches from this part are unchanged compared to v14

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (11):
      phy: rockchip: usbdp: Drop DP HPD handling
      phy: rockchip: usbdp: Rename mode_change to phy_needs_reinit
      phy: rockchip: usbdp: Re-init the PHY on orientation change
      phy: rockchip: usbdp: Factor out lane_mux_sel setup
      phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB
      phy: rockchip: usbdp: Use guard functions for mutex
      phy: rockchip: usbdp: Hold mutex in DP PHY configure
      phy: rockchip: usbdp: Add some extra debug messages
      phy: rockchip: usbdp: Avoid xHCI SErrors
      phy: rockchip: usbdp: Handle rk_udphy_reset_deassert errors
      phy: rockchip: usbdp: Only enable USB3 when not in high-speed mode

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 290 ++++++++++++++----------------
 1 file changed, 132 insertions(+), 158 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260914-rockchip-usbdp-cleanup-part2-07f5b1ac0a14
prerequisite-change-id: 20260203-rockchip-usbdp-cleanup-5b59dfb561a3:v15
prerequisite-patch-id: 27d601f203e30baebffc3486a1b787a2d280f5f7
prerequisite-patch-id: b42efbccabb13cd37252ea9bbc3873141bd5b8f8
prerequisite-patch-id: 8b416e19148a0b90c71778ff4fcc032b52ed49ce
prerequisite-patch-id: 04b986df824850902431339cdf43787d8036ac5c
prerequisite-patch-id: c0a6f7da1f986c76248c6271b0c04d8dab21e5cb
prerequisite-patch-id: 12bf844fd4a355c1860812522fdb16a1ff4232ea
prerequisite-patch-id: d71d6a6a232b59804f0775ba5c87d71bfdbbea61
prerequisite-patch-id: 301c705f92061ccb1a1923ec5d3bdc1fdceca24d
prerequisite-patch-id: 978560cb9620a16f57e14c424e8efa4ad7178747
prerequisite-patch-id: a6562299bf87dc57d4b14a8079d2b1e3fe407702
prerequisite-patch-id: 1b90e6acf41e9093636c3fe8791f46492b583520
prerequisite-patch-id: 60f32afe1f50ed33d48041b41e7ec8a5841d0ebd
prerequisite-patch-id: 8a9a01d462e581e6539bc9fd07b13e0f32933126
prerequisite-patch-id: fbcfbe4a42de5c488052e865bfd146260be738fb
prerequisite-patch-id: 7f3c3811dee1e11e0386ff2d8b4080f07bd68e88
prerequisite-patch-id: 831ca526a0099f3f7292f2060df9888bdf3055b4

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


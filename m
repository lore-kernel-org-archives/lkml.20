Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF1747A0A4;
	Tue, 15 Sep 2026 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480209; cv=none; b=sA+sPzvJdeH4F0KOPIpJLFVpsGascrvtc1V2JM9+Ui8XmjGjJUNp7OjV+gQC/TgGSFk7o6RhO8JP26YBAY7ylqe6jnnTiDSL4UuvJNhL18D33/LUD5YsIvOFnT9DR7ete94JkJGk6OrijVWriknIYxsfHaG+kebp4WeTX6jlk1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480209; c=relaxed/simple;
	bh=KvyICF3HgIcEWsbr4qstgUGWW6/KHBg57XV0O9FNuBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ju8xxb5/we8QzcUce95MQjNe7G+qTIweStNFI345Ysg/iUA50zdOymj8NqkNW8hx2PxP1KrDaDgbObGIxrfbdFXanOsYf5d7io9wMsQfojuC4gpBIWebq+HLV0sJH+nBrwkKiqbg543ooiKYGJAK8FoP4pFDmcjmsSyRBWsIFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hwDs45W4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hwDs45W4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=KvyICF3HgIcEWsbr4qstgUGWW6/KHBg57XV0O9FNuBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hwDs45W4RnRaWuipiA1+HJ1/jQ7W01+uRd3Nu2f0i8Nlq0p+KzNaj4gj65RzUumTd
	 mBQ3SwmK24RKMDYtXXLez9KdDpnWQivjyYwq/1KZufJ4AGqlWSXswRNmxb3+u/z1Zv
	 R/GhDvN3zSX5HQzjmjJ//2GYE13cJ+/uAFYAi7QoQUzPL9DRAcdFkNstCYD3BaTp2F
	 0EZl9f8T+AoF2Spns7EmvUQ+p3GqB7HrEtBzaACk+3m/3NvX1SQPsrylNANHhcHPIj
	 PPHFRnoffs4VPJR32QVpIteJMwOvA7rcP5/Akzqbb0t6j+/bDfDpHbsJhf0jkYammI
	 nGk3bWVkLDoZA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC8D817E0E61;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3CA9348004E; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:59 +0200
Subject: [PATCH v15 12/16] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-12-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KvyICF3HgIcEWsbr4qstgUGWW6/KHBg57XV0O9FNuBs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQXr/SgVMWBtLxhlK5ztWfDiB+hni4LfA
 vbTUb3qCkhb/YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qaat4P/1HGWeVd3jWl/h6nyS0YmSWsGLKM6WTpyJbVgRDuNocQHPnCmNFm46amPRqDzDUG12z
 4FOuobTwTaG+P1pJBux9MM+dRfJJ8Dgq+rQx8+Aw+fPmKWLGqSV8daQ72LvsU8KHgq7jheoWjRu
 FKFZcMp8rtRXQ7N7cOg0e+/XZg0shPWdF/RTtr2I9Rx8n+wGyJgHY4dzP3uAI0xy40vdFQlrCkp
 LQN17sKFF9jqoldZomCsxybsLDjKZT6BUfQB9N6GsDlhTgNpyxhG4mVd8jgeSR7YC9Faa3xWzxC
 +jcpnsfgfItimHPbB06tjEvUxAilN8FwsrEqilulyNtDowgvr3TIRGaxwEW1/qr3Jb7lfrMKsvs
 0sRi088ccXf5gjIKr9+EOQqxFaDt2O4Con5UrxMt4NhpyZDmyfWjYv5ZGTf/kS7gGviVbalLLaq
 BFv5FoJRq4NwB38Quswq40c0zBDFgVS0+nVlhlOG4AhJW+4PbqsCMIwd3uJ37pHeOj7byrD8IR0
 ZjTMEn4AdN22HyQUh8qjVWiFPpIntCCgreVe1v75Lxw/VLVIXhx8uioKjt8rW1yAmE39WnJN7xe
 OToNpN7gxRB9N7yFShBQF41ajAJZBbUkfDcvrkUwVZVNdK61KZCpXkl3d38g3KeROuP/PPd7mPF
 WKOsDlMR4wYdXqHjh5vwvZw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4fce9cd66473..2af7c3878714 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1098,6 +1098,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0


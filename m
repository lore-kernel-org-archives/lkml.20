Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C373C3F4A;
	Tue, 15 Sep 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480202; cv=none; b=WqoA4EoIeboP5DnHpLcwcT4F5fLIvCtqJo8cVYVySTPOUuCxBdz6WndYjHBVTahgqgv3k+ka+/5wCQ/7QIWkn2Ce1K9x7jkKuhvLcHGUXySr9SOoU+5DUG+9l90L09YWGG4ycJ0fbWxJvEVYBYOus/6NL/3vdcZBu3D7j4RjcAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480202; c=relaxed/simple;
	bh=ZWQwvpL1M0bc6+FwRdWniOff2hRdkUDxZm9y3a3YJPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfObEs+ItSaQfNjCxl9lyOr+iFpvw3oZNfsDzhp1crMTWRtxZx0q7Ag/qtQDYDVpTcZwgjrvpPZhRG41QehbAI0ffNqh7leR6Vbka+F8Un+jckDO9NtleIlvB2xvhMupjnd+yn09ZZiYaT63dNjks4RGL79oBkEQAzczrRyGwGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YK0M4T3+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YK0M4T3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=ZWQwvpL1M0bc6+FwRdWniOff2hRdkUDxZm9y3a3YJPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YK0M4T3+4Ii8kwykoBo+qp8sX5MBI4/4ACG8qmepdIOSHJd6I0IJFxMR+NQ4CBFQp
	 lGQ51u0ggL5HaDQ3TJxkJoVRMMArS5Ih5akqX4AmaKLafav9OVC34BxQAQazrl2dLc
	 eNa4tiL5jgvDiKzW6F6gvNBoj02oHc5dAta0IDXY8x4zNFoLLu8+8JyBJ3zkIjbKP1
	 QiPhNiTW+/ngrh1h+f6WmroFSalDapJMbdHQjOKnL0/uLg5LHZthhRIBCV7guUkK38
	 MbogctHqJRkbNv1bRMhDY2l4Jv9UDMsRD0ZCPzyW3txT2FGj+pQhC0gi5WMpSA/VyW
	 4r37PEOh+SPag==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F08C17E09B5;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2D0B1480030; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:50 +0200
Subject: [PATCH v15 03/16] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-3-80e2c11d1ce8@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZWQwvpL1M0bc6+FwRdWniOff2hRdkUDxZm9y3a3YJPM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQVWNRCp7fSW3ZlbMEUJzDa1u6zaftWPV
 5tNlz4D9UP3gokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qa/s4QAInMmd/SVzgarSf8SjlwsOABLWrClbO1/KPEQE59xdgCNkJalZXH6bs2P5Eee0ok8Xa
 E7NPGKq5t9nsfXshXcgT1zbsXdnlxrWbM70OPaCumMsoTXjUIEsr+7c4qQBJZMDqYb1DpO3U5SV
 to2VgeGhA5dYzkbbM2+CKs8iXQDu4XVo3X1vcdANmOdkEHUiZQ2XJnYo8xewyMEghX57ty8cxTa
 RurB8/2P4rrEdIAZ+P/n6MAIgkj1R5jRTMNQnT7jEmB+Okknrk2BjYE+jcHyqnJC28VrslPHIaA
 37eemzkUZGWDC56WhvFqpH96VnajZyADXFabl8wZNEYaE8a3MCZu/3alrtOY9TmJCfHaFgxRUF/
 lxnliStphEyISTRVIYzycWaMfESV12ZNwC1kfr+FrO5vh3RGDRmlTN8LjdJktoaPO7v0jgbSkgf
 QerDM97Gm803NK9Fdy8uvyy/hwhdNhpGQCVhVX8wjJwsVzbu3tc825nN07euGxHf0lVuaNuvLMN
 YpUGkD++rJDZhuMZma56a5PHz8iJOUmwS3UImWHspUUFEHHM2pSRsw1l8DGnYSwHAKEpSPzCX4r
 Sh4kls4aYMmG15vpp4VtL1EbQ1tUHoL4YYaGhzSI13HsX5r9T4SfNnkSspfep/DzrY60cRGDQnb
 PvQOTOlc9JH0tPdEHKRokZQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 13649b52e99b..da0fa75fc9f0 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1007,7 +1007,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->mode_change = false;
 	} else if (udphy->mode_change) {
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0


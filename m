Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268971;
	b=C0AZOlU1hRMc6lxn7Gq3MgHp6yH41zYYap0mB+Y17QdwlLF2ozzlP1ZhYx6qlYd4g6aT
	 cAkPEIl4jsxRUOh53j5TlrGorYTl8YtZ7+n42E9ktEcfrozmGkjaZkNcp/4S58bPYcv14
	 VSQn9Oah6Jtnjz/0FAfC09S40fcNcXP24wWEIZMMIlFAoICwActjArZ+fA+OwtW54kZPD
	 mtprnuLhVeKAnjBkzQKIZr9Qi4OuY337jA4ncRdNDZ6EQcXSpW4v9FZII78LIni4f39Y+
	 kP7uY0LYCxs/10W8xoBVVy/6UHWYvHYCHrSr4lyfZYtxAA4h8km1SX/MWlcRDhfSetw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268971;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uzequ7u04c7zvTxs5TC7dHbAyubOrWFz3bgZTquTipU=;
	b=aSEi3k+337uufnxM7NiO+tKG5Gaa5LnJeBHGjHpTomltjRc4HWADkIt426+ogoG5CYij
	 F/Ye5jIxXVivvieeYy0d6RmZuJ5GKMWv1yrpXgeGhJTaFaN7lLjOXHG4y5J1ayJOWWXMU
	 zdxEpGRhKZVQLRuEnQxlxNjehQFmcgrdhzqotclt45ZC9FkNkYYpqWD1+u9QowRy+S04C
	 jWKkDHRw1rG1BV/MywZYqLEDEb0Fvhqu4p8FrXKwlA79KTYmHLr1Sxy8LC6La8MKzhQHs
	 KKoEJoaNMTat6ajcvVeaf9GyAaEClKV6bnVdb3jbxRnGREJEn07K2haAiJh7f8Kvzpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=FZ+wzuhM;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDCA606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDCA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=FZ+wzuhM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FZ+wzuhMGbTtx8caZk+DhnWMr61exkh0BQV+va1fTady2eKV8o2IUYVKrZRJOy7kn
	 EUIgYUbQqSuOItX/qzhDV/1bNBEzjA8yaNjvgdbTlrApVorPFeqbqUBdKRNljKMEGT
	 YlLPmDqbBjNJvMw8Hg1lYA+yj29teNaSgQDRm72MCkAqhPRNsbDBrs9MhrpqmolZj9
	 KukW0Ipa3nrTJoCXmziCvqwavj7/bgBWmt+ahwbvI1C4maC+NC+ZJnj1q88M6c0Rlx
	 uJ9JGQ2ZYCsNdpk2HSbvqI6don1kulHUBXlAG91rRi7yO17/9jDmYeI2lxKcusDK33
	 9DhMjMDFrvUEw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 658EC17E04B4;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 224BE48002B; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:46 +0100
Subject: [PATCH v4 1/5] phy: rockchip: inno-usb2: simplify and unify PHY op
 debug messages
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-1-51acc071634f@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXydLwAKqjWujyTi08hJyBtJKJsb77rzZV
 fRQV9auXCcFmIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8nAAoJENju1/PI
 O/qaa7QP/RbehpOBiM6icqHkNuTJ0LsxT0CwSPShsV080C/QUigLcxkkL0G8S1NAsXhUC8H6+k5
 T9niz45mo6wT7fGyJBdvJIIsek8HTuwAHPMD9X/dSbPR7ozpVCzOu5Nf8NXPcTYeiHauyXUXjYg
 UPlCGd/htCIQwjtuG6ztTcHmZbzgWobQ4QMK34qzykVBJJVNf17B6W3igeaGNrobd4ECjTbp6kz
 4BEuHXwfxiBOVISj9/RW1Ddy38L2ur+9v63il8g7dDnOastg8uyNn+4n/69c7IL1AhpmuMH8FJx
 JQE/HDQxtJUxXXaaCNu939GBG1d0BUsTkD16ExLEng5TQqOlFCaRhpgZxOYLWe5W5ml5JIr8r5G
 +PmK2sDSYlDNRG24up9B7k3DeubuODKiRVyuEYC03I/Dfc2Gv7QNFosXcJBCPLKpENSt8LGjpZO
 dV5CFiln+ofvbid99t/8WbVjcITp8SesiWpqFHbNCJSC7jO/72qMm1Dg9BoYntuuh9kZlCCj6C/
 xNxssW+JgexS0kg7aJ3lyVhz6cAVrhpwS6smBgqt2VVwUBe8wqN9RDm+yeZpiJrq62FKiJic/Gl
 Vvrp05Kj03IbB39HKO/pvLck3WLn1FIG2r0tDt69Fezy90x6NtlA9qDh7Q5nn7VigPl3kCvTdRa
 zpcCGQCAf+9V65DF3eXoxpA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add debug message for init/exit in addition to power_on/power_off and
avoid the useless extra dereference in the existing power_on/power_off
to make the prints consistent.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index e47b89015586..0b61f152eb3f 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -508,6 +508,8 @@ static int rockchip_usb2phy_init(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret = 0;
 
+	dev_dbg(&phy->dev, "phy port init\n");
+
 	mutex_lock(&rport->mutex);
 
 	if (rport->port_id == USB2PHY_PORT_OTG) {
@@ -592,7 +594,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power on\n");
+	dev_dbg(&phy->dev, "port power on\n");
 
 	if (!rport->suspended)
 		return 0;
@@ -632,7 +634,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power off\n");
+	dev_dbg(&phy->dev, "port power off\n");
 
 	if (rport->suspended)
 		return 0;
@@ -651,6 +653,8 @@ static int rockchip_usb2phy_exit(struct phy *phy)
 {
 	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
 
+	dev_dbg(&phy->dev, "phy port exit\n");
+
 	if (rport->port_id == USB2PHY_PORT_OTG &&
 	    rport->mode != USB_DR_MODE_HOST &&
 	    rport->mode != USB_DR_MODE_UNKNOWN) {

-- 
2.53.0


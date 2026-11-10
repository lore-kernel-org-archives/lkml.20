Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331181;
	b=yyKvfmWISnRyOIU5Q19SwVs0+sMLCkIN+xo1k0zTfIL9WbsFL4kyYSiZr7wYU/I92JkV
	 leOsmopX3/SaCn0Gh2xXgIByTAim2ai7iKSQnuf4OYoKBcKU7F9ErPAGjLMq98ftECqg5
	 zNuKMzsVLOnZndnSzemFy2sU1PPi3S4l+h4lNZFysl288cQb2IC//uS4DOlWekB1iVxoH
	 EGImWLr83Mg65KddJq/PC6nNSWN8UyJTxhDaIcgadsSQkh1ydUSpb8yJSJylnA4PTCCTY
	 FOlxvEAB2DZLwlbFUssEKO0gbnAT2Mgf++zumkTm2jaZrMm0rOV+dQmkIqkNFo8Ge+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331181;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uzequ7u04c7zvTxs5TC7dHbAyubOrWFz3bgZTquTipU=;
	b=YghWD0irJn7/o0ebKYzLHXY2evHpeSTcIHT6P4CXAY26aKTKztaYITYTTcxFoSH+pByF
	 YdNAqsXEUj/RgUQcaNddqe4AAqrASkzN+SEOKToJDTU70qwLocwdgRTZE20ptNIWCvFmW
	 ZWndtraRJmJDG8MOjBXPk3DgT+qm8DHvCo9r3NS06RI8b9VnSkJxtlK+pdk/wmM5pw81k
	 967TSP1R4xgj4YID1f2JcZt6VoIb/+aa04jOpcsyvtO/HvSo+/Z2T082eNkzWm6cul0gY
	 9Uu5BbWrqAQFo3BkXOxTTpgNQNC2wKAbb29vzKY2wLFVX0YVx/A0TIav0ZD0raJBSnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TZ8SQgs6;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C74D606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C74D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TZ8SQgs6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=8/fTd2v3WW8Lq1B62lCiA4Q4ly0FhC2re1oEGWAOBUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TZ8SQgs6tjdKliKufAD2RYTRQajHbrht/NL9Jadw4N8N+/SpFKLJ8pUuUR8aUBnF7
	 3bksch1DHN5teqEiEHOkgLQ/c9+fHQ71SClfy8BjZDbJ6OkRfXsqw+DxodIwZW4N1I
	 tzIKzD8dHFMRLlqRoTKh68VU4uLsBQRPAewCO9n//ltUT2hOZ/80TK1RCyBhSzOu+t
	 wD7h59dM2hm12iOpV0b+aRCtcsGo1YVSbNHekAbRo5VKaGZ99sbVwgfZtNrHQDVkN6
	 T7dY0xYmc+OaJbVG1w+BjS7WK7QVODI+WrImvWSCZBlwqx6DE7A04YCF/dX/1uD/uv
	 HOgkXdy45FXIw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 530DA17E080B;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0B80548002B; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:14 +0100
Subject: [PATCH v5 1/6] phy: rockchip: inno-usb2: simplify and unify PHY op
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
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-1-d2e24582ab22@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUipMtJGjGA7JsIcLf3X/vQtc34JG3owgb
 gomFsu+/0ew5okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qa9+4P/jXLFAzanFy2iVOWOeQXHODjQAcCzLbIZhbdiO6JmAqeTWyjaik9uvM7xdlmzVT7dzC
 /Zqm+MiuWGWjYv8Vhmk6ZHBQpRfA6X1oNyL0f3DF1pw5trmo6Ub7e3qP7TL+7J3DmjF7J8acInM
 jiZesbm0MkYJjobjB8BtgCfBMY6Egsk1/9dB0Wjf6QnMH8zVO72AipVuVz9EHGXDfa+FktDkcdP
 EMnxL8wVP+9RTzqvfDzvfTPVU72o1JgHldioHOLNXjBdZpUxuLtryv+7tfdjUeEZ78jqldL47fB
 BxGj+/5x/m1nSIAEjlWg8rzNQXWThIAFJq7djD1b8ikmbVLM9NwGqqG/sj7xxlVlrP3lKVMiqmf
 cIn8ntl1nvM++t/TMNjD3mNQVzzdtYpPAM8QKnHNWbhAIedLOaNjLDj+yziUtP1MPZROfeeuAAl
 4IyDsnKHqdWohaJRdvIT8qP8ffcxQTymxmB9dMKUtjZnDZaH+bkSqpvhVh/hyHJHLJ/JTHwtSpD
 zKWR8LmHfLbIdZqDhXC//LJ43AN+Qw4KsqGNkA2Vuiy37PKtI2QELQTVAQIcfdW5BWQ44lNsIPO
 4iI7CoGds8byt+wyg5m8Eqpn12Bwkmot/dKMq9RXQoLBwmUVDQ1gV73IiKGvSnoNv0R1Z0hjpJ5
 r8CtTe+BGYADcJ4f3zqYwfQ==
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


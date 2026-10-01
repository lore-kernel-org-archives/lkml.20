Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D26849482F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860386; cv=none; b=cKRyx6I8l9MoFH346zjOY+qFdjGW9zzK2/kh0JpNiV/wsH04QerWn4NSepd7/TGwL6OH5hO9HBwQ7oGc1p5uH5DIRO+61ewBMEudlTCQA7EU9AHsylFWRaBPlHnkuuTOw6talSPbdUZGUg6xtxi/gm8+MCj3JMWrwRdUoxE2OfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860386; c=relaxed/simple;
	bh=P+YbvSg/zHk4rh/5DoiW/obrjfRyH/ubuevAC6b+9+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGNAiUb7kCyHnjs18mAO5J2vIUTJAWl69X+13OayZtJZqYZrrrb2QI1sNZBJxgBC2vsRSCOCtHYiJ2lvyGwdzmozRKrMDHwhae0hosVxF6fBQhz3yPF+RCHkVWD6lT9AGSWIfkeJCa/U5JVvcYz5FgTKZ9P92ZSt5HRjLhl2WI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DctwH0Ef; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DctwH0Ef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790860382;
	bh=P+YbvSg/zHk4rh/5DoiW/obrjfRyH/ubuevAC6b+9+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DctwH0EfioodF34jYitpL9ufl7e5DZ2C2mJpdEQjl7BOh/N2UWyQ13DZwDI3w9i/7
	 prcFJhh/k3BEP13ssTomPgqxGOBISf0Sn56puT/PAKzqkwoaVY+7fFjLovtMQ6nsLx
	 Pgl48BNsgvKLgxj2vCSivM47HgcAfwUQHiuTWOPTM8vHEZDWp4ndh5uufo9R9Chspe
	 Av3gTKB6aqdiH+LOsWfE0uEqfxT+UD22tttIxajhG0yyNbBZoQdS7tf9h8dCSfadC7
	 5WFZfXzntGSTAv8mNQIMBFrkO2Jz6UlC89hIyL70qaMwOtbwrKX/hbsKQlf4ULfs6m
	 4eHZ7bOp5sBtQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7439517E056B;
	Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 254C448002F; Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 01 Oct 2026 15:12:40 +0200
Subject: [PATCH v2 2/4] phy: rockchip: inno-usb2: drop duplicated update of
 rport->suspended
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-2-e01bf509359e@collabora.com>
References: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
In-Reply-To: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=P+YbvSg/zHk4rh/5DoiW/obrjfRyH/ubuevAC6b+9+A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq+XF5jSibh9SSHs85/tEuXM4mrYvkxhWQXz
 qesUuGwvsDt74kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvlxeAAoJENju1/PI
 O/qai3MP/17FpQ3tAeT30uQjQU1TyBlJjwIh3agesZ+kJVlzvuHtBAVKIVmmhRcLY5A/fvVBWH6
 INP/1vM0PT8p78YkLgUgKuJV7xSpN8bbhKBqSG9cK7e4xSDTqD07GdRb+xT/1dJW2JIriU+evd5
 T8jX3yThyYHljJSFv8JfbA+303N5MUdkcDpqVYfZrd0gH8sFN6v1jJ/VYJVzDmZtihDvWXEgUrf
 W5Ybt216WkDRA+QVnM7qfTkvHw5L+bw2LJayYa5yJpAGU7TW3SPjoG7C1dNaRwpAmhISVgti8tr
 1Zf3AwKJkXkTeurNgX4tmp3srKVkBEo8cw/IEc/rMc7TPCr1+u/nDE0JY/cphBpeeAaqKBaDAZA
 rMP7lilDQxj3oFXsRRuSzXphvB/xPj5xjjthJcvG1uj1pS92DDURYcN+bgqQ1MEKcFqKK6I3z/T
 YuJRy/xSUD57iEIx7Walr8YuU543iG6TMhhAOtmmvA4YRzXxO3/+Xx/zZTurVFsEMoqT6AaAwi7
 77ZBPJECgghnmK4PuSrJ0smUKhKqWQENfJyS6xUtvcDIgC4Ev0oRPgTYXxfTis74KbymWhangnJ
 jJ56kZ0G0WNfrCL9Hlr58ZYjLq1ZdjOmZRIqCBBB0qB3XY6QNeEe0UZgm9qo8VEzsRsiCwNJNdp
 60qr0WRWBFG41ED5RQWYmMw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rockchip_usb2phy_power_on and rockchip_usb2phy_power_off already update
rport->suspended in their success path. In case of error it's not
sensible to update rport->suspended. So drop the duplicated update.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 0ab054ee84cb..e4d8abf935c1 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -994,7 +994,6 @@ static void rockchip_usb2phy_sm_work(struct work_struct *work)
 		if (rport->suspended) {
 			dev_dbg(&rport->phy->dev, "Connected\n");
 			rockchip_usb2phy_power_on(rport->phy);
-			rport->suspended = false;
 		} else {
 			/* D+ line pull-up, D- line pull-down */
 			dev_dbg(&rport->phy->dev, "FS/LS online\n");
@@ -1004,7 +1003,6 @@ static void rockchip_usb2phy_sm_work(struct work_struct *work)
 		if (!rport->suspended) {
 			dev_dbg(&rport->phy->dev, "Disconnected\n");
 			rockchip_usb2phy_power_off(rport->phy);
-			rport->suspended = true;
 		}
 
 		/*

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233385;
	b=zhYR/O9+E5+AfhMpWwtAvR9iSdSL2aTr1cXL3hDliQNmD+VJnqVliPD1DggrQ6dYWVKs
	 jWFK65nW7AgJKkyW3g9po8vlEocSUu1InWSfAmx/Izk8wq45OKbewZwJlZQNO/gRHNklt
	 rrrCGOzD3vdEGhuVQdk66bAvLOMhLBpHsJyeMxYprKDWugROw+X6heITbKP/GFnk/iQJa
	 Ko+kHwskDrODThhbUwOhSIeiz3GULR5P6n4Jbv3Sr8yyVPC3+ejAZjlmqwz9aNQZY5ero
	 5NMMsS096fA5TQ51haB0WbcgLCHx8VoG+cqroo+Gal6A04/GfTI3UDB9Ij9LROyyVGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233385;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=BwG6pO180ts3EsXk8dPvrXRrI1JUEETTIVLE0jahKVc=;
	b=p+OZHPZXG0l5MlYGVasfy8mTPHqXCy4E7dge+ZjTla0JS/ZhP0eeBCew/tL+9uVRACO2
	 V1uY7jnI5VA6LFn8PW00XD39YFmbHaxNB6gy0koZrlYVze4TFHBn93lF6/lYpl5kGZ9Bp
	 EwY8u4LRx9WpLZ3QqJFtnIMIIt/xXtIb+VPfVxQbQFmSIZf3L79G42E6zoAXGgB4wtQct
	 anZWyRy/pW8W93Bv989HiniS8nbauBrBVPtVPJAOtpKgeCif64ksNnjTn63qKifboAE9n
	 EQBwyLO//MhZLHc3juOFKE+tFsCuxvu4WqINXiJyw8kZx/eXF76QgwqYVAuF11cGnQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P7kFwtu+;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CD6606D837
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CD6606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P7kFwtu+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 121E84E4155D;
	Mon,  9 Nov 2026 14:09:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0C2560051;
	Mon,  9 Nov 2026 14:09:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C862E10328531;
	Mon,  9 Nov 2026 15:09:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794233375; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BwG6pO180ts3EsXk8dPvrXRrI1JUEETTIVLE0jahKVc=;
	b=P7kFwtu+VUr7p3IVa3c3beqy+cB1UjM2mVxU0spPBZBmCGzp5q/DJAx6hm7QJHDJwvBZ0g
	8WV2aa+miX7VBLTGGaD2W6RSn3tJ1582xVQcKsbtyX1jU7+Jau1LTTEYpjTrveBEL0YMhR
	as7/WSVTAJxZ+Coxk37abQehBQKDLEURQjY9PKArOLUvsBUduV0X4M9TNfvz3LvNvvevQZ
	dSMFEI+nHHQgONc7xVJEGinvzfxDX/tMPfGA0IhVvgz67mnliR8ikCwj/J6M1TkjtTVOj3
	zp2EwfKHSnSznZN4UCuRjCfhrFvCu61mof4olf6NpbOcqmN0tMDPyiLyKp/XMA==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v9 1/4] bus: simple-pm-bus: Avoid inconsistencies between probe() and remove()
Date: Mon,  9 Nov 2026 15:08:39 +0100
Message-ID: <20261109140916.90625-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109140916.90625-1-herve.codina@bootlin.com>
References: <20261109140916.90625-1-herve.codina@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

At probe(), operations done depends on device_has_driver_override().

At remove() a call to device_has_driver_override() is also present to
identify operations that need to be done in order to revert operations
previously done at probe().

Nothing prevents device_has_driver_override() to return a different
value when called at probe() and when called at remove(). Indeed, a user
can set driver_override (or clear it) after the probe() call and before
the remove() call.

In that case, inconsistencies are present between pm_runtime_enable()
called at probe() and pm_runtime_disable() called at remove().

In order to ensure that pm_runtime_disable() is called only if
pm_runtime_enable() has been called at probe(), use the devres version
of pm_runtime_enable().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260630105701.7D0471F00A3A@smtp.kernel.org/
Fixes: 98e96cf80045 ("drivers: bus: simple-pm-bus: Add support for probing simple bus only devices")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index c920bd6fbaaf..4322a778e801 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -29,6 +29,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct of_device_id *match;
 	struct simple_pm_bus *bus;
+	int ret;
 
 	/*
 	 * Allow user to use driver_override to bind this driver to a
@@ -66,7 +67,9 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed enable pm_runtime\n");
 
 	if (np)
 		of_platform_populate(np, NULL, lookup, &pdev->dev);
@@ -76,14 +79,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 static void simple_pm_bus_remove(struct platform_device *pdev)
 {
-	const void *data = of_device_get_match_data(&pdev->dev);
-
-	if (device_has_driver_override(&pdev->dev) || data)
-		return;
-
 	dev_dbg(&pdev->dev, "%s\n", __func__);
-
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int simple_pm_bus_runtime_suspend(struct device *dev)
-- 
2.56.0


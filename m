Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233388;
	b=sHR0DmPDMAB9ZbuejOw8NpPRmPeXLRvh5ZsF3cn3Fh4VAYY71oqdV9ibPLoTWCfoI5Wp
	 pTdMG+TN9MlqVkg8nvYkq8iJWXy2S3yyMMPY2mz9v0POsYlQqhj9etJrOUyUeZzmpzT7g
	 B7PshoFFZRRFhhRgQjWWbeXUPYYZIvEoyvSZLKfWJ1R/P6pkMIsvu0UUgmeTFNENke3b3
	 lCXhlTcB4zCU/tZMQ31Gp4ldLPI12fkuP3dEtlUVcmYtFS/4SSEpax85sJCOjQtVIRWlb
	 U8R+Y2RCgSZJqPVSR/31TFx5yY2oSSpvE0Nu5vhNg0X1/2/KzQAcvN+uCtg4WZwxqNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233388;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=yeA4qHAALZZrIqz65amctTB+fqUgwUGBfDhuoDx9XcM=;
	b=195SJNQ6chJLEpc4CXGieXH/7ngwIgNZrLX+Q48tptzsgyW/KPCfR/ItqQsXaNWUnFXn
	 A3S5i0XQkUWRinlIjRyR/3jFj2NLT+ALo0Cv0HOhuY1OUwmX0tVQZfEop5LF9f4o30JQC
	 lOzGSbM/gES8DKg9F7kR+EeEGjaVaazppGuURxzlMyJAKh/cjF9wsoI70UJD6mStRYKko
	 g4dxdSTy3E8C8FvciMjo/HSS45qpphqK5dRr/u0k23oyr7dvhKXaJwFxfZu9VPkVTvQto
	 rxW8zQvBAQeSKzZouey1iQYRfDzmukkUdejNKY7Kq0Uf4C2pkqXM/nfacZaDPHpRf1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mPsAveHC;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E59606D80F;
	Mon,  9 Nov 2026 14:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E59606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mPsAveHC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6FBCB4E4155D;
	Mon,  9 Nov 2026 14:09:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DF2460051;
	Mon,  9 Nov 2026 14:09:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02EC6103292D3;
	Mon,  9 Nov 2026 15:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794233384; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yeA4qHAALZZrIqz65amctTB+fqUgwUGBfDhuoDx9XcM=;
	b=mPsAveHCMUVyL0Im9uNtaYBOUGuQN+IKYBW/hdBRks6vATDmJqFiNOoEmiUKa1nS/J2d+T
	2boX0H9bLlJGJEzAUfi46d73jqw1ANqw7EEdI4avhjCLDQq6hi8axqfJLPNn1rJFxNoU5l
	WpenMfq1D9JEz8bGHOlSTW1UCR3ybANHzr4oIpI9ckbMg6id9hKOXwXK1abachs0sx8dcg
	2w3aqfjVSDFg4mtPy0o3fASnKeu74Xn3ZNxxqKbkE5TlDrF49Y83KszYJfJ514JWkBOr2x
	eLe/mdFtPj+/iJpWV4+eABCAYNYZHDhxzpxmLfSlYArQQZkhj1eE82nOoJctGg==
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
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v9 4/4] bus: simple-pm-bus: Populate child nodes at probe
Date: Mon,  9 Nov 2026 15:08:42 +0100
Message-ID: <20261109140916.90625-5-herve.codina@bootlin.com>
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

The simple-pm-bus driver handles several simple busses. When it is used
with busses other than a compatible "simple-pm-bus", it doesn't populate
its child devices during its probe.

This confuses fw_devlink and results in wrong or missing devlinks.

Once a driver is bound to a device and the probe() has been called,
device_links_driver_bound() is called.

This function performs operation based on the following assumption:
    If a child firmware node of the bound device is not added as a
    device, it will never be added.

Among operations done on fw_devlinks of those "never be added" devices,
device_links_driver_bound() changes their supplier.

With devices attached to a simple-bus compatible device, this change
leads to wrong devlinks where supplier of devices points to the device
parent (i.e. simple-bus compatible device) instead of the device itself
(i.e. simple-bus child).

When the device attached to the simple-bus is removed, because devlinks
are not correct, its consumers are not removed first.

In order to have correct devlinks created, make the simple-pm-bus driver
compliant with the devlink assumption and create its child devices
during its probe.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 23ac18551fd9..569580788575 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -26,6 +26,12 @@ static void simple_pm_bus_depopulate(void *data)
 {
 	struct device *dev = data;
 
+	if (!pm_runtime_enabled(dev)) {
+		/* No PM runtime, we can directly depopulate */
+		of_platform_depopulate(dev);
+		return;
+	}
+
 	/*
 	 * Bus stays on for children
 	 * This ensure that the bus will not be put in idle asynchronously when
@@ -83,16 +89,23 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	match = of_match_device(dev->driver->of_match_table, dev);
 	/*
 	 * These are transparent bus devices (not simple-pm-bus matches) that
-	 * have their child nodes populated automatically.  So, don't need to
-	 * do anything more. We only match with the device if this driver is
-	 * the most specific match because we don't want to incorrectly bind to
-	 * a device that has a more specific driver.
+	 * need to have their child nodes populated. So, don't need to do
+	 * anything more except populate child nodes during this probe(). We
+	 * only match with the device if this driver is the most specific match
+	 * because we don't want to incorrectly bind to a device that has a more
+	 * specific driver.
 	 */
 	if (match && match->data) {
-		if (of_property_match_string(np, "compatible", match->compatible) == 0)
-			return 0;
-		else
+		if (of_property_match_string(np, "compatible", match->compatible))
 			return -ENODEV;
+
+		dev_dbg(&pdev->dev, "%s: populate only\n", __func__);
+
+		ret = simple_pm_bus_populate(&pdev->dev, lookup);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret, "failed to populate\n");
+
+		return 0;
 	}
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
-- 
2.56.0


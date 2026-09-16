Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A7513577;
	Wed, 16 Sep 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566487; cv=none; b=AOysbPWhd4XXxDw41zhAuZJJLQ6a8gYQDFnRoG1urwr3BfFQ4j6nCoRucya4QEBue2x8A0aGfGhtZWjd+pTOfuAoL5zpWZNxeSXF9XutSR880oyUDx/43gzeEonjoII8lTFeyVAiJoMnTbrNvqX7wwZoixNfMXD58Tpc95Wf1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566487; c=relaxed/simple;
	bh=KgRqVZhuIqccDBptd5H7jS0b+shb+kbhgsSEI1yzP7Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nfN1A/eqCnNwzu00PhVe3eczgA/TulQoJfrYrssUbrdoHUieycPIT+umN7Vtx4y95nEhw64KwqUDVU1g+9LwslGkz3a9cqhpvLUTSgXOq3Uy0uuVBt2HyiwjMtrXKjWAR52Ir10QI+9SoZRAGfcn/BG1BNdm9K3AQa9MFal0N8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=g1IWz/nB; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="g1IWz/nB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789566481; x=1821102481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uv6hp7i4N5YS+pKFhV7bFalg/lcrIhDK/1aui+xYsAA=;
  b=g1IWz/nBZHe+arTnVgzHi6iHRDh6VOcg5ASlf2uD354DGoayZojB7iY1
   1ZqdRLxyNoMhMIxNPAluMYliQNZqLUvn5zEfBKyWC40olAHFwDeumKsjg
   nBtV6NkYTKL4r+orJXYFPx/LDQ41a9Nh24Al3CuJxlyxVskyO3k+dF16T
   /J4bwU18FhgrvtVkiNVfrTrZD0xw4YyxrFwp7Oje6+YpibLUjBoXKqLSk
   cWrthPFt5Pbf6eJMqknbHzbJUWGa03x5RAq0ebGDNKdvPNuyqyRP8PKSV
   1rKGdKzFIBxoovcGQ77ijg+PEeZTIUYP9Rd3F1d0jiXOENM+GDyzV+VqM
   Q==;
X-CSE-ConnectionGUID: iF9fap1MR02jnK1yFafbOQ==
X-CSE-MsgGUID: OI/sbtr8S7OSbxpuTugc8w==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28862260"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:47:56 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:28690]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.120:2525] with esmtp (Farcaster)
 id c4debe2a-bb87-4d90-8786-2c3b32141680; Wed, 16 Sep 2026 13:47:55 +0000 (UTC)
X-Farcaster-Flow-ID: c4debe2a-bb87-4d90-8786-2c3b32141680
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 16 Sep 2026 13:47:55 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Wed, 16 Sep 2026
 13:47:53 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] pps: clients: gpio: release pins to idle state on remove and shutdown
Date: Wed, 16 Sep 2026 13:47:44 +0000
Message-ID: <20260916134744.46354-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916134744.46354-1-farbere@amazon.com>
References: <20260916134744.46354-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWB003.ant.amazon.com (10.13.138.115) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Some boards route the PPS input GPIO through a pin controller and mux it
to another function when the pps-gpio driver is not bound. The driver core
already applies the "default" pinctrl state before probe, so the pins are
muxed for GPIO/PPS use while the driver is bound without any driver change.

Nothing, however, hands the pins back when the driver is unbound or the
system is shut down. Select the "idle" pinctrl state in both remove() and
shutdown() so a board can describe the alternate mux there and have it
restored, for example before kexec.

pinctrl_pm_select_idle_state() is a no-op for devices that have no pin
controller or no "idle" state, so boards that do not use this are
unaffected. The "idle" state is only looked up and selectable when
CONFIG_PM is enabled; without CONFIG_PM the helper compiles to a no-op and
the pins simply retain their "default" mux.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/pps/clients/pps-gpio.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 73ec2c7335e5..bdedbed82d82 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/pps_kernel.h>
 #include <linux/gpio/consumer.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/timer.h>
@@ -216,9 +217,26 @@ static void pps_gpio_remove(struct platform_device *pdev)
 	timer_delete_sync(&data->echo_timer);
 	/* reset echo pin in any case */
 	gpiod_set_value(data->echo_pin, 0);
+	/*
+	 * Release the pins to their "idle" state, if the board defines one, so
+	 * they are handed back to whatever function uses them while pps-gpio is
+	 * not bound. Boards that do not describe an idle pinctrl state are
+	 * unaffected. The "default" (active) state is applied automatically by
+	 * the driver core before probe.
+	 */
+	pinctrl_pm_select_idle_state(&pdev->dev);
 	dev_info(&pdev->dev, "removed IRQ %d as PPS source\n", data->irq);
 }
 
+static void pps_gpio_shutdown(struct platform_device *pdev)
+{
+	/*
+	 * Leave the pins in their "idle" state on shutdown so a subsequent
+	 * kernel (e.g. after kexec) finds the pin controller in a known state.
+	 */
+	pinctrl_pm_select_idle_state(&pdev->dev);
+}
+
 static const struct of_device_id pps_gpio_dt_ids[] = {
 	{ .compatible = "pps-gpio", },
 	{ /* sentinel */ }
@@ -228,6 +246,7 @@ MODULE_DEVICE_TABLE(of, pps_gpio_dt_ids);
 static struct platform_driver pps_gpio_driver = {
 	.probe		= pps_gpio_probe,
 	.remove		= pps_gpio_remove,
+	.shutdown	= pps_gpio_shutdown,
 	.driver		= {
 		.name	= PPS_GPIO_NAME,
 		.of_match_table	= pps_gpio_dt_ids,
-- 
2.47.3


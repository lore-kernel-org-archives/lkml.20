Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588191;
	b=RJePEosCj26ul7y95f8bod132KXSNb8SIZhA+ufeMSxmHUwvinn/O9S1fzZBdufdybAG
	 lYJN03uDi6PoK1peWONphN9OYBh1fInMyXfwaCEhplYLxkTOmQwbdb9ZkoIloneNEYiF4
	 TMTHgouDk9LTMmV6n3LmCmoS2e8jDGN8/4DUbyPSn2zL/TGVKdsnZmNFHDOy2IFZqSI6L
	 iEYGUhfWSXSkkZhehvYYM36Z/8dG1O8Ie71DrIw1dwWiQD/uLtw0Oz7d+GM5CJKkEynwb
	 nfYrO/jeMIjrmVUnkZRutJe5ND7BCEd2911J9DF/05cH5Lgp9nQ5pXFVBYQDxl7U0Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588191;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cBo38zZJkNnW47FXR3fIHATs1fxo4+uWdsNkjEIJPfY=;
	b=2sBUr6giwVez2GKcu+I/96sa0GZo3iniQc1KYW/x2SirBx21uLNWA64NkwKgjIPp6/2w
	 yvIQMzXdrugizeSI6BrbJHhWVlSnAK+vDJ16XHARAPZ2valD09sa2M5tyUn8MhlOQAqv6
	 4WAUsiCXlI5+QRmsvznhnkZqngv/ZucyTN9OgsgzhD1e0KjLZcHFBCMfilMZpqs66iwg8
	 1+7mKt0OKhrgPdmYRgFhtbKw6D0fRQQN3KwcnofsdWxAMcCjkST0R4vSYxyti5lg/B+BO
	 ywFxJDJWpIJyj0y0GaSh/b7y/fViT2DJcupRVxA6O1o7tGEslbrVjRn/QUM5XgB1Fww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=b+VbuOYM;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE0606CDF7;
	Fri, 13 Nov 2026 16:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFAE0606CDF7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=b+VbuOYM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588181;
	bh=YZnixClu5S0XwYLBxOhAIUMM3nNBT7+XQ/8KpkQPw0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b+VbuOYMYP+TlbgMKVwznaXzUoMNoSrwYYJ118XRnFExe0qSuhePgN14lTJtpnX0M
	 rtOvEIIcVsI8N/I/Qa29BjQJI1OXKk1ehHGDkqoWATvIUMcOQexh+V166p5sFW+30W
	 WnWDAYPkNEBtLDI9P0zGWXY5pn/TrOP6Q29hM436zrz9mPBp6DbAlvgBkCTiYd+USK
	 74ayPCBST34YMk/yZrt46pGyIRhnZH2Z3YSBLY/S+DPIAV+v3evlE2bw03OixalcrL
	 PklYgLYRMGjSbTgapztDF0soYtq7DJXSr9iiBdk++/XjWu5cQ8KQ9D3L8c5Y4Qq0eY
	 2gbQkvUmslQ3g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B3DB17E36A3;
	Fri, 13 Nov 2026 17:43:01 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6B577480041; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Nov 2026 17:42:44 +0100
Subject: [PATCH 8/8] usb: typec: fusb302: drop custom gpio interrupt logic
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
Message-Id: <20261113-fusb302-probe-cleanup-v1-8-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3478;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=YZnixClu5S0XwYLBxOhAIUMM3nNBT7+XQ/8KpkQPw0w=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhQbMNDy/lvzZKvrAdc4ErN/yZaRd5ryb
 i+DtcC47xO4AokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4UAAoJENju1/PI
 O/qa8KYP/jATsgGEeLnGYVe82YxfGqkodlT5btKsI0hO5F0GY56hlt1bOgumynLFu0l8qIOrhgu
 8ZAlzYMXbld6Pncy4/XenzWkaDyVxwJtJed21+2ZZjz6lQSDsupMcm6IyQkokY+sipd/jlt5Zxc
 +edYxpluoazYTLXIOgzlPRUWdqXopGmRZDr0hYmn8JIjeVT/RpsY95dxaSfXIkjJhAyj4gK6kB3
 ihVgU91DMz3umUt8FgPqXlcF+Iz88fIh/tgnnGyGuSO2HRWkSBZK4lgxBcJX5qBsa30nwJHD0cr
 NBbIazyMrrxvffSp/Ww9gS0oT92lq6zQhZKjGFcRKkBYPoOlwQfMl5hJSV5ecdoVcNwwcGL/NIT
 hRAhciklruk5V7Yl3xbToLQP1WE50nZSeQPdviZcl41lI5RXo7N+Xs3qZYLhN0MWuqnAXpZ9mo/
 rgF8fFXQ9hb/PJ9nkcW1iLctObc8TzfzjsRaI/mGrL7XVcqPjGU2CVP5DcxOciSCDK/xz+ne2Tj
 Ozj0BsO9ELi5ltMw05pAT96xEm0BUXJzaKBsObInbxKNtDew0ywS1OV5K3GhnkdWcWsdFTTbQPr
 dVGMKr8u9EfQ3BrqM15Xtw5JjrIlPUb87m+GDzSSGeKRLKQSyJht1rUxokksPw++yMOswrmJRHX
 VPSPmbi2MpMuHNq49Ths1FA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When the driver was upstreamed it contained the logic to fetch a
"fcs,int_n" GPIO from device-tree, convert it into an interrupt and use
it. This was never part of the binding and there was only a single
upstream user, which got converted to follow the proper bindings in 2020
in commit 89ee3ace7292 ("arm64: dts: rockchip: Fix Pinebook Pro FUSB302
interrupt"). Drop the custom logic and only allow the properly
documented ABI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 6105f09f96aa..c392134cdc0c 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -11,7 +11,6 @@
 #include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/extcon.h>
-#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -86,7 +85,7 @@ struct fusb302_chip {
 	struct work_struct irq_work;
 	bool irq_suspended;
 	bool irq_while_suspended;
-	int gpio_int_n_irq;
+	int irq;
 	struct extcon_dev *extcon;
 
 	struct workqueue_struct *wq;
@@ -1495,7 +1494,7 @@ static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
 	unsigned long flags;
 
 	/* Disable our level triggered IRQ until our irq_work has cleared it */
-	disable_irq_nosync(chip->gpio_int_n_irq);
+	disable_irq_nosync(chip->irq);
 
 	spin_lock_irqsave(&chip->irq_lock, flags);
 	if (chip->irq_suspended)
@@ -1639,24 +1638,7 @@ static void fusb302_irq_work(struct work_struct *work)
 	}
 done:
 	mutex_unlock(&chip->lock);
-	enable_irq(chip->gpio_int_n_irq);
-}
-
-static int fusb302_init_irq(struct fusb302_chip *chip)
-{
-	struct device *dev = chip->dev;
-	struct gpio_desc *int_gpio;
-	int ret = 0;
-
-	int_gpio = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
-	if (IS_ERR(int_gpio))
-		return dev_err_probe(dev, PTR_ERR(int_gpio), "failed to request interrupt GPIO\n");
-
-	ret = gpiod_to_irq(int_gpio);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "cannot request IRQ for GPIO\n");
-
-	return ret;
+	enable_irq(chip->irq);
 }
 
 #define PDO_FIXED_FLAGS \
@@ -1751,13 +1733,10 @@ static int fusb302_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	if (client->irq)
-		chip->gpio_int_n_irq = client->irq;
-	else
-		chip->gpio_int_n_irq = fusb302_init_irq(chip);
-
-	if (chip->gpio_int_n_irq < 0)
-		return chip->gpio_int_n_irq;
+	chip->irq = client->irq;
+	if (!chip->irq)
+		return dev_err_probe(chip->dev, -ENXIO,
+				     "missing interrupt\n");
 
 	chip->tcpc_dev.fwnode = fusb302_fwnode_get(dev);
 	if (IS_ERR(chip->tcpc_dev.fwnode)) {
@@ -1788,7 +1767,7 @@ static int fusb302_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = devm_request_threaded_irq(dev, chip->gpio_int_n_irq, NULL,
+	ret = devm_request_threaded_irq(dev, chip->irq, NULL,
 					fusb302_irq_intn,
 					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 					"fsc_interrupt_int_n", chip);
@@ -1805,7 +1784,7 @@ static int fusb302_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	return devm_pm_set_wake_irq(chip->dev, chip->gpio_int_n_irq);
+	return devm_pm_set_wake_irq(chip->dev, chip->irq);
 }
 
 static int fusb302_pm_suspend(struct device *dev)

-- 
2.53.0


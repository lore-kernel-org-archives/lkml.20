Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243764;
	b=Y/HXOlAUItTOWUuJAtg61CRldDACZ/V+FkHi6OWPRkQ9ywvkO5xdNb0C/oCcLZMfc6Ck
	 Kjy50pvYOPsLcyZk8VGV6LT/U3ZhHLECg/csnOAPhWqB6PiYSobyFp9sp+XSNSWThsX32
	 hsKdImXQ98sG4ZEUZt2e9TeY+dW+woQmG4oKY1d7ukGyryE+77VhHDn6YYpXNEe2n+HZt
	 2DVYsDkCOyrttGG05qz6VRbHoIQ5PKH1Dj8f8UelT2xrJJFL5epmm6wDLW3765eB0glpQ
	 8ZhQmeyyDsM0nhh0HluzefLMqQ+lHnV/7SBqZOLoH0e4Mv4RFGPx1ZiTJYzPHBBDmsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qY0mbUZdr0ztNMcKxMffZ/lOFKEQtrLqkPhKXm8ABiA=;
	b=nr0XTF+LZ3qW91S4bqdJXR9J4+TxYXg4zJuN2ShMkoUUsBZKkNDaGtT8BH7nEN29/1iT
	 AZ13UT1ZQTLIvORXsUYgRB37c40CCh0JGdyh/7RUQu6XzcDb1LDbKDQ1xqfKa6K0cINEz
	 rWlc6uHcaWk0v3bUyApyiqlTQwVZqkYV1X83evYSt2tdFU1E+Pa1a2C86Tm0LzxZEcFU6
	 LajiH74i2o8/nQt2z5LppMm3/BY7ghyiVSiJXjCiZVOgKj2cm2ZDW8Vs/HZ77rU5gdmUx
	 5D48uKvYG8sczpdv8T+gRp1/cKmDqQwXbQuN66MFyVxEUdZtgBfYsEZux14v5omxrvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkcL9Mlc;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD10606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkcL9Mlc
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so2006816eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243763; x=1794848563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qY0mbUZdr0ztNMcKxMffZ/lOFKEQtrLqkPhKXm8ABiA=;
        b=hkcL9MlcORBXFvbjWtWcHkl0IKHVpAmxnnQgf2LS6YqMGeO/zPObjXVUOxlRMnVb5+
         s4kcVwj5dlgWXKN2lkV0A5hVitLtkAJLD8ASx5PIpRRX7b5wuc0Kfm3g19216Dw5SFPo
         u+Tu0TOdt2sinQoAkOk8nScZBW+EiANXU7OV2HiV8MSjuxNLjBQM0/xrX9zP3Jaf2im9
         l1PG7TMkj3JLc2wl0eZYUmN+9xj1jq0uv6ug74TTtX4o0H6gzslJDoPAdoqKwkKLrV/l
         lgxFCJUCaDzWnK+9kknncAg6AxD6pbvYdvpg6dFOGTV3KiivH/ehoCltF2NVftNbOPrO
         zKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243763; x=1794848563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qY0mbUZdr0ztNMcKxMffZ/lOFKEQtrLqkPhKXm8ABiA=;
        b=T3S7yz4ODdWqSIH4qrB7ejQldNPjPkQPSJ+IPLrooJZcdLjsw05v1pNTpI3V51jnse
         aw+fAI8ujYkPk1WjXgfZRve8emw/V7bnpb5evfzFkfA8L5YIoGWzBbiNLxRMvYxsdgeV
         URF/ZdDvReIzPaU6Poqi8MrdrHd0/LVamVDPG0dgh08gJHTdZouEegfPRjy/e6He3/TZ
         RA6KMw7VxzLmYuhKocasOCs+aqUj8HQ2kueBxxfHe24IzsK4q1YsuMToM+QRaeSU/f7d
         7DZqoXygBgSfkxt2ec7ZnQFFJEmdsOiERL8bOUDONJroeqPKFd0x4E/0lcs2X28qnMwz
         caYA==
X-Forwarded-Encrypted: i=1; AL+hErER/rrw9FIOGb/0VOYPbt3J+G0gSh6qPsK5oOL+0Zd/qjaVRZruDH+LdIuV6kXB3veAOHp8NWkhUKleCo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wJnRIaIp9PzMjinKm5H8KJ2V2yLG1NWyZ/6srdgSNddxCjkSY
	4TrxA8lqbnuo2pInDA1D1X0tcxoVF51Ke0qm5tr7o5a3i1C8J0L0CVi8
X-Gm-Gg: AYBFou3Yw6qxRsxpLXJJycgtwn5uHvjhPv0TKYPWv6bP0/4pTxWomoNFGZ0DPDfv2wW
	2nhpKgjEq0euOIrZe5Gxv6gDHuycYBKlMg908nUlrk33xxtMaWOgspuQoAthoFsYGLBCdNTekFC
	jbL/n8EJ7PrZWzys7T+Y1ll0lXNyFw5dZqZJwUCWywgxwfmaqQBVa/gkJ/h2hYiOAydGg6bY9c5
	jW4WxvILTERIGruOTSs590pNqfquScucQb8oB+Ei/IJ18S/iQBsAh2j/kYeSId4OrkQGf/rl7dL
	RlARD1jgzMcB0akjGa0UuipSUoz1k0M8S/lDEjeNLnVtGkBUIFZN9yr44p206EIxjZEpgaUpLvz
	7iO8szDO1Ct3IbaTnhKaK7CPxk0t5b+XyLH/xX07icomz6p3N67Xj0tP7S7iC2Q7dH8PwTnP9go
	U26+MfmLux8oysldEsWmAsfe5i18C3oGMCuE5hM3hQcQQcra87X76NlzZcGDE7VmnL7tv/h7nCY
	SqtX04LSpa655w5HQYox4hcGDtn4A/KDlk9ihTL9APVDVG5xk+xgphV2vWqpxP3y/oZL5Q797F+
	jRevSaWZSu1G1SZWoVSjvIxJodRxZVoQ7jLterDp2aJbjrbvHPbEg6mDRkS6podxD+LkNw==
X-Received: by 2002:a05:7301:18a5:b0:36a:15ee:c20e with SMTP id 5a478bee46e88-37258658bc3mr7702403eec.33.1794243762677;
        Mon, 09 Nov 2026 09:02:42 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265618e11sm13726894eec.7.2026.11.09.09.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:02:41 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Ray Jui <ray.jui@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Raviteja Garimella <raviteja.garimella@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] phy: phy-bcm-ns2-usbdrd: cancel extcon work on unbind to avoid use-after-free
Date: Tue, 10 Nov 2026 02:02:23 +0900
Message-ID: <20261109170223.1829473-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

ns2_drd_phy_probe() schedules driver->wq_extcon (extcon_work), which is
also queued from the ID/VBUS GPIO interrupt handler gpio_irq_handler().
The work handler dereferences the driver data via container_of().

struct ns2_phy_driver is allocated with devm_kzalloc() and the driver has
no remove callback, so on unbind devres frees it after probe's resources
are released. The GPIO interrupts are requested with devm_request_irq(),
and so released by devres; free_irq() only stops further interrupts, it
does not cancel a delayed work that is already queued. probe() queues
wq_extcon with a debounce delay before returning, and the GPIO interrupt
can queue it too, so on unbind the pending work can run after
ns2_phy_driver has been freed, dereferencing freed memory (use-after-free).

Register the work with devm_delayed_work_autocancel() instead of
INIT_DELAYED_WORK(). It is set up before the GPIO interrupts are
requested, so on unwind devres frees the interrupts first - after which
the work can no longer be queued - and then cancels the work while the
driver data is still valid. extcon_work() does not re-queue itself, so a
single cancel drains it.

Found by static analysis and code review; not runtime-reproduced (needs
Broadcom Northstar2 USB DRD PHY hardware).

Fixes: 787f24543c4a ("phy: phy-bcm-ns2-usbdrd: Broadcom USB DRD PHY driver for Northstar2")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v2:
- Reword the commit message: the GPIO interrupts are requested with
  devm_request_irq() and released by devres (not "released with
  devm_request_irq()") (Ray Jui).
- Place the new #include <linux/devm-helpers.h> in alphabetical order,
  after <linux/delay.h> (Ray Jui).

 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
index 171bf09..4b8930b 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2017 Broadcom

 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/extcon-provider.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
@@ -339,7 +340,9 @@ static int ns2_drd_phy_probe(struct platform_device *pdev)
 	if (ret < 0)
 		driver->debounce_jiffies = msecs_to_jiffies(GPIO_DELAY);

-	INIT_DELAYED_WORK(&driver->wq_extcon, extcon_work);
+	ret = devm_delayed_work_autocancel(dev, &driver->wq_extcon, extcon_work);
+	if (ret)
+		return ret;

 	driver->id_irq = gpiod_to_irq(driver->id_gpiod);
 	if (driver->id_irq < 0) {
--
2.43.0

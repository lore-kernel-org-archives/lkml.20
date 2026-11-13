Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588191;
	b=eR6O61Fhvsw6s8+yOQbZKGSvUq78gdYDWb+EAEOVpFowgP8W+KgzJDRObp/RrkUV2nQS
	 RriegKDnuUtpc6LxBP09VA4dMoKmiY1gkNm76OG9IxS4xmJP37pv7WmsY4lhVBHI1BQM9
	 zTccbW91aYyCxh3/eKXn5tAb2rfp/uBO6PhZSMgsukYfmZtpu3HHCOOzlhai9eUTIVqI7
	 aEelQlrWYKcqK6NqAd3jye3YDBQ+sSbRT9z94+KsyZ2+pagl652ibs96zdSBY2fm/wFFP
	 o2tlg++g7A77yS9l79fkLHkqzT7sYIFutb2zZ2kRu13nCMEI2EQtopTNdPEHh1lh2MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588191;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=a56YD2ooIjSXIZl/nWaph56Vp7INQDG2d1B1RufEDAY=;
	b=DakyaDuVAyVFZHncMlFkQw6ka6cpeJIKFQfT6gssGG6eIbmHaf2fo3kiIn/biX7pSlGR
	 FvhhUXiagL21WC+nr5z4ABzXveSidZy2gUz6dwbc5tt7ZczAfJzwv4EzsjmgyCu4aeAyg
	 6dmwzC/7RrVnO0MzamCqSWtjf+Nqua/HOHiDnkHJcpfYnvMOrlfARAlMQ79sy8I8XYn0d
	 mv7WUgBIlaACdB3GY2UVkzO5RHIizz/kBwP8jrF8MAFc2GOA9GqkjCRMYzhaZqGGfpTvu
	 9EYNqwtOmOSjNZLkmbG3HmSHMdYWYmK5OZg0WvpCh8cF1B24bNd5iaqR0+qOSx65ClQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Fhn+IcsW;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11FD606CDF3;
	Fri, 13 Nov 2026 16:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A11FD606CDF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Fhn+IcsW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588181;
	bh=GlFrJbzLFK+WRqY75D3OWoOb4ctV9AvvTZwRpsTju88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fhn+IcsW3GUWeV5OdllawGhyKP+kHaDne09MPm8Ko7SKm84GWhUG4+cJBLCPg8loT
	 DhBPqRyheZGKEHQmD0i2pkD1PWOUkeWdEriK93At9QlRYPkJc6CO8TZz8EHOBomagV
	 HNwZ5ksm53TsfbCHgFN+NaAoBRAVgLEtSTYFe4z8LNms5YZf6xSiBNvV0KabDr04Tk
	 AMmCGR7XwqZk244UHglqTiD1fj5LpNljgpXLMf+kJDA+mb0QPvtHt/435QCXSltM+B
	 xvervKqjFlq0ZX1SRm4a0Rzr6n7oTHm9mRDenmpLFO8AV3HIzsoxYib+I+JTXMkHxM
	 iqpqN93kPznBw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0285617E14AA;
	Fri, 13 Nov 2026 17:43:01 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 67F9B48003A; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Nov 2026 17:42:42 +0100
Subject: [PATCH 6/8] usb: typec: fusb302: move gpio_int_n into function
 local scope
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
Message-Id: <20261113-fusb302-probe-cleanup-v1-6-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GlFrJbzLFK+WRqY75D3OWoOb4ctV9AvvTZwRpsTju88=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhRx9U6aBA139yx9rAEJP86lTjd8ZoVNA
 nAI8tzlvAeDeokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4UAAoJENju1/PI
 O/qadVAP/32IqgsbRKHQfazi9hd/skCO1ck5wAy+IEsg9puLh+9Gysi5c2+dHWHq1XWVhPtGJqQ
 otU7fvD7V9JBljpa74wqdr4HcsJJ1YzhK7/GayTWK56ll0Gu6CLsGjHFeybn+5cjTBPqDmBCCUP
 0c33Ym6UKb4Z/trz7TtCI9JTW8+TNnnUH7i5QmfTHtah6E7pLc0UpE5/qUQk2H9MgtYJ3xuvVQT
 8tZbd2nJDMSdCIA+OQrb/0zohGhP6Nj4gO56vZ/RCyBDfEUf6SJdUCf0NC6j5DFGAqCfBj0Bggr
 bVLtniGftY7sOoSwM2fLJeD0BFwMEtUkkDWZvk7EN/AvBV1ZSyYTjs/T8JyqHdPCZ3NgG8EKl8z
 txEFXIFsXu5pXYEjy+T9yHECVMgVkgXL8Ryo14D2j5aoNERo38AZvdZpXLB36UtIteYo5S5RcDM
 cGsiot3kiABv0tFJxyNMYRK03X98k4RyfKq0j2G/afJXNual9tkwM22eG8cSAJ9DUkeY7t8/4vK
 Jr8tQTkKgq17i9tW82AC0Kw7iIjv9pOpaVfblUJoV+aB5LGiO2wmwzs8FxajlDHzwhuixivmS87
 qGLxQquU7uibemT0O4sRC7zz6jtnc8HNkDxfUEyRhnAzLJJX4MVgKcrREYKiQGwYVDGI5kzgrPU
 5OrYIrtMh3dSUn9c3yUwssw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The driver only cares about the interrupt and the GPIO itself is
device managed, so drop the reference from the device structure
and only keep it in the function scope. While at it cleanup the
error handling by using dev_err_probe.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 1b3ee5715a74..76851e2b9ce5 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -86,7 +86,6 @@ struct fusb302_chip {
 	struct work_struct irq_work;
 	bool irq_suspended;
 	bool irq_while_suspended;
-	struct gpio_desc *gpio_int_n;
 	int gpio_int_n_irq;
 	struct extcon_dev *extcon;
 
@@ -1646,19 +1645,17 @@ static void fusb302_irq_work(struct work_struct *work)
 static int fusb302_init_irq(struct fusb302_chip *chip)
 {
 	struct device *dev = chip->dev;
+	struct gpio_desc *int_gpio;
 	int ret = 0;
 
-	chip->gpio_int_n = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
-	if (IS_ERR(chip->gpio_int_n)) {
-		dev_err(dev, "failed to request gpio_int_n\n");
-		return PTR_ERR(chip->gpio_int_n);
-	}
-	ret = gpiod_to_irq(chip->gpio_int_n);
-	if (ret < 0) {
-		dev_err(dev,
-			"cannot request IRQ for GPIO Int_N, ret=%d", ret);
-		return ret;
-	}
+	int_gpio = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
+	if (IS_ERR(int_gpio))
+		return dev_err_probe(dev, PTR_ERR(int_gpio), "failed to request interrupt GPIO\n");
+
+	ret = gpiod_to_irq(int_gpio);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot request IRQ for GPIO\n");
+
 	chip->gpio_int_n_irq = ret;
 	return 0;
 }

-- 
2.53.0


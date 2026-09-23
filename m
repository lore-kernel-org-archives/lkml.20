Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F00425898
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189137; cv=none; b=V7gYoJXO2weLPDCXjehAK0QwE59nI+I/8UplbQAPGu5qjVXvc68l5iPJjvdg1Np+0+S5FlHTqFa5Pq5gipJ4F33qPp3oi2gOHaD4BpglI33Lru3cMQOEGqUEzps5K9J/dR8voUwMx47zAPFCHXhHdHN1gBWp2rF4I1i2Y2aYbSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189137; c=relaxed/simple;
	bh=nvNnLjE/d1Qmm+m3sMt3041G93z8fEvRmrRp8AFTuEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BguQsnq+95GY0IdP05QZvG3yXYw2gCE6nEXYlvSn+JgraW4eOalONMJSgKfX0V5ZtzVMVaoaDBbiGO/huyeLbX5kBq8s2AfjohnO84FRlcj4kLklzEUCVUQTQE41/GvHo6eYMhTHm+eru9nWHogb2ppH1Y8pnZyoG8Pn59txtwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJXOke6I; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJXOke6I"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c6e580fso424308241.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790189125; x=1790793925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOfeQ15b3E2+kaWVk7ZQ6pHBUpc05XcoB8FmwWmuDUo=;
        b=oJXOke6It21Apnsw7bHMRlYyLhcKdXBdGDXgj7hfvAya8ZFFO/TS0Our0vtQBqQmRZ
         MLAosUp9FISNDFVi0zU4EnbkN93K4FZqs1IvhmcWISpZCcHiwFW8ET9tWdt+U/dDAykr
         O9y0lc6bqSL2gw4n1mvVQFLFWh7FSBgZuEK0623xAd9VqsgEImepJE49gz5f7PvcrUBq
         EfqUCqzfydv7QU5eo7Bez+Xws9Qnj8W/2+NXF7dr3dRabjDTn7rAo/iyWwsPTg1O5c32
         A+gzHHqsCSo2UVXFLvMRPh7wCeiQyOsO2COKYPkNqr1bLimtj3wUi/BCn54G0fO57lan
         mKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790189125; x=1790793925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOfeQ15b3E2+kaWVk7ZQ6pHBUpc05XcoB8FmwWmuDUo=;
        b=05W0qmLwSpWbhP44QhYxupWi3xArFkHlCDTpcrcrYaCXsCJSMLDD6fg6lGYxdkZL/5
         iQEEGEyQcAtxD8bjt5ioR+w/Tgj6NGsJRKErpdaBHiHybYR3aVTE7mxpCRZrWfPpJfzF
         cqZf5a684SytbX0v2BNlOsTKOaiFZpiZzKTCZuDeb+Z4IENvzj0DfqRlhVBl1yzr63Mj
         VQgulsPmye7jjgAKyDNY1ioLH9vCvrECxfx6YhQF9qmNOkyVoZN4lJZ82KCWe9NpQFpD
         fYe6/th52CeS8QMc+fOk8SglGMkvvcU5sXrtEukjH/WFt9rTBe+wZkzgD/AlFW4evt/c
         aYOw==
X-Forwarded-Encrypted: i=1; AKwUvBw7ojIqSRW+4W3GwtitjHvRCAy6uLemH+rNKMzRZgjHkqGDWD0j4VWWI3raacZgNGb9gPQ6Jev2jOkDqN8=@vger.kernel.org
X-Gm-Message-State: AFuF++njfhoBXbPxv5bT1VywDt8jLSg/5dC3UJDDwfBM3/Le72pm2Dgh
	421Vr5UjFOMDCU6otmuyNgBnOKV+3aQLl+AbUSH6b/oW5iVHec+KQPDb
X-Gm-Gg: AYBFou0cTxwSV3kyPLIvUypbAZzADhnOGrS7LPPsRKuu4vexfgokGoYnxo3ZzxP1yfm
	ezqVB/lFQ3KtGbZPV7fyoOCQjB7BcwZx8BSvT2/cgEHlWVFF0jYvqn/pUi+WpOfitsz4CSwsvuA
	pwd9ubwyjBm64G/J5k+dmcE6zdHE4fIZ+DLt2wRjN2yeZFxo/T7PjDXI6F1XipFCwhb7eHqxrkv
	LRNp1dzS0qxuAhj0NZN8+iGEyMCgBrXFbZjJzRjNhZYDrEjjutN5hhYKS8RZjZWjwQUGyaxUzw3
	8QV5kdp7jRYK8dyJpYCxHXQ0LrtOmTd+NkQeaKNRqt2IRYP9//wjATNF3obpKY5DTZlxOMkOfb1
	Vr7zEJJJPTcYb4Q//4/7OvhMATrjv9J9ZP8jld6GrmahAJvpSVvmp6e5LBB2RCRKptxc61ZMQ34
	r9vHq3InIavlBMZNwDqI/XxMfWsRPs7KFD5HJlssqdEZ8Pt1goGMw5Yya2QmqB03V57JZErR5y/
	ZTvd1anJ6e+3Qq5bdlgMtbb75YpzPa1kjVtuht7CGYsmh/uSoEWpWy+wXi4WANxa8VHhlfSirdC
	P+ZI4Szo4dyhUU2FzCG5R1uHkhu/S96UXgZ+/2L4sTbSpmukXUmRQze+
X-Received: by 2002:a05:6102:41a9:b0:7a8:3fba:361a with SMTP id ada2fe7eead31-7af1f3f6a52mr75793137.37.1790189125139;
        Wed, 23 Sep 2026 11:45:25 -0700 (PDT)
Received: from ututo.. ([2803:9810:87dd:de10:d33a:69d6:aa79:a5ec])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm4303825e0c.18.2026.09.23.11.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:45:24 -0700 (PDT)
From: Lucas Costa <2000.costalucas@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Costa <2000.costalucas@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] spi: bcm2835: fix device_node reference leak in bcm2835_spi_setup()
Date: Wed, 23 Sep 2026 15:44:50 -0300
Message-ID: <20260923184450.135601-1-2000.costalucas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a device_node with its reference count
incremented, but the function bcm2835_spi_setup() uses the ret value
in the loop to check a condition and never releases it.

Store the returned node and drop it with of_node_put() before breaking
out of the loop.

Fixes: e19c1272c80a ("spi: bcm2835: Restore native CS probing when pinctrl-bcm2835 is absent")
Cc: stable@vger.kernel.org
Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
---
 drivers/spi/spi-bcm2835.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index 8f8715809c7c..8909757c94e3 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -1226,6 +1226,7 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
 	struct bcm2835_spidev *target = spi_get_ctldata(spi);
 	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
+	struct device_node *np;
 	static const char * const pinctrl_compats[] = {
 		"brcm,bcm2835-gpio",
 		"brcm,bcm2711-gpio",
@@ -1297,8 +1298,11 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(pinctrl_compats); i++) {
-		if (of_find_compatible_node(NULL, NULL, pinctrl_compats[i]))
+		np = of_find_compatible_node(NULL, NULL, pinctrl_compats[i]);
+		if (np) {
+			of_node_put(np);
 			break;
+		}
 	}
 
 	if (i == ARRAY_SIZE(pinctrl_compats))
-- 
2.43.0


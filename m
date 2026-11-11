Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402538;
	b=UyKM4gz4TKhel3jilyX228JHGfAWJ9nf3bPbuxg3dPmfg/yKlgoBExhD7zIQC8/gvE54
	 yRuFhp8RoneQrWs5Xy9YkIoPsOg7pQsjGI4ujgpBVYsqgC/qv9/MyKLjqy/mcwYpJ8NXo
	 NRdg0JHgGhUxwZypbQ7LSlDgEFxMyd4b4fBeEkvgPHIiqjluXXpXQr90XIDRKxqRpeXK5
	 k9TDlgy10+2kQdSfb+Tm5SsV96iTeq2HvpnMANTb1GkGThh6XHULpL7IBuZzcJX5upC0S
	 OUhVBO/0pRIiPenXd9Dpz9MYTNCvhML0UeKzocAw06qCw7qw8kUQIN77FZ1Z74AYYBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402538;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3SdC3dt2/OnQtUxHAEQRzQYhNGYhn5s+4CZQ31/toCI=;
	b=yb/wzq1Le4fuyjLIWaTs4s3egvcFB9riEjX/cU/iox3+ZsrLZBjNiNITqSAQ14Cnjnyr
	 Oa+zcQVI6EIEfXlV2GzX+UUyGzjMW4Fk2eLhAhi8uCaAbgLFiGzr7PQMA6xKiR+5yCsFv
	 Vqpl82f+TSfA7AMXUdl77de+UkAkPn4PpzfBcqePjrpMjEOGo/1jMduz0rt2m9okb+s6p
	 KtwIH2LxFcxYOjfOiqhGbGCf0X4nUl4CUHmZqGfeCBCWHoR2wah04KMsHZXC5v93xU1K9
	 ZwGpJIvBc8jiwE3qAeQeL7jyLnPDuOESqxyFf4wEITs6W+O4OfhDp9eGQVhloxun6QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=GrovqGNC;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B5606A321;
	Wed, 11 Nov 2026 13:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=GrovqGNC
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 2806f651-067e-495c-91a8-450255294020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794402534;
	bh=BMNzAEzF89WajzkKt7m/B3xx6NpvpkYcFNuf+oioYSs=;
	h=From:To:Cc:Subject:Date:From;
	b=GrovqGNCj9lfLwZjSgAJwR9aOqJCkU/FL8fV7YXSu2gsuLOuk7Y8VRH3ogvxp5/G8
	 WqJ4Z+hYPPJl7l8dfs9bh88HknxW7RnFS3VbKyLdHAkpGsvrsW3nojRZy4xQ9JEhYL
	 O2YlH1guA/xO3LysUGXf01VGphQdDuQuPU8JxUMmf46Sjsflnyllyw0q7YvvnnTl8I
	 FsdE9AD1jxqzdvwrNIHVVVBGUmSeynSpqMNDO23r6PwtT5B2nTzVyGrjlSaKf94oLH
	 VIDz/YzvMhTgabuxISbqkACyOTqZorq7ft+OcTP27cQx7sYb/7aDOrcxsi1o55ygdV
	 IEFIjZif1DWjg==
To: westeri@kernel.org,
	andreas.noever@gmail.com,
	YehezkelShB@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH] thunderbolt: Enable runtime PM for the Ice Lake router with the software CM
Date: Wed, 11 Nov 2026 14:08:51 +0100
Message-ID: <20261111130851.62101-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
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

The firmware connection manager reports RTD3 for the Ice Lake router.
On Apple systems the software connection manager takes over and enables
runtime PM only for USB4 routers, so the Ice Lake NHI stays in D0 for as
long as the driver is bound and the package does not reach deep C-states.

Enable runtime PM for the Ice Lake router as well. The Ice Lake NHI
already has runtime suspend and resume callbacks.

Tested on a MacBookAir9,1.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/thunderbolt/tb.c |  5 +++--
 drivers/thunderbolt/tb.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 418ad0a61a..139ef49b49 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3044,8 +3044,9 @@ static int tb_start(struct tb *tb, bool reset)
 	 * implement the necessary router operations.
 	 */
 	tb->root_switch->no_nvm_upgrade = !tb_switch_is_usb4(tb->root_switch);
-	/* All USB4 routers support runtime PM */
-	tb->root_switch->rpm = tb_switch_is_usb4(tb->root_switch);
+	/* All USB4 routers support runtime PM. Ice Lake also supports RTD3 */
+	tb->root_switch->rpm = tb_switch_is_usb4(tb->root_switch) ||
+			       tb_switch_is_ice_lake(tb->root_switch);
 
 	ret = tb_switch_configure(tb->root_switch);
 	if (ret) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e86845762e..eff4a342d6 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1011,6 +1011,18 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
 	return false;
 }
 
+static inline bool tb_switch_is_ice_lake(const struct tb_switch *sw)
+{
+	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_ICL_NHI0:
+		case PCI_DEVICE_ID_INTEL_ICL_NHI1:
+			return true;
+		}
+	}
+	return false;
+}
+
 /**
  * tb_switch_is_icm() - Is the switch handled by ICM firmware
  * @sw: Switch to check

base-commit: 13527afe5f15c60b82920fe9915f3cabf1315302

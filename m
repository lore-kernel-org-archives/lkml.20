Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FCA3DD866
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484787; cv=none; b=OysDVY4LjLylUYf9X77Kw0cQZ5NB7s6/rrUAwQzXzo1wk6j1L7yi8mHna+JUg4nebkD+7UNRZ2ZaOdqE2kA7Bv8DpQZVL7EW5ob9oryVjx3J1aFX1t/dW8kBAzWeLGtpvsLEAi8XzZLJf+bg5mDO7XjTMQn7ObZiVs4H1biQIDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484787; c=relaxed/simple;
	bh=V6k4hsOr+z+jN8GLnIWddKeAE3UAbZEYwhtva3zTSYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7+V/b+ut7bEf1EoMMvKx4M1NDtsiKXhlFMPjUCEYcAECvPTCYFUEj6zqA8ye4lZtEOtOfyBZlRjkVa6mT59ydPwE7l+ifGrzHrYUxOMrii2i/jw6EShluOum5XTlgoYc5fDjL909eukw9RLqNSOKb+pqm0MtmQaNB3u10lMkTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aTDBlHE0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aTDBlHE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484779;
	bh=V6k4hsOr+z+jN8GLnIWddKeAE3UAbZEYwhtva3zTSYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aTDBlHE0vhK6o5IreGPTwxZ2ddAl0Pd+NuJJfKsooKWGuuf3/TmpQzIdUg5jjhszt
	 AftKR3pp7S6Arv6pOzhalwFYvkAkOWuL3LSJSSQN2h9exmF4kqIqnGtwfO++uuoTfc
	 LMVtWTsLgpQAosgFIqcO1rA25KOxFxAKERjfJq8tKimRErgzfbk/a3pylN4XBL/spQ
	 2wbLpLxGUN/l3UrXj0uK2qU6XHY0nyeJ1113JW//bLReaILHtIj35dvEAGBNNfkn1M
	 JBU03c2XhZDi3yDHfN1CX87U+E/CHXtOAv7HB12DqQ3umSI+mOup86kSw0OSB0oDAV
	 utEynti/HvTjg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0832217E0E2F;
	Tue, 15 Sep 2026 17:06:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6E998480048; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:13 +0200
Subject: [PATCH v15 10/11] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-10-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2434;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=V6k4hsOr+z+jN8GLnIWddKeAE3UAbZEYwhtva3zTSYE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXuoGTMq1a1IgjMev+B4vmaKlPqSTbqjY9
 ISlG177GwLs7YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qaBFgP/AvNACnspG5ISXaT4SH90dZDQNt6l3Vxk84UKl8fqLFODBTXzQ36N98cfYx8lOeHNcy
 E3S2n6nM2whwXTqlJAzU197yJenf3CPpS8rTYFypOZorMbqq/8vYhsrH0CaUdSujFBpJQgGjFgW
 CesV9WrcJ7cIMidQIXcljtmenNwJKK4uPr/Lm0faXOsM7N7Hd4hiamRPl9scvtLQg8yvUHMbtDR
 RpunMVkgj9H0w2yddKD+GtgqpWM5wsrbdLf697QStdcmeQ/rDUMiGu9CeX5rXVZfKKWzgaGP2ZG
 ovJq9czZWbpy6nR8x8WzImYOcfEa6s1e6WA5jHCOEthgcvEe+++8YxJbV+yASssjjYdYSuihSpp
 xbJJYRU1vN2e0lNmHIyjw+1IbOVaWtA2pYtKkK4zB2zcd6fmAakJRI2Lf+irNjBgEFHrK5D+YoF
 7DJ+UFR41ZbddpW/WRAC5k5pbbHm+BrNgAJNIc+TEkjRX0NFjd+e8mNSl1ILb4O15yQEwp7dQDy
 /rKqGOeZc8NRruflUvj8eha4NYRQb1KU5Nm8E4pAMwIGnLabqov1oUeIQOj2GSFEgZ2Rge7o24q
 Itg9mt1bhNs/P1hZjrqqZXl9Rj55HcfSJGZpyws4z6cZ8US8JQN9gCDW4o7AEQMo1z/2O22POFS
 ladZJOnHN8nc4veMZ9HkyAg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Handle rk_udphy_reset_deassert returning errors to avoid theoretical
(Rockchip reset controller driver does not return errors) SError.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626211151.2332F1F000E9%40smtp.kernel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4116b4b18882..9eb8e40f6afb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -802,8 +802,12 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	/* Step 1: power on pma and deassert apb rstn */
 	rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.low_pwrn, true);
 
-	rk_udphy_reset_deassert(udphy, "pma_apb");
-	rk_udphy_reset_deassert(udphy, "pcs_apb");
+	ret = rk_udphy_reset_deassert(udphy, "pma_apb");
+	if (ret)
+		goto assert_resets;
+	ret = rk_udphy_reset_deassert(udphy, "pcs_apb");
+	if (ret)
+		goto assert_resets;
 
 	/* Step 2: set init sequence and phy refclk */
 	ret = regmap_multi_reg_write(udphy->pma_regmap, rk_udphy_init_sequence,
@@ -829,8 +833,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB)
-		rk_udphy_reset_deassert(udphy, "init");
+	if (udphy->mode & UDPHY_MODE_USB) {
+		ret = rk_udphy_reset_deassert(udphy, "init");
+		if (ret)
+			goto assert_resets;
+	}
 
 	if (udphy->mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
@@ -842,8 +849,14 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 
 	/*  Step 5: deassert cmn/lane rstn */
 	if (udphy->mode & UDPHY_MODE_USB) {
-		rk_udphy_reset_deassert(udphy, "cmn");
-		rk_udphy_reset_deassert(udphy, "lane");
+		ret = rk_udphy_reset_deassert(udphy, "cmn");
+		if (ret)
+			goto assert_resets;
+
+		ret = rk_udphy_reset_deassert(udphy, "lane");
+		if (ret)
+			goto assert_resets;
+
 	}
 
 	/*  Step 6: wait for lock done of pll */

-- 
2.53.0


Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90E50AC3B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545843; cv=none; b=Rapw1IXZyT63mOtKJdX5PN1mATI21u2b/Nb4jKgtUU4QgWG4RQma1pyPlktrKXEn8a28Vk89MqMFUODrotg/v7pDvHNSRVf4De9Ch6azx0/EsvprvnV/b9+VmkW/2n0944qh/4jhvzgNFLNSpWFhpnfkLd/QCS4gEqOyazWwKHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545843; c=relaxed/simple;
	bh=FzJ+I38C/zByyZcVwFSqq+jX11hoEYOCqOxOXIWGNIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JVAk3t+GSB8uS4wdhj/j9pomA9tgSIY0+Sap85KZ1KKmt1QlymECumq+Fw8VHouIivGaloxXy+mNtaLZqfQnEE8arRTHwjWitcdFHwoy8y8qWp0SKrPJer+JDPGWGTcwHE2dwb5uKGcLUxx1AUZ6LNy/xdaAY/m6VVedlstIJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBeL/ucg; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBeL/ucg"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2a449c57so17506461cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788545839; x=1789150639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uab2fOtm4yAsqFy9TswrjvUe9GKOQl3AP6YlD7jY3r0=;
        b=lBeL/ucgqgeMx7EKp4flSdivpfYGFObU9dZDeX6RVYrF+JzByoSThFzgr1mBqjTyVJ
         Z0sC0SqzS5YHzLwX+nrCRrQgHEaUAeIY83hkgVSKknO1H4jNfC2OHu1I0gvNM7lcoAYS
         iXmgvwpS6SP+qwSUgxwv6jXwO4aH7LSOxAZFXHXyx4WvOnk6uRmf/EIFrrjovg2m9qlQ
         Xe3C7THtQgSjyW4/QZTrXXUfbjZZahTUs+AwFt30gLu7uQCAB+62RCrjxHS6KDT6cuEE
         gzEaE3W5cX48GrJjI54lB8TJmYBp5oOxs11yVOfNKfhGXGzp5KA2IPw1BKnHQt71pCt9
         G43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788545839; x=1789150639;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uab2fOtm4yAsqFy9TswrjvUe9GKOQl3AP6YlD7jY3r0=;
        b=GCYt/MRupVDHyXFTC1TgCGmTKPscJzWg5SCkgjpq55TuMm0XgWX4CxIdQ6P3OytOdJ
         iYe9Y5DoAtcuSDeQz8vhxVRuYjjt5toxgs68ODGL2DxlAZKF6hx+XvJS/EM9HvhtFFBS
         w329RG9/mrI+gUH/kc8VfpB+YGWqiOo8aAxT9BUjGpklRVowsZRW4H5QRWdYQGpLGL7U
         tgIsgySGaR9BaoxJ+2vY/0E2LiCpwBnZgHaE5nbOWmOcGCIQU/9E04mOYZbrQgyxs2oI
         xXOwsz/vzjRsoNhNi1E2gtBT3X0HBH8xeuvXuIK65fNxZfS+AJoV1Bp/uCxkBZ++vLXd
         v72w==
X-Forwarded-Encrypted: i=1; AKwUvBxl88yM1fL7i7pzV/SPY23SDhnvofvjwvvZ6anw8U/HKDAoC4W+H9ksPW/q1RP2QLDQol71k5Gya1HmDiI=@vger.kernel.org
X-Gm-Message-State: AFuF++md8ZU5KxNXA+chJFj7tJpKzioEcwH3R/+PkL98OLN9ri4HdwJ0
	jRDdT/vVBJmMMZGJZ2nTsNXoXI199loPpWycgw7iVvcg+ck0JP33o7E=
X-Gm-Gg: AYBFou2SRRbkUCR4jvjI9Sv6zE+cfIC7/CNmFQaxgwivOqysvBUmwsKOetg+Cp9V6Ya
	c3kYte0PBjyIhJ8wiAo0+R4Rw9R2zZxSqn5qRP0voKbvhgJJ/fmJI5qZXy3Bu4RkLFPPtA3B4bB
	T/A325ThhCYzDNr/fLX7AtZ+55/5EpzEmoI4rny5WaiIwfikWOQu1FCTrU154bakwNddAM0vDFf
	td0Iw9NDmLGtpoQcQdjOQGeVNB4YdJ5IjTjvOwN6Db8uVGD9v/js4Ib8iqR6eO/QKJLaTxHj/oE
	epMNW68yV/aUyA0EkEhEq8omq0qSkluiJOF1y2IxmOgQNtT08r3hwxX0nqQDlUdLw9LzCEjlddu
	Fw738HGGEQJaAqrvHdaVxCTy2UY4n2C/MBqgZRbsqg82PwGDmxK+0QVIafxkoF7pKbeFA9RN9xE
	Y1FYY/103i5M/LZZ12x/Ow9fR7+fym0dmkpeVEf1NeJslg9lk2OsAe2jqRjOIBR6K6Wu30TrpBM
	FiHlEbflLNH0U0VRr7GGlQL4xdGOVcWMfv8AXtU54HxyUuIg6exaO3hay+MrhnS72S9IF7NboLo
	3NTMYZ/BIECebmw=
X-Received: by 2002:a05:622a:1209:b0:52e:d3aa:8fa9 with SMTP id d75a77b69052e-5305498b876mr73285421cf.32.1788545838768;
        Fri, 04 Sep 2026 11:17:18 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054116c5fsm26113391cf.10.2026.09.04.11.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:17:18 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Simon Wunderlich <sw@simonwunderlich.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath9k: stop a failed register read from opening the RX filter
Date: Fri,  4 Sep 2026 21:17:09 +0300
Message-ID: <20260904181709.788886-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the USB devices a register read is a WMI round trip, and
ath9k_regread() reports a timeout as -1. The spectral trigger reads
AR_RX_FILTER and AR_PHY_ERR back through ath9k_hw_getrxfilter(), ORs in
the PHY error bits and writes both registers. A timed-out read stores
0xffffffff in one of them, the device forwards every frame and PHY
error to the host, and the full RX ring drops the FFT reports the scan
was started for.

Add ath9k_hw_enable_rxfilter(), which sets the requested filter bits,
the matching AR_PHY_ERR bits and AR_RXCFG_ZLFDMA with REG_SET_BIT() and
reads nothing back, and use it in the spectral trigger. It sets bits in
AR_PHY_ERR where ath9k_hw_setrxfilter() overwrites the register. With
firmware 1.4 and later REG_SET_BIT() is one read-modify-write done by
the firmware; older firmware still reads from the host and is not
helped.

Fixes: e93d083f42a1 ("ath9k: add spectral scan feature")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
Changes in v2:
- Describe the whole of ath9k_hw_enable_rxfilter(): it also sets the
  AR_PHY_ERR bits and AR_RXCFG_ZLFDMA, and sets bits in AR_PHY_ERR where
  ath9k_hw_setrxfilter() overwrites it. Say that the fix does not help
  firmware older than 1.4.
- Add Assisted-by, rewrite the commit message, rebase onto ath-next. No
  code change.

 .../net/wireless/ath/ath9k/common-spectral.c  |  7 ++---
 drivers/net/wireless/ath/ath9k/hw.c           | 29 +++++++++++++++++++
 drivers/net/wireless/ath/ath9k/hw.h           |  1 +
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/common-spectral.c b/drivers/net/wireless/ath/ath9k/common-spectral.c
index ca01a07f6630..73c1eb4ebe0e 100644
--- a/drivers/net/wireless/ath/ath9k/common-spectral.c
+++ b/drivers/net/wireless/ath/ath9k/common-spectral.c
@@ -716,7 +716,6 @@ void ath9k_cmn_spectral_scan_trigger(struct ath_common *common,
 				 struct ath_spec_scan_priv *spec_priv)
 {
 	struct ath_hw *ah = spec_priv->ah;
-	u32 rxfilter;
 
 	if (IS_ENABLED(CONFIG_ATH9K_TX99))
 		return;
@@ -730,10 +729,8 @@ void ath9k_cmn_spectral_scan_trigger(struct ath_common *common,
 		return;
 
 	ath_ps_ops(common)->wakeup(common);
-	rxfilter = ath9k_hw_getrxfilter(ah);
-	ath9k_hw_setrxfilter(ah, rxfilter |
-				 ATH9K_RX_FILTER_PHYRADAR |
-				 ATH9K_RX_FILTER_PHYERR);
+	ath9k_hw_enable_rxfilter(ah, ATH9K_RX_FILTER_PHYRADAR |
+				     ATH9K_RX_FILTER_PHYERR);
 
 	/* TODO: usually this should not be necessary, but for some reason
 	 * (or in some mode?) the trigger must be called after the
diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
index e08ab73fcacb..caa221ce0d32 100644
--- a/drivers/net/wireless/ath/ath9k/hw.c
+++ b/drivers/net/wireless/ath/ath9k/hw.c
@@ -2905,6 +2905,35 @@ void ath9k_hw_setrxfilter(struct ath_hw *ah, u32 bits)
 }
 EXPORT_SYMBOL(ath9k_hw_setrxfilter);
 
+/*
+ * Turn extra bits on in the RX filter without reading the current value back.
+ *
+ * On USB a register read is a WMI round trip that can time out, and
+ * ath9k_regread() reports that failure as -1, which is indistinguishable from
+ * a genuine all-ones read. Feeding it into a read-modify-write stores
+ * 0xffffffff in AR_RX_FILTER, enabling every filter bit at once, and the
+ * device then floods the host with every frame and PHY error it sees. Set only
+ * the requested bits so that no read is involved.
+ */
+void ath9k_hw_enable_rxfilter(struct ath_hw *ah, u32 bits)
+{
+	u32 phybits = 0;
+
+	if (bits & ATH9K_RX_FILTER_PHYRADAR)
+		phybits |= AR_PHY_ERR_RADAR;
+	if (bits & ATH9K_RX_FILTER_PHYERR)
+		phybits |= AR_PHY_ERR_OFDM_TIMING | AR_PHY_ERR_CCK_TIMING;
+
+	REG_SET_BIT(ah, AR_RX_FILTER, bits);
+
+	if (phybits) {
+		REG_SET_BIT(ah, AR_PHY_ERR, phybits);
+		/* PHY errors are reported in zero length frames. */
+		REG_SET_BIT(ah, AR_RXCFG, AR_RXCFG_ZLFDMA);
+	}
+}
+EXPORT_SYMBOL(ath9k_hw_enable_rxfilter);
+
 bool ath9k_hw_phy_disable(struct ath_hw *ah)
 {
 	if (ath9k_hw_mci_is_enabled(ah))
diff --git a/drivers/net/wireless/ath/ath9k/hw.h b/drivers/net/wireless/ath/ath9k/hw.h
index b942b8303d8f..f102f73a0114 100644
--- a/drivers/net/wireless/ath/ath9k/hw.h
+++ b/drivers/net/wireless/ath/ath9k/hw.h
@@ -1055,6 +1055,7 @@ void ath9k_hw_get_channel_centers(struct ath_hw *ah,
 				  struct chan_centers *centers);
 u32 ath9k_hw_getrxfilter(struct ath_hw *ah);
 void ath9k_hw_setrxfilter(struct ath_hw *ah, u32 bits);
+void ath9k_hw_enable_rxfilter(struct ath_hw *ah, u32 bits);
 bool ath9k_hw_phy_disable(struct ath_hw *ah);
 bool ath9k_hw_disable(struct ath_hw *ah);
 void ath9k_hw_set_txpowerlimit(struct ath_hw *ah, u32 limit, bool test);

base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
-- 
2.55.0


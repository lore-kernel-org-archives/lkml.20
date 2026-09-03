Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA44A2A6D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451865; cv=none; b=GroKzF6o9t/pMhNBqkjLoeXLV7f/J3acTuFn8da2cezR+b/8u5/SFeGkpYL8g6jSz3Y5DSM1nMP+9apXeMrIbw/uo1CdQQCclNkpZptvcemsix1INKfo+xE+/Wr7BKNxDD8M3lU4WumoluXd8DSdZY+zVE3T2Efe6+E/xw2D/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451865; c=relaxed/simple;
	bh=ErObAfD7PTX/9mjwRE0+lMVxGzdSmPzUtZ9TCPcWEFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BSti0gHxPQ5iuMBwWx4zQ6KQst7ezXZuC3nQMi0/Jlzl5YefeX8dswiDjx6zi3+UeEpYShDEiraXxNZSDPyvX6wloCtTgew+mDSA9Mt8UT7WrW1/sQzSlk8vFPnTlk+RQKT5u+pepio85eAq+/WLJ0XBg4yLHry4ljd1JEtNTIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew7+Ni7P; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew7+Ni7P"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso242995e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451862; x=1789056662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iKz8Ws4shHqxMxKGsZhTY3ZMX9uwXGU6sjNff6ts0jE=;
        b=Ew7+Ni7Pd8sF1c2i1eqbqNbJUkNid64q3FrGA/Zl/ucsF7tR9qjCMAj+3ltpfttWBy
         8gc6+H4lcDTo0/FNtLkc3W31U0NftkNVKR6rawcgh8pe0EslAIYozl+/SCaAejpA7X+y
         zZ9159tgf2U5E+ds4SkxEixaxFFpUzxgo0IuAC5Y76WxoUu8PHFAm2GS4pxrsrKmlYAk
         J7XvyBykZb74VEMiVyuKcBwXMUGW1BXcjc6C/8W6DipvXOpCmiCAKFaJSfcCRGNjfNPR
         LtBeSFKqFMiwBqr0ROqlDbqnA3pRZq1Vmv35l50txDYfjG0xXZBPeUHIynb18qapsPFK
         yD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451862; x=1789056662;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iKz8Ws4shHqxMxKGsZhTY3ZMX9uwXGU6sjNff6ts0jE=;
        b=mRjystyCIxX6knwEqfm7lPUG2wrJ0xUtDz8qKAclb3iMrBdp0iLkHFPhwKRljTrzyS
         MRQ6VtQhEO6sUcnsNCBq3ui9SiGjk6P+J7vyE2Fc16DB5dxWLwMRzOgDY9l+jCBdM43O
         lkKzAUuBZ7RnwNLqd+SpeBZUwNfzFobo5Vlym9d/lI1Jg2nrJbfdmcE40QZlcHDM4CGN
         ParP+7jiiP8oTrN2ymkaDPoJ6acDQJhsPjfPwJsiTn+jJbmedYId40g1h6XMMhPdoHf5
         re0htPkTLVle3Sqr5C43VCK4rsNneNE1GoLXHmF8zl7OP8AnQMZ19Pg3yAf5PDvhdqgl
         3RJA==
X-Forwarded-Encrypted: i=1; AKwUvByKAvyNvQyFHJ3R3DPq9PULrK2oKxV8TIVackI/y+tRy8McR/vD2FBfrfHl4aTVdB4PnYfDKhGSysYndrI=@vger.kernel.org
X-Gm-Message-State: AFuF++n1L9eBzPew5xUoXnbzGJThBB/4ElYPglapmOwcUlIZQc0Jbinz
	Z/O3aDB+qaYzYK7CiFAMhtzu0su4wsoe8WXkH0lvYZ4sIevP5crkVcE=
X-Gm-Gg: AYBFou2LXVouFbwnO60RsdWsZhXQJ2y2TVdJD4/Kyyp8uvmlWElRGiwlpBsQJgmXcAG
	N6ah2UzoQNTe6qPd2FtVAt6t7Pjba85anbNnyG3bLY3/hit0x5X7g++Leqt5609iU3WaEHYhHk4
	8nJVl4QzBtyk+U6Xa4N646CINLufhIkH+HUrK+xhop2ndi72yCojlFJCxdyxrXFGVo7rRuwOPw6
	SEPtJP2FtUF5Hy2TSWw0j55sHjAL9s9KF6mX2Yjh0/fNVX+9KMh7fxDWkRGSL6eAQ6oskvheU29
	VeiStr22wJsIElON0evBFd2e7uNWxhuWIx1FGnuI5/9UsCEiEKw4vNMjNjmfn5aKDLJPcP/KHqf
	1QUB72c9iplyA6jfRvpbnYOPnx4igHVNwsvs+fm2ippOk3OBqGGDp6fIhn2D11mGnjzOuihsdE5
	c2kpLodqch3lwvgg2IXgYJ4htW340V53XsrPd1Dm2KkbLRIDLn4v4+sEo4IWN+jSiJnnthWDXu/
	mlbSBkzSajhD+V9d6o2wtZHEx2BvTQhwgD7NzUeLjAYafDpBXHK+EF8EaUaPkr7yc6L5+KBWhG8
	Tho/
X-Received: by 2002:a05:600c:5309:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf5bd3418mr23452915e9.10.1788451861657;
        Thu, 03 Sep 2026 09:11:01 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm92622495e9.3.2026.09.03.09.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:11:01 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Simon Wunderlich <sw@simonwunderlich.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath9k: stop a failed register read from opening the RX filter
Date: Thu,  3 Sep 2026 19:10:37 +0300
Message-ID: <20260903161037.1032820-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On USB every register access is a WMI round trip and ath9k_regread()
reports a timeout as -1. The spectral trigger fed that back through a
read-modify-write, storing 0xffffffff in AR_RX_FILTER, so the device
forwarded every frame and PHY error until something rewrote the filter;
the saturated RX ring then dropped the FFT reports the scan exists to
collect. Set the wanted bits directly instead, which on firmware 1.4 and
later is a single target-side RMW with no read at all. Older firmware
without WMI_REG_RMW_CMDID keeps the previous read-then-write behaviour,
neither better nor worse than before.

Fixes: e93d083f42a1 ("ath9k: add spectral scan feature")
Cc: stable@vger.kernel.org
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
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

base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.55.0


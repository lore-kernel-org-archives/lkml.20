Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366CF47043A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101268; cv=none; b=AERWeSw9cVqEdsOZzpycZujpQfs+Ul9+kHM+rw0muPirWMfV/7jWZPQaamoWH64Z6lv+TItfcoi/7KmbER4aX+JSvp/+cH56Tct3Ag8amm8C9CnaE3z5Lgjnrv9wGiizq31+MeKiVgHofVIfkSe/mVJ4BlQLDo6d4KqszoBOias=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101268; c=relaxed/simple;
	bh=gaNWCzeBlx+8iBLCXy8xVncbBWfAae6JANYjymkPTLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F96qUXitupedN/4DW872jU84niWesMg2u7LvUOgp9xVSm/zDzM0jyVQ4bSVZzH39b+64aoVo3v6GtWocF27txJGXMxqxHX72iBptF03zbEc7Ap9wzSWoIm5hWkDRlChUegOcAHUmxjlLrycWsPlAOL3RmPgfGZT1n77yUwkHM2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQYrJWYb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQYrJWYb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso980975a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792101266; x=1792706066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3k1c/Q3C6vUcXTQA5+QfiwE0HRRy16g2NLX4mv2FEY=;
        b=PQYrJWYbLVuZ1MXqZN0pzWGdK3oFkAQAU6xOm8S/G7zr6eSVKbh0cipvzI3WTXUH4d
         QsfkyZSfwMplRhlOMIwZsbwdUg7/Ao8HzZjyr2IoF6wda0O8KyFgP5jQeyxnvpDveOW4
         PwEaQvs42Lzk9Myfs56jjmX1Kdma9W46b3Jl9tpELqAz4rXc1IpVSohY5Zfjm0Ju/Cbm
         wqeOEXlfxC372FY2xHyjepv2Ho1obfSJoeFpEid50P4aHer6rLsRlNyWsiJqzS9knkxo
         1r65j5ZdgWbySLUVIHV0bFtvZB9XiaNEHzj326iQMA3PHiiBLFBQGVl86ImuEMYPlXc5
         +13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101266; x=1792706066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3k1c/Q3C6vUcXTQA5+QfiwE0HRRy16g2NLX4mv2FEY=;
        b=wFWwab6FFiv49/zvSo8CFPD5bnuDYFocaTAhwmEbcuEKGti+QEfSP4n6RffA4qZgkS
         ls5yQaH6PnOJVD7eCSjFWJ+yFuUakJve0+JlumEN3+EpL1PL7EZA3f6pNRkLvCbkcBbH
         jwItP7VxVR/KMfZ5qTiepTzBASD+UelDibCr7Kj+/3LGkaFN4/We2tUgRpqdq7bXheiv
         rFs5cjtfK1otgX2Nwe//DQl8sSn3OzzYt/+bt9YiOOLUj1v8z1rPPEWQZyAoEPx1Svsf
         h/JQz4HX+dCtet1Km021V3r2h/pn5YpZgFI7kAzYLcSWLjCTPnMz935RT2aFOg+lIO2D
         W4EA==
X-Forwarded-Encrypted: i=1; AKwUvBz5JuYAKZoWuCp0lfZMLhKuJTV4fumeq3F+5XXItxYTFGm8FJbADFBMAL+sZuEhyMspfSdTA0j2SSnmy3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY+tPGbrT8jrAg2GbAylUrc3Pz/bVsGat2fmRNLB3L5i+YxBBb
	CjYyY+a5I1ynqx+NvSx2QQMLypdDl1MHRuvgM0bT4SwfhmTJrVmCfC32
X-Gm-Gg: AYBFou3xEan0tT5DBY6PQaXXvqd3pbo4qVA7RC3UAHdYBfGqYHHI1mWenl5f90mT+5y
	8fmr/vSWBMVWxrkd0giCCe1OVhKQdr+0shnBcjLNrWgow5oBt9AIc92VRWpCNn5NmSCG0ff6Iy0
	Fjz5Ne5WU0dxxb9H+1pa/QBxdphld67Xw2M3K9KpiQcksliIqgDz3J60J2Kfyn+PZIAw89/7cFp
	kXuvlbRPNpDX3E1cl1admorIOMk816gpgYmKZgTHBQz3pJ8Iy6xjkPK9tBD0UFUqq564/IS9RpG
	xsA7YD36mRL3uBg0UJLdGCb716ilGdxe/dcRaV11E76HkyM4IbioO8LzlFExSEaxHycQX6O67Pa
	g2vLYBV4MsfxO+ET6ik7qvlcJz1+ZPKV+o5gvP4KAORRNSJ8u173wOZHWTWIdDauCYHPRl9bonB
	lNpAWO4NEhpj11pMCBujRPN9hZMBM7mFgxR+APk9YH8fwrIxrXGTwLewo1g3NBDhZxIkvarZIs3
	iXtR+evTFO74nxOyylmbUb0iN7ku2NNSThXCrGzG5EcUPA5hnHu2ccVLRv1DybaH+20QQd+LdRU
	sKbn6L0ssTr/pyUUsO5ptJdmJdxWbZaf98MMR8MqGgI9V4Wh
X-Received: by 2002:a17:90b:384a:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3acb3c7e4a0mr1809389a91.61.1792101266438;
        Thu, 15 Oct 2026 14:54:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487e509sm925307a91.9.2026.10.15.14.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:54:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: "John W. Linville" <linville@tuxdriver.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	b43-dev@lists.infradead.org (open list:B43 WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless] wifi: b43: load the N-PHY SPROM power limits for the current band
Date: Thu, 15 Oct 2026 14:54:23 -0700
Message-ID: <20261015215423.195788-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

b43_nphy_op_recalc_txpower() always builds the per-rate power limits
from the 2.4 GHz SPROM entries (maxpwr_2g, ofdm2gpo, mcs2gpo), even on
5 GHz channels. The resulting maximum then overrides the per-band
target b43_nphy_tx_power_ctl_setup() reads from the SPROM, so 5 GHz
transmits aim at the 2.4 GHz limit.

Pick the SPROM band from the current channel, splitting 5 GHz the same
way b43_nphy_tx_power_ctl_setup() does.

Fixes: 8615eb2870f1 ("b43: N-PHY: support setting custom TX power")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index 22359bd9db47..a8dc7c12a5a9 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -5833,6 +5833,7 @@ static enum b43_txpwr_result b43_nphy_op_recalc_txpower(struct b43_wldev *dev,
 	struct b43_phy_n *nphy = dev->phy.n;
 	struct ieee80211_channel *channel = dev->wl->hw->conf.chandef.chan;
 	struct b43_ppr *ppr = &nphy->tx_pwr_max_ppr;
+	enum b43_band band;
 	u8 max; /* qdBm */
 
 	if (nphy->tx_pwr_last_recalc_freq == channel->center_freq &&
@@ -5843,7 +5844,15 @@ static enum b43_txpwr_result b43_nphy_op_recalc_txpower(struct b43_wldev *dev,
 	b43_ppr_clear(dev, ppr);
 
 	/* HW limitations */
-	b43_ppr_load_max_from_sprom(dev, ppr, B43_BAND_2G);
+	if (b43_current_band(dev->wl) == NL80211_BAND_2GHZ)
+		band = B43_BAND_2G;
+	else if (channel->center_freq < 5100)
+		band = B43_BAND_5G_LO;
+	else if (channel->center_freq < 5500)
+		band = B43_BAND_5G_MI;
+	else
+		band = B43_BAND_5G_HI;
+	b43_ppr_load_max_from_sprom(dev, ppr, band);
 
 	/* Regulatory & user settings */
 	max = INT_TO_Q52(phy->chandef->chan->max_power);
-- 
2.56.0


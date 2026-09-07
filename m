Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA13A6F1A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762328; cv=none; b=EoLTsox3r+Ex1PWKlpAc+CjV+dfkDHSMP2cJS9AeDOvOjE2wfkinDRn6FF4Tp9U7tofBGZKtx4I3Hmf3ObVb14ROhxWg0HMp0kqtr3eP7LcXvowfI7l4YA6boGfikm9EjdYf6M+ax85RaOxaWeEBkbW6cJkEI1RaRwpofXpLVuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762328; c=relaxed/simple;
	bh=lVcifL6CXD6hJUcAyNmhi7SOS2GRLqikf34hpN8GZeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJO+2dpXZ00D9i9bD7DKrtKBCXeb3I3s1+POi8WEVbDynWR8nkWEyIgg6cJr5dUhR3QQNesMXrMLuWoMYOIuBWdlNyV+iZ+MRuq0VkNFVDX4lVDXs4JmU/7F1kQA7FiwRlL2OKrbwa5W1UgleUzKF0Khf+OAoof686/tkkDGCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoZS6blk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoZS6blk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2886359a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762323; x=1789367123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wI0uSnUHEptNkyfibbrbcQ+UzBygohHJaJzYhS8sUvE=;
        b=MoZS6blk6oMkVC6Oxtobk9mBKOgK5/zq/qWhrwFZqaSpMbnDmI9IO7bfgth4c0L2FR
         Z7e0J77czWengutgWi2AvF8sCiYnSeCYWHymYRkwNc0VF7doVDNAwdmi1Hl/9G9xkfBR
         jKTOnr7la2O3K4Jn3H+woFWVdxI+jqcQklXAST82p0aYFbbZP+xJ2sI0pcbny8XpdjwQ
         b/5R4xfZSz/Pmj8yFFFWl4z5SuanwGbo8qy5Ft4h2CZvSwPWPyUT51NU6sSDPL5Iq0E6
         mhVab5Fmw5G/ZeMDw1pngsM2RFXqO79b2MBI+iT4uWxFbMovONFj4wCusPDskX5R3/pL
         5N4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762323; x=1789367123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wI0uSnUHEptNkyfibbrbcQ+UzBygohHJaJzYhS8sUvE=;
        b=jHbQQsYRgui1NFPFootQ7XNIcC7APqIvIDSDmm+FD4xrOTfKh9ikbGJiOBFX3fJXJT
         ipmxo+0Yz1MQcoQ/uMVq0IowSKC0vXgnNo14p51D5xCvxmklehFZWDBBa95MS4flnIpd
         0bDSt+nBpe3zTYgKraRXgZCxdCtwTqJTeixbZPrXrkumvHJ/NO3ariYLy2TujUr6Pi+m
         0RKU7k7x4HtQVP5jzlpqO7L3NHC0aLqu2inaZDCk3DsdXSz5ShXHfPwGpUpfLOCJuSAk
         UFCb+HoUVAChd7aD4EOzhkrWP4iHwHGi/Pi3ZC+FyzLMCEH3Op+Ur5l9Xusjb1f8RA/7
         XHZA==
X-Forwarded-Encrypted: i=1; AKwUvBwyxDAhQ9SUR+gzbhZ8WFhJeytP3gYfgiQXOmJqE9fLG/XjIX1GLyPgxSDZTD+wxgyfG5ZVTUUERkcQQYE=@vger.kernel.org
X-Gm-Message-State: AFuF++nxiQ6FwEmYGoJwQdR7neh/k8S9EhecedXMDwtglnDFifAMuHX9
	YyuCOD9pTOx8Cq+TBwntyPzUV2dVJ833oUa2qlbzlCVx0QheXVpnLT6ehkvz4DUc8zE=
X-Gm-Gg: AYBFou0RG69XdWzN2Pt5pLN8cgwkfdcCCbUORALLSkbEaHJuPN/rk/s/DUVvakpdFAz
	VAdANLqp2JMCtutZK7xIA115kr0zk0DjzvG5S+PvPZZrKhhzHKCfP8Y8YCeAze6EO1kMDGJLRNc
	Nb+gS85WMj/WXBc/3z/Fkr7lQfMUqXzI//fDkIFrfj6VxUpImf9UTkMEtzrIwhabby53AGpfuAU
	xImAMmKrMgW5A7zF8EcBbNhRELXGkLnbszoCAevl+oFNkNuy6dDhBKljYUf8cfBzwjmnGtBZbVV
	iSPQqPdicY5jnttNrp7huJ9blE5+CCaektgkNjvB8tTr5MG3ZCLpe1YcmdD83c+zo+qWEbuDGbk
	/tyFg8vbSodD5k1R6YA8nvrYGYVSx59rktlOwX7YjhRc0vSdTuhT1TdI+0VDa+mPAuh0AzWA1bL
	2UyBhiLho1T95e25xW0G9KPa/Mct5ZbuiLsAtVaNNxTMvpxntqjftc1kONKwXkmcFdpdV84dQ6U
	WaC4RyoaS132dkuomY/4BCz
X-Received: by 2002:a17:90b:4d87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39b26100bfdmr28827492a91.6.1788762323074;
        Sun, 06 Sep 2026 23:25:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm39007594eec.15.2026.09.06.23.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:25:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: fix typos in comments
Date: Mon,  7 Sep 2026 11:55:18 +0530
Message-ID: <20260907062518.12810-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 2 +-
 drivers/phy/phy-xgene.c              | 2 +-
 include/linux/phy/omap_control_phy.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index fb69e21a0292..43b287a25e7a 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -334,7 +334,7 @@ static int brcm_stb_sata_16nm_ssc_init(struct brcm_sata_port *port)
 	brcm_sata_phy_wr(port, RXPMD_REG_BANK, RXPMD_RX_CDR_CONTROL1,
 			 ~RXPMD_RX_PPM_VAL_MASK, value);
 
-	/* Set proportional loop bandwith Gen1/2/3 */
+	/* Set proportional loop bandwidth Gen1/2/3 */
 	tmp = RXPMD_G_CDR_PROP_BW_MASK << RXPMD_G1_CDR_PROP_BW_SHIFT |
 	      RXPMD_G_CDR_PROP_BW_MASK << RXPMD_G2_CDR_PROP_BW_SHIFT |
 	      RXPMD_G_CDR_PROP_BW_MASK << RXPMD_G3_CDR_PROB_BW_SHIFT;
diff --git a/drivers/phy/phy-xgene.c b/drivers/phy/phy-xgene.c
index 5007dc7a357c..59f18e16bbbb 100644
--- a/drivers/phy/phy-xgene.c
+++ b/drivers/phy/phy-xgene.c
@@ -1669,7 +1669,7 @@ static int xgene_phy_probe(struct platform_device *pdev)
 	/* Retrieve optional clock */
 	ctx->clk = clk_get(&pdev->dev, NULL);
 
-	/* Load override paramaters */
+	/* Load override parameters */
 	xgene_phy_get_param(pdev, "apm,tx-eye-tuning",
 		ctx->sata_param.txeyetuning, 6, default_txeye_tuning, 1);
 	xgene_phy_get_param(pdev, "apm,tx-eye-direction",
diff --git a/include/linux/phy/omap_control_phy.h b/include/linux/phy/omap_control_phy.h
index aec57dd784f7..5652aa2f4915 100644
--- a/include/linux/phy/omap_control_phy.h
+++ b/include/linux/phy/omap_control_phy.h
@@ -12,7 +12,7 @@
 enum omap_control_phy_type {
 	OMAP_CTRL_TYPE_OTGHS = 1,	/* Mailbox OTGHS_CONTROL */
 	OMAP_CTRL_TYPE_USB2,	/* USB2_PHY, power down in CONTROL_DEV_CONF */
-	OMAP_CTRL_TYPE_PIPE3,	/* PIPE3 PHY, DPLL & seperate Rx/Tx power */
+	OMAP_CTRL_TYPE_PIPE3,	/* PIPE3 PHY, DPLL & separate Rx/Tx power */
 	OMAP_CTRL_TYPE_PCIE,	/* RX TX control of ACSPCIE */
 	OMAP_CTRL_TYPE_DRA7USB2, /* USB2 PHY, power and power_aux e.g. DRA7 */
 	OMAP_CTRL_TYPE_AM437USB2, /* USB2 PHY, power e.g. AM437x */
-- 
2.48.1


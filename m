Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EE93AFAF1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980768; cv=none; b=b37tCOoTZrcxEf4FogHmas9vNPH+4tNimDyVEPAAtzbbPYL3V9stp3Qzypt6ur5l2ti3fVvwDEcXDuleo5htzZzR+HFHxReX3ybPy8Nsweq0RgIOSYeg7wXiD8Xuhdtq7VRBj9mCwmPIqJLteCJmWToyFSSdmmNZMwdsbJsvj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980768; c=relaxed/simple;
	bh=I+QUqjU0x7w1Sv8MJZJL/P4MWL2xQ2sAbWPeheYEHQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hph2z81j3yUOdd9j/9cTq7qtm5owheCQbLZGp+Sd1BZwXQmmUPEIIFeY7HgPnuEiIyctZJoCUl/Pi80s0dnE48sHfNOt4Mo82YHAD6ouPBi0XhoofcdsyC6ElKhqumE1edonavn/LUYhpm5zqHQS3xTfOtAjTv5nh96blPybvZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VH2fNfE6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VH2fNfE6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d91ded8174so52420715ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980766; x=1789585566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZ4ExzrDFlvuwm+4iBcf3qDZi5lCjYDoxJFX1Pj+j0U=;
        b=VH2fNfE6eZHd5VPCk39TGOpbZq0VA++HC9lc/YE9vAD6HAO7djzE8k1ogOyt2cLJy4
         Kq2Ba1RYhtsIHMQUSzyRdQ3glMeUK1MWUucjDxByyInOH8i6PPTMu+QT0rvsm4MYaNHf
         DdVUXXmlBhJ3abVcVNPLLhlKLohMEC4nXZsDbuHxVFMmteXfYShvsyEkqDODSDWfsH5B
         ehiEqlGppv7WHA4B7IUNI9bGmSWcwuY7hfSJp1gf3bfFz3rLDLWPC41s1zAhtyXhV/jc
         TX/WlDgB+272+YaCZ6bymwL2RrIqtf6B9ZivO78xYHiBKhntAv16W3ss57rP0QkJZ71R
         wg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980766; x=1789585566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZ4ExzrDFlvuwm+4iBcf3qDZi5lCjYDoxJFX1Pj+j0U=;
        b=AZObjmZh3cfuKlbUXgU5qHwC+C4mpd17yhyxYP82huxDI4n3Kfg7cr8HwPQiijUKHt
         17lCs4N6r6GinNb7MWo5B8JwfkpLbjNdt0tyYmaa/OIPDZAsU0EPk4cbcPTTUEq0KTpe
         tdmXaowTNorlamGS/9OR+ncNFBzE8I9kniV/FMBo9JH0kI2AwmvMsVRtlkxJpYV2v0S8
         IOOR4DCpYQDn9diBkhVKdpztDVbXp5LcB9pIYnTtxAptSkrzb4yQzpSDoNMm8TfYE64i
         yX8R4jicpl34dbBKZaY0PmDdT7uMjzLXm1TsXkuA90StauIdHWQqkWXZP9MchmwPhykd
         oJmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAAYOwHymMjSVJrdgncqJfYJ2X9u1NdmvKSr+fy9p+rrZluyTHxLmLcFo1WAX2CUeNBG5xDKp7tgAeIkw=@vger.kernel.org
X-Gm-Message-State: AFuF++mFuBaXJ+1oe3MQUdf+cLptn4xCxL1BXpP8RubFfO6AT8nM69RA
	SRuLTojphb0So25EVCEKnjDmsVlXdB9I/4vdL01PHWW/d4ZXLVdpVkWp
X-Gm-Gg: AYBFou3L6wEqb12NP5Grrq39cDyDXbPiYU9uOUkVchla3vm99DyTFTd90LquQ1Bk///
	eP5MyVtfNB7zGz7nym2YdS3N1QnvH2xNj6wmnlJWsgiAMjvFnRLKUohb/O/xGlz7HqY7Tj5ow2P
	9+YBVXLvYy12uVRsy2yU+aR9PnrESqcGodBetSjLKZmbPLVbHVWeAIkxtvXpsK+gKzX4ctPLVv8
	aSimy4HZniwk5TUPR3OYJMHZYsTW7QS9IZPcHZDp9iE/1YBEh6C68Z5B29s3gpXtxj+CmXb6Mro
	2ZlkGxXLTin7/kEA9w1TOqvizYjkvLvS0GuwfxffMOLtXYtH8Dnsd/sqNVU0VIn0EJOz/5Srxn5
	K2nSPzgYOmKfRnd+PrfD2DE5gEKS2Zs6eaMxNR8PoeRw/VU+XxBkUaz+f7v0Dwf8GeflLtOzfWx
	T3Rcyw67byp+ce5U6+1VoCbyfWTfBy1ligh3sS2mVJyZws2eMyS5C4jYQxmTejxVV+h1TEkizjE
	DTOs95LztXHCBTnba89Nv8xwA==
X-Received: by 2002:a17:903:3e01:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2db125f173emr403272365ad.11.1788980765884;
        Wed, 09 Sep 2026 12:06:05 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dcffa9827dsm13988515ad.66.2026.09.09.12.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:06:05 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/7] net: dsa: motorcomm: Check port type with runtime info
Date: Thu, 10 Sep 2026 03:05:30 +0800
Message-ID: <20260909190541.466476-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909190541.466476-1-mmyangfl@gmail.com>
References: <20260909190541.466476-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The yt921x_port_is_internal/external() macros hardcoded the port layout:
they treat ports 8 and 9 as external on every chip and count the dummy
ports as internal. Drop them and identify the port type using chip info
and runtime configuration.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 36 ++++++++++++++++++++++----------
 drivers/net/dsa/motorcomm/chip.h | 11 +++++-----
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 64fdc5109cc6..946949a3aba8 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -3743,6 +3743,7 @@ yt921x_dsa_port_set_apptrust(struct dsa_switch *ds, int port, const u8 *sel,
 
 static int yt921x_port_down(struct yt921x_priv *priv, int port)
 {
+	const struct yt921x_info *info = priv->info;
 	u32 mask;
 	int res;
 
@@ -3751,12 +3752,13 @@ static int yt921x_port_down(struct yt921x_priv *priv, int port)
 	if (res)
 		return res;
 
-	if (yt921x_port_is_external(port)) {
+	if (BIT(port) & info->serdes_mask) {
 		mask = YT921X_SERDES_LINK;
 		res = yt921x_reg_clear_bits(priv, YT921X_SERDESn(port), mask);
 		if (res)
 			return res;
-
+	}
+	if (BIT(port) & info->xmii_mask) {
 		mask = YT921X_XMII_LINK;
 		res = yt921x_reg_clear_bits(priv, YT921X_XMIIn(port), mask);
 		if (res)
@@ -3771,6 +3773,8 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 	       phy_interface_t interface, int speed, int duplex,
 	       bool tx_pause, bool rx_pause)
 {
+	const struct yt921x_info *info = priv->info;
+	struct yt921x_port *pp = &priv->ports[port];
 	u32 mask;
 	u32 ctrl;
 	int res;
@@ -3805,7 +3809,10 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 	if (res)
 		return res;
 
-	if (yt921x_port_is_external(port)) {
+	if (!(BIT(port) & (info->serdes_mask | info->xmii_mask)))
+		return 0;
+
+	if (pp->serdes) {
 		mask = YT921X_SERDES_SPEED_M;
 		switch (speed) {
 		case SPEED_10:
@@ -3841,7 +3848,7 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 					     mask, ctrl);
 		if (res)
 			return res;
-
+	} else {
 		mask = YT921X_XMII_LINK;
 		res = yt921x_reg_set_bits(priv, YT921X_XMIIn(port), mask);
 		if (res)
@@ -3881,17 +3888,16 @@ static int
 yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 		   phy_interface_t interface)
 {
+	const struct yt921x_info *info = priv->info;
+	struct yt921x_port *pp = &priv->ports[port];
 	struct device *dev = to_device(priv);
 	u32 mask;
 	u32 ctrl;
 	int res;
 
-	if (!yt921x_port_is_external(port)) {
-		if (interface != PHY_INTERFACE_MODE_INTERNAL) {
-			dev_err(dev, "Wrong mode %d on port %d\n",
-				interface, port);
-			return -EINVAL;
-		}
+	if (BIT(port) & info->internal_mask) {
+		if (interface != PHY_INTERFACE_MODE_INTERNAL)
+			goto err;
 		return 0;
 	}
 
@@ -3901,6 +3907,9 @@ yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 	case PHY_INTERFACE_MODE_100BASEX:
 	case PHY_INTERFACE_MODE_1000BASEX:
 	case PHY_INTERFACE_MODE_2500BASEX:
+		if (!(BIT(port) & info->serdes_mask))
+			goto err;
+
 		mask = YT921X_SERDES_CTRL_PORTn(port);
 		res = yt921x_reg_set_bits(priv, YT921X_SERDES_CTRL, mask);
 		if (res)
@@ -3933,13 +3942,18 @@ yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 		if (res)
 			return res;
 
+		pp->serdes = true;
 		break;
 	/* add XMII support here */
 	default:
-		return -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	dev_err(dev, "Wrong mode %d on port %d\n", interface, port);
+	return -EINVAL;
 }
 
 static void
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index bc2641ded101..6f0123d219e0 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -858,9 +858,6 @@ enum yt921x_fdb_entry_status {
 
 #define YT921X_NAME	"yt921x"
 
-#define yt921x_port_is_internal(port) ((port) < 8)
-#define yt921x_port_is_external(port) ((port) == 8 || (port) == 9)
-
 struct yt921x_mib {
 	u64 rx_broadcast;
 	u64 rx_pause;
@@ -936,8 +933,12 @@ struct yt921x_acl_blk {
 struct yt921x_port {
 	unsigned char index;
 
-	bool hairpin;
-	bool isolated;
+	/* SerDes in use */
+	bool serdes:1;
+	/* BR_HAIRPIN_MODE */
+	bool hairpin:1;
+	/* BR_ISOLATED */
+	bool isolated:1;
 
 	struct delayed_work mib_read;
 	struct yt921x_mib mib;
-- 
2.53.0


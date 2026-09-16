Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D314B0E2C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577034; cv=none; b=cUD8o47hqE4U8hAFGdPDAhvglGwextHK3UQZqHMGvBm2o1yr6UVWOk8CCrxv2UMBY3gfyUOkln7d+1qag49h/iab1eXNvuBa+JH4TRwScCMdPj+kQQ/ew0yn6SupeY14GyFX9WDLlxa/DYOxAn2nASeVgN2wosf33ve7eGunukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577034; c=relaxed/simple;
	bh=YuVnVbkxesHUrvTiDDRRP7qicf2K8BySrtV+L0OtK/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFFjLIaixTLvH7jQI/atcTuo3f4squq94nUU9tip4GndGZmsJabMIDIBKgfc/xtQveqFE/V07VpK/dkuCf9slt6ndx/AG00/rJVCbzl7kZouvLP4OQaPgM279apSj3SQvR0g5ulld7by/IywLAAprRjmHuVpr4OJH4454TgZc/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhN0a1Hh; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhN0a1Hh"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso552040a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577015; x=1790181815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUdkePa1f6mE21SLiU0MIHgY8wUKKU9ZP9pTIcp6WpA=;
        b=hhN0a1HhHOvtP/in0VooKFYuw15/0BMdFcO5nuDobVqnaET8L9Z3HSIuOTtTJxKtPe
         Y1vJR53kCQIdEYnXT1sNaRhjAygsEDX85ol2Y6iGl2ypsx7Qpq+VdNyPlIVI8CKs32pW
         wmjM/MljKrDx6mPlaG2yc+tEfsBhXlXvOTdwF84SQbgCOCmIjyJP6RQWoBOQfdWidFu2
         bvF5RmQweATBXVencG+hzlp1vSKRwPJAlQ15jphsJsXmSzjKqoy40VZMc4QXHeqv/mJE
         jfHocyxG+4zt6uJBeTB0HTzwvPi4B8XOQuyrFkd56SAMP0W2apbablmrcgbhj5nEjjN8
         wT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577015; x=1790181815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUdkePa1f6mE21SLiU0MIHgY8wUKKU9ZP9pTIcp6WpA=;
        b=1Uv6VW0GngASih9FG2frvPipZ5JeOQA1PYKc5lFtZH4KYbInTciaTBWWbRnqvPAJOM
         x1S4G3uY/STQOTNFajNzdSzSPqCyckkEf9CbFHG7zzKTFUWQyC2VZSmQPEnr5LL9V2fW
         v09PH832GX3tO2WPKF/nftx2sMKP/4gzKI/8RoBSiIZa+6l3L7Stu5XT08bU8t0J3eZO
         9FQKWI28FJMM2gKSLqWrfwKWQVnHQENhhh0SmEBtIyqLMEuZqHxEmxqDO5aOnMUJr4YP
         1x8g9H5Z5/kkVEpSK4v1hQxIbIvW9nlVbuDeoGsTUfymhPoI9rnuyehaUG+wXPTShEio
         xeWw==
X-Forwarded-Encrypted: i=1; AKwUvBwkL30v9OOSkrLueb0jE+2URzMC4hrUq1jetP1WsJiuo8l2yl6VXiEN84DiuX22g/LmB9yYfsnJPUIvtow=@vger.kernel.org
X-Gm-Message-State: AFuF++lAY1Q/G5jKm/d4Lzb/QY9THKpeNVghji4JSRbSQ4jQtIhn3vS0
	tWcjzhviTB+uAaEsNtz9h1bFSl4W68XvWK0WX5M2BfV18rxRdXDACVt+
X-Gm-Gg: AYBFou0pcMVpTwbsVqDuK8a6Rme1omNfY7dSE1S5lYKESiCxLdLsesyWDvEUXWnZh3w
	3V7V90glQyhfQNXKv/aZFVgrPnTdPo/zwEqAQHBkOfUQCFKhnjAFkanZlYDRDmFvOJLDk5WItFB
	eDgifmB7V7kHYCxFEvLC2AHunVSSlbUnkOooXPNZM9Fofj4/FIHveAqjr8Kpv22EFNbRpEEpPcG
	COQQ+zNLZH0W25TKyEedNQreohHrExDfYOvNEajl9NXvNMUX4zviezY3fZZ7Ez4PlgO97vYNVvt
	mdpOKAuV4JQKIu1ReQD/K/8c0pWVNxSD2AwLGs1zNGDPrwZOgXbPZr/Z6Zt8nLVMPqqbBisOwVx
	kJsJAA2ar+4uNdhWm9H44/S78eQw6WiKv8T8yU3AmW1o+IAzWXi4uysV7gpFmXEfh+UafGzg3DZ
	v3McdwFTnewyDqwHky4X8mdKdOFRkOf2hiVqVDZWick3tXHRbxdlby1OM2SE5XYx9DRFB9EEcsh
	YcSzmG0LhEPCR4ph4oyNGTJRXjvtAIRC+/p
X-Received: by 2002:a05:6a20:72a6:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3dd5f3c0a6cmr8204589637.3.1789577015271;
        Wed, 16 Sep 2026 09:43:35 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc757csm1902278a12.32.2026.09.16.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:43:34 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/8] net: dsa: motorcomm: Split xMII and SERDES port masks
Date: Thu, 17 Sep 2026 00:43:02 +0800
Message-ID: <20260916164310.3168269-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916164310.3168269-1-mmyangfl@gmail.com>
References: <20260916164310.3168269-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace external_mask with xmii_mask and serdes_mask, and advertise the
interface modes it actually supports.

Also move struct yt921x_info into chip.h for future use.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 39 ++++++++++++--------------------
 drivers/net/dsa/motorcomm/chip.h | 13 +++++++++++
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 5acd7d27ff40..b527a9cfd3e8 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -96,53 +96,48 @@ static const struct yt921x_mib_desc yt921x_mib_descs[] = {
 	MIB_DESC(1, YT921X_MIB_DATA_TX_OAM, "TxOAM"),
 };
 
-struct yt921x_info {
-	const char *name;
-	u16 major;
-	/* Unknown, seems to be plain enumeration */
-	u8 mode;
-	u8 extmode;
-	/* Ports with integral GbE PHYs, not including MCU Port 10 */
-	u16 internal_mask;
-	/* TODO: see comments in yt921x_dsa_phylink_get_caps() */
-	u16 external_mask;
-};
-
 static const struct yt921x_info yt921x_infos[] = {
 	{
 		"YT9215SC", YT9215_MAJOR, 1, 0,
 		GENMASK(4, 0),
+		BIT(9),
 		BIT(8) | BIT(9),
 	},
 	{
 		"YT9215S", YT9215_MAJOR, 2, 0,
 		GENMASK(4, 0),
-		BIT(8) | BIT(9),
+		BIT(9),
+		BIT(8),
 	},
 	{
 		"YT9215RB", YT9215_MAJOR, 3, 0,
 		GENMASK(4, 0),
 		BIT(8) | BIT(9),
+		0,
 	},
 	{
 		"YT9214NB", YT9215_MAJOR, 3, 2,
 		BIT(1) | BIT(3),
-		BIT(8) | BIT(9),
+		BIT(9),
+		BIT(8),
 	},
 	{
 		"YT9213NB", YT9215_MAJOR, 3, 3,
 		BIT(1) | BIT(3),
 		BIT(9),
+		BIT(9),
 	},
 	{
 		"YT9218N", YT9218_MAJOR, 0, 0,
 		GENMASK(7, 0),
 		0,
+		0,
 	},
 	{
 		"YT9218MB", YT9218_MAJOR, 1, 0,
 		GENMASK(7, 0),
 		BIT(8) | BIT(9),
+		BIT(8) | BIT(9),
 	},
 	{}
 };
@@ -4021,15 +4016,10 @@ yt921x_dsa_phylink_get_caps(struct dsa_switch *ds, int port,
 		 */
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
-	} else if (info->external_mask & BIT(port)) {
-		/* TODO: external ports may support SERDES only, XMII only, or
-		 * SERDES + XMII depending on the chip. However, we can't get
-		 * the accurate config table due to lack of document, thus
-		 * we simply declare SERDES + XMII and rely on the correctness
-		 * of devicetree for now.
-		 */
+		return;
+	}
 
-		/* SERDES */
+	if (BIT(port) & info->serdes_mask) {
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  config->supported_interfaces);
 		/* REVSGMII (SGMII in PHY role) should go here, once
@@ -4042,9 +4032,8 @@ yt921x_dsa_phylink_get_caps(struct dsa_switch *ds, int port,
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
 			  config->supported_interfaces);
 		config->mac_capabilities |= MAC_2500FD;
-
-		/* XMII */
-
+	}
+	if (BIT(port) & info->xmii_mask) {
 		/* Not tested. To add support for XMII:
 		 *   - Add proper interface modes below
 		 *   - Handle them in yt921x_port_config()
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 83cd454955dd..83e76cefbccd 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -960,6 +960,19 @@ struct yt921x_reg_ops {
 	int (*write)(void *context, u32 reg, u32 val);
 };
 
+struct yt921x_info {
+	const char *name;
+	u16 major;
+	/* Unknown, seems to be plain enumeration */
+	u8 mode;
+	u8 extmode;
+	/* Ports with integral GbE PHYs, not including MCU Port 10 */
+	u16 internal_mask;
+	/* Note: xmii_mask and serdes_mask may overlap */
+	u16 xmii_mask;
+	u16 serdes_mask;
+};
+
 struct yt921x_priv {
 	struct dsa_switch ds;
 
-- 
2.53.0


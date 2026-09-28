Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0A502D72
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633341; cv=none; b=SbcxVk4/8LsD444xC9o/hpzmLJQB+8JqyTCe1oFkgnFUhykK6fzblkvFSwQt/NUM1CcVDqF/GlLoNDrSRN5Pc8PjEn3BrrCwD48ucehzbDLG6lV2XcrqsiT/UoJrqZgJoOz/J7Pj3jyIWjVrwjRZSEsH5Gx4j0fkGKDweWfUMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633341; c=relaxed/simple;
	bh=lSma2WM3bgp/gZlSRBeZYbhRGiFFHzMemvPLzg5Y338=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8Cngfu0wgUorom5VT5lnawnaf2QlhC+GmG7Xzk0ttDYZGnxuGBJyCCBb7WxjYazBUpFZ9xEDbPq2E6Fc+CNfXomG5GPRvbR392I87Ajvn/3w2z7IlKQu+1DrtezXcVjntEzZMJ2muF7vXXHfGvwNUsCfUBxnj/99PjIhU94fXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5GhxSNH; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5GhxSNH"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2b4138d3deso372473066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633338; x=1791238138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucCVhRvOYSRdkKXFdB8sZSWgukQ/dQeOO5SpOI+YMas=;
        b=d5GhxSNH3i9cJgJ1XEA4q1dThpEiWJH2M9oRU7Qe0oGrnESvgkYOqRGKoISuT+3t4z
         LFXrY5asfaufC9YRRTkJqFSZvNt7SFa4hOf28z2RPgJOsCXZVSdYlNPNSQwNiQgmfDMc
         9Z1UqFNsKIqmDhtBysPfyjaRRRuk5rOfo/S5eA2LThlnwvLVxPcmcXKRQIkZOU9BaGSg
         j0B541vF8QGQMWb2gYWfYNepYCQN/Aoksp3QSVL/t56nLLTp44k9gWX4EzU/a28e93FR
         /ZuX38O0niEUTL8kUEGmvbyknjJ01TaBKEtHTcV+efI4uwl8xD+5gcbvU8UZCy3ZQNZK
         MqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633338; x=1791238138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucCVhRvOYSRdkKXFdB8sZSWgukQ/dQeOO5SpOI+YMas=;
        b=GetoImgSF9wXNfME+zw8w3k3Eg3lJk8ekIDos8ryYARqg/G4/UxXg0s2Pwuh+NYBYm
         vh5O2wCIfTi2/S5SesjIy3jfOc/NdKON56w2Bq8eMau8LMI0rDyiVexaFd8UxniEqeb7
         OmnJaOp4L3zjs7nOgoE7aX+W9LLcSI2u0v4mVr59fOfJAJ41n8bTcDeZ0v1dsSTvAM7r
         s/CvOelse6/f94LAZp8zmHkz7icwqjf71mmRT+JcXJqLp9TwePDJsfJcfnkG2VfLBIVt
         4zC0h5m78SpzDRiRvpMXD9KIFceN2Ep28wN8P0t3La1woMdSy553jVSf7OVDTjV/w3wN
         pBiA==
X-Forwarded-Encrypted: i=1; AKwUvBykyAQHo+19/J6f3K/OdbK6ndNCApKlLg8HStl8AcHu714kFJ6toHoY3GPM7LPe9UL0sTchCeOl6jOVamU=@vger.kernel.org
X-Gm-Message-State: AFuF++lWnIVc5lPQU4yp+rUl3MWQg7G+f12kBH/D+PbblyIgz1FeoeqR
	2Ey4Ad7H3BvFTYDTR2kGMDANDaAAx4JpOHV3hRMZixZXiiR0hUDfVaV2
X-Gm-Gg: AYBFou0CcfqxKHQBOMlGdMr2i+0BRQE3fdFvJeuUAjSITPJ+L12GuzXmli0uXLDUz2G
	vf0fhfWd0BAHUAwLt9gybzkr2sPfHXQN09TZRYlRteuJu24M2VyJur7S+SY7SXrrYaByPgaQPgo
	kRLQOBSK2S4q6biVW5D+VdBkUugmz4XvTAyLpq6elA018IFIlnfIWTtBGClZYGsfcX4K4o1nwRj
	dCw4Opq8rQz++B7NuOxq4SNIIQ4dS4jSqTfMy5xbbn8huNCNAZRoyRX8ADy+hsoF5UjA9tICdIQ
	bgZ7yjN5Q91XiKyxbnL3RRrAmemT29NG66COsxk98taimft1g9/1gU6uzeHFMlJ3HdkE77HeIXA
	WzMcc+ZEht1LwVu3sSP3zW40QDb/FCKKtQcyUN/9WYRD6ilC/xwPiDZeI1q6GRDAC/y7uBpSajr
	oJzqskiOQdZsdVswf94bAwyVhW3Jgv1dDpKLoomZt1ckTnULhd58yPLv8Mz6ls+cJVWbkly6g2W
	ijcW/yssb+Sj/vNZPmH9sZGYwND7Jz8Ni82MfSGILXgg51j8tVaBu4G
X-Received: by 2002:a17:907:86a5:b0:c29:5af0:3b44 with SMTP id a640c23a62f3a-c2ac251e640mr1155105266b.41.1790633338029;
        Mon, 28 Sep 2026 15:08:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcacfsm345002466b.74.2026.09.28.15.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:08:57 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: Ziyang Huang <hzyitc@outlook.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 3/3] net: dsa: qca8k: support QCA8337 internal PHY CPU links
Date: Tue, 29 Sep 2026 00:08:11 +0200
Message-ID: <20260928220811.1880-4-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20260928220811.1880-1-yongzhao.derek@gmail.com>
References: <20260928220811.1880-1-yongzhao.derek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ziyang Huang <hzyitc@outlook.com>

A PHY-to-PHY CPU link connects the SoC PHY directly to an internal
switch PHY. The QCA8337 supports header mode on these ports, and
existing phylink callbacks already handle their internal interfaces.

Allow QCA8337 CPU port selection to fall back to ports 1 through 5 after
checking the dedicated MAC-only ports. Preserve the preference for CPU
ports 0 and 6 across all switch models, limiting the internal-port
fallback to QCA8337. Support for QCA8327 internal CPU links has not
been established and is not enabled. Include internal CPU PHYs when
selecting the PHY access method, without altering the handling of
MAC-only or external user ports.

This enables a single internal CPU PHY configured with an explicit
phy-handle and phy-mode = "internal". The conduit interface uses its own
PHY on the opposite side of the MDI connection. Existing single-CPU DSA
forwarding uses the selected port for default flooding and membership
without extra routing changes.

Adapted from the OpenWrt PHY-to-PHY CPU link patch, narrowing the MDIO
filter adjustments to preserve handling for external user ports.

[yongzhao: preserve external user-port handling on port 6 and limit
 internal CPU PHY support to QCA8337]

Assisted-by: LLM
Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 7bd9d9abcef..cd36efd1c4f 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1026,7 +1026,8 @@ qca8k_setup_mdio_bus(struct qca8k_priv *priv)
 			return ret;
 		}
 
-		if (!dsa_is_user_port(priv->ds, reg))
+		if (!dsa_is_user_port(priv->ds, reg) &&
+		    !(reg > 0 && reg < 6 && dsa_is_cpu_port(priv->ds, reg)))
 			continue;
 
 		of_get_phy_mode(port, &mode);
@@ -1102,16 +1103,23 @@ qca8k_setup_mac_pwr_sel(struct qca8k_priv *priv)
 static int qca8k_find_cpu_port(struct dsa_switch *ds)
 {
 	struct qca8k_priv *priv = ds->priv;
+	int port;
 
-	/* Find the connected cpu port. Valid port are 0 or 6 */
 	if (dsa_is_cpu_port(ds, 0))
 		return 0;
 
-	dev_dbg(priv->dev, "port 0 is not the CPU port. Checking port 6");
-
 	if (dsa_is_cpu_port(ds, 6))
 		return 6;
 
+	/* Internal PHY CPU port selection is currently enabled for QCA8337. */
+	if (priv->switch_id != QCA8K_ID_QCA8337)
+		return -EINVAL;
+
+	/* An internal PHY can provide a PHY-to-PHY CPU link. */
+	for (port = 1; port < 6; port++)
+		if (dsa_is_cpu_port(ds, port))
+			return port;
+
 	return -EINVAL;
 }
 
@@ -1863,7 +1871,7 @@ qca8k_setup(struct dsa_switch *ds)
 
 	cpu_port = qca8k_find_cpu_port(ds);
 	if (cpu_port < 0) {
-		dev_err(priv->dev, "No cpu port configured in both cpu port0 and port6");
+		dev_err(priv->dev, "No CPU port configured");
 		return cpu_port;
 	}
 
-- 
2.43.0


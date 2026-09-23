Received: from mail-ej2-f37.google.com (mail-ej2-f37.google.com [74.125.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C31538D8A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200761; cv=none; b=gIfKXxdz1af4V0vEJEX1IdqsOjmtqzJ6XOVb62eH77mT2QzzTo4BRxLci02PDU5rM67cJDnYQCUzyoFfgybfIZMIVy/c1Uvz/rP5swc/DWjORb3Iob+hhH7Zoo6XTyYWYZ1dfwUnMtVN9arkNeQOe+5Pq7gTsekmqZGwHcKjUMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200761; c=relaxed/simple;
	bh=J0Sp6wjcAdOKyksqDGpihJARjQeZGq+KnET565qCRCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3HT2RIrSLsNhqhrApoNWGFICbXUIp7a5csoEpqfByewfnoztpYdDoy9420fVfd6t7lErFW3e+q+FqGsZNoWxhXRt/i+ZaNGYBv7vPGpbGUytcnQ6QAqRM0iFNqwfwHyBSLg7rwFhoadlVE7UIn0odZ9YGGZQutX0GqP2QBTmXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOmGdNsL; arc=none smtp.client-ip=74.125.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOmGdNsL"
Received: by mail-ej2-f37.google.com with SMTP id a640c23a62f3a-c294af0caa8so191233866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790200758; x=1790805558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xa8czIzRcUPMoGOkxR49jFfVVsSrtHuSDR475Y+48CY=;
        b=eOmGdNsLbMaF4I1p8Pfk8SYPYu3hc+b6WyuQoUUQNu7TbHPgWT7Tj1O/hiXG0KzJBM
         dn7UtNBhHUy79XSE3uXX8MCHId/h2G/MI2WqRdDs9jiw4p5oxFb3CRBOUI+5StkFL8hh
         4ZK5Lit4q8XFLsp4saBX/e66yZrwPpRE9lLtgAkt7fU0liRyXcngSVRzTaWE7zszXkKs
         vvHXbuQXvwrEdC/zems4pxDs5U9gyOF5xpkFRbPbLlbaZmVds3p3QTPuN6aSYJgytm3c
         mrdqXzTn2+GW1jY6SbF/OFVBNohWhdfMbrsAwAGfGbfus2oQlPsRhE6Kdtex5+1D12B2
         9u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790200758; x=1790805558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xa8czIzRcUPMoGOkxR49jFfVVsSrtHuSDR475Y+48CY=;
        b=YKHAWIH4lEIgtoYmzEODmuNe1b9BkXZ0cVZ813M5Kd1ln/mBWl9C/rA+t0trY3GjAA
         t8m/dX7t4cnZGvl22Gia5PRK6bunjJtBfggZH8wFGI4nuwker/LlYOfpqKO6hHZAb1CB
         bWWQVIhujT7vfwYz0fu3OohRYL+SBeOfWXuBCvBLKjR5QJo8RRGC2Bq/fKVWK3s45J8h
         vIGbiy13nPLg4y9YWceVTIobvZrwtdbxZE9gdecxodB/+mCsPRim/HyXyeMWXWleWaun
         esjQpfmJ6dCFN0nzfZuy8RHsBC/6J4LJaRvHbXP46DdwRX6H+Mya7yGs/G75/o2zxeHa
         0I9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHy5e96x7cjL8q1hxPbEwoMXYw/3rRtftUeh1SF3n3O+gAVt46t4yFIzdV5xI9x4WrIKQDR5RtQIHQ5to=@vger.kernel.org
X-Gm-Message-State: AFuF++kKeUyy4v1SXwETLHs7PNz46/uWRJQgmX4xO8BRCzv8FJodL6Rl
	QKtMaIDqn9TcTdkYjO6vKuAPMHCUWcLwGQR8Rlck4KBtFhkK9NbQeLqd
X-Gm-Gg: AYBFou19zy06FbaJKOlw8Lwdrf5IXYlSnu+7DlaWhMJEXN2Vqh1t0Tpcozvu1RyGTgX
	+APga+HZBzue/I1J9P5IImQvJlYy2PExjBUPUuMDs0Lpew8YIByLi817tICdfosOj7WZehK5JXQ
	ATc9oAzfmiWCnalDLkyezDkPKeOEf4Bd370xp14sIXgG5vCJPI7ZjeZzmtzPobbUSXP/oF1qcmB
	tTejegn+olXpGvkknuz0+/DNunRcq8Bi8bYRVTxmiqT2gz3n0/+2K/Jw4mrK58u/srJv1HI/6hc
	1da4THUg6SCoFVCVD1sumTuKDNwNO2HZzIiDptbkV3P8N2NNbffYajlcopvMAyoPF/sMiMPQ6KJ
	AZht8+QHu/4kekXmL7wa8OZNdtxnvx4dhYFXYB+zfiPO+Tugfd6N8pKpRNZO/d3vjPqr5Qbfe4F
	wUHw8AmTODymk5dQMO6YMZxS4+QE6PzXwcOSDu0hh0n2DlbF5BnNvUG39JjSrcO7G93QO7pXj45
	g4y2gccPgKk2QajdJdXlBCgQRV2M6IEJW+qly4a/m59hlB8BHJ1dTNnHHzeJ7rVocdCNghlTxZO
	NgD3JRbSDLouIk6B3uaqnuGMauyIyBzCYgH33U53JQ==
X-Received: by 2002:a17:907:97cd:b0:c25:5d2:acf0 with SMTP id a640c23a62f3a-c2ac241f82emr35605966b.8.1790200757992;
        Wed, 23 Sep 2026 14:59:17 -0700 (PDT)
Received: from localhost.localdomain (83-233-130-25.cust.bredband2.com. [83.233.130.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6dcf0dsm197647666b.61.2026.09.23.14.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:59:17 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: [RFC PATCH net-next v3 3/5] net: dsa: qca8k: support QCA8337 internal PHY CPU links
Date: Wed, 23 Sep 2026 23:58:55 +0200
Message-ID: <20260923215858.1653-4-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20260923215858.1653-1-yongzhao.derek@gmail.com>
References: <20260923215858.1653-1-yongzhao.derek@gmail.com>
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
fallback to QCA8337. Support for QCA8327 internal CPU links remains an
open question in this RFC. Include internal CPU PHYs when selecting the
PHY access method, without altering the handling of MAC-only or external
user ports.

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
index d8564001c..07640ce4a 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1019,7 +1019,8 @@ qca8k_setup_mdio_bus(struct qca8k_priv *priv)
 			return ret;
 		}
 
-		if (!dsa_is_user_port(priv->ds, reg))
+		if (!dsa_is_user_port(priv->ds, reg) &&
+		    !(reg > 0 && reg < 6 && dsa_is_cpu_port(priv->ds, reg)))
 			continue;
 
 		of_get_phy_mode(port, &mode);
@@ -1095,16 +1096,23 @@ qca8k_setup_mac_pwr_sel(struct qca8k_priv *priv)
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
 
@@ -1856,7 +1864,7 @@ qca8k_setup(struct dsa_switch *ds)
 
 	cpu_port = qca8k_find_cpu_port(ds);
 	if (cpu_port < 0) {
-		dev_err(priv->dev, "No cpu port configured in both cpu port0 and port6");
+		dev_err(priv->dev, "No CPU port configured");
 		return cpu_port;
 	}
 
-- 
2.43.0


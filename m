Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD33C4544
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700472; cv=none; b=Vr8O2Kt8xQUzVIoUhdeuQ97uprMZqQkYKsiavE1yF9Veqpk4N+uNSt1od5oZLwO2Ek6q8GKwacCyszokumcGsDSjUHJx1vT9WyvTB3RKukcTvdbdOicJNOyhxhhcZDX5zHcFVPCc8vZUpPfWFzIo6cbnCJpF0bzBTlhVrMj9e3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700472; c=relaxed/simple;
	bh=5Ue5J4wvdwmg3xCmIKxESOSyEdVbksmLLx4XYpOlFq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHca5iWCtN4oq7gzmJ5C8TtpVdZ4iPRh0VnvHaIeMGuJGnwpVaZOjTSrveNUHdixegqQ1cI5sMwACzjnUIAkJSHty4WtHs/n6c9hNPH+nzOqixho1p87ic0uPmuSgZ13/o6MmmQ+Sygn10nH4NS8O34IFxlL7hrBQoiUo6r+fXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBNqjHhx; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBNqjHhx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d560775ca2so18384645ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788700470; x=1789305270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXCbtCROcfidG6D2f2XjEN8/M12v+19c6nPqKarGz8g=;
        b=KBNqjHhxGt+RD7EzHoV6yW1UEE3JMZHefpyfaF0c16ag0iCER5Ix5DMwk4XoXg24af
         RVslOEQL48d9gPwXCeB5MHnhzsnFjy5ROVtIahPhCMxZWSEDUUjXbxMmOftYAxQoIaVy
         A4TxWxh/VVP39nXZWpS9jWUm8h4hjaMiXR17yvZ0pL6N/xq2QAVaq6ehT4jIWsb6WDbQ
         /9LvbcWh0dPOjddk4CLXVSUZoKlSVcsCUxvBZapVfD430awDLfnf/50STmqVhexa/7Hw
         rfkA4BLfv7jUfpA2udAvraoNVKXPCyvIaJ0yG7ctQYki9bb9cACy5KbO6PUGU8K4CUvZ
         85Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788700470; x=1789305270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXCbtCROcfidG6D2f2XjEN8/M12v+19c6nPqKarGz8g=;
        b=THEpj9pT44moR472pxEygccIsIC1Q1dqIEq9BRnln68sSGjlLKZGNks3eea92f/pNi
         mTp1CHp6KcPgAkayYcPlt81m9ptQJ6yE+hiMmDSYCwFUW0sb/QZgFqB8dJdHIU4/5qXq
         vJjDtutQNDDi57m4z/kprWUMuwx4yMwTojLG9HmNH+OPjoWLi9uMgvghwA1IAlNyHMpU
         wRf/D2ULP8lvsbKGpf6yYywOmk6fUhCyF6fXPRrFILEDZxBi+04Z/KMEMpburkIF4UCq
         /e5qHKaq7e4Dq40vIQ1QJrejLCDVdbeaLu/JCzUW15UtxSuCbbffKG9YcRD6inoatIZB
         UTug==
X-Forwarded-Encrypted: i=1; AKwUvBxJbJB/bQEbl+18MArhlTRUlSZ+AB8XkrfI79KPpVe08wnZfFmuOR78nlVkI7AED3jEqnokINLvvIJclsA=@vger.kernel.org
X-Gm-Message-State: AFuF++n82La9xcUE0GDpUKiLxVySUybkW6pcnaFXTX9axvxJkC4bJff0
	/2TScgMF0KsJNzGttNglWfw13ATLWzfEmZryfmNU4tBeLyN0RTBLgv+R
X-Gm-Gg: AYBFou2M/TOlh5NaHsLy5jgtKXidy8mHR2Hlw9ZwtTLIEZIB/y/vTm9K9L5bvcM6h8o
	V4NIqcNo1Yn2CRZdgH5Ae3SBik0+jTAqumXxFg+muRVTtcoDu33TLIbBawF8oP5Xex/RRV8AmTd
	z183voj5LyLkp5h4/+tOVPIooKkpwezQqpB6bwS49XN1IdVCDqiNBGZnvBzhRQfxlLgFGG0k5vw
	hDMJqhaCAZpJ0iFygdxN+Gx8JL6dUwV1fXiAw0JQdxsV7s4ljO+5Kp9PBdRlHfaZM8t/qRZW14e
	o+6I7JdTo01Ev5H7eDJW1UHY97rKcoe9Hf25yNEoZeS1rCeDJPndfiN4zDbgS/MiVr8m5pEhf/N
	Oj9UEVdnhSRY6QQdt6AQGMBo4CZQ8sIRD9ZfDNcoMFP8wlU6klEsdamgPPrZ5GnZ/oRfpiPKYHk
	KcojyhEgh2yiIjzQ4ZppAEOSM7FosQRFninTe7awHCYSGMAfkxdf3B1cJUvTJNTTkBTgsKqU9KU
	40DFlOlncAmXQ==
X-Received: by 2002:a17:903:40c9:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2db124b451cmr242694065ad.7.1788700470234;
        Sun, 06 Sep 2026 06:14:30 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b2f8sm32259965ad.21.2026.09.06.06.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:14:29 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/6] net: dsa: motorcomm: Rename MIB stuffs
Date: Sun,  6 Sep 2026 21:14:06 +0800
Message-ID: <20260906131414.2683362-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906131414.2683362-1-mmyangfl@gmail.com>
References: <20260906131414.2683362-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename them in preparation of major MIB refactor.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 32 ++++++++++++++++----------------
 drivers/net/dsa/motorcomm/chip.h |  4 ++--
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d663af010f43..ad5fe1ccb1d7 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -545,11 +545,11 @@ yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp)
 }
 
 /* Read and handle overflow of 32bit MIBs. MIB buffer must be zeroed before. */
-static int yt921x_read_mib(struct yt921x_priv *priv, int port)
+static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 {
 	struct yt921x_port *pp = &priv->ports[port];
 	struct device *dev = to_device(priv);
-	struct yt921x_mib *mib = &pp->mib;
+	struct yt921x_mib_stats *mib = &pp->mib;
 	int res = 0;
 
 	/* Reading of yt921x_port::mib is not protected by a lock and it's vain
@@ -604,7 +604,7 @@ static int yt921x_read_mib(struct yt921x_priv *priv, int port)
 	return res;
 }
 
-static void yt921x_poll_mib(struct work_struct *work)
+static void yt921x_mib_poll(struct work_struct *work)
 {
 	struct yt921x_port *pp = container_of_const(work, struct yt921x_port,
 						    mib_read.work);
@@ -615,7 +615,7 @@ static void yt921x_poll_mib(struct work_struct *work)
 	int res;
 
 	mutex_lock(&priv->reg_lock);
-	res = yt921x_read_mib(priv, port);
+	res = yt921x_mib_read(priv, port);
 	mutex_unlock(&priv->reg_lock);
 	if (res)
 		delay *= 4;
@@ -643,11 +643,11 @@ yt921x_dsa_get_ethtool_stats(struct dsa_switch *ds, int port, uint64_t *data)
 {
 	struct yt921x_priv *priv = to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib *mib = &pp->mib;
+	struct yt921x_mib_stats *mib = &pp->mib;
 	size_t j;
 
 	mutex_lock(&priv->reg_lock);
-	yt921x_read_mib(priv, port);
+	yt921x_mib_read(priv, port);
 	mutex_unlock(&priv->reg_lock);
 
 	j = 0;
@@ -685,10 +685,10 @@ yt921x_dsa_get_eth_mac_stats(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib *mib = &pp->mib;
+	struct yt921x_mib_stats *mib = &pp->mib;
 
 	mutex_lock(&priv->reg_lock);
-	yt921x_read_mib(priv, port);
+	yt921x_mib_read(priv, port);
 	mutex_unlock(&priv->reg_lock);
 
 	mac_stats->FramesTransmittedOK = pp->tx_frames;
@@ -721,10 +721,10 @@ yt921x_dsa_get_eth_ctrl_stats(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib *mib = &pp->mib;
+	struct yt921x_mib_stats *mib = &pp->mib;
 
 	mutex_lock(&priv->reg_lock);
-	yt921x_read_mib(priv, port);
+	yt921x_mib_read(priv, port);
 	mutex_unlock(&priv->reg_lock);
 
 	ctrl_stats->MACControlFramesTransmitted = mib->tx_pause;
@@ -750,10 +750,10 @@ yt921x_dsa_get_rmon_stats(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib *mib = &pp->mib;
+	struct yt921x_mib_stats *mib = &pp->mib;
 
 	mutex_lock(&priv->reg_lock);
-	yt921x_read_mib(priv, port);
+	yt921x_mib_read(priv, port);
 	mutex_unlock(&priv->reg_lock);
 
 	*ranges = yt921x_rmon_ranges;
@@ -786,7 +786,7 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib *mib = &pp->mib;
+	struct yt921x_mib_stats *mib = &pp->mib;
 
 	stats->rx_length_errors = mib->rx_undersize_errors +
 				  mib->rx_fragment_errors;
@@ -822,10 +822,10 @@ yt921x_dsa_get_pause_stats(struct dsa_switch *ds, int port,
 {
 	struct yt921x_priv *priv = to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
-	struct yt921x_mib *mib = &pp->mib;
+	struct yt921x_mib_stats *mib = &pp->mib;
 
 	mutex_lock(&priv->reg_lock);
-	yt921x_read_mib(priv, port);
+	yt921x_mib_read(priv, port);
 	mutex_unlock(&priv->reg_lock);
 
 	pause_stats->tx_pause_frames = mib->tx_pause;
@@ -4749,7 +4749,7 @@ static int yt921x_mdio_probe(struct mdio_device *mdiodev)
 		struct yt921x_port *pp = &priv->ports[i];
 
 		pp->index = i;
-		INIT_DELAYED_WORK(&pp->mib_read, yt921x_poll_mib);
+		INIT_DELAYED_WORK(&pp->mib_read, yt921x_mib_poll);
 	}
 
 	ds = &priv->ds;
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 83cd454955dd..805febb48683 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -861,7 +861,7 @@ enum yt921x_fdb_entry_status {
 #define yt921x_port_is_internal(port) ((port) < 8)
 #define yt921x_port_is_external(port) ((port) == 8 || (port) == 9)
 
-struct yt921x_mib {
+struct yt921x_mib_stats {
 	u64 rx_broadcast;
 	u64 rx_pause;
 	u64 rx_multicast;
@@ -940,7 +940,7 @@ struct yt921x_port {
 	bool isolated;
 
 	struct delayed_work mib_read;
-	struct yt921x_mib mib;
+	struct yt921x_mib_stats mib;
 	u64 rx_frames;
 	u64 tx_frames;
 
-- 
2.53.0


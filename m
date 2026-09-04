Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC12501F4A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539471; cv=none; b=F6F2+ezegrsUgH3QdrtKh5zqNlZAZkgDId0UNoz0aZBM1BuuxZSv44Kd/Lf/0pY7B3kZEw8wuXDsYnh6E8hIbfaTS7MTGmFVk8P09CWwyDyVi1ykxMc0dl68Bsn/Q9M8TYlt2VJAoUqHFKwTNEoEA9/KQwrrUrlYAVXYI9KrTpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539471; c=relaxed/simple;
	bh=5Ue5J4wvdwmg3xCmIKxESOSyEdVbksmLLx4XYpOlFq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UG9K+e0tgqAwzVjXDm8QvjazCc3FB0WS01YkhgZW7ZtoFJsqVFT4Hu48cd4mUZmLcZlKm5zNvxTXoU0fGnwJYWmHsn+Myj34QhxNMi88IuI8XM4giaJUOJMYb4vCvy9AsKBU3hFQ3GQglehfhJC4f6N43TnGG0r9+y3mst7yWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=id2h+cV/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="id2h+cV/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398e9698a70so1054753a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539469; x=1789144269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXCbtCROcfidG6D2f2XjEN8/M12v+19c6nPqKarGz8g=;
        b=id2h+cV/t17+CGlBMwkQSHwSd4kH4d9zp0o2vkdrJwZ0pfZsGQBx0rTK6oLBOUh0r0
         ClnI6QfHszTkYdVdCm6GKc2/spZFy92VlXJX95aSwj2OOtrux9xYISMisGrFREyYLLcD
         gFCphFJ0IlC2ZolMDdRm/PJsvDqTBIaKFwBaQFPgI8PaFcNra5wUoBasCG3XYSASp9C5
         qXl7G/FcuDwaxRZkGH7i35T4tMC0N0mNKd1WTeJ6+bq7S2xodgxhX8BCsx78eYfmL1kT
         KyMjWkfL1DnHKqlqfvElO1hAqFsTiAOQYix2ao7s406SxxecsowP9m2Eq6oNF9ltyE6k
         SR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539469; x=1789144269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXCbtCROcfidG6D2f2XjEN8/M12v+19c6nPqKarGz8g=;
        b=PhX1/0rr9sasFinTQErOV91VHiauZbkrqaxDELXUhSIS2/bUgVUoQDnIwnb34Gxear
         cxbepvpqibbfxZDfDaSiehPS1rKvu6Yc8lGcJB+o5N5C44OAx12eOsuaBa5LQS5/KdEp
         +EI55i2DdTS63Awzs3xzdSTiopNtG6YVfeTE6wsRFjWl70brL2PHrn4Scw/TkRFEWt2V
         JwhfXaQB0zVLpVzERWr03edihaqxcr6EAxyzDTLWKPg3iTWEfWMTGchiPUbshrmj+1Qr
         FfOy6d4bYM7wNXpBBEn/iWQtRVX/K5JEg9G4soRC5bF8ZDLqKqapBMLsODvRICcr/7uK
         M1WA==
X-Forwarded-Encrypted: i=1; AKwUvBzGTDFBdfVfjmN4BlDCMJhl+AX9pOSFsXD/ZKXbt5sgI5tFEXl/yevqM3O2hDeNDyB+6gchOkPvAfkUBB4=@vger.kernel.org
X-Gm-Message-State: AFuF++ktpGXpGwiI1tJcyshCU1dH9imxb88mGN0YoHF6p+CPCsWS3+rW
	aZn5g5eJNyAy4V396MoAPdzeS+UXbpMxyOpTZE6VlhMGzXGIO1AaPvi5
X-Gm-Gg: AYBFou0b59wZqnpva7SUNLm8pmMX8y3SsSQSXAa5AtGPPmyd4/Y+ey85tkHDwoF+Rnw
	Y65b1GSRHaGAq0ys0Bxq/Cil21c4V8m8hWIDei9n0igtEkaE+2X1JEeRtW0F6uUMq0Qm/ho+TtP
	a+IL55yLh9qrm9spYpXWbkleTVJgkwYLQcRM+OVGGO/Pe46PsEeuUhChTZUg7rlHT8JpM84H9sB
	xk9gBj8njU/fhzEW+XMslHR6joYDcEwFTbl3C5uwaOHqXnM0PuMJ88NtMhqO+QEv6/NSpOjGzqv
	3Xs1bRLQkMHbvKr4VpKzHoQhd4nhzBjeREs9nbYbYOJyxeNbKo8ctzsgRtYmycUNIsPJ7hSqKe/
	F2G6xPObMJuCr4x6KoXdTPaCtbxdurDEnzWZlSrQP+fScBHj/kxdGoLQmm5SRZ8qz1KmevmmLDu
	RjPtsQXvwl9Kr3R0jiy6KPMHwlO2mVnAygaqUJaorfa1OBqi/owJ0GOxm96hYqNRtz2nwzzP51G
	exOhMe5uUD+GXg=
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr11635748a91.24.1788539468714;
        Fri, 04 Sep 2026 09:31:08 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661b:3050::4d0:46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm5383010a91.0.2026.09.04.09.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:31:08 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/6] net: dsa: motorcomm: Rename MIB stuffs
Date: Sat,  5 Sep 2026 00:29:43 +0800
Message-ID: <20260904162952.709368-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904162952.709368-1-mmyangfl@gmail.com>
References: <20260904162952.709368-1-mmyangfl@gmail.com>
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


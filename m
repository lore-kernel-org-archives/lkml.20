Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440641;
	b=knc92zWoMYlIDoZ01uc/v2Jp0dD48Q4HtNArVv7qqlS0FBXWjcTQ+Tvl8Tsn1/ZThPQU
	 /XlJqtaYym5J3vGU0VM6Xa00PLSXTd/R/RTWDrdI+SmtUOPW1EmGVL4PF4Pm0WolHRHO4
	 SPCchEaoq62Qqw7ESl8rGPULez+GmkVr2tZivyzKs5KqISk+CWi8wShT8h/dindtYzGTw
	 g5ZiduFTNt4xmy4aJd/v3YLYkHKM0ojjO7eL8p0Z8jsYEVNYTdJZK6Ggua5q2j7vQLipy
	 T39eqXFcpCQOq8uB25XhAnO1YJIHBaXtPG7HIAkS1XyvuUaw0x6+prrjVjisljKvOxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ldnXgY1faDlDpUGn+olnei/ITLAjDr+k9eehHuDmZeo=;
	b=IfXsZviaAB3mFNBcvZ10fDhn1ySvPRnTbpQiAgwC7y4oLYtkB+IDLKtSiGDEiYHv+lbv
	 +gb2grGxZYl4AoJYe6M/JZ6BJsdKQL5Jv1kCpa+KWGwyuLxQux0MMZYotNIOvcIQOgo2O
	 S/CuZ5UQcxn+SoWzSi0eqUfUIi3D/MTP56X1odnaDb96UmjP9ba82Ga2Ii7vLQKL82SG1
	 8mlkAfkD3aIqSv82HBhq12aUQAZmyH8kXDYNLld4x+ChTIjLMIRxW0D8/D/OXeTtlByLy
	 UAe7G5Ehxb/UrF+P+NAfqBh46q+ufls5pcCKRo+bDCeEQgzfZD+7gSSEcvy+pgtqPPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pNqXSN1;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D35606A89B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D35606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pNqXSN1
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so183543a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794440639; x=1795045439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldnXgY1faDlDpUGn+olnei/ITLAjDr+k9eehHuDmZeo=;
        b=0pNqXSN1H2t/EQ5xseHVjP5NXlK3kpARjlUKz9A9JCdAuq8Yi1KKYtAhUQCXB+dICv
         W+Y3yz6QJiKfATMCBFldw5Hq80rm2lI7iGgwbd/Xw+wHqpnROaHxpSVieQ8ApokjyIQY
         f5C2cmLT0ogpXnlh7Wclts+wzZwFIxAJdIKQ7BmJIJhuQIT9a+BEAj25npWH6pb09o9/
         42I3mfSujqi4y6AMkzSvuHgkD7zwQRp1LnLXnZbZMeAP9p5Qpn2Tyyzd4dVjaw2AgdGJ
         zBwwv/qMo69o9d92W0+ylYu5VwFwlkD6MKxRBTWz7MDqDDE7wky7OoO8RLaMkxnDGWcA
         KESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440639; x=1795045439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldnXgY1faDlDpUGn+olnei/ITLAjDr+k9eehHuDmZeo=;
        b=dV5Op+W4eRnnz3p+8OmYXHttAWTqm4Wc500QyNJeaq5Dga7WIAabr2gA2cQ1cyWQ2v
         H5//gKvon03bUjmi29g311NAUzl6vkknnqOVLICG9CAREDbLYKeEYflbGOFidr6SFNuC
         4Khl3i5axVo1a3g9rmcSv9hGbDF4WTFIrxIPP/5KfNG0XBU+ktNgYlgk9BcWqtZz7dy+
         M8wjMeHSV16iU04k2g8zh/dllfOunDaOm+NsYc/l2CeXxZ7D9Kk3iwNsZU1pmj4OwrAr
         oiE5kj0I0j5WzlR/AdDGkUQPCTES6RJk9wIueZqbrE+hs7ivUUgWkrFLqOSdcanE0NQ7
         QtqA==
X-Forwarded-Encrypted: i=1; AL+hErFB2B+H7iUPNbPC2F+i0N8/tCj2Wr9TeUIQ9lmkpis9r3lcUhpzaJPV132MrDhX0qFIPEssiH5cglWr90M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jlPGASubqpRuzETd69oA2uZZxdFjj5FGn7aio+P0fNlixM7QV
	S31FBnXkEzEZFGwm7HHGF9CWXz1bajDh284SZ8iisFCG6N2PBasr7oBk
X-Gm-Gg: AYBFou1ZFcRbHIjdrXCdQhv/bN94Kqzy/QJDIhO7tJvZhc2kTc5n/1nVZvd6LmCiORX
	8AA+hgdj8WrI6bXoajD/m7SozG0HLnG+yqghcMtx5s0fV1w59CtM8FGYJApkDHhtkg70MZhHovN
	cKB2wESitS4W8rjGiLWIgZ4R7PBR6ShNZYnBKBxgkl4bvxDBZ+M45HCiebZ/jkucLlcVH3GRWbh
	RR5rJ88pGNgYbx10gjeHOSv+Um3kU0LHOIcbUb0SCdDYmm2dQX6VIS4R2HRoaVZ90pHko6pMqcZ
	e7iPdv4OJ4ibj7NRgxoN+GOLwGK8R7lCmekoaGoS19xgYaxk9Ud6stOBz15y8nOM5G3dklz1viz
	NHW9MqOHaHdd96oWZM4ZcaSFuFTOkOXpjNPEN03yp1A+0C8tFhnu7ffwL93wjJwtsD5BM1UbmDN
	ljHnG1F6qVFPJRMHzMsyaPzQK+mqq0+gVtob/d//SalutXzDoWgIfrX/KyrBzu9Fuzbbgk0QrMz
	FEyPPo0dyoYUsmjZkhPjSGQuwEmUhQE7XVzneDGYH2aU5UAym4c4Sscg85BVWPpW5MAbAvGQ7kJ
	gddEypucDuxlVtlI+ZgKC1Vbe6bKwaiH/+KwkYiURg3GbVlfLZ8K+g==
X-Received: by 2002:a17:90b:1b01:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b197c93f3amr505915a91.16.1794440639275;
        Wed, 11 Nov 2026 15:43:59 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c74bf3sm1328794a91.10.2026.11.11.15.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:43:59 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] net: dsa: motorcomm: Rewrite FDB entry on port migration
Date: Thu, 12 Nov 2026 07:41:05 +0800
Message-ID: <20261111234110.1449602-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111234110.1449602-1-mmyangfl@gmail.com>
References: <20261111234110.1449602-1-mmyangfl@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unicast addresses move between ports, DSA calls .port_fdb_add()
without a prior .port_fdb_del() call, making the new port directly OR
into the existing entries. The old port mask then loses track in DSA and
can never be deleted.

Fuse FDB join/leave into one change function, and rewrite the whole
entry on add with the bridge port mask as the leave mask, so that ports
left behind by the migration are dropped from the entry.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 96 ++++++++++++++++----------------
 1 file changed, 49 insertions(+), 47 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 150c51f1aa35..a2be819ccbed 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -729,13 +729,14 @@ yt921x_fdb_add(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 }
 
 static int
-yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
-		 u16 vid, u16 ports_mask)
+yt921x_fdb_update(struct yt921x_priv *priv, const unsigned char *addr,
+		  u16 vid, u16 leave_ports_mask, u16 join_ports_mask)
 {
 	u16 index;
 	u32 ctrl1;
 	u32 ctrl2;
 	u32 ctrl;
+	u32 val1;
 	u32 val2;
 	u32 val;
 	int res;
@@ -744,69 +745,63 @@ yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
 	res = yt921x_fdb_has(priv, addr, vid, &index);
 	if (res)
 		return res;
-	if (index >= YT921X_FDB_NUM)
-		return 0;
+	if (index >= YT921X_FDB_NUM) {
+		if (!join_ports_mask)
+			return 0;
+
+		return yt921x_fdb_add(priv, addr, vid, join_ports_mask);
+	}
 
 	/* Check if action required */
 	res = yt921x_reg_read(priv, YT921X_FDB_OUT2, &val2);
 	if (res)
 		return res;
 
-	ctrl2 = val2 & ~YT921X_FDB_IO2_EGR_PORTS(ports_mask);
-	if (ctrl2 == val2)
-		return 0;
-	if (!(ctrl2 & YT921X_FDB_IO2_EGR_PORTS_M)) {
-		ctrl = YT921X_FDB_OP_OP_DEL | YT921X_FDB_OP_START;
-		res = yt921x_reg_write(priv, YT921X_FDB_OP, ctrl);
-		if (res)
-			return res;
+	ctrl2 = val2 & ~YT921X_FDB_IO2_EGR_PORTS(leave_ports_mask);
+	if (!join_ports_mask) {
+		if (ctrl2 == val2)
+			return 0;
 
-		return yt921x_fdb_wait(priv, &val);
+		if (!(ctrl2 & YT921X_FDB_IO2_EGR_PORTS_M)) {
+			ctrl = YT921X_FDB_OP_OP_DEL | YT921X_FDB_OP_START;
+			res = yt921x_reg_write(priv, YT921X_FDB_OP, ctrl);
+			if (res)
+				return res;
+
+			return yt921x_fdb_wait(priv, &val);
+		}
 	}
 
-	res = yt921x_reg_read(priv, YT921X_FDB_OUT1, &ctrl1);
+	res = yt921x_reg_read(priv, YT921X_FDB_OUT1, &val1);
 	if (res)
 		return res;
 
+	ctrl1 = val1;
+	if (join_ports_mask) {
+		ctrl1 &= ~YT921X_FDB_IO1_STATUS_M;
+		ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
+		if (ctrl1 != val1)
+			ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
+	}
+	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(join_ports_mask);
+	if (ctrl1 == val1 && ctrl2 == val2)
+		return 0;
+
 	return yt921x_fdb_add_index_in12(priv, index, ctrl1, ctrl2);
 }
 
+static int
+yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
+		 u16 vid, u16 ports_mask)
+{
+	return yt921x_fdb_update(priv, addr, vid, ports_mask, 0);
+}
+
 static int
 yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 		u16 ports_mask)
 {
-	u16 index;
-	u32 ctrl1;
-	u32 ctrl2;
-	u32 val1;
-	u32 val2;
-	int res;
-
-	/* Check for presence */
-	res = yt921x_fdb_has(priv, addr, vid, &index);
-	if (res)
-		return res;
-	if (index >= YT921X_FDB_NUM)
-		return yt921x_fdb_add(priv, addr, vid, ports_mask);
-
-	/* Check if action required */
-	res = yt921x_reg_read(priv, YT921X_FDB_OUT1, &val1);
-	if (res)
-		return res;
-	res = yt921x_reg_read(priv, YT921X_FDB_OUT2, &val2);
-	if (res)
-		return res;
-
-	ctrl1 = val1 & ~YT921X_FDB_IO1_STATUS_M;
-	ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
-	ctrl2 = val2;
-	if (ctrl1 != val1)
-		ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
-	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(ports_mask);
-	if (ctrl1 == val1 && ctrl2 == val2)
-		return 0;
-
-	return yt921x_fdb_add_index_in12(priv, index, ctrl1, ctrl2);
+	return yt921x_fdb_update(priv, addr, vid, 0, ports_mask);
 }
 
 static int
@@ -877,10 +872,17 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
 			const unsigned char *addr, u16 vid, struct dsa_db db)
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	u32 bridge_ports_mask = 0;
+	struct net_device *bdev;
 	int res;
 
+	bdev = dsa_port_bridge_dev_get(dp);
+	if (bdev)
+		bridge_ports_mask = dsa_bridge_ports(ds, bdev);
+
 	mutex_lock(&priv->reg_lock);
-	res = yt921x_fdb_join(priv, addr, vid, BIT(port));
+	res = yt921x_fdb_update(priv, addr, vid, bridge_ports_mask, BIT(port));
 	mutex_unlock(&priv->reg_lock);
 
 	return res;
-- 
2.53.0


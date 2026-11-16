Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844931;
	b=bgqx+Pbpduvgah4lv4CWmDED6dgCWtEk3V25RLtzRHkvun5XRVeLct2FYBNICWjRnFDH
	 Ivk9FTT6734ZngEIF8bCZi18+x8G5OemNCKViQBTgUZEv1WLWXBunIjmmchprpCubb3th
	 TsovIkxNpu1ICHpGj5Q0qSgSe4DlouJez6iLmfkhzmUoRFarYHcacw8TdujQn7vuXmdeN
	 7hZS30cOKO5dD8dpNOvDktFRBz6pcj33A3DxX3ySVkXffMT1iWaAVLXGC2FJqUwb7sC69
	 zAoIuYDzSE8ucjWbhVoKmQNLlvRdHOijjFBnnZvOyfDRGitsW1GKWlylqDIHzYrUZOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sm0vVvLHd0OpDRWJIs5fCX46BAD95WHNvukOvzkZYMY=;
	b=JAJLKDsuwIriP+JqoSKwk2VmJdSIrXm6j8aFxIQQCMyPacy+u0q0HiUtG+FKc3t6HTnx
	 8aCUrIc0zQoXfrwfvZy//WyocBJsVeCTb68TuxMd2fSvRpW+0jGfW/3RZJLlZG3PAVvQd
	 9gA2WizWQnhGWDYzJ03QuZ+77xpWND2ZTIm8jyiCcDwi6cYARnlSctr7t6A/cxUplmAig
	 xV2q57fejgUjKQj/k/eGUtTBZii+kqIrMV3YTz9whgIYucLDVgRgBF8ad85vZZT2lobmI
	 bvLVHnTmRpXQc2VKMJ90wky4C7D1gG77In/RfSvv4lDgtKMibNvNngnXuOQRydgbsqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF8dNVbZ;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D3F606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D3F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF8dNVbZ
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2082141a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844930; x=1795449730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sm0vVvLHd0OpDRWJIs5fCX46BAD95WHNvukOvzkZYMY=;
        b=aF8dNVbZBaOOjoaPvSPobG4b4BOs9Dd1fJM2ZTKYdz7CW8HS7QDwfIRaitMH02T8jW
         30QP//r+jYZns7vWQ3VI5vENchh0bWgbfpqNSloJntgcW8N8ffHIHbnKw6SWS10oU4Dq
         VVuAPvF2SC7LnKKnaI5lP1gPxwhTTD8xsZsVt3UaLQzixvPq0Rv4sZbXRrKYP8YdM6kK
         7TdCppbMoQgVT8LER6UU55svB6g0hJt6JDf3c7WdCmA0i6b8NzdxPiaWb8U/hOoTHqBS
         IXmWXxPpWB39RFeZSro3rKCLIz8aj9yMoZZhmoh3oL+Ct6jOAE7XQOhqg4voKTGz2QVT
         oU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844930; x=1795449730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sm0vVvLHd0OpDRWJIs5fCX46BAD95WHNvukOvzkZYMY=;
        b=npTSdxchQ6LO0wJXyW+OxQj/C5MdDWvtMkNkqMbCw7q5KirZoHf3YyT+gT8CSsHSON
         LtPVo1jM9c26TCW9Xi6o9cGTAAA5ske68sozNTo4Qw+NwMsLb95oLghVnN2ESv8YDKdm
         epv00ROgJqaSuPAG1b0B/0dbhSZhmlIHqdNvn/XWGqnvUVACb/AzTLb6DfHS43TVwuem
         P5z2l1PJSi0OC+ti+48kk2zQ4qSf4cVr1xgRSbvBLWIx4M0p8b5mAaTrIrJ0+gx8+TaV
         SzMyqhXz8xABW0QfBbBUg9AfhFJ3NyAjag3eHGfxIdiIk7MKyCl94wNpPtNIbG7G/6y0
         k8mA==
X-Forwarded-Encrypted: i=1; AL+hErEnkL9Ek6PM9lTdVGk9Dtkzn3gHLtjQyEXfMyws3AYbHqE+NQ0mV9lgxdGFwBxOYIzBdZ/rsbPYcGo8d3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pJ9v368winUWEgxbrZwMBn95C2bER7oXcmvi/0a2kxLaJjSFB
	zDV/0ZEBaUSsGFjuOtEmBaaE2mYqFsgPYZHTVIXzpsVcdoMol6hNRvXG
X-Gm-Gg: AZFdTZe2FGkTK6rKy4d1JnY6+v4QDXyBR8HHC1QV5WY7Z/QUaMgEt8rE6U4W7toDihN
	/VUZC/gBYpcbgrORN93nE/8+lJQJWZhKlk78UXBf6uQaNs03g8QsjxQpBT1EjOqG2uJpZuDxlLo
	trekVjhBtJb3b4JQ9gIB5m98h5C3sN55lq+SSwO3qRNospN/lk+ElhSeFYNjFTpj1a60U7U+qf5
	oW4LYKpj9PwYFunGSf7hAK/QE9cTG1T64pk7kRN2Me1Or0XsTmbXfL2vWuBtHo4NmsDxWRjKgr7
	JoTL4vm0ypyLpBev6hPHKDRlwWmGf2XKjhB8sgpMHevlOcE2dI953M5em9MTh9xs4u2c3KcMFc2
	dszQVnV19goQbRElQFgSzrS4d9Hw0lRrkvMkOSgdBG0TOWbi8+XnxnAYh+Xyz11qqcutPF936b8
	TZg4/zoXGlaajFTn0QEzx1omSw/AxIGFsZWFyft7+HvOjvjCe0J/GRz7/QoQRG98rOsC+tIujdP
	kQ+gjCfCglIUZ68YxYrLo40nE0v+4tXQUrlAdBNngr2JmclSPVCeXI63aNK/PXyO6/6aa4PMWnQ
	ghtPL+t+179m3ollQjayYCSy4UjV81qf9jwnSmYqA7aQdwcUVDj5HVg=
X-Received: by 2002:a17:90b:1dc4:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3b1b0b5e500mr10824943a91.60.1794844930225;
        Mon, 16 Nov 2026 08:02:10 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:08 -0800 (PST)
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
Subject: [PATCH net v2 2/4] net: dsa: motorcomm: Rewrite FDB entry on port migration
Date: Tue, 17 Nov 2026 00:01:02 +0800
Message-ID: <20261116160107.1351198-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116160107.1351198-1-mmyangfl@gmail.com>
References: <20261116160107.1351198-1-mmyangfl@gmail.com>
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

Note the commit only correctly covers single bridge usage. Multiple
bridge scenario was broken before, but now breaks in a different way;
that should be addressed in a following commit.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 95 ++++++++++++++++----------------
 1 file changed, 48 insertions(+), 47 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index c6d0f000a163..863ebb6c3198 100644
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
+
+		if (!(ctrl2 & YT921X_FDB_IO2_EGR_PORTS_M)) {
+			ctrl = YT921X_FDB_OP_OP_DEL | YT921X_FDB_OP_START;
+			res = yt921x_reg_write(priv, YT921X_FDB_OP, ctrl);
+			if (res)
+				return res;
 
-		return yt921x_fdb_wait(priv, &val);
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
@@ -877,10 +872,16 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
 			const unsigned char *addr, u16 vid, struct dsa_db db)
 {
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	u32 bridge_ports_mask = 0;
 	int res;
 
+	if (db.type == DSA_DB_BRIDGE) {
+		bridge_ports_mask = dsa_bridge_ports(ds, db.bridge.dev);
+		bridge_ports_mask |= priv->cpu_ports_mask;
+	}
+
 	mutex_lock(&priv->reg_lock);
-	res = yt921x_fdb_join(priv, addr, vid, BIT(port));
+	res = yt921x_fdb_update(priv, addr, vid, bridge_ports_mask, BIT(port));
 	mutex_unlock(&priv->reg_lock);
 
 	return res;
-- 
2.53.0


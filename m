Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844938;
	b=B9L7KpDos4Iw3+t0Rl7oOs6qaS0vLYNKtG7sz24cZeZxauReKr+qUxouQo+aPqmbhFky
	 yZsTeLU8Kg8H7HQhDide7K2duRVvwKms94skKpfbQc0kabvxVsxoOhHIREtokEcHct0IT
	 5eSFXNbhsOiWoNdsLa8yCDe6Yv6HUefYHly9bSyhFjeaFHP2EajkaOZrUu6jdy568QED5
	 mdeMJKRcALr6R1MBCPczrd4mhi2Cx3WEUv8C+Y8Psuatl5MJqBoxx6NrM/iuALVZJvFzI
	 jMV89YdijIthFJwieD8FQ68FSGjlZxstqVAgd6BmWyzfAhqx9YqS7YKYpWglx9RfYxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OHV8Zx7ILfK0IPsePzy0Lo1KcvbIIMxS/KY1hpQjp18=;
	b=Bmf1Q9Gp0nLUii2Os7u0W9/M2S7j+ES6OTVxEH0Yfbc7mZkAcORtaZR0VoGMrezjpCtJ
	 /DQiCYwKlmkiDYpbClE4/kB0ttJUg9dvb91Omv0D2pi/WtwjypGXmtlmQCylpiQXuzPCN
	 coBPTFa58QyHB7MNnToC0p2O253KCYXZrBBnIJjvfHhnTBIp5gvFVkYLeSh+DbHYhzxh6
	 1VGTPUmoP8KofDS6Pu4fSAhcENgRe3Urj2XPqJznMoId6A+NoBKYKc66L86VpuSBuTyGy
	 xmr9JAZedtT5q1bXFA7tLxoJuiF5InjvYPHhzjjHk4wEMC8FpD/THfqWbQ+vuesJ5mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCMg0oFL;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E9606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B3E9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCMg0oFL
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3a6c5c81bso230613a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844937; x=1795449737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHV8Zx7ILfK0IPsePzy0Lo1KcvbIIMxS/KY1hpQjp18=;
        b=rCMg0oFLYD+Cb9s9qnzPYOipIruzESFhq/mI+AFSTaPwc2TY3yyTpxNHo9y0Mj2p5l
         woaxxw+l2ER8qbmCxQ16+0u4UWQHHFDhnTSIaaOtX/kFQDk40rtemWBH+tFd/ZD++9i2
         o6SpPiNgQPYFG6WuBZ4id0XSMF/2UArohjIcb8rjQYBmJtdx4erElZZhNItctvqQSZFI
         VMTwcD+erFGdErugmixg4SgUhV0bKLvhXiywfqUZZaXnnI5wLZt6/UVC8D8nUOLjeTdl
         nEvE1Ob98XvbPnSqX9F+yjKYR4nK5GUj4Xf0y8hbqr6t9XgohkU3wC/gFJfkOKwjxFYg
         t4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844937; x=1795449737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHV8Zx7ILfK0IPsePzy0Lo1KcvbIIMxS/KY1hpQjp18=;
        b=sfdkCVXu/4TQn07t0+B+1lcoiExKd6DNw3+Q8/F0amTn21Jvxttwz+GKSnAK4oQKpw
         HgvzBtJnfvv/ApQxUWGo62Syjm2Awdx+nHspSimocaS0dkTR3As8ag2NqGoqggGGEXP/
         niPc0Ohj4WKWQ+O+xcqo/V8n/CT0P2X0R+1e8E4nCIUSoEL/Zwjc9s8mTIFdeqiYgw/T
         eMEwByRyks3V4nmhZ8tOukJxrNZ+lTr23icJ1kaFhs4z/gtHk/Oc5wrZDfpiu7VZk3Xv
         KAcZ9GZT2x2zR8DD/PKTtdIOX4OJ3epLwlXRTg5i4gUU02niMvC4bPMC7jWD1hIFt2L8
         k6WA==
X-Forwarded-Encrypted: i=1; AL+hErGuSkFpFNtKqJKSRkX9xzeoUM08EpNl3qiZHaqAuskvQWFwL9oVT8NF3ePKw2vedKD19QBmGNlgguNssKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QuAFpVOkmCmWASxOFfHkJ36gAdzmKBB1s8Bznl7SMyYAIDv5k
	J0oOtN6JoFG2eQMVeCJDe/5caBYa6daBu1sg++G5AbXIPEX4IVKF0I+Z
X-Gm-Gg: AZFdTZd1C8OwtEO1X2JX+ZphhByIEG+aQbbs6HVr/26Y0VxzhmckbIZtBfQKbEb4zxN
	GyJQAlHtBrrI/5YhnYjPhanaer5fx5NeRxoFc7KsGPTi32Ks+ujR4FXdOJfYjtY/fvfWO2hDpvR
	fsr5liEMsmdLxLZkugR3xEjv4iGIsqVxMVN7bOgfpUOYg2mpf52kXjNHTlVb8KmY11EvvAStAh0
	/t2VxlnTZeUkkfbG91HOmybClc8dDDJgJJDB5xHnC/wviFX3vguoSrwysPJ9E78eyZeqLkU68Lu
	RQ3a8I/hDurbHiZkcuw2OcnI9yPn6H7IlHmMfU5PSVCr9Bz3nKHIcGQnexvBeKXMc/LpV7G7Ngv
	a99M7i/irapsem1ywu8dQUTdyPpaDf9mIyE05L7n28URci9srDeetHio3PYfLrlc8LB/2EL9/SL
	NERu0iSXj/xi+gm1RzJOFj5dhVb/XLWK2kQq2eOEyNsP3eYkKRiIaMhNUjRgeBgifqmlRCBK5IN
	fd2X6NMfC33vQ1WkrDe8kvDfoW3nQ1Cm97mcd6ZMVY6lBR8oY2ddNY+mkipqr+pLTV4wd7QXTNZ
	lbk/+hiQzlgBFAgbjcK24/3b7z+ZECc5BSgIJwr/rhmgXo0fs1M/Aw==
X-Received: by 2002:a17:90a:d010:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3b1b0a26a0emr10188177a91.27.1794844937249;
        Mon, 16 Nov 2026 08:02:17 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:16 -0800 (PST)
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
Subject: [PATCH net v2 4/4] net: dsa: motorcomm: Use VID 0 as the unaware PVID
Date: Tue, 17 Nov 2026 00:01:04 +0800
Message-ID: <20261116160107.1351198-5-mmyangfl@gmail.com>
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

The hardware classifies untagged and priority-tagged frames to the
port's PVID before the VLAN table lookup, and the FDB lookup key equals
the classified VID (measured on YT9215S).

The driver assigned PVID 4095 to the VLAN-unaware ports, while switchdev
reports the bridge's FDB entries with VID 0. These entries were then
installed under FID 0 and could never be hit by the hardware lookups.
Dynamic entries learnt under VID 4095, if any, took effect instead.

Lift the restriction on VLAN 0. Keep VLAN 0 out of the generic VLAN
add/delete paths, otherwise 8021q's automatic VLAN 0 filtering would
leave a stray CPU port bit behind.

Use VLAN 0 as the PVID of the VLAN-unaware ports. Program the PVID when
a port joins a VLAN-unaware bridge since DSA does not necessarily call
.port_vlan_filtering().

The standalone default of 4095 stays, so mislearnt entries, if any,
would not pollute the bridge FDB.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 44 +++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d84d863080ce..aa4d6a0c930c 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -79,7 +79,7 @@ static const struct yt921x_info yt921x_infos[] = {
 	{}
 };
 
-#define YT921X_VID_UNWARE	4095
+#define YT921X_VID_STANDALONE	4095
 
 struct yt921x_reg_mdio {
 	struct mii_bus *bus;
@@ -960,8 +960,10 @@ yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
 
 	brport = dsa_port_to_bridge_port(dp);
 
-	if (!brport || !vlan_filtering)
-		pvid = YT921X_VID_UNWARE;
+	if (!brport)
+		pvid = YT921X_VID_STANDALONE;
+	else if (!vlan_filtering)
+		pvid = 0;
 	else
 		br_vlan_get_pvid(brport, &pvid);
 	res = yt921x_port_set_pvid(priv, port, pvid);
@@ -1029,8 +1031,7 @@ yt921x_pvid_clear(struct yt921x_priv *priv, int port)
 
 	vlan_filtering = dsa_port_is_vlan_filtering(dp);
 
-	res = yt921x_port_set_pvid(priv, port,
-				   vlan_filtering ? 0 : YT921X_VID_UNWARE);
+	res = yt921x_port_set_pvid(priv, port, 0);
 	if (res)
 		return res;
 
@@ -1098,6 +1099,8 @@ yt921x_dsa_port_vlan_del(struct dsa_switch *ds, int port,
 
 	if (dsa_is_cpu_port(ds, port))
 		return 0;
+	if (!vid)
+		return 0;
 
 	mutex_lock(&priv->reg_lock);
 	do {
@@ -1135,6 +1138,11 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 	 */
 	if (dsa_is_cpu_port(ds, port))
 		return 0;
+	/* VID 0 is the VLAN-unaware bridges' FDB domain; nothing to program,
+	 * keep the entry at reset defaults
+	 */
+	if (!vid)
+		return 0;
 
 	mutex_lock(&priv->reg_lock);
 	do {
@@ -1187,7 +1195,7 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	/* Unrelated since learning is off and all packets are trapped;
 	 * set it anyway
 	 */
-	res = yt921x_port_set_pvid(priv, port, YT921X_VID_UNWARE);
+	res = yt921x_port_set_pvid(priv, port, YT921X_VID_STANDALONE);
 	if (res)
 		return res;
 
@@ -1285,7 +1293,8 @@ static int yt921x_bridge_leave(struct yt921x_priv *priv, int port)
 }
 
 static int
-yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask)
+yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask,
+		   bool vlan_filtering)
 {
 	int res;
 
@@ -1297,6 +1306,14 @@ yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask)
 	if (res)
 		return res;
 
+	if (!vlan_filtering) {
+		/* DSA may shortcut .port_vlan_filtering(), leaving stale PVID
+		 */
+		res = yt921x_port_set_pvid(priv, port, 0);
+		if (res)
+			return res;
+	}
+
 	return 0;
 }
 
@@ -1427,7 +1444,8 @@ yt921x_dsa_port_bridge_join(struct dsa_switch *ds, int port,
 	mutex_lock(&priv->reg_lock);
 	pp->isolated = br_port_flag_is_set(brport_dev, BR_ISOLATED);
 	pp->hairpin = br_port_flag_is_set(brport_dev, BR_HAIRPIN_MODE);
-	res = yt921x_bridge_join(priv, port, ports_mask);
+	res = yt921x_bridge_join(priv, port, ports_mask,
+				 br_vlan_enabled(bridge.dev));
 	mutex_unlock(&priv->reg_lock);
 
 	return res;
@@ -2277,7 +2295,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 {
 	struct dsa_switch *ds = &priv->ds;
 	unsigned long cpu_ports_mask;
-	u32 ctrls[2];
 	u32 ctrl;
 	int port;
 	int res;
@@ -2335,15 +2352,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	/* Tagged VID 0 should be treated as untagged, which confuses the
-	 * hardware a lot
-	 */
-	ctrls[0] = YT921X_VLAN_CTRLa_LEARN_DIS | YT921X_VLAN_CTRLa_PORTS_M;
-	ctrls[1] = 0;
-	res = yt921x_reg64_write(priv, YT921X_VLANn_CTRL(0), ctrls);
-	if (res)
-		return res;
-
 	return 0;
 }
 
-- 
2.53.0


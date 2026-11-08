Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174318;
	b=TR+N6nAuwf5GAPSZ5A+8Rrydo+C70gNdnvVNu4W08t2fPivxFfUFgBZgWm8BwTb0pcfP
	 NSBSTWIQ6kKgRPABH1pwZzVqSPvRKKTbHHcZGFWl4BtuhZI9AYvwojeYDSnW8MKifK+pk
	 pwCgyqj/bimRvgXjmFXO/UldcqqxRNFVALyZ7gHvCq0S5TTnPIDBfAvdFfJbEmBpWvjS1
	 m2FdmxjXvng3aXVxpcya5BH+CGnySxhz1iLAjL/LV5kSlsY0DGyTiAksrT2HWC7sag1hm
	 6EEuHKLpQPfszmSAGewieMPv4GEHf84swQydKGBSZmmu38SfoAhwD7BHDUnw0QZRZ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JbZ6+DyycjbPuDbJzaygdIrYKEd+hBunbN6mQjd7eLk=;
	b=bqfdRPq+k899FtRZzA6B8rmgAd0CnGIbsZZjQxHnyjH5b0qzbl99G1ETZpQbY8fY2KrS
	 cA7yYgIXZDjPoQKyKCl2rEdGoAfOdZSfbIbSe5Gj8gff663V8skc7EEBqeIWpa/CuSpoV
	 yaKGhWzMMeYdb4htlMjFcX8dm8T3JZ0oaVbjrgVa8XMwxqxDZ2wXj3MwIPj04Xy+6UQDd
	 qaaijo4MWxISPl+z9wlr2dV0C5YC/VsIMZ5il0PUI9AWXw4ANZPVF7KdtN/aGY9oyYVFx
	 jBT+IriHRIpIHbs540DrFyV570a9TA+3q/kNLx6bYI+3dHOI/F+sURDq8yjKszApU9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2Bbmbtv;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30B4606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30B4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2Bbmbtv
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so123739a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174317; x=1794779117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbZ6+DyycjbPuDbJzaygdIrYKEd+hBunbN6mQjd7eLk=;
        b=y2Bbmbtvaew/ZIdq9cDw24k24iIVWG3hnhzWIY99yvqojwerluYunKfTefO18Knauh
         JB4BMHHMbRjIy4zYPRN4HH9HIlxSwny9MpGKwpRSFMPQkqq2XjY6oaKwvEbp1GE/rBeH
         HDR+UhqnpuHAQc/Jah9FyQ8pvSPKsqCZrZkJv/ehBeXnPCWfQdBn1pRs8yTr/BQMqidA
         i9LDdlkn/UXOG+DiK39jcpDsqgTapCaObpqMsUDL0a5GX3bDC9HloFxRBxBTHPaGvd+U
         EXalVfQg1SHOVcpzICmyaHLDkJ+vfwTlQr1oviLej1s+hqscgoecltdWsi5qGcecCK6C
         ASTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174317; x=1794779117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbZ6+DyycjbPuDbJzaygdIrYKEd+hBunbN6mQjd7eLk=;
        b=ZQp/9mUftUbb5A/6XT8eGx2mbKm/ah2FKGc6bx3j57klFtqqSJmjBAoPjBg/jLZPKo
         xb7mJOsrO+syNmUf8tDkXO7PWEPVoOn5lECupmSFSnzqzozDJD6tQUCqq4i2ucci6J7Y
         20mwJgYhAPZHmCVasPKbR+ogyVkhlRt5fA48hpZeDUY/EV3joWPFLQuIW2tLAEg3HzLu
         x37HB1cDIITCJRl0soXODwLVyXf7gpjQUIcZxRGV+MzA4MXKgqebE0XZKVuxMBuxcwX5
         7Sx0BKlo02vEzUQ13lar/X/lDNrENe0rIOVRAVrlal9a0jEdP7wD1ZRCa3N9hV66y9RE
         6v0w==
X-Forwarded-Encrypted: i=1; AL+hErGiyeA1X7FPt18ciQyRZ5FCx3CZjYEa/yq1AOPx70FIRbMRoeAX52pchN3GntGIffH8cJ3cJPkPGwJ0oOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PTlmaFGIN8mAeu464UVsNM57uLo9PKcZSulvdIl1rd1fW5iyw
	iYD0jXGJ5AWQIW5EfDVmHEUQHxJDYU30Se1/oXv7/RoyFDPjk8MYuau0
X-Gm-Gg: AYBFou1FhBU26LWk/b/rlW4YdyZUwf8Xjfw/Ldj4DDpjZnghFbE1I28IS6wCqiw6FRc
	3UzRfO0gf1ckE0oSQKt7560W5pjz9vgE3nVWPSWFlOXAwa1df3WTZBcQsVz5nz+DdX7935szQOB
	rmaO3uPsT3wXTM/3T1ocVh8eUERNuqB3fdyqurW2ZsK0d+DGoZxNcR4yh9Y6OxqBVzEe6dcBm1k
	i0QoRRf9pp8xeXyOXtaEudbYRRU1S0gNYGr+SulOmMKK9j1JJXV+6aQ8SDHGEnHT4pjUlyfuSh4
	gDMY4+vtHyDL5c/Bf+eQkNbhhcElgJ4rxcvzjxByDWF4Vn0/is9JU0fHS8F10iYK+c+Cn1UK2Qg
	J0WUq6p5QcbsWB4FZsJigpe+IBEv1Z/c8ZdGos7HnexZN7YsYxndZ6Fg1oGLgm6BrmgCg189NAB
	l8/YO0vv1nAy4NqMdL06E7Vi9PR7xK2cCafgA6qr5GKeHXMrqMyT180nBY9z9PeyJglvGVyJfpc
	PTgRN9FaeTWfaC+SucP+zjrx2042TO4giAShNngR1ETRr6MCn1SzJ4DFCS5K1q36D5NHwIdE/kv
	VLDxwhCwpSRRBmXuJK1fICo88qoz0xnmkkR9ZR+a0N4pWSx4I/4wzw==
X-Received: by 2002:a17:90b:288a:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b12d0e7384mr1887659a91.6.1794174316858;
        Sun, 08 Nov 2026 13:45:16 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm4619463a91.4.2026.11.08.13.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:45:16 -0800 (PST)
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
Subject: [PATCH net-next v5 3/7] net: dsa: motorcomm: Remove local cpu_ports_mask
Date: Mon,  9 Nov 2026 05:44:43 +0800
Message-ID: <20261108214450.1662362-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108214450.1662362-1-mmyangfl@gmail.com>
References: <20261108214450.1662362-1-mmyangfl@gmail.com>
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

Use dsa_cpu_ports() or dsa_is_cpu_port() instead for a clearer view of
code.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 18 +++++++++---------
 drivers/net/dsa/motorcomm/chip.h |  2 --
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 47f06945b8c4..7686995b803f 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1003,7 +1003,7 @@ yt921x_vlan_add(struct yt921x_priv *priv, int port, u16 vid, bool untagged)
 	u32 ctrls[2];
 
 	masks[0] = YT921X_VLAN_CTRLa_PORTn(port) |
-		   YT921X_VLAN_CTRLa_PORTS(priv->cpu_ports_mask);
+		   YT921X_VLAN_CTRLa_PORTS(dsa_cpu_ports(&priv->ds));
 	ctrls[0] = masks[0];
 
 	masks[1] = YT921X_VLAN_CTRLb_UNTAG_PORTn(port);
@@ -1158,11 +1158,12 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 
 static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 {
+	struct dsa_switch *ds = &priv->ds;
 	u32 mask;
 	u32 ctrl;
 	int res;
 
-	ctrl = ~priv->cpu_ports_mask;
+	ctrl = ~dsa_cpu_ports(ds);
 	res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port), ctrl);
 	if (res)
 		return res;
@@ -1208,7 +1209,7 @@ static int yt921x_isolate(struct yt921x_priv *priv, int port)
 
 	mask = BIT(port);
 	for (int i = 0; i < YT921X_PORT_NUM; i++) {
-		if ((BIT(i) & priv->cpu_ports_mask) || i == port)
+		if (dsa_is_cpu_port(&priv->ds, i) || i == port)
 			continue;
 
 		res = yt921x_reg_set_bits(priv, YT921X_PORTn_ISOLATION(i),
@@ -1225,7 +1226,7 @@ static int yt921x_isolate(struct yt921x_priv *priv, int port)
  */
 static int yt921x_bridge(struct yt921x_priv *priv, u16 ports_mask)
 {
-	unsigned long targets_mask = ports_mask & ~priv->cpu_ports_mask;
+	unsigned long targets_mask = ports_mask & ~dsa_cpu_ports(&priv->ds);
 	u32 isolated_mask;
 	u32 ctrl;
 	int port;
@@ -1338,7 +1339,7 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
 			u32 ports_mask;
 
 			ports_mask = dsa_bridge_ports(ds, bdev);
-			ports_mask |= priv->cpu_ports_mask;
+			ports_mask |= dsa_cpu_ports(ds);
 			res = yt921x_bridge(priv, ports_mask);
 			if (res)
 				return res;
@@ -1410,7 +1411,7 @@ yt921x_dsa_port_bridge_join(struct dsa_switch *ds, int port,
 		return 0;
 
 	ports_mask = dsa_bridge_ports(ds, bridge.dev);
-	ports_mask |= priv->cpu_ports_mask;
+	ports_mask |= dsa_cpu_ports(ds);
 
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_bridge_join(priv, port, ports_mask);
@@ -2268,10 +2269,10 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	int res;
 
 	/* Enable DSA */
-	priv->cpu_ports_mask = dsa_cpu_ports(ds);
+	cpu_ports_mask = dsa_cpu_ports(ds);
 
 	ctrl = YT921X_EXT_CPU_PORT_TAG_EN | YT921X_EXT_CPU_PORT_PORT_EN |
-	       YT921X_EXT_CPU_PORT_PORT(__ffs(priv->cpu_ports_mask));
+	       YT921X_EXT_CPU_PORT_PORT(__ffs(cpu_ports_mask));
 	res = yt921x_reg_write(priv, YT921X_EXT_CPU_PORT, ctrl);
 	if (res)
 		return res;
@@ -2308,7 +2309,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	/* Except for CPU ports, if any packets are sent via CPU ports without
 	 * tag, they should be dropped.
 	 */
-	cpu_ports_mask = priv->cpu_ports_mask;
 	for_each_set_bit(port, &cpu_ports_mask, YT921X_PORT_NUM) {
 		ctrl &= ~YT921X_ACT_UNK_ACTn_M(port);
 		ctrl |= YT921X_ACT_UNK_ACTn_DROP(port);
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index d9425afc7bce..ab6f28d057cb 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -509,8 +509,6 @@ struct yt921x_priv {
 	const struct yt921x_info *info;
 	unsigned int meter_slot_ns;
 	unsigned int port_shape_slot_ns;
-	/* cache of dsa_cpu_ports(ds) */
-	u16 cpu_ports_mask;
 	unsigned char cycle_ns;
 
 	/* protect the access to the switch registers */
-- 
2.53.0


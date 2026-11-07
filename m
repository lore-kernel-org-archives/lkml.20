Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053845;
	b=ealcqs6Ne1HisnS/1i/uN8Nea2A2wUy2Cs3o9x/4+5MXyhTFNI7Xy9G/JLc6T+Y0h79h
	 7p5ftJNN9UX911kr1gouFjNrdwMiKAVuUpS/mo3thXa3VD8J0Ye95T55YnrveguSPjZ3m
	 2y8pTS0j/Ma34g3VN1n8kv+H2y2NVnx0puwzZkPip86F2z9BZyOZ/wrd8QLmNejj7rQqK
	 7NXXX5tQnMz6bVB88ZOGJFROEtkzeLrbmigpf7hG+HVSsvgHI5dePZ1rsfldwfuq92iPr
	 xAbME8bu4wb89E4k2UZUAlBS9uWfWgFb+EmmHox6AyWJUxgseiIrVtKUY9Q/RMGaANA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lh4p54ENGltKCdS7NjGeds5Ujsc0z1KtVefTgWHitfM=;
	b=5nE2jxOsL3Crm67QaEWKhhUwZFZ+S9XdJLGYs+VZMSZeHuXLpIChRpRMp1iCxaXnLTIJ
	 U4/K5kS490dl6Ty+50WP+fot5natyQK+pHj3ebTqLNhVIPAkwXsdK7YHbDJOxzjT1gXIQ
	 OqweV3vIWVC8aSzc1glyRpWmUiTMQQFU6MsdSuvo/X35SIecMc44gxvR+9NjKhyRU5Kel
	 d+nF62kdPgICtfeT6hBJ9iLAfo2OBJElir0gplqgI/ru2Ux0Y4obOvPG8AQihto2aGjBE
	 iCZlwrXZLP9M5Ef4XdZd5AayjzIMT8vd32f21z85TM9kTfDnpsMEbxnVh1jbCJnDwFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQ+Gvoyi;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6679B606A339
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6679B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQ+Gvoyi
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed06b725fdso2907405ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053845; x=1794658645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lh4p54ENGltKCdS7NjGeds5Ujsc0z1KtVefTgWHitfM=;
        b=FQ+GvoyibS7bsQ4T+tZjXoPsQ31uzSKWfBCxPEM//YhLm8dggpzLNFxFMwVDUzdaeu
         gt29EU7c5R4RMWQJ/Bo/QR6bzOoVT0VN6n6EB9iPw1pXAJ0IaNELkEKMCdQbdzTsptVw
         VfAW3EPHaVvrnGVKHqVAgRzAw/DwwydX7x8oF0lV/gp/5QQoWnEdmFBP5767Mmdeuw1N
         J9VD0ZnC6jB/pQ0Kkj1FXPyEUcFdJq5NnE+aGI4Nv1qIdrdo0FhTIqVEZqjKZEiqkstF
         drJ6XQqYgwVVOv+jRZpymPNxMwXQtFHuXLc+NLqn8ph0YpXzpYN97g7/AmnbUzUaqEKl
         VOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053845; x=1794658645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lh4p54ENGltKCdS7NjGeds5Ujsc0z1KtVefTgWHitfM=;
        b=Yqf+kQuFymGejHIi6Xa4klMWr1LhpSjL195ZNoLpKiMmNeA0ijrwIb7AxqaKFnZyoU
         R+QGCvUSM9PZRBoxEA2Df+4JDWu3Z0yud0RzKXNoFrMAtNcEczSruOzsKj7P2B9aKbbp
         RgcWnJzb+/ZN/PX7Y5ajtHVMQuZv/b3UwC4tjy4Zy4t5aZSp6G6bAQ+WA5LQjeew+3H3
         jGaM38l7WqwwCfNQo1qK+35GtD3nTbwa2ZaJdv+4ju8LTDGFKY3V+f8si95uAeVVuXEX
         L3kaufmzF71fL3MmmrcsEYCkGzd/VpOYJ4fh5xuykQh9qreOM47yXg0JJgQmVFZogYH7
         pRxw==
X-Forwarded-Encrypted: i=1; AL+hErFe5jlRDojM1DcKZZC1gE1lQE6zy7oE2kRhHSU/+ttBQZEehPt9SACOlKYr2+TnfSXbdUrll0r79lyZQrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QHErio9U5/T/42bR8pXArGB2WWZMYg5XguTAYl0hhahk0BCja
	EhmAGUxJ9/2NQG1PtkAi+bj0P46Vu4w4lpqNiVbv6YvKYXYxWLcTnMPj
X-Gm-Gg: AYBFou1znSkgcvNFUxKTKXhyncvulQNKueaw8uFCZ7MQ/jPv5dXGdyZPZ/wfzgWRZlG
	5yB7KHy5BK3rOu2b/D9vCCuL1+3SV2xkG9BZv5vFOdhvu3g9TE+7ptD/0DYwypjWhYmABSnRQ/o
	8ZpEPE+RnAmjBPlCcvQ9gosdYDptEWJWAGqJ6r0cOpjjcF/ecs755ygfsE62K9NF4WCdtnmR4cQ
	63xhqiY5cKuaRH6dmakgsF/GvixZiZVM2W8iEWtJ8LsKlynPWGHBSrt7w6X2IiGNB3YwgKkK/fx
	q4PTuMtF/kzDZeNLghdCtvE35V7zjKhVw7s2VWtFiKHR3AvGbtlUbvjZMXIk8Z3xWe7J3SIynSE
	eKCG5GPz4tKCGcdtYDunQcS3l/4lJumiS6I3Iy7MRVPPx0q6Hxn9xALo+YpMQrL/3t9FJACnAB1
	I3MdwmIJhgh/CwtqrGs9BYmlUSGCpy0jQtFBmAu3YNsTgO1g1DKOskNMNgdch59Sg5UytOKJE7J
	XGeg3klZ6MdhpdJQDXYdLSs1JVOkhrsPU0NrPprqCUIw0+QN2/8JTey+ia7Q6Gq7QyymV1+Ying
	uZ27TpQ++/TjQm3bJQ9XLIFNt6yowkvSQG/tkWOSbqD4nE3mbHdKAw==
X-Received: by 2002:a17:903:19cd:b0:2dd:c053:b9cb with SMTP id d9443c01a7336-2ed67be851amr13551035ad.28.1794053844705;
        Sat, 07 Nov 2026 04:17:24 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:24 -0800 (PST)
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
Subject: [PATCH net-next v4 4/8] net: dsa: motorcomm: Remove local cpu_ports_mask
Date: Sat,  7 Nov 2026 20:16:25 +0800
Message-ID: <20261107121631.1040612-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107121631.1040612-1-mmyangfl@gmail.com>
References: <20261107121631.1040612-1-mmyangfl@gmail.com>
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
index c51491ef4dae..8ab499611fbf 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1003,7 +1003,7 @@ yt921x_vlan_add(struct yt921x_priv *priv, int port, u16 vid, bool untagged)
 	u32 ctrls[2];
 
 	masks[0] = YT921X_VLAN_CTRLa_PORTn(port) |
-		   YT921X_VLAN_CTRLa_PORTS(priv->cpu_ports_mask);
+		   YT921X_VLAN_CTRLa_PORTS(dsa_cpu_ports(&priv->ds));
 	ctrls[0] = masks[0];
 
 	masks[1] = YT921X_VLAN_CTRLb_UNTAG_PORTn(port);
@@ -1159,6 +1159,7 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 {
 	struct yt921x_port *pp = &priv->ports[port];
+	struct dsa_switch *ds = &priv->ds;
 	u32 mask;
 	u32 ctrl;
 	int res;
@@ -1169,7 +1170,7 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	pp->hairpin = false;
 	pp->isolated = false;
 
-	ctrl = ~priv->cpu_ports_mask;
+	ctrl = ~dsa_cpu_ports(ds);
 	res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port), ctrl);
 	if (res)
 		return res;
@@ -1215,7 +1216,7 @@ static int yt921x_isolate(struct yt921x_priv *priv, int port)
 
 	mask = BIT(port);
 	for (int i = 0; i < YT921X_PORT_NUM; i++) {
-		if ((BIT(i) & priv->cpu_ports_mask) || i == port)
+		if (dsa_is_cpu_port(&priv->ds, port) || i == port)
 			continue;
 
 		res = yt921x_reg_set_bits(priv, YT921X_PORTn_ISOLATION(i),
@@ -1232,7 +1233,7 @@ static int yt921x_isolate(struct yt921x_priv *priv, int port)
  */
 static int yt921x_bridge(struct yt921x_priv *priv, u16 ports_mask)
 {
-	unsigned long targets_mask = ports_mask & ~priv->cpu_ports_mask;
+	unsigned long targets_mask = ports_mask & dsa_cpu_ports(&priv->ds);
 	u32 isolated_mask;
 	u32 ctrl;
 	int port;
@@ -1345,7 +1346,7 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
 			u32 ports_mask;
 
 			ports_mask = dsa_bridge_ports(ds, bdev);
-			ports_mask |= priv->cpu_ports_mask;
+			ports_mask |= dsa_cpu_ports(ds);
 			res = yt921x_bridge(priv, ports_mask);
 			if (res)
 				return res;
@@ -1417,7 +1418,7 @@ yt921x_dsa_port_bridge_join(struct dsa_switch *ds, int port,
 		return 0;
 
 	ports_mask = dsa_bridge_ports(ds, bridge.dev);
-	ports_mask |= priv->cpu_ports_mask;
+	ports_mask |= dsa_cpu_ports(ds);
 
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_bridge_join(priv, port, ports_mask);
@@ -2275,10 +2276,10 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
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
@@ -2315,7 +2316,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714488;
	b=KmvdpqyJoZXH0UgPMO+XbWEZKyecsEdvMptdsL+kfqQJRfqriLA9kk9PZSX7ciYEWjTh
	 ijW59TiGuwMawsNxd/iC3D4I3aIZO9D8hrQFW+9N/Z1xpVz5oxGteguiTE9btiy5z2SU7
	 HgRbFfWAswHu0UiTUYWyRzDbRQdWKtmlZwVlWyDWleGioL5bsEDC6Ysyvs2vZDYHvmnQ8
	 a9lH0Sv5TpNF4l3qNcRwfiiE1ADAhc80pJUfQTdZ0ifGpjY/cPtQ68DuY/v/wVwC4bgY0
	 Sp3lHyx/My8YWqThGRc+f4dZqL9I9RKbLavHpWtiDySIG8Re1YyFJzV2mSQO4KkrdbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4eUqzqxgaskgzb2volApOaC2VlmYkG23yLlDeBP9Vhg=;
	b=ox333ZZ1xllGzBJ6s5g2Zu7NFCf6vML77/LTwbJ+DL99qFqW6OxzdB5i3kwrT8CcLcvQ
	 65KVVac1U3mN6yulZCyCwEHo6oDUd5BfaqSlTrHXsV/pAJ+SRKjQWaBCHhvDgXFCxcq0w
	 Y02u/wPwKFCsvvaUULHzm0AiASUHQ27U8mTMeHkGj3o3jhO/y6BhjNjyfIiSKrbRDA3L5
	 53BN+xTz/udlq7mTctstzVwsX8/hIFRsCL3LebXCG7W4qkFalwAdca5j1/2nYssErUxEg
	 xSZoymh2ESgYPPMjjpTmo5Ys9rQBho+mwfCjMCXVzXir7+VfBkS7Kee3BEOP4zVzD5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIWa5lHG;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B066082BE5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B066082BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIWa5lHG
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1755239a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714488; x=1794319288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4eUqzqxgaskgzb2volApOaC2VlmYkG23yLlDeBP9Vhg=;
        b=eIWa5lHGv+0wU7rKPq5o27+YSznAidM1p/G+zk90vb3L7OPPb0288yfk9XqmSefxb5
         YKKXh8sjT3Dndbb3IlWBDliODfhz5of+uzkJ2wBnZ6AHna5s6FTFvStIwH6eMYIiR5sx
         W3MK21SLy061IyWhlwzq0ouGHtssojQIE4P2wbKTEonSw1WG5K7TatGay+gj+AibcyUm
         RYnIVxvj8VcReq9k2vD67k2exBdkrRR3YafaYvG2fi++3hp6UBqTawc6YbcPCWmLa7Qy
         s2JW7e776wTlVVTrq2q6+6YQYKxzpbnVLRM6xOOFZwQWqe6mnZ2DGU7664TtUdoRx/1k
         l1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714488; x=1794319288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4eUqzqxgaskgzb2volApOaC2VlmYkG23yLlDeBP9Vhg=;
        b=STQG+txV//M/tLK8SfxcWy/JqRSo/Cvmbg33DAL7mTmUI1NTW7G9JrKmQF7GfiE2p8
         G4+ByZAC2pxj+ppH/+e1Hb4UdsmQEAghNLgLQSY14ucXJ4fQJKhzPyHs5+n/oh/9bsly
         yZJxuaqS2fS0ewoHHHF5UO6kV1giug1HMpHpyPccCpFlXlIGcGrI7KsoKvtX6JtNTmaI
         c67m62ioYuZa4pMH9ACyw1Ivde54bgioNuqupvdvcvM32I6vYUzTRE7sB5BRns1QlaHW
         8qlXApSSdT6eqFThBx8HtNbXA3OB2NMwZmorNv9vvSHKzxEC+laDNW8vthI/35Be/aQs
         MRvw==
X-Forwarded-Encrypted: i=1; AKwUvBx1wg7ysL0QlpcJLX5Jq2Lb8Eq78ECpBKEYjpeHc8A3Gdzo2Rh/C5khA5FG11rHb05I3uIMBqsHJ7c1khQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z68DIrIQx/IAFyX5fzCW34kVFWKjFefYz+bJt8DZjbnPbOCjA
	kCYPdn5iL31/kYV/bVaBx0iOKakwF72Um0855T6rC+Uot9jwANL3edJE
X-Gm-Gg: AYBFou1ofp8DRW+zgcyS1AcJpMrnHvOzjSRF7s2e20oeMdX6msXdCbyDKEZZoDb9UfV
	UQiNgTvz4bUhe9NuvaOS67+ErCYn/A/fONbHnWHXvkA5kNx5+KRTj9c8Nv+tdsRCXmwgL15Xvs6
	9nfwJrtWhbSlH7YJq05O2rt3Ru3qiLAkFnSu/+4aQ1hXElv5R0HwQ7QAiaB8ishmz+R0YuvnwKx
	LX7Dvph+/oUu+Iz7Z0EIdlFWaEBApdOSDS/HHY79nWTErYPZAln0Bgspc6CsoO6pbPKN24WqwMs
	BussipWKcDCjrVJc4Eus4eLe1RUDJM9YvTSR3loJ7esa9kkrAhqyBR6zXJJusXRyqhnevxUVaum
	/CTSKonqeNl8UnJWiPnf5+H+/ge3h4xtDy1IRRnVlSyLaWIlEIKqeYKTnMxF2B3XkoU3INSGf4R
	7Nr1ry+i4vFmchZEo6DDPx4SHOdD7aMu5fwifOdrW/m41IxBSxsMGFY6/9A1kEx73CeKrvo3zhi
	GNnTtI63HAmbaucs+Li3TxffiAJxB7vnMhYhW/wsa9p7aJlLlFpVWmOlK1YXxcMiW6gtdzs4c+7
	HERE3Vdr5ON2sXVSZ57ubB2g6t/r6OG4TD9Se03DLApcqVnwIfWP
X-Received: by 2002:a17:90b:2c0e:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3ae897f619fmr7495122a91.25.1793714487557;
        Tue, 03 Nov 2026 06:01:27 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm4722104a91.7.2026.11.03.06.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:27 -0800 (PST)
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
Subject: [PATCH net-next v3 2/3] net: dsa: motorcomm: Rely on port isolation for CPU port
Date: Tue,  3 Nov 2026 22:01:06 +0800
Message-ID: <20261103140109.874443-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103140109.874443-1-mmyangfl@gmail.com>
References: <20261103140109.874443-1-mmyangfl@gmail.com>
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

With every port fully isolated during chip setup, the CPU port already
gets its one-way isolation (drop all packets without tag) there, so the
dedicated handling in port_setup() is redundant. Skip the isolation
write for CPU ports in yt921x_userport_standalone(), which port_setup()
also runs for CPU ports, to keep it intact.

Consequently the CPU ports no longer need to be excluded from the
unknown unicast filtering: frames entering a CPU port without a tag are
now dropped by the port isolation instead of the ACT_UNK action.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 46 ++++++--------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index e1fa82c6db95..fb993cc9607c 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1164,10 +1164,13 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	u32 ctrl;
 	int res;
 
-	ctrl = ~priv->cpu_ports_mask;
-	res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port), ctrl);
-	if (res)
-		return res;
+	if (!(BIT(port) & priv->cpu_ports_mask)) {
+		ctrl = ~priv->cpu_ports_mask;
+		res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port),
+				       ctrl);
+		if (res)
+			return res;
+	}
 
 	/* Turn off FDB learning to prevent FDB pollution */
 	mask = YT921X_PORT_LEARN_DIS;
@@ -1942,8 +1945,6 @@ yt921x_dsa_phylink_get_caps(struct dsa_switch *ds, int port,
 
 static int yt921x_port_setup(struct yt921x_priv *priv, int port)
 {
-	struct dsa_switch *ds = &priv->ds;
-	u32 ctrl;
 	int res;
 
 	res = yt921x_userport_standalone(priv, port);
@@ -1957,27 +1958,6 @@ static int yt921x_port_setup(struct yt921x_priv *priv, int port)
 	if (res)
 		return res;
 
-	if (dsa_is_cpu_port(ds, port)) {
-		/* Egress of CPU port is supposed to be completely controlled
-		 * via tagging, so set to oneway isolated (drop all packets
-		 * without tag).
-		 */
-		ctrl = ~(u32)0;
-		res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port),
-				       ctrl);
-		if (res)
-			return res;
-
-		/* To simplify FDB "isolation" simulation, we also disable
-		 * learning on the CPU port, and let software identify packets
-		 * towarding CPU (either trapped or a static FDB entry is
-		 * matched, no matter which bridge that entry is for), which is
-		 * already done by yt921x_userport_standalone(). As a result,
-		 * VLAN-awareness becomes unrelated on the CPU port (set to
-		 * VLAN-unaware by the way).
-		 */
-	}
-
 	return 0;
 }
 
@@ -2276,10 +2256,8 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 {
 	struct dsa_switch *ds = &priv->ds;
-	unsigned long cpu_ports_mask;
 	u32 ctrls[2];
 	u32 ctrl;
-	int port;
 	int res;
 
 	/* Enable DSA */
@@ -2297,7 +2275,7 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	ctrl = GENMASK(10, 0);
+	ctrl = GENMASK(10, 0) & ~priv->cpu_ports_mask;
 	res = yt921x_reg_write(priv, YT921X_FILTER_UNK_UCAST, ctrl);
 	if (res)
 		return res;
@@ -2320,14 +2298,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	ctrl = 0;
 	for (int i = 0; i < YT921X_PORT_NUM; i++)
 		ctrl |= YT921X_ACT_UNK_ACTn_TRAP(i);
-	/* Except for CPU ports, if any packets are sent via CPU ports without
-	 * tag, they should be dropped.
-	 */
-	cpu_ports_mask = priv->cpu_ports_mask;
-	for_each_set_bit(port, &cpu_ports_mask, YT921X_PORT_NUM) {
-		ctrl &= ~YT921X_ACT_UNK_ACTn_M(port);
-		ctrl |= YT921X_ACT_UNK_ACTn_DROP(port);
-	}
 	res = yt921x_reg_write(priv, YT921X_ACT_UNK_UCAST, ctrl);
 	if (res)
 		return res;
-- 
2.53.0


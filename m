Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053853;
	b=q0cbfXS9GYEdid9JqJLyPqjTepBNk5qDMVLNj2QZYFLcNa+UGGzv8M5r7w58yugFZ7CP
	 wBz29cznyjFmf6JYbfFsD86NbccpL9KPaadmI5lt+cpdEXtYrSZqACGKad8ORHyfKQohA
	 240A4bAObdD1+MiDDutJTeCPSixOPJxkphu1N4dsGPqYRORco6pj9pZ6LfmGqqd4o4JZA
	 oOsqrjWVHtU+yNE7O6Qkew/kcgitMTZi8DQlILgq0Mvf8bC9TluOlKuhLzoeHRL6mJ07l
	 EfG9/O3qol9GCerkrwccBxH8EKCr+XX/bBW9tvC8JdPnHe2aTUQ5i6OzB64QRhgA/fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r7d2u110vgId5VcAx7ZmIIMBF2RWq5JXTDegiuYu42Y=;
	b=PCqrxkqAnMOromk0YGPEef4UWPVHz6Ffz6GoBzCeaAYiSRRhBPCg9bH1zCrotUcafkua
	 kCzYlvhPvNAHb/Xj2xhTdeh5dkckozrvVhjw3y1IM7RVK778GONNqpUx/nuo8paqb5ciF
	 l8S4Q1qJQm83ArIgmmN9HQmkxIf6koywZTagTBsAInPIT5fAS6d7eAsx+TYYZiAHeDwSd
	 sbVCbK0ONbIGMP7I2LmuwciDY8UsBquVTfqyZFTFlwFA0pZuIjD3UuOzu53L4Bts23a/p
	 EtxZk0cHK6AKnrOOgMRyv+xdx1YUJpQ+ww3ud7TyKdopcE+NBRWb6LvzJnxbnvO7k+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8EWSiZM;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3DE606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3DE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8EWSiZM
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso8299185ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053852; x=1794658652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7d2u110vgId5VcAx7ZmIIMBF2RWq5JXTDegiuYu42Y=;
        b=q8EWSiZM2HOkbFLTdZysm17TtN4PRfWQYA0iT3i7B7UcXnxbg9js+hzbc8AS4uDA92
         whsy44cpBAT+WFTV9E8pSK1fmpwT8RCgtkfKxTzwVFfla/W01PZAUIwnPH1dNuWfOuwi
         R0NoVTwrJggoyhdnG9jrs5iYbxKrWr96aDvswp2PkiY5/HJNrXD+xkulPsSMlEmzk2n8
         I0/fqrdDP3VJQcMRb25+eN9OZ/KFmiQlJPXACrNuAw4VBm/Zex5rtjthD6fqO7LJ4fez
         FQVdegfe1engB7cvUL6sAGqef/dNH5F3j4TsSUAKZgfQgmzUK7XJuK8xq1R8J2wTMmR6
         3gVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053852; x=1794658652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7d2u110vgId5VcAx7ZmIIMBF2RWq5JXTDegiuYu42Y=;
        b=qbWyOh0HmgAUjpnJQLOuTZj33M5JX0st0f7vigIk9vK//bM95CEFo1/ru/zoxgMbf4
         2xSFUtrYo5pzpJtQHruNIk+0mfxnnSOlbAuXh/Vl6rdWlRHoS9H+UAYZwKknzDJoIuf4
         imrvibnbdtcNPwOpgmBIv9u6e3ddEI7l462hXTGHzUBUWJ/ysytlHC+gY0lCln5mCv7+
         MYpdRtZWcwg5uVw3JjSQQDOAJwAcIPT7fko00wBdaH/rQQyKoLdytNFQXK25iOud/sdv
         udyOIaCjhBXhnxUt/oyf+H8twkbkjrB6ltO9f1No2fMXYiQDGhJa7uvOsJCqh3QmFeNo
         uo8Q==
X-Forwarded-Encrypted: i=1; AL+hErHKxe+tdUh0uoBWk1MLdEpUbl0eXs32hamoo6Im0V0l49lJvP/2Q6va13tFiRe6YxG3evPYQkyIRL+6pkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ETLyr4ryrF2/yFTuq283z/WfYo5sr1Ru3fNdZaIrv1wvP+Sk9
	kFWPm57nAFeTnZfOB4V/k6DNf3T5/haMOvg/olEkmm21s8dbafQUstQV
X-Gm-Gg: AYBFou3BevUO1qyL2TUampCOXAQCVsK4ToMDCH+XNPHtRtacayMb3RYZPZW43mOrvyV
	tLhYHnkQ4XxjQn5XQR+qCCass5umoZMCBuxRe0MX+Ri1gZMFu+Cq9AUajqVIaZFId5aTqDpISdD
	8pk5RIdmMOYkS/tUY2/aniwMcPYa+oX/1J6ejI7dsRDOKRF7e0si1bd3w4sUg8ABXNnmX3Cp/zO
	SgN6oKvhYeTNZppBDGZrKsE/jVrkVZ2U0JlSJ9WfMIni/r9DquTSMgfprzN+U8oGxwvTgJNqvBU
	STEpapEiryQTSyGbBUAGUMk1E9b8AEWn3knPkpT3FEa0tPrqZKgfqx/yAc+SaNSAE04RfoPtvqv
	K5YbI0DTYuurPFSh0vS+G63VoU0PIyB7CuUThYySsyOGKJzkAqGQw7ZUYwo2iGf/RVklNVZ5Try
	qlQ0EzOLHpeVbS69PyeEQAPbIM4bma/ahqOJm3tYfA6lsYNUmDFR544iLl42mVz1wid8lE8V4ve
	dm6r6AmMgyXd/u0LOTiXC4qb8pZv1/2SQc0jMUfYzuWc5Nx8CFk26skdZKjltfihAg2TbRXGYz3
	E1nqWkQTmrGtf2K7ybDj/kbI2ElU5LLLXaYX1faZo8rRjtQust4luQ==
X-Received: by 2002:a17:902:ecd0:b0:2ed:697:884b with SMTP id d9443c01a7336-2ed40989926mr60138715ad.12.1794053852416;
        Sat, 07 Nov 2026 04:17:32 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:31 -0800 (PST)
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
Subject: [PATCH net-next v4 6/8] net: dsa: motorcomm: Rely on port isolation for conduit port
Date: Sat,  7 Nov 2026 20:16:27 +0800
Message-ID: <20261107121631.1040612-7-mmyangfl@gmail.com>
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

With every port fully isolated during chip setup, the conduit port
already gets its one-way isolation (drop all packets without tag)
there. Skip the redundant handling elsewhere.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 52 +++++++++-----------------------
 1 file changed, 14 insertions(+), 38 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 32701f9e687f..1b05ac29ecd7 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1125,7 +1125,7 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 	int res;
 
 	/* CPU port is supposed to be a member of every VLAN; see
-	 * yt921x_vlan_add() and yt921x_port_setup()
+	 * yt921x_vlan_add()
 	 */
 	if (dsa_is_cpu_port(ds, port))
 		return 0;
@@ -1170,10 +1170,17 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	pp->hairpin = false;
 	pp->isolated = false;
 
-	ctrl = ~dsa_cpu_ports(ds);
-	res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port), ctrl);
-	if (res)
-		return res;
+	/* Conduit ports should by controlled by tagging completely, skip
+	 * setting isolation to preserve the one-way isolation installed
+	 * by yt921x_chip_reset().
+	 */
+	if (dsa_is_cpu_port(ds, port)) {
+		ctrl = ~dsa_cpu_ports(ds);
+		res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port),
+				       ctrl);
+		if (res)
+			return res;
+	}
 
 	/* Turn off FDB learning to prevent FDB pollution */
 	mask = YT921X_PORT_LEARN_DIS;
@@ -1948,8 +1955,6 @@ yt921x_dsa_phylink_get_caps(struct dsa_switch *ds, int port,
 
 static int yt921x_port_setup(struct yt921x_priv *priv, int port)
 {
-	struct dsa_switch *ds = &priv->ds;
-	u32 ctrl;
 	int res;
 
 	res = yt921x_userport_standalone(priv, port);
@@ -1963,27 +1968,6 @@ static int yt921x_port_setup(struct yt921x_priv *priv, int port)
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
 
@@ -2282,9 +2266,8 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 {
 	struct dsa_switch *ds = &priv->ds;
-	unsigned long cpu_ports_mask;
+	u32 cpu_ports_mask;
 	u32 ctrl;
-	int port;
 	int res;
 
 	/* Enable DSA */
@@ -2302,7 +2285,7 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	ctrl = GENMASK(10, 0);
+	ctrl = GENMASK(10, 0) & ~cpu_ports_mask;
 	res = yt921x_reg_write(priv, YT921X_FILTER_UNK_UCAST, ctrl);
 	if (res)
 		return res;
@@ -2325,13 +2308,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	ctrl = 0;
 	for (int i = 0; i < YT921X_PORT_NUM; i++)
 		ctrl |= YT921X_ACT_UNK_ACTn_TRAP(i);
-	/* Except for CPU ports, if any packets are sent via CPU ports without
-	 * tag, they should be dropped.
-	 */
-	for_each_set_bit(port, &cpu_ports_mask, YT921X_PORT_NUM) {
-		ctrl &= ~YT921X_ACT_UNK_ACTn_M(port);
-		ctrl |= YT921X_ACT_UNK_ACTn_DROP(port);
-	}
 	res = yt921x_reg_write(priv, YT921X_ACT_UNK_UCAST, ctrl);
 	if (res)
 		return res;
-- 
2.53.0


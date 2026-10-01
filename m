Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280A4E9C2B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887759; cv=none; b=ZXy5c39e0B7MO6mGhcL4OadomKN78xtwlRQfCqeyyY8dbe2XVu7jH8I5hFir7vS8QPvEUkOw/TZAqDY/zQ6YQE7iel8yEChgGm0XPO/ielL+yALAetF0kEfvgOQRW8vFjsYkY9LfRxNUYX6VAZ+2CKWUGoNMiBIpogN0tlHc6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887759; c=relaxed/simple;
	bh=vhT735CP1zUBAuIVgLTwWci2pb832b509vduj4K0xSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT57wCfllBLBcQTdLZvAoszkWZJei0P3IfxmxJuQ1YiI2gtUaQ+jQNq01V/O6DzVryLeKH4n1PW0eFQ+HdH4G8ApQndVUkGBIZ3FBOVk2nNdi5o2BoAlEFJUeSVZWavmoz57q0v6HOH+JVc0UDlnp2rGw3TKu3D+QoIVBu4ozqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vvu9q2G1; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vvu9q2G1"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eefae4so17975735ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790887757; x=1791492557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PFOrX1mp/Oj8PsaIheJm1P3LBaRwQo8cTbd+H//gDU=;
        b=Vvu9q2G1c+W3y9G3XSJMe3qT1+FropwjqPbOe1lguwTdrDJbpvmqYUU5k+wHsgY3En
         l/GfGk5DVguDjSiaF/a03bdTz23+qXNVsYZ04rK+ATB7D6zkJXD6kRzlxsw2AzsBGIRH
         zZyjO6yFqKUhJmrE+IXeAwWjum5xyQaOC9KxM6OGWzBuAsZ6XHIWW0Ok588seCSicit/
         00u0k6zhl7H+QeRQKJt9ucvu99qPTJoM908KmBCo7aoIbL7SDZtoyU6vRzK/Xz98ryk8
         ZukupAqz1K+0i/xfkdhnRiVQd449oTMK8KA5nnBnj/qCbf9I3VClGlCpucVvQdgB09ab
         BuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887757; x=1791492557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PFOrX1mp/Oj8PsaIheJm1P3LBaRwQo8cTbd+H//gDU=;
        b=TdPL00oC0+fVhwvSR+6XKfaMCilYXlsaFg7n6FQuEw58gqknsib7WSVF//gymJe3Dp
         Dr5Zp3lVeqeaqoBsDEJwIO5CfAgPN9yeWBq490Vt8D2uhWuICZlog0ds6GfV82biWct0
         rPH2sq2QHLVGM+PjgJo2z5LFZ4T7tbWskAN5lTwZzFENJFGynKSXh6ikLMCAabLGyPPE
         MpIGIGE1yWvGWwW1FncHTyN7yRrLxlEZmL5hEP6dO19fpeBlTxcSE+s2rwCLWZoQuHZK
         4jXOt9crFOn3qEdOlHHq2oAtCGeGefn1TUuv1bDUcDiepDBrg1eP0BQbEZUH2qF3Eyu1
         x97w==
X-Forwarded-Encrypted: i=1; AKwUvBx2qASdOrwPwkUnFVBTV1Ki4t10lbWSlWZErkewsaBZE49kTgM1UZdmku0ZJiPL/HlK1ZaTcyErSGevueY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUWEnwUdaMtO0/3+riwetc6pYO3Ie5In+kVVXcSceHTcmZJTdz
	T2XuaCzuVE1K4+LBSThVIAGXKb9xOjcmD76l8DYUMc+PuVpJcrMuJ714
X-Gm-Gg: AYBFou0DkKZNTWlozuChzye+ArOVmxsq9ePbUFqDlJ0H/0O98nucT+rO/EI3uJdoHKk
	dHkAqYE9YePRgMrmmMVwtTF1Z+ruvIe2L5k3byNSyIlIlzjXXVNEHEpBtD4bIToh//wYH16kk4A
	Jwbiq1m/oO66EZ04KCZjwK1zK6nl4+pIS+eRG4iF5Ns5u8c3xKOXEjNcfVkbnIURRk2Iqaqx3iy
	qgcIOOI48gZNCKXJmWte2dW0AvooSZBOmP85MztDtwxNePSGQZm6ZSubpfX8ItFJXMXDpPF6W81
	UDGq+ToWX8p8ZwPTaREOYw3QkFQkRZaJ1jw33uhUOh/gi2xZRp8J8qaeCeAYlXijnF+GJkXXq9/
	oHH6Q1NxgqBJBgBN7OjaRvsifB8htuOVL19e+3e5cf3fV5ogr6aQIto3KIRtRLkz3SyFbsi0/75
	oaJ60zRhpMf8J72Rz1jVwBh+4s0bICManXu8Ic1I4wx2duyWkTyabVGWO6DFTuE9sXQPjFIRdyZ
	uWt++3Lo08RZ1dcFbs7v4nSLw==
X-Received: by 2002:a17:90b:224f:b0:39e:6a7f:6187 with SMTP id 98e67ed59e1d1-3a6ceaeec8cmr408036a91.24.1790887757199;
        Thu, 01 Oct 2026 13:49:17 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661e:3050::4d0:26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e9c6sm5658797a91.14.2026.10.01.13.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:49:16 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/5] net: dsa: motorcomm: Enable ACL on demand
Date: Fri,  2 Oct 2026 04:48:47 +0800
Message-ID: <20261001204851.2576101-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001204851.2576101-1-mmyangfl@gmail.com>
References: <20261001204851.2576101-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track the usage of ACL rules and enable it per port only when it is
actually used.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c |  3 +-
 drivers/net/dsa/motorcomm/chip.h |  2 +
 drivers/net/dsa/motorcomm/tc.c   | 63 +++++++++++++++++++++++++++++---
 3 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 5be198d9e5cd..4b8cb2ba28b7 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2686,8 +2686,7 @@ static int yt921x_chip_setup_acl(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	ctrl = YT921X_ACL_PORT_PORTS_M;
-	res = yt921x_reg_write(priv, YT921X_ACL_PORT, ctrl);
+	res = yt921x_reg_write(priv, YT921X_ACL_PORT, 0);
 	if (res)
 		return res;
 
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 40ab5187f774..68cbbc9b9b78 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -581,6 +581,8 @@ struct yt921x_port {
 	u64 rx_frames;
 	u64 tx_frames;
 
+	unsigned short acl_cnt;
+
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	unsigned char led_duty;
 	unsigned short led_cycle;
diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 0e5f19a39d0c..95ed0f245b1f 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1055,6 +1055,17 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 	return 0;
 }
 
+static u16 yt921x_acl_activated_ports(const struct yt921x_priv *priv)
+{
+	u16 mask = 0;
+
+	for (int port = 0; port < YT921X_PORT_NUM; port++)
+		if (priv->ports[port].acl_cnt)
+			mask |= BIT(port);
+
+	return mask;
+}
+
 static unsigned int
 yt921x_acl_find(const struct yt921x_priv *priv, enum tc_setup_type type,
 		unsigned long tag)
@@ -1199,10 +1210,15 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 {
 	struct yt921x_acl_rule *aclrule;
 	struct yt921x_acl_blk *aclblk;
+	bool refresh_en = false;
 	unsigned int binid;
 	unsigned int blkid;
 	unsigned int entid;
+	unsigned long m;
+	unsigned int o;
+	u32 ctrl;
 	int res;
+	int ret;
 
 	entid = yt921x_acl_find(priv, type, tag);
 	if (entid == UINT_MAX)
@@ -1214,9 +1230,27 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 	aclrule = aclblk->rules[binid];
 
 	aclblk->rules[binid] = NULL;
-	res = yt921x_acl_commit(priv, entid, aclrule->mask);
+	ret = yt921x_acl_commit(priv, entid, aclrule->mask);
 	/* the kernel never rolls back on failure */
 
+	m = FIELD_GET(YT921X_ACL_KEYb_SPORTS_M, aclrule->entries[0].key[1]);
+	for_each_set_bit(o, &m, YT921X_PORT_NUM) {
+		struct yt921x_port *pp = &priv->ports[o];
+
+		if (!WARN_ON(!pp->acl_cnt)) {
+			pp->acl_cnt--;
+			if (pp->acl_cnt)
+				continue;
+		}
+		refresh_en = true;
+	}
+	if (refresh_en) {
+		ctrl = yt921x_acl_activated_ports(priv);
+		res = yt921x_reg_write(priv, YT921X_ACL_PORT, ctrl);
+		if (res)
+			ret = res;
+	}
+
 	if (aclrule->action[0] & YT921X_ACL_ACTa_METER_EN)
 		clear_bit(FIELD_GET(YT921X_ACL_ACTa_METER_ID_M,
 				    aclrule->action[0]),
@@ -1227,7 +1261,7 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 		kvfree(aclblk);
 		priv->acl_blks[blkid] = NULL;
 	}
-	return res;
+	return ret;
 }
 
 static int
@@ -1240,11 +1274,12 @@ yt921x_acl_add(struct yt921x_priv *priv,
 	struct yt921x_acl_blk *aclblk;
 	bool use_trap = false;
 	unsigned int meterid;
-	unsigned long mask;
 	unsigned int binid;
 	unsigned int blkid;
 	unsigned int entid;
+	unsigned long m;
 	unsigned int o;
+	u32 ctrl;
 	int res;
 
 	/* Allocate resources */
@@ -1293,8 +1328,8 @@ yt921x_acl_add(struct yt921x_priv *priv,
 
 	/* Replace the placeholder resource IDs */
 	aclrule->mask = 0;
-	mask = priv->acl_masks[blkid];
-	for_each_clear_bit(o, &mask, YT921X_ACL_ENT_PER_BLK) {
+	m = priv->acl_masks[blkid];
+	for_each_clear_bit(o, &m, YT921X_ACL_ENT_PER_BLK) {
 		aclrule->mask |= BIT(o);
 		entscnt--;
 		if (!entscnt)
@@ -1312,6 +1347,19 @@ yt921x_acl_add(struct yt921x_priv *priv,
 	else
 		aclrule->action[0] &= ~YT921X_ACL_ACTa_METER_EN;
 
+	/* Activate ACL if needed */
+	ctrl = 0;
+	m = FIELD_GET(YT921X_ACL_KEYb_SPORTS_M, ruleext->r.entries[0].key[1]);
+	for_each_set_bit(o, &m, YT921X_PORT_NUM)
+		if (!priv->ports[o].acl_cnt)
+			ctrl |= YT921X_ACL_PORT_PORTn(o);
+	if (ctrl) {
+		ctrl |= yt921x_acl_activated_ports(priv);
+		res = yt921x_reg_write(priv, YT921X_ACL_PORT, ctrl);
+		if (res)
+			return res;
+	}
+
 	/* Write rules */
 	aclblk->rules[binid] = aclrule;
 	res = yt921x_acl_commit(priv, entid, aclrule->mask);
@@ -1321,6 +1369,11 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		goto err;
 	}
 
+	/* Bookkeeping */
+	m = FIELD_GET(YT921X_ACL_KEYb_SPORTS_M, ruleext->r.entries[0].key[1]);
+	for_each_set_bit(o, &m, YT921X_PORT_NUM)
+		priv->ports[o].acl_cnt++;
+
 	if (meterid < YT921X_METER_NUM)
 		set_bit(meterid, priv->meters_map);
 	priv->acl_masks[blkid] |= aclrule->mask;
-- 
2.53.0


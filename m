Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BC93C09F5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565136; cv=none; b=cXniureHVlJArfJd3pif56JBIZIfrfiEsYaBpJiaaSeqUcKxSLh+QBcipkVtSEBIPC6D9a1HMWfdrVisKEhcVIOxTgBfrJ4YYbHtFzAcRTXMerPmzyv9wA8wy2WWblXHgJZj+XLVMFuym1SMeLF/BHN7tn8/hQyGoYixTVPQt6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565136; c=relaxed/simple;
	bh=KKv4PXfGKaQNlVOdkmN184+RSh/O3hDUb5OakGaY9bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxo/LTcVu70lM8ujPlxb5RgSf3eP9QgKf69YQBy5qvR4s7/0gXtzPasN3VqYi3xigwM00X5x7+hc/Obkf5wySibYaAZk839FfP6Uz0pPn/dIJGI2YTJlOIH+SlKqBbETk4wauoXqFvR5rt5Ta9Ay62CeGk/2yD7gk/rBef9wQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWTFFyjm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWTFFyjm"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-887a58523e6so2060268b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565132; x=1792169932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3W2ejNmwhlpisaGyVZNvixyoYWJxUsPffTK5W02M7s=;
        b=CWTFFyjmfRISbQGJhgnSYAPPyR9rv+rq0ar6LXVBN63szj7cxdp9BExMf3y5mPduOJ
         Z20fKtP6XRZ29b4gLnt96W5pav+NAjXBEW3UcGL+g94ap5Ua0QBJVSYv3PbGsecRRcXF
         VCKxnMs72kW4hYO2jqKbhitpoYjcSBeBCCscTvtGS9G83D2nusJad/Ofp0S3NmMuBT/o
         sNAUPBHGL3fdGiT1wFz2ZUT5Ep7/bdlc4wk1BsbqHEp/ku+AzqXYEptvw2XjmIJcyvRn
         qfupG73I+wUi46kKEbEa1Ya7H8w4CeIgkVIFow5iRDvoKerGLX9d6XfjL/dh6KjBETME
         By6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565132; x=1792169932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3W2ejNmwhlpisaGyVZNvixyoYWJxUsPffTK5W02M7s=;
        b=LEpjzKLWKEd5d8dA0gVaU1/fmISPR0ihnscZxpIb8AQeFmEFBNiTp4iW4pOEuNFzgU
         39Ct2taEGFl7lfw6JUDANtrlj8T/i+HIiZ7tHEYwn0+17JSJvlxEG0mmaKJsbCUgQTtS
         KNJbMLQ85/yKSieG9PlzTGv8UBm4dmMGz00bPmlyYLUylV1TALNhq9I+JefhD2/5J+Di
         lB/Tl8ckMHY0A2hEq1qXsPWBk6fvXr8t/P/Y6OD8gIxvHJlY5D1NIqIReo85Q1aNvxPl
         2Q73GZ3elbkTAFPxVNOC9bKM+w5tNUaTX3cKPR8SBDPkuOI12L8k0X8PctESNOt9G8Qg
         LixA==
X-Forwarded-Encrypted: i=1; AKwUvBzoWrV/RaHNGTp3bQ5fqCLQGkc5uwKxsNFV374Sh1VhDUuaoMGcBs9oXvl/kxMSxV4S5Op8CsZBEYvoV6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvKFIO/2/u8pwdSxbQSrccff9WNGUkh0VwN1ysHIkqBxK/lH8d
	4TkCwc70vW7CczOuyFh5n7y2mWqzhKiZZGdBUSugv2hbLQ8hHU4T6tCY
X-Gm-Gg: AYBFou2FsdJcz2Hab3ChWblz06NJC1pPaQszfgmiSaUS+R75BH2skP3XjqHQvBqxmgV
	Lw3BWNvtLg8zdLPQ1GuvUjMGwiLgPkpRi/p7qdfLE39CghfU1275gdvJGlZCGSTdNux+yR8OXXI
	00oQ5SQ87zoNLDYW2jmzEvYAvpwCGOV4ThddzlKJnxbu0y4R99TLpsgc3z7ao+RShshZxhtBdUo
	dvJ9KgAaB5x+F4pzEyH4djAPjK25Lpq371U3n5PEE/yT2PCKU4CoYTAFkDMNy6QtfjZDTFCYmwL
	vEfRuZ/0t1A72bYwWQ/4AkJmoMnDhbSiSx7reXWLyVS/2F0dXwFOpfJQytaWCj3hbxmQ/DgDswJ
	Z2VoUCWMLDPFAZKT7JQhpzN7EsjP1Icro9Af0Kot4eOgjZmZowctX1ortusLVmi/ijkHY1GTBks
	JhnJ7D1Cf2c2l2VsRunbsO3TmiRwshfAoEfmWj1T4IRPb3smztxNr0SfPVZeKmPHKTYQn4JxwWJ
	ZlFAaxc35bGzNjCcLpXbKYceQ==
X-Received: by 2002:a05:6a00:3004:b0:87c:f67f:f7d3 with SMTP id d2e1a72fcca58-897c14ead54mr1891350b3a.0.1791565132289;
        Fri, 09 Oct 2026 09:58:52 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c37de994sm1494437b3a.26.2026.10.09.09.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:58:51 -0700 (PDT)
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
Subject: [PATCH net-next v3 3/4] net: dsa: motorcomm: Enable ACL on demand
Date: Sat, 10 Oct 2026 00:58:21 +0800
Message-ID: <20261009165825.359259-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009165825.359259-1-mmyangfl@gmail.com>
References: <20261009165825.359259-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track the usage of ACL rules and enable it per port only when it is
actually used. This is aligned with ODM recommendations and helps reduce
latency.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.h |  2 +
 drivers/net/dsa/motorcomm/tc.c   | 70 ++++++++++++++++++++++++++++----
 2 files changed, 64 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 012de4f444f5..7047ad98f431 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -462,6 +462,8 @@ struct yt921x_port {
 	/* BR_ISOLATED */
 	bool isolated:1;
 
+	unsigned short acl_cnt;
+
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	unsigned char led_duty;
 	unsigned short led_cycle;
diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index be3321df8868..a302016912b5 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1055,6 +1055,19 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 	return 0;
 }
 
+/* Ports that _should_ have ACL activated on. ACL_PORT \succeq activated_ports()
+ */
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
@@ -1199,10 +1212,15 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
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
@@ -1214,9 +1232,27 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
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
@@ -1227,7 +1263,7 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 		kvfree(aclblk);
 		priv->acl_blks[blkid] = NULL;
 	}
-	return res;
+	return ret;
 }
 
 static int
@@ -1240,11 +1276,12 @@ yt921x_acl_add(struct yt921x_priv *priv,
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
@@ -1293,8 +1330,8 @@ yt921x_acl_add(struct yt921x_priv *priv,
 
 	/* Replace the placeholder resource IDs */
 	aclrule->mask = 0;
-	mask = priv->acl_masks[blkid];
-	for_each_clear_bit(o, &mask, YT921X_ACL_ENT_PER_BLK) {
+	m = priv->acl_masks[blkid];
+	for_each_clear_bit(o, &m, YT921X_ACL_ENT_PER_BLK) {
 		aclrule->mask |= BIT(o);
 		entscnt--;
 		if (!entscnt)
@@ -1312,21 +1349,39 @@ yt921x_acl_add(struct yt921x_priv *priv,
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
+			goto err;
+	}
+
 	/* Write rules */
 	aclblk->rules[binid] = aclrule;
 	res = yt921x_acl_commit(priv, entid, aclrule->mask);
 	if (res) {
 		aclblk->rules[binid] = NULL;
-		kvfree(aclrule);
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
 	return 0;
 
 err:
+	kvfree(aclrule);
 	if (!priv->acl_masks[blkid]) {
 		kvfree(aclblk);
 		priv->acl_blks[blkid] = NULL;
@@ -1487,8 +1542,7 @@ int yt921x_chip_setup_acl(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	ctrl = YT921X_ACL_PORT_PORTS_M;
-	res = yt921x_reg_write(priv, YT921X_ACL_PORT, ctrl);
+	res = yt921x_reg_write(priv, YT921X_ACL_PORT, 0);
 	if (res)
 		return res;
 
-- 
2.53.0


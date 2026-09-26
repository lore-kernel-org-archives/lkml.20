Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC854A2E21
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457514; cv=none; b=mm9yRZdX4sB6YrPavDS0F0VXW8SVmSRisiA1UHrQHO4cu4WdvG5DuAhw26SZzlnAmlUQOxJYH/9W2h3shhRuJNrg1qHCmF9gmgXFyrobbL6+lqcfbm+oWsOd0YRQjlhZ7MxCp0/MiM/fAdale9Zu7MO6j5/5SJ5D0JLq/ewqlCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457514; c=relaxed/simple;
	bh=MYa8SHI8fKEHIDY1ty5X1qOB6QYSgEO3j8SX1BiJKpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYC9bXNyXCnqoCLWY6Zb9HoVhlq0Ku++FJ0FdhmWIQViZOYi9LbtsvyNJscSs3rTs4y7jw+XsfjSAoLI0rnJ+F+GKeI9TJYbSLaoW0M30otAQDLDt4T3BQaGTBE2fqjuWKP+b7ufS+ZU4kGlZHcKXi/fxif9TVh4job4UoEb1BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJQ3BTe0; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJQ3BTe0"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so987177a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457513; x=1791062313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/i22iJUnOduQO4rC3J+pcq9QUb4TREVpvSyi+Y88jQ=;
        b=gJQ3BTe0q5pJInOpWk9LW4Z/sV3EDA/YCEOaEujNYRwMqvx6piiwF67/jgl5Ht0kDj
         JN6ITHfmZst3F7g2R/3C4Y5h2dc5oFjyU9DxgdD0Uj47EJuzY704tO9mnsjreAB3AyAs
         8HOU9+1GLtMCfBFh5p7tQdQhTXQ1ACpWv0I38Fhp/gy+aido4uxokxz0x7FP7LCk15sz
         7AgMHF1tBXVgTCrFzOHJJggFmylDhzocx/D2p5xZODkCatYPFXRIA7ETPeq0ME2pEDND
         1G4TDLpLuqtZ2TTY/qmG8dKpiA0KxNp+bx/TmkVnLCL3VdnI0TrhUKlxk57FCz8kjHuu
         BZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457513; x=1791062313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/i22iJUnOduQO4rC3J+pcq9QUb4TREVpvSyi+Y88jQ=;
        b=m66EBQJ7gjQw5JZhWNGk6nhGww8xGO/o3rlcu+1hOFlQ1zy4WuHeh54r8b7Ylplkco
         fBrMEDpfr/KV5izWBtBu2ZHovzpUDd5GgDwrCUgBavoS1NvHnUYPcpZWU8W2byqfIvCK
         qktIQ2fg3wjmc4qNE/EiAaaSo1lcCPGUNdflCI7+N1yBMSn26++A2dhH7hoAVd3jDB0H
         D79CokJbm1QfA7agjigHDR6y/X1yPJ8HIXI2bJs3hQoXGpnL7hSxvbtrN2f+YSMWwnVt
         34lKkHZDDh+oQ7pKOt+rmV5G9LXqokqaHQCnvTu7OCVFsIMjfwcy+DC3ELshmKcDAYzZ
         2Bpw==
X-Forwarded-Encrypted: i=1; AKwUvBwpN6MHK6N36VBihuAiJVNbRfeOJl4ykUftejoVZX1dtHkkoJDUMHOa4awZLbippPVA/bBrSxNsKcm2BKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoVvc/Qb+3R1S+3m/jsSkGIsu4d2xbIZkEwFA7m8MU8hZa6Ygw
	xtUiK7hQfuoVEhVbN8WmS14kOqRe23QmH6V/ZKTWbv00HqJKKf+2J116
X-Gm-Gg: AYBFou2NV0CKpjRbL62uivWJi3e/t4DrbkqOaPLfx7Gd5QA/Eld9T8yqmVeXMZ5/ZTT
	TouF+JZHZz5Z4+mXDvXAfP9OmVMoEpCMKLvE0IyLZhvIse3QqQnCVcyJ20BsH/IaasvTn6Y0E1n
	ZB9rhEy+ttN0PJ2AYPws02Z6B28qCsrocjkVqBAjsMH0NkdHSOk4XoeqwTl8LIdDWsqIT18KV1z
	jvp3BMljXOuVWY/EXqJ0b3wiPHO7N1SLHjaCShpsV0AH8jhtcTc14akXaZHzhrIFfetFycZExj6
	2zO+ZMmdYceNlxhVb7xP/DigDCLwiOnIhmbR+JI6F0pgnR2hY18WtZzDPuTntE0+iiQIKURkmD+
	Ghg6ROw6/AGFaZI8CTbh5dWHvmiZeHsTpgDCGIe5rfRmrBw103Bl4aOwHNtmWcZVvD6FkiJIJjb
	mTM8kM+kp/JvnWp/3VEBF0VITypor7bggbhyNcazfbE55SZdjh48siDQdsH0GRMjucqzEJPwUPt
	fWp38lltu7lRbmejvzB0ewx
X-Received: by 2002:a17:90b:4b0f:b0:39e:4c80:f67f with SMTP id 98e67ed59e1d1-3a098983faemr7890481a91.30.1790457512613;
        Sat, 26 Sep 2026 14:18:32 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c3f74e5bsm9473204a91.5.2026.09.26.14.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:18:32 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/6] net: dsa: motorcomm: Enable ACL on demand
Date: Sun, 27 Sep 2026 05:17:32 +0800
Message-ID: <20260926211813.935723-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260926211813.935723-1-mmyangfl@gmail.com>
References: <20260926211813.935723-1-mmyangfl@gmail.com>
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
 drivers/net/dsa/motorcomm/chip.h |  2 ++
 drivers/net/dsa/motorcomm/tc.c   | 61 +++++++++++++++++++++++++++++---
 3 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index e9d3058462e5..be48ecc3e3df 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2689,8 +2689,7 @@ static int yt921x_chip_setup_acl(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	ctrl = YT921X_ACL_PORT_PORTS_M;
-	res = yt921x_reg_write(priv, YT921X_ACL_PORT, ctrl);
+	res = yt921x_reg_write(priv, YT921X_ACL_PORT, 0);
 	if (res)
 		return res;
 
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 02419bcde3f2..c191cec94d59 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -582,6 +582,8 @@ struct yt921x_port {
 	u64 rx_frames;
 	u64 tx_frames;
 
+	unsigned short acl_cnt;
+
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	unsigned char led_duty;
 	unsigned short led_cycle;
diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 7717f1e17923..0f6d7a4675fc 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1058,6 +1058,17 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
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
@@ -1202,10 +1213,15 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
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
@@ -1217,9 +1233,27 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
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
@@ -1230,7 +1264,7 @@ yt921x_acl_del(struct yt921x_priv *priv, enum tc_setup_type type,
 		kvfree(aclblk);
 		priv->acl_blks[blkid] = NULL;
 	}
-	return res;
+	return ret;
 }
 
 static int
@@ -1243,11 +1277,12 @@ yt921x_acl_add(struct yt921x_priv *priv,
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
@@ -1274,6 +1309,18 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		}
 	}
 
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
 	/* Prepare acl block ctrlblk */
 	blkid = entid / YT921X_ACL_ENT_PER_BLK;
 	binid = entid % YT921X_ACL_ENT_PER_BLK;
@@ -1296,8 +1343,8 @@ yt921x_acl_add(struct yt921x_priv *priv,
 
 	/* Replace the placeholder resource IDs */
 	aclrule->mask = 0;
-	mask = priv->acl_masks[blkid];
-	for_each_clear_bit(o, &mask, YT921X_ACL_ENT_PER_BLK) {
+	m = priv->acl_masks[blkid];
+	for_each_clear_bit(o, &m, YT921X_ACL_ENT_PER_BLK) {
 		aclrule->mask |= BIT(o);
 		entscnt--;
 		if (!entscnt)
@@ -1324,6 +1371,10 @@ yt921x_acl_add(struct yt921x_priv *priv,
 		goto err;
 	}
 
+	m = FIELD_GET(YT921X_ACL_KEYb_SPORTS_M, ruleext->r.entries[0].key[1]);
+	for_each_set_bit(o, &m, YT921X_PORT_NUM)
+		priv->ports[o].acl_cnt++;
+
 	if (meterid < YT921X_METER_NUM)
 		set_bit(meterid, priv->meters_map);
 	priv->acl_masks[blkid] |= aclrule->mask;
-- 
2.53.0


Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F784A384F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457517; cv=none; b=CTD9Mbq9gn8NFifJh958Bhug7XV+H0zH7vaRw7kTdAKe3eiV7iHh9gW6qkqpTEbCcIdapuoT3P95mmEjkc86P0in3dh9+vXVWzd6a6yh3D8m4S/7CT0gAx6viiE8PxBHforKU5Xdl7kalnkIbmx6/EQ5QdFPObA/MXRqco4OEgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457517; c=relaxed/simple;
	bh=Accgco2mkZAx5P1tgNhGPvKyOEsEYm8tEufNPqr1RIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9Dk+RDtsgjXyNWRL+LaqQC8Y5VT2ZEqAilFgZNj+tSvp1Bs4+5D3oG+LV7joqIQ5t6iflP42Z19nqTHlYyhCDfu+qbM3xg9M5fWlbaS5Cf8puoluEmKUz9fzOk8iEn5OA5K178aUihMq4TDeJYvFni7IbqYZIPOkGH8qqfuDOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/8/Iw5b; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/8/Iw5b"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so140400a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457515; x=1791062315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8bpMCx4GRvINtrgXlvafjDKO/FNbBLvzSwE2nIsKuw=;
        b=p/8/Iw5bpswP+HZvxFLGeyNZbqvPfO0/ZIgt4AYNsgleFcR+759a2fUob/JY2HGUU3
         LCGvbWT3HkMKdwVcbrUItDfoNUl1TQMfanKjlmbj+RggxDtFaMQtCJEZl1VM18jKohxr
         /u/35+L8W/eBdwI1mTJSmctBuRz7VaCeJT8ay02ugxEj5XFDgWzAOCi8knAvgPHPMDuy
         15RT7+AeVK6TZD07W5NNoQPDTHsMAzJiP2piRD8j41kzTTnEkarRra9zJl8TZ/RryEDF
         l+CNoI2+E1IC+AQd6dulB3UqnCuyXb/g1Nmw1E36TRdr3Q7++e05GqioBoV+5Omstt8d
         EMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457515; x=1791062315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8bpMCx4GRvINtrgXlvafjDKO/FNbBLvzSwE2nIsKuw=;
        b=xgxP6q73ImGAZmInPToVjU6qVIZm7sCjvAICmUHXKF+AxRRAFYRxzBTj0e6BeF2Yqu
         T8DWXBBT5YTEESMhqSXyuj5FJKgzP9uFy4raoP5DpEJddYJ9H8ntvXwqvWt2b+rBLi6C
         QU3E25psYFjbndtrrx9Ge+Y7XZ5xF6UGJr0T6VGqPeimCAdcJ2RjiQGBgkcDcB62sKqn
         KKRF+jdjWJK+nA4BCW/+l/hTsZYq9urhAEl6R2m2KMQSwdrEg6fDWH/PN7QB3IyvxWjQ
         a/CRd7nh1zZEdMXTRFC6EQsMWmEjYCXXuLHhQ1Esuz+S+f9IaVoRoH9qpQOeyfYhu4UD
         OPrw==
X-Forwarded-Encrypted: i=1; AKwUvBzQyWDlCLu3l6ljWivWrNClCslwlYZ1MpmI5LEEOJNcdEQaaDx4eDn1SRWm+jjmJvTX4WOGnuM9N2urTBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUkDXTpuYj8YFa+IOG+KA7bAti+WEgeJGD5yscQ8PtC5IE7x7e
	M+XYuQvc8uHqmM7f+ZtkQ2suNzdKhWhrusfh55vaUhFoIvfp90QYo3HW
X-Gm-Gg: AYBFou1PI78BFXAWIrRNMFQhVvAFhGcE47qACA658U3cCrPsig/8rmNpbHZWAyXSWO6
	IOEOO2fSonl2brMbaqIwiUdauVthJfBn58wOl27G9HBYQniUlafkYp1ihK7aaB3+W28zFme4kyf
	BMrUtGFIYuMyd6K+eWkWf2GxtgAlTAbtdU3Uh3X5VMbtvOQFbzjGEOxPNxW2j1yEZ23qVl1BQOD
	hz0MFRGB3j0tLysQPWW7Oy/BGgYC/RozKPHDIIkJXov9NwmRmcK5WGItnQH1izl4JhyyIO7oVcU
	L6maL/+m6lZejshwAvadYAw2Rqm9XJz/EwqcqFdS2OHeVCRFJt/N0fk0aU3ruaqj4SEYSsK6xt7
	m/VPaYJ1rXRQv6tkMGc7aRBFtdl/osqBFnhdRPap8pgol46WFwqsajsUpn3Ev14Ui26jOEnebex
	Ljxts01VO5ppNH159g7qqDIKXj3ZQdTj1nxiAMaxNHwu72kVIJoCxN/447ZaKldd1X9JHsEa3cr
	2b2Ht0LNgW4u4FM8Q8uiyOs7+da5/wlukY=
X-Received: by 2002:a17:90b:384c:b0:39e:5acb:2849 with SMTP id 98e67ed59e1d1-3a0bb576e5cmr5272843a91.17.1790457515431;
        Sat, 26 Sep 2026 14:18:35 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c3f74e5bsm9473204a91.5.2026.09.26.14.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:18:35 -0700 (PDT)
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
Subject: [PATCH net-next 4/6] net: dsa: motorcomm: Add TC prio support
Date: Sun, 27 Sep 2026 05:17:33 +0800
Message-ID: <20260926211813.935723-5-mmyangfl@gmail.com>
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

The HW supports fewer ACL priorities than TC does. Notice the default
priority for flower is 49152 and catchall filter has priority 65535, so
scale the priority accordingly and reject the ones that do not map onto
a hardware priority. Also adjust the register field name.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 21 ++++++++++++++++++---
 drivers/net/dsa/motorcomm/tc.h |  5 +++--
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 0f6d7a4675fc..d919743d89c1 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -535,14 +535,14 @@ yt921x_acl_entries_find(struct yt921x_acl_entry *entries, unsigned int *sizep,
 }
 
 static void
-yt921x_acl_rule_set_ports(struct yt921x_acl_rule *aclrule, u16 ord,
+yt921x_acl_rule_set_ports(struct yt921x_acl_rule *aclrule, u16 prio,
 			  u16 ports_mask)
 {
 	struct yt921x_acl_entry *entries = aclrule->entries;
 
 	for (unsigned int i = 0; i < hweight8(aclrule->mask); i++) {
 		entries[i].key[1] |= YT921X_ACL_KEYb_SPORTS(ports_mask) |
-				     YT921X_ACL_KEYb_ORD(ord);
+				     YT921X_ACL_KEYb_PRIO(prio);
 	}
 }
 
@@ -1032,7 +1032,9 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 			       const struct flow_cls_offload *cls, bool ingress,
 			       struct yt921x_priv *priv)
 {
+	const unsigned int scale = (U16_MAX + 1) / YT921X_ACL_PRIO_NUM;
 	struct netlink_ext_ack *extack = cls->common.extack;
+	u32 prio = cls->common.prio;
 	int res;
 
 	if (!ingress) {
@@ -1045,6 +1047,15 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 		return -EOPNOTSUPP;
 	}
 
+	if (prio == U16_MAX) {
+		prio++;
+	} else if (prio % scale) {
+		NL_SET_ERR_MSG_FMT_MOD(extack,
+				       "Invalid priority %u, must be a multiple of %u",
+				       prio, scale);
+		return -EOPNOTSUPP;
+	}
+
 	res = yt921x_acl_rule_ext_parse_flow_action(ruleext, cls, priv, port);
 	if (res)
 		return res;
@@ -1052,7 +1063,11 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 	if (res)
 		return res;
 
-	yt921x_acl_rule_set_ports(&ruleext->r, 0, BIT(port));
+	/* TC prio can't be 0 & TC lowest first -> HW highest first
+	 * map 1...ACL_PRIO_NUM to (ACL_PRIO_NUM - 1)...0
+	 */
+	prio = YT921X_ACL_PRIO_NUM - prio / scale;
+	yt921x_acl_rule_set_ports(&ruleext->r, prio, BIT(port));
 	ruleext->r.tag = cls->cookie;
 	ruleext->r.type = TC_SETUP_CLSFLOWER;
 	return 0;
diff --git a/drivers/net/dsa/motorcomm/tc.h b/drivers/net/dsa/motorcomm/tc.h
index 3d4a8a24f8a8..0eee2e3808c5 100644
--- a/drivers/net/dsa/motorcomm/tc.h
+++ b/drivers/net/dsa/motorcomm/tc.h
@@ -88,8 +88,8 @@
 #define   YT921X_ACL_ENTRY_GRPIDm(bin, x)		((x) << (4 * (bin) + 1))
 #define  YT921X_ACL_ENTRY_ENm(bin)		BIT(4 * (bin))
 #define YT921X_ACLn_KEYm(blk, bin)	(0x204000 + 0x200 * (bin) + 8 * (blk))
-#define  YT921X_ACL_KEYb_ORD_M			GENMASK(29, 21)
-#define   YT921X_ACL_KEYb_ORD(x)			FIELD_PREP(YT921X_ACL_KEYb_ORD_M, (x))
+#define  YT921X_ACL_KEYb_PRIO_M			GENMASK(29, 21)	/* highest first */
+#define   YT921X_ACL_KEYb_PRIO(x)			FIELD_PREP(YT921X_ACL_KEYb_PRIO_M, (x))
 #define  YT921X_ACL_KEYb_SPORTS_M		GENMASK(20, 10)
 #define   YT921X_ACL_KEYb_SPORTS(x)			FIELD_PREP(YT921X_ACL_KEYb_SPORTS_M, (x))
 #define  YT921X_ACL_KEYb_SPORTn(port)		BIT((port) + 10)
@@ -330,6 +330,7 @@ enum yt921x_l4_type {
 #define YT921X_SHAPE_CIR_MAX	((1 << 18) - 1)
 #define YT921X_SHAPE_CBS_MAX	((1 << 14) - 1)
 
+#define YT921X_ACL_PRIO_NUM	512
 #define YT921X_UDF_NUM		8
 
 struct yt921x_acl_entry {
-- 
2.53.0


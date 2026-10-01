Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C34A3D5D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887766; cv=none; b=Y9qvke2WMDzqh+7RBZsyUV3oeu55eMOKT27Pa+T8zePRuTKKdsheEcle/0FgIrJ1oitjAVsjGUZxa6vY+gs7sSLRBKtXA3OS2IblUQCQm/7G3nGBgmgfMwUTNx+F60PB59zKpZ6Ky+dBl+QeF+F3RqQjxBfwQYM5wUj1nXWgLtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887766; c=relaxed/simple;
	bh=I6/o9KvZg6aat6YOGe4DnDre2ezdsh2qzKZe1N9kGWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Po9bdparY5MZKVkfd+kCH0dOlmPGOXmSSws5s3FHMUK87hJucLsfQRwuc7F4VNnQaT/UpeCFykqdtoVdUMj+bHRSAKqPuT8sVFKYdC7+/Un/6TNQeRY4xD59GF1jcFtDFFpnnwu3KGDyuPma7rTliqf60bt58IAY3wwoUy+WoNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xd2TDf8b; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xd2TDf8b"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6d9baf76bso69971a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790887761; x=1791492561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYT65medAWN0BTZv+iirNsDXipqGQN4Oa20zSL9XADg=;
        b=Xd2TDf8bZXYLpvnP8vwruHly+HUR49cPjJEljcg9VOc/k622HTJ57RGN+zPfabiJeB
         t6Q43hy4zyIxU0JCe0q6WZGxHhbHtArNQh6Ck8eZ+v8PTU1HuQnCIInSH6pNcZ9xeezO
         709tTjkN28J2LAu9lCD8q+ageb9cCGG/VRxaLJ4IQiUlYo9gvvsjiQeUpvESH4Xas+hU
         Vf0927sozPk9c2+TXztjuupEnqvKIWPqQy2hmf6ivCFnYqbfSys4O4yCk/Tj7e7tzJZf
         CHiJK4s/wYkb6gWeA68gzaFqGz0c9Rgd9QFXGTIDvjug7zHVKK1HzM23iUK03vNOJc1x
         Uzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887761; x=1791492561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYT65medAWN0BTZv+iirNsDXipqGQN4Oa20zSL9XADg=;
        b=ZN5AFpi94QqEG3589pquHkWFPhLnWxkbYMf2da+9bvfAQjsHN4EhNDFd+CIrWaaVxF
         g4Dgwox04pTLDxn3LHnwMkaImJ6rSp383NAM3Evjr/jux0ZUFyugFDSfvkxrj8cPJzB7
         axidYzBhbQbJCuUdUSzz2VZsIDvRN47iSF8hJ9ryQ0ouew0luGnGMcMVES1FxYV+9S05
         k5fetP+d6OSYI9LuI8arX8tqOvr1UOcMkfCN1af/wsj9mksyIemVO+/2X4eGJ6W+56Ir
         8PQb0EkzPRaSkedu+lUNcA5UvBNHUdKn+KXiguAGzDRZS0ijoZgTHoZ0/NBtD2HPYV1O
         U1JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsxK1y6VomPmmycNBil52xaaysB0iKKxtuYTC0lsAngcbXGI0m2JJgJCH+AVxwgW7VPhnTuZU+TGeqGN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVbJ5xHsJmkh98q2TgQwRVeXQ0GMGoXakE5GEUp56nTdPPWaSz
	DTqkOZURl+cV3nh7yOOyXZKKOq/6c9IsZbC3fW2Wq20pfo1Is4HerJY5
X-Gm-Gg: AYBFou2SKywmv6k0NusZpDISawpJgNaLDw8/kl8706qRl2QS4k+AqJXr2gKuo0/nvat
	2tPLqSV8FuMcEomrz7jQcFRSnRfg8wwMZqGnISbVgMnm6+WVwnXvF2SXD/Umzny+YS4rKb2hWM3
	kXcSly4thyFQuIiNQYhNLly5yu6ueP8dQQvX7z5cO5Hc1ILkEyONXfZjGawrCdfQo8FMI7CDau3
	4vzedtjV/cR3JJe03iPpbySRF5FBJK8nDa8l3cwyKUIznv72+rsN+aLbgOuxBqxRmKuo/nbPfpE
	/f8aIAFa9ntS1WWEGZU0Lz8NKg1OIwCnz60NilpryPQ836DmtZrhiJHYU30IzeffZv6kCNjHmxY
	KuWg6F+87SoBPh2x1AnjWemXLN9dQy5gMH9rMidt78UWXWtCPcg5vlIllUVBAe5Vh0foXnH88F6
	lQzqyEeQNKRRERuY0mBL9BoQnYkqnD3GiG9oh0vcqgwh0S9hsfbVImmbPZtQwNhaoZ9fDChSvyN
	olKrft7IX0Z5R1X6/Bcxie7fclvEp9AoEAz
X-Received: by 2002:a17:90b:2687:b0:3a6:c8f0:c3ca with SMTP id 98e67ed59e1d1-3a6cec5e97fmr586435a91.47.1790887761126;
        Thu, 01 Oct 2026 13:49:21 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661e:3050::4d0:26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e9c6sm5658797a91.14.2026.10.01.13.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:49:19 -0700 (PDT)
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
Subject: [PATCH net-next v2 5/5] net: dsa: motorcomm: Add TC prio support
Date: Fri,  2 Oct 2026 04:48:48 +0800
Message-ID: <20261001204851.2576101-6-mmyangfl@gmail.com>
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

The HW supports fewer ACL priorities than TC does. Notice the default
priority for flower is 49152 and catchall filter has priority 65535, so
scale the priority accordingly and reject the ones that do not map onto
a hardware priority.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 19 ++++++++++++++++++-
 drivers/net/dsa/motorcomm/tc.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 95ed0f245b1f..c5581e85208f 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1029,7 +1029,10 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 			       const struct flow_cls_offload *cls, bool ingress,
 			       struct yt921x_priv *priv)
 {
+	const unsigned int scale = (U16_MAX + 1) / YT921X_ACL_ORD_NUM;
 	struct netlink_ext_ack *extack = cls->common.extack;
+	u32 prio = cls->common.prio;
+	u32 ord;
 	int res;
 
 	if (!ingress) {
@@ -1042,6 +1045,20 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 		return -EOPNOTSUPP;
 	}
 
+	/* TC prio can't be 0 & TC lowest first -> HW highest first
+	 * map 1...U16_MAX to (ACL_ORD_NUM - 1)...0
+	 */
+	if (prio == U16_MAX) {
+		ord = 0;
+	} else if (!(prio % scale)) {
+		ord = YT921X_ACL_ORD_NUM - prio / scale;
+	} else {
+		NL_SET_ERR_MSG_FMT_MOD(extack,
+				       "Invalid priority %u, must be a multiple of %u or 65535",
+				       prio, scale);
+		return -EOPNOTSUPP;
+	}
+
 	res = yt921x_acl_rule_ext_parse_flow_action(ruleext, cls, priv, port);
 	if (res)
 		return res;
@@ -1049,7 +1066,7 @@ yt921x_acl_rule_ext_parse_flow(struct yt921x_acl_rule_ext *ruleext, int port,
 	if (res)
 		return res;
 
-	yt921x_acl_rule_set_ports(&ruleext->r, 0, BIT(port));
+	yt921x_acl_rule_set_ports(&ruleext->r, ord, BIT(port));
 	ruleext->r.tag = cls->cookie;
 	ruleext->r.type = TC_SETUP_CLSFLOWER;
 	return 0;
diff --git a/drivers/net/dsa/motorcomm/tc.h b/drivers/net/dsa/motorcomm/tc.h
index 2a811127ec8c..99d4abf5dacd 100644
--- a/drivers/net/dsa/motorcomm/tc.h
+++ b/drivers/net/dsa/motorcomm/tc.h
@@ -331,6 +331,7 @@ enum yt921x_l4_type {
 
 #define YT921X_ACL_ENT_PER_BLK	8
 #define YT921X_ACL_NUM		384
+#define YT921X_ACL_ORD_NUM	512
 #define YT921X_UDF_NUM		8
 
 struct yt921x_acl_entry {
-- 
2.53.0


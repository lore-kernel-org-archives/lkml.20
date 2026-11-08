Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136604;
	b=3YaAV32UGiVczwBMv/P6kdbrz0fN0DEMRR2Z8DG757j9jZvvUxMlj5FcKt/3qiAnuZhc
	 4duHmSufuuuWaCpGF1zcFl32nTlGz5/L9jQD0LxZ8TqiNw8RDChiRLSc4Lh0fc8/MQ5SS
	 T0CroZH0pO38zjq1yrHofD/fB1ypyKXaZYKOtEYwaUGgoAATvPHta/y2xDppVtp9DME/J
	 sPPAUl6pG9LsHksMrTqK12iXibr0FxDik7TzFbH5GE1z7R5hn7zoDEP5/+0li7e/Q5ojo
	 sAK1flwSHimQ3SG6fwiMRPlXt9qdax2nG+vDOE+y9hYKb66TZID/Aerj9HgsGk0VzdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/SKSEfqQS8Igvwe99KeR8tpkRTehrw2nZcZ5AJN4mk4=;
	b=LFGr0uisk0l6XI12QWscyA19t3gqGmukrBjzQVFZ1BhvGlRKqT8Qlldb1/KWeZl7mg5P
	 R/K3eW4elPl7uZOkilfcx1m+1JdA8pwJA5P/OQb+Mzxw0kFPzaj+lhQoQs/p3dkEMi9oA
	 lOmecQA6QXrsnoVb98e530XAPkzEgewirkToJJ+9uiwrMzUcLQ6OlNNu7x4Lo0GbmW76R
	 XQGdytclNPj/JZc0sx0KLuVRIg7S/4bCRJr8hiioEX8AWz6TW/J73Fm6kNEl5emouI3y4
	 dpoMuXkQNuDSoyOnkDtoZsvI4PuZG+CyhGuMjYgr6bDTYdaJF6JZBR6AcmuXCPKZKKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=geqvbnxP;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D7606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6D7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=geqvbnxP
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cdc606b47so6496566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794136602; x=1794741402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SKSEfqQS8Igvwe99KeR8tpkRTehrw2nZcZ5AJN4mk4=;
        b=geqvbnxPs3AidMY6uP0W2MeXX/vqHwXFGhK0I1IEAI/zZJ231XAmcMSwgQzqT5Fbzb
         t/iS3y6m+aKgpK4DmJvOSXHchZVT80MEHslnnFMUm7Lkc/cqBfciygj0HmbZeQuoCKby
         Fdu9V+8s83AmYbCQCXefRxNKJZO7x4a1oHSS73RiomHm9opg27AUs/tUr9SXQE9IOABV
         bY0MHxSH1XQfKjWwmzcQJWi4imNSxs4Iq1e1Fiu+Wxj+OJgkACpClAHKlLI5CieUFG4O
         Zr+860WG//a4HRdbyP059WI111EjV0rFyC49SQ3oal19ZxC90/KL8CALsXhW8gYhCT7x
         iA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794136602; x=1794741402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SKSEfqQS8Igvwe99KeR8tpkRTehrw2nZcZ5AJN4mk4=;
        b=OOSfBJ6rWa++zxeLaWcjQfqeYBrmg14t4MCLJQTZI0RULmtCrZ/MTd7tbJmypr5Ynq
         MzUqQXiVlj1QOfR4Eernklt1LfdI0CW3VFSjRtNL2DA2k1lq1HBkGRhbrhrqzP802rS6
         IEYZwGrfgemVshC10PKZut8IuYbB01Ddu5jBcnk97tCT/HxqEH/5TYkz9aYoBUrC5Eu9
         N9TBMmsGmIxYeCWbBufPFS52VU+mMtfaGQJ2LrMQpCu2XDWBIYdIi2isLtrPQBiWwkWc
         0OQ6hbliI2wHgY/IhsaL/3n+0yC52nDZphj+cDQ+yf+UBIIcvL+hmAusPQ8QJ1kKRptJ
         yGDw==
X-Forwarded-Encrypted: i=1; AL+hErHVzJGMSw5xOVjJzPs32bLcXzNEPFz8pYTNya/pLHR9LlavsrYcMozYJV8Rif2t4aRbdQe1xebMWtgEly8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UcTz0W/ej2VQyUbJdhO+4mS2Wd0gMchspWE+QQRuWUkPB1n1R
	1uJAu3SkS9RJcgOBdeHpBei40fVNuRYPFxnL68ToT+nMcu+ogt/5xiieQ4slEpwdpg==
X-Gm-Gg: AYBFou02BDWbZMM5DVv0MX7ZnQTE/AqH5v29idPi5cPoU9q28ntPxDCxiyX17r1Ufca
	BkTQCZlW4vsYm5bq1tPWUYLf+S9M+dVHOz9fN2+7nJ1/8Sr6NrYtGqop+K3aHgN7PEDVtoSa6Wc
	Kq73MV4mcVSRYZuAA6cbzH4GbUt3yH9mZI9ScBz0ZWkgkZkrPb8kRegyX5Tu4hmBXcR8xXN6tQG
	mymxCa1Cf7SR7I+kmG2t36xdpjyREi7wn/vpYm5gUoZQ4LIy3L/96iSq3gIZduWFlRoJ9zyw7ph
	xeyJ4s99iuYeWEpDEsK6oMN8g7rc8NSdeTZAk/VR7B3BoRyXje90pxX9BTesOWztWg3PS+5sJFt
	53INF4lxmMwkCSF4fNrwvDZXMlyJdJTT+6INeMYFXveBETV6bQ3Q3ybnDCoi8bE8Zq9EJOl8NI7
	icaq2IsaEQvL3DTV8RaZlh2n+5jkXPd8b7lbRWL0p78VTCxA0KzstuAGvbwZMtJ1Oa4Ozmsi+li
	bj1DV4/MNVsKudmATKNjFLt5NTjfCVHQsuZZWXXUl5nTLGLakyHWsr59sDWZ6oU4YQe+3Gowzyt
	PQNssK/bfcVxjNgz86++acsunLr/4Fegca8mEoxAmjZeQoAteYQUJPnqvwk1UrSTh3IXmEeYV67
	bc3PKadymhTxrPKeVHkM0ELLAVk0pOKbdXZ2lo6Q5+2kfpEKlLaywjel7jmIy5wOGqOYth2vb8N
	lJbLaLl9tGbUv4t8CiCTmygZhGJVcsJuNe7Skg03R84r0VRSebnFBeoFoOkciGn4qFkFbCJEm+F
	04sObg7uDTmMCofE1P4cZepggb3XAEgBr1dyG3Zhaqifl6jQlzBGRxq6dKw6TP5S4+YODGxGwsH
	p0ksBIrIlIv+frNPmA==
X-Received: by 2002:a17:906:7953:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c4d6db15eecmr83366466b.35.1794136602388;
        Sun, 08 Nov 2026 03:16:42 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a99320bsm54261166b.67.2026.11.08.03.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:16:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] net: bridge: switchdev: add br_switchdev_fdb_find_port()
Date: Sun,  8 Nov 2026 12:16:38 +0100
Message-ID: <92a9adba8020449a269bb8941698ea6849b4c372.1794134495.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794134495.git.julius@bairaktaris.de>
References: <cover.1794134495.git.julius@bairaktaris.de>
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

Add an RCU lookup that returns the port of a non-local FDB entry that
switchdev is notified of: not locked, not added by the user as a
dynamic entry, and not learned by a switchdev driver.

A switchdev driver that handles FDB events from a workqueue cannot take
RTNL for br_fdb_find_port(), and has to ignore the entries whose
deletion it will not be notified of. The filter of
br_switchdev_fdb_notify() moves into a helper that both use, with no
functional change; the learning path does not change.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/linux/if_bridge.h | 13 ++++++++
 net/bridge/br_switchdev.c | 63 +++++++++++++++++++++++++++++++++------
 2 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
index 75673b8bffcb8..e050b7e698fc9 100644
--- a/include/linux/if_bridge.h
+++ b/include/linux/if_bridge.h
@@ -201,6 +201,19 @@ static inline int br_mst_get_state(const struct net_device *dev, u16 msti,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_BRIDGE) && IS_ENABLED(CONFIG_NET_SWITCHDEV)
+struct net_device *br_switchdev_fdb_find_port(const struct net_device *br_dev,
+					      const unsigned char *addr,
+					      u16 vid);
+#else
+static inline struct net_device *
+br_switchdev_fdb_find_port(const struct net_device *br_dev,
+			   const unsigned char *addr, u16 vid)
+{
+	return NULL;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_BRIDGE)
 struct net_device *br_fdb_find_port(const struct net_device *br_dev,
 				    const unsigned char *addr,
diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
index 10f3aea6a1f82..02ca1cbcfede0 100644
--- a/net/bridge/br_switchdev.c
+++ b/net/bridge/br_switchdev.c
@@ -141,14 +141,10 @@ static void br_switchdev_fdb_populate(struct net_bridge *br,
 	item->info.ctx = ctx;
 }
 
-void
-br_switchdev_fdb_notify(struct net_bridge *br,
-			const struct net_bridge_fdb_entry *fdb, int type)
+static bool br_switchdev_fdb_notifies(const struct net_bridge_fdb_entry *fdb)
 {
-	struct switchdev_notifier_fdb_info item;
-
 	if (test_bit(BR_FDB_LOCKED, &fdb->flags))
-		return;
+		return false;
 
 	/* Entries with these flags were created using ndm_state == NUD_REACHABLE,
 	 * ndm_flags == NTF_MASTER( | NTF_STICKY), ext_flags == 0 by something
@@ -156,9 +152,58 @@ br_switchdev_fdb_notify(struct net_bridge *br,
 	 * Drivers don't know how to deal with these, so don't notify them to
 	 * avoid confusing them.
 	 */
-	if (test_bit(BR_FDB_ADDED_BY_USER, &fdb->flags) &&
-	    !test_bit(BR_FDB_STATIC, &fdb->flags) &&
-	    !test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags))
+	return !test_bit(BR_FDB_ADDED_BY_USER, &fdb->flags) ||
+	       test_bit(BR_FDB_STATIC, &fdb->flags) ||
+	       test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags);
+}
+
+/**
+ * br_switchdev_fdb_find_port - find the port of an entry switchdev knows of
+ * @br_dev: the bridge device
+ * @addr: the MAC address of the entry
+ * @vid: the VLAN of the entry
+ *
+ * Must be called under RCU; the device is valid until the read-side critical
+ * section ends.
+ *
+ * Return: the port of the non-local entry for @addr and @vid, or NULL if
+ * there is none or switchdev is not notified of it.
+ */
+struct net_device *br_switchdev_fdb_find_port(const struct net_device *br_dev,
+					      const unsigned char *addr,
+					      u16 vid)
+{
+	const struct net_bridge_port *p;
+	struct net_bridge_fdb_entry *f;
+
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "suspicious use outside RCU");
+
+	if (!netif_is_bridge_master(br_dev))
+		return NULL;
+
+	f = br_fdb_find_rcu(netdev_priv(br_dev), addr, vid);
+	if (!f || test_bit(BR_FDB_LOCAL, &f->flags) ||
+	    !br_switchdev_fdb_notifies(f))
+		return NULL;
+
+	/* learned by a switchdev driver, which is not notified back */
+	if (test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &f->flags) &&
+	    !test_bit(BR_FDB_ADDED_BY_USER, &f->flags))
+		return NULL;
+
+	p = br_fdb_dst_port(f);
+
+	return p ? p->dev : NULL;
+}
+EXPORT_SYMBOL_GPL(br_switchdev_fdb_find_port);
+
+void
+br_switchdev_fdb_notify(struct net_bridge *br,
+			const struct net_bridge_fdb_entry *fdb, int type)
+{
+	struct switchdev_notifier_fdb_info item;
+
+	if (!br_switchdev_fdb_notifies(fdb))
 		return;
 
 	br_switchdev_fdb_populate(br, &item, fdb, NULL);
-- 
2.53.0


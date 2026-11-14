Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696808;
	b=Lg5BeNyVXBMiEQ4pgdBPpLZxHae1KO7om5xSy5Vrzdxrf3t7dEs0AY7j91CfAd5//IWo
	 3XeaGCVxDtoI1UH854iGRe8+i1FfZn7+UXt7kzzi1yY1efNxxIXRXCD6OueQOddF/xiln
	 3m8Iis9LwyZSMhqeOCVAwhD/+QcHWBW7vzRR6ot4P8R3s7T6ydk/rQoTQrJtNhswFUWMM
	 cdxZ6A6+Z6QMpwxjG/tvic+KO0/yAj5SpgpVQZgZZGw0eegVvVdIjvioXvgU7XVVP8erB
	 W4e7KdK7KVcBblionZbWy1spKacS4PK8XTnsLACFUqNobDToNFkA9s4Gl4jVn4btsZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zfcSy76pYo4+KmPuxjlwpmlNL9IIkiVdSH2l/JZ+u80=;
	b=sxMWYXJCZFK9ztA3lQuS3BcdRoPGHTtqQtO+8eXZ6McCKNcaurgnniUp0THzsKfruamU
	 pFEdZWL5aKDC5aZSfSWscNehf6RuiGnVYIDbJKOd65L4M1/SAD51/5zOhanaQX01y/GVc
	 UjzAr+fn1wYshicYSJhuAjoznzu9Seiaq/Ykrein0kIE1Cr1agFbS7rQQI50QIQNfBt+W
	 CL9dGui250CI1J/nLCA/erLUOLtJcyTrKpuDeHksQyjrtMzyaq+3WuCxJMmAkRKFyE2UE
	 b1BfvfI3xfEWgeQXmIOCcJjGkl1Ao3C6nNXg8NBpZx5PXElz0GBzGYygawwnCgASW9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=WVDVM5XQ;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D448B606A337
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D448B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=WVDVM5XQ
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50aaad19fbso135116066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794696806; x=1795301606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfcSy76pYo4+KmPuxjlwpmlNL9IIkiVdSH2l/JZ+u80=;
        b=WVDVM5XQG3t/Bo7HS7Tigvyud05fMDOAaA8BPCeYOMI6LaIvUW2FX8gVx2f2baykr+
         d1TdeGs0Ul/DdFpwSaTgwfvK6i2Up0BHJzTCYhQAUDrheAUAaEgAFvXyW4M63SHSNMfL
         quvRbJt650ysIa5khgGUmixmcazBUEPPwfBDtpSHsL/Z9mz/o6FbiUfkVEJqT4RXnaCm
         YqLQNQi9hUD0IHinpo3nMI+JQ7FOohAqtx0tP/Ncd3wjS6Xs8pFIDRU3vIb4JiMqWTAf
         8qmdanyktukRUAS6BuacjKgppybfuy4tezD4EBQ3OF3PmbOo+6b2zL3PDhOO0Cdyn4x4
         AgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794696806; x=1795301606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfcSy76pYo4+KmPuxjlwpmlNL9IIkiVdSH2l/JZ+u80=;
        b=PA44QpP3RyR1dkHA4AdOI2RMeiVSy7ZftJf/OenrkJ8XLgezfgw1p6aI3dML/yxBir
         22uT9hUeiYX1DRnjLiMWenzXSaW4X2DGIFtzLsJSdP1mvW7//fRE6W3bU012SZIuv5vr
         K/fBeSKd3tw7UbFRuqg1qgpYEwQdRZbgcgiPDHxyxiJtVAtXodaOr2mpdm3Jv+2vjyZJ
         a9xtCzS8BJxDd84bjXgHFy5lMwU8raActCfcx1QALnWGhM0maftsH8WeWI21ONwW8iC2
         ygJd1rXENz/IBGNs0aLe43Cl96fNf3sCJmrCp94gbN8/EwBRBW7/vtTyiLPwfdhRngC3
         Du5g==
X-Forwarded-Encrypted: i=1; AL+hErEgJ9CG0pJ80KETBPuc+C5jFA3QLYKXtNaqOy5cEJ/HSJHhFv+X0ijvLMrSbeCNTrhf1regmYPu0TEAVIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z88Nnl5mmOq1HV/reASMbrYuFNsNkx8uHSqbdsOMvZnQnCk4atg
	t6tos1yK5AhqUheAqQTfLmpe2mWRkNajGTM16d2h5RtDKNSbljItPOlUS//YFBzOGw==
X-Gm-Gg: AYBFou1LfvmhD9eU06s6quiMEzPArp8IJ8B/TFvrW/O4CU89srqryQ7eopziAKkOYQr
	geFc5kL9C5ZV94EYGXB/jj85fKxQhw0fTrTJknC/b4vb9UUxlZW9rz742T5EL9fzmrlbYkuT5YV
	Y5ohG/YeIAbO2O4S+f4b0zwgN/ae5T06slYFloNgzUbP1pnEJ4EDc1J3bLgJJAnNEn/VXPLmCkq
	I9LzXLtI8jVcmYTbegeXnaBpEgIBficO4WMpgd31WaDyEoV8CJcxBE0Z+aJBpjakmAuJLhooAKe
	w1cw3iuPCm8lAP79/PjToFNHM6+4/tj3KnA4hCpw5FU51dTRxTTtwQn0AyV6KcQmjIFZHjR+/64
	urvC62YryduuMI5EygHcm9kb3vzP88gT5C33Kd9rjnQPYhyDCfAOgEIwannRU/TFlZUlno+4h9d
	DRA/mn+s8qX+tpAW81dX1XzEIa0/jFYb8QveFBkZSA3y06c5dAahExPiLiqc3YwCIeF5KKvYQ7C
	vyQ47caZrkghYphSl0hMa59c+WiDuFID+A1fA/8v2JjVCN3GE9FVDthNrMhXAiqCMJlROTDGBuZ
	Oi5Mgm6P+Uw4c6Hw7XezoKFWs3nk8fEwf7xbu9eEy7aeUSPwjXD8rBCqGHx0YwdTYacKuYSrYYj
	A6HdJ86KYrv609fK09SGeb1mMOkvKNaMKWi8/yur8IK9XRbiMW1Ay4cyv1919VDIdrjoC9GbCWk
	FbsTSw9nC6c673bGSD4Jvp3HQHwwbjkIXSe1dT+RTl43Zd9gqMtb2QagcsIhrEap06vBE1L88Ok
	nOj3FEaIkmyzwRmvau7SGIcEWY4vCrnuHi5IxlpCSDXexIsWGzFOHn2SOznapvBymMevUShauM1
	yimmCS+i+InQ6VW3XYTdSoFms02HlD9VaygRkZGHI8CWnivtOqcbyZ5DfYCh1n5sdbEm5G9apco
	CXcN4059HMw==
X-Received: by 2002:a17:906:9fcd:b0:c50:9149:48e4 with SMTP id a640c23a62f3a-c50963db437mr499324666b.11.1794696806243;
        Sat, 14 Nov 2026 14:53:26 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm262479666b.47.2026.11.14.14.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:53:25 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] net: bridge: switchdev: add br_switchdev_fdb_find_port()
Date: Sat, 14 Nov 2026 23:53:22 +0100
Message-ID: <ce6ea6a96b66c70b882832a07c36caf12193c6c2.1794696609.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794696608.git.julius@bairaktaris.de>
References: <cover.1794696608.git.julius@bairaktaris.de>
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

Add an RCU lookup that returns the device br_switchdev_fdb_notify()
reports an FDB entry on: its port, or the bridge for a local entry. It
does not find the entries whose addition the bridge does not notify to
switchdev: locked entries, entries the user added as "master dynamic",
and entries a switchdev driver learned.

A switchdev driver that handles FDB events from a workqueue cannot take
RTNL for br_fdb_find_port(), and has to look up where the bridge has an
entry when it handles an event. The next patch uses the helper for this
in DSA. The filter of br_switchdev_fdb_notify() moves into a helper that
both use, with no functional change; the learning path does not change.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2:
- Kernel-doc and message state what the lookup returns: the bridge for
  a local entry, the port otherwise, nothing for locked, "master
  dynamic" and driver-learned entries.
- Report whether the entry was added by the user.
- The message names the DSA caller.

 include/linux/if_bridge.h | 14 ++++++++
 net/bridge/br_switchdev.c | 72 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 77 insertions(+), 9 deletions(-)

diff --git a/include/linux/if_bridge.h b/include/linux/if_bridge.h
index 75673b8bffcb8..027147d618a4e 100644
--- a/include/linux/if_bridge.h
+++ b/include/linux/if_bridge.h
@@ -201,6 +201,20 @@ static inline int br_mst_get_state(const struct net_device *dev, u16 msti,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_BRIDGE) && IS_ENABLED(CONFIG_NET_SWITCHDEV)
+struct net_device *br_switchdev_fdb_find_port(struct net_device *br_dev,
+					      const unsigned char *addr,
+					      u16 vid, bool *added_by_user);
+#else
+static inline struct net_device *
+br_switchdev_fdb_find_port(struct net_device *br_dev,
+			   const unsigned char *addr, u16 vid,
+			   bool *added_by_user)
+{
+	return NULL;
+}
+#endif
+
 #if IS_ENABLED(CONFIG_BRIDGE)
 struct net_device *br_fdb_find_port(const struct net_device *br_dev,
 				    const unsigned char *addr,
diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
index 10f3aea6a1f82..f832657c0c22e 100644
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
@@ -156,9 +152,67 @@ br_switchdev_fdb_notify(struct net_bridge *br,
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
+ * br_switchdev_fdb_find_port - find the device a switchdev entry is reported on
+ * @br_dev: the bridge device
+ * @addr: the MAC address of the entry
+ * @vid: the VLAN of the entry
+ * @added_by_user: set to whether the entry was added by the user, may be NULL
+ *
+ * Must be called under RCU; the device is valid until the read-side critical
+ * section ends.
+ *
+ * Return: the device that br_switchdev_fdb_notify() reports the entry for
+ * @addr and @vid on: its port, or @br_dev for a local entry. NULL if there is
+ * no such entry, or if it is locked, was added with "master dynamic", or was
+ * learned by a switchdev driver, whose addition br_switchdev_fdb_notify()
+ * does not report.
+ */
+struct net_device *br_switchdev_fdb_find_port(struct net_device *br_dev,
+					      const unsigned char *addr,
+					      u16 vid, bool *added_by_user)
+{
+	const struct net_bridge_port *p;
+	struct net_bridge_fdb_entry *f;
+	bool by_user;
+
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "suspicious use outside RCU");
+
+	if (!netif_is_bridge_master(br_dev))
+		return NULL;
+
+	f = br_fdb_find_rcu(netdev_priv(br_dev), addr, vid);
+	if (!f || !br_switchdev_fdb_notifies(f))
+		return NULL;
+
+	by_user = test_bit(BR_FDB_ADDED_BY_USER, &f->flags);
+	if (!by_user && test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &f->flags))
+		return NULL;
+
+	if (added_by_user)
+		*added_by_user = by_user;
+
+	if (test_bit(BR_FDB_LOCAL, &f->flags))
+		return br_dev;
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


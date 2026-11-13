Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529973;
	b=s8Xv/WJSdinHYwJns6g1bG9NG0hNlQse78XTgEa55qTawN/IJmBp5ylNCj2Bq4QaHuy6
	 /wo+fLup3GR0DqIlzB3UAJhJk7jTWgfTeSVA9/lzMcbLb77FNNir9PZkep+M8XjwgAQ+2
	 hb3sEo/sXmT9zgW70em8NmKaehWSrMaugvw3re5yFWQfaqnwkf1FyRdeoVxQGAqqDDhIt
	 l+GulFoQk10szT5kE378EUGZMr2eXiCst8EjXM3aNWyL9oeXmliyrcc2bmz2sKdBuzDE7
	 U1/y44crGLAF5vfHn0diiRreLeL9AwkBLW6MIYbXr+UdsE+mMFCi8R0dcIgg6LclVlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gzJwJGqA9QMdUQ3iiH69qz7c5FpfkTATIbRSyZyT2vY=;
	b=Tg40lEtibchJz3ggRL3R/SY1/Gz0XzdEZoPHJU/AeRS7cjuOXCeGk/slEkwtmsZA7+FJ
	 Kvckg3+Sf9+tAMnDw9AIZiFHEFgmQE4pjWp9dvlSnTMN0Knj9qpShwcM9hPwUduRt7eaW
	 YE+KKfOjoXW2wkHSY21FuMF7tb9l1qm5IAalt29F/K90eye8mEyrkk/s5AiiRjs7ANlzV
	 9kFOSOrwJ+Ii9Eak8hQhJABvY5R/BXy9R6os0rxFuSRRVXKNaGOV1Lsj+AU+k1Lf3AhmS
	 CAi4qPWYJ6/W3XoHNRYTOfdEOnOvXnO5GDN+dq3fZIPCVJbqqUWnbV2own3EK6zgYQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWCRWe9i;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1ED60A6F4F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1ED60A6F4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWCRWe9i
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so136571f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529971; x=1795134771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gzJwJGqA9QMdUQ3iiH69qz7c5FpfkTATIbRSyZyT2vY=;
        b=IWCRWe9ihQRATYsqBHF20iykciCfKZP7OVKMd5pxoey2X0PWzSSzIGHMyPIx/iVOvk
         s1XF9wWaQgw/u4iHUerxFeMLHwAnR93brNYYpTRGpKjdjA4ZlyED1V8J+oLRH8LTNW8O
         MBvuwSa5iuFK48VE5sFWP4XKrsB/Z2dz8m/LUzoUjftTRpUgLC3KvafcUy9NNY2TPpAT
         d0Dawt1rvDPZ4iSywBHMXIfvzoCbaEnpLX76Q6oSJCYyOJAjDK8Lxr2DfmrkzYAK9jzl
         Q5KB0eFmBTs+IrvngnVRy2Di3IHlFKYDKzNbtMGxWiS0w+Z2DzfZYY30DjeTmESpWkgU
         cXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529971; x=1795134771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gzJwJGqA9QMdUQ3iiH69qz7c5FpfkTATIbRSyZyT2vY=;
        b=ntvv+j6HRVny6YqQKVnvDN1Q8ZqCfQtL0uGXO7spRJhs/CaPZFxBSiypMIXQGZ+FEI
         Cj8plQQ1gZlLHvmnHzWHqL39C/gB6Ijc7h9e9BXfaQIxPSQd/3nM5HZi2r1AKQ7Jttg5
         /mGx6ZZiPF1p5Z4p4Qr3FwgKnCR0dPiSIF0XzumTrWkDX9r1K+Wko95p4+BjX6X7EI+3
         DvK8tahF5StbOKQQJng6W9Tb0hoSrWg3iGs6c4mW9p/pvlbYKw5RseopYwujRBmla35a
         e0QQoJrdAl+ZYqlOOmHEeXvyD8DOjj+tVCby3qvnvPTREG06CmTFk3yWXZRWA63Oahpd
         13pw==
X-Forwarded-Encrypted: i=1; AL+hErFWHIlyB76FuZgs8KgANxxmTtGQfN1sOoS55r1HHV3Q7kK7vkYkCwE2n7VJaZi3V3XZ/cmDmSyWY66OsxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yulLfDoRfn7VCJh9nt5vlQd5Uos9Vn+iQ3XYrnStxqr+PfGHF
	kLAhRnCHNAQyYkafPB6y8z/lFoDGF4aLhAJ8FjZHHjGXUdfMfBRW9fZC
X-Gm-Gg: AYBFou3/7Z80cpdAZ67zDA0TAN6yHpNsWHz0t+MmbkQDtgghVsOM/xpuNwBwPdW4VuG
	57oHD0wHh29UWGiL1K2lJOBUhHOcOFYkReW2cynrC+/SeMQHMmbYAmMLpKG/od8ajIG7fvkwfTH
	RcNQ4siYuylmNPHdmgs+wrfzNy5P/XMqo22lRxFqfybQ5FRznInhLGghoyaeWXRMi0x4kzjTy1G
	RO9O7qRtSSFfKHXy+u0R+yNu51XyoVlYN8St0oxPnOhFEjtk9zKoAY5IrXTMiCe2GAbKpz1fmiE
	S04040umyfYQWEQkE9LiiEUPmN9C+3D5rCCs1JmEOaw8O4Yoikz7VlFoXRpaJ04C3/dNTO9a08v
	kVgJofNNSAhK3AwS0+lM1o/lNxgrytaUuHxIQYrmKDxfpt4RxPadPnIzfWs/DA59pVN7Tf8ozVl
	A8VM9Skfs9pA9xWAh2lUEC2H39G7U6NP0OFvCUBdJjYGEnZVFbch0+EJoq2Iyv+hexwhjhkVh7F
	NFEymRptBoIZ3pJ7pVoRMnYpYlhueCEBAslKfQ0fEzXgs4xhKWqkbUNqyhl5nmWC64VdDkJLtkM
	hXMjN5DlhIkKJ8R0CcckrnA1RlQSKGRwog5nIO3B6lgJPHkwqQOCeyYKqgeQUtu1MnwPXAzLHsB
	PG2bTWItQxtW/MKd8vGZsq9LQbMQGysXeyoHqavxNdHJIvae9x0y7bAZFvxBeVoYqPF5J73hpFz
	c=
X-Received: by 2002:adf:e003:0:20b0:48e:679a:4b03 with SMTP id ffacd0b85a97d-49c7467a911mr1512554f8f.45.1794529971402;
        Thu, 12 Nov 2026 16:32:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:50 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 09/15] net: phylink: support late PCS provider attach
Date: Fri, 13 Nov 2026 01:31:59 +0100
Message-ID: <20261113003217.197757-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Such PCS is then linked to the phylink instance and the supported
interfaces of the phylink instance get refreshed.

If we are in a major_config_failed scenario an interface reconfiguration
is triggered in the next phylink resolve.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     | 22 +++++++++++
 drivers/net/phy/phylink.c | 82 ++++++++++++++++++++++++++++++---------
 include/linux/pcs/pcs.h   | 31 +++++++++++++++
 3 files changed, 116 insertions(+), 19 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 25b3248e8b93..fef560eddf2a 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     pp);
+
 	pr_debug("Added pcs provider from %pfwf\n", fwnode);
 
 	return pp;
@@ -201,6 +205,24 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+	fwnode_handle_put(pcsspec.fwnode);
+	return pcs;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get_from_provider);
+
 bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 				 const struct fwnode_handle *fwnode,
 				 struct phylink_pcs *pl_pcs)
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 243110e21e4b..7f91cf3eb951 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2049,6 +2049,35 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static bool phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *tmp;
+
+	/*
+	 * Make sure state mutex is locked to protect concurrent
+	 * access to phylink instance PCS list from
+	 * initial fill_available_pcs and late PCS attach
+	 */
+	lockdep_assert_held(&pl->state_mutex);
+
+	/* Make sure PCS is not already in the list */
+	list_for_each_entry(tmp, &pl->pcs_list, list)
+		if (tmp == pcs)
+			return false;
+
+	if (WARN(rcu_access_pointer(pcs->phylink),
+		 "%s: PCS already attached to a phylink instance\n",
+		 __func__))
+		return false;
+
+	list_add_tail(&pcs->list, &pl->pcs_list);
+
+	/* Link PCS to phylink */
+	rcu_assign_pointer(pcs->phylink, pl);
+
+	return true;
+}
+
 static int phylink_fill_available_pcs(struct phylink *pl,
 				      struct phylink_config *config)
 {
@@ -2081,12 +2110,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		if (WARN(rcu_access_pointer(pcs->phylink),
-			 "%s: PCS already attached to a phylink instance\n",
-			 __func__))
-			continue;
-
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 out:
@@ -2133,26 +2157,50 @@ static int pcs_provider_notify(struct notifier_block *self,
 	struct fwnode_pcs_provider *pp = data;
 	struct phylink_pcs *pcs, *tmp;
 	bool resolve = false;
+	int count, i;
 
 	rtnl_lock();
 	mutex_lock(&pl->state_mutex);
 
-	/*
-	 * Loop all the PCS for phylink instance and check if
-	 * this notification is relevant for some of them.
-	 */
-	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
-		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
-			continue;
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		count = fwnode_phylink_pcs_count(pl->fwnode);
+		for (i = 0; i < count; i++) {
+			pcs = fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
+			if (IS_ERR_OR_NULL(pcs))
+				continue;
+
+			/* Trigger a resolve only if a PCS is actually added */
+			if (phylink_add_pcs(pl, pcs))
+				resolve = true;
+		}
+
+		/* Force an interface reconfig if major config fail */
+		if (resolve && pl->major_config_failed)
+			pl->force_major_config = true;
 
-		phylink_del_pcs(pl, pcs);
-		resolve = true;
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		/*
+		 * Loop all the PCS for phylink instance and check if
+		 * this notification is relevant for some of them.
+		 */
+		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+				continue;
+
+			phylink_del_pcs(pl, pcs);
+			resolve = true;
+		}
+		break;
 	}
 
 	/* Exit early if nothing has changed */
 	if (!resolve) {
 		mutex_unlock(&pl->state_mutex);
+
 		rtnl_unlock();
+
 		return NOTIFY_DONE;
 	}
 
@@ -2398,10 +2446,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		rcu_assign_pointer(pcs->phylink, pl);
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 83e0a2ad4b09..00a636c82c65 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
@@ -50,6 +51,28 @@ int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_get_from_provider() - Retrieve a PCS from a specific provider
+ * @provider: PCS provider to use
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index specifically provided by
+ * passed PCS provider.
+ *
+ * Unlike fwnode_pcs_get(), this function does not search the global list of
+ * PCS providers. The caller must provide the provider responsible for the
+ * referenced PCS.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative error pointer. Can
+ * return -ENODEV if the PCS is not present in global providers list (either
+ * due to driver still needs to be probed or it failed to probe/removed) or
+ * can return -EINVAL if the PCS provider doesn't expose any PCS for the fwnode.
+ */
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index);
+
 /**
  * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
  * @provider: PCS provider to check
@@ -120,6 +143,14 @@ static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwn
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+			     const struct fwnode_handle *fwnode,
+			     int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 					       const struct fwnode_handle *fwnode,
 					       struct phylink_pcs *pl_pcs)
-- 
2.55.0


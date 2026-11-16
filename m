Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846882;
	b=YSX45LsnN5DXQVvwVtSH6/rHG3p/20XzqB1aRw5Mcgl7QiI/N5bZkVy7xlq4j5FftPnx
	 6vQKPBxcqCgoHtHYEJncaIS6W9DhGy/qopAJ7iTD1/MP1ubq4+VkpZ6xW7jLFernW/Zma
	 GLXfVZlUUP2GB71Wuyejv9U5fycjBfSUsOtRv5SCfq+PNvlwgwMhQWGE83zi3nOSR04no
	 fxtZAKTKyHViRj101cPHNG9w80SqWMenqxKy0ADwKZjbCeVEtdHIbC4alE+BvjH34mgCh
	 yvKgrwdNVJQn+htFUHT2Qb5Km9BPyje5y5gqTkJbPIfyhj6jngN8ix6KUvi9TOFRWJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IMZDIAmIexFYZf4rJmQHIVcwyf38Z2Lf7rj79sceaaU=;
	b=BNoBrXYfMQwmZsoOSmXsKsO+rqeYuL8nR8eWbgiZmxyFqZnvTRTGlFheFi0hqI4NdGLm
	 sEjBckKo0LjL+ULhYhFLO6jObqvkXcXUPKmcjPbY3wBH+t18E2ABTqSaZTt04jTeaOag0
	 qmsVqtNgeE7YsSAe0O8/tOA57mCZ+WMqtDWvyt3la1tG3y0VM1TqAsM1CjIsu6AOyjGb9
	 jc8d9q8AqT9FDeNPhfHf1d94jpKho0fZ3u1/FJU7H/x6gc1qmA3Jzu4J1uj+08TVeNdM4
	 rogNnIvakerkxvdQCqbWGB76fSApWEoX6znToF7Cv+1P9Pucy1cMIX2V3RYi+fJxMRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yX39AmmD;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B008606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B008606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yX39AmmD
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so56397a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846880; x=1795451680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IMZDIAmIexFYZf4rJmQHIVcwyf38Z2Lf7rj79sceaaU=;
        b=yX39AmmDK3lZCou89DCrpQDsqruuUT6d0us/Fh8yzycj3pWTZfOkaO1eOY9K0BboeK
         KMrMo5cvVgT4K2yCkhd2zsaknKq7mOpf3ocoL3oW1SXSjGWZUBKmh1K3UkLz7xCSd/YN
         bR9/ZhtDjZA+sdanZJ+c6lADjm4hg+vhVvTPGGHfWGMop7PZ5thYszkOOOA0nNzOQNwl
         YIEXiho+vQOrY1To9ssAvN0NwGcjFtJiEu7zfv5gpHL4t/vy+qGQiOFo6p+cvE9Gk8Os
         FCBiVEis8oXbdkRen1jt1w//jDldz74FJRZWq+Z+vLr2R6J45PZv+yJ/FD4zi9v3SRvS
         qNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846880; x=1795451680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IMZDIAmIexFYZf4rJmQHIVcwyf38Z2Lf7rj79sceaaU=;
        b=RET4Cs8JPbh0fny3fTjByllzJVYicGh2RdAmyMLPl0JUCVJ0lF0YMsizgaWESWqzJd
         IBCblFHQfgyckT1+psByRsQaS26/3i+kQx0W9YMX4fzNpoWT1oq/HGmslnV8njDBHjJ9
         kM8zD6CT/Y/hcEHYxg6Ft8Y7HWCTgsAlFGTT3pFXrIbp91bwWluCWEpwEaLrqMkLQuPl
         HJswk45z4FJhe1z81tLyt6qGTmwM6Uds1jCZmYNkhuOw+w71xa4hOJY596tMd6NbRb2F
         JaNXBNMwJq8+pMp0Ma/l3iKBCMW9IY+fbCvPsRhpwDzF2hPRRotn6Oz4/iMu1JdyaZ/9
         88UA==
X-Forwarded-Encrypted: i=1; AL+hErHTHY9NakhkqG/7GlBhHfqL1oyWRdBH3Dz9jcEdX8YjgtTTvBcBnc+YUr40HCF7nf5jkXgq8YQ9kyLnOUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p+xHCg44ewoEhUb/wtNTYBotgUjSv+IVja4zaq4PmBZOzqZOK
	/kQCSWcU9WFDWon4SwurULQf7CaR8Iuv9zc1DdgPhtFUIMf8lDPeOhNL
X-Gm-Gg: AYBFou0A02MPHKvb4zLaWfQoBe2w57pIwyfFrTfApX8XjzzKmq7jguoeG0wmVmVGI8e
	I38rxSahCXybENNwgsX162LXP9VPH1XUynNJRPqzyGA8Cff7Awu7yy9fAuYQ8tmwb0cAd1bhuJ2
	39r2IdhAYm/WiEEy60QKfdYbm8W91xbccWgYaqld0oHf+TvTp4V+mC7N+tIIr3R4IySfXB9jyAi
	CDEu3xGV3eULrYbBdG+549txRjBuc752k8SeWmzcue0de8XHpr46oPOqQhYm4mz5Q5aD4d0hAVb
	LkLJRCtothqao+FrxESnBJ+tboPxFtXxwYszUAcZ3H1EJRNYjFdTjvM7Gdh1keXUm9NCZJfofUj
	szR+IUuz69ZisaOh/bFBPXlEg6f7HownDfiPcRhEYTGov5yn3qmyisakxYWlV+uqJHmfSZRLxKx
	IcXVKYRLHEEPK+ZnDN+CavtHbAcxPptRVopRJfjhR9Gl9NOQZ1Zj+X/3lXUn9ryvOQikAI8TN+1
	pzKSezQM0vCKVkdk0mt/93P4fVPB/mE7890EdRvySW75pIiN7Wo3nEqd2kpNSLo4J5xnXYBjap0
	9iqdaoHXzhOFxNKOtWTKK4y1+3a6JvFWx9m3XftTtbuT6lPeRGXixfNN0cIUomEC0FlmvKYHKrP
	ECQXHncVO0MaXDOKOLJnxWckHK5diIHtuqg==
X-Received: by 2002:a05:6402:15ce:b0:6b1:ce47:f54b with SMTP id 4fb4d7f45d1cf-6b79e2d4d72mr7707749a12.21.1794846879293;
        Mon, 16 Nov 2026 08:34:39 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:38 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 08/15] net: phylink: support PCS provider release
Date: Mon, 16 Nov 2026 17:33:52 +0100
Message-ID: <20261116163412.551438-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

Add support for release of fwnode PCS from a PCS provider.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_DEL every time
a new PCS provider is released.

phylink will then react to this event and will call the new function
fwnode_pcs_matches_provider() on each PCS of the phylink instance and
will check if the PCS is provided by the PCS provider that is getting
released.

If a related PCS is found, then such PCS is removed from the phylink
instance PCS list and the supported_interfaces value is updated.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Finally a phylink resolve is triggered to handle the PCS removal.

Protect every access of phylink pcs_list with state_mutex to handle async
PCS provider release and capabilities recalculation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  47 +++++++++
 drivers/net/phy/phylink.c | 203 ++++++++++++++++++++++++++++++++------
 include/linux/pcs/pcs.h   |  69 +++++++++++++
 3 files changed, 289 insertions(+), 30 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index b1d48f6eee7f..f234a4635417 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -22,6 +22,19 @@ struct fwnode_pcs_provider {
 
 static LIST_HEAD(fwnode_pcs_providers);
 static DEFINE_MUTEX(fwnode_pcs_mutex);
+static BLOCKING_NOTIFIER_HEAD(fwnode_pcs_notify_list);
+
+int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(register_fwnode_pcs_notifier);
+
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_fwnode_pcs_notifier);
 
 struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
 					    void *data)
@@ -74,6 +87,11 @@ void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	/* Signal phylink to release any PCS from this provider */
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_DEL,
+				     pp);
+
 	fwnode_handle_put(pp->fwnode);
 	kfree(pp);
 }
@@ -183,6 +201,35 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+				 const struct fwnode_handle *fwnode,
+				 struct phylink_pcs *pl_pcs)
+{
+	struct fwnode_reference_args pcsspec;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		struct phylink_pcs *pcs;
+
+		ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+		if (ret)
+			return false;
+
+		pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+		if (!IS_ERR(pcs) && pcs == pl_pcs) {
+			fwnode_handle_put(pcsspec.fwnode);
+			return true;
+		}
+
+		fwnode_handle_put(pcsspec.fwnode);
+		index++;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_matches_provider);
+
 unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	struct fwnode_reference_args out_args;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 921c227a5b3c..094a15f3dbcd 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -11,8 +11,10 @@
 #include <linux/gpio/consumer.h>
 #include <linux/lockdep.h>
 #include <linux/netdevice.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/pcs/pcs.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/phy_link_topology.h>
@@ -38,6 +40,7 @@ enum {
 	PCS_STATE_DOWN = 0,
 	PCS_STATE_STARTING,
 	PCS_STATE_STARTED,
+	PCS_STATE_DETACHING,
 };
 
 /**
@@ -70,6 +73,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -934,13 +938,15 @@ static int phylink_parse_fixedlink(struct phylink *pl,
 			     pl->link_config.speed);
 
 	mutex_lock(&pl->state_mutex);
+
 	ret = phylink_parse_fixedlink_capabilities(pl, &pl->link_config);
-	mutex_unlock(&pl->state_mutex);
 	if (ret)
 		phylink_warn(pl, "fixed link %s duplex %dMbps not recognised\n",
 			     pl->link_config.duplex == DUPLEX_FULL ? "full" : "half",
 			     pl->link_config.speed);
 
+	mutex_unlock(&pl->state_mutex);
+
 	pl->link_config.link = 1;
 	pl->link_config.an_complete = 1;
 
@@ -1154,6 +1160,9 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 					 phy_interface_t interface)
 {
 	struct phylink_pcs *pcs = NULL;
+	int ret = 0;
+
+	mutex_lock(&pl->state_mutex);
 
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config,
@@ -1170,9 +1179,14 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 	}
 
 	if (IS_ERR_OR_NULL(pcs))
-		return 0;
+		goto exit;
 
-	return phylink_pcs_inband_caps(pcs, interface);
+	ret = phylink_pcs_inband_caps(pcs, interface);
+
+exit:
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
 }
 
 static void phylink_pcs_poll_stop(struct phylink *pl)
@@ -1713,7 +1727,9 @@ static void phylink_mac_initial_config(struct phylink *pl, bool force_restart)
 	phylink_apply_manual_flow(pl, &link_state);
 	if (phy)
 		mutex_lock(&phy->lock);
+	mutex_lock(&pl->state_mutex);
 	phylink_major_config(pl, force_restart, &link_state);
+	mutex_unlock(&pl->state_mutex);
 	if (phy)
 		mutex_unlock(&phy->lock);
 }
@@ -2143,6 +2159,9 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	if (!pcss)
 		return -ENOMEM;
 
+	/* Lock state_mutex while filling to handle PCS notify */
+	mutex_lock(&pl->state_mutex);
+
 	ret = config->fill_available_pcs(config, pcss, config->num_possible_pcs);
 	if (ret < 0)
 		goto out;
@@ -2162,6 +2181,8 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	}
 
 out:
+	mutex_unlock(&pl->state_mutex);
+
 	kfree(pcss);
 
 	return ret;
@@ -2350,6 +2371,11 @@ static void phylink_update_capabilities(struct phylink *pl,
 							config->interface);
 			linkmode_copy(pl->supported, supported);
 			linkmode_copy(pl->advertising, config->advertising);
+		} else {
+			/* No SFP modes remain usable with the current interfaces. */
+			linkmode_zero(pl->supported);
+			linkmode_zero(pl->advertising);
+			linkmode_zero(config->advertising);
 		}
 
 		goto exit;
@@ -2425,6 +2451,133 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 }
 EXPORT_SYMBOL_GPL(phylink_update_mac_pause_capabilities);
 
+static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	ASSERT_RTNL();
+
+	lockdep_assert_held(&pl->state_mutex);
+
+	rcu_assign_pointer(pcs->phylink, NULL);
+	synchronize_rcu();
+	list_del(&pcs->list);
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by this phylink instance. If this is the case,
+	 * tear down the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		if (pl->old_link_state) {
+			phylink_link_down(pl);
+			pl->old_link_state = false;
+		}
+		if (pl->cfg_link_an_mode == MLO_AN_INBAND)
+			timer_delete_sync(&pl->link_poll);
+
+		if (pl->pcs_state != PCS_STATE_DOWN)
+			phylink_pcs_disable(pl->pcs);
+
+		if (!pl->phylink_disable_state)
+			pl->force_major_config = true;
+
+		WRITE_ONCE(pl->pcs, NULL);
+	}
+}
+
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	struct fwnode_pcs_provider *pp = data;
+	struct phylink_pcs *pcs, *tmp;
+	struct phy_device *phydev;
+	bool resolve = false;
+
+	rtnl_lock();
+	mutex_lock(&pl->phydev_mutex);
+	phydev = pl->phydev;
+	if (phydev)
+		mutex_lock(&phydev->lock);
+	mutex_lock(&pl->state_mutex);
+
+	/* phylink instance is being destroyed, ignore any event */
+	if (pl->pcs_state == PCS_STATE_DETACHING)
+		goto exit;
+
+	/*
+	 * Loop all the PCS for phylink instance and check if
+	 * this notification is relevant for some of them.
+	 */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+			continue;
+
+		phylink_del_pcs(pl, pcs);
+		resolve = true;
+	}
+
+	/* Exit early if nothing has changed */
+	if (!resolve)
+		goto exit;
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	/* Recalculate capabilities */
+	phylink_update_capabilities(pl, &pl->link_config);
+
+exit:
+	mutex_unlock(&pl->state_mutex);
+	if (phydev)
+		mutex_unlock(&phydev->lock);
+	mutex_unlock(&pl->phydev_mutex);
+	rtnl_unlock();
+
+	if (resolve)
+		phylink_run_resolve(pl);
+
+	return resolve ? NOTIFY_OK : NOTIFY_DONE;
+}
+
+static void phylink_detach_pcss(struct phylink *pl)
+{
+	struct phylink_pcs *pcs, *tmp;
+	bool rcu_sync = false;
+
+	mutex_lock(&pl->state_mutex);
+
+	pl->pcs_state = PCS_STATE_DETACHING;
+
+	/* Remove every PCS from phylink PCS list */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+		rcu_assign_pointer(pcs->phylink, NULL);
+		list_del(&pcs->list);
+		rcu_sync = true;
+	}
+
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		WRITE_ONCE(pl->pcs, NULL);
+		rcu_sync = true;
+	}
+
+	if (rcu_sync)
+		synchronize_rcu();
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Unregister notifier for late PCS attach */
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+}
+
 /**
  * phylink_create() - create a phylink instance
  * @config: a pointer to the target &struct phylink_config
@@ -2446,7 +2599,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 			       phy_interface_t iface,
 			       const struct phylink_mac_ops *mac_ops)
 {
-	struct phylink_pcs *tmp, *pcs;
+	struct phylink_pcs *pcs;
 	struct phylink *pl;
 	int ret;
 
@@ -2515,10 +2668,18 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	/* First register notifier for hotplug PCS events */
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	/* Fill the PCS list with available PCS from phylink config */
 	ret = phylink_fill_available_pcs(pl, config);
 	if (ret < 0)
-		goto free_pl;
+		goto unregister_pcs_notify;
+
+	mutex_lock(&pl->state_mutex);
 
 	/* Link available PCS to phylink */
 	list_for_each_entry(pcs, &pl->pcs_list, list)
@@ -2533,13 +2694,13 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	mutex_lock(&pl->state_mutex);
 	phylink_update_capabilities(pl, &pl->link_config);
+
 	mutex_unlock(&pl->state_mutex);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
-		goto unlink_pcs_list;
+		goto unregister_pcs_notify;
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 		ret = phylink_parse_fixedlink(pl, fwnode);
@@ -2558,14 +2719,10 @@ struct phylink *phylink_create(struct phylink_config *config,
 release_link_gpio:
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
-unlink_pcs_list:
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		rcu_assign_pointer(pcs->phylink, NULL);
-
-	synchronize_rcu();
-
-	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
-		list_del(&pcs->list);
+unregister_pcs_notify:
+	phylink_detach_pcss(pl);
+	/* previous PCS notifier might have queued a resolve, cancel it */
+	cancel_work_sync(&pl->resolve);
 free_pl:
 	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
@@ -2584,29 +2741,15 @@ EXPORT_SYMBOL_GPL(phylink_create);
  */
 void phylink_destroy(struct phylink *pl)
 {
-	struct phylink_pcs *pcs, *tmp;
-
 	sfp_bus_del_upstream(pl->sfp_bus);
 	phylink_destroy_sfp_cage_port(pl);
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
-	/* Remove phylink instance from every PCS */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		rcu_assign_pointer(pcs->phylink, NULL);
-
-	if (pl->pcs)
-		rcu_assign_pointer(pl->pcs->phylink, NULL);
-
-	if (pl->pcs || !list_empty(&pl->pcs_list))
-		synchronize_rcu();
+	phylink_detach_pcss(pl);
 
 	cancel_work_sync(&pl->resolve);
 
-	/* Remove every PCS from phylink PCS list */
-	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
-		list_del(&pcs->list);
-
 	fwnode_handle_put(pl->fwnode);
 
 	kfree(pl);
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index ef2134c578c7..83e0a2ad4b09 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,38 @@
 
 #include <linux/phylink.h>
 
+enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_DEL,
+};
+
+struct fwnode_pcs_provider;
+
 #if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * register_fwnode_pcs_notifier - Register a notifier block for fwnode
+ *				  PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Registers a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain. This allows phylink instance to subscribe for
+ * PCS provider events.
+ *
+ * Returns: 0 or a negative error.
+ */
+int register_fwnode_pcs_notifier(struct notifier_block *nb);
+
+/**
+ * unregister_fwnode_pcs_notifier - Unregister a notifier block for fwnode
+ *				    PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Unregisters a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain.
+ *
+ * Returns: 0 or a negative error.
+ */
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
+
 /**
  * fwnode_pcs_get - Retrieves a PCS from a firmware node
  * @fwnode: firmware node
@@ -19,6 +50,27 @@
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
+ * @provider: PCS provider to check
+ * @fwnode: firmware node containing the PCS references
+ * @pl_pcs: PCS to check
+ *
+ * Parse the PCS references from the "pcs-handle" property of a firmware node
+ * and use provider to determine whether pl_pcs is one of the PCS provided by
+ * provider.
+ *
+ * This function is intended to be used when handling provider removal
+ * notifications, where the provider is already known and its PCS need to be
+ * identified among the PCS associated with a phylink instance.
+ *
+ * Returns: true if pl_pcs is provided by provider and referenced by fwnode,
+ * false otherwise.
+ */
+bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+				 const struct fwnode_handle *fwnode,
+				 struct phylink_pcs *pl_pcs);
+
 /**
  * fwnode_phylink_pcs_count - Count PCS entries described in firmware node
  * @fwnode: firmware node
@@ -52,12 +104,29 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 			     struct phylink_pcs **available_pcs,
 			     unsigned int num_pcs);
 #else
+static inline int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 						 unsigned int index)
 {
 	return ERR_PTR(-ENOENT);
 }
 
+static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+					       const struct fwnode_handle *fwnode,
+					       struct phylink_pcs *pl_pcs)
+{
+	return false;
+}
+
 static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	return 0;
-- 
2.55.0


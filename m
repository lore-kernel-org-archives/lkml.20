Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD83411A04;
	Thu, 24 Sep 2026 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270766; cv=none; b=kB8o1tQQ40TVypbaDMsjYlFJaaDAO9t3teuadPSbhqH+V6H+/0iABBTwYuxZlZ/rzmMBQ4PwnMktA9v2ihP9nZpR3dUkDxvn+hc6rKF4ZkauQikO9q3g1Q7u9/VYBn9D9T238tVBWefYizK27ZneXf1W5+QV8pmqyfIuw1/OzSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270766; c=relaxed/simple;
	bh=/A6Hac4aqJzoz7kYkCtMzFY90tiyJ1AMuQj5SToK5yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bq6ZyYyP3d3qFItDbyKwwxrwXupKrDawHiir/HPQcQCnZ/IVkZENd15y14nkQRzyADIXcZ27PYZa6Z6jaqQF5hFTo/LwdeC9k4G6Om5O/iFEMQ/roQ79UGwwopKu+11vJoSITAi/AlGGyUD5T4jxxotLXE1s6A8+9bJy2LWVcc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BuCYkm7O; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BuCYkm7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=/A6Hac4aqJzoz7kYkCtMzFY90tiyJ1AMuQj5SToK5yc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BuCYkm7O8/c/A/J13rK2PGOkA5Kwrpsigb7+nckJWGhcX29RHlZlyjGebC2i+k1EX
	 Cei7sEVKB3GM4PKix0HDbIIVXdmo8ikY2JEFVhl45pRU3YawsKgXP2Bvi4hWgQPJeM
	 sWZD/OIzTyO1btKSxZ1GkT+DdYxdjeCWRtXEWDzGGW8Uce4sD8gn5Qkhutu0O2U7sZ
	 suG9VttbfcFOTg5ux5O0VOUI6ify5kO7GwzVlYOAdqs3Uahfwbfk34UwuB8K3Og/Dl
	 dGjgGZW/D0PNYCoLd0U8zgb0Wv6vW9jISb+26ZcOTANffSpdHqDqstM7agZp4Zo2OZ
	 qWpSMV8XIs4vQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC6F817E0A66;
	Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 99EF3480029; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Sep 2026 19:25:37 +0200
Subject: [PATCH v16 1/6] phy: core: add notifier infrastructure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6271;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/A6Hac4aqJzoz7kYkCtMzFY90tiyJ1AMuQj5SToK5yc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSkD8XXguWddTowlX8GYiiDtMyHhuu2Ly
 w37jmTNK/iOQokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qaz0EP/32KTqSMkJHSkirR/he9URPBF/sEzsZ/6xrE6X8d/gu2ks3u2cJ4cxEgZIsvegGeSFv
 nuyqXDvZF4pLQCj8R/4lT/+m2UY/gK4Hw8XBwgbAxnNQGWjg+qJU8fhridUuYwlQg0Z8wgiTuqU
 c3gQ1YLXEa/wceukRYmY/zT8xSXG5+vO2Sg0YXRnfw4tovUNFVjFFLBRAmLqh4mh/4Ql2doyV/x
 rq8PctNNcxH1B700QSb/SvFANcSR/GFn41pKt0b40dG24nL0AL2ztMFjekcuQmDGJQlCCQC4nyy
 jivFAaZbR4yVc6dDW482RaRa+TiyZkJDT3zhFgKm1FnNmSWW6F9Q0SPnry6JvjAZbKET7kI/FK/
 vK8zAW2wA9WJ8rJWbvRSUUv85qf6sPzTpblxOdgQIsSw1VCLNaqlfi2lqmX2Wl2oQQvLl5SOIUO
 326cAJiU2r6Lq7uApGfjnxXEkQRfQ/plPQwJ5n7u9QQopMMCfxOBhoDAleJVAok8FuTia+dI+2g
 0nrXpAo5tdBfkzD0I6PXBCeTDemNqK83OdH+SbwDtvcTXjXzaN5wAwXHN48BtVBJNTNguxyczvc
 TuKs4mjECZHiwrs6iaboycFcHWpMfZc7q7FnIq73VywxpwxnHpbpx44TVH84zO2Lpx7MeEJpiqJ
 WD2JyVbi13d1n1xsbTp4riA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
if the configuration changes or cable orientation changes. This is a
problem, as the consumer device will run into undefined behavior.

With the new PHY notifier API introduced in this patch, the consumer
driver can hook into reset events coming from a PHY device to handle the
PHY going down gracefully.

Note that this uses -ENOSYS instead of the more sensible -ENOTSUP for
the stub functions when GENERIC_PHY is disabled to stay consistent with
the existing ones.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/phy-core.c  | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h | 40 ++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..51d261daae7a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -542,6 +542,70 @@ int phy_notify_state(struct phy *phy, union phy_notify state)
 }
 EXPORT_SYMBOL_GPL(phy_notify_state);
 
+/**
+ * phy_register_notifier() - register a notifier for PHY events
+ * @phy: the phy returned by phy_get()
+ * @nb: notifier block to register
+ *
+ * Allows PHY consumers to receive notifications about PHY reset events.
+ * PHY providers can signal these events using phy_notify_reset().
+ *
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_register_notifier(struct phy *phy, struct notifier_block *nb)
+{
+	if (!phy)
+		return 0;
+
+	return blocking_notifier_chain_register(&phy->notifier, nb);
+}
+EXPORT_SYMBOL_GPL(phy_register_notifier);
+
+/**
+ * phy_unregister_notifier() - unregister a notifier for PHY events
+ * @phy: the phy returned by phy_get()
+ * @nb: notifier block to unregister
+ *
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_unregister_notifier(struct phy *phy, struct notifier_block *nb)
+{
+	if (!phy)
+		return 0;
+
+	return blocking_notifier_chain_unregister(&phy->notifier, nb);
+}
+EXPORT_SYMBOL_GPL(phy_unregister_notifier);
+
+/**
+ * phy_notify_reset() - notify consumers of a PHY reset event
+ * @phy: the phy that is being reset
+ * @event: the notification event (PRE_RESET or POST_RESET)
+ *
+ * Called by PHY providers to notify consumers that the PHY is about to
+ * be reset or has completed a reset. This allows consumers to quiesce
+ * hardware before the PHY becomes unavailable.
+ *
+ * This may be called from within PHY provider callbacks (e.g. set_mode,
+ * power_on) where phy->mutex is held. Consumer notification handlers must
+ * therefore NOT call back into the PHY framework (e.g. phy_power_off,
+ * phy_exit) on the same PHY, as this would result in a deadlock.
+ *
+ * Returns: %0 if successful or no notifiers registered, a negative error
+ * code if a notifier returns an error (for PRE_RESET only)
+ */
+int phy_notify_reset(struct phy *phy, enum phy_notification event)
+{
+	int ret;
+
+	if (!phy)
+		return 0;
+
+	ret = blocking_notifier_call_chain(&phy->notifier, event, phy);
+	return notifier_to_errno(ret);
+}
+EXPORT_SYMBOL_GPL(phy_notify_reset);
+
 /**
  * phy_configure() - Changes the phy parameters
  * @phy: the phy returned by phy_get()
@@ -1018,6 +1082,7 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
 	device_initialize(&phy->dev);
 	lockdep_register_key(&phy->lockdep_key);
 	mutex_init_with_key(&phy->mutex, &phy->lockdep_key);
+	BLOCKING_INIT_NOTIFIER_HEAD(&phy->notifier);
 
 	phy->dev.class = &phy_class;
 	phy->dev.parent = dev;
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..3779a4d0a02c 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -11,6 +11,7 @@
 #define __DRIVERS_PHY_H
 
 #include <linux/err.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/device.h>
 #include <linux/pm_runtime.h>
@@ -53,6 +54,16 @@ enum phy_media {
 	PHY_MEDIA_DAC,
 };
 
+/**
+ * enum phy_notification - PHY notification events
+ * @PHY_NOTIFY_PRE_RESET: PHY is about to be reset, consumers should quiesce
+ * @PHY_NOTIFY_POST_RESET: PHY reset is complete, consumers may resume
+ */
+enum phy_notification {
+	PHY_NOTIFY_PRE_RESET,
+	PHY_NOTIFY_POST_RESET,
+};
+
 enum phy_ufs_state {
 	PHY_UFS_HIBERN8_ENTER,
 	PHY_UFS_HIBERN8_EXIT,
@@ -170,6 +181,7 @@ struct phy_attrs {
  * @power_count: used to protect when the PHY is used by multiple consumers
  * @attrs: used to specify PHY specific attributes
  * @pwr: power regulator associated with the phy
+ * @notifier: notifier head for PHY reset events
  * @debugfs: debugfs directory
  */
 struct phy {
@@ -182,6 +194,7 @@ struct phy {
 	int			power_count;
 	struct phy_attrs	attrs;
 	struct regulator	*pwr;
+	struct blocking_notifier_head notifier;
 	struct dentry		*debugfs;
 };
 
@@ -267,6 +280,9 @@ int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
 int phy_notify_disconnect(struct phy *phy, int port);
 int phy_notify_state(struct phy *phy, union phy_notify state);
+int phy_register_notifier(struct phy *phy, struct notifier_block *nb);
+int phy_unregister_notifier(struct phy *phy, struct notifier_block *nb);
+int phy_notify_reset(struct phy *phy, enum phy_notification event);
 static inline int phy_get_bus_width(struct phy *phy)
 {
 	return phy->attrs.bus_width;
@@ -428,6 +444,30 @@ static inline int phy_notify_state(struct phy *phy, union phy_notify state)
 	return -ENOSYS;
 }
 
+static inline int phy_register_notifier(struct phy *phy,
+					struct notifier_block *nb)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
+static inline int phy_unregister_notifier(struct phy *phy,
+					  struct notifier_block *nb)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
+static inline int phy_notify_reset(struct phy *phy,
+				   enum phy_notification event)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
 static inline int phy_configure(struct phy *phy,
 				union phy_configure_opts *opts)
 {

-- 
2.53.0


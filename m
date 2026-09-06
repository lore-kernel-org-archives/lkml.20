Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5835E94F;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719827; cv=none; b=hB0V1Ij0a7hgdEDzocKpTTM6RgO79ao7GWagLHOcPVV7t9cRYu7N0rThtuQtCESm2dveAA3bWPJM56Y2hPsa6TW1x+ME8xw1VkXuC8M/QkNJT5J0bStBP69verDq2rQ9TcLI3JpXSLKrzmBaaa05+3dw1yoNQ9WOAEyqTiRhx8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719827; c=relaxed/simple;
	bh=DTWuRGoGwBcM1jGnxAkzk6R1cL0Y4ZnoYiAhUMuNaHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NT+2zAJz1OqVlsWqnIm6n2GHfZkp6Qqkg1yq5iC/BpG34BMFbr1OvnO+btfHcYpSkzy/9SVjf8L8Cwcx1yYgf/7jOWb+Fjec/yhAXHtxEX/dwI8SKbS6OZqCPk4YCFOuCU3kw4ankXfJ661S/LokitNmfsOCinMgEs+dDCWveUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZTWGnBu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZTWGnBu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46EB3C2BCB8;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=DTWuRGoGwBcM1jGnxAkzk6R1cL0Y4ZnoYiAhUMuNaHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QZTWGnBuEKsEkvFlW7AdIR1z6spjpuihDfH16nnxKgUfN/CTdnQd8hjTfjnE1JSef
	 1O9MDQ0T4119Ngp/TeTbXQZzY4xoyL9tSwXfUh6ZkO+yRWfcucBuqNA2c+f9H14gJ3
	 uFy+UV1C6lR4eQmK7GxU6aY5vCC0bfY1/tDEkArGhweM1DxyCiw0SjJf7VJhDA+rJZ
	 Gi+DnxyzQCedCxagVJCYFPOuTM8ucqh7m0ech5KrAxa29xONP4FJ4LG/PioqBdxOch
	 XlBcHFl9h3dhODsPLAdODH3ryVMFFP2sRVkSE7FssqZF2CdW4jX/JYd8SC/0WBIOwT
	 6w0Uc9jLZQ42g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2690FC79F8C;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:24 +0200
Subject: [PATCH v2 01/22] usb: typec: Add alternate mode state notifiers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5945; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=DTWuRGoGwBcM1jGnxAkzk6R1cL0Y4ZnoYiAhUMuNaHk=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTTvX7XKrMNssNHvL2jO9X7SW17ybzmu/rSdt7XXjp
 5a2l/MvdJSyMIhxMciKKbJs329v+uThG8Glmy69h5nDygQyhIGLUwAmcqmU4X/Am4pD875f0N64
 ZlZmYdsk2+plr0UqeKYErJ7Gn3ll0dEbjAyTt2Rd8LgRrvGW7fi5N6rOU+6lu/qxXL0ZtfaaU/d
 l4/N8AA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The Apple Silicon USB4/Thunderbolt driver needs to be made aware of
cable details and whenever USB4 or Thunderbolt is entered. The cable
details are already available as part of the typec subsystem but there
is no way to get a notification on typec_altmode_update_active() so
far.

Add a blocking notifier chain to each alternate mode and call it
whenever the mode is activated or deactivated right next to the already
existing sysfs and kobject_uevent notifications. Replay activations when a
notifier is registered.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/bus.h   |  6 +++++
 drivers/usb/typec/class.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h | 16 +++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 7df5deb1dd3a..4dc60c48c91e 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -3,6 +3,8 @@
 #ifndef __USB_TYPEC_ALTMODE_H__
 #define __USB_TYPEC_ALTMODE_H__
 
+#include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/usb/typec_altmode.h>
 
 struct typec_mux;
@@ -23,6 +25,10 @@ struct altmode {
 
 	struct altmode			*partner;
 	struct altmode			*plug[2];
+
+	/* Serializes active state changes and notifier registration. */
+	struct mutex			state_lock;
+	struct blocking_notifier_head	state_notifier;
 };
 
 #define to_altmode(d) container_of(d, struct altmode, adev)
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 54c7810b563b..5808a3ef0d6c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -299,8 +299,11 @@ static void typec_altmode_put_partner(struct altmode *altmode)
  */
 void typec_altmode_update_active(struct typec_altmode *adev, bool active)
 {
+	struct altmode *alt = to_altmode(adev);
 	char dir[6];
 
+	guard(mutex)(&alt->state_lock);
+
 	if (adev->active == active)
 		return;
 
@@ -312,6 +315,10 @@ void typec_altmode_update_active(struct typec_altmode *adev, bool active)
 	}
 
 	adev->active = active;
+	blocking_notifier_call_chain(&alt->state_notifier,
+				     active ? TYPEC_ALTMODE_ENTERED :
+					      TYPEC_ALTMODE_EXITED,
+				     adev);
 	snprintf(dir, sizeof(dir), "mode%d", adev->mode);
 	sysfs_notify(&adev->dev.kobj, dir, "active");
 	sysfs_notify(&adev->dev.kobj, NULL, "active");
@@ -319,6 +326,56 @@ void typec_altmode_update_active(struct typec_altmode *adev, bool active)
 }
 EXPORT_SYMBOL_GPL(typec_altmode_update_active);
 
+/**
+ * typec_altmode_register_notifier - Register an alternate mode state notifier
+ * @adev: Handle to the alternate mode
+ * @nb: Notifier block
+ *
+ * The notifier is called synchronously when the mode represented by @adev is
+ * entered or exited. If @adev is already active %TYPEC_ALTMODE_ENTERED will be
+ * emitted before this function returns. Callbacks must not update the state of
+ * @adev or register or unregister another notifier for @adev. They must also
+ * handle failures locally and return %NOTIFY_OK or %NOTIFY_DONE so that other
+ * subscribers also receive the event. Callback return values do not affect the
+ * active state or the result of notifier registration.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int typec_altmode_register_notifier(struct typec_altmode *adev,
+				    struct notifier_block *nb)
+{
+	struct altmode *alt = to_altmode(adev);
+	int ret;
+
+	guard(mutex)(&alt->state_lock);
+	ret = blocking_notifier_chain_register(&alt->state_notifier, nb);
+	if (!ret && adev->active)
+		nb->notifier_call(nb, TYPEC_ALTMODE_ENTERED, adev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(typec_altmode_register_notifier);
+
+/**
+ * typec_altmode_unregister_notifier - Unregister an alternate mode notifier
+ * @adev: Handle to the alternate mode
+ * @nb: Notifier block
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int typec_altmode_unregister_notifier(struct typec_altmode *adev,
+				      struct notifier_block *nb)
+{
+	struct altmode *alt = to_altmode(adev);
+	int ret;
+
+	guard(mutex)(&alt->state_lock);
+	ret = blocking_notifier_chain_unregister(&alt->state_notifier, nb);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(typec_altmode_unregister_notifier);
+
 /**
  * typec_altmode2port - Alternate Mode to USB Type-C port
  * @alt: The Alternate Mode
@@ -658,6 +715,8 @@ typec_register_altmode(struct device *parent,
 	alt->adev.mode_selection = desc->mode_selection;
 	alt->roles = desc->roles;
 	alt->id = id;
+	mutex_init(&alt->state_lock);
+	BLOCKING_INIT_NOTIFIER_HEAD(&alt->state_notifier);
 
 	alt->attrs[0] = &dev_attr_vdo.attr;
 	alt->attrs[1] = &dev_attr_description.attr;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 10a783b738ef..914a6f0844c5 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -19,6 +19,7 @@ struct typec_plug;
 struct typec_port;
 struct typec_altmode_ops;
 struct typec_cable_ops;
+struct notifier_block;
 
 struct bus_type;
 struct fwnode_handle;
@@ -184,6 +185,21 @@ struct typec_port *typec_altmode2port(struct typec_altmode *alt);
 
 void typec_altmode_update_active(struct typec_altmode *alt, bool active);
 
+/**
+ * enum typec_altmode_event - USB Type-C alternate mode state event
+ * @TYPEC_ALTMODE_ENTERED: The alternate mode has been entered
+ * @TYPEC_ALTMODE_EXITED: The alternate mode has been exited
+ */
+enum typec_altmode_event {
+	TYPEC_ALTMODE_ENTERED,
+	TYPEC_ALTMODE_EXITED,
+};
+
+int typec_altmode_register_notifier(struct typec_altmode *alt,
+				    struct notifier_block *nb);
+int typec_altmode_unregister_notifier(struct typec_altmode *alt,
+				      struct notifier_block *nb);
+
 void typec_altmode_set_ops(struct typec_altmode *alt,
 			   const struct typec_altmode_ops *ops);
 

-- 
2.55.0



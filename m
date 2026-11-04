Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800457;
	b=Eny42mUB+FN5MfLmkbvNJUC52vTuMhC8QurKJxHLNFd5a1MipGpKMrOBA8x6Ifdv+YHe
	 zTY3KDKzwPhsagf0Fmb5qQImo7OWl7TGv5bI0AD3IdS2G8/SJ8w7k6KTusST0dJeKKNjX
	 5qotgDb+b1YbICXl90988RsK5wmD83jiJHoAm4OKCnOFztjeMlF6OHGN4RF9dBF9TpOfH
	 mmXHK71q4hDCnCwtRA8scwpqc7dV/UgRJQj1KFiAyyzoYdyYemtdXdIDaNykkTAMZ7+g+
	 H8JGN8+AVXjm4XM44bMkoiyg3aa81vZTP539jMDDuPiO81RRfmwiaDxhjEYHPVilzDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800457;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=KXWsfCTbP99dKvnOvNUmW9FX4HvI1neRV0ljbIJqsJo=;
	b=qSuvhpznkbCR7GGfVpOClZ5jUfLRzNS/aW3pHqci35c3a16HEqzntZwhEFZfRavkm7GE
	 T1+IrxuYBN0Q6lzxDp79oCl47gYa49xz7Zs9afGXCQhsUCB3qojAScd961lHX2zvmhgdK
	 KJxYIF2pnbT2MmDx5VpckNga+3Q1K1y/0kKHcnoFABwfRjjv7m62clhBDKa/uDzcK83cv
	 zuof8z+DPDVzFxgQoHfE9nugYnGtYUplAGl9yobRQZGUAkpyp8wpStaSXoh7qie6Mdso7
	 4jVTOeVSsI5H16oQN5CdtPjb24FWzTuyJNo/I37t2SAwI+PIRRVkJle88FU9dMYgnFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v0KM+dtQ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AC3606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AC3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v0KM+dtQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 816E44E413FD;
	Wed,  4 Nov 2026 13:54:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46BDB60770;
	Wed,  4 Nov 2026 13:54:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77156103291D1;
	Wed,  4 Nov 2026 14:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793800450; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KXWsfCTbP99dKvnOvNUmW9FX4HvI1neRV0ljbIJqsJo=;
	b=v0KM+dtQSu+ydryIX0cqHVw61gh9ioS3J2Mbpr2IwGKeMhROp1Wq1nmobEGkIrB1tIJNNh
	6ZrRYy8NH9Nb6U/hjT2CJRLZH+Tgmlqz7PvztL7diZezg57wg49gzywgpbssVbIFsY9Y1p
	Bn9x1wguPBxvtwj3pTYgULowLYQiau2CKlwteSUiVlhsJxwbJlaXhMPT6GcZL/YYWFNXov
	uTrBwUP80EOIy1jAnW1Gjx5+mfMbVQonowc58VAyfbOMM2dl9b8M8v5A4BfGut4Ow7AYKX
	SYt19uRYoMS51ZiRXeiZjdJBUE7SWJw1IRxIwfMY60CAdX5DLVv2oquuLFA6Qg==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v9 3/3] i2c: {mux,atr}: Create missing devlink between mux/atr and adapter physical device
Date: Wed,  4 Nov 2026 14:53:06 +0100
Message-ID: <20261104135324.492692-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104135324.492692-1-herve.codina@bootlin.com>
References: <20261104135324.492692-1-herve.codina@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

When removing an i2c controller device handling an i2c bus where an i2c
mux is connected to, the removal process hangs and is stuck in the
wait_completion() call done in i2c_del_adapter().

The i2c_del_adapter() tries to removed the i2c adapter related to the
i2c controller device and the wait_completion() is waiting for the i2c
adapter device release. This release is performed when the device is no
more used (i.e. refcount reaches zero).

When an i2c mux (and/or atr) is involved in an i2c path, the struct dev
topology is the following:

    +----------------+                +-------------------+
    | i2c controller |                |    i2c mux/atr    |
    |     device     |                |      device       |
    |       ^        |                |                   |
    |       |        |                |                   |
    |  dev's parent  |                |                   |
    |       |        |                |                   |
    |   i2c adapter  |                | i2c adapter chanX |
    |     device  <---- dev's parent ------  device       |
    |   (no driver)  |                |    (no driver)    |
    +----------------+                +-------------------+

When an i2c mux/atr device creates an i2c adapter for its downstream
channel, a reference is taken to its adapter dev's parent. This parent
is the i2c mux/atr upstream adapter device.

No relationship exists between the i2c mux/atr device itself and the i2c
controller device (physical device) in order to have the i2c mux/atr
device calling i2c_del_adapter() to remove its downstream adapters and so,
release references taken to the upstream adapter.

This consumer/supplier relationship is typically a devlink relationship.

Also, i2c muxes/atrs can be chained and so, the upstream adapter can be
supplied by either an i2c controller device or an other i2c mux/atr
device.

In order to get the physical device of the adapter a mux/atr is
connected to, rely on the newly introduced i2c_adapter_get_physdev() and
create the missing devlink between the i2c mux/atr device and the
physical device of the adapter the mux/atr is connected to.

With that done, the i2c mux/atr device is removed before the device
handling the upstream i2c adapter (i2c controller device or i2c mux/atr
device). All references are released and the i2c_del_adapter() call
performed by driver handling the upstream adapter device is not blocking
anymore.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-atr.c | 25 +++++++++++++++++++++++++
 drivers/i2c/i2c-mux.c | 25 +++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index a591d39050e7..94ff543d4f8e 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -788,9 +788,11 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 	struct fwnode_handle *bus_handle = desc->bus_handle;
 	struct i2c_adapter *parent = atr->parent;
 	char symlink_name[ATR_MAX_SYMLINK_LEN];
+	struct device *parent_physdev;
 	struct device *dev = atr->dev;
 	u32 chan_id = desc->chan_id;
 	struct i2c_atr_chan *chan;
+	struct device_link *dl;
 	int ret, idx;
 
 	if (chan_id >= atr->max_adapters) {
@@ -866,6 +868,29 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, struct i2c_atr_adap_desc *desc)
 
 	atr->adapter[chan_id] = &chan->adap;
 
+	/*
+	 * There is no relationship set between the atr device and the physical
+	 * device handling the parent adapter. Create this missing relationship
+	 * in order to remove the i2c atr device (consumer) and so the dowstream
+	 * channel adapters before removing the physical device (supplier) which
+	 * handles the i2c atr upstream adapter.
+	 */
+	parent_physdev = i2c_get_adapter_physdev(parent);
+	if (!parent_physdev) {
+		dev_err(dev, "failed to get the parent physical device\n");
+		ret = -ENODEV;
+		goto err_free_alias_pool;
+	}
+	dl = device_link_add(dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!dl) {
+		dev_err(dev, "failed to create device link to %s\n",
+			dev_name(parent_physdev));
+		put_device(parent_physdev);
+		ret = -EINVAL;
+		goto err_free_alias_pool;
+	}
+	put_device(parent_physdev);
+
 	ret = i2c_add_adapter(&chan->adap);
 	if (ret) {
 		atr->adapter[chan_id] = NULL;
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index c1836114ef56..0cfb581b4ef1 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -314,7 +314,9 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
 	struct i2c_adapter *parent = muxc->parent;
+	struct device *parent_physdev;
 	struct i2c_mux_priv *priv;
+	struct device_link *dl;
 	char symlink_name[20];
 	int ret;
 
@@ -382,6 +384,29 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 				      ACPI_COMPANION(muxc->dev),
 				      chan_id);
 
+	/*
+	 * There is no relationship set between the mux device and the physical
+	 * device handling the parent adapter. Create this missing relationship
+	 * in order to remove the i2c mux device (consumer) and so the dowstream
+	 * channel adapters before removing the physical device (supplier) which
+	 * handles the i2c mux upstream adapter.
+	 */
+	parent_physdev = i2c_get_adapter_physdev(parent);
+	if (!parent_physdev) {
+		dev_err(muxc->dev, "failed to get the parent physical device\n");
+		ret = -ENODEV;
+		goto err_free_priv;
+	}
+	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!dl) {
+		dev_err(muxc->dev, "failed to create device link to %s\n",
+			dev_name(parent_physdev));
+		put_device(parent_physdev);
+		ret = -EINVAL;
+		goto err_free_priv;
+	}
+	put_device(parent_physdev);
+
 	if (force_nr) {
 		priv->adap.nr = force_nr;
 		ret = i2c_add_numbered_adapter(&priv->adap);
-- 
2.56.0


Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E643991A;
	Mon, 31 Aug 2026 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184686; cv=none; b=ptBAQ7r29QZebI5crDGZ5A4JYs9PrKWF625qtdcjCybAIvsIJM7RaGCkkR5frbBIxkAC7qIaQkIbZYq9dxQaLmNV5+kbprxDVot3Os1e5HVY1eoe1f7eTy9kLIKmVKvqmZS8FbYCc87frUaMKYteVu2CwNY/Zvjr8U+Q6IvStfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184686; c=relaxed/simple;
	bh=5x6eyZL3KeacQRtY502kcsA7e2/9nrjI9oWpDKZdl6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O0P39WG+34/N+M+hwzeo6Dx/42oJ/VGj9NFWEMxAjvNjCRM811r+EiPTH/44xArSoTCxbmgwNAgWSft4nAeOf6xYo8fE+oCkECxM41vZk0OwKyi6BT2p2aRs4bHsNggbApMuBXRoF6kORZzE5CVOEdLySAcHl3wLchR9Pwt0uFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=nUXYRNfK; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="nUXYRNfK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EC503ECDF;
	Mon, 31 Aug 2026 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1788184676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Zgk3FVA8ow3sKZEteLhLW287twMeuC706ojFG3zILk=;
	b=nUXYRNfKkZIkLf7A0jNKijEZXmd9jBJ3ySBQt4rTVV2qavYanvw3HiD/GON3/RuWXAQhDW
	SDzb+oT/uHPqj77vRe3innkK3RjCWJf8fxsMcfCwIKgNwhCELtKN0UnKRxaBhzHVfTrieB
	xi7Ojl0pfs8qLKbD0w0MqzAbUnqJfUzZzrBR8N7ns6xyUvg+hIsX2ACGcniB4qmzTNewXG
	/VcEOOPIsgoxAurzUyhR65bT2/PmmmnQmastx50x3JheNScaKyuf8vTh1vgIZpgT9KXler
	FhB928qszbycQzv3uTINLyQnK/mEa4CfSICWbB/U91aA247tPf6nsfo3xq193Q==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Date: Mon, 31 Aug 2026 15:57:22 +0200
Subject: [PATCH v4 1/2] usb: gadget: f_hid: allow setting different
 interval for each speed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-usb_hid_interval-v4-1-609394103dcb@marmottus.net>
References: <20260831-usb_hid_interval-v4-0-609394103dcb@marmottus.net>
In-Reply-To: <20260831-usb_hid_interval-v4-0-609394103dcb@marmottus.net>
To: linux-usb@vger.kernel.org
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Ben Hoff <hoff.benjamin.k@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, Arthur Crepin Leblond <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFGg+hKjD0JXmpjNOBP/ePK88mvn/SjcjXCDdSuo/VAARZow+WKvzvMMsroPir72nQUJgR7IJU2IpUAhDasXpZJfdGK/zcy/WaEC3Iw4CQ0nCkvh59/vx1orKJHBiDXmX3qhyaaj/CnGz1csKmSpgXJO/yEswl0sVaDkJGiu6My6IWdR699q+WvsZSFTgpKbcafv6/BXWjDcMFihRJnkPBt759SGKSvjS/pI3p7e847jEE5v2COUyVjQQzeu8EPz1WnTsHg9fDLFNjLfBjrRRUaYb61dUiA5bhQgQcFx6diV/mnRgDbzmAneZE0xvu6zarqL1LED2VfJaPuWMO2svwsDeHLbcdGTCRawpi7TsJOiONfDE8qYQcY8petoJfpUHDaFth8CDqnp/I7IFRMtrVHWlAFNoRZNEj5V3KABDJSGWRB0VDuEDJHS0Ji8yFhbDMsxknRagPCFlP4rQqIh7BfuUuGTKkwFGid0E6BMXxJqQpSKz9p0sZL2qMVZCau/e/P9tLykbqAT09yBfQ21YUwQ5hO7ekNy8BDTLX7ePL0b9ZgLQgQqv9UUD94aUNUMdw6tL/9gL728Dnnlk9hHw5/XRCWayZEKlVKbdiiGcVSZUyPBWjSBtZwLgR/NcKdk9tZ24RGRVUHQJ52qxnDedRGBHHK+W5/czpih8LPwGxH5A

The HID polling interval unit depends on the USB speed:

 - Full speed: the units are in milliseconds
 - High/Super speed: the units are in micro-frames of 0.125ms

Exposing directly the bInterval means that the user needs to know
which speed is currently in use and has to convert it accordingly.

The solution is to expose the interval for each speed:
 - interval_fs: bInterval for full-speed
 - interval_hs: bInterval for high-speed
 - interval_ss: bInterval for super-speed
 - interval: legacy attribute that takes precedence over the per-speed
attributes and sets the same bInterval for each speed to keep backward
compatibility.

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
 drivers/usb/gadget/function/f_hid.c | 194 ++++++++++++++++++++++--------------
 drivers/usb/gadget/function/u_hid.h |   9 +-
 2 files changed, 125 insertions(+), 78 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..689253f5b0c0 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -30,6 +30,11 @@
  */
 #define GET_REPORT_TIMEOUT_MS 2500
 
+/* Default bInterval values */
+#define HIDG_DEFAULT_FS_BINTERVAL 10
+#define HIDG_DEFAULT_HS_BINTERVAL 4
+#define HIDG_DEFAULT_SS_BINTERVAL 4
+
 static int major, minors;
 
 static const struct class hidg_class = {
@@ -63,7 +68,9 @@ struct f_hidg {
 	char				*report_desc;
 	unsigned short			report_length;
 	unsigned char			interval;
-	bool				interval_user_set;
+	struct f_hid_opt_interval	interval_fs;
+	struct f_hid_opt_interval	interval_hs;
+	struct f_hid_opt_interval	interval_ss;
 
 	/*
 	 * use_out_ep - if true, the OUT Endpoint (interrupt out method)
@@ -1204,16 +1211,24 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 
-	/* IN endpoints: FS default=10ms, HS default=4µ-frame; user override if set */
-	if (!hidg->interval_user_set) {
-		hidg_fs_in_ep_desc.bInterval = 10;
-		hidg_hs_in_ep_desc.bInterval = 4;
-		hidg_ss_in_ep_desc.bInterval = 4;
-	} else {
-		hidg_fs_in_ep_desc.bInterval = hidg->interval;
-		hidg_hs_in_ep_desc.bInterval = hidg->interval;
-		hidg_ss_in_ep_desc.bInterval = hidg->interval;
-	}
+	/* IN endpoints: set defaults unless user set */
+	if (hidg->interval_fs.user_set)
+		hidg_fs_in_ep_desc.bInterval = hidg->interval_fs.value;
+	else
+		hidg_fs_in_ep_desc.bInterval =
+			HIDG_DEFAULT_FS_BINTERVAL;
+
+	if (hidg->interval_hs.user_set)
+		hidg_hs_in_ep_desc.bInterval = hidg->interval_hs.value;
+	else
+		hidg_hs_in_ep_desc.bInterval =
+			HIDG_DEFAULT_HS_BINTERVAL;
+
+	if (hidg->interval_ss.user_set)
+		hidg_ss_in_ep_desc.bInterval = hidg->interval_ss.value;
+	else
+		hidg_ss_in_ep_desc.bInterval =
+			HIDG_DEFAULT_SS_BINTERVAL;
 
 	hidg_ss_out_comp_desc.wBytesPerInterval =
 				cpu_to_le16(hidg->report_length);
@@ -1238,16 +1253,28 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 		hidg_fs_out_ep_desc.bEndpointAddress;
 
 	if (hidg->use_out_ep) {
-		/* OUT endpoints: same defaults (FS=10, HS=4) unless user set */
-		if (!hidg->interval_user_set) {
-			hidg_fs_out_ep_desc.bInterval = 10;
-			hidg_hs_out_ep_desc.bInterval = 4;
-			hidg_ss_out_ep_desc.bInterval = 4;
-		} else {
-			hidg_fs_out_ep_desc.bInterval = hidg->interval;
-			hidg_hs_out_ep_desc.bInterval = hidg->interval;
-			hidg_ss_out_ep_desc.bInterval = hidg->interval;
-		}
+		/* OUT endpoints: set defaults unless user set */
+		if (hidg->interval_fs.user_set)
+			hidg_fs_out_ep_desc.bInterval =
+				hidg->interval_fs.value;
+		else
+			hidg_fs_out_ep_desc.bInterval =
+				HIDG_DEFAULT_FS_BINTERVAL;
+
+		if (hidg->interval_hs.user_set)
+			hidg_hs_out_ep_desc.bInterval =
+				hidg->interval_hs.value;
+		else
+			hidg_hs_out_ep_desc.bInterval =
+				HIDG_DEFAULT_HS_BINTERVAL;
+
+		if (hidg->interval_ss.user_set)
+			hidg_ss_out_ep_desc.bInterval =
+				hidg->interval_ss.value;
+		else
+			hidg_ss_out_ep_desc.bInterval =
+				HIDG_DEFAULT_SS_BINTERVAL;
+
 		status = usb_assign_descriptors(f,
 			    hidg_fs_descriptors_intout,
 			    hidg_hs_descriptors_intout,
@@ -1334,14 +1361,17 @@ static const struct configfs_item_operations hidg_item_ops = {
 	.release	= hid_attr_release,
 };
 
-#define F_HID_OPT(name, prec, limit)					\
-static ssize_t f_hid_opts_##name##_show(struct config_item *item, char *page)\
+#define F_HID_OPT_U(name, prec, limit)					\
+static ssize_t f_hid_opts_##name##_show(struct config_item *item,	\
+					char *page)			\
 {									\
 	struct f_hid_opts *opts = to_f_hid_opts(item);			\
 	int result;							\
+	u##prec value;							\
 									\
 	mutex_lock(&opts->lock);					\
-	result = sprintf(page, "%d\n", opts->name);			\
+	value = get_hid_opt_##name(opts);				\
+	result = sysfs_emit(page, "%d\n", value);			\
 	mutex_unlock(&opts->lock);					\
 									\
 	return result;							\
@@ -1368,7 +1398,7 @@ static ssize_t f_hid_opts_##name##_store(struct config_item *item,	\
 		ret = -EINVAL;						\
 		goto end;						\
 	}								\
-	opts->name = num;						\
+	set_hid_opt_##name(opts, num);					\
 	ret = len;							\
 									\
 end:									\
@@ -1378,11 +1408,54 @@ end:									\
 									\
 CONFIGFS_ATTR(f_hid_opts_, name)
 
+#define F_HID_OPT(name, prec, limit)					\
+static void set_hid_opt_##name(struct f_hid_opts *opts, u##prec val)	\
+{									\
+	opts->name = val;						\
+}									\
+static u##prec get_hid_opt_##name(struct f_hid_opts *opts)		\
+{									\
+	return opts->name;						\
+}									\
+F_HID_OPT_U(name, prec, limit)
+
+#define F_HID_OPT_INTERVAL(name)					\
+static void set_hid_opt_##name(struct f_hid_opts *opts, u8 val)		\
+{									\
+	opts->name.value = val;						\
+	opts->name.user_set = true;					\
+}									\
+static u8 get_hid_opt_##name(struct f_hid_opts *opts)			\
+{									\
+	return opts->name.value;					\
+}									\
+F_HID_OPT_U(name, 8, 255)
+
 F_HID_OPT(subclass, 8, 255);
 F_HID_OPT(protocol, 8, 255);
 F_HID_OPT(no_out_endpoint, 8, 1);
 F_HID_OPT(report_length, 16, 65535);
 
+F_HID_OPT_INTERVAL(interval_fs);
+F_HID_OPT_INTERVAL(interval_hs);
+F_HID_OPT_INTERVAL(interval_ss);
+
+static void set_hid_opt_interval(struct f_hid_opts *opts, u8 val)
+{
+	set_hid_opt_interval_fs(opts, val);
+	set_hid_opt_interval_hs(opts, val);
+	set_hid_opt_interval_ss(opts, val);
+
+	opts->interval = val;
+}
+
+static u8 get_hid_opt_interval(struct f_hid_opts *opts)
+{
+	return opts->interval;
+}
+
+F_HID_OPT_U(interval, 8, 255);
+
 static ssize_t f_hid_opts_report_desc_show(struct config_item *item, char *page)
 {
 	struct f_hid_opts *opts = to_f_hid_opts(item);
@@ -1428,58 +1501,11 @@ static ssize_t f_hid_opts_report_desc_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_hid_opts_, report_desc);
 
-static ssize_t f_hid_opts_interval_show(struct config_item *item, char *page)
-{
-	struct f_hid_opts *opts = to_f_hid_opts(item);
-	int result;
-
-	mutex_lock(&opts->lock);
-	result = sprintf(page, "%d\n", opts->interval);
-	mutex_unlock(&opts->lock);
-
-	return result;
-}
-
-static ssize_t f_hid_opts_interval_store(struct config_item *item,
-		const char *page, size_t len)
-{
-	struct f_hid_opts *opts = to_f_hid_opts(item);
-	int ret;
-	unsigned int tmp;
-
-	mutex_lock(&opts->lock);
-	if (opts->refcnt) {
-		ret = -EBUSY;
-		goto end;
-	}
-
-	/* parse into a wider type first */
-	ret = kstrtouint(page, 0, &tmp);
-	if (ret)
-		goto end;
-
-	/* range-check against unsigned char max */
-	if (tmp > 255) {
-		ret = -EINVAL;
-		goto end;
-	}
-
-	opts->interval = (unsigned char)tmp;
-	opts->interval_user_set = true;
-	ret = len;
-
-end:
-	mutex_unlock(&opts->lock);
-	return ret;
-}
-
-CONFIGFS_ATTR(f_hid_opts_, interval);
-
 static ssize_t f_hid_opts_dev_show(struct config_item *item, char *page)
 {
 	struct f_hid_opts *opts = to_f_hid_opts(item);
 
-	return sprintf(page, "%d:%d\n", major, opts->minor);
+	return sysfs_emit(page, "%d:%d\n", major, opts->minor);
 }
 
 CONFIGFS_ATTR_RO(f_hid_opts_, dev);
@@ -1490,6 +1516,9 @@ static struct configfs_attribute *hid_attrs[] = {
 	&f_hid_opts_attr_no_out_endpoint,
 	&f_hid_opts_attr_report_length,
 	&f_hid_opts_attr_interval,
+	&f_hid_opts_attr_interval_hs,
+	&f_hid_opts_attr_interval_fs,
+	&f_hid_opts_attr_interval_ss,
 	&f_hid_opts_attr_report_desc,
 	&f_hid_opts_attr_dev,
 	NULL,
@@ -1537,8 +1566,13 @@ static struct usb_function_instance *hidg_alloc_inst(void)
 		return ERR_PTR(-ENOMEM);
 	mutex_init(&opts->lock);
 
-	opts->interval = 4;
-	opts->interval_user_set = false;
+	opts->interval = HIDG_DEFAULT_HS_BINTERVAL;
+	opts->interval_fs.value = HIDG_DEFAULT_FS_BINTERVAL;
+	opts->interval_fs.user_set = false;
+	opts->interval_hs.value = HIDG_DEFAULT_HS_BINTERVAL;
+	opts->interval_hs.user_set = false;
+	opts->interval_ss.value = HIDG_DEFAULT_SS_BINTERVAL;
+	opts->interval_ss.user_set = false;
 
 	opts->func_inst.free_func_inst = hidg_free_inst;
 	ret = &opts->func_inst;
@@ -1628,8 +1662,14 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->bInterfaceProtocol = opts->protocol;
 	hidg->report_length = opts->report_length;
 	hidg->report_desc_length = opts->report_desc_length;
-	hidg->interval = opts->interval;
-	hidg->interval_user_set = opts->interval_user_set;
+
+	hidg->interval_fs.value = opts->interval_fs.value;
+	hidg->interval_fs.user_set = opts->interval_fs.user_set;
+	hidg->interval_hs.value = opts->interval_hs.value;
+	hidg->interval_hs.user_set = opts->interval_hs.user_set;
+	hidg->interval_ss.value = opts->interval_ss.value;
+	hidg->interval_ss.user_set = opts->interval_ss.user_set;
+
 	if (opts->report_desc) {
 		hidg->report_desc = kmemdup(opts->report_desc,
 					    opts->report_desc_length,
diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
index a9ed9720caee..e666cd9968eb 100644
--- a/drivers/usb/gadget/function/u_hid.h
+++ b/drivers/usb/gadget/function/u_hid.h
@@ -15,6 +15,11 @@
 
 #include <linux/usb/composite.h>
 
+struct f_hid_opt_interval {
+	unsigned char value;
+	bool user_set;
+};
+
 struct f_hid_opts {
 	struct usb_function_instance	func_inst;
 	int				minor;
@@ -26,7 +31,9 @@ struct f_hid_opts {
 	unsigned char			*report_desc;
 	bool				report_desc_alloc;
 	unsigned char			interval;
-	bool				interval_user_set;
+	struct f_hid_opt_interval	interval_fs;
+	struct f_hid_opt_interval	interval_hs;
+	struct f_hid_opt_interval	interval_ss;
 
 	/*
 	 * Protect the data form concurrent access by read/write

-- 
2.55.0


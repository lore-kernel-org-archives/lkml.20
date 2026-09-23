Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38010329C7C;
	Wed, 23 Sep 2026 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174688; cv=none; b=bccDWz5XmF8udcHslr6PykkIca7JUAYd/PKOf3olPagi60g+YutS4pkG/fr9GXaLTF7qPElScDrSEBVjfCakF7YqJIJpKbS582cVF5lPQ52k7rAzp2b08EfmYJt6chv8rC6l95r/FAeErnOeyJdS54GfdfkEcLibeOyv6TRzS5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174688; c=relaxed/simple;
	bh=iFeBR66bMMxpCFGg97+uLtxJhu7/l/HwXGvb3eN0hbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWCpq6cBqwGKv5azqK0pBwonNoxcJxqGmhckRnaRZZ2yzA7Ar4Fw4Ure3xmYUj0kyDAu2D3I+PXrqNoGcD/3BtEiLciUA8293WEiP9g+PRnzOmQPawEp4NqDoAIgVPLPuHgKnenr0kCXSE3sgO7MSNK1anmNQkM/+jh/kdhVWjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=CtMEI7zg; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="CtMEI7zg"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C359D3F08A;
	Wed, 23 Sep 2026 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1790174679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZM1YqPOqcVbkjo3zrWMPUPpm5DwL6i2T5wqbMYOcPHc=;
	b=CtMEI7zgqBrYclk2NgMa9kypPSduAIe6sWlvFWsmAV0OuArbpNQYKX5wkM8oDHXKbeEXic
	R/pKL5Xo8bsralMwDeKZ522jOg3XCof46pGTrnlCB/GLWGRPif2L3h1zWgyeXiQgF78LC5
	6l6GzVF5P1Y85W3iolDJXTEXD0YGwBnXg+12TMNvBFErMsGMxsgeQ9FNoQ8q6HVHkZcyiL
	XQ7bmhU7F97Rs9NvaJDnZwxXs5OVvVLfRafBJdkxk/j1DCwrBiyksZSFr8iFtwnlX+e1xg
	HilkP9SZW9Vpy3yHzadjB61xDT4g45jEXgOzfWh2N9m0drAzb47FM8peYPoagw==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Date: Wed, 23 Sep 2026 16:44:15 +0200
Subject: [PATCH v5 1/2] usb: gadget: f_hid: allow setting different
 interval for each speed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-usb_hid_interval-v5-1-7e0e2879ba8b@marmottus.net>
References: <20260923-usb_hid_interval-v5-0-7e0e2879ba8b@marmottus.net>
In-Reply-To: <20260923-usb_hid_interval-v5-0-7e0e2879ba8b@marmottus.net>
To: linux-usb@vger.kernel.org
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Ben Hoff <hoff.benjamin.k@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, Arthur Crepin Leblond <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFVVpC0VY/T5b5xqUMGYTw/xxgKsZzbx+eDRQGaXt4G54x8tXt8FzLtfvVwRCBQM7L6Os36JN5SYKIn3ME2iOa0foQ44rwuwuuY/NblhQW28aDWa9xdbqnJAr4M9kfPuyihXJE0fVpaAguEKwOEEpVntMjeffmKDBgOeVwUY5cla2FBUDNPtrvMlTUAgAzSMRJKzPPbxbu5LVmq45tLkmdCWSiFhoFdKayC6zxuEb3PNX1FyRrXJFBbxC/FQitatOC5ikuD/oZ4QX6ndT+l6Ch/QWX4CwHDqOJWY2zhYOIjnWOpgeSPAtHSCAyXlphbehFBSjQoOmUVUEXK3BCk9F1cDZezNedpPMBb212H64k4OjDeIBQSoNdkkXsN6AZoS5vfVmzIIjbAe9QD1Jzuxju5wbAP7xLVg0SitGH61WtUcTUHTatrC5/dRosgoG8r2gP22cxKhtESP26A7qF9wvzEoHb6no6BJNJGRQEVWDfFKZMQeGDnoe6g6n70sP/cxx9w0JbEPvOdmJzbc82IIaRBB0gMJQVhs20n3cJWQt5h6RugfJYVPKfageRiR/WUY+WL9HX4FUvparaiNdC7x/iO036UfjWVvHuI6DM2DuHmBcx4RmYSNaEIQmV6qnNjyPxKLoN78hmrLejt+CHjIE5bHX9+VYCF/aSz9f4N0fSX0A

The HID bInterval field is interpreted differently depending on the
USB speed:

 - Full speed: bInterval is linear, in milliseconds (1 to 255)
 - High/Super speed: bInterval is logarithmic, encoding the interval
   as 2^(bInterval-1) * 125us (microframes)

Exposing directly the bInterval means that the user needs to know
which speed is currently in use and has to convert it accordingly.

The solution is to expose the interval for each speed:
 - interval_fs: bInterval for full-speed
 - interval_hs: bInterval for high-speed
 - interval_ss: bInterval for super-speed
 - interval: legacy bInterval that overwrites the per-speed bInterval
   to keep backward compatibility

When the user sets the legacy interval attribute, all the other
per-speed interval attributes are set to this value.
As a minor side effect, when the user sets a per-speed attribute,
the value of the legacy interval attribute (when using show) is out of
sync. This is not an issue as backward compatibility is kept when
using the legacy interval attribute only.

The interval_user_set field has been removed since the different speed
values are now set when the legacy interval is stored.

Use sysfs_emit() instead of sprintf().

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
 drivers/usb/gadget/function/f_hid.c | 140 ++++++++++++++++--------------------
 drivers/usb/gadget/function/u_hid.h |   4 +-
 2 files changed, 66 insertions(+), 78 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..9f7e5a841f4b 100644
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
@@ -62,8 +67,9 @@ struct f_hidg {
 	unsigned short			report_desc_length;
 	char				*report_desc;
 	unsigned short			report_length;
-	unsigned char			interval;
-	bool				interval_user_set;
+	unsigned char			interval_fs;
+	unsigned char			interval_hs;
+	unsigned char			interval_ss;
 
 	/*
 	 * use_out_ep - if true, the OUT Endpoint (interrupt out method)
@@ -1204,16 +1210,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
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
+	/* IN endpoints */
+	hidg_fs_in_ep_desc.bInterval = hidg->interval_fs;
+	hidg_hs_in_ep_desc.bInterval = hidg->interval_hs;
+	hidg_ss_in_ep_desc.bInterval = hidg->interval_ss;
 
 	hidg_ss_out_comp_desc.wBytesPerInterval =
 				cpu_to_le16(hidg->report_length);
@@ -1238,16 +1238,11 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
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
+		/* OUT endpoints */
+		hidg_fs_out_ep_desc.bInterval = hidg->interval_fs;
+		hidg_hs_out_ep_desc.bInterval = hidg->interval_hs;
+		hidg_ss_out_ep_desc.bInterval = hidg->interval_ss;
+
 		status = usb_assign_descriptors(f,
 			    hidg_fs_descriptors_intout,
 			    hidg_hs_descriptors_intout,
@@ -1334,14 +1329,16 @@ static const struct configfs_item_operations hidg_item_ops = {
 	.release	= hid_attr_release,
 };
 
-#define F_HID_OPT(name, prec, limit)					\
+#define F_HID_OPT_U(name, prec, limit)				\
 static ssize_t f_hid_opts_##name##_show(struct config_item *item, char *page)\
 {									\
 	struct f_hid_opts *opts = to_f_hid_opts(item);			\
 	int result;							\
+	u##prec val;							\
 									\
 	mutex_lock(&opts->lock);					\
-	result = sprintf(page, "%d\n", opts->name);			\
+	val = f_hid_opts_get_##name(opts);				\
+	result = sysfs_emit(page, "%d\n", val);				\
 	mutex_unlock(&opts->lock);					\
 									\
 	return result;							\
@@ -1368,7 +1365,7 @@ static ssize_t f_hid_opts_##name##_store(struct config_item *item,	\
 		ret = -EINVAL;						\
 		goto end;						\
 	}								\
-	opts->name = num;						\
+	f_hid_opts_set_##name(opts, num);				\
 	ret = len;							\
 									\
 end:									\
@@ -1378,10 +1375,39 @@ end:									\
 									\
 CONFIGFS_ATTR(f_hid_opts_, name)
 
+#define F_HID_OPT(name, prec, limit)					\
+static u##prec f_hid_opts_get_##name(const struct f_hid_opts *opts)	\
+{									\
+	return opts->name;						\
+}									\
+									\
+static void f_hid_opts_set_##name(struct f_hid_opts *opts, u##prec val)	\
+{									\
+	opts->name = val;						\
+}									\
+F_HID_OPT_U(name, prec, limit)
+
+static u8 f_hid_opts_get_interval(const struct f_hid_opts *opts)
+{
+	return opts->interval;
+}
+
+static void f_hid_opts_set_interval(struct f_hid_opts *opts, u8 val)
+{
+	opts->interval = val;
+	opts->interval_fs = val;
+	opts->interval_hs = val;
+	opts->interval_ss = val;
+}
+
 F_HID_OPT(subclass, 8, 255);
 F_HID_OPT(protocol, 8, 255);
 F_HID_OPT(no_out_endpoint, 8, 1);
 F_HID_OPT(report_length, 16, 65535);
+F_HID_OPT(interval_fs, 8, 255);
+F_HID_OPT(interval_hs, 8, 255);
+F_HID_OPT(interval_ss, 8, 255);
+F_HID_OPT_U(interval, 8, 255);
 
 static ssize_t f_hid_opts_report_desc_show(struct config_item *item, char *page)
 {
@@ -1428,58 +1454,11 @@ static ssize_t f_hid_opts_report_desc_store(struct config_item *item,
 
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
@@ -1490,6 +1469,9 @@ static struct configfs_attribute *hid_attrs[] = {
 	&f_hid_opts_attr_no_out_endpoint,
 	&f_hid_opts_attr_report_length,
 	&f_hid_opts_attr_interval,
+	&f_hid_opts_attr_interval_fs,
+	&f_hid_opts_attr_interval_hs,
+	&f_hid_opts_attr_interval_ss,
 	&f_hid_opts_attr_report_desc,
 	&f_hid_opts_attr_dev,
 	NULL,
@@ -1537,8 +1519,10 @@ static struct usb_function_instance *hidg_alloc_inst(void)
 		return ERR_PTR(-ENOMEM);
 	mutex_init(&opts->lock);
 
-	opts->interval = 4;
-	opts->interval_user_set = false;
+	opts->interval = HIDG_DEFAULT_HS_BINTERVAL;
+	opts->interval_fs = HIDG_DEFAULT_FS_BINTERVAL;
+	opts->interval_hs = HIDG_DEFAULT_HS_BINTERVAL;
+	opts->interval_ss = HIDG_DEFAULT_SS_BINTERVAL;
 
 	opts->func_inst.free_func_inst = hidg_free_inst;
 	ret = &opts->func_inst;
@@ -1628,8 +1612,10 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->bInterfaceProtocol = opts->protocol;
 	hidg->report_length = opts->report_length;
 	hidg->report_desc_length = opts->report_desc_length;
-	hidg->interval = opts->interval;
-	hidg->interval_user_set = opts->interval_user_set;
+	hidg->interval_fs = opts->interval_fs;
+	hidg->interval_hs = opts->interval_hs;
+	hidg->interval_ss = opts->interval_ss;
+
 	if (opts->report_desc) {
 		hidg->report_desc = kmemdup(opts->report_desc,
 					    opts->report_desc_length,
diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
index a9ed9720caee..34c9bf550cc5 100644
--- a/drivers/usb/gadget/function/u_hid.h
+++ b/drivers/usb/gadget/function/u_hid.h
@@ -26,7 +26,9 @@ struct f_hid_opts {
 	unsigned char			*report_desc;
 	bool				report_desc_alloc;
 	unsigned char			interval;
-	bool				interval_user_set;
+	unsigned char			interval_fs;
+	unsigned char			interval_hs;
+	unsigned char			interval_ss;
 
 	/*
 	 * Protect the data form concurrent access by read/write

-- 
2.55.0


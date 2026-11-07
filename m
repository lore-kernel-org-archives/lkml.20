Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025411;
	b=0c87V3Biaqt7W8tO2vnVR7rdIdj6L3beHOYAFdiwAnlCU8uZUzUOVvPuZvXlqT9DQeVI
	 1lmk1Cj13Ya2Tf5vmbdbbjaO3nVduiPq2KHsfKu1P65prBMmZlWwuxZ0oyko7SJiQPv75
	 Jwqpp/OXHzOJkXVbbogivUw67MdPfUHFs67zf69oZh3xJnXBjUpyrvlIIpQUAoq2VzXGj
	 PJQmBlsRr7Os8HKKslMGJM5f1KTEWKcyKbOc7cq/3srtCzRoeKBzBVbS6yRzmbUhiAsIU
	 I0Zf1lvEY2EIJuHwxn9yjyLD97Na0oNAOB+icmbihDbfyl5yrTFL0fWsuKqzdkGjN2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025411;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YCG45hStsAZCLZKJIj0iE4XgrtZLHlDfdEKtn8toJ1I=;
	b=NWWPQC8hRi9FWm7N/CC2ynoKVSGiUqX+kiN4kI3hirAWCEWAM7bvjFe2GQPZm9ts+5ps
	 FeyTkyOTGmtOXu4JuBgRGslxGuLGfFwMd+6JZ6+1/3x4QZ3sq1/mFG3IALxESQJw3dybf
	 bZvNOZ5XeUKgMD4rYGvNXEGY2BTAk6I55ArYtbaMtXFkVjbJLdab1E3qlbnWYQjXAUEGr
	 w8nsQdz8lwNDMnNVxRzdnxvV4FfJoiBZURn7psgYDzT1JgpNCAuyqfYhEnclMF3tuYISl
	 xH9p/8M42QBlEHKqIhMPF3zp6Yk6UuAte3HCwwrB2QFP8NRi81bf4L/QrpaCo/+t/tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=RaxCboaI;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF99606A326;
	Sat,  7 Nov 2026 04:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF99606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=RaxCboaI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1794025407;
	bh=f1fjC0/ABFaIvBeWJc/RJRKdyk8zIpTo3w5q9sd+MjM=;
	h=From:Date:Subject:To:Cc:From;
	b=RaxCboaImtYqFqFVD27Rxy+pHd6I8eyPEK9LlH8THf5Pk405QglEi5N8V1FxJOwPl
	 KdtROlPtXVG/FQsRcMAJDB65NgdEp/aC9nqtlJOu0cLHC8CSGqmmscU1DyPCXnuqRX
	 x4FR+G64YTAK89ayI6WfsAELYaBg/oAcvC/DfafA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 07 Nov 2026 04:23:14 +0000
Subject: [PATCH] usb: Constify struct configfs_attribute pointers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261107-b4-configfs-const-usb-v1-1-2a2afda5817f@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQrCMBBEf6Xs2YUmxC76K+LBpJu6HlLNJiKU/
 rup9jYPZt4soJyFFc7dApnfojKnBubQQbjf0sQoY2OwvR2M6Qm9wzCnKFPULWjBqh7dYI80eiJ
 HJ2jbZ+Yon5/3cv2zVv/gUDbZ3sj8qu2w7LV1/QKoSo6LjgAAAA==
X-Change-ID: 20261107-b4-configfs-const-usb-46257db77479
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794025402; l=39287;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=f1fjC0/ABFaIvBeWJc/RJRKdyk8zIpTo3w5q9sd+MjM=;
 b=X7QWltuxkGj1Cz0d6Kxe+z/tdjbKfgjppUuAAloNOQ8rMtEOWPVpbV9pz5927WRiWnUtsntMU
 hXhroHEQ3CEA61AfbkzVWqjsRtLcKY7r/g10d0sAdagBKtLfa6ufPUg
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

In preparation for the constification of configfs attributes, make the
pointers to struct configfs_attribute in drivers/usb/ const
and use the new ct_attrs_const field of struct config_item_type.

Skip f_tcm.c as its attributes are registered through the
scsi target subsystem and will constified as part of that.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/usb/gadget/configfs.c                | 34 +++++++--------
 drivers/usb/gadget/function/f_acm.c          |  4 +-
 drivers/usb/gadget/function/f_ecm.c          |  4 +-
 drivers/usb/gadget/function/f_eem.c          |  4 +-
 drivers/usb/gadget/function/f_fs.c           |  4 +-
 drivers/usb/gadget/function/f_hid.c          |  4 +-
 drivers/usb/gadget/function/f_loopback.c     |  4 +-
 drivers/usb/gadget/function/f_mass_storage.c |  8 ++--
 drivers/usb/gadget/function/f_midi.c         |  4 +-
 drivers/usb/gadget/function/f_midi2.c        | 12 +++---
 drivers/usb/gadget/function/f_ncm.c          |  4 +-
 drivers/usb/gadget/function/f_obex.c         |  4 +-
 drivers/usb/gadget/function/f_phonet.c       |  4 +-
 drivers/usb/gadget/function/f_printer.c      |  4 +-
 drivers/usb/gadget/function/f_rndis.c        |  4 +-
 drivers/usb/gadget/function/f_serial.c       |  4 +-
 drivers/usb/gadget/function/f_sourcesink.c   |  4 +-
 drivers/usb/gadget/function/f_subset.c       |  4 +-
 drivers/usb/gadget/function/f_uac1.c         |  4 +-
 drivers/usb/gadget/function/f_uac1_legacy.c  |  4 +-
 drivers/usb/gadget/function/f_uac2.c         |  4 +-
 drivers/usb/gadget/function/uvc_configfs.c   | 64 ++++++++++++++--------------
 include/linux/usb/gadget_configfs.h          |  2 +-
 23 files changed, 96 insertions(+), 96 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 51df6d1d1487..6b684c2ffe1f 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -363,7 +363,7 @@ CONFIGFS_ATTR(gadget_dev_desc_, bcdUSB);
 CONFIGFS_ATTR(gadget_dev_desc_, UDC);
 CONFIGFS_ATTR(gadget_dev_desc_, max_speed);
 
-static struct configfs_attribute *gadget_root_attrs[] = {
+static const struct configfs_attribute *const gadget_root_attrs[] = {
 	&gadget_dev_desc_attr_bDeviceClass,
 	&gadget_dev_desc_attr_bDeviceSubClass,
 	&gadget_dev_desc_attr_bDeviceProtocol,
@@ -573,7 +573,7 @@ static ssize_t gadget_config_desc_bmAttributes_store(struct config_item *item,
 CONFIGFS_ATTR(gadget_config_desc_, MaxPower);
 CONFIGFS_ATTR(gadget_config_desc_, bmAttributes);
 
-static struct configfs_attribute *gadget_config_attrs[] = {
+static const struct configfs_attribute *const gadget_config_attrs[] = {
 	&gadget_config_desc_attr_MaxPower,
 	&gadget_config_desc_attr_bmAttributes,
 	NULL,
@@ -581,13 +581,13 @@ static struct configfs_attribute *gadget_config_attrs[] = {
 
 static const struct config_item_type gadget_config_type = {
 	.ct_item_ops	= &gadget_config_item_ops,
-	.ct_attrs	= gadget_config_attrs,
+	.ct_attrs_const	= gadget_config_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
 static const struct config_item_type gadget_root_type = {
 	.ct_item_ops	= &gadget_root_item_ops,
-	.ct_attrs	= gadget_root_attrs,
+	.ct_attrs_const	= gadget_root_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -675,7 +675,7 @@ static const struct config_item_type functions_type = {
 
 GS_STRINGS_RW(gadget_config_name, configuration);
 
-static struct configfs_attribute *gadget_config_name_langid_attrs[] = {
+static const struct configfs_attribute *const gadget_config_name_langid_attrs[] = {
 	&gadget_config_name_attr_configuration,
 	NULL,
 };
@@ -780,7 +780,7 @@ GS_STRINGS_RW(gadget_language, manufacturer);
 GS_STRINGS_RW(gadget_language, product);
 GS_STRINGS_RW(gadget_language, serialnumber);
 
-static struct configfs_attribute *gadget_language_langid_attrs[] = {
+static const struct configfs_attribute *const gadget_language_langid_attrs[] = {
 	&gadget_language_attr_manufacturer,
 	&gadget_language_attr_product,
 	&gadget_language_attr_serialnumber,
@@ -839,7 +839,7 @@ static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
 }
 CONFIGFS_ATTR(gadget_string_, s);
 
-static struct configfs_attribute *gadget_string_attrs[] = {
+static const struct configfs_attribute *const gadget_string_attrs[] = {
 	&gadget_string_attr_id,
 	&gadget_string_attr_s,
 	NULL,
@@ -858,7 +858,7 @@ static const struct configfs_item_operations gadget_string_item_ops = {
 
 static const struct config_item_type gadget_string_type = {
 	.ct_item_ops	= &gadget_string_item_ops,
-	.ct_attrs	= gadget_string_attrs,
+	.ct_attrs_const	= gadget_string_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -909,7 +909,7 @@ static const struct configfs_group_operations gadget_language_langid_group_ops =
 static const struct config_item_type gadget_language_type = {
 	.ct_item_ops	= &gadget_language_langid_item_ops,
 	.ct_group_ops	= &gadget_language_langid_group_ops,
-	.ct_attrs	= gadget_language_langid_attrs,
+	.ct_attrs_const	= gadget_language_langid_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1104,7 +1104,7 @@ CONFIGFS_ATTR(webusb_, bVendorCode);
 CONFIGFS_ATTR(webusb_, bcdVersion);
 CONFIGFS_ATTR(webusb_, landingPage);
 
-static struct configfs_attribute *webusb_attrs[] = {
+static const struct configfs_attribute *const webusb_attrs[] = {
 	&webusb_attr_use,
 	&webusb_attr_bcdVersion,
 	&webusb_attr_bVendorCode,
@@ -1113,7 +1113,7 @@ static struct configfs_attribute *webusb_attrs[] = {
 };
 
 static const struct config_item_type webusb_type = {
-	.ct_attrs	= webusb_attrs,
+	.ct_attrs_const	= webusb_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1211,7 +1211,7 @@ CONFIGFS_ATTR(os_desc_, use);
 CONFIGFS_ATTR(os_desc_, b_vendor_code);
 CONFIGFS_ATTR(os_desc_, qw_sign);
 
-static struct configfs_attribute *os_desc_attrs[] = {
+static const struct configfs_attribute *const os_desc_attrs[] = {
 	&os_desc_attr_use,
 	&os_desc_attr_b_vendor_code,
 	&os_desc_attr_qw_sign,
@@ -1273,7 +1273,7 @@ static const struct configfs_item_operations os_desc_ops = {
 
 static const struct config_item_type os_desc_type = {
 	.ct_item_ops	= &os_desc_ops,
-	.ct_attrs	= os_desc_attrs,
+	.ct_attrs_const	= os_desc_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1378,7 +1378,7 @@ static ssize_t ext_prop_data_store(struct config_item *item,
 CONFIGFS_ATTR(ext_prop_, type);
 CONFIGFS_ATTR(ext_prop_, data);
 
-static struct configfs_attribute *ext_prop_attrs[] = {
+static const struct configfs_attribute *const ext_prop_attrs[] = {
 	&ext_prop_attr_type,
 	&ext_prop_attr_data,
 	NULL,
@@ -1417,7 +1417,7 @@ static struct config_item *ext_prop_make(
 
 	desc = container_of(group, struct usb_os_desc, group);
 	ext_prop_type->ct_item_ops = &ext_prop_ops;
-	ext_prop_type->ct_attrs = ext_prop_attrs;
+	ext_prop_type->ct_attrs_const = ext_prop_attrs;
 	ext_prop_type->ct_owner = desc->owner;
 
 	config_item_init_type_name(&ext_prop->item, name, ext_prop_type);
@@ -1516,7 +1516,7 @@ static ssize_t interf_grp_sub_compatible_id_store(struct config_item *item,
 CONFIGFS_ATTR(interf_grp_, compatible_id);
 CONFIGFS_ATTR(interf_grp_, sub_compatible_id);
 
-static struct configfs_attribute *interf_grp_attrs[] = {
+static const struct configfs_attribute *const interf_grp_attrs[] = {
 	&interf_grp_attr_compatible_id,
 	&interf_grp_attr_sub_compatible_id,
 	NULL
@@ -1550,7 +1550,7 @@ struct config_group *usb_os_desc_prepare_interf_dir(
 	configfs_add_default_group(os_desc_group, parent);
 
 	interface_type->ct_group_ops = &interf_grp_ops;
-	interface_type->ct_attrs = interf_grp_attrs;
+	interface_type->ct_attrs_const = interf_grp_attrs;
 	interface_type->ct_owner = owner;
 
 	while (n_interf--) {
diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
index c628d02bfb1d..8dce1928df5c 100644
--- a/drivers/usb/gadget/function/f_acm.c
+++ b/drivers/usb/gadget/function/f_acm.c
@@ -852,7 +852,7 @@ static ssize_t f_acm_protocol_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_acm_, protocol);
 
-static struct configfs_attribute *acm_attrs[] = {
+static const struct configfs_attribute *const acm_attrs[] = {
 #ifdef CONFIG_U_SERIAL_CONSOLE
 	&f_acm_attr_console,
 #endif
@@ -863,7 +863,7 @@ static struct configfs_attribute *acm_attrs[] = {
 
 static const struct config_item_type acm_func_type = {
 	.ct_item_ops    = &acm_item_ops,
-	.ct_attrs	= acm_attrs,
+	.ct_attrs_const	= acm_attrs,
 	.ct_owner       = THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index e495bac4efeb..b49e409f3ee7 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -821,7 +821,7 @@ USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ecm);
 /* f_ecm_opts_ifname */
 USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(ecm);
 
-static struct configfs_attribute *ecm_attrs[] = {
+static const struct configfs_attribute *const ecm_attrs[] = {
 	&ecm_opts_attr_dev_addr,
 	&ecm_opts_attr_host_addr,
 	&ecm_opts_attr_qmult,
@@ -831,7 +831,7 @@ static struct configfs_attribute *ecm_attrs[] = {
 
 static const struct config_item_type ecm_func_type = {
 	.ct_item_ops	= &ecm_item_ops,
-	.ct_attrs	= ecm_attrs,
+	.ct_attrs_const	= ecm_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index ac37d7c1d168..aec8c89fb122 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -573,7 +573,7 @@ USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(eem);
 /* f_eem_opts_ifname */
 USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(eem);
 
-static struct configfs_attribute *eem_attrs[] = {
+static const struct configfs_attribute *const eem_attrs[] = {
 	&eem_opts_attr_dev_addr,
 	&eem_opts_attr_host_addr,
 	&eem_opts_attr_qmult,
@@ -583,7 +583,7 @@ static struct configfs_attribute *eem_attrs[] = {
 
 static const struct config_item_type eem_func_type = {
 	.ct_item_ops	= &eem_item_ops,
-	.ct_attrs	= eem_attrs,
+	.ct_attrs_const	= eem_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..cccd19bee51b 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -4117,7 +4117,7 @@ static ssize_t f_fs_opts_ready_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR_RO(f_fs_opts_, ready);
 
-static struct configfs_attribute *ffs_attrs[] = {
+static const struct configfs_attribute *const ffs_attrs[] = {
 	&f_fs_opts_attr_ready,
 	NULL,
 };
@@ -4135,7 +4135,7 @@ static const struct configfs_item_operations ffs_item_ops = {
 
 static const struct config_item_type ffs_func_type = {
 	.ct_item_ops	= &ffs_item_ops,
-	.ct_attrs	= ffs_attrs,
+	.ct_attrs_const	= ffs_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..98b413f67aaf 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1484,7 +1484,7 @@ static ssize_t f_hid_opts_dev_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR_RO(f_hid_opts_, dev);
 
-static struct configfs_attribute *hid_attrs[] = {
+static const struct configfs_attribute *const hid_attrs[] = {
 	&f_hid_opts_attr_subclass,
 	&f_hid_opts_attr_protocol,
 	&f_hid_opts_attr_no_out_endpoint,
@@ -1497,7 +1497,7 @@ static struct configfs_attribute *hid_attrs[] = {
 
 static const struct config_item_type hid_func_type = {
 	.ct_item_ops	= &hidg_item_ops,
-	.ct_attrs	= hid_attrs,
+	.ct_attrs_const	= hid_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index d2d07fb49e70..1f9fa2d57b44 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -544,7 +544,7 @@ static ssize_t f_lb_opts_bulk_buflen_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_lb_opts_, bulk_buflen);
 
-static struct configfs_attribute *lb_attrs[] = {
+static const struct configfs_attribute *const lb_attrs[] = {
 	&f_lb_opts_attr_qlen,
 	&f_lb_opts_attr_bulk_buflen,
 	NULL,
@@ -552,7 +552,7 @@ static struct configfs_attribute *lb_attrs[] = {
 
 static const struct config_item_type lb_func_type = {
 	.ct_item_ops    = &lb_item_ops,
-	.ct_attrs	= lb_attrs,
+	.ct_attrs_const	= lb_attrs,
 	.ct_owner       = THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 52314a00d8e6..92fd95d24f9e 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -3283,7 +3283,7 @@ static ssize_t fsg_lun_opts_forced_eject_store(struct config_item *item,
 
 CONFIGFS_ATTR_WO(fsg_lun_opts_, forced_eject);
 
-static struct configfs_attribute *fsg_lun_attrs[] = {
+static const struct configfs_attribute *const fsg_lun_attrs[] = {
 	&fsg_lun_opts_attr_file,
 	&fsg_lun_opts_attr_ro,
 	&fsg_lun_opts_attr_removable,
@@ -3296,7 +3296,7 @@ static struct configfs_attribute *fsg_lun_attrs[] = {
 
 static const struct config_item_type fsg_lun_type = {
 	.ct_item_ops	= &fsg_lun_item_ops,
-	.ct_attrs	= fsg_lun_attrs,
+	.ct_attrs_const	= fsg_lun_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -3475,7 +3475,7 @@ static ssize_t fsg_opts_num_buffers_store(struct config_item *item,
 CONFIGFS_ATTR(fsg_opts_, num_buffers);
 #endif
 
-static struct configfs_attribute *fsg_attrs[] = {
+static const struct configfs_attribute *const fsg_attrs[] = {
 	&fsg_opts_attr_stall,
 #ifdef CONFIG_USB_GADGET_DEBUG_FILES
 	&fsg_opts_attr_num_buffers,
@@ -3491,7 +3491,7 @@ static const struct configfs_group_operations fsg_group_ops = {
 static const struct config_item_type fsg_func_type = {
 	.ct_item_ops	= &fsg_item_ops,
 	.ct_group_ops	= &fsg_group_ops,
-	.ct_attrs	= fsg_attrs,
+	.ct_attrs_const	= fsg_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 48cda34399e8..dc3e3e2fd4f3 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -1240,7 +1240,7 @@ F_MIDI_OPT(out_ports, true, MAX_PORTS);
 F_MIDI_OPT_STRING(id);
 F_MIDI_OPT_STRING(interface_string);
 
-static struct configfs_attribute *midi_attrs[] = {
+static const struct configfs_attribute *const midi_attrs[] = {
 	&f_midi_opts_attr_index,
 	&f_midi_opts_attr_buflen,
 	&f_midi_opts_attr_qlen,
@@ -1253,7 +1253,7 @@ static struct configfs_attribute *midi_attrs[] = {
 
 static const struct config_item_type midi_func_type = {
 	.ct_item_ops	= &midi_item_ops,
-	.ct_attrs	= midi_attrs,
+	.ct_attrs_const	= midi_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index d693de427641..a92012ce8964 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -2291,7 +2291,7 @@ static ssize_t f_midi2_block_opts_name_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_midi2_block_opts_, name);
 
-static struct configfs_attribute *f_midi2_block_attrs[] = {
+static const struct configfs_attribute *const f_midi2_block_attrs[] = {
 	&f_midi2_block_opts_attr_direction,
 	&f_midi2_block_opts_attr_first_group,
 	&f_midi2_block_opts_attr_num_groups,
@@ -2320,7 +2320,7 @@ static const struct configfs_item_operations f_midi2_block_item_ops = {
 
 static const struct config_item_type f_midi2_block_type = {
 	.ct_item_ops	= &f_midi2_block_item_ops,
-	.ct_attrs	= f_midi2_block_attrs,
+	.ct_attrs_const	= f_midi2_block_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -2456,7 +2456,7 @@ F_MIDI2_EP_OPT(sw_revision, "0x%x", 0, 0xffffffff);
 F_MIDI2_EP_STR_OPT(ep_name, 128);
 F_MIDI2_EP_STR_OPT(product_id, 128);
 
-static struct configfs_attribute *f_midi2_ep_attrs[] = {
+static const struct configfs_attribute *const f_midi2_ep_attrs[] = {
 	&f_midi2_ep_opts_attr_protocol,
 	&f_midi2_ep_opts_attr_protocol_caps,
 	&f_midi2_ep_opts_attr_ep_name,
@@ -2490,7 +2490,7 @@ static const struct configfs_group_operations f_midi2_ep_group_ops = {
 static const struct config_item_type f_midi2_ep_type = {
 	.ct_item_ops	= &f_midi2_ep_item_ops,
 	.ct_group_ops	= &f_midi2_ep_group_ops,
-	.ct_attrs	= f_midi2_ep_attrs,
+	.ct_attrs_const	= f_midi2_ep_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -2603,7 +2603,7 @@ static ssize_t f_midi2_opts_iface_name_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_midi2_opts_, iface_name);
 
-static struct configfs_attribute *f_midi2_attrs[] = {
+static const struct configfs_attribute *const f_midi2_attrs[] = {
 	&f_midi2_opts_attr_process_ump,
 	&f_midi2_opts_attr_static_block,
 	&f_midi2_opts_attr_iface_name,
@@ -2629,7 +2629,7 @@ static const struct configfs_group_operations f_midi2_group_ops = {
 static const struct config_item_type f_midi2_func_type = {
 	.ct_item_ops	= &f_midi2_item_ops,
 	.ct_group_ops	= &f_midi2_group_ops,
-	.ct_attrs	= f_midi2_attrs,
+	.ct_attrs_const	= f_midi2_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index ab6da3ef8783..e178cb700653 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1654,7 +1654,7 @@ static ssize_t ncm_opts_max_segment_size_store(struct config_item *item,
 
 CONFIGFS_ATTR(ncm_opts_, max_segment_size);
 
-static struct configfs_attribute *ncm_attrs[] = {
+static const struct configfs_attribute *const ncm_attrs[] = {
 	&ncm_opts_attr_dev_addr,
 	&ncm_opts_attr_host_addr,
 	&ncm_opts_attr_qmult,
@@ -1665,7 +1665,7 @@ static struct configfs_attribute *ncm_attrs[] = {
 
 static const struct config_item_type ncm_func_type = {
 	.ct_item_ops	= &ncm_item_ops,
-	.ct_attrs	= ncm_attrs,
+	.ct_attrs_const	= ncm_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_obex.c b/drivers/usb/gadget/function/f_obex.c
index 715bb0decd3b..fb2186d1ca6e 100644
--- a/drivers/usb/gadget/function/f_obex.c
+++ b/drivers/usb/gadget/function/f_obex.c
@@ -401,14 +401,14 @@ static ssize_t f_obex_port_num_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR_RO(f_obex_, port_num);
 
-static struct configfs_attribute *acm_attrs[] = {
+static const struct configfs_attribute *const acm_attrs[] = {
 	&f_obex_attr_port_num,
 	NULL,
 };
 
 static const struct config_item_type obex_func_type = {
 	.ct_item_ops	= &obex_item_ops,
-	.ct_attrs	= acm_attrs,
+	.ct_attrs_const	= acm_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index b1ee9a7c2e94..736630151db2 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -605,14 +605,14 @@ static ssize_t f_phonet_ifname_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR_RO(f_phonet_, ifname);
 
-static struct configfs_attribute *phonet_attrs[] = {
+static const struct configfs_attribute *const phonet_attrs[] = {
 	&f_phonet_attr_ifname,
 	NULL,
 };
 
 static const struct config_item_type phonet_func_type = {
 	.ct_item_ops	= &phonet_item_ops,
-	.ct_attrs	= phonet_attrs,
+	.ct_attrs_const	= phonet_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1857d786110b..47098c347150 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1328,7 +1328,7 @@ static ssize_t f_printer_opts_q_len_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_printer_opts_, q_len);
 
-static struct configfs_attribute *printer_attrs[] = {
+static const struct configfs_attribute *const printer_attrs[] = {
 	&f_printer_opts_attr_pnp_string,
 	&f_printer_opts_attr_q_len,
 	NULL,
@@ -1336,7 +1336,7 @@ static struct configfs_attribute *printer_attrs[] = {
 
 static const struct config_item_type printer_func_type = {
 	.ct_item_ops	= &printer_item_ops,
-	.ct_attrs	= printer_attrs,
+	.ct_attrs_const	= printer_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index 7de1c5f8e326..69d2780c1aae 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -852,7 +852,7 @@ USB_ETHER_CONFIGFS_ITEM_ATTR_U8_RW(rndis, subclass);
 /* f_rndis_opts_protocol */
 USB_ETHER_CONFIGFS_ITEM_ATTR_U8_RW(rndis, protocol);
 
-static struct configfs_attribute *rndis_attrs[] = {
+static const struct configfs_attribute *const rndis_attrs[] = {
 	&rndis_opts_attr_dev_addr,
 	&rndis_opts_attr_host_addr,
 	&rndis_opts_attr_qmult,
@@ -865,7 +865,7 @@ static struct configfs_attribute *rndis_attrs[] = {
 
 static const struct config_item_type rndis_func_type = {
 	.ct_item_ops	= &rndis_item_ops,
-	.ct_attrs	= rndis_attrs,
+	.ct_attrs_const	= rndis_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index ae8813c67bc7..34fc0069b97b 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -289,7 +289,7 @@ static ssize_t f_serial_port_num_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR_RO(f_serial_, port_num);
 
-static struct configfs_attribute *acm_attrs[] = {
+static const struct configfs_attribute *const acm_attrs[] = {
 #ifdef CONFIG_U_SERIAL_CONSOLE
 	&f_serial_attr_console,
 #endif
@@ -299,7 +299,7 @@ static struct configfs_attribute *acm_attrs[] = {
 
 static const struct config_item_type serial_func_type = {
 	.ct_item_ops	= &serial_item_ops,
-	.ct_attrs	= acm_attrs,
+	.ct_attrs_const	= acm_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index d2b707e41669..e9aa553f2525 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -1266,7 +1266,7 @@ static ssize_t f_ss_opts_iso_qlen_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_ss_opts_, iso_qlen);
 
-static struct configfs_attribute *ss_attrs[] = {
+static const struct configfs_attribute *const ss_attrs[] = {
 	&f_ss_opts_attr_pattern,
 	&f_ss_opts_attr_isoc_interval,
 	&f_ss_opts_attr_isoc_maxpacket,
@@ -1281,7 +1281,7 @@ static struct configfs_attribute *ss_attrs[] = {
 
 static const struct config_item_type ss_func_type = {
 	.ct_item_ops    = &ss_item_ops,
-	.ct_attrs	= ss_attrs,
+	.ct_attrs_const	= ss_attrs,
 	.ct_owner       = THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_subset.c b/drivers/usb/gadget/function/f_subset.c
index 6e3265b8a3a0..468e477b47f1 100644
--- a/drivers/usb/gadget/function/f_subset.c
+++ b/drivers/usb/gadget/function/f_subset.c
@@ -392,7 +392,7 @@ USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(gether);
 /* f_gether_opts_ifname */
 USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(gether);
 
-static struct configfs_attribute *gether_attrs[] = {
+static const struct configfs_attribute *const gether_attrs[] = {
 	&gether_opts_attr_dev_addr,
 	&gether_opts_attr_host_addr,
 	&gether_opts_attr_qmult,
@@ -402,7 +402,7 @@ static struct configfs_attribute *gether_attrs[] = {
 
 static const struct config_item_type gether_func_type = {
 	.ct_item_ops	= &gether_item_ops,
-	.ct_attrs	= gether_attrs,
+	.ct_attrs_const	= gether_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 7a81cd176abd..11fad7d0552b 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1699,7 +1699,7 @@ UAC1_ATTRIBUTE_STRING(c_it_ch_name);
 UAC1_ATTRIBUTE_STRING(c_ot_name);
 UAC1_ATTRIBUTE_STRING(c_fu_vol_name);
 
-static struct configfs_attribute *f_uac1_attrs[] = {
+static const struct configfs_attribute *const f_uac1_attrs[] = {
 	&f_uac1_opts_attr_c_chmask,
 	&f_uac1_opts_attr_c_srate,
 	&f_uac1_opts_attr_c_ssize,
@@ -1737,7 +1737,7 @@ static struct configfs_attribute *f_uac1_attrs[] = {
 
 static const struct config_item_type f_uac1_func_type = {
 	.ct_item_ops	= &f_uac1_item_ops,
-	.ct_attrs	= f_uac1_attrs,
+	.ct_attrs_const	= f_uac1_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d..c3bd1b3ba134 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -894,7 +894,7 @@ UAC1_INT_ATTRIBUTE(req_buf_size);
 UAC1_INT_ATTRIBUTE(req_count);
 UAC1_INT_ATTRIBUTE(audio_buf_size);
 
-static struct configfs_attribute *f_uac1_attrs[] = {
+static const struct configfs_attribute *const f_uac1_attrs[] = {
 	&f_uac1_opts_attr_req_buf_size,
 	&f_uac1_opts_attr_req_count,
 	&f_uac1_opts_attr_audio_buf_size,
@@ -903,7 +903,7 @@ static struct configfs_attribute *f_uac1_attrs[] = {
 
 static const struct config_item_type f_uac1_func_type = {
 	.ct_item_ops	= &f_uac1_item_ops,
-	.ct_attrs	= f_uac1_attrs,
+	.ct_attrs_const	= f_uac1_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index d8cf710085a0..74733ebf9c94 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2130,7 +2130,7 @@ UAC2_ATTRIBUTE(s16, p_terminal_type);
 UAC2_ATTRIBUTE(s16, c_terminal_type);
 
 
-static struct configfs_attribute *f_uac2_attrs[] = {
+static const struct configfs_attribute *const f_uac2_attrs[] = {
 	&f_uac2_opts_attr_p_chmask,
 	&f_uac2_opts_attr_p_srate,
 	&f_uac2_opts_attr_p_ssize,
@@ -2178,7 +2178,7 @@ static struct configfs_attribute *f_uac2_attrs[] = {
 
 static const struct config_item_type f_uac2_func_type = {
 	.ct_item_ops	= &f_uac2_item_ops,
-	.ct_attrs	= f_uac2_attrs,
+	.ct_attrs_const	= f_uac2_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..a0702d09b61f 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -22,7 +22,7 @@
  */
 
 #define UVC_ATTR(prefix, cname, aname) \
-static struct configfs_attribute prefix##attr_##cname = { \
+static const struct configfs_attribute prefix##attr_##cname = { \
 	.ca_name	= __stringify(aname),				\
 	.ca_mode	= S_IRUGO | S_IWUGO,				\
 	.ca_owner	= THIS_MODULE,					\
@@ -31,7 +31,7 @@ static struct configfs_attribute prefix##attr_##cname = { \
 }
 
 #define UVC_ATTR_RO(prefix, cname, aname) \
-static struct configfs_attribute prefix##attr_##cname = { \
+static const struct configfs_attribute prefix##attr_##cname = { \
 	.ca_name	= __stringify(aname),				\
 	.ca_mode	= S_IRUGO,					\
 	.ca_owner	= THIS_MODULE,					\
@@ -253,7 +253,7 @@ UVCG_CTRL_HDR_ATTR(dw_clock_frequency, dwClockFrequency, 32, 0x7fffffff);
 
 #undef UVCG_CTRL_HDR_ATTR
 
-static struct configfs_attribute *uvcg_control_header_attrs[] = {
+static const struct configfs_attribute *const uvcg_control_header_attrs[] = {
 	&uvcg_control_header_attr_bcd_uvc,
 	&uvcg_control_header_attr_dw_clock_frequency,
 	NULL,
@@ -261,7 +261,7 @@ static struct configfs_attribute *uvcg_control_header_attrs[] = {
 
 static const struct config_item_type uvcg_control_header_type = {
 	.ct_item_ops	= &uvcg_config_item_ops,
-	.ct_attrs	= uvcg_control_header_attrs,
+	.ct_attrs_const	= uvcg_control_header_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -425,7 +425,7 @@ static ssize_t uvcg_default_processing_bm_controls_show(
 
 UVC_ATTR(uvcg_default_processing_, bm_controls, bmControls);
 
-static struct configfs_attribute *uvcg_default_processing_attrs[] = {
+static const struct configfs_attribute *const uvcg_default_processing_attrs[] = {
 	&uvcg_default_processing_attr_b_unit_id,
 	&uvcg_default_processing_attr_b_source_id,
 	&uvcg_default_processing_attr_w_max_multiplier,
@@ -437,7 +437,7 @@ static struct configfs_attribute *uvcg_default_processing_attrs[] = {
 static const struct uvcg_config_group_type uvcg_default_processing_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
-		.ct_attrs	= uvcg_default_processing_attrs,
+		.ct_attrs_const	= uvcg_default_processing_attrs,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "default",
@@ -595,7 +595,7 @@ static ssize_t uvcg_default_camera_bm_controls_show(
 
 UVC_ATTR(uvcg_default_camera_, bm_controls, bmControls);
 
-static struct configfs_attribute *uvcg_default_camera_attrs[] = {
+static const struct configfs_attribute *const uvcg_default_camera_attrs[] = {
 	&uvcg_default_camera_attr_b_terminal_id,
 	&uvcg_default_camera_attr_w_terminal_type,
 	&uvcg_default_camera_attr_b_assoc_terminal,
@@ -610,7 +610,7 @@ static struct configfs_attribute *uvcg_default_camera_attrs[] = {
 static const struct uvcg_config_group_type uvcg_default_camera_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
-		.ct_attrs	= uvcg_default_camera_attrs,
+		.ct_attrs_const	= uvcg_default_camera_attrs,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "default",
@@ -730,7 +730,7 @@ static ssize_t uvcg_default_output_b_source_id_store(struct config_item *item,
 }
 UVC_ATTR(uvcg_default_output_, b_source_id, bSourceID);
 
-static struct configfs_attribute *uvcg_default_output_attrs[] = {
+static const struct configfs_attribute *const uvcg_default_output_attrs[] = {
 	&uvcg_default_output_attr_b_terminal_id,
 	&uvcg_default_output_attr_w_terminal_type,
 	&uvcg_default_output_attr_b_assoc_terminal,
@@ -742,7 +742,7 @@ static struct configfs_attribute *uvcg_default_output_attrs[] = {
 static const struct uvcg_config_group_type uvcg_default_output_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
-		.ct_attrs	= uvcg_default_output_attrs,
+		.ct_attrs_const	= uvcg_default_output_attrs,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "default",
@@ -1163,7 +1163,7 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 
 UVC_ATTR(uvcg_extension_, bm_controls, bmControls);
 
-static struct configfs_attribute *uvcg_extension_attrs[] = {
+static const struct configfs_attribute *const uvcg_extension_attrs[] = {
 	&uvcg_extension_attr_b_length,
 	&uvcg_extension_attr_b_unit_id,
 	&uvcg_extension_attr_b_num_controls,
@@ -1241,7 +1241,7 @@ static const struct configfs_item_operations uvcg_extension_item_ops = {
 
 static const struct config_item_type uvcg_extension_type = {
 	.ct_item_ops	= &uvcg_extension_item_ops,
-	.ct_attrs	= uvcg_extension_attrs,
+	.ct_attrs_const	= uvcg_extension_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -1541,7 +1541,7 @@ static ssize_t uvcg_default_control_enable_interrupt_ep_store(
 }
 UVC_ATTR(uvcg_default_control_, enable_interrupt_ep, enable_interrupt_ep);
 
-static struct configfs_attribute *uvcg_default_control_attrs[] = {
+static const struct configfs_attribute *const uvcg_default_control_attrs[] = {
 	&uvcg_default_control_attr_b_interface_number,
 	&uvcg_default_control_attr_enable_interrupt_ep,
 	NULL,
@@ -1550,7 +1550,7 @@ static struct configfs_attribute *uvcg_default_control_attrs[] = {
 static const struct uvcg_config_group_type uvcg_control_grp_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
-		.ct_attrs	= uvcg_default_control_attrs,
+		.ct_attrs_const	= uvcg_default_control_attrs,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "control",
@@ -1879,7 +1879,7 @@ UVCG_STREAMING_HEADER_ATTR(b_trigger_usage, bTriggerUsage, 8);
 
 #undef UVCG_STREAMING_HEADER_ATTR
 
-static struct configfs_attribute *uvcg_streaming_header_attrs[] = {
+static const struct configfs_attribute *const uvcg_streaming_header_attrs[] = {
 	&uvcg_streaming_header_attr_bm_info,
 	&uvcg_streaming_header_attr_b_terminal_link,
 	&uvcg_streaming_header_attr_b_still_capture_method,
@@ -1890,7 +1890,7 @@ static struct configfs_attribute *uvcg_streaming_header_attrs[] = {
 
 static const struct config_item_type uvcg_streaming_header_type = {
 	.ct_item_ops	= &uvcg_streaming_header_item_ops,
-	.ct_attrs	= uvcg_streaming_header_attrs,
+	.ct_attrs_const	= uvcg_streaming_header_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -2116,7 +2116,7 @@ static ssize_t uvcg_frame_dw_frame_interval_store(struct config_item *item,
 
 UVC_ATTR(uvcg_frame_, dw_frame_interval, dwFrameInterval);
 
-static struct configfs_attribute *uvcg_frame_attrs1[] = {
+static const struct configfs_attribute *const uvcg_frame_attrs1[] = {
 	&uvcg_frame_attr_b_frame_index,
 	&uvcg_frame_attr_bm_capabilities,
 	&uvcg_frame_attr_w_width,
@@ -2129,7 +2129,7 @@ static struct configfs_attribute *uvcg_frame_attrs1[] = {
 	NULL,
 };
 
-static struct configfs_attribute *uvcg_frame_attrs2[] = {
+static const struct configfs_attribute *const uvcg_frame_attrs2[] = {
 	&uvcg_frame_attr_b_frame_index,
 	&uvcg_frame_attr_bm_capabilities,
 	&uvcg_frame_attr_w_width,
@@ -2144,13 +2144,13 @@ static struct configfs_attribute *uvcg_frame_attrs2[] = {
 
 static const struct config_item_type uvcg_frame_type1 = {
 	.ct_item_ops	= &uvcg_config_item_ops,
-	.ct_attrs	= uvcg_frame_attrs1,
+	.ct_attrs_const	= uvcg_frame_attrs1,
 	.ct_owner	= THIS_MODULE,
 };
 
 static const struct config_item_type uvcg_frame_type2 = {
 	.ct_item_ops    = &uvcg_config_item_ops,
-	.ct_attrs       = uvcg_frame_attrs2,
+	.ct_attrs_const       = uvcg_frame_attrs2,
 	.ct_owner       = THIS_MODULE,
 };
 
@@ -2448,7 +2448,7 @@ uvcg_uncompressed_bma_controls_store(struct config_item *item,
 
 UVC_ATTR(uvcg_uncompressed_, bma_controls, bmaControls);
 
-static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
+static const struct configfs_attribute *const uvcg_uncompressed_attrs[] = {
 	&uvcg_uncompressed_attr_b_format_index,
 	&uvcg_uncompressed_attr_guid_format,
 	&uvcg_uncompressed_attr_b_bits_per_pixel,
@@ -2463,7 +2463,7 @@ static struct configfs_attribute *uvcg_uncompressed_attrs[] = {
 static const struct config_item_type uvcg_uncompressed_type = {
 	.ct_item_ops	= &uvcg_format_item_operations,
 	.ct_group_ops	= &uvcg_uncompressed_group_ops,
-	.ct_attrs	= uvcg_uncompressed_attrs,
+	.ct_attrs_const	= uvcg_uncompressed_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -2645,7 +2645,7 @@ uvcg_mjpeg_bma_controls_store(struct config_item *item,
 
 UVC_ATTR(uvcg_mjpeg_, bma_controls, bmaControls);
 
-static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
+static const struct configfs_attribute *const uvcg_mjpeg_attrs[] = {
 	&uvcg_mjpeg_attr_b_format_index,
 	&uvcg_mjpeg_attr_b_default_frame_index,
 	&uvcg_mjpeg_attr_bm_flags,
@@ -2659,7 +2659,7 @@ static struct configfs_attribute *uvcg_mjpeg_attrs[] = {
 static const struct config_item_type uvcg_mjpeg_type = {
 	.ct_item_ops	= &uvcg_format_item_operations,
 	.ct_group_ops	= &uvcg_mjpeg_group_ops,
-	.ct_attrs	= uvcg_mjpeg_attrs,
+	.ct_attrs_const	= uvcg_mjpeg_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -2891,7 +2891,7 @@ uvcg_framebased_bma_controls_store(struct config_item *item,
 
 UVC_ATTR(uvcg_framebased_, bma_controls, bmaControls);
 
-static struct configfs_attribute *uvcg_framebased_attrs[] = {
+static const struct configfs_attribute *const uvcg_framebased_attrs[] = {
 	&uvcg_framebased_attr_b_format_index,
 	&uvcg_framebased_attr_b_default_frame_index,
 	&uvcg_framebased_attr_b_bits_per_pixel,
@@ -2906,7 +2906,7 @@ static struct configfs_attribute *uvcg_framebased_attrs[] = {
 static const struct config_item_type uvcg_framebased_type = {
 	.ct_item_ops    = &uvcg_config_item_ops,
 	.ct_group_ops   = &uvcg_framebased_group_ops,
-	.ct_attrs       = uvcg_framebased_attrs,
+	.ct_attrs_const = uvcg_framebased_attrs,
 	.ct_owner       = THIS_MODULE,
 };
 
@@ -3041,7 +3041,7 @@ UVCG_COLOR_MATCHING_ATTR(b_matrix_coefficients, bMatrixCoefficients, 8);
 
 #undef UVCG_COLOR_MATCHING_ATTR
 
-static struct configfs_attribute *uvcg_color_matching_attrs[] = {
+static const struct configfs_attribute *const uvcg_color_matching_attrs[] = {
 	&uvcg_color_matching_attr_b_color_primaries,
 	&uvcg_color_matching_attr_b_transfer_characteristics,
 	&uvcg_color_matching_attr_b_matrix_coefficients,
@@ -3062,7 +3062,7 @@ static const struct configfs_item_operations uvcg_color_matching_item_ops = {
 
 static const struct config_item_type uvcg_color_matching_type = {
 	.ct_item_ops	= &uvcg_color_matching_item_ops,
-	.ct_attrs	= uvcg_color_matching_attrs,
+	.ct_attrs_const	= uvcg_color_matching_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
@@ -3605,7 +3605,7 @@ static ssize_t uvcg_default_streaming_b_interface_number_show(
 
 UVC_ATTR_RO(uvcg_default_streaming_, b_interface_number, bInterfaceNumber);
 
-static struct configfs_attribute *uvcg_default_streaming_attrs[] = {
+static const struct configfs_attribute *const uvcg_default_streaming_attrs[] = {
 	&uvcg_default_streaming_attr_b_interface_number,
 	NULL,
 };
@@ -3613,7 +3613,7 @@ static struct configfs_attribute *uvcg_default_streaming_attrs[] = {
 static const struct uvcg_config_group_type uvcg_streaming_grp_type = {
 	.type = {
 		.ct_item_ops	= &uvcg_config_item_ops,
-		.ct_attrs	= uvcg_default_streaming_attrs,
+		.ct_attrs_const	= uvcg_default_streaming_attrs,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "streaming",
@@ -3797,7 +3797,7 @@ UVCG_OPTS_STRING_ATTR(function_name, function_name);
 
 #undef UVCG_OPTS_STRING_ATTR
 
-static struct configfs_attribute *uvc_attrs[] = {
+static const struct configfs_attribute *const uvc_attrs[] = {
 	&f_uvc_opts_attr_streaming_interval,
 	&f_uvc_opts_attr_streaming_maxpacket,
 	&f_uvc_opts_attr_streaming_maxburst,
@@ -3808,7 +3808,7 @@ static struct configfs_attribute *uvc_attrs[] = {
 static const struct uvcg_config_group_type uvc_func_type = {
 	.type = {
 		.ct_item_ops	= &uvc_func_item_ops,
-		.ct_attrs	= uvc_attrs,
+		.ct_attrs_const	= uvc_attrs,
 		.ct_owner	= THIS_MODULE,
 	},
 	.name = "",
diff --git a/include/linux/usb/gadget_configfs.h b/include/linux/usb/gadget_configfs.h
index 23c1091e88c0..c1eb4cbc3629 100644
--- a/include/linux/usb/gadget_configfs.h
+++ b/include/linux/usb/gadget_configfs.h
@@ -36,7 +36,7 @@ static const struct configfs_item_operations struct_in##_langid_item_ops = {	\
 									\
 static const struct config_item_type struct_in##_langid_type = {	\
 	.ct_item_ops	= &struct_in##_langid_item_ops,			\
-	.ct_attrs	= struct_in##_langid_attrs,			\
+	.ct_attrs_const	= struct_in##_langid_attrs,			\
 	.ct_owner	= THIS_MODULE,					\
 }
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-b4-configfs-const-usb-46257db77479

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


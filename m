Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77402471268
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365062; cv=none; b=IqWg+4lg6ux38n7eybP/xH5E769T0qqv6gRdrZHVcab4Qu2J6CcFHZWBnGOG3TGnGEsLXma6H7uDA7GwpCa02LN3YcVYJUFdIXeLwwtYrAi7NphSubPk2lQiq+2OXbOjiDohsRmLy8yXKEizATQ0UbEeovLUBryAqtMVBfxtptI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365062; c=relaxed/simple;
	bh=DKZd5zj4U2TgetJHc/qNyMz8PvP5tloeU/TQpqZnxnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mpHC+6KtirJoFmJew7KaXsPUM5/CI5inB259ReCIH+m4kGrDlYvIpL142EhmtIhHtjGjXHLKEySUfFj6YKax6LbOfuUXmw4CwnO2CwqG507KRrmDVXtoKgtHF/J/6Sq8QQ7K17W3Rq9qMtpD2Muzr/FgoOedrgDrRZP9TXzwoFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2A7PKhr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2A7PKhr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so9351475ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364903; x=1791969703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWEoBcTanLI/xOOEjBUzFe/ubT0LTWC3gtU2OGQUs4Q=;
        b=S2A7PKhrGRTnvtBPAWFqeixXh5dG7sNlX40AawnW6QtWbc4jlv3/E0+tVSOCEtZML2
         eq/y5FBQWCbybTcuEv8GcYPVxa/iIkBsdEuqRVA9PL8gUrrMwuRq+HEnPijtbwhl6tkV
         6mfu6WggUqAuu84isXzAYqK4V2jZ3ZoqixLL780K+h42WNukw610lkfHSzoYTWXwVZ7b
         1X8Nw/4GEbv4dRfDQMtLEiMofRTTgya+96hMb5JBi3e68mgCxhEPrswRuKtJ32GtHRVo
         8jQ1ZjEwKEcBTWInRnXcAc2zYbWNgc9JSGUpv0jAuaOWoADLiCYrijB7CmlYQcv7uWsc
         3ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364903; x=1791969703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWEoBcTanLI/xOOEjBUzFe/ubT0LTWC3gtU2OGQUs4Q=;
        b=ryKDmFG6fnX2Wp8rVBrEYhOZHPhRXwygQITrJ66OilXlc2z1XMtTTPxCP71D2M3ccY
         A/WBvjklZfBez2fBdrJhZlW4AObsE8rt9czzBeNX1u8qENpddEtvWWx04mPDTIlX/BHO
         ocTEZB/vboCSrOVTeW6PORaYjoEGC4niNoifK7bwxUPU91edPijcnKBS444fZmM9PWFQ
         wKeW1m2lpPcSvmYHH24sjDKz+hGPVjkro0gC3RFQ0ebCAcgbNT+L2/zLTpnvpsmKcz80
         Lu2jAQLZ+oQGvWO2lQMizy+lqibcujKBQAMzt0KGPNNPi5D0lb1esEWYo/2WWZetP2WW
         /QWQ==
X-Gm-Message-State: AFq9FYLvUpYM5tAS0W7PZ1RdYtSNOEmfGOo/nnM/K+JadxZy4v09b7Gm
	ov2gQv3yAjvqpjiusudmtcQ8/Tt4IJDW1ZQiFGLwYVa6d+fpeRHAKsNV
X-Gm-Gg: AYBFou0b/KdrysFIPQnADri2lerURxrpIRtq6Mw1f4jZYRIj1bXwdgsx2wKSfs/uBsI
	14XC6cuX742nIF8WRsMAtSXWyIryZICqD/O29hHX9f4dukyGkkjGp8STR+ajoqEzZpBHV1NZ4um
	jEQfHJFzczR+GGbwijY8OXgUsC+gNOWO1Iq4BMk3ai8dJtKqHwIqY3j8uwFEfHtuMwwRan4Qn4O
	3ZVehRfefNA6Dimy95zs3K1oj8n6GgJHj9AJrMHY/IwoTq79P6xlNsY3yRkP7KUFqLo4T9THstz
	cNwfhmc/86W9ACjiXU4z+y4t8DQf6YPi9E6uO9WBFLGmmUY2x9Xe5yq8go8g8g5v3UqEmKgtPek
	rc6Sw6p8SglaQD1PUvtdsnh2JfqOxSrs9h0B1Hkd+i6tPlTvUR0VVh8j+YuKM+K+5KgZW9ujzeA
	SjI4G7GUM9Na0hdpwgT8rAxo1X/UKAVCX5UZ43iXCDBOIGwcLpVdpbZFX7jRYyk7kEvxvwuMXaP
	5DUL5ke8eaaKSkcyPEENZ3kKzCFVQ0qu3KIhCsm
X-Received: by 2002:a17:902:e885:b0:2dd:7646:35cd with SMTP id d9443c01a7336-2e5ff85264dmr16965995ad.0.1791364903452;
        Wed, 07 Oct 2026 02:21:43 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:43 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 08/13] mfd: nct6694: Rename USB transport functions with _usb_ prefix
Date: Wed,  7 Oct 2026 17:20:57 +0800
Message-Id: <20261007092102.3768818-9-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Add a _usb_ prefix to the USB transport functions, tables and driver
name to mark them as USB specific, in preparation for the core and HIF
transport added in later patches.

Keep nct6694_{read,write}_msg() as static inline wrappers in the shared
header so that the sub-device drivers remain untouched; they are removed
once the regmap-based transport abstraction is in place.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- None.

Changes in v7:
- None.

Changes in v6:
- New patch replacing the v5 function-pointer transport abstraction:
  rename the exported I/O functions with an _usb_ prefix and add
  transitional inline nct6694_{read,write}_msg() wrappers in the shared
  header so sub-device drivers stay untouched in this commit.

 drivers/mfd/nct6694.c       | 40 ++++++++++++++++++++-----------------
 include/linux/mfd/nct6694.h | 22 ++++++++++++++++++--
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 6d75b1485350..83e9c7ac9bee 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -50,7 +50,7 @@ static struct nct6694_usb_data *to_nct6694_usb_data(struct nct6694 *ddata)
 	return container_of(ddata, struct nct6694_usb_data, core);
 }
 
-static const struct mfd_cell nct6694_devs[] = {
+static const struct mfd_cell nct6694_usb_devs[] = {
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
@@ -86,7 +86,7 @@ static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-rtc"),
 };
 
-static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char err_status)
+static int nct6694_usb_err_handling(struct nct6694 *ddata, unsigned char err_status)
 {
 	switch (err_status) {
 	case NCT6694_NO_ERROR:
@@ -111,7 +111,7 @@ static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char er
 }
 
 /**
- * nct6694_read_msg() - Read message from NCT6694 device
+ * nct6694_usb_read_msg() - Read message from NCT6694 device
  * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer to store the response data
@@ -122,7 +122,9 @@ static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char er
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_usb_read_msg(struct nct6694 *ddata,
+			 const struct nct6694_cmd_header *cmd_hd,
+			 void *buf)
 {
 	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
 	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
@@ -170,12 +172,12 @@ int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd
 
 	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
+	return nct6694_usb_err_handling(ddata, hdr->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_read_msg);
+EXPORT_SYMBOL_GPL(nct6694_usb_read_msg);
 
 /**
- * nct6694_write_msg() - Write message to NCT6694 device
+ * nct6694_usb_write_msg() - Write message to NCT6694 device
  * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer containing the data to be sent
@@ -185,7 +187,9 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_usb_write_msg(struct nct6694 *ddata,
+			  const struct nct6694_cmd_header *cmd_hd,
+			  void *buf)
 {
 	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
 	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
@@ -240,11 +244,11 @@ int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cm
 
 	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
+	return nct6694_usb_err_handling(ddata, hdr->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_write_msg);
+EXPORT_SYMBOL_GPL(nct6694_usb_write_msg);
 
-static void usb_int_callback(struct urb *urb)
+static void nct6694_usb_int_callback(struct urb *urb)
 {
 	struct nct6694 *ddata = urb->context;
 	__le32 *status_le = urb->transfer_buffer;
@@ -398,7 +402,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
 	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
 			 usb_data->int_buf, sizeof(*usb_data->int_buf),
-			 usb_int_callback, ddata,
+			 nct6694_usb_int_callback, ddata,
 			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
 	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
@@ -407,7 +411,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	usb_set_intfdata(iface, ddata);
 
-	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
+	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
 		goto err_mfd;
 
@@ -441,20 +445,20 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 	usb_free_urb(usb_data->int_urb);
 }
 
-static const struct usb_device_id nct6694_ids[] = {
+static const struct usb_device_id nct6694_usb_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID, 0xFF, 0x00, 0x00) },
 	{ }
 };
-MODULE_DEVICE_TABLE(usb, nct6694_ids);
+MODULE_DEVICE_TABLE(usb, nct6694_usb_ids);
 
 static struct usb_driver nct6694_usb_driver = {
-	.name		= "nct6694",
-	.id_table	= nct6694_ids,
+	.name		= "nct6694-usb",
+	.id_table	= nct6694_usb_ids,
 	.probe		= nct6694_usb_probe,
 	.disconnect	= nct6694_usb_disconnect,
 };
 module_usb_driver(nct6694_usb_driver);
 
-MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
+MODULE_DESCRIPTION("Nuvoton NCT6694 USB transport driver");
 MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 0ab2bd3bfdc1..61155f9832b0 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -91,7 +91,25 @@ struct nct6694 {
 	unsigned int irq_enable;
 };
 
-int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
-int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_usb_read_msg(struct nct6694 *ddata,
+			 const struct nct6694_cmd_header *cmd_hd,
+			 void *buf);
+int nct6694_usb_write_msg(struct nct6694 *ddata,
+			  const struct nct6694_cmd_header *cmd_hd,
+			  void *buf);
+
+static inline int nct6694_read_msg(struct nct6694 *ddata,
+				   const struct nct6694_cmd_header *cmd_hd,
+				   void *buf)
+{
+	return nct6694_usb_read_msg(ddata, cmd_hd, buf);
+}
+
+static inline int nct6694_write_msg(struct nct6694 *ddata,
+				    const struct nct6694_cmd_header *cmd_hd,
+				    void *buf)
+{
+	return nct6694_usb_write_msg(ddata, cmd_hd, buf);
+}
 
 #endif
-- 
2.34.1


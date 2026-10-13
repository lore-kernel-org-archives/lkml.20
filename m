Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF8C4B829D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873242; cv=none; b=S6yB9hMCN9ntjD7WR0bqjavJVazo/SBYIm7Tk2nlPkHrcd348VweFsFu3NYEycSkE4zBoxRivqsFBOTVPnimKo7O/qJ8Rt2BTTCnPoswCvyu7uMVbfjgeZ7isnAJTaMpVvznlhKlGy86CoR6lFwbxP2+GOs/M91IQ++K0tBp6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873242; c=relaxed/simple;
	bh=EbkNIH7dnT8zMMC7iQePal0trI09YciTZD7CbD0b+X4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=humBOI5SD3j8dJi6qK/2ReINUZhMxrvV0IlkIm1yp0gYJMjzV2iD0PSVo6e/eZzCGYtvlTSKd3Y7lSWc5a5k+JjoygLm8psZ5bt8tJUXFbyNC5Plpt7fypjMgECyey1/h2hVrpQD29bOJvw6Omvt0aCzTEuxjoPzFukyftL2vgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuNk5eHK; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuNk5eHK"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so902682a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873239; x=1792478039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYKKpt0tc4Cu0252xNjxETgSKgylAncBihmzE916KW4=;
        b=nuNk5eHKHI6/ctE8SsMi3WSpMFrDHmEEeNertEbAOEzGN72ybEr6YHJPq8l6Wp/DkW
         PWw+DGSi8qyMmKvVKVodTvyea/ZzAyHEeaaJvikriGIbak0Ls6bp/o4LVjfNTkVNUkgo
         N18y0r9BH1D8f7uajxrqbJWbDj1jVPsS+O4rCLPSIq02ekyntAdC3uW78SDIxBPYtpWA
         L1NXfrDlcoXbQtKiY7MJdlLULqMBRN5s1r76kqbW6RFCC/TkIycw8TIn5rF6HaRjwCw4
         j7LjnJCNseFTgGMIZ7ZjUaMo+VJ7GS/5+t+GRTL/dPCFAZRuapD4VHadxwS3nQfF3zfm
         EFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873239; x=1792478039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYKKpt0tc4Cu0252xNjxETgSKgylAncBihmzE916KW4=;
        b=fMItx/wH36y7Y58NjJYO3MjIJ6RDfvsFCSkbac43LJE3HrK1TRran4VHGXlj2t8NST
         UOfTAKd75eoJZQt+3kmdcViRcdrJfHvF1fvmRkcHZmdH7A2QE0/00erq3YLcOuLb+uW3
         /czYlh4DvSOOjMGXLQzpxG6DdNqB9HTHY4HM92F39KXgEidzfgUFvFz8bSMnzDTd5y1V
         OEqW1KyJiaSbZVl+WQNJDCAYe3WmuxYpMevzTXiprTOulooTagSup+pVeOznHFxIv/h+
         Oltbw3y92APDIE+WQb96MsHAGh9xWyK07BAjAoHsGIVQFqe6fhs4Ed/F4R9HQoYk/5+t
         PsAg==
X-Gm-Message-State: AFq9FYJaupCrPqKLI4GYepz82UEN6v5zQwcDfukV4Ep8lhyG2DvrVCNW
	Yhc7NJip8GcpjUrdM4zASvgYiejaTDQ7j6a5acEfS+0LsQA1LfOExGr0
X-Gm-Gg: AYBFou0kDALVdo9k/fdUWR0ETAnbo2IgQ8V19PfYKTwYTAQi/KwnNNl2kNG5pbWH9KI
	vYyy4dumWV1d3Vwja0vWvOixSFg63s6bq4piaCr/j3N2D1Do1I6bNuMUB/U+LULXS5kVijG92eA
	wg6i8NOKy3/S05YEc90OM7iGpsWKDbHnRSFSif8nHrz+zt1md2oNlpi4r4dx3iJJZTexM1ofTcq
	7QU/XoTcPUDIvvyhEyiBXmTsqiV01O97cbtg+/5JSEIq5kg4mF4m70pi7NC6aIg1QUC5n6Hs+Fa
	5J4tJ9cqueinKAaxJKfpvVZU8hWJX6gWEyYndaDn/86aRBF7ihPQ+FbrxAso43F301L9YuwJmSh
	0yjwPxamrU3APwSUYVVwTPZ5lQG2dLFhdHRjtQe9pH/fh1BGzyQGf7VlGaa03v6nkpcrBoTFEfM
	0Y8/0bFlrVviLcPPFF+0xgngiTaHvJ8+EjJWk66PCB5ARxMba5cjJLUpCtmNg2rx9TIuBMizag8
	ElSBOcoJzhGiJqHxEYzJXY4C407LxmF6PhpOpBzaQ==
X-Received: by 2002:a17:90a:c10e:b0:3a4:d476:e0e6 with SMTP id 98e67ed59e1d1-3ab3a8d4c68mr9872253a91.52.1791873238830;
        Mon, 12 Oct 2026 23:33:58 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:58 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 07/12] mfd: nct6694: Rename USB transport functions with _usb_ prefix
Date: Tue, 13 Oct 2026 14:32:53 +0800
Message-Id: <20261013063259.2734757-8-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
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
header so that the sub-device drivers remain untouched; they are
reimplemented on top of regmap later in the series.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- Reworded the commit message: the wrappers are reimplemented on top of
  regmap rather than removed.

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


Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF2A481AB7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365066; cv=none; b=ms2SXWr3BDKTzM5l0e+ls1VgwSKxQFcbFWLy0FWEBJSx3dNzvzefneursN9roB6fPOMFOMZKUIGR4yIcRPeA7l9Yi+bhk2U2eiwG9AFVtEH5xRLu/vY8zrIUnTB58/pQaZOyxjmyvmTv6OrEEajAREchMDZcVo0Xhk/GdYcUGYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365066; c=relaxed/simple;
	bh=eqYRwonbRwjp4FIh9sN6VbsBjUmhWXOqslRucD1yfaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RRTEWFmPEnRuFJN4Dq3ex3Mf26URj5FT7HVXVMC+/h3uLb0OUuoIak7GKsRi2wmV7c9vqtIrAI3Lybg3YaQwpdtC1tIXgQUcgzTTosfnze/3Kd6pT55H0zbfK8nPEFSZNHXkIIUi9a5IFYOsGSov47kvnd2aztzIMFZ8WGUN7WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/EzAwSr; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/EzAwSr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd9cbb661bso13054605ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364901; x=1791969701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrkdW5GVJ+KoXFLPX9/Nux9uzqYJBmsLZ89lme6Nl68=;
        b=W/EzAwSrSoPAtOVSzbwT1nwL39uXL6EavgVGlwu/axIWYwDGNRCsLR8Hwx+ThlYlKq
         ffpppQ0iiJdzVSeIKlPKltjdVgm79kY3LM1B/UzmTyqQHczCAg5QlRUgqakPWCAc9SFB
         s1657hR2FzOugL5uwI4TFnpIT2jZWUrMnONGyZHLdih5E43a/XQ3YB/1boxEQ7V/pHHQ
         PJfIVlOr/2OWoI+TvWrDjOW68qhR1+rWIP5JTJn44gfQSI03svXMzYpeU4j6ZpaTvpHO
         8TyCOEClQY2dgPQLz3CcsubyrbTvwUv2wcpbkZ8MbSpVRmEmE5u/1p/R1R0ahmfcyBe8
         aGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364901; x=1791969701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrkdW5GVJ+KoXFLPX9/Nux9uzqYJBmsLZ89lme6Nl68=;
        b=ZYStVdP3A2Y5hDobog5+vPwcVxLMyBgq+DNaz37BBwJRnAOQ9T81fLLrfS+PKMbA8O
         6W69HpigDJyRvOWpJw5dQ/kFWJhfpnuX4fEkWfr2BUxZmsOyOtuff9zjZ+PyNtwLio8J
         zztLqn4mGPiIGjlW/1tLcOUmo/X6NAqRrzqGloMuUO/Zd6IVtE9SDd9fP65aSVSs4geU
         VXNgRofth4j8EESItJfQ4ybqMoTNs59Y7ofDNIi2jKHbLCYRDvYLMpLx/o4YSs3+d0U9
         DQiLo958mhugIzSstzqNymnu5M3LS2MTyc1bcRtrZx4eH969NVi06UVh8IYzRijzD8HA
         7olA==
X-Gm-Message-State: AFq9FYKawQautSaTU8Zn5NqI8YaBx8AtSyfq9qo5GE8U8mPkkYiQP0Kf
	xWOBxneswOee90zBosmeaplB4OXMM9orDIhGpQjZgoBGhGRYam4N7L6XW7VzDA==
X-Gm-Gg: AYBFou0ji+A3v0LgoM307vULtmlFJGlfwCBexnPW32THSozWIN4GK6GhIDIxgslFMps
	J5DatYRFnUqFAqYOhp7bW39/E8ws0iY+zKivg06EijQuuRtu1isryZqOpfaXgbMig0uBbkeN8T6
	++cE/8Qxyk+NkGX7zM5AT5tArYqz3197A8QzXYO4lclAIUQUYZAIK1Z+BD4KVH4NV461q0HyA4Q
	O4fbgyU9GLOy0t+OfOp7pq4BjFjwrYvrOa/RZuAp+D+A5AHgT5ywvpiDQUQnZs9wdUBkSl1yI1r
	id5qHK4ssZvSrJ8zTu/Bv/UJzg+NmjcAJ+l0YSs5poBDKmXi+2ibBYfWNOuDOt6IFUt4r6cRyaV
	yFeYe42AD7oAeuutAB6FvxmHcIGu/XRCvClM0v9GQWarowdVf1jU/Ry4UlTVd6akC7SVC3lrZej
	Z0SYMf8yNwc+2qP/S4E0Xy043e4AdgAwdsNu88oWJc4iPNwhPmz4D80RH1z+qb/b3ekNqsL7Z4m
	PBnIim0XugE6OWzMMRK4Z1bUnCuuEGtzsnC01X4
X-Received: by 2002:a17:903:2c8:b0:2dd:c053:9c70 with SMTP id d9443c01a7336-2e6004f2a86mr15712595ad.38.1791364901200;
        Wed, 07 Oct 2026 02:21:41 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:40 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 07/13] mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
Date: Wed,  7 Oct 2026 17:20:56 +0800
Message-Id: <20261007092102.3768818-8-a0282524688@gmail.com>
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

Separate the USB transport fields from the core nct6694 structure into
a new nct6694_usb_data structure, which embeds struct nct6694 and is
retrieved with container_of(). USB-only definitions are moved from the
shared header into the USB driver.

While at it, use consistent names for the USB device, the buffers and
the core structure.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- Embedded struct nct6694 in nct6694_usb_data and dropped the priv
  pointer.
- Renamed udev to usb_dev, udata to usb_data, usb_msg to hdr_buf,
  int_buffer to int_buf, int_in_urb to int_urb, and nct6694 to ddata.

Changes in v7:
- None.

Changes in v6:
- None.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 drivers/mfd/nct6694.c       | 243 +++++++++++++++++++++---------------
 include/linux/mfd/nct6694.h |  26 +---
 2 files changed, 143 insertions(+), 126 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index f9ae8476fcae..6d75b1485350 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -22,6 +22,34 @@
 #include <linux/spinlock.h>
 #include <linux/usb.h>
 
+#define NCT6694_VENDOR_ID	0x0416
+#define NCT6694_PRODUCT_ID	0x200B
+#define NCT6694_INT_IN_EP	0x01
+#define NCT6694_BULK_IN_EP	0x02
+#define NCT6694_BULK_OUT_EP	0x03
+
+#define NCT6694_URB_TIMEOUT	1000
+
+union __packed nct6694_usb_hdr {
+	struct nct6694_cmd_header cmd_header;
+	struct nct6694_response_header response_header;
+};
+
+struct nct6694_usb_data {
+	struct nct6694 core;
+	struct mutex access_lock;
+	struct usb_device *usb_dev;
+	struct urb *int_urb;
+	union nct6694_usb_hdr *hdr_buf;
+	void *data_buf;
+	__le32 *int_buf;
+};
+
+static struct nct6694_usb_data *to_nct6694_usb_data(struct nct6694 *ddata)
+{
+	return container_of(ddata, struct nct6694_usb_data, core);
+}
+
 static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
@@ -58,22 +86,22 @@ static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-rtc"),
 };
 
-static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char err_status)
+static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char err_status)
 {
 	switch (err_status) {
 	case NCT6694_NO_ERROR:
 		return 0;
 	case NCT6694_NOT_SUPPORT_ERROR:
-		dev_err(nct6694->dev, "Command is not supported!\n");
+		dev_err(ddata->dev, "Command is not supported!\n");
 		break;
 	case NCT6694_NO_RESPONSE_ERROR:
-		dev_warn(nct6694->dev, "Command received no response!\n");
+		dev_warn(ddata->dev, "Command received no response!\n");
 		break;
 	case NCT6694_TIMEOUT_ERROR:
-		dev_warn(nct6694->dev, "Command timed out!\n");
+		dev_warn(ddata->dev, "Command timed out!\n");
 		break;
 	case NCT6694_PENDING:
-		dev_err(nct6694->dev, "Command is pending!\n");
+		dev_err(ddata->dev, "Command is pending!\n");
 		break;
 	default:
 		return -EINVAL;
@@ -84,7 +112,7 @@ static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char
 
 /**
  * nct6694_read_msg() - Read message from NCT6694 device
- * @nct6694: NCT6694 device pointer
+ * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer to store the response data
  *
@@ -94,60 +122,61 @@ static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
 {
-	union nct6694_usb_msg *msg = nct6694->usb_msg;
-	struct usb_device *udev = nct6694->udev;
+	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
+	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
+	struct usb_device *usb_dev = usb_data->usb_dev;
 	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
 	if (data_len > NCT6694_MAX_DATA_LEN)
 		return -EINVAL;
 
-	guard(mutex)(&nct6694->access_lock);
+	guard(mutex)(&usb_data->access_lock);
 
-	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
-	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
+	memcpy(&hdr->cmd_header, cmd_hd, sizeof(*cmd_hd));
+	hdr->cmd_header.hctrl = NCT6694_HCTRL_GET;
 
 	/* Send command packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
-			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_sndbulkpipe(usb_dev, NCT6694_BULK_OUT_EP),
+			   &hdr->cmd_header, sizeof(*hdr), &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	/* Receive response packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
-			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_rcvbulkpipe(usb_dev, NCT6694_BULK_IN_EP),
+			   &hdr->response_header, sizeof(*hdr), &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != sizeof(msg->response_header)) {
-		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
-			sizeof(msg->response_header), rx_len);
+	if (rx_len != sizeof(hdr->response_header)) {
+		dev_err(ddata->dev, "Expected response length %zu, but got %d\n",
+			sizeof(hdr->response_header), rx_len);
 		return -EIO;
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
-			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_rcvbulkpipe(usb_dev, NCT6694_BULK_IN_EP),
+			   usb_data->data_buf, data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	if (rx_len != data_len) {
-		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
+		dev_err(ddata->dev, "Expected received length %d, but got %d\n",
 			data_len, rx_len);
 		return -EIO;
 	}
 
-	memcpy(buf, nct6694->data_buf, data_len);
+	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_read_msg);
 
 /**
  * nct6694_write_msg() - Write message to NCT6694 device
- * @nct6694: NCT6694 device pointer
+ * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer containing the data to be sent
  *
@@ -156,67 +185,68 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
 {
-	union nct6694_usb_msg *msg = nct6694->usb_msg;
-	struct usb_device *udev = nct6694->udev;
+	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
+	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
+	struct usb_device *usb_dev = usb_data->usb_dev;
 	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
 	if (data_len > NCT6694_MAX_DATA_LEN)
 		return -EINVAL;
 
-	guard(mutex)(&nct6694->access_lock);
+	guard(mutex)(&usb_data->access_lock);
 
-	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
-	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
-	memcpy(nct6694->data_buf, buf, data_len);
+	memcpy(&hdr->cmd_header, cmd_hd, sizeof(*cmd_hd));
+	hdr->cmd_header.hctrl = NCT6694_HCTRL_SET;
+	memcpy(usb_data->data_buf, buf, data_len);
 
 	/* Send command packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
-			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_sndbulkpipe(usb_dev, NCT6694_BULK_OUT_EP),
+			   &hdr->cmd_header, sizeof(*hdr), &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	/* Send data packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), nct6694->data_buf,
-			   data_len, &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_sndbulkpipe(usb_dev, NCT6694_BULK_OUT_EP),
+			   usb_data->data_buf, data_len, &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	/* Receive response packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
-			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_rcvbulkpipe(usb_dev, NCT6694_BULK_IN_EP),
+			   &hdr->response_header, sizeof(*hdr), &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != sizeof(msg->response_header)) {
-		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
-			sizeof(msg->response_header), rx_len);
+	if (rx_len != sizeof(hdr->response_header)) {
+		dev_err(ddata->dev, "Expected response length %zu, but got %d\n",
+			sizeof(hdr->response_header), rx_len);
 		return -EIO;
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
-			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(usb_dev, usb_rcvbulkpipe(usb_dev, NCT6694_BULK_IN_EP),
+			   usb_data->data_buf, data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
 	if (rx_len != data_len) {
-		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
+		dev_err(ddata->dev, "Expected transmitted length %d, but got %d\n",
 			data_len, rx_len);
 		return -EIO;
 	}
 
-	memcpy(buf, nct6694->data_buf, data_len);
+	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_write_msg);
 
 static void usb_int_callback(struct urb *urb)
 {
-	struct nct6694 *nct6694 = urb->context;
+	struct nct6694 *ddata = urb->context;
 	__le32 *status_le = urb->transfer_buffer;
 	u32 int_status;
 	int ret;
@@ -240,34 +270,34 @@ static void usb_int_callback(struct urb *urb)
 	while (int_status) {
 		int irq = __ffs(int_status);
 
-		generic_handle_domain_irq_safe(nct6694->domain, irq);
+		generic_handle_domain_irq_safe(ddata->domain, irq);
 		int_status &= ~BIT(irq);
 	}
 
 resubmit:
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret)
-		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
+		dev_warn(ddata->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
 }
 
 static void nct6694_irq_enable(struct irq_data *data)
 {
-	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	struct nct6694 *ddata = irq_data_get_irq_chip_data(data);
 	irq_hw_number_t hwirq = irqd_to_hwirq(data);
 
-	guard(spinlock_irqsave)(&nct6694->irq_lock);
+	guard(spinlock_irqsave)(&ddata->irq_lock);
 
-	nct6694->irq_enable |= BIT(hwirq);
+	ddata->irq_enable |= BIT(hwirq);
 }
 
 static void nct6694_irq_disable(struct irq_data *data)
 {
-	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	struct nct6694 *ddata = irq_data_get_irq_chip_data(data);
 	irq_hw_number_t hwirq = irqd_to_hwirq(data);
 
-	guard(spinlock_irqsave)(&nct6694->irq_lock);
+	guard(spinlock_irqsave)(&ddata->irq_lock);
 
-	nct6694->irq_enable &= ~BIT(hwirq);
+	ddata->irq_enable &= ~BIT(hwirq);
 }
 
 static const struct irq_chip nct6694_irq_chip = {
@@ -279,9 +309,9 @@ static const struct irq_chip nct6694_irq_chip = {
 
 static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
 {
-	struct nct6694 *nct6694 = d->host_data;
+	struct nct6694 *ddata = d->host_data;
 
-	irq_set_chip_data(irq, nct6694);
+	irq_set_chip_data(irq, ddata);
 	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
 
 	return 0;
@@ -310,9 +340,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 		USB_DIR_IN | NCT6694_INT_IN_EP,
 		0
 	};
-	struct usb_device *udev = interface_to_usbdev(iface);
+	struct usb_device *usb_dev = interface_to_usbdev(iface);
+	struct nct6694_usb_data *usb_data;
 	struct device *dev = &iface->dev;
-	struct nct6694 *nct6694;
+	struct nct6694 *ddata;
 	unsigned int int_pipe;
 	int ret;
 
@@ -320,58 +351,61 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	    !usb_check_int_endpoints(iface, int_ep_addr))
 		return -ENODEV;
 
-	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
-	if (!nct6694)
+	usb_data = devm_kzalloc(dev, sizeof(*usb_data), GFP_KERNEL);
+	if (!usb_data)
 		return -ENOMEM;
 
-	nct6694->usb_msg = devm_kzalloc(dev, sizeof(union nct6694_usb_msg), GFP_KERNEL);
-	if (!nct6694->usb_msg)
+	usb_data->hdr_buf = devm_kzalloc(dev, sizeof(*usb_data->hdr_buf), GFP_KERNEL);
+	if (!usb_data->hdr_buf)
 		return -ENOMEM;
 
-	nct6694->data_buf = devm_kzalloc(dev, NCT6694_MAX_DATA_LEN, GFP_KERNEL);
-	if (!nct6694->data_buf)
+	usb_data->data_buf = devm_kzalloc(dev, NCT6694_MAX_DATA_LEN, GFP_KERNEL);
+	if (!usb_data->data_buf)
 		return -ENOMEM;
 
-	nct6694->int_buffer = devm_kzalloc(dev, sizeof(*nct6694->int_buffer), GFP_KERNEL);
-	if (!nct6694->int_buffer)
+	usb_data->int_buf = devm_kzalloc(dev, sizeof(*usb_data->int_buf), GFP_KERNEL);
+	if (!usb_data->int_buf)
 		return -ENOMEM;
 
-	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!nct6694->int_in_urb)
+	usb_data->int_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!usb_data->int_urb)
 		return -ENOMEM;
 
-	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
-						   &nct6694_irq_domain_ops,
-						   nct6694);
-	if (!nct6694->domain) {
+	ddata = &usb_data->core;
+
+	ddata->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
+						 &nct6694_irq_domain_ops,
+						 ddata);
+	if (!ddata->domain) {
 		ret = -ENODEV;
 		goto err_urb;
 	}
 
-	nct6694->dev = dev;
-	nct6694->udev = udev;
+	ddata->dev = dev;
+	usb_data->usb_dev = usb_dev;
 
-	ida_init(&nct6694->gpio_ida);
-	ida_init(&nct6694->i2c_ida);
-	ida_init(&nct6694->canfd_ida);
-	ida_init(&nct6694->wdt_ida);
+	ida_init(&ddata->gpio_ida);
+	ida_init(&ddata->i2c_ida);
+	ida_init(&ddata->canfd_ida);
+	ida_init(&ddata->wdt_ida);
 
-	spin_lock_init(&nct6694->irq_lock);
+	spin_lock_init(&ddata->irq_lock);
 
-	ret = devm_mutex_init(dev, &nct6694->access_lock);
+	ret = devm_mutex_init(dev, &usb_data->access_lock);
 	if (ret)
 		goto err_ida;
 
-	int_pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
-	usb_fill_int_urb(nct6694->int_in_urb, udev, int_pipe,
-			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
-			 nct6694, usb_pipe_endpoint(udev, int_pipe)->desc.bInterval);
+	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
+	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
+			 usb_data->int_buf, sizeof(*usb_data->int_buf),
+			 usb_int_callback, ddata,
+			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
-	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
 	if (ret)
 		goto err_ida;
 
-	usb_set_intfdata(iface, nct6694);
+	usb_set_intfdata(iface, ddata);
 
 	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
 	if (ret)
@@ -380,30 +414,31 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	return 0;
 
 err_mfd:
-	usb_kill_urb(nct6694->int_in_urb);
+	usb_kill_urb(usb_data->int_urb);
 err_ida:
-	ida_destroy(&nct6694->wdt_ida);
-	ida_destroy(&nct6694->canfd_ida);
-	ida_destroy(&nct6694->i2c_ida);
-	ida_destroy(&nct6694->gpio_ida);
-	irq_domain_remove(nct6694->domain);
+	ida_destroy(&ddata->wdt_ida);
+	ida_destroy(&ddata->canfd_ida);
+	ida_destroy(&ddata->i2c_ida);
+	ida_destroy(&ddata->gpio_ida);
+	irq_domain_remove(ddata->domain);
 err_urb:
-	usb_free_urb(nct6694->int_in_urb);
+	usb_free_urb(usb_data->int_urb);
 	return ret;
 }
 
 static void nct6694_usb_disconnect(struct usb_interface *iface)
 {
-	struct nct6694 *nct6694 = usb_get_intfdata(iface);
-
-	mfd_remove_devices(nct6694->dev);
-	usb_kill_urb(nct6694->int_in_urb);
-	ida_destroy(&nct6694->wdt_ida);
-	ida_destroy(&nct6694->canfd_ida);
-	ida_destroy(&nct6694->i2c_ida);
-	ida_destroy(&nct6694->gpio_ida);
-	irq_domain_remove(nct6694->domain);
-	usb_free_urb(nct6694->int_in_urb);
+	struct nct6694 *ddata = usb_get_intfdata(iface);
+	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
+
+	mfd_remove_devices(ddata->dev);
+	usb_kill_urb(usb_data->int_urb);
+	ida_destroy(&ddata->wdt_ida);
+	ida_destroy(&ddata->canfd_ida);
+	ida_destroy(&ddata->i2c_ida);
+	ida_destroy(&ddata->gpio_ida);
+	irq_domain_remove(ddata->domain);
+	usb_free_urb(usb_data->int_urb);
 }
 
 static const struct usb_device_id nct6694_ids[] = {
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index d46ae34a497e..0ab2bd3bfdc1 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -2,7 +2,8 @@
 /*
  * Copyright (C) 2025 Nuvoton Technology Corp.
  *
- * Nuvoton NCT6694 USB transaction and data structure.
+ * Nuvoton NCT6694 core definitions shared by the transport driver
+ * and the sub-device drivers.
  */
 
 #ifndef __MFD_NCT6694_H
@@ -17,17 +18,9 @@
 #define NCT6694_RPT_MOD		0xFF
 #define NCT6694_GPIO_MOD	NCT6694_RPT_MOD
 
-#define NCT6694_VENDOR_ID	0x0416
-#define NCT6694_PRODUCT_ID	0x200B
-#define NCT6694_INT_IN_EP	0x01
-#define NCT6694_BULK_IN_EP	0x02
-#define NCT6694_BULK_OUT_EP	0x03
-
 #define NCT6694_HCTRL_SET	0x40
 #define NCT6694_HCTRL_GET	0x80
 
-#define NCT6694_URB_TIMEOUT	1000
-
 /* Maximum data packet length the firmware accepts in a single command */
 #define NCT6694_MAX_DATA_LEN	0x3F0
 
@@ -87,11 +80,6 @@ struct __packed nct6694_response_header {
 	__le16 len;
 };
 
-union __packed nct6694_usb_msg {
-	struct nct6694_cmd_header cmd_header;
-	struct nct6694_response_header response_header;
-};
-
 struct nct6694 {
 	struct device *dev;
 	struct ida gpio_ida;
@@ -99,17 +87,11 @@ struct nct6694 {
 	struct ida canfd_ida;
 	struct ida wdt_ida;
 	struct irq_domain *domain;
-	struct mutex access_lock;
 	spinlock_t irq_lock;
-	struct urb *int_in_urb;
-	struct usb_device *udev;
-	union nct6694_usb_msg *usb_msg;
-	void *data_buf;
-	__le32 *int_buffer;
 	unsigned int irq_enable;
 };
 
-int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
-int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
 
 #endif
-- 
2.34.1


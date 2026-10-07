Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E238DC60
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365048; cv=none; b=DjoGN2riXMaWETVSwmxhONzdPyC6NX+fa6CJ50xJsn34Y2acKME1Sattl/ks5Xnds2xHn7F3bDUXPBK7SUFfVRNwO3/6WWD4ZI05kQcp5o5qOUIhYPYZCpXcBLnYYwcopoU4w6UnGMdB2i5I6ozmwTP7aepxtp0XqA00W05b4jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365048; c=relaxed/simple;
	bh=lwl219Eul8sd2YUowkYzF2XehSm9alrV9NAQ4ulqNg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LgOAh0z0NVA76lNn/cK6nYBWMwtQgch88puLVVAZU59SH82JHh5O2570rPypCZqxs8RTfexuGaRe0UhQrUbBn8iCn+jBpK4pmFKOJf92Bb2dmufyTulBmi+D8rzFpMZ/ZkGfZ4Rds6azpqPGKfEtkKILB9PEWzVWZchIL1itGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPHVABVz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPHVABVz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e4a2daa7d7so31946505ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364893; x=1791969693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlKsVhXXEnTprcKi3X5NkMsv3N8/DBr+v1s53F8QycE=;
        b=QPHVABVz0/OljXujo/8CA5FPYuGSPpDQ/XmapDISyKmEsfAyHc+/jPQoWMMr9kDdGu
         p6fRTHIEvBmx/Ysv0idBgoodyG/s97NAAgWC71/2r4yQSs5SyyxIRTW7KMF9uLxYWA4+
         P0VQZ1DP3diwBJH59Mj+b9nqfTheU/6RUJU/TAXM+UNhxH1k7FDB2PUfqLkc3iHNcBcn
         r2bYy+8PONghPBRoN1m8rypLS/Bi7RxoKZX3zEmgLYUso2m++KTt9J7KB8p1FwgwZm4U
         4xWPnbaj+NPZ/aCHt4jbV70nVDPtBB/q6pHXxE3EwORLsbr9qpOyVGLdostaSjMdH7sy
         VTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364893; x=1791969693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlKsVhXXEnTprcKi3X5NkMsv3N8/DBr+v1s53F8QycE=;
        b=WUbjxdx690zPX7mPcm/a6y1ketpTu31CMhkSjDlwuU8Fc0wuSpXgHZAaIVUoVxjpUw
         3YJboP60KyyWyvpo5OJjmzBpoRh/u9GL1qNdMF0v6DpW8JZZ+ZGZ/rPiZJsxk/xLg4f4
         UT0kWMkQ5Dk6bG/yr/E8Z8if1sCDbKCxFxVP9QUH8HebFivx2JBWWkLUggBq/hXV+VXP
         QYEl6D8XPFwcxS7NrZsKlejsKKWaFppzTcCPkGG0yHKl3NXWNdfxJL+tU4v7gno0mlZG
         sivgYekKBqZJxAlNp5q3DK1A81GyTKpuL5Bvz7lDV+30FZmZvkZ0T4169ZLKzPgJLCqA
         zLww==
X-Gm-Message-State: AFq9FYJ2HOVwfuIdTvdHDxr/F6x4+zsRWuuzdMl2CZNGk2emMk4DYC+k
	SvO+ANdJtMjRjpVuTyyJT6GpUvKhfgmkHFFl50XlKyvHvIrytRTdodp/AwdAJw==
X-Gm-Gg: AYBFou3NcDKSW8T+6oxmgEWsX2aQQNjq19VtRHASd9QMEWFHY4bu+N2VFX9C61o9aAz
	w+HmWegd9Qo5m5YGoAkMdhywjKVktoKiXI9rewI+u9/CKw/OHZfKPqIRZr/MQlSjNEXWYBqBjCL
	yWjlbfayM1t/Z+3e4LHv0hGslQpXtRx08h7RK8pk3hUNT0w+Ppu4h0P4IKn3FJy6sqRq8zEYAts
	sa3cJ4AjkqMYBQ1j3K57C7VzReoBVXXJ3A7ktZbHAY5IZh+dULQWP0VGPgGf19heOXY5q0pc/sQ
	deDIQyBvaadX2dEEqqoR1VnMGVUe7mdTH88ypMk3G797T06YoL6oi/0R+qtVdsWchTll2YpDeBc
	PCZet9QrXvysjQ5RK9mZ/HjK2ytzZ1GqDfgKGziolPrgV51JKPutr13WJB6r7OpK12h/KRTTxEP
	fn5rZiizHrEYFx1cDfCFpTJSrVbXXhKzlJ6tGqjYGdeNeJ/4nOTmH1Qm+V1L/hfpBSBCQBrA2ol
	PB7quds+YTCLHmcvgBuDR9jckgkLL/OYG5E2mAVMSQCvIF2gsM=
X-Received: by 2002:a17:902:f688:b0:2dd:ad74:ac22 with SMTP id d9443c01a7336-2e60024aedcmr17569995ad.29.1791364892870;
        Wed, 07 Oct 2026 02:21:32 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:32 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 05/13] mfd: nct6694: Transfer data packets via a dedicated buffer
Date: Wed,  7 Oct 2026 17:20:54 +0800
Message-Id: <20261007092102.3768818-6-a0282524688@gmail.com>
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

The caller's buffer is passed straight to usb_bulk_msg(). Sub-device
drivers embed those buffers in their private data, so they are neither
cacheline aligned nor exclusively owned by the transfer, and mapping
them for DMA can corrupt adjacent fields on non-coherent architectures.

Transfer the data packets through a buffer owned by the transport, and
reject commands exceeding the maximum data length.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- Moved before the refactoring so it applies to the original driver.
- Renamed xfer_buf to data_buf, len to data_len and
  NCT6694_MAX_PACKET_SIZE to NCT6694_MAX_DATA_LEN.

Changes in v7:
- New patch.

 drivers/mfd/nct6694.c       | 37 +++++++++++++++++++++++++++----------
 include/linux/mfd/nct6694.h |  4 ++++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 4f5a5b855de2..f9ae8476fcae 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -98,8 +98,12 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 {
 	union nct6694_usb_msg *msg = nct6694->usb_msg;
 	struct usb_device *udev = nct6694->udev;
+	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
+	if (data_len > NCT6694_MAX_DATA_LEN)
+		return -EINVAL;
+
 	guard(mutex)(&nct6694->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
@@ -124,17 +128,19 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
+			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+	if (rx_len != data_len) {
 		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
-			le16_to_cpu(cmd_hd->len), rx_len);
+			data_len, rx_len);
 		return -EIO;
 	}
 
+	memcpy(buf, nct6694->data_buf, data_len);
+
 	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_read_msg);
@@ -154,12 +160,17 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 {
 	union nct6694_usb_msg *msg = nct6694->usb_msg;
 	struct usb_device *udev = nct6694->udev;
+	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
+	if (data_len > NCT6694_MAX_DATA_LEN)
+		return -EINVAL;
+
 	guard(mutex)(&nct6694->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
 	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
+	memcpy(nct6694->data_buf, buf, data_len);
 
 	/* Send command packet to USB device */
 	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
@@ -168,8 +179,8 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 		return ret;
 
 	/* Send data packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), nct6694->data_buf,
+			   data_len, &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -186,17 +197,19 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
+			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+	if (rx_len != data_len) {
 		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
-			le16_to_cpu(cmd_hd->len), rx_len);
+			data_len, rx_len);
 		return -EIO;
 	}
 
+	memcpy(buf, nct6694->data_buf, data_len);
+
 	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_write_msg);
@@ -315,6 +328,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (!nct6694->usb_msg)
 		return -ENOMEM;
 
+	nct6694->data_buf = devm_kzalloc(dev, NCT6694_MAX_DATA_LEN, GFP_KERNEL);
+	if (!nct6694->data_buf)
+		return -ENOMEM;
+
 	nct6694->int_buffer = devm_kzalloc(dev, sizeof(*nct6694->int_buffer), GFP_KERNEL);
 	if (!nct6694->int_buffer)
 		return -ENOMEM;
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index a5ad7be47bf9..69e4652cf16c 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -19,6 +19,9 @@
 
 #define NCT6694_URB_TIMEOUT	1000
 
+/* Maximum data packet length the firmware accepts in a single command */
+#define NCT6694_MAX_DATA_LEN	0x3F0
+
 enum nct6694_irq_id {
 	NCT6694_IRQ_GPIO0 = 0,
 	NCT6694_IRQ_GPIO1,
@@ -92,6 +95,7 @@ struct nct6694 {
 	struct urb *int_in_urb;
 	struct usb_device *udev;
 	union nct6694_usb_msg *usb_msg;
+	void *data_buf;
 	__le32 *int_buffer;
 	unsigned int irq_enable;
 };
-- 
2.34.1


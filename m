Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB8F3C1D62
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531996; cv=none; b=seW+j+XFwnPcHDvWzklwc7zECNJlm3Bl+pKo4wgrw28mwZPZNMg113GLRVg8DO/C27jLN6iP1nb8NL4HjsxfLsQCJKuOPOSpQIMicct8/nc9w9M+EBTROPGKvAeAeYbgsvzFQf4OCAfsSPv6yrf4TLuduTOplUcxWre4MLno5qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531996; c=relaxed/simple;
	bh=gzcIvKTV0eCRqXTbax+Ml31cWnykn6ExDAmr6K91wxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=hdCgI5P5umFXoMNg1pAa4dz7WTml62D6DVtqWm7INIttZPcA19zLfYd2uz+Q49cFvQQf5y4Vf9J7OloKLbr5vnsaxwNTz6xeqHPR9urThGBkWalD5rvGsU9VPE10tnpvJiXUGnduETmJiqztVaK1h2Yrytc3g6rfX+vCLT19bNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEt7KLnl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEt7KLnl"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e3846d1caso569330866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531993; x=1792136793; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=joIT/Se5De6fAT89Sw8RzUc39OQIM51cezNYPIh3/Y8=;
        b=GEt7KLnl8QkMjqVWnyw1bw3LtQxLgmYAJ/i3fDEJXBZ6P5QHWgjJfMVej1hLCbo41Z
         GCZjGTzLzBUCEJZ5WH3ET7ljSdlHwEai+k+vB/nbt3yOgGYQ91nSBG+0AC2oTgrTBwu2
         eFMheD8AYLABPGD93ZyEpD02c2RaI9HaFs7y9Eakr9gxZLrmMWVXS6X5g+OG6NW68XgH
         esAtfs3fG1NQR05EQhR9xWpLWWtrmdNk70IIMx83wCJgjP06Dw9OLRKX9TRB1M2VZh6A
         Sbm7RWRPi1JuxDmXNN7kqjXgnq0kq6qJiPlrKpR8MEpIA/a1lBfm5aS6VouGa25/L+fB
         wt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531993; x=1792136793;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joIT/Se5De6fAT89Sw8RzUc39OQIM51cezNYPIh3/Y8=;
        b=FaVK80ydTWxB7Fi2W1H50HpTvACxT9Y5L8P/gvukWLblgHiFoGSgqdpRhh6AlWZGjQ
         AIeI+ua3pUmAW1/W0mKsqZ0Q1MzPU3sTlZYMX/4GOmOVYhcdcmjJ3WmdM2hXvyXyWLUs
         Tu2407jpUCAr7euiW2xViQ3Jah13uMdDylYpke8Ua9qnPEl1xA7FJAErXTvGzjPMedY3
         V0N2tG/O9HRaCNdnXvGcH1GHvvIQg/da0oukX6kedfJV2w/2+0tAR1wnPTVeccA8lMMl
         RzBCVw8aibzhL54DOYBicF5Q+Z5dPasZnKU42BMnX1Nrcm/YJ0z5ppIzxgY/QApsYESy
         +dJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVeoumbUAWyPmnGKKdva1CiIk2Sim8u4XH8LJYCDS7DOVIDtnvNKcvihxGggltiSG2myboDntyTktWMB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7rswD/FRzZlSiUzgrEfFXjY+Fbf1EpqBeH8Tt/yyW1xq2lHO6
	YrN6P63AtG5VCl9BeVH9Tbluc8JSajNrNOA9w35JovCyuv55tCbwYVCv
X-Gm-Gg: AYBFou1oKvIk3A52bTa/y0Uw+2E73Zze/oG3NxPlU2fgV3yF44YnPbWeiZUCv78kpO/
	tLdeCL9kZuu9TRb/bRdaY/vbpPk0y6Am6obgYNNSr9wYGomT8pEU0uihXxH2mAXekKF2j9uGWKl
	pt5tM1Plz0D1qFXPTc7OLFAFs1KNd1wT7nyE59EEEXpY3AU4kmeCKER81YjFQOJ1WOtqIC493H5
	oZaFsZl4vGsgNuzS+MmE6rfnJFzYTaJq4NMZh9SMrJVEip8VY35PIL/QiI20Bbr9OEUtEkmnTDB
	lLgsSEhG+mntwMcPCy9tg2LfQO0wXWjSKs7IaTo/a6iOf7aPRBbOdu3CYsV4WEfQy6GMMFXmYqS
	v+YY+XK90Ou+oKREZgANPr5Qz3arm3cU/z45Jde1h6HbnwDbK5EIBMM73ejKTZZufpWijd5RSXH
	TUyRs9mueCj8ua2ski7nLa3Iyvc8IzU70oQu0UfoRg9DONxUiyp13masIqWPZD1DIbQBZa8CEda
	SWv2NeYytVk1x51PbH/E575lg==
X-Received: by 2002:a17:907:d08f:b0:c2d:ba65:4ffe with SMTP id a640c23a62f3a-c31a9d303famr83978066b.24.1791531992825;
        Fri, 09 Oct 2026 00:46:32 -0700 (PDT)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31b956019esm20398166b.54.2026.10.09.00.46.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2026 00:46:32 -0700 (PDT)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v6 6/7] char: xillybus: Add defensive sanity checks
Date: Fri,  9 Oct 2026 09:45:56 +0200
Message-Id: <20261009074557.19996-7-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261009074557.19996-1-eli.billauer@gmail.com>
References: <20261009074557.19996-1-eli.billauer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add validation checks for values derived from hardware or user input to
prevent incorrect behavior with malformed data.

Assisted-by: Deepseek:v4-pro Kimi:K2.6 ChatGPT:GPT-5.5 Claude:Sonnet-4.6
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changelog:
    =========
    Changes v5->v6:
     -- Use SZ_1G instead of numerical constant
     -- Rebase to current tree
    
    No change on v4->v5.
    
    Changes v3->v4:
     -- xillyusb.c: Use mutex_unlock() in response to sanity check failure
                    in fifo_init(), as guard() isn't used anymore on this
                    mutex.
     -- xillyusb.c and xillybus_core.c: Remove sanity check on data count on
                    read() and write() fops methods, as this check is already
                    done by the kernel's vfs_read() and vfs_write().
    
    Changes v2->v3:
     -- Add Assisted-by tag to description
    
    Changes v1->v2:
     -- xillybus_class.c: Assign @rc a value before goto in
                          xillybus_init_chrdev().
     -- xillybus_class.c: Improve check on @inode in xillybus_find_inode().
     -- xillybus_of.c:    Remove redundant dev_err(), as platform_get_irq()
                          outputs an error message if necessary.

 drivers/char/xillybus/xillybus_class.c | 18 +++++++++++++--
 drivers/char/xillybus/xillybus_class.h |  3 +++
 drivers/char/xillybus/xillybus_core.c  | 32 ++++++++++++++++++++++++--
 drivers/char/xillybus/xillybus_of.c    |  3 +++
 drivers/char/xillybus/xillyusb.c       | 26 ++++++++++++++++++++-
 5 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_class.c b/drivers/char/xillybus/xillybus_class.c
index 5e8f03b77064..f7e0da233e2a 100644
--- a/drivers/char/xillybus/xillybus_class.c
+++ b/drivers/char/xillybus/xillybus_class.c
@@ -57,6 +57,9 @@ int xillybus_init_chrdev(struct device *dev,
 	size_t namelen;
 	struct xilly_unit *unit, *u;
 
+	if (num_nodes <= 0 || num_nodes > XILLYBUS_MAX_NODES || !idt || !prefix || !dev)
+		return -ENODEV;
+
 	unit = kzalloc_obj(*unit);
 
 	if (!unit)
@@ -68,6 +71,12 @@ int xillybus_init_chrdev(struct device *dev,
 		snprintf(unit->name, UNITNAMELEN, "%s", prefix);
 
 	for (i = 0; enumerate; i++) {
+		if (i > 99) {
+			dev_err(dev, "Failed to obtain unique unit name\n");
+			rc = -ENODEV;
+			goto fail_obtain;
+		}
+
 		snprintf(unit->name, UNITNAMELEN, "%s_%02d",
 			 prefix, i);
 
@@ -215,10 +224,15 @@ EXPORT_SYMBOL(xillybus_cleanup_chrdev);
 int xillybus_find_inode(struct inode *inode,
 			void **private_data, int *index)
 {
-	int minor = iminor(inode);
-	int major = imajor(inode);
+	int minor, major;
 	struct xilly_unit *unit = NULL, *iter;
 
+	if (!inode || !private_data || !index)
+		return -ENODEV;
+
+	minor = iminor(inode);
+	major = imajor(inode);
+
 	mutex_lock(&unit_mutex);
 
 	list_for_each_entry(iter, &unit_list, list_entry)
diff --git a/drivers/char/xillybus/xillybus_class.h b/drivers/char/xillybus/xillybus_class.h
index 5dbfdfc95c65..4dbed9adcaf8 100644
--- a/drivers/char/xillybus/xillybus_class.h
+++ b/drivers/char/xillybus/xillybus_class.h
@@ -8,6 +8,9 @@
 #ifndef __XILLYBUS_CLASS_H
 #define __XILLYBUS_CLASS_H
 
+#define XILLYBUS_MAX_NODES 1024
+#define XILLYBUS_MAX_IDT 1048576
+
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/fs.h>
diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 3ae95e6b17e9..90c5b3d4e517 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -28,6 +28,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
+#include <linux/sizes.h>
 #include "xillybus.h"
 #include "xillybus_class.h"
 
@@ -351,6 +352,12 @@ static int xilly_get_dma_buffers(struct xilly_endpoint *ep,
 	struct device *dev = ep->dev;
 	struct xilly_buffer *this_buffer = NULL; /* Init to silence warning */
 
+	if (bytebufsize == 0 || bytebufsize > SZ_1G) {
+		dev_err(ep->dev,
+			"Illegal buffer size requested in IDT. Aborting.\n");
+		return -ENODEV;
+	}
+
 	if (buffers) { /* Not the message buffer */
 		this_buffer = devm_kcalloc(dev, bufnum,
 					   sizeof(struct xilly_buffer),
@@ -623,6 +630,12 @@ static int xilly_scan_idt(struct xilly_endpoint *endpoint,
 		return -ENODEV;
 	}
 
+	if (count == 0 || count > XILLYBUS_MAX_NODES) {
+		dev_err(endpoint->dev,
+			"Unreasonable number of channels. Aborting.\n");
+		return -ENODEV;
+	}
+
 	idt_handle->entries = len >> 2;
 	endpoint->num_channels = count;
 
@@ -725,8 +738,18 @@ static ssize_t xillybus_read(struct file *filp, char __user *userbuf,
 			bufidx = channel->wr_host_buf_idx;
 			bufpos = channel->wr_host_buf_pos;
 			howmany = ((channel->wr_buffers[bufidx]->end_offset
-				    + 1) << channel->log2_element_size)
-				- bufpos;
+				    + 1) << channel->log2_element_size);
+
+			if (howmany > channel->wr_buf_size ||
+			    howmany < bufpos) {
+				dev_err(channel->endpoint->dev,
+					"Illegal buffer fill level from hardware\n");
+				channel->endpoint->fatal_error = 1;
+				spin_unlock_irqrestore(&channel->wr_spinlock, flags);
+				break;
+			}
+
+			howmany	-= bufpos;
 
 			/* Update wr_host_* to its post-operation state */
 			if (howmany > bytes_to_do) {
@@ -1902,6 +1925,11 @@ int xillybus_endpoint_discovery(struct xilly_endpoint *endpoint)
 		return -ENODEV;
 	}
 
+	if (endpoint->idtlen < 4 || endpoint->idtlen > XILLYBUS_MAX_IDT) {
+		dev_err(endpoint->dev, "Invalid IDT length. Aborting.\n");
+		return -ENODEV;
+	}
+
 	/* Enable DMA */
 	iowrite32((u32) (0x0002 | (endpoint->dma_using_dac & 0x0001)),
 		  endpoint->registers + fpga_dma_control_reg);
diff --git a/drivers/char/xillybus/xillybus_of.c b/drivers/char/xillybus/xillybus_of.c
index 46e1046abfca..44b0c754deb2 100644
--- a/drivers/char/xillybus/xillybus_of.c
+++ b/drivers/char/xillybus/xillybus_of.c
@@ -53,6 +53,9 @@ static int xilly_drv_probe(struct platform_device *op)
 
 	irq = platform_get_irq(op, 0);
 
+	if (irq < 0)
+		return irq;
+
 	rc = devm_request_irq(dev, irq, xillybus_isr, 0, xillyname, endpoint);
 
 	if (rc)
diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index ddd583304504..bd3babd39f35 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -24,6 +24,7 @@
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <linux/sizes.h>
 #include <linux/crc32.h>
 #include <linux/poll.h>
 #include <linux/delay.h>
@@ -389,6 +390,12 @@ static int fifo_init(struct xillyfifo *fifo,
 	fifo->bufnum = 1 << log2_bufnum;
 	fifo->size = fifo->bufnum * fifo->bufsize;
 
+	if (!fifo->size || /* Unsigned integer overflow */
+	    fifo->size > SZ_1G) { /* Avoid signed int issues */
+		mutex_unlock(&fifo_buf_order_mutex);
+		return -ENOMEM; /* Reported as greed for memory */
+	}
+
 	fifo->mem = kmalloc_array(fifo->bufnum, sizeof(void *), GFP_KERNEL);
 
 	if (!fifo->mem) {
@@ -882,6 +889,7 @@ static int process_in_opcode(struct xillyusb_dev *xdev,
 	struct xillyusb_channel *chan;
 	struct device *dev = xdev->dev;
 	int chan_idx = chan_num >> 1;
+	struct xillyfifo *in_fifo;
 
 	if (chan_idx >= xdev->num_channels) {
 		dev_err(dev, "Received illegal channel ID %d from FPGA\n",
@@ -906,7 +914,10 @@ static int process_in_opcode(struct xillyusb_dev *xdev,
 		 */
 		smp_wmb();
 		WRITE_ONCE(chan->read_data_ok, 0);
-		wake_up_interruptible(&chan->in_fifo->waitq);
+
+		in_fifo = READ_ONCE(chan->in_fifo);
+		if (in_fifo)
+			wake_up_interruptible(&in_fifo->waitq);
 		break;
 
 	case OPCODE_REACHED_CHECKPOINT:
@@ -2066,6 +2077,13 @@ static int xillyusb_discovery(struct usb_interface *interface)
 	}
 
 	idt_len = READ_ONCE(idt_fifo.fill);
+
+	if (idt_len < 4 || idt_len > XILLYBUS_MAX_IDT) {
+		rc = -ENODEV;
+		dev_err(&interface->dev, "Invalid IDT length. Aborting.\n");
+		goto unfifo;
+	}
+
 	idt = kmalloc(idt_len, GFP_KERNEL);
 
 	if (!idt) {
@@ -2100,6 +2118,12 @@ static int xillyusb_discovery(struct usb_interface *interface)
 		goto unidt;
 	}
 
+	if (num_channels == 0 || num_channels > XILLYBUS_MAX_NODES) {
+		dev_err(&interface->dev, "Unreasonable number of channels. Aborting.\n");
+		rc = -ENODEV;
+		goto unidt;
+	}
+
 	rc = setup_channels(xdev, (void *)idt + 3, num_channels);
 
 	if (rc)
-- 
2.34.1


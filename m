Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F8A4279E3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531539; cv=none; b=VXcXhNiIXEUumoL5Rw0DU72FTUWuPtbm+vQI0z6rG8J0kPCDP2SotVNsEP8F6+pXtzP29wr8a5S/9TuIM5OcbbUN9kQoJcFXFDtcnsbtyRgXz9RfFpygHLoRcZEt+kfkRc2tEB7dfk7OrPO+DZ77ElTjKhy/nZqOoir2HG1eC8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531539; c=relaxed/simple;
	bh=qz22BclCWEW4HoY/cJueFvDrcT9HVthELBY9+AHM8j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvzvWtqqZrZsbb5CchPMZbh1OY/T0da/BIDGaMKI4f62HxkKUYT6vgMvMJS2xshLfJHrvX2AvkwwgGqKOB9E7nUZ6UK2N8PN3CPAvnhjqN1Ei1HqGbS1QdrxBdwWXsyzSXunPO+tLso/mQvO+gIiyu7gkeBmdWYMyKuLz5qva4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPJoVr9H; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPJoVr9H"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so13573705e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531535; x=1791136335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9XImCPy7QHPoN4quLQ1lus3OWNtmBZ9BuTXdaG3JBgc=;
        b=CPJoVr9HMEj9l06xADr2Ze7PxYa3TaA0EK1sCsrZzaRzmuDkPXKrAeQ6UJPofIQF8G
         Vb9Jv0/gqJTa7M6wZOXntmgVvC5AsTE3s2rapmwKJPmgybd+4kL9aKiMZ91eWMZSBf95
         5e/NUsog9ac9fa0IZnJGzIKSVXsX17VTS7EyTv/D8cvdvKiVQpELNmxu//HymzVwtjSb
         +ZgTHL9RkZYX0Ysr5Qb4+KIVDOLWEJZ0QV4Zy5kF1s/dWFKul18fNbmEKiojGF/g1bjS
         QpKlgBWb9w/cJ5GZfNb6+9WEQNFPf8u41dR5MMWZb1tiqXFKVCTPx8A5zjthaiqbyout
         EWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531535; x=1791136335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9XImCPy7QHPoN4quLQ1lus3OWNtmBZ9BuTXdaG3JBgc=;
        b=mlX/TbAsBYFMEYWUDv8X7geSxnJUFFdYGIPDh0ctA9Y7cri+QoGlMwILnp596gp7LW
         TfM9zHDGCbUSDconYwetgXw6e5dBp8Clg0Mk8JIFL4+DlQTTCTgsj+pSOJH+7Yn6w3UI
         k8/1Wd/q68W7b+PgaJfeyCVwarCNA6rjy7JMKplYft8U8dLanhMqN1p0DXS7cvkbPoc5
         B+2KnCyPcv+UFNJ9tJ7xSQ4uR+dY6QlHRT7dCQtKM61d/slrZRTAOXZebbvtWv7DJA6V
         42QjexMuUk9kKBikhefVzP1Q2EnAO0/rhEvq/f8SDcthEb7ukFHZkWt+RP5kJzG4utr/
         FIvw==
X-Forwarded-Encrypted: i=1; AKwUvBzTF3ZCiVuisDbYtvut+sq2CW5gKUJ78CNXUvAmojXMViiLIc/dqnF2sBtASUARRqfxq91Hr608zf98X20=@vger.kernel.org
X-Gm-Message-State: AFuF++mlcT/DrXudqb0hQCXCnm651GWV4j5k3GZwYYnsU/Zbgm3jqdS9
	R0PtwUhsMjPNIyrsPKzfIbjez04++cnG4vPGoun/yK45QR8XBfhRRWli
X-Gm-Gg: AYBFou3HF+I8ENyP75+v5TTP4vD3+RGOfka2T3HDEkHSySxrIY0efWloTC71e7T39ve
	wM3gtAo2jGmXv2j8ommCqvRBo3QrZ3q1Iz0bWytJbwMZVtSIcgKOK7OVofaP4KXb1DHAcOd0Kkd
	F5TjLIv2c46BjBIsRYOW0vATAOVlNeOTTE6Ca15XbLoTAZlqNYlclgqy34YTCj8JBtRwi0Kp4vL
	oglORFOmFJKdzZMR5Fcva7iIJiUmbAadFW6MlUTD6NjdttDHrUgw88uCYIRt9zOa/xVTzsu1PtB
	DCTQ8/CV0ba8j7hhfC6kLgTxRRPATudbkCuA4fss1iT7Em0ifD9pTMEyEQxfyNK/TuweZzNAhxx
	jvykwXXFluDrR++hZsLolgRQRjtYznDHFzSbsics2MGDWQ9Y/AOg8i6jey1kKeIXN/meD1tdC1D
	9X7NGCdUsRuHar6Yp2K9ec4RpahwvrbOFyeEI8wFRBM1bz8YEekipz5jH2CrMAC9QrFrEYlG289
	ySd+DGImA1ApA5K8tQOyORUsF/PY4PMCbqVjprh7HodQQNL4GkloegL5HSit3gMCU7N/hWJb9k4
	4A==
X-Received: by 2002:a05:600c:620b:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-49fe667f0bfmr195079235e9.0.1790531534961;
        Sun, 27 Sep 2026 10:52:14 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm22563923f8f.1.2026.09.27.10.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:52:14 -0700 (PDT)
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Kees Cook <kees@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Abhin Parekadan Jose <abhinjoses@gmail.com>
Subject: [PATCH RFC v3 5/5] misc: Add edu_srpoc surprise removal POC driver
Date: Sun, 27 Sep 2026 17:52:02 +0000
Message-ID: <20260927175203.928270-6-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260927175203.928270-1-abhinjoses@gmail.com>
References: <20260927175203.928270-1-abhinjoses@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A test driver for the QEMU edu device that reproduces the surprise
removal hang described in MST's RFC v5 thread.

- hacked in a reg to the edu device on qemu to raise a delayed irq
- This driver writes to that reg in remove and waits for the irq to be
  handled. This simulates del_gendisk() blocked in
  blk_mq_freeze_queue_wait()

remove() blocks until the delayed interrupt arrives, 600 seconds after
it is requested, or until the device is surprise removed and its
disconnect work runs.  That is the purpose of the driver, so a normal
unbind takes 600 seconds, and on a QEMU without the delayed interrupt
register it never returns.  It is only built with CONFIG_EDU_SRPOC.

Assisted-by: LLM
Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>

---
Changes since RFC v1:
- Build only with CONFIG_EDU_SRPOC, which depends on PCI, instead of
  unconditionally. (Sashiko)
- Don't claim the interrupt if the status register reads all ones,
  i.e. the device is gone. (Sashiko)
- Clear bus mastering in the probe error path and in remove(). (Sashiko)
- Document that remove() blocks by design. (Sashiko)
- Fixed a checkpatch warning about braced if() blocks.

RFC v1: https://lore.kernel.org/all/20260905183905.997833-4-abhinjoses@gmail.com/
Sashiko review: https://lore.kernel.org/all/20260905185027.291191F00A3A@smtp.kernel.org/
---
 drivers/misc/Kconfig     |  11 +++
 drivers/misc/Makefile    |   1 +
 drivers/misc/edu_srpoc.c | 171 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 183 insertions(+)
 create mode 100644 drivers/misc/edu_srpoc.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 7364931dad3a1..99457e53d21cf 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -57,6 +57,17 @@ config DUMMY_IRQ
 	  The sole purpose of this module is to help with debugging of systems on
 	  which spurious IRQs would happen on disabled IRQ vector.
 
+config EDU_SRPOC
+	tristate "QEMU edu surprise removal POC driver"
+	depends on PCI
+	help
+	  Test driver for the QEMU edu device.  Its remove() callback blocks
+	  until the device raises a delayed interrupt or is surprise removed,
+	  to reproduce a hang in remove() during surprise removal.  Needs an
+	  edu device with the delayed interrupt register at BAR0 0x30.
+
+	  If unsure, say N.
+
 config IBMVMC
 	tristate "IBM Virtual Management Channel support"
 	depends on PPC_PSERIES
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index e8d8d5d88c0df..9ebcc6ce60f34 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_AD525X_DPOT_I2C)	+= ad525x_dpot-i2c.o
 obj-$(CONFIG_AD525X_DPOT_SPI)	+= ad525x_dpot-spi.o
 obj-$(CONFIG_ATMEL_SSC)		+= atmel-ssc.o
 obj-$(CONFIG_DUMMY_IRQ)		+= dummy-irq.o
+obj-$(CONFIG_EDU_SRPOC)		+= edu_srpoc.o
 obj-$(CONFIG_ICS932S401)	+= ics932s401.o
 obj-$(CONFIG_LKDTM)		+= lkdtm/
 obj-$(CONFIG_TI_FPC202)		+= ti_fpc202.o
diff --git a/drivers/misc/edu_srpoc.c b/drivers/misc/edu_srpoc.c
new file mode 100644
index 0000000000000..b74a95109dba9
--- /dev/null
+++ b/drivers/misc/edu_srpoc.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * edu_srpoc.c Surprise Removal POC driver for the QEMU edu device
+ *
+ * In remove(), schedules a delayed interrupt on the edu device and
+ * blocks waiting for it to complete. This simulates del_gendisk()
+ * blocked in blk_mq_freeze_queue_wait() on slow in-flight I/O.
+ *
+ * Surprise-remove the device during this window to reproduce the hang.
+ *
+ * edu BAR 0 registers used:
+ *   0x08  Factorial: write N to compute N! asynchronously
+ *   0x20  Status: write EDU_STATUS_IRQFACT to enable IRQ on completion
+ *   0x24  IRQ status: bit 0 = FACT_IRQ, bit 9 = DELAY_IRQ
+ *   0x30  Delayed IRQ: write N (ms). Hacked in this functionality(not upstream).
+ *   0x64  IRQ lower: write bitmask to ack
+ */
+
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/interrupt.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+
+#define PCI_VENDOR_ID_EDU	0x1234
+#define PCI_DEVICE_ID_EDU	0x11e8
+
+#define EDU_REG_FACT		0x08
+#define EDU_REG_STATUS		0x20
+#define EDU_REG_DELAYED_IRQ	0x30
+#define EDU_REG_IRQ_STATUS	0x24
+#define EDU_REG_IRQ_LOWER	0x64
+
+#define EDU_STATUS_IRQFACT	0x80
+#define EDU_FACT_IRQ		BIT(0)
+#define EDU_DELAY_IRQ		BIT(9)
+
+struct edu_dev {
+	struct pci_dev		*pdev;
+	void __iomem		*regs;
+	struct completion	irq_done;
+};
+
+static irqreturn_t edu_irq_handler(int irq, void *data)
+{
+	struct edu_dev *edu = data;
+	u32 status;
+
+	status = ioread32(edu->regs + EDU_REG_IRQ_STATUS);
+	/* All ones means the device is gone; the interrupt is not ours */
+	if (!status || PCI_POSSIBLE_ERROR(status))
+		return IRQ_NONE;
+
+	iowrite32(status, edu->regs + EDU_REG_IRQ_LOWER);
+
+	if (status & (EDU_FACT_IRQ | EDU_DELAY_IRQ))
+		complete(&edu->irq_done);
+
+	return IRQ_HANDLED;
+}
+
+static void edu_disconnect(struct work_struct *work)
+{
+	struct pci_dev *pdev = container_of(work, struct pci_dev,
+					    disconnect_work);
+	struct edu_dev *edu = pci_get_drvdata(pdev);
+
+	if (!pci_test_and_clear_disconnect_enable(pdev))
+		return;
+
+	if (!edu)
+		return;
+
+	dev_info(&pdev->dev, "disconnect_work fired — unblocking remove()\n");
+	complete(&edu->irq_done);
+}
+
+static int edu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct edu_dev *edu;
+	int err;
+
+	edu = devm_kzalloc(&pdev->dev, sizeof(*edu), GFP_KERNEL);
+	if (!edu)
+		return -ENOMEM;
+
+	edu->pdev = pdev;
+	init_completion(&edu->irq_done);
+
+	err = pci_enable_device(pdev);
+	if (err)
+		return err;
+
+	err = pci_request_regions(pdev, "edu_srpoc");
+	if (err)
+		goto err_disable;
+
+	edu->regs = pci_iomap(pdev, 0, 0);
+	if (!edu->regs) {
+		err = -ENOMEM;
+		goto err_release;
+	}
+
+	pci_set_master(pdev);
+
+	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_INTX);
+	if (err < 0)
+		goto err_iounmap;
+
+	err = request_irq(pci_irq_vector(pdev, 0), edu_irq_handler,
+			  IRQF_SHARED, "edu_srpoc", edu);
+	if (err)
+		goto err_free_vectors;
+
+	pci_set_drvdata(pdev, edu);
+
+	INIT_WORK(&pdev->disconnect_work, edu_disconnect);
+	pci_set_disconnect_work(pdev);
+
+	dev_info(&pdev->dev, "edu_srpoc probed\n");
+	return 0;
+
+err_free_vectors:
+	pci_free_irq_vectors(pdev);
+err_iounmap:
+	pci_clear_master(pdev);
+	pci_iounmap(pdev, edu->regs);
+err_release:
+	pci_release_regions(pdev);
+err_disable:
+	pci_disable_device(pdev);
+	return err;
+}
+
+static void edu_remove(struct pci_dev *pdev)
+{
+	struct edu_dev *edu = pci_get_drvdata(pdev);
+
+	iowrite32(EDU_STATUS_IRQFACT, edu->regs + EDU_REG_STATUS);
+	iowrite32(600000, edu->regs + EDU_REG_DELAYED_IRQ);
+
+	dev_info(&pdev->dev, "Waiting for IRQ in remove()\n");
+	wait_for_completion(&edu->irq_done);
+	dev_info(&pdev->dev, "Unblocked, cleaning up\n");
+
+	pci_clear_disconnect_work(pdev);
+	free_irq(pci_irq_vector(pdev, 0), edu);
+	pci_free_irq_vectors(pdev);
+	pci_clear_master(pdev);
+	pci_iounmap(pdev, edu->regs);
+	pci_release_regions(pdev);
+	pci_disable_device(pdev);
+}
+
+static const struct pci_device_id edu_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_EDU, PCI_DEVICE_ID_EDU) },
+	{ 0 }
+};
+MODULE_DEVICE_TABLE(pci, edu_ids);
+
+static struct pci_driver edu_driver = {
+	.name		= "edu_srpoc",
+	.id_table	= edu_ids,
+	.probe		= edu_probe,
+	.remove		= edu_remove,
+};
+
+module_pci_driver(edu_driver);
+MODULE_AUTHOR("Abhin Parekadan Jose");
+MODULE_DESCRIPTION("edu surprise removal POC driver");
+MODULE_LICENSE("GPL");
-- 
2.51.1


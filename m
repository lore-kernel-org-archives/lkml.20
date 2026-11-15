Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.222.135.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746519;
	b=WR0imEcow6t35sxEjM991FEFu3WAg1A66Ma3eXgSmY3bYE73IB758hsI2hJjWpL6y3dJ
	 yxe1aXC63v5QZUbLB0Pk7/YOw6JFFxy0n3yn10SAzRALMGEEnOjSsA55Pgp9VmD7DWpVF
	 WfacyBHyO1Q0gmB7LUIiyryZlG7z99zPs5DGzQJE4M9x7oWV/53iTAk8k2U3Rba0NR9ad
	 Vw/v3qVTXXSbiHM9teFGQyE9cc6xQXg/R3Y76K3nSfxSruUBZlpu9Sf2qDW0Xt1fXsOok
	 G0/ZLrAyM923E2E136TIvudHM1dQxfDGrxaQxq4OWwbS1WNrEqmmYlE+6iZR7baachA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-WP-DKIM-Status:X-WP-MailID:X-WP-AV:
	 X-WP-SPAM;
	bh=ryjnoPK0FiOS220BbRQkctm1gx2KPPViciuqsXa4DYs=;
	b=mKsJh7QG0dcZZV1N0j6Qj3sqLsIn25mQij4r7UHYZk8nizkPUau0I/kTpP4eojCdX69R
	 QWFaiF8eqQ16NFgoBbm2GxY2q4P32K2fF+O4Mayf9O8LnhJ0pjgayOxf7rmnTUTSxEZqh
	 snGYEwM0szsOOEh/M1ND3dFGdgtxeW3QPrruUcK+MFAHD6aXk7dfW0D+W4HC633Ahi1+5
	 yjCn7zklOkdC6yIGa0DbN9filCSSp88oCjViemYiqmkuO/nXehxHF+94z57YhQtz3zsCB
	 biHbiAgSMg/g9Zyjt6g0eoT3U1XZOHjUSeJfXNcZvvURYQqtx77JepkSV7LS46PJGDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=o2.pl;
	spf=pass smtp.mailfrom=o2.pl;
	dkim=pass header.d=o2.pl header.i=@o2.pl header.a=rsa-sha256 header.s=s20261001 header.b=DXCbEcAc;
	arc=none smtp.remote-ip=193.222.135.140
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38EC606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=o2.pl header.i=@o2.pl header.a=rsa-sha256 header.s=s20261001 header.b=DXCbEcAc
Received: (wp-smtpd smtp.tlen.pl 40961 invoked from network); 15 Nov 2026 13:41:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=s20261001;
          t=1794746509; bh=ryjnoPK0FiOS220BbRQkctm1gx2KPPViciuqsXa4DYs=;
          h=From:To:Cc:Subject;
          b=DXCbEcAcKjYpfldum/vHLnZMnUWwUh2XG1Ksj+bOlfecKtK3GVOd25MagdcoRZiNt
           FxuAWtoxG3ksNhL2W3k2U2S3hT7xzY+F7NaVsJ1iBXoR4muwvsSuFHARUxGLj5Lw+G
           d6g/WwFK5cEVyIao+na9R0FHFghTlqcVjzM/chbog8esmLNeJLhn6UEG/aJBOS4JYv
           FXxDrRbLx72937KDuu0CY5QdBGVzStIRKxhewP7u5KK/rFa9H+EmJCR5sYf1xliZtF
           XDIvrpvxYXSnZbmV01ZMnzzpKz53280P7cfqvPlq9EamkfZ5ZOqgaXLoMSB9v6dzzm
           b9kcL/gwLFQEg==
Received: from localhost.localdomain (apn-78-30-67-84.dynamic.gprs.plus.pl [78.30.67.84])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <oneukum@suse.com>; 15 Nov 2026 13:41:49 +0100
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	smartmontools-support@listi.jpberlin.de,
	Christian Franke <Christian.Franke@t-online.de>,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [PATCH] usb: uas: expose US_FL_NO_ATA_1X in sysfs as deny_ata_passthrough
Date: Sun, 15 Nov 2026 13:40:46 +0100
Message-ID: <20261115124046.5286-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: o2.pl)                                                      
X-WP-MailID: beedee10f93d25369d9fae5912078f3e
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000B [kfNU]                               

The uas driver blocks access to ATA passthrough commands for some
devices it considers buggy (via the US_FL_NO_ATA_1X flag in
unusual_uas.h and uas_detect.h). However, it does not expose any
meaningful information whether the command was blocked by the driver or
is genuinly not supported by the hardware. This creates a problem for
the smartmontools program and makes it difficult for it to provide a
useful error message (with instructions to disable UAS on the drive to
get SMART readings).

So, expose the information in sysfs as deny_ata_passthrough. Other
quirks may be added in the future if there is any demand.

Link: https://www.smartmontools.org/wiki/SAT-with-UAS-Linux
Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
---
 drivers/usb/storage/uas.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 8655edbd66b1..aaea74297026 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -910,6 +910,25 @@ static int uas_sdev_configure(struct scsi_device *sdev,
 	return 0;
 }
 
+/* Sysfs interface */
+static ssize_t deny_ata_passthrough_show(struct device *dev, struct device_attribute *attr,
+					 char *buf)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct uas_dev_info *devinfo = sdev->hostdata;
+
+	return sprintf(buf, "%d\n", !!(devinfo->flags & US_FL_NO_ATA_1X));
+}
+
+static DEVICE_ATTR_RO(deny_ata_passthrough);
+
+static struct attribute *uas_sdev_attrs[] = {
+	&dev_attr_deny_ata_passthrough.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(uas_sdev);
+
 static const struct scsi_host_template uas_host_template = {
 	.module = THIS_MODULE,
 	.name = "uas",
@@ -929,6 +948,7 @@ static const struct scsi_host_template uas_host_template = {
 	.dma_alignment = 511,
 	.dma_boundary = PAGE_SIZE - 1,
 	.cmd_size = sizeof(struct uas_cmd_info),
+	.sdev_groups = uas_sdev_groups,
 };
 
 #define UNUSUAL_DEV(id_vendor, id_product, bcdDeviceMin, bcdDeviceMax, \
-- 
2.47.3


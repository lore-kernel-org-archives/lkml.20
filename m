Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC537F010
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439938; cv=none; b=IwYUl+QdIg3T9zrtgHW8nd+Xy7+mjeR9Hdi1jd7NIMQwFxpuc2LYegi5ttKEEm3hkpMPP8ysW/w/8mtgIxz+dLUlmQfq12I/aG5jTQcpg6SX2gAR/Gbs3+5OGVraOj3gwp1GXHyjjz3/pkDMPTBmcskNGfVnbTAEPyW3Oz58fqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439938; c=relaxed/simple;
	bh=KHu6n6nF7r8HoMbgICyqgJcdR6e9Uz2lwSDzo87ed9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LqA2eTbjI6vK8qetFpj2MripAkUow392SvRz70/gviAgut03Nm23D7PGxCeFr8IXxxNP1ayAwAhdzn7Qf04bpxa0aRTSJ6G9TVIBTJ7cTcvi1CoxoCvtI9HQZ9uLiIGu/9Q/QbkMBbAc4EznkPmvY0dlHBwwfrABjg42qkX+j7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4kt2Q2c; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4kt2Q2c"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5b166acdso56927485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439927; x=1791044727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxGw90+JpYDU2nxs8d7bIbWjyZdBY1QVcTsJVhZ3GNI=;
        b=m4kt2Q2c5pA1VSj4Zp8vqILDOQM+yQ+cnrNu8NJp6OocUIsaYs7FwpS7tP9KoHdEun
         RtALTZ7n0s1REPOLxwcIyTHIJ0kad6Yn3WUJj/FMM7DjZ28QIW9fj9FnXAjfWbZr2kGe
         cUETHvyp+/Tn5VJ2RIGbHE/sWA5oppZCcc519Ila0rAykWXmweIg1HjpXsm3pf6e/KQi
         bzRU9tr2YbvT1crVSQub336JREZB7a7J28w8X7q21RlNl3WIL6bZrTYDkQZljLH2Wh+W
         0u44pTlP13sXqwYOMS1+gVmIzBtH+Fs0aoY2+Y5rOdjuImsoo9VWQjeArhoDXqutk0ls
         6kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439927; x=1791044727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxGw90+JpYDU2nxs8d7bIbWjyZdBY1QVcTsJVhZ3GNI=;
        b=wzy7j+k/noHbiVMyIGGAV+ZIaRjifTPYfhXLyPhH6S+hFSbPrl7JqQLpp+bc3sqe6p
         WFhUw1rfLbbysgpgpxOIA1RiJlIUJEeXykjKISqU0BWAGjblaw8Z7SMvWConPOw8kl81
         yheefGE2v7Fc2amgS/3Luhsxv12xrMSjnPWcmj3FDo0H1gsmPVqWa96bV8d8IKOcfb9V
         /1/5lOs/6hQMae+zTjxwUdLfKRKsPFZUzvc/82ZFQinfZLGZxROYQJ0Qasuwcdruo2OW
         tJf9E4P658rMr1BBTi/sOSk0qgVb/ORRzotgZwqm6sPhWTEKACQbotcneAkaT54lqnMu
         wzew==
X-Forwarded-Encrypted: i=1; AKwUvBxESsInXO8z/tImOeTUnhKpBJC4XDohzQ4salbqpAkgMaZteKao7J7D/l104T/MfvxACeb6jfvmUWVlENw=@vger.kernel.org
X-Gm-Message-State: AFuF++l/5TYTCuY08eIZdRTwJcRDxgHbNkPz1E5zPHj35Iartj//HG2l
	6vmj75T4nISxvCgswblRHacJif+g8NWqdSjVpUmRyDfyHpvKILU5XhKHVf1EK5tc
X-Gm-Gg: AYBFou1noICglUJjcPsrIpVIVvmZE4MRXxtvsjlXsEkGDENOcyWjzFbJh2+TRjxEL8o
	SzY6Zu7RrP8MWqKVwX9ZH85g0IEcT6mjZ8V9KdCHobCVQuRv9zuu6QjdEyF5+i3+OXtTIBzh2Rc
	GB6sf7NmR32gy6+s16vvGKPyVA9CSNkVKWtRKZFDeHbfieQUebOnCi8sOPmr3n7hvZ+RGWWpygJ
	If8JeMqLO4mxkMg8VTpFkwQZ/uKMwg57+PalsHzZSsKzcHSHDB/iFubRCE5a1tXCeEwc8DV5fBa
	RfqEq58/1+/r4IUhjfI/FxOlse/P1AgjlRf59ehh0k9gAYGn6YviPLdDXfFzX6CFE4xzYLvERkr
	pep4uwrwHwoQm3Ovs2Lb/vgemOVIZOsrmLTJkM7dkqrBEpo8/xI/nqO0fROYHKEwAPw8aXWk+uF
	drYZg7IMjUY9u9rL1c+IbB7BO3KJMcyQhBz1UhHzwUwHwHZbiDKfQUKSvmIMMjfiBBIF0ZAkiaP
	9S9BBtTB3wIEIAtLZZrfy71hoh7vF0VnfQjl+eVe2KUaIBntQ==
X-Received: by 2002:a05:620a:4492:b0:939:2c5c:7977 with SMTP id af79cd13be357-93c43c75a3emr1115967985a.20.1790439926593;
        Sat, 26 Sep 2026 09:25:26 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430ecf80csm42110476d6.49.2026.09.26.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:26 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: pch_udc: fix typos in comments
Date: Sat, 26 Sep 2026 12:25:23 -0400
Message-ID: <20260926162523.25335-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments and kernel-doc found by
codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/usb/gadget/udc/pch_udc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce28210f..e8ad452a852f 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -53,7 +53,7 @@
 #define UDC_EPCTL_F			(1 << 1)
 #define UDC_EPCTL_S			(1 << 0)
 #define UDC_EPCTL_ET_SHIFT		4
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPCTL_ET_MASK		0x00000030
 /* Value for ET field */
 #define UDC_EPCTL_ET_CONTROL		0
@@ -73,7 +73,7 @@
 #define UDC_EPSTS_BNA			(1 << 7)
 #define UDC_EPSTS_IN			(1 << 6)
 #define UDC_EPSTS_OUT_SHIFT		4
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPSTS_OUT_MASK		0x00000030
 #define UDC_EPSTS_ALL_CLR_MASK		0x1F0006F0
 /* Value for OUT field */
@@ -110,7 +110,7 @@
 #define UDC_DEVSTS_ALT_SHIFT		8
 #define UDC_DEVSTS_INTF_SHIFT		4
 #define UDC_DEVSTS_CFG_SHIFT		0
-/* Mask patern */
+/* Mask pattern */
 #define UDC_DEVSTS_TS_MASK		0xfffc0000
 #define UDC_DEVSTS_ENUM_SPEED_MASK	0x00006000
 #define UDC_DEVSTS_ALT_MASK		0x00000f00
@@ -132,7 +132,7 @@
 #define UDC_DEVINT_ES			(1 << 2)
 #define UDC_DEVINT_SI			(1 << 1)
 #define UDC_DEVINT_SC			(1 << 0)
-/* Mask patern */
+/* Mask pattern */
 #define UDC_DEVINT_MSK			0x7f
 
 /* Endpoint irq register */
@@ -141,7 +141,7 @@
 #define UDC_EPINT_OUT_SHIFT		16
 #define UDC_EPINT_IN_EP0		(1 << 0)
 #define UDC_EPINT_OUT_EP0		(1 << 16)
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPINT_MSK_DISABLE_ALL	0xffffffff
 
 /* UDC_CSR_BUSY Status register */
@@ -162,7 +162,7 @@
 #define UDC_CSR_NE_INTF_SHIFT		11
 #define UDC_CSR_NE_ALT_SHIFT		15
 #define UDC_CSR_NE_MAX_PKT_SHIFT	19
-/* Mask patern */
+/* Mask pattern */
 #define UDC_CSR_NE_NUM_MASK		0x0000000f
 #define UDC_CSR_NE_DIR_MASK		0x00000010
 #define UDC_CSR_NE_TYPE_MASK		0x00000060
@@ -296,7 +296,7 @@ struct pch_udc_ep {
 };
 
 /**
- * struct pch_vbus_gpio_data - Structure holding GPIO informaton
+ * struct pch_vbus_gpio_data - Structure holding GPIO information
  *					for detecting VBUS
  * @port:		gpio descriptor for the VBUS GPIO
  * @intr:		gpio interrupt number
@@ -319,7 +319,7 @@ struct pch_vbus_gpio_data {
  * @ep:			array of endpoints
  * @lock:		protects all state
  * @stall:		stall requested
- * @prot_stall:		protcol stall requested
+ * @prot_stall:		protocol stall requested
  * @suspended:		driver in suspended state
  * @connected:		gadget driver associated
  * @vbus_session:	required vbus_session state
@@ -332,7 +332,7 @@ struct pch_vbus_gpio_data {
  * @base_addr:		for mapped device memory
  * @bar:		PCI BAR used for mapped device memory
  * @cfg_data:		current cfg, intf, and alt in use
- * @vbus_gpio:		GPIO informaton for detecting VBUS
+ * @vbus_gpio:		GPIO information for detecting VBUS
  */
 struct pch_udc_dev {
 	struct usb_gadget		gadget;
@@ -846,7 +846,7 @@ static inline u32 pch_udc_read_ep_interrupts(struct pch_udc_dev *dev)
 }
 
 /**
- * pch_udc_write_ep_interrupts() - Clear endpoint interupts
+ * pch_udc_write_ep_interrupts() - Clear endpoint interrupts
  * @dev:	Reference to structure of type pch_udc_regs
  * @val:	The value to be written to interrupt register
  */
@@ -1064,7 +1064,7 @@ static void pch_udc_init(struct pch_udc_dev *dev)
 	if (speed_fs)
 		pch_udc_bit_set(dev, UDC_DEVCFG_ADDR, UDC_DEVCFG_CSR_PRG |
 				UDC_DEVCFG_SP | UDC_DEVCFG_SPD_FS);
-	else /* defaul high speed */
+	else /* default high speed */
 		pch_udc_bit_set(dev, UDC_DEVCFG_ADDR, UDC_DEVCFG_CSR_PRG |
 				UDC_DEVCFG_SP | UDC_DEVCFG_SPD_HS);
 	pch_udc_bit_set(dev, UDC_DEVCTL_ADDR,
@@ -2569,7 +2569,7 @@ static void pch_udc_svc_intf_interrupt(struct pch_udc_dev *dev)
 	dev->setup_data.bRequestType = USB_RECIP_INTERFACE;
 	dev->setup_data.wValue = cpu_to_le16(dev->cfg_data.cur_alt);
 	dev->setup_data.wIndex = cpu_to_le16(dev->cfg_data.cur_intf);
-	/* programm the Endpoint Cfg registers */
+	/* program the Endpoint Cfg registers */
 	/* Only one end point cfg register */
 	reg = pch_udc_read_csr(dev, UDC_EP0OUT_IDX);
 	reg = (reg & ~UDC_CSR_NE_INTF_MASK) |
-- 
2.53.0


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623AB3D4121
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760404; cv=none; b=AK2dH921Lqj7HC3QlxJfuA+ZyIHkzn3FKnOxEvPky7r6jpUQpww7mRvO+BNUUBYNIR/++IdfENCcRnbUAhaz6Dou+35koU1Ce8paKzX9xLLtYeximgUEq3guEX1/4ClOpsPSlHrPQv58/G9gtWglaOPqUQ0oxSsyazbYfGYp/Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760404; c=relaxed/simple;
	bh=aluPD1H8ZhbUZyaIGRmSfAZiwosda9+zGSjWlUx2qVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E5D9uXfIOtkCE2Rd213G+XS93cEayjw7ScNjoTf/lhxgDdmYBUcK5L1LJl4Z2LP2Cp4OeIOZPMW8Pro5BwaDFLh5iWx1nP/9IWlvsh6f7MdORKCk0JU1cTERTcHShrGX6tpXp2gC5o9cyhcQgymyp/Bxu6W7VAFU5gqIpeRO8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwKcvcFp; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwKcvcFp"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so7317335e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789760400; x=1790365200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=piGCPJ2qCNdqMxLVvRBEnvJKlYbS6Cmm7RmQcfiGn0Q=;
        b=OwKcvcFpT0Yv7vrRt1TYs35iaTIJoMj0VbKI9lCBazHe7SiTmH1PW61TkkFbrhDsva
         SuNPDqsA49DduiGCpr5hz+eCPeLgj80g/bjG72tWZnr/ZYNoDMwD6W6/Cyc3P9ImYO4e
         csOln1/t9B+ukd+YNyduXs/lPdvQVNjKK+/BTKBDcE+47j364IVTfeFj8w8HzICcHIed
         nacAf7E3eHOSu46d5u6TAnKyXW78Ir1HWWujfOSA+jX3ibFgjFIuF1AC/H/BvNfXQ0Bf
         U18teNhkwr24gJ2ytuOxvDXoN52IGL88hietGUMQo6/d8vG4Ys1lxUhB13shArgHeLdz
         Rfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789760400; x=1790365200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piGCPJ2qCNdqMxLVvRBEnvJKlYbS6Cmm7RmQcfiGn0Q=;
        b=dfR521zYliA/9Gjqs65Ux6BcFfv8QCSzh8rpd1zXvevlU6RYxP1o19UvXZukyyK6QI
         Oatot5V2rmQCi7pkjuDyJwPz0Nj4TIe5xQ8IAz8Y69GF5Xo4t/pe4ad2e2+uAmDUacuD
         yuvcuXIOQ4DoNzqkAMmKFibqxngbXl3rX3yrCW7ISHpz+Qs+u6cnVdSuQg4pnqy0IWJR
         OKFcnraxlR8UBHs5+fRR/ZKn/ClhFUwjox3dO+tdw4IneLVRlEf0uKgPQfDb+QCuJHQa
         P8ucsb1AoMGHglukMnzbMouszu4tMMx5icfLVfg0y4PR2qc6aW/1DJ/fM/ricHQpinZu
         O4lA==
X-Forwarded-Encrypted: i=1; AKwUvBy3U6D2T0/qKnQ2NiPNRCxyH7fOwoIT6nJKntqdUe2nZQltOib8Xyrqfckw7Ybn0Dn53oQPAVUI1QbnPs4=@vger.kernel.org
X-Gm-Message-State: AFuF++mUj+fY8bZBQSr6njxUQ1pPydcYicdQVgSdx1dBIc1EsSOgNllO
	VManzm7Pu0mNBR+hnNKJNX7k2CFFT9e5P2NS7rUx6KQajmwaMhQRRClf
X-Gm-Gg: AYBFou11v0R/aBL/QdJQ9lYrz6U2Nr4ndXICvdF8U0onrD87I7zcl4TD0RyTsz4X1ik
	KKVSHvg6FLQKNQJKG9oFNOmDXpZb51L6lbFC0hFLvkNyk7mfyboLQybV4g9FqraqmxdnjIu83EC
	l09Oy2gGgqx3XI2MC3NbNe7us3uboBDcHeIfFiSV6sT4ULReJOijM2+DzNNLRn8j1AVvHytqGld
	IW5lXYCF2B/jwTm3Sb0haUHr2Cdh/E8CydUT58UTuJzTTZFTa/R3WcLq6MhVOQMD6XZm8yE04ur
	5HRLlA6Rrda96bHhZggZ6a3MzFaua7grSwvcQTqTpveYmhPXAkvk7OIv71L2lzkZjiKMR8h7MwZ
	xlPPjFXTVADndacolRWe1a1otSvc4JEZHZ/0L1ksOyDEeunWIzdZlV3F+furJtr4L+oph3UzGs5
	xEXM2nmRpcqahBnmpwC4wKP4DWKNQWNSOl34/MvWp+y0qtShVL7iLHTj52O+eg4lwl91e3LR3Z7
	haMi+gJWBW7CNVTgDhA6cb5bfCyUTaLVZs4iOr8bhyL1LVXIQaTIUH7WcoJlvt0kQcXsB3SR5ZX
	2/xKgIij
X-Received: by 2002:a05:600c:34c7:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fc5726cfcmr113665925e9.11.1789760400301;
        Fri, 18 Sep 2026 12:40:00 -0700 (PDT)
Received: from fedora ([41.198.134.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm10386765e9.0.2026.09.18.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:39:59 -0700 (PDT)
From: jackyphuti <jackympoka22@gmail.com>
To: bjorn@mork.no,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackyphuti <jackympoka22@gmail.com>,
	Copilot <223556219+Copilot@users.noreply.github.com>
Subject: [PATCH] net: usb: qmi_wwan: add common Huawei modem IDs
Date: Fri, 18 Sep 2026 21:36:45 +0200
Message-ID: <20260918193645.59374-1-jackympoka22@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add common Huawei product IDs to qmi_wwan fixed-interface mappings
for broader generic Huawei modem coverage.

Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
Signed-off-by: jackyphuti <jackympoka22@gmail.com>
---
 drivers/net/usb/qmi_wwan.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index fdfdcf24ddcf..2809b6985f7a 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -216,10 +216,10 @@ static int qmimux_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		if (netif_rx(skbn) != NET_RX_SUCCESS) {
 			net->stats.rx_errors++;
 			return 0;
-		} else {
-			dev_sw_netstats_rx_add(net, pkt_len);
 		}
 
+		dev_sw_netstats_rx_add(net, pkt_len);
+
 skip:
 		offset += len + qmimux_hdr_sz;
 	}
@@ -946,6 +946,13 @@ static const struct driver_info	qmi_wwan_info_quirk_dtr = {
 };
 
 #define HUAWEI_VENDOR_ID	0x12D1
+#define HUAWEI_PRODUCT_E1750	0x1406
+#define HUAWEI_PRODUCT_E173	0x140c
+#define HUAWEI_PRODUCT_K4505	0x1464
+#define HUAWEI_PRODUCT_K3765	0x1465
+#define HUAWEI_PRODUCT_K4605	0x14c6
+#define HUAWEI_PRODUCT_E1820	0x14ac
+#define HUAWEI_PRODUCT_E173S6	0x1c07
 
 /* map QMI/wwan function by a fixed interface number */
 #define QMI_FIXED_INTF(vend, prod, num) \
@@ -1024,23 +1031,23 @@ static const struct usb_device_id products[] = {
 	},
 	{	/* Novatel USB551L and MC551 */
 		USB_DEVICE_AND_INTERFACE_INFO(0x1410, 0xb001,
-		                              USB_CLASS_COMM,
-		                              USB_CDC_SUBCLASS_ETHERNET,
-		                              USB_CDC_PROTO_NONE),
+					      USB_CLASS_COMM,
+					      USB_CDC_SUBCLASS_ETHERNET,
+					      USB_CDC_PROTO_NONE),
 		.driver_info        = (unsigned long)&qmi_wwan_info,
 	},
 	{	/* Novatel E362 */
 		USB_DEVICE_AND_INTERFACE_INFO(0x1410, 0x9010,
-		                              USB_CLASS_COMM,
-		                              USB_CDC_SUBCLASS_ETHERNET,
-		                              USB_CDC_PROTO_NONE),
+					      USB_CLASS_COMM,
+					      USB_CDC_SUBCLASS_ETHERNET,
+					      USB_CDC_PROTO_NONE),
 		.driver_info        = (unsigned long)&qmi_wwan_info,
 	},
 	{	/* Novatel Expedite E371 */
 		USB_DEVICE_AND_INTERFACE_INFO(0x1410, 0x9011,
-		                              USB_CLASS_COMM,
-		                              USB_CDC_SUBCLASS_ETHERNET,
-		                              USB_CDC_PROTO_NONE),
+					      USB_CLASS_COMM,
+					      USB_CDC_SUBCLASS_ETHERNET,
+					      USB_CDC_PROTO_NONE),
 		.driver_info        = (unsigned long)&qmi_wwan_info,
 	},
 	{	/* Dell Wireless 5800 (Novatel E362) */
@@ -1228,8 +1235,13 @@ static const struct usb_device_id products[] = {
 	{QMI_QUIRK_SET_DTR(0x05c6, 0x9625, 4)},	/* YUGA CLM920-NC5 */
 	{QMI_FIXED_INTF(0x0846, 0x68a2, 8)},
 	{QMI_FIXED_INTF(0x0846, 0x68d3, 8)},	/* Netgear Aircard 779S */
-	{QMI_FIXED_INTF(0x12d1, 0x140c, 1)},	/* Huawei E173 */
-	{QMI_FIXED_INTF(0x12d1, 0x14ac, 1)},	/* Huawei E1820 */
+	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E1750, 1)},	/* Huawei E1750 */
+	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E173, 1)},	/* Huawei E173 */
+	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K4505, 1)},	/* Huawei K4505 */
+	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K3765, 1)},	/* Huawei K3765 */
+	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_K4605, 1)},	/* Huawei K4605 */
+	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E1820, 1)},	/* Huawei E1820 */
+	{QMI_FIXED_INTF(HUAWEI_VENDOR_ID, HUAWEI_PRODUCT_E173S6, 1)},	/* Huawei E173s-6 */
 	{QMI_FIXED_INTF(0x1435, 0x0918, 3)},	/* Wistron NeWeb D16Q1 */
 	{QMI_FIXED_INTF(0x1435, 0x0918, 4)},	/* Wistron NeWeb D16Q1 */
 	{QMI_FIXED_INTF(0x1435, 0x0918, 5)},	/* Wistron NeWeb D16Q1 */
-- 
2.55.0


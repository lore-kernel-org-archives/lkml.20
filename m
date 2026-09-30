Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9916B3CC337
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767028; cv=none; b=WFjA6fZbLCk5/cyloPrGi9ANStl4JJ86RsQJGlC7hSSdvwlju9OSjQPOCS0GDXorqk2nSryWIjKcN0puHUao17q5xo5L3d0OiSKg1Mgmqjb3HVQe7dtrmnKE+mdw/UHT9twX17inHiz6VjcdD6mJufE057Ho1k8p4gv/kWdHyyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767028; c=relaxed/simple;
	bh=44g+cwRkcg+sgXv00ki4bHGO1GwDgBVNf/x2lAp1OpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jyPuWJBSej8KARyCCAzD01ShtFSF5RTjRAkJQbSpMz1R98eH73/FJ6DmwQzD1yyVrpLsAAdgc/HU345h1P02irOxCNeh8Bc0g73j/0tI3jGTM7jJNiesSFsg5Aj5jWlXBW25FM/ABo5reLIWMvzuzc17DOnOTzbS8v/bSLJFJ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGROV4ER; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGROV4ER"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d06so3830026c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767026; x=1791371826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4H/28AxKTyi5/kuGhdFpRuaO8Fax40tORz6GBMg/6GU=;
        b=IGROV4ERJILiMbjMW5538XwiYCXyACTRfHsxEHCzu+K180Qi4NXRMf9NDXUAUEmuwe
         GysK3O+2rTZmEIce/mx3vH9vudBkxRic8ZuBV8QUBbnAF4tRmp0kn5M74ddnzpRMlj8R
         Y+2Ujv17YN0xhciHbzSPKP/nqNfZgHdPFUgOfSv4U8ZmMeJFsX+/JXdriwemKUmpTnV6
         YxzY/g1/HDBtd9/NCbS9Zdh4R8qXZ+qBFia5skGd3+5d8LEo1jFzpIjM49es856IqWnB
         UUXqeT+MId8U9PrrlNaLRaKHYN57wCNy6a3xDBtP6twc7Z6wukniAYYcbzW4G3gJ/eFQ
         8EDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767026; x=1791371826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4H/28AxKTyi5/kuGhdFpRuaO8Fax40tORz6GBMg/6GU=;
        b=qwJTwVidHslSBhKALDg75uk+5kw6z9meA6CWSWMgLUgEkJUmg+4H0Yzx5liAlJFn0/
         j3p1qHEfegW4FkdBP338eUcJ9+l650PuHdOXD2+OceE3cH/zKrZVPEpK4sBp4tDBLHyc
         j/5idOAmVA0tgd6Cb+bJsHfuQ5dtmIWOayjUVdpktmLKlrHzsPtYIvYTUM7ZDMxrHa5v
         67UiuZST4r/FPPngOFQ2Jb0uxvFYCIPb4TF5RM5D1i8ji6coF7YZs0HE40ckkkUDRpbj
         V5TSjlFGSYspdjsG7xKp8D4lu03hLRGmNWLP9V2Bx/umsXmXKLsKk4yyK0Bt8xivwVSB
         VxqA==
X-Forwarded-Encrypted: i=1; AKwUvBxHKPz4knkbuwRU/c9XjVZnCJxkYXedqdexYgr696FAjEvmGwY8JZrPynNaLk+6XdHPaC2wwhc598Xb+Vo=@vger.kernel.org
X-Gm-Message-State: AFuF++nHlYXd9aPZ5abpOHWytFwuyTK4j0HF7HXldC4ttt1zW76F1OIn
	PepIIi82bo6zwdvg7SIHqzlQD+MHjVQBdB66SLzL6wK6HJx3+qRW/BaCQ4K+q580
X-Gm-Gg: AYBFou1jnIhJexoHyK6MPkhP9FBnrXvqHdYq85ElBLEONcvKQmczxyE8MkD1jQiFxux
	TEixgGUmN3JE454HFAbfra2d8ZBg1w4Xe/iAeJFjRy4avDSnXbrFnMKAWOSPidS4iCw+ywRTkt1
	v+rpimhsU/o4Wcit0q/AIZ7Q1ApvDsHBi1mriXKFL9DvT/WbliIgvHE8ehai1eUlGfkmhkdTTF+
	x0sbl6OUN+ftrYdC6eo6cXXZ2e7Bz8J1u4Gf4OSa5MxnxkVcoaqViKQfjnKEFgC+9ybJ9wPSQTk
	pqPQd/gnqcKyMaaXO0Yvh2zoYlXGmsCTZGxrBrH720vJ+4xmuSQXJclNiock1jxHZWDKOEsPWgp
	MDsnowGZzEvpd13FXBBedgSPF7LVD2nqlwe/WWXfqTq33hqLJaLD+BlRAk5YLImB1UcpHzEWv+M
	WfMC7mq2IhGic1U9Zbs53HTtPA1xp+cKXR5ryCU43pfRvSkiLBHKHq8szcpA5jwFviHs1d1P/q/
	bNo6uB6zWYTtojh2Jm0wvWf6BBB81I1QTxwogbdDDT/yuU2hob9quC2gqrmGTlnKGlC6R/XgTaM
	2kJPtUBMthnft1xZVSkk1OKBOQgjluHur58=
X-Received: by 2002:a05:7022:1504:b0:143:6ef8:863 with SMTP id a92af1059eb24-14d31c6d7b7mr1167172c88.9.1790767025540;
        Wed, 30 Sep 2026 04:17:05 -0700 (PDT)
Received: from rahuls-x2elite ([110.226.112.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d083fe71dsm4168611c88.4.2026.09.30.04.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:17:05 -0700 (PDT)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: pmic_glink_altmode: acknowledge notifications on undescribed ports
Date: Wed, 30 Sep 2026 16:46:56 +0530
Message-ID: <20260930111657.1147-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver enables port notifications from the firmware (ALTMODE_PAN_EN)
for every port, but only acknowledges them (ALTMODE_PAN_ACK) from the
worker of a port that has a connector node. A notification for any other
port is logged at debug level and dropped without an acknowledgment.

On an HP OmniBook 5 (Snapdragon X2, Mahua) whose device tree does not
yet describe the USB-C connectors, the firmware kept charging on the
connector that was plugged in, but once a notification had gone
unacknowledged (on unplug), its UCSI connector status reported no
connection on either port through repeated replugs, and no charging
session started again. The firmware also reports more UCSI connectors
than a board may describe to this driver (here a third, USB Standard-A,
port).

Acknowledge notifications for ports without a connector node from a
work item, as pmic_glink_altmode_request() sleeps and the notification
callback must not.

Assisted-by: LLM
Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 42 +++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 13c434f8d0..24ee9ecc42 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -6,6 +6,7 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
+#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -138,6 +139,10 @@ struct pmic_glink_altmode {
 
 	struct work_struct enable_work;
 
+	/* Ports without a connector node with a notification to acknowledge */
+	struct work_struct ack_work;
+	unsigned long ack_pending;
+
 	struct pmic_glink_altmode_port ports[PMIC_GLINK_MAX_PORTS];
 };
 
@@ -393,6 +398,35 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 	pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, alt_port->index);
 }
 
+/*
+ * The firmware expects every port notification to be acknowledged, also for
+ * ports that have no connector node and are otherwise ignored here; one left
+ * unacknowledged can keep it from reporting further connections. Acknowledge
+ * those from process context, as pmic_glink_altmode_request() sleeps.
+ */
+static void pmic_glink_altmode_ack_worker(struct work_struct *work)
+{
+	struct pmic_glink_altmode *altmode = container_of(work, struct pmic_glink_altmode,
+							  ack_work);
+	unsigned int port;
+
+	for (port = 0; port < BITS_PER_LONG; port++) {
+		if (test_and_clear_bit(port, &altmode->ack_pending))
+			pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, port);
+	}
+}
+
+static void pmic_glink_altmode_ack_undefined(struct pmic_glink_altmode *altmode, u8 port)
+{
+	dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
+
+	if (port >= BITS_PER_LONG)
+		return;
+
+	set_bit(port, &altmode->ack_pending);
+	schedule_work(&altmode->ack_work);
+}
+
 static enum typec_orientation pmic_glink_altmode_orientation(unsigned int orientation)
 {
 	if (orientation == 0)
@@ -441,7 +475,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
 	svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
 
 	if (port >= ARRAY_SIZE(altmode->ports) || !altmode->ports[port].altmode) {
-		dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
+		pmic_glink_altmode_ack_undefined(altmode, port);
 		return;
 	}
 
@@ -480,7 +514,7 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
 	orientation = notify->orientation;
 
 	if (port >= ARRAY_SIZE(altmode->ports) || !altmode->ports[port].altmode) {
-		dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
+		pmic_glink_altmode_ack_undefined(altmode, port);
 		return;
 	}
 
@@ -593,6 +627,10 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 	init_completion(&altmode->pan_ack);
 	mutex_init(&altmode->lock);
 
+	ret = devm_work_autocancel(dev, &altmode->ack_work, pmic_glink_altmode_ack_worker);
+	if (ret)
+		return ret;
+
 	device_for_each_child_node(dev, fwnode) {
 		ret = fwnode_property_read_u32(fwnode, "reg", &port);
 		if (ret < 0) {

base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.53.0


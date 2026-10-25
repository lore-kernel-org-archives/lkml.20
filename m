Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956126;
	b=i1+RIpeLFEAVwlYC50AKyBBmYJwtZMsFkm4YDt5H7ktLu9TEjN3Az38Af3jbhMvl37xw
	 BmdJFZaVhe7f9gjcaXw/w6jQTgjAl1j6eXD0Rg6jcd8xC6xr5j4jZ+0lczoWbI84hT+Cq
	 UeFSlk68E/jZWkyivNeA5SLy+Mg1lL9unzd97O9pgy85VQJ5hRqoRSyQAZ5bBHc5cUmhJ
	 MvD40NKZn1K2RXzPDII+wX9xUTs5YoOwMD/xbi9QvMBhPuHrwKQBuzXPrDqa+HnpLbtcv
	 xYIt5J81OKZC9wjoXAQo+fU++My8ieqiijD/PnbH56KFDhMVL5FsQDnK/8gFKVtxdrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956126;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=0X/tbl9Q4g7QTtyNOjf8kZ22NcdZe6K4eZsTNrclaaw=;
	b=oc4xSvQtdmIluc+IJoLGyemTOEVM0KCYlM8MJH37TXIf4pjF61NP2P3vxMIpKqxPE09I
	 97ej7haGPTRQ2ne5b6HawZhPJDMfTG06772xixH0SwmhlWTOMIzs4BpEIlKDWJBy6IYds
	 SFdZNVVgMmbnp7MN2IXbU4eZ81Okv3N8Ed+ePiquqMAfXCmJvUKjsn1ZnylhK0LU7Z1Ni
	 X6VEVyNLSrZ04TpLEi/t4KLJs134ggHt5Ua3MGcSU3dqrAcAgV7NoLzmR6fNvrctQQwjW
	 YqbsWVxfepki2EyuuceFus+jut3j8USpVBYzNrn1rLiQ8OoG0kCdAvGZmfYlEZuSDZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rdiPjhtI;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C6C606A324;
	Sun, 25 Oct 2026 19:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C6C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rdiPjhtI
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJLko5516701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:53 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJLko5516701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956113;
	bh=0X/tbl9Q4g7QTtyNOjf8kZ22NcdZe6K4eZsTNrclaaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rdiPjhtIbDhRZnlN+dcIhs9BQnfv7mzxnz4QZfouvzZGAl2c819HPQaSMMUMGQPBu
	 LXYjxl59cPYtVUuATW/WOJ9o4X3nTS9B8E6ejduu2VqAPCyNk2afCKxwSokWbCc/Pm
	 lkv6KvlQU2qWArd66gl5AO/PzL3u3RsshxfBLwzY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] firmware: meson: sm: make power-off work on S4
Date: Sun, 25 Oct 2026 20:21:44 +0100
Message-ID: <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

On S4 the firmware implements PSCI SYSTEM_OFF as DDR self-refresh. A
press of the power key afterwards jumps back to the kernel resume
address, where nothing is waiting, and the board hangs until it is
unplugged.

The vendor kernel avoids this in two steps, both needed:

 - set the firmware shutdown flag (SMC 0x82000042, argument 1) right
   before SYSTEM_OFF, which makes the firmware cold-boot on the power
   key instead of resuming;
 - take the secondary CPUs down through PSCI CPU_OFF first. With them
   only parked in the kernel, the firmware wake-up path hangs as well.

Register a power-off prepare handler that stops the secondary CPUs and
a high priority power-off handler that sets the flag, for the
amlogic,meson-s4-sm compatible only.

Tested on an S905W2 board: poweroff followed by the power key
cold-boots the board.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/firmware/meson/meson_sm.c       | 46 +++++++++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..5410386603c7 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -10,6 +10,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/bug.h>
+#include <linux/cpu.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -17,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/property.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 #include <linux/sizes.h>
  #include <linux/slab.h>
@@ -48,6 +50,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
 		CMD(SM_A1_PWRC_SET,		0x82000093),
 		CMD(SM_A1_PWRC_GET,		0x82000095),
+		CMD(SM_SET_POWEROFF_FLAG,	0x82000042),
 		{ /* sentinel */ },
 	},
 };
@@ -303,6 +306,45 @@ static struct attribute *meson_sm_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(meson_sm_sysfs);
 
+/*
+ * The S4 firmware implements PSCI SYSTEM_OFF as DDR self-refresh: on the
+ * power key it jumps back to the kernel instead of booting, which hangs the
+ * board. Setting the shutdown flag first makes it cold-boot instead, and the
+ * secondary CPUs must have been taken down through PSCI CPU_OFF beforehand,
+ * otherwise the wake-up path hangs as well.
+ */
+static int meson_sm_power_off_prepare(struct sys_off_data *data)
+{
+	if (freeze_secondary_cpus(0))
+		pr_warn("meson-sm: failed to stop secondary CPUs\n");
+
+	return NOTIFY_DONE;
+}
+
+static int meson_sm_power_off(struct sys_off_data *data)
+{
+	meson_sm_call(data->cb_data, SM_SET_POWEROFF_FLAG, NULL, 1, 0, 0, 0, 0);
+
+	return NOTIFY_DONE;
+}
+
+static int meson_sm_register_power_off(struct device *dev,
+				       struct meson_sm_firmware *fw)
+{
+	int ret;
+
+	ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
+					    SYS_OFF_PRIO_DEFAULT,
+					    meson_sm_power_off_prepare, NULL);
+	if (ret)
+		return ret;
+
+	/* Run before the PSCI handler, which never returns */
+	return devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
+					     SYS_OFF_PRIO_HIGH,
+					     meson_sm_power_off, fw);
+}
+
 static const struct of_device_id meson_sm_ids[] = {
 	{ .compatible = "amlogic,meson-gxbb-sm", .data = &gxbb_chip },
 	{ /* sentinel */ },
@@ -343,6 +385,10 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 	if (devm_of_platform_populate(dev))
 		goto unmap_out_base;
 
+	if (of_device_is_compatible(dev->of_node, "amlogic,meson-s4-sm") &&
+	    meson_sm_register_power_off(dev, fw))
+		dev_warn(dev, "failed to register power-off handlers\n");
+
 	pr_info("secure-monitor enabled\n");
 
 	return 0;
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..3f2fa160e32f 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -15,6 +15,7 @@ enum {
 	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_SET_POWEROFF_FLAG,
 };
 
 struct meson_sm_firmware;
-- 
2.56.0


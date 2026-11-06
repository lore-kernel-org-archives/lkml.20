Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960362;
	b=psmcdAJ/224DC/Ilokw9MuTlAYvQj00lP6ENlyedD32C5+fAeXiA6YGf5rxEzNaStm6H
	 hkCX28WxrXhUHU3NmzL0bI/RfKSVGAt1t8VdofKacRINspCYtcxR9xPYFKqIj6nBgJCyU
	 q7klH+fz8OzWOZuu22zV7AANH39CoxXU6ihpdgcFxUUx6OWtBeWzLR1uTNXOIiL+rKn9l
	 fXAEHIowq1GUeafaEDZGJ818RIkvUP0qJ4lIB9gmvU7vi8fKWcUjU0DAu7eEdlc0n0VhH
	 HRsLByKqCSKFj+GlXh9rGXpo8R+mbHrHW4cUFqMuij2FUWYECV5i6XWcQeCA5qTNwVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960362;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=FQyyOJeI2Mbet+u86QRL7Xi1ZkmhZ27qXA46SycGnFM=;
	b=UVAbsg7PofmHvuSseXHiTfHCxP6HZ4bgBOZQ+ltAT6oTMH0wQYkFxXB8XJCcj4EpNSDx
	 BHDXgaZKNwxbVo8VNGUVQK3kpALmZMfu8/s9RRBy7fX6NSZDclyjfBULKMg9ZursVPYVu
	 8a2oGEm4i+kOztvzspSA4dvE2jsrXpLBZhZY5y+cZV26wzIH4wzPZawppaeWkfV/gselW
	 kC182f3PrLiXtWxcGsSOpGxt89FAAtxluDvuJrtoITn340/1XlUTBzywzjEmcLjrt+6MF
	 JE/RggBkoH1XQx8KDNn6tjuVA0YkQal+KOZqi/qHx3Zl1OKusChrgm11b7ond5wcuDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=e+I20grL;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C853606A33F;
	Fri,  6 Nov 2026 10:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C853606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=e+I20grL
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AIuX11863787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:02 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AIuX11863787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960342;
	bh=FQyyOJeI2Mbet+u86QRL7Xi1ZkmhZ27qXA46SycGnFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e+I20grLGd86uiKasozl/mnJLOHUxrDTCHuOc/NeGDAH0wZaQku++hAwGEzxF+L9Y
	 aM+krN8L/c7skFfIfdqqR+LZqIsXdZJDFqFjIrdeJV9DRdC8vGdsPtbBj2n0hCItso
	 QqJaOWZRmoQ7wrrXWrvp3SQVycro7cqFP/BstzYY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 2/2] firmware: meson: sm: make power-off work on S4
Date: Fri,  6 Nov 2026 11:18:54 +0100
Message-ID: <20261106101854.46569-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
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

Register a power-off prepare handler that does both, for the
amlogic,meson-s4-sm compatible only. It offlines the secondary CPUs
with remove_cpu(): machine_power_off() later only parks them with
smp_send_stop(), and CPU hotplug no longer works at that point.

Tested on an S905W2 board: poweroff followed by the power key
cold-boots the board.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/firmware/meson/meson_sm.c       | 31 +++++++++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..de0c8e809c51 100644
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
@@ -303,6 +306,28 @@ static struct attribute *meson_sm_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(meson_sm_sysfs);
 
+/*
+ * The S4 firmware implements PSCI SYSTEM_OFF as DDR self-refresh: on the
+ * power key it jumps back to the kernel instead of booting, which hangs the
+ * board. Setting the shutdown flag first makes it cold-boot instead, and the
+ * secondary CPUs must have been taken down through PSCI CPU_OFF beforehand,
+ * otherwise the wake-up path hangs as well. machine_power_off() only parks
+ * them, so offline them here, while CPU hotplug still works.
+ */
+static int meson_sm_power_off_prepare(struct sys_off_data *data)
+{
+	unsigned int cpu, primary = cpumask_first(cpu_online_mask);
+
+	for_each_online_cpu(cpu) {
+		if (cpu != primary && remove_cpu(cpu))
+			pr_warn("meson-sm: failed to stop CPU%u\n", cpu);
+	}
+
+	meson_sm_call(data->cb_data, SM_SET_POWEROFF_FLAG, NULL, 1, 0, 0, 0, 0);
+
+	return NOTIFY_DONE;
+}
+
 static const struct of_device_id meson_sm_ids[] = {
 	{ .compatible = "amlogic,meson-gxbb-sm", .data = &gxbb_chip },
 	{ /* sentinel */ },
@@ -343,6 +368,12 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 	if (devm_of_platform_populate(dev))
 		goto unmap_out_base;
 
+	if (of_device_is_compatible(dev->of_node, "amlogic,meson-s4-sm") &&
+	    devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
+					  SYS_OFF_PRIO_DEFAULT,
+					  meson_sm_power_off_prepare, fw))
+		dev_warn(dev, "failed to register the power-off handler\n");
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


Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E6049AA57
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162479; cv=none; b=lZZDLKtqOxws/So80XtTLjdlNY7KeS+lzdj89VoS62UVcHVXij69micYQM9XW/yuKre95Nc3svDJS8M/moGIfih6YSFoVM/R0B/b4+p8Ocih9nDdUgLgFeQuDvuZGbitX/2+YFFCKzVVqGviQGJ69VRvFmiCxLXdHVvOMVWoarA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162479; c=relaxed/simple;
	bh=l4sOiiVRttsVL1yIB+otV+BHBVDymLyP6LIpmQAcZLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ajXn+qKQb6RaZ4C5GmNXJwJDJcs62n72ilfn2qwvazy7xnhHEUo8bGQdbTZCdMtjTeQo7IzbLKuFRZtJAPw+W1Lu58DTxc4jvoyIpxm7X214PBrxvb8htFCZ+xNhg3dBcnR4ockYOBap9i52kl1RI4D1cfKMb2Npyaf5uy31VSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=qnKP6yun; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="qnKP6yun"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 16BB26005402;
	Wed, 23 Sep 2026 12:12:59 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id kaF9eFl8NHYT; Wed, 23 Sep 2026 12:12:57 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 67AFF6003C2E;
	Wed, 23 Sep 2026 12:12:56 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1790161977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LoDof0Bw8itQa6OT3DY4OPRHM5yrJMsSi1RNSka17X8=;
	b=qnKP6yunEOJBZYBV5BQY4QdQngrse7Hc7qIzRxmiwLdvYhPzEXcqGr0ipBAAS3lDbi47KX
	TDK+OkN2fl5VK6tpMIdh1uT2y1VrpOx5R5KJEfYqVLi4hXVeJ/wfIPxnkcBSfhBYy4x2VB
	TY4Rlyt/KHLbJyjlg2qlk82XQvwf31EniEF4TplobHWmGdloBietOHrg9fNomctp1XDF9c
	YjRf0832bOxGSGwwXvqxoiWbr3NNtVSa5ohSfv6XxLBfultzXp4DwM5ZVFyk/Zz6xyPpj3
	2HWTh9UL6M1+3I5J4Kgql6qg1jJDc4ClmC6iCxg5a9FufgRKVx4nRDLbWer8Tw==
Received: from [192.168.1.82] (unknown [IPv6:2001:8a0:67f3:eb00:ee56:8d5c:4e29:8df0])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 92B3936011C;
	Wed, 23 Sep 2026 12:12:55 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Wed, 23 Sep 2026 12:12:06 +0100
Subject: [PATCH] firmware/psci: Convert poweroff to the sys-off handler API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-firmware-psci-v1-1-430646653fc6@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU2MD3bTMotzyxKJU3YLi5EzdNBNDc0tLA8MUY9MUJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAI2+Sh1xAAAA
X-Change-ID: 20260530-firmware-psci-f4179901d35d
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161975; l=4801;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=l4sOiiVRttsVL1yIB+otV+BHBVDymLyP6LIpmQAcZLs=;
 b=t4oG8XG/Xv/3slE8pRy8WfYjuA+Q2q11pecjWS7qQziZQAJlKoXfNu+v4+26VNYop6XECU58O
 syAyeYNgjRXBlb3MYILgijnG46VHNCqKBvpS698HJt/v/k/+DIZE4cq
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The PSCI poweroff handler is currently registered via pm_power_off,
which fires as the last SYS_OFF_PRIO_DEFAULT handler. However, there
are two problems with this approach: PSCI is a firmware mechanism, so
its priority should be SYS_OFF_PRIO_FIRMWARE, and the point of the
sys-off API is to eliminate pm_power_off and make the ordering and
priority between shutdown mechanisms explicit.

This patch converts PSCI to register_sys_off_handler() so that its
position in the shutdown sequence is explicit and governed by priority.

In an ideal world PSCI would always be registered at SYS_OFF_PRIO_FIRMWARE
since it is a firmware mechanism. However, this approach would lead to
several problems:

 - On platforms with ACPI/EFI and PSCI there would be a clash at FIRMWARE
   level, and the first to register would prevail.

 - Not all platforms have a functional PSCI SYSTEM_OFF callback. This
   happens for example in some Tegra X1 platforms, where shutdown needs
   to be handled by the PMIC driver, explicitly marked as a
   system-power-controller.

As such, the approach here is:

 - On ACPI systems EFI (SYS_OFF_PRIO_FIRMWARE + 1) and ACPI
   (SYS_OFF_PRIO_FIRMWARE) already handle poweroff at higher
   priorities. PSCI registers at SYS_OFF_PRIO_DEFAULT as a fallback
   that runs after both.

 - On DT systems with no system-power-controller, PSCI is the primary
   firmware poweroff path and registers at SYS_OFF_PRIO_FIRMWARE.

 - On DT systems where a system-power-controller node is present, a
   dedicated platform driver is responsible for poweroff. PSCI
   registers at SYS_OFF_PRIO_DEFAULT - 1 so that driver takes
   precedence while PSCI still acts as a backstop.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
---
 drivers/firmware/psci/psci.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..fc7986b7f12f 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -13,7 +13,6 @@
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <linux/of.h>
-#include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
@@ -79,6 +78,8 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void)
 static u32 psci_cpu_suspend_feature;
 static bool psci_system_reset2_supported;
 static bool psci_system_off2_hibernate_supported;
+static bool psci_system_off_supported __initdata;
+static bool is_dt __initdata;
 
 static inline bool psci_has_ext_power_state(void)
 {
@@ -329,9 +330,11 @@ static struct notifier_block psci_sys_reset_nb = {
 	.priority = 129,
 };
 
-static void psci_sys_poweroff(void)
+static int psci_sys_poweroff(struct sys_off_data *data)
 {
 	invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
+
+	return NOTIFY_DONE;
 }
 
 #ifdef CONFIG_HIBERNATION
@@ -665,6 +668,40 @@ static void __init psci_init_smccc(void)
 
 }
 
+static int __init psci_poweroff_init(void)
+{
+	int priority = is_dt ? SYS_OFF_PRIO_FIRMWARE : SYS_OFF_PRIO_DEFAULT;
+	struct sys_off_handler *handler;
+	struct device_node *np;
+
+	if (!psci_system_off_supported)
+		return 0;
+
+	if (is_dt) {
+		/*
+		 * If a system-power-controller is designated in DT, a dedicated
+		 * driver should handle power-off; in that case register PSCI at
+		 * SYS_OFF_PRIO_DEFAULT - 1 as a fallback. This covers both the
+		 * case where that driver fails to power-off the system and the
+		 * case where it fails to register its own handler.
+		 */
+		np = of_find_node_with_property(NULL, "system-power-controller");
+		if (np) {
+			priority = SYS_OFF_PRIO_DEFAULT - 1;
+			of_node_put(np);
+		}
+	}
+
+	handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, priority,
+					   psci_sys_poweroff, NULL);
+	if (IS_ERR(handler))
+		pr_err("Failed to register PSCI power-off handler: %ld\n",
+		       PTR_ERR(handler));
+
+	return PTR_ERR_OR_ZERO(handler);
+}
+subsys_initcall(psci_poweroff_init);
+
 static void __init psci_0_2_set_functions(void)
 {
 	pr_info("Using standard PSCI v0.2 function IDs\n");
@@ -681,7 +718,7 @@ static void __init psci_0_2_set_functions(void)
 
 	register_restart_handler(&psci_sys_reset_nb);
 
-	pm_power_off = psci_sys_poweroff;
+	psci_system_off_supported = true;
 }
 
 /*
@@ -822,6 +859,7 @@ int __init psci_dt_init(void)
 	init_fn = (psci_initcall_t)matched_np->data;
 	ret = init_fn(np);
 
+	is_dt = true;
 	of_node_put(np);
 	return ret;
 }

---
base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
change-id: 20260530-firmware-psci-f4179901d35d

Best regards,
--  
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>


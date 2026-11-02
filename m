Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638487;
	b=rX7sn5lRL+deJhMLJZ/7otH0B4obZriqGEUW8gAG+OIx4xhYWHi1SUlOp3lmnfVMMcFS
	 oONqLi/Trzti+Vs/zcAI1eRPTLRtzeRAzzTL7yhbwIC4UkDIxRfxbmVwhJU9JqzbA1jR3
	 cpX3ZA4LV4YRnvulBEqZAsm9QwVaxbEtt+gIXuQiTUdp4Il292K5cUcJzdEaXnJdRy2be
	 6SKLJiZOGrFtY+U4s1VahPzCUqh4wPH9yldwPc2cj19ggd9+oOsHPOnYNol4OpIIC8M7w
	 Z0vCHsXbkOnTQ1fnEBVkOIK5zyr7xgbrf5WsZo0i12jtMqbdBMvX0PNqNn6e+pcamww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638487;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bylAnhzRKk+oY7TjttZCTS4qJlXA0vQgiLrrZihE+M8=;
	b=W8X7R05xIMsdgWF8sewYA+AmU+ea9L+qQcCYy9lOuQssQolXjvJQWAlayjGK+nrjMlzt
	 e/wRnJCLO2peEFSJYuzK4xrvlq8QzKDNMTLuM5o4v357w/aSWi89qrsmHDelhuy+BUtyr
	 Y9wnNSVQNXtUqMjVuPbGzqWKtWWMjA+GixKDXYHsSgi3KNYzO6eESEfT+OenYrmzpYWfY
	 Pa7/1l0T8FTAVbaPOsAMNA0rOWGIeavuFmf9sPclwPQ3z/Aplay6lF2RzURf9V+WR/No0
	 GAWrgWj0+BilWLuNRdwDf5DeqN+CwP8zbngppvWOuMhRT1LrUoLAj/yi9v3YHo8oscA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NEOoWnEg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6506093D49;
	Mon,  2 Nov 2026 16:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA6506093D49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NEOoWnEg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D7E2659;
	Mon,  2 Nov 2026 08:54:43 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B5F33F59E;
	Mon,  2 Nov 2026 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638486; bh=HmbbqTV9MwGz3CuQNcHgWpUqagEY1pBDXMq+5aNIOq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NEOoWnEg3oyv9l1BVYwa7B9lyu3SzmOFz8zvR3VasAsy+HZAlXnu+EhMzKiUmd7r4
	 xUfsmiWMyRLmNVh6aNT2zxWFYQzE7dNxO2S3SdTzEGa0aY7mBzuSGeQB9nmKYTjSLa
	 Nj39q4v457H6Vz/4NWiKo8oCV8fVn8mdOoFJCp1k=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>,
	vsethi@nvidia.com,
	Varun Wadekar <vwadekar@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT interrupt
Date: Mon,  2 Nov 2026 17:54:19 +0100
Message-ID: <20261102165421.3651202-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Arm Live Firmware Activation spec describes an asynchronous
notification mechanism, where the platform can notify the host OS about
newly pending image updates.
In the absence of the ACPI notification mechanism also a simple
devicetree node can describe an interrupt.

Add code to find the respective DT node and register the specified
interrupt, to trigger the activation if needed.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 65f28ffc9d108..3ff368dca9497 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -46,6 +46,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/nmi.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/psci.h>
 #include <linux/rwsem.h>
 #include <linux/stop_machine.h>
@@ -182,6 +184,7 @@ static struct kset *lfa_kset;
 static struct workqueue_struct *fw_comps_update_wq;
 static struct work_struct fw_comps_update_work;
 static struct attribute *component_default_attrs[LFA_ATTR_NR_IMAGES + 1];
+static unsigned int lfa_irq;
 
 /*
  * A successful component activation might change the number of available
@@ -913,6 +916,31 @@ static void lfa_remove_acpi(struct device *dev)
 }
 #endif
 
+static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
+{
+	activate_pending_components();
+
+	return IRQ_HANDLED;
+}
+
+static int lfa_register_dt(struct device *dev)
+{
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
+	if (!np)
+		return -ENODEV;
+
+	lfa_irq = irq_of_parse_and_map(np, 0);
+	of_node_put(np);
+	if (!lfa_irq)
+		return -ENODEV;
+
+	return devm_request_threaded_irq(dev, lfa_irq, NULL,
+					 lfa_irq_handler_thread, IRQF_COND_ONESHOT,
+					 NULL, NULL);
+}
+
 static bool lfa_smccc_has_all_functions(void)
 {
 	struct arm_smccc_1_2_regs regs = { 0 }, res;
@@ -980,6 +1008,10 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 		err = lfa_register_acpi(&sdev->dev);
 		if (!err)
 			pr_info("registered LFA ACPI notification\n");
+	} else {
+		err = lfa_register_dt(&sdev->dev);
+		if (!err)
+			pr_info("registered LFA DT notification interrupt\n");
 	}
 
 	/*
@@ -999,6 +1031,7 @@ static void lfa_smccc_remove(struct arm_smccc_device *sdev)
 {
 	if (!acpi_disabled)
 		lfa_remove_acpi(&sdev->dev);
+	devm_free_irq(&sdev->dev, lfa_irq, NULL);
 	clean_fw_components_tree();
 	flush_workqueue(fw_comps_update_wq);
 	destroy_workqueue(fw_comps_update_wq);
-- 
2.43.0


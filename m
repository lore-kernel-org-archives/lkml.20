Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00C95293FD;
	Fri, 16 Oct 2026 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175266; cv=none; b=II42oVOPxbVLI51eAlqm0hal859jcZ4bqwLyKirkk8/aAKSJynEyGZKzX1lrvXuytTZHWbA3bLAJ+o4e5Ki/yxzzeamTYdgVDcL+i96Y3jWYQlguKLyuLXASfjWkpgfqcjrOVE+cg++bncAvk8rNInmEm3pNEpn2CdJFJXrO9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175266; c=relaxed/simple;
	bh=HmbbqTV9MwGz3CuQNcHgWpUqagEY1pBDXMq+5aNIOq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kD/0UUf7Xw4JNMcX5UtpPVTsbggAfIqHNIDMtaL/2faGJ7CYf7h5txYjSJSiwsYOgx1MR3SDAX6Q9ARnpNy0h8b4lPKRWowL/4Hdy2m/kqHMqg2A/OFUs9YxlYZIazA7aSTsj+A4PRxLcC1VbeEUKRuds1Fx1AOVZIAjNJ8nUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lwFSMYMY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lwFSMYMY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A78A114BF;
	Fri, 16 Oct 2026 11:27:40 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A8C73F7B4;
	Fri, 16 Oct 2026 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175263; bh=HmbbqTV9MwGz3CuQNcHgWpUqagEY1pBDXMq+5aNIOq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lwFSMYMYNCSSkLv5mBffjvHCDb5PeL+fS8vIDB3aUUfCaZ0s65NrJGO+oXVO7/J0Y
	 nZJ9PP+VmGfZvNG7EF2aF92blbqMHGfW5pa0QYHRodfVgykZfqht4Ze1zGOs+j5hnx
	 p6MojAVPB9saACdTYMktWlByRXqxZ2/gEvulnhko=
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
Subject: [PATCH v5 7/8] firmware: smccc: lfa: Register DT interrupt
Date: Fri, 16 Oct 2026 19:27:11 +0100
Message-ID: <20261016182714.1835813-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016182714.1835813-1-andre.przywara@arm.com>
References: <20261016182714.1835813-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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


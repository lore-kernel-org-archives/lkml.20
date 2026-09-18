Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967D84F68DB;
	Fri, 18 Sep 2026 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740705; cv=none; b=iugMQLS0g88Pe3sjMWR4DzN0bEj9cq7OqfScZHkxZ8x6Lpb7Vv4oBwBU3htlyhWlM5ZkkhAwrqHcjj7wAnsbuuzxBOmzQ3xxE8D/nhU2hwrb00wkPupyl26oPo5ayfmZdHZGRLtzy613uiiS6X7sAnPot/xu2x9sDVTUZ7Fn4mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740705; c=relaxed/simple;
	bh=FKj7gJ++G++n7fDeDo9/Cdn7Ipnxnl9yUVmYKTr5z1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwbtE9cn+0kpkhUeYOQagXwYle0ht5b+wjh6B8FZANBTfgYQtNZsPNqKGHzOFTzzM/W1+gCQW1cnZZdpjPKvS7nN9d8A5GmbLCyz+ffPjmAzEQ+y4UBVaDRmdlGJsONTsRin7MnEHOjN/tEYUj7zHAiHkk+uZIbzWn7lVVBUF7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iMLKelrQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iMLKelrQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0DE2168F;
	Fri, 18 Sep 2026 07:11:38 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A87433F86C;
	Fri, 18 Sep 2026 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740702; bh=FKj7gJ++G++n7fDeDo9/Cdn7Ipnxnl9yUVmYKTr5z1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iMLKelrQtB4f/cgVg0lvweqH3GjnXOudFJBq2gCVmJ7PhvUPhqj8CnNqNfA2ypH6W
	 8tW7i8jXYCKyv/9USa11d7pXv6ngt5+T8K0l525RFlHLVGRQxzfCLg3gtIge4HnBeR
	 OosPNEe4A0+PbOS2PKb0b1TdDyEB7NojvbcGBkJE=
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
Subject: [PATCH v4 6/8] firmware: smccc: lfa: Register DT interrupt
Date: Fri, 18 Sep 2026 16:11:09 +0200
Message-ID: <20260918141112.2115555-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
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
 drivers/firmware/smccc/lfa_fw.c | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 7a55b4a6785d8..a23df331ffde9 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -16,6 +16,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/nmi.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/psci.h>
 #include <linux/stop_machine.h>
 #include <linux/string.h>
@@ -871,6 +873,37 @@ static void lfa_remove_acpi(struct device *dev)
 }
 #endif
 
+static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
+{
+	int ret;
+
+	while (!(ret = activate_pending_image()))
+		;
+
+	if (ret != -ENOENT)
+		pr_warn("notified image activation failed: %d\n", ret);
+
+	return IRQ_HANDLED;
+}
+
+static int lfa_register_dt(struct device *dev)
+{
+	struct device_node *np;
+	unsigned int irq;
+
+	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
+	if (!np)
+		return -ENODEV;
+
+	irq = irq_of_parse_and_map(np, 0);
+	of_node_put(np);
+	if (!irq)
+		return -ENODEV;
+
+	return devm_request_threaded_irq(dev, irq, NULL, lfa_irq_handler_thread,
+					 IRQF_COND_ONESHOT, NULL, NULL);
+}
+
 static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 {
 	struct arm_smccc_1_2_regs reg = { 0 };
@@ -913,6 +946,12 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
 			pr_info("registered LFA ACPI notification\n");
 		if (err != -ENODEV)
 			return err;
+	} else {
+		err = lfa_register_dt(&sdev->dev);
+		if (!err)
+			pr_info("registered LFA DT notification interrupt\n");
+		if (err != -ENODEV)
+			return err;
 	}
 
 	return 0;
-- 
2.43.0


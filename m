Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686867;
	b=Y3lAj23mT3vK+34KMT+p9BShzlVWEgA4mi5njYPWfWSaWobo4qHqouceCnCqb0r3Wojf
	 VM/o7o6alrmtokwbPo069y1tAMkJZTlvVcFKDaWZJCik8RB23Sz9hsUFUnce57VQfcFQc
	 jNFC1NccqJKIl6VYqE59E06M1jydbM0/XsGzeXjfPLp/bolrg1eAySSqiiGL2nJoP4m7o
	 4La82swOE6agG+zOn/XGJmh6cXW420XVqX3waoIpYhhg7qRBHluurYhfWIrCwpBeigMuU
	 gyszgmfdnTLMsOLYRuID20vfQyEnix738SQsPKWHXc2fxBumsqKGaSZdkFEKShoCe8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686867;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Spam-Status:X-Spam-Checker-Version;
	bh=/wXeMJQP9j32DFN1qUwOOrQZZAiVvhUjuCGos3DlqT8=;
	b=c/HbGDmCWFoRfkJNEPMGCRl6HzkxQ28loYS3S47b3pzC17m+hmLopCom/l1oHLi29ZBt
	 6MHGAlFSsFjOhqiJjRc5R7BCFRhiiUXtW+Va6WRG8huMHSeIxLtYbwuti1AySkQMHeQDk
	 qHHGEi7l09AbyxeQl4dgfVaGVYShTNS5gVHOPBpsFKK7Y2scO7OWLGEnLMWJfR+vLSb8C
	 defWF1rnq/3BvL/z/Lm7ML+U3+HsGnyrEeK5Ia3ZIYiXlmY6LbBeu1a6RSETZnObbZFDD
	 ebyf3NOC1PyjflSCVO6S6Yh52IGozO6gMO96xp/R3ewYwpZZ2+kx+z1M67pEPTVOxgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=DklaSXtw;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE00B606D806
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE00B606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=DklaSXtw
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id C2AC020B7166;
	Mon,  2 Nov 2026 22:20:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C2AC020B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793686851;
	bh=/wXeMJQP9j32DFN1qUwOOrQZZAiVvhUjuCGos3DlqT8=;
	h=From:To:Subject:Date:From;
	b=DklaSXtw7SHAIALYclRuAVd5YoKcE9QbQAqIZlYNsCoeeclQbjdu0n6nqa79rHr+o
	 +yOHeOv3PIbQOZRyB6UxjRh8UOE04l8Qm1jwe2R1jv/Hdd47YvlUPbFgaedM4jsMjP
	 Uzh52V0b/2FUrLCLmCsqT6pIOwRVezeCpj0+5bjw=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	jassisinghbrar@gmail.com,
	michal.simek@amd.com,
	tanmay.shah@amd.com,
	saeed.nowshadi@amd.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ssengar@linux.microsoft.com,
	tgopinath@linux.microsoft.com,
	srivatsa@csail.mit.edu
Subject: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
Date: Mon,  2 Nov 2026 22:20:51 -0800
Message-ID: <20261103062051.676519-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
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

On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
instead of the its actual state. This can leave the mailbox driver
callbacks dangling. Use the actual CPU hotplug state during driver
removal.

Hotplug registration failures are also ignored, allowing probe to
succeed without the callbacks needed to enable interrupts on CPUs
brought online later.

Fixes: 6ffb1635341be ("mailbox: zynqmp: handle SGI for shared IPI")
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 42d2583e44ca..b0643ee75db0 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -136,6 +136,7 @@ struct zynqmp_ipi_pdata {
 	unsigned int method;
 	u32 local_id;
 	int virq_sgi;
+	enum cpuhp_state hp_state;
 	int num_mboxes;
 	struct zynqmp_ipi_mbox ipi_mboxes[] __counted_by(num_mboxes);
 };
@@ -863,15 +864,22 @@ static int xlnx_mbox_init_sgi(struct platform_device *pdev,
 	irq_set_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
 
 	/* Setup function for the CPU hot-plug cases */
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mailbox/sgi:starting",
-			  xlnx_mbox_cpuhp_start, xlnx_mbox_cpuhp_down);
+	pdata->hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			  "mailbox/sgi:starting", xlnx_mbox_cpuhp_start,
+			  xlnx_mbox_cpuhp_down);
+	if (pdata->hp_state < 0) {
+		irq_clear_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
+		free_percpu_irq(pdata->virq_sgi, &per_cpu_pdata);
+		irq_dispose_mapping(pdata->virq_sgi);
+		return pdata->hp_state;
+	}
 
 	return ret;
 }
 
 static void xlnx_mbox_cleanup_sgi(struct zynqmp_ipi_pdata *pdata)
 {
-	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
+	cpuhp_remove_state(pdata->hp_state);
 
 	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
 
-- 
2.49.0


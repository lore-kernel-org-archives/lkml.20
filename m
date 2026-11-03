Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687738;
	b=cx1SIno3pW96wkJRSyzLLRpofYUslw7Hypwbx3WQQhlRWEcKi0gNwFOMUJG5DDc7tQKz
	 doruoSD389JXV6Csy0MSaFz89x9sNExVdqnF7hZFeH37kwwsdGgdDzfqjGc1FiLs0crwo
	 znggJKz8lbWZhJYYOdYf7KVIPQbXBsZHGMr/YDuUSFLbtdkjclKyuW0L4tX6J31QKzmPa
	 6Mbem8gzKJdZtB0Nhw0WH2JnlSXa79S7VDIZflIxipIn7jwveMAzJURMT3qqO7CXFJhZo
	 TYooDEBR3BqAIrmf2XLFs+o4QSsh1nv35Y+s5HG6Nkug+DSR45cvbjUYabEtx9BjKEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687738;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Status:X-Spam-Checker-Version;
	bh=4dMx8oyOcsvpKZmeDA9XB9ac9xFIUPa8LzVWlB1uze0=;
	b=3cesduwIbuOGPeMbIgxoxX5ZFZTHqWDgdJFFki/pQDAWIx5vwU5qYHy5UWREkBxKE1E3
	 sr1AOMxokNEA2bcXRrizcK4O1yweRt3HGF6vK4Bsow+aHgomHCzlaUTtfB0Km4Jhtk0Z7
	 Rdj2SuVBvitftTEM3M2+BMQugHp/dqdQcfQwJH4l3MWhcIY5aa780yj6TKt9JzXYqFlHh
	 9HKofQHZJmtF7/wLEPehL84Wg1lIzyyQJOIHpc6PjRNNbig8P0ZlbhBefnqpsvzYj+2GP
	 1cAIEU0Qg+aVnVltVRfAiEE0M47ba0BSBcnvC5cUE9bFpTV424N/m42TSHkjzgOTDkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=C5cyDqhH;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C548B606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C548B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=C5cyDqhH
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2C2A520B7166;
	Mon,  2 Nov 2026 22:35:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C2A520B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793687716;
	bh=4dMx8oyOcsvpKZmeDA9XB9ac9xFIUPa8LzVWlB1uze0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C5cyDqhHIsCzTiuaHaq1svaWIigxtCUNFwtyf3xrRWLVfHaPzEuC+kkRVWp4/b4hX
	 U9tpDMG1ocmExkay0nGn+XuYmo9Lf74YcXSQdJ5SADB409yr9l9X/VGQnUm8ecn/rI
	 fm0s96BJYEu85+5MNVjg6ExXjFQkkrOXzGZIgOoE=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	tgopinath@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	srivatsa@csail.mit.edu,
	michal.simek@amd.com,
	rajan.vaja@xilinx.com,
	tejas.patel@xilinx.com,
	abhyuday.godhasara@xilinx.com,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: xilinx: Fix event manager CPU hotplug state cleanup
Date: Mon,  2 Nov 2026 22:35:15 -0800
Message-ID: <20261103063515.679043-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261103062051.676519-1-ptsm@linux.microsoft.com>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
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

On driver removal, the event manager removes the CPUHP_AP_ONLINE_DYN
CPU hotplug state instead of the its actual state. This can leave the
event manager callbacks dangling. Use the actual CPU hotplug state
during driver removal.

Hotplug registration failures are also ignored, allowing probe to
succeed without the callbacks needed to enable event interrupts on
CPUs brought online later.

Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event management driver")
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/soc/xilinx/xlnx_event_manager.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
index f733dc42b3b1..2d8bfeab4190 100644
--- a/drivers/soc/xilinx/xlnx_event_manager.c
+++ b/drivers/soc/xilinx/xlnx_event_manager.c
@@ -24,6 +24,7 @@ static DEFINE_PER_CPU_READ_MOSTLY(int, dummy_cpu_number);
 
 static int virq_sgi;
 static int event_manager_availability = -EACCES;
+static enum cpuhp_state hp_state;
 
 /* SGI number used for Event management driver */
 #define XLNX_EVENT_SGI_NUM	(15)
@@ -625,8 +626,6 @@ static int xlnx_event_init_sgi(struct platform_device *pdev)
 
 static void xlnx_event_cleanup_sgi(struct platform_device *pdev)
 {
-	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
-
 	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
 
 	irq_clear_status_flags(virq_sgi, IRQ_PER_CPU);
@@ -660,8 +659,13 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
 	}
 
 	/* Setup function for the CPU hot-plug cases */
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/event:starting",
-			  xlnx_event_cpuhp_start, xlnx_event_cpuhp_down);
+	hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			"soc/event:starting", xlnx_event_cpuhp_start,
+			xlnx_event_cpuhp_down);
+	if (hp_state < 0) {
+		xlnx_event_cleanup_sgi(pdev);
+		return hp_state;
+	}
 
 	ret = zynqmp_pm_register_sgi(sgi_num, 0);
 	if (ret) {
@@ -670,6 +674,7 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
 		else
 			dev_err(&pdev->dev, "SGI %d registration failed, err %d\n", sgi_num, ret);
 
+		cpuhp_remove_state(hp_state);
 		xlnx_event_cleanup_sgi(pdev);
 		return ret;
 	}
@@ -704,6 +709,7 @@ static void xlnx_event_manager_remove(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "SGI unregistration over TF-A failed with %d\n", ret);
 
+	cpuhp_remove_state(hp_state);
 	xlnx_event_cleanup_sgi(pdev);
 
 	event_manager_availability = -EACCES;
-- 
2.49.0


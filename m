Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.90.104.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510764;
	b=kyKRKdRAPbZDbIpSVM1ogSzH0o31vuFFGwUVYCeTVLfV0X9DtyDRhSyMF231Wf1Ll0aB
	 cBFl9vah57u1jjpp/jkGtdw0tTJ91cbjS8cnwX7BYD2S4J0rZQbPxW9svQ6onFOkzU6i0
	 Tk5hosCVUZvOa+1sPVk5Lqgj0Pm7yquIQTdap2IWQLq30hEXaBeFQqLS1HQ8Z6QEnY6/d
	 vlDNU+GjsyFmruxeAFPWKhaP3x4oPDfKthFFqzbs5GQEX8zuec/U7EZBn0A1fvLpP/BaE
	 DNpX/8FyDAAo1UUkYb3DMK8I9iQyI0zPqdotiDklGoKHDZStIewYvhMZM+J9EpISJ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510764;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-Amp-Result:X-Amp-File-Uploaded:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=xy84/OhUdkEAmgWQhwV2cjivXNZVLIDniNQi91s3WhY=;
	b=tkDF+vnrMI6bOQia6ZzkL/sbMIXkMjhnXSpwCK7IXBAW3Q3c6sPrXmPa9PyyZKSlghCj
	 l9AE9s5q3uTQlNczngxpD3IUil+7rFC+Y8sEaUyx/1OMDkDUyLcs9QPGiQXtXxCtnnOOi
	 j6P6mqCcXYZtRUDaAtN/hngQuTX8vJtko24gFHCZKUB9aIYIT9UghVGFR3ezXjkp9B3aM
	 RHUZiucYsEqqGolSS/95CIZHLvnb93h/+npAbU/QQF4PgyN6hClt53Of2WUvbfbkYNXSb
	 jJ2UrrtsYqgPtCMSNSWLCIbhaP2yCBqt/TvSB8G8rvmNhkytJz23PpqaIt3rrQt5J7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	arc=none smtp.remote-ip=23.90.104.147
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com [23.90.104.147])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CA660A263D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CA660A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1792510763; x=1824046763;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=gYKX22JJXvjBQaFR9/tw6kVOEs7CPr0eQzlXEVHWhAM=;
  b=b+Crvl0W9ssv+wsz4JjsINCCfN0oq9gJxl8AWKKNojPMmsC70tJTHoJq
   VSje9S1XawMLbt0nGFQkCJavM2NM4emwTnSva+a9yRLUk1IkDA0FVDRZb
   QUylY/1tKVbUr00xgrtv9dDn7L7vo7dESSSNqgkTayj+rNCIWMIosVWvK
   UL+7O/wotZJs61iZudfvGSE+eA+K4ZV8QzR2qA6QSsOrLgy2M4OLClxmB
   G6h1OCL/bF2FczWiClB2eWdrplap5XjYl2o0dotBeSqYG+K8CL5yxdLD0
   4ByaUHZEsiuOhNoZivvzQYxDZo8WwtRRcI8a4PSMAnFr3aULU7B816zjr
   w==;
X-CSE-ConnectionGUID: HtOr2+v/StKuF4ZqYoHW1w==
X-CSE-MsgGUID: 3cyqerxQSjqdYO6ygw5Ltw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 18:39:14 +0300
X-CSE-ConnectionGUID: AoT8UrKGTraFis5HMcQdyQ==
X-CSE-MsgGUID: wgiBKU4qQAuY5JlkNLQL6g==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 20 Oct 2026 18:46:49 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 20 Oct 2026 18:39:12 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 20 Oct 2026 18:38:49 +0300
Subject: [PATCH v5 2/2] irqchip/riscv-aplic: force synchronous probing
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-aplic-async-probe-v5-2-c4861c2aafca@mobileye.com>
References: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
In-Reply-To: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jessica Liu <liu.xuemei1@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0

The APLIC driver leaves probe_type unset, so it follows
PROBE_DEFAULT_STRATEGY and is probed asynchronously when the command line
requests it (driver_async_probe=). The probe of an APLIC instance updates
state shared by all instances without any locking:

- the check-then-set of aplic_syscore_registered; two instances can both
  observe it as false and both call register_syscore(), inserting the same
  list node twice and tripping CHECK_DATA_CORRUPTION ("list_add double
  add") in __list_add_valid_or_report();
- the global aplics list, modified by aplic_pm_add()/aplic_pm_remove();
- aplic_direct_parent_irq, where more than one instance can pass the check
  and register its own CPU hotplug state;

Interrupt controllers are required early and have no benefit from
parallel probing, so rather than adding locks around each of them mark the
driver PROBE_FORCE_SYNCHRONOUS. Probes then run one after another from
driver registration, and deferred probe retries are serialized by the
single deferred probe work item, so the shared state is never accessed
concurrently. Probing is also blocked across suspend, so it cannot overlap
with the syscore callbacks either.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 5369078f3d00..3c10dbf3b492 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -118,7 +118,8 @@ static struct syscore aplic_syscore = {
 
 /*
  * Not __ro_after_init: probe can be deferred (e.g. MSI mode waiting for the
- * IMSIC) and complete after the init memory is made read-only.
+ * IMSIC) and complete after the init memory is made read-only. Probing is
+ * synchronous (see aplic_driver), so no further serialization is needed.
  */
 static bool aplic_syscore_registered;
 
@@ -413,6 +414,12 @@ static struct platform_driver aplic_driver = {
 		.name		= "riscv-aplic",
 		.of_match_table	= aplic_match,
 		.acpi_match_table = ACPI_PTR(aplic_acpi_match),
+		/*
+		 * Probes of multiple APLIC instances share global state (the
+		 * syscore registration and the parent interrupt of the
+		 * direct mode) and must not run concurrently.
+		 */
+		.probe_type	= PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe = aplic_probe,
 };

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205393;
	b=Mq18QlnCHimAhM5ugC6hkwoy5AN8eOAzSDVKpgurXUFLO5FDxJeWMAR19v0jz7DtN3HO
	 IJYX13omENHivzQX2r6rSkiHfRMPhpn5ibh+CB9rnLXdrb4EulwfX9uyFC3Fhpy3UCOHi
	 NR+3OtmjukxPrRZDMxc+gnlFVTh9Gh/9nxUdERx1UbDkKgErk3Fpcn++b07UasuNSuJIY
	 0yJj1JV0a9OCXOMjOuW/dpWqUBqlswjn2HE0N5cQ/BbA+OjR5xHclqXnjWYWHiYCPDyjk
	 9tx9fkDEUVKTC5sG8gwXSxtF+1jn4KEeOIua3LN5F9uMje/J34Dj3WpUXhc4rH5+Ocw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205393;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T4PtK8Eg+0hvZ1oUurp/jXiGwYbII4JAhRTSRWC/UtY=;
	b=RnxJS0516zI5oolYeNmLBenrJMkgBUiFHnACIY2e7QLON9QbznJGO2Ntxgw1neHQhc2c
	 YYd4v9IU/aoTZPiXh7JJ3mFEVId9OTojFtbs61jdZsHPAXedPNjIDQWXZhS1FWYJE9XKD
	 HHENhDcBVon5eOjJrBjHBd9DMwrUkqSlywCpTU+RM0cKw/IhAn1jUWWOtCwdC1DXdtw6l
	 TeYqQiV7cuXpG7DG1x6fLPCQJe02aS4bsUnfH+ZtcB5T2NWoWUo4kkoUGpjBE+en056pN
	 4I69e//n+1Nl6yKhpcNNblqxlzQUpshzOc2ehlNiSKBwEYNMLoLGejOj0TKTww4wPeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uhSvlYm4;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1A606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF1A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uhSvlYm4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tpXii4WHs3Tp5me10+ZA5sf63LCbBJaAeHU4y3oYBZ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205391; v=1; x=1793810191;
 b=uhSvlYm4BrmlI83kzSKuPuVgpTdGaHO7MeasiwDSXF9BKAQxBCHNAlTp6wok8zxNfmB0Tn7/
 6v0XQleWg5qMfFimAiuslbUBq7LK129nkjG8olhhYcl5RtA5LDH4djfgNJlU1kg4uyfMekK5yaw
 1v0jnL6ZzQW3a5aYY9io0uI0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 3e9141462b075e96;
	Wed, 28 Oct 2026 16:36:31 +0000
X-Mizu-Trace-ID: 3e9141462b075e96
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 09/39] sysctl: store device sysctl bounds by value
Date: Thu, 29 Oct 2026 00:34:48 +0800
Message-Id: <b5e63979309194b6bd40d707b9060c37926932c0.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Replace device bound pointers with numeric limits.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 drivers/base/firmware_loader/fallback_table.c | 8 ++++----
 drivers/gpu/drm/xe/xe_observation.c           | 4 ++--
 drivers/hv/hv_common.c                        | 4 ++--
 drivers/infiniband/core/iwcm.c                | 5 +++--
 drivers/infiniband/core/ucma.c                | 5 +++--
 drivers/perf/arm_pmuv3.c                      | 4 ++--
 drivers/perf/riscv_pmu_sbi.c                  | 4 ++--
 drivers/scsi/scsi_sysctl.c                    | 5 +++--
 drivers/tty/tty_io.c                          | 4 ++--
 drivers/xen/balloon.c                         | 4 ++--
 10 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback_table.c b/drivers/base/firmware_loader/fallback_table.c
index c8afc501a8a4..72a47fcf5f45 100644
--- a/drivers/base/firmware_loader/fallback_table.c
+++ b/drivers/base/firmware_loader/fallback_table.c
@@ -32,8 +32,8 @@ static const struct ctl_table firmware_config_table[] = {
 		.maxlen         = sizeof(unsigned int),
 		.mode           = 0644,
 		.proc_handler   = proc_douintvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
+		.min		= 0,
+		.max		= 1,
 	},
 	{
 		.procname	= "ignore_sysfs_fallback",
@@ -41,8 +41,8 @@ static const struct ctl_table firmware_config_table[] = {
 		.maxlen         = sizeof(unsigned int),
 		.mode           = 0644,
 		.proc_handler   = proc_douintvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
+		.min		= 0,
+		.max		= 1,
 	},
 };
 
diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
index 39e05b9131a7..cd56d29d77fe 100644
--- a/drivers/gpu/drm/xe/xe_observation.c
+++ b/drivers/gpu/drm/xe/xe_observation.c
@@ -97,8 +97,8 @@ static const struct ctl_table observation_ctl_table[] = {
 	 .maxlen = sizeof(xe_observation_paranoid),
 	 .mode = 0644,
 	 .proc_handler = proc_dointvec_minmax,
-	 .extra1 = SYSCTL_ZERO,
-	 .extra2 = SYSCTL_ONE,
+	 .min          = 0,
+	 .max          = 1,
 	 },
 };
 
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 27b9b79d4f4c..1018c8a8e6bb 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -147,8 +147,8 @@ static const struct ctl_table hv_ctl_table[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE
+		.min		= 0,
+		.max		= 1
 	},
 };
 
diff --git a/drivers/infiniband/core/iwcm.c b/drivers/infiniband/core/iwcm.c
index 4b05867dad89..0925996aa0fc 100644
--- a/drivers/infiniband/core/iwcm.c
+++ b/drivers/infiniband/core/iwcm.c
@@ -36,6 +36,7 @@
  *
  */
 #include <linux/dma-mapping.h>
+#include <linux/limits.h>
 #include <linux/err.h>
 #include <linux/idr.h>
 #include <linux/interrupt.h>
@@ -109,8 +110,8 @@ static struct ctl_table iwcm_ctl_table[] = {
 		.maxlen		= sizeof(default_backlog),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_INT_MAX,
+		.min		= 0,
+		.max		= INT_MAX,
 	},
 };
 
diff --git a/drivers/infiniband/core/ucma.c b/drivers/infiniband/core/ucma.c
index a15182f7a7c5..4c9f15846d18 100644
--- a/drivers/infiniband/core/ucma.c
+++ b/drivers/infiniband/core/ucma.c
@@ -31,6 +31,7 @@
  */
 
 #include <linux/completion.h>
+#include <linux/limits.h>
 #include <linux/file.h>
 #include <linux/mutex.h>
 #include <linux/poll.h>
@@ -70,8 +71,8 @@ static struct ctl_table ucma_ctl_table[] = {
 		.maxlen		= sizeof max_backlog,
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_INT_MAX,
+		.min		= 0,
+		.max		= INT_MAX,
 	},
 };
 
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 03359e078301..ec934ddf2f92 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1462,8 +1462,8 @@ static const struct ctl_table armv8_pmu_sysctl_table[] = {
 		.maxlen		= sizeof(unsigned int),
 		.mode           = 0644,
 		.proc_handler	= armv8pmu_proc_user_access_handler,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
+		.min		= 0,
+		.max		= 1,
 	},
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 21a2078eab98..0e7d733a0fcf 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1462,8 +1462,8 @@ static const struct ctl_table sbi_pmu_sysctl_table[] = {
 		.maxlen		= sizeof(unsigned int),
 		.mode           = 0644,
 		.proc_handler	= riscv_pmu_proc_user_access_handler,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_TWO,
+		.min		= 0,
+		.max		= 2,
 	},
 };
 
diff --git a/drivers/scsi/scsi_sysctl.c b/drivers/scsi/scsi_sysctl.c
index 055a03a83ad6..85aeffda94cd 100644
--- a/drivers/scsi/scsi_sysctl.c
+++ b/drivers/scsi/scsi_sysctl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/limits.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/sysctl.h>
@@ -18,8 +19,8 @@ static const struct ctl_table scsi_table[] = {
 	  .maxlen	= sizeof(scsi_logging_level),
 	  .mode		= 0644,
 	  .proc_handler	= proc_dointvec_minmax,
-	  .extra1	= SYSCTL_ZERO,
-	  .extra2	= SYSCTL_INT_MAX },
+	  .min	= 0,
+	  .max	= INT_MAX },
 };
 
 static struct ctl_table_header *scsi_table_header;
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 1a6c8a1bc764..2898c7bc774f 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3632,8 +3632,8 @@ static const struct ctl_table tty_table[] = {
 		.maxlen		= sizeof(tty_ldisc_autoload),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
+		.min		= 0,
+		.max		= 1,
 	},
 };
 
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 373042fe501b..8883cfa90a8f 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -92,8 +92,8 @@ static const struct ctl_table balloon_table[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
-		.extra1         = SYSCTL_ZERO,
-		.extra2         = SYSCTL_ONE,
+		.min		= 0,
+		.max		= 1,
 	},
 };
 
-- 
2.25.1


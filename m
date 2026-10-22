Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656702;
	b=04A19MUUrNEwr3xveCgMOeYsNVasJjRZ87UsMrTpjr0tbUo8D5zTmI/mzRZlokjl5GIu
	 KaddJPV4p/Pp26R5RYd12QFnBV/H1FApyi92wEI84mjuGt9j3hNS8/UU4wZLWcYGvSo4k
	 fjkPBRrnBMWXPr1+YnVXiupGlopkFTnCU7fG4CFkNnR6zXUwu0UCNaRzcasDx0YBbrOFg
	 5TW9QHJKO+WajMTt0Z7wyogRQiQ8h2nq1lMgnxn5ucEDO1sylMyPDaHylJ0fcCavVrEJX
	 hbUzgemO7w7Cg+1mnINMNZG1P2P8QhvydUpdlzUu54Ry8tw0tD7CmnhyC7ROvs8mc3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656702;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qYOHuuQ+lfkA5BRdfuA4wsOKx0VJNbOe26fi2cEceWg=;
	b=RmBv+YxrDl3GkfzUVpNlE88kIjpfSiwdHTbO6aKAmj5zO99TdaxL0kasE2tU8HpiqdDE
	 lj45OSXx5q+OOohHVY3su5Zb6KmjW0R0vcrrgByVUOZAIyBhd4950JTeQHx8cZ1FwIQQ8
	 Mg4n6bkH59CtNL4X8eSpz3ezBWoTgrKQA6zFhojiul2kyL+wMzq6ftDI45+sG5uWrBa8K
	 FRcKo/0yKq8FfnjEjT3DkMAz4rLNvusB4urOwEalvtYk2eTyHIK6ObV61AAd5J0fMZuUG
	 Hjc9XgGCgKlADbBf4nhsn7aChj6Qg3TWKm+UAZT3BuodrE+9YoCDSCUjaodlhIERsSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jV1eySsX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6DC606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6DC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jV1eySsX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DC2C1596;
	Thu, 22 Oct 2026 01:11:35 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E39B33F673;
	Thu, 22 Oct 2026 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792656698; bh=dK/jptfyGpjv63FMuBSceW6BBKYpzO/KNBTZR86K/Xg=;
	h=From:Date:Subject:To:Cc:From;
	b=jV1eySsXgMc4w3MGqgbKaG+GojN10rZQi160gqstgYqOtjzJJSZCgzPopatD/kP5P
	 AgXzifYAwKw23aIqf7KZkV7R9ClbOG4xOBzE8e6eBnOn3slUmzNKGLeG/OJgkCncvg
	 9Lt74zwEbwz6MBp59jHWCr4wcao8z1kZISLVUfXw=
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 22 Oct 2026 09:11:26 +0100
Subject: [PATCH] coresight: etm4x: Fix event count decoding
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
Message-Id: <20261022-arm_cs_fix_etm4_event_count-v1-1-588b2922a546@arm.com>
X-B4-Tracking: v=1; b=H4sIAC3F2WoC/x3MQQqDMBBA0avIrA3EabDaq4gMIZ20s0gsSQwF8
 e4Glw8+/4DMSTjDqzsgcZUsW2wY+g7c18YPK3k3A2ocB42obArkMnn5E5dgiCvHQm7bY1Fm9o/
 JWPSjfUI7/BK37r4v63le2gtnUm0AAAA=
X-Change-ID: 20261022-arm_cs_fix_etm4_event_count-49f384a2f6a7
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792656696; l=5144;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dK/jptfyGpjv63FMuBSceW6BBKYpzO/KNBTZR86K/Xg=;
 b=xFN48xQcxo/+laWhi1C2/nj87AFBSHvWUdW1T+NF+q9i1Qf4dsvfCmCxWM3ew/V6cvZFu0FrJ
 33cGPVYrC2uDyviJ8eUMFKR3pTh7B750mXhpa+P5uoTMe4hHyD6tks0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

TRCIDR0.NUMEVENT normally encodes the number of events minus one.
From ETMv4.3 onwards, including ETE, a zero TRCIDR4.NUMRSPAIR instead
means that no events are implemented and NUMEVENT is zero. The sysfs
event controls currently interpret this combination as one event and
allow writes to unsupported event fields.

Decode NUMEVENT after NUMRSPAIR and store the actual number of events
in nr_event. Use the decoded resource count so that older ETM versions,
where a zero NUMRSPAIR represents one resource pair, still report at
least one event. Update both sysfs event controls to use the actual
count and clear their event fields when no events are implemented.

Also correct the instruction event enable mask for the single-event
case to use INSTEN[0]. The existing mask uses INSTEN[1], preventing
event 0 from being enabled.

This change depends on the recent driver refactoring. With no reported
failures, it is not intended for stable backporting.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 +++++++++--
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 29 ++++++++++++----------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e21be6468e9544fe6e22f524de4fef9f89d7484f..b0e286f487017a4155595f14cbb9c9c33b17dc6b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1451,8 +1451,6 @@ static void etm4_init_arch_data(void *info)
 	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
 	/* RETSTACK, bit[9] Return stack bit */
 	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
-	/* NUMEVENT, bits[11:10] Number of events field */
-	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
 	/* QSUPP, bits[16:15] Q element support field */
 	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
 	if (caps->q_support)
@@ -1519,6 +1517,19 @@ static void etm4_init_arch_data(void *info)
 	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
 	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
 		caps->nr_resource += 1;
+
+	/*
+	 * See ARM IHI0064H.b, sections 7.3.32 (TRCIDR0) and 7.3.36 (TRCIDR4).
+	 *
+	 * Before ETMv4.3, one event is always implemented. For ETM v4.3 and
+	 * later, NUMRSPAIR == 0 indicates that no events are implemented.
+	 * Otherwise, NUMEVENT encodes the number of events minus one.
+	 */
+	if (caps->nr_resource)
+		caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0) + 1;
+	else
+		caps->nr_event = 0;
+
 	/*
 	 * NUMSSCC, bits[23:20] the number of single-shot
 	 * comparator control for tracing. Read any status regs as these
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index db9e603f97ba82cd608d3d61881fe8153db020ff..fb38f0102290a53a681934c827abf107c141a740 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -513,19 +513,22 @@ static ssize_t event_store(struct device *dev,
 
 	raw_spin_lock(&drvdata->spinlock);
 	switch (caps->nr_event) {
-	case 0x0:
+	case 0:
+		sysfs_config->eventctrl0 = 0;
+		break;
+	case 1:
 		/* EVENT0, bits[7:0] */
 		sysfs_config->eventctrl0 = val & 0xFF;
 		break;
-	case 0x1:
-		 /* EVENT1, bits[15:8] */
+	case 2:
+		/* EVENT1, bits[15:8] */
 		sysfs_config->eventctrl0 = val & 0xFFFF;
 		break;
-	case 0x2:
+	case 3:
 		/* EVENT2, bits[23:16] */
 		sysfs_config->eventctrl0 = val & 0xFFFFFF;
 		break;
-	case 0x3:
+	case 4:
 		/* EVENT3, bits[31:24] */
 		sysfs_config->eventctrl0 = val;
 		break;
@@ -565,22 +568,22 @@ static ssize_t event_instren_store(struct device *dev,
 	/* start by clearing all instruction event enable bits */
 	sysfs_config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
 	switch (caps->nr_event) {
-	case 0x0:
-		/* generate Event element for event 1 */
-		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_1;
+	case 1:
+		/* generate Event element for event 0 */
+		sysfs_config->eventctrl1 |= val & TRCEVENTCTL1R_INSTEN_0;
 		break;
-	case 0x1:
-		/* generate Event element for event 1 and 2 */
+	case 2:
+		/* generate Event element for events 0 and 1 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 						   TRCEVENTCTL1R_INSTEN_1);
 		break;
-	case 0x2:
-		/* generate Event element for event 1, 2 and 3 */
+	case 3:
+		/* generate Event element for events 0, 1 and 2 */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 					     TRCEVENTCTL1R_INSTEN_1 |
 					     TRCEVENTCTL1R_INSTEN_2);
 		break;
-	case 0x3:
+	case 4:
 		/* generate Event element for all 4 events */
 		sysfs_config->eventctrl1 |= val & (TRCEVENTCTL1R_INSTEN_0 |
 					     TRCEVENTCTL1R_INSTEN_1 |

---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20261022-arm_cs_fix_etm4_event_count-49f384a2f6a7

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


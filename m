Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601017;
	b=SsqEUYT48Atz7iWJgk+AK2/5pOVZ+m3QCPjR0nWE/4CTn6vqtPNNHYsd2rAMDFFmSEOz
	 pA8Ubd1gbA6hX+f2PXDptXUd2BTsDeA6/DvVNvnpHf6v04FcrabJHXLpT35DAFlrLMSHs
	 7E9dNW/Fm4pNMjCVv9AJ6TyD17vGxacMAuxtrWrAwS4+cTaWcBDb37itEfW43KGPRATdF
	 wHW94BGEl0P9zp/k6aM0C+YAgtDDuDtNrUzunKr8gaMIZkP02kn0PRPbRUk5s9BlrKnKZ
	 5hMJUAgCRE3/FWxitp/qIAPEujmsuYHLCpaLT5LWFecPWwBzOv2gLkNNYRnULg4csyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601017;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jJagp3/aI4VISZi8g8kQqTjVESVyNbK/TdcfBbWn+K8=;
	b=Qox7PswxxyGBOQpmIp7+AlgoLans2tNCTTpJXL3aPHhyxoiBGWwbHk/mvoyhdQBX3U8/
	 s7C5JJZxHnCKXpKvsspUGrRhmxVXRMyj5h78/A7RVZtvfsWvXD4dOoHMB5atc+lNTDoVe
	 mYsP/c9EcFHpAgIb5Yn4OJWHW5RIBW4aUi+9YQga0YG6d/XpyLN2zfsbJSnVm6aDfkO1R
	 kS3vFvkGaxVEVCVmGDQaZsEDP9dAjS6l2nvpFD8QiI0Cvd+VcY6u3TlZcSvSzlv/j5ePr
	 dMRudAbM2IDTV0bdUruX0GeBzbcVtY//EcbGeg/j+rAc95PYNIPl56jLXZtGZYz20+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=njeze0JP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A19606A319;
	Wed, 21 Oct 2026 16:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A19606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=njeze0JP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 179AA1756;
	Wed, 21 Oct 2026 09:43:32 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9DDF3F7D8;
	Wed, 21 Oct 2026 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792601015; bh=pTG1M1AhoRIl85w5oJURP9jvzcTWRrqw5hYeYanFX1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njeze0JP3ZuJZGz0/cxGFIwiygbTIsjJp8h83dKSpc0RVAt2rJDCoVsG4xKgUOWz0
	 kP+RYX+GUGibwULZNIvvjKAVELbY/KiFrdM+dBFqZJepx8r7KejBNKi0DAlshl7G7M
	 9fv4bm7jamJQZQt1ZToOQ+Uq6wN1uHz8pBVVy1FQ=
Date: Wed, 21 Oct 2026 17:43:32 +0100
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
Message-ID: <20261021164332.GI26205@e132581.arm.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012230527.750567-4-aaupov@fb.com>

On Mon, Oct 12, 2026 at 04:05:22PM -0700, Amir Ayupov wrote:

[...]

> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -35,6 +35,10 @@
>   * a device that matches one of its classes and has all of its capabilities.
>   */
>  #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))

We can just use a single capacity for all output singals. It would be
good to follow the naming convention in the Arm ARM:

  #define CS_CFG_MATCH_CAP_TRCEXTOUT            BIT(8)

>  int etm4_cscfg_register(struct coresight_device *csdev)
>  {
> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>  	struct cscfg_csdev_feat_ops ops;
> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>  
>  	ops.load_feat = &etm4_cfg_load_feature;
> +	match_flags |= (u32)drvdata->pmu_extout << CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
>  
> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
> +	return cscfg_register_csdev(csdev, match_flags, &ops);

I would suggest to enable the capability bit base on drvdata->caps:

  if (etm4x_is_ete(drvdata) && drvdata->caps.nr_events)
	match_flags |= CS_CFG_MATCH_CAP_TRCEXTOUT;

For now, we can enable TRCEXTOUT for ETE only, as this should be
sufficient to detect the feature safely. I'd like to leave this to
James and Mike as I got suggestions from them.

Please also rebase onto the latest CoreSight next branch [1], which
moves the capability fields into drvdata->caps. I found an issue in the
decoding of caps.nr_event; the attached patch fixes it and makes the
field hold the actual event count.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git branch: next

---8<---

From 95307fa0574b1e0b3922ffa23fe98144b2688496 Mon Sep 17 00:00:00 2001
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 21 Oct 2026 17:05:18 +0100
Subject: [PATCH] coresight: etm4x: Fix event count decoding

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
 .../coresight/coresight-etm4x-core.c          | 13 +++++++--
 .../coresight/coresight-etm4x-sysfs.c         | 29 ++++++++++---------
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index e21be6468e954..af017bd8a5477 100644
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
@@ -1519,6 +1517,17 @@ static void etm4_init_arch_data(void *info)
 	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
 	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
 		caps->nr_resource += 1;
+
+	/*
+	 * NUMEVENT encodes the number of events minus one. From ETMv4.3,
+	 * including ETE, NUMRSPAIR == 0 means no events are implemented.
+	 * nr_resource already accounts for the pre-ETMv4.3 encoding.
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
index db9e603f97ba8..fb38f0102290a 100644
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
-- 
2.34.1


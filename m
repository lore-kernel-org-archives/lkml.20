Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6156A3EC81A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116933; cv=none; b=qscGxFM6OtECgcCLaD+K31rMhciXAPiqXwRqnJzPYVJqDbFO8YYSMzAGk4/UNFaMgChphGj+sSP3MJHvxLF+GqQ5HtbJVtrmgaAtt0UckQl1AcY+pkARXukzenwfNQFzkQ4m01PqWhQw6oDcPemISib/fj+DEVF0Mq3lPFJ/dOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116933; c=relaxed/simple;
	bh=VIPaJpghTbx/v7PJ/scUmkcYX8jgjYewClkchSwndq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+Hf86zXmpw1AEzFh14C+hfR/qeFR9ileCRLB9Lq1quj3keOvdzlP457ge4n3BEaaYPZGMZJ0fU/Sfy/Muov6Fcfc7t0jYZS86mou1tKUkMErCsj1v+TLW1s/uCMKKO//ByfHbG1Ivm6lDQf6ObFTJv1YyCuAhprfN2EoUZlMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q87itpKE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q87itpKE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEBFE16F2;
	Fri, 11 Sep 2026 01:55:21 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 629F83F7B4;
	Fri, 11 Sep 2026 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789116925; bh=VIPaJpghTbx/v7PJ/scUmkcYX8jgjYewClkchSwndq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q87itpKEB3mJNc9/8m7ojFjedYlsRicdvzWFC1DPjzg3z+4/YuZK8hokDJ6imfEMD
	 4LtukdInFLZZ1+rFHdl3laI8zg82l/soFCbBBecnLg8XWt0CfSZ/0lrJ89mYL1Rd7H
	 M8MWxzifvCy5i+athLQoj36h3+n0cbLAb5ytKMi0=
From: Mike Leach <mike.leach@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@arm.com>
Subject: [PATCH v4 1/1] coresight: fix issue where coresight component has no claimtags
Date: Fri, 11 Sep 2026 09:55:20 +0100
Message-ID: <20260911085520.2201261-2-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911085520.2201261-1-mike.leach@arm.com>
References: <20260911085520.2201261-1-mike.leach@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coresight components have 0 to 8 claim tag bits. ARM recommends 4 and
the implemented claim tag protocol uses two of these.

If a component has insufficient claim tags then the protocol incorrectly
returns an error when attempting to claim a component.

Fix by introducing a claim tag init function that will read CLAIMSET
to establish then actual number of claim tags and save a claim tag info
flag to indicate the level of support in the device.

Additionally this init routine will also clear down any stale self claim
tag bits that are present in the hardware - removing the need for the
additional interface that was added to accomplish this during device probe.

Any device which is not verified to support claim tags, will now get a
success return from the claim/disclaim calls.

Device drivers can also force skipping of claim tag support checks where
hardware does not support any readable registers at the claim tag
location.

Signed-off-by: Mike Leach <mike.leach@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c  |   6 +-
 drivers/hwtracing/coresight/coresight-core.c  | 139 ++++++++++++++++--
 .../hwtracing/coresight/coresight-cti-core.c  |   7 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   9 +-
 .../coresight/coresight-etm3x-core.c          |   8 +-
 .../coresight/coresight-etm4x-core.c          |   8 +-
 .../hwtracing/coresight/coresight-funnel.c    |   7 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   7 +
 .../coresight/coresight-replicator.c          |   9 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   7 +-
 include/linux/coresight.h                     |  23 ++-
 11 files changed, 205 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..7db53dbeff2b 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -574,10 +574,14 @@ static int __catu_probe(struct device *dev, struct resource *res)
 	catu_desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
 	catu_desc.ops = &catu_ops;
 
-	coresight_clear_self_claim_tag(&catu_desc.access);
 	drvdata->csdev = coresight_register(&catu_desc);
 	if (IS_ERR(drvdata->csdev))
 		ret = PTR_ERR(drvdata->csdev);
+
+	ret = coresight_init_claim_tags(drvdata->csdev);
+	if (ret)
+		coresight_unregister(drvdata->csdev);
+
 out:
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d574f..a21a77795e18 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -232,6 +232,34 @@ coresight_find_out_connection(struct coresight_device *csdev,
 	return ERR_PTR(-ENODEV);
 }
 
+/*
+ * Reading CLAIMSET returns a bitfield representing the number of claim tags
+ * implemented from bit 0 to bit nTag-1, valid bits set to 1.
+ *
+ * Claim protocol requires 2 bits so test for MS bit required,
+ * bit 1 -  CORESIGHT_CLAIM_SELF_HOSTED
+ *
+ * return true if sufficient claim tags implemented for protocol
+ */
+static bool coresight_claim_tags_implemented_unlocked(struct csdev_access *csa)
+{
+	u32 claim_bits_impl = FIELD_GET(CORESIGHT_CLAIM_BITS_MAX_MASK,
+			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMSET));
+	return ((claim_bits_impl & CORESIGHT_CLAIM_SELF_HOSTED) != 0);
+}
+
+/* helper for checking if claim tag protocol in use */
+static bool coresight_using_claim_tag_protocol(struct coresight_device *csdev)
+{
+	return (csdev->claim_tag_info == CS_CLAIM_TAG_STD_PROTOCOL);
+}
+
+/* helper to check initialised */
+static bool coresight_claim_tag_noinit(struct coresight_device *csdev)
+{
+	return (csdev->claim_tag_info == CS_CLAIM_TAG_UNKNOWN);
+}
+
 static u32 coresight_read_claim_tags_unlocked(struct coresight_device *csdev)
 {
 	return FIELD_GET(CORESIGHT_CLAIM_MASK,
@@ -245,23 +273,97 @@ static void coresight_set_self_claim_tag_unlocked(struct coresight_device *csdev
 	isb();
 }
 
-void coresight_clear_self_claim_tag(struct csdev_access *csa)
+static void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
+{
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
+				     CORESIGHT_CLAIMCLR);
+	isb();
+}
+
+/*
+ * Initialise claim tag protocol.
+ *
+ * Check for existence of claim tags and clear down any stale
+ * existing self claim tag.
+ *
+ * Set claim tag protocol usage flag.
+ *
+ * Automatically unlocks/relocks memory mapped devices.
+ *
+ * Call during device probe.
+ */
+int coresight_init_claim_tags(struct coresight_device *csdev)
 {
+	struct csdev_access *csa;
+
+	if (WARN_ON(!csdev))
+		return -EINVAL;
+
+	/* if previous init or forced ignore claim tag,  no checks needed */
+	if (csdev->claim_tag_info != CS_CLAIM_TAG_UNKNOWN) {
+		if (csdev->claim_tag_info == CS_CLAIM_TAG_IGNORE)
+			dev_dbg(&csdev->dev,
+				"Device set to ignore claim tag protocols\n");
+		return 0;
+	}
+
+	/* get the access method */
+	csa = &csdev->access;
+
+	/* unlock if memory access */
 	if (csa->io_mem)
 		CS_UNLOCK(csa->base);
-	coresight_clear_self_claim_tag_unlocked(csa);
+
+	/* check claim tag validity */
+	if (coresight_claim_tags_implemented_unlocked(csa)) {
+		csdev->claim_tag_info = CS_CLAIM_TAG_STD_PROTOCOL;
+		dev_dbg(&csdev->dev, "Device using standard claim tag protocol\n");
+
+		/* using claim tags so clear down any stale self claim tag */
+		coresight_clear_self_claim_tag_unlocked(csa);
+	} else {
+		csdev->claim_tag_info = CS_CLAIM_TAG_NOT_IMPL;
+		dev_dbg(&csdev->dev, "Device claim tag hardware not implemented\n");
+	}
+
+	/* relock if memory access */
 	if (csa->io_mem)
 		CS_LOCK(csa->base);
+
+	/* return success - caller can check claim_tag_info for state */
+	return 0;
 }
-EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
+EXPORT_SYMBOL_GPL(coresight_init_claim_tags);
+
+struct cs_claim_tag_init_arg {
+	struct coresight_device *csdev;
+	int rc;
+};
 
-void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
+static void coresight_init_claim_tags_smp_call(void *info)
 {
-	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
-				     CORESIGHT_CLAIMCLR);
-	isb();
+	struct cs_claim_tag_init_arg *arg = info;
+
+	arg->rc = coresight_init_claim_tags(arg->csdev);
 }
-EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
+
+/* cpu bound devices (etms) may need to run on bound cpu */
+int coresight_init_claim_tags_cpu_smp(struct coresight_device *csdev, int cpu)
+{
+	int ret = 0;
+	struct cs_claim_tag_init_arg arg = { };
+
+	arg.csdev = csdev;
+	ret = smp_call_function_single(cpu,
+				       coresight_init_claim_tags_smp_call,
+				       &arg, 1);
+
+	if (!ret)
+		ret = arg.rc;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(coresight_init_claim_tags_cpu_smp);
 
 /*
  * coresight_claim_device_unlocked : Claim the device for self-hosted usage
@@ -276,12 +378,18 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
 int coresight_claim_device_unlocked(struct coresight_device *csdev)
 {
 	int tag;
-	struct csdev_access *csa;
 
 	if (WARN_ON(!csdev))
 		return -EINVAL;
 
-	csa = &csdev->access;
+	/* check init complete */
+	if (WARN_ON(coresight_claim_tag_noinit(csdev)))
+		return -EPERM;
+
+	/* check if we are using claim tags on this device */
+	if (!coresight_using_claim_tag_protocol(csdev))
+		return 0;
+
 	tag = coresight_read_claim_tags_unlocked(csdev);
 
 	switch (tag) {
@@ -291,7 +399,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 			return 0;
 
 		/* There was a race setting the tag, clean up and fail */
-		coresight_clear_self_claim_tag_unlocked(csa);
+		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
 		return -EBUSY;
 
@@ -338,6 +446,14 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 	if (WARN_ON(!csdev))
 		return;
 
+	/* check init complete */
+	if (WARN_ON(coresight_claim_tag_noinit(csdev)))
+		return;
+
+	/* check if we are using claim tags on this device */
+	if (!coresight_using_claim_tag_protocol(csdev))
+		return;
+
 	if (coresight_read_claim_tags_unlocked(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
@@ -1543,6 +1659,7 @@ coresight_init_device(struct coresight_desc *desc)
 	csdev->ops = desc->ops;
 	csdev->access = desc->access;
 	csdev->orphan = true;
+	csdev->claim_tag_info = CS_CLAIM_TAG_UNKNOWN;
 
 	if (desc->flags & CORESIGHT_DESC_CPU_BOUND) {
 		csdev->cpu = desc->cpu;
diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index b2c9a4db13b4..436ae2d8a7b9 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -729,11 +729,16 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_desc.groups = drvdata->ctidev.con_groups;
 	cti_desc.dev = dev;
 
-	coresight_clear_self_claim_tag(&cti_desc.access);
 	drvdata->csdev = coresight_register(&cti_desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	ret = coresight_init_claim_tags(drvdata->csdev);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		return ret;
+	}
+
 	/* add to list of CTI devices */
 	mutex_lock(&ect_mutex);
 	list_add(&drvdata->node, &ect_net);
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index a827f76b8144..339d902ce88a 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -769,22 +769,25 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.dev = dev;
 	desc.groups = coresight_etb_groups;
 
-	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	ret = coresight_init_claim_tags(drvdata->csdev);
+	if (ret)
+		goto err_unregister_csdev;
+
 	drvdata->miscdev.name = desc.name;
 	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
 	drvdata->miscdev.fops = &etb_fops;
 	ret = misc_register(&drvdata->miscdev);
 	if (ret)
-		goto err_misc_register;
+		goto err_unregister_csdev;
 
 	pm_runtime_put(&adev->dev);
 	return 0;
 
-err_misc_register:
+err_unregister_csdev:
 	coresight_unregister(drvdata->csdev);
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 862ad0786699..3d24bcac14ec 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -756,7 +756,6 @@ static void etm_init_arch_data(void *info)
 	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
 	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
 
-	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
 	etm_set_pwrdwn(drvdata);
 	etm_clr_pwrup(drvdata);
 	CS_LOCK(drvdata->csa.base);
@@ -852,6 +851,13 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	/* init the claim tag protocol - ensure run on correct cpu */
+	ret = coresight_init_claim_tags_cpu_smp(drvdata->csdev, drvdata->cpu);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		return ret;
+	}
+
 	ret = etm_perf_symlink(drvdata->csdev, true);
 	if (ret) {
 		coresight_unregister(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..2b6cc19cf06f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1522,7 +1522,6 @@ static void etm4_init_arch_data(void *info)
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
 
-	coresight_clear_self_claim_tag_unlocked(csa);
 	etm4_cs_lock(drvdata, csa);
 	cpu_detect_trace_filtering(drvdata);
 }
@@ -2206,6 +2205,13 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	/* init the claim tag protocol - ensure run on correct cpu */
+	ret = coresight_init_claim_tags_cpu_smp(drvdata->csdev, drvdata->cpu);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		return ret;
+	}
+
 	ret = etm_perf_symlink(drvdata->csdev, true);
 	if (ret) {
 		coresight_unregister(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..fe0a256ba1db 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -244,7 +244,6 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = coresight_funnel_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	dev_set_drvdata(dev, drvdata);
@@ -265,6 +264,12 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	if (res) {
+		ret = coresight_init_claim_tags(drvdata->csdev);
+		if (ret)
+			coresight_unregister(drvdata->csdev);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..fada0e49ed28 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -41,6 +41,13 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_CLAIM_SELF_HOSTED	2
 #define CORESIGHT_CLAIM_INVALID		3
 
+/*
+ * Coresight specification defines a maximum of 8 claim tag bits.
+ * The precise number is implementation defined, and may be obtained by
+ * reading the CLAIMSET register.
+ */
+#define CORESIGHT_CLAIM_BITS_MAX_MASK	GENMASK(7, 0)
+
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
 
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..1c76c8b788e2 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -251,7 +251,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = replicator_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	if (fwnode_property_present(dev_fwnode(dev),
@@ -276,6 +275,14 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
+	if (res) {
+		ret = coresight_init_claim_tags(drvdata->csdev);
+		if (ret) {
+			coresight_unregister(drvdata->csdev);
+			return ret;
+		}
+	}
+
 	replicator_reset(drvdata);
 	return 0;
 }
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..94e974f00a4e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -864,13 +864,18 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 	desc.pdata = pdata;
 
-	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
 		goto out;
 	}
 
+	ret = coresight_init_claim_tags(drvdata->csdev);
+	if (ret) {
+		coresight_unregister(drvdata->csdev);
+		goto out;
+	}
+
 	drvdata->miscdev.name = desc.name;
 	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
 	drvdata->miscdev.fops = &tmc_fops;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index ddf18c970e34..e100344ab7bb 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -248,6 +248,20 @@ struct coresight_trace_id_map {
 	raw_spinlock_t lock;
 };
 
+/*
+ * Coresight claim tag info:
+ * CS_CLAIM_TAG_UNKNOWN      - not yet checked.
+ * CS_CLAIM_TAG_STD_PROTOCOL - using standard claim/release protocol.
+ * CS_CLAIM_TAG_NOT_IMPL     - no claim tags available.
+ * CS_CLAIM_TAG_IGNORE	     - force skip of claim tags protocol
+ */
+enum coresight_claim_tag_info {
+	CS_CLAIM_TAG_UNKNOWN,
+	CS_CLAIM_TAG_STD_PROTOCOL,
+	CS_CLAIM_TAG_NOT_IMPL,
+	CS_CLAIM_TAG_IGNORE,
+};
+
 /**
  * struct coresight_device - representation of a device as used by the framework
  * @pdata:	Platform data with device connections associated to this device.
@@ -269,6 +283,7 @@ struct coresight_trace_id_map {
  *		spinlock.
  * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
  * @orphan:	true if the component has connections that haven't been linked.
+ * @claim_tag_info: how the device is using claim tags.
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
  *		activated but not yet enabled.  Enabling for a _sink_ happens
@@ -297,6 +312,7 @@ struct coresight_device {
 	int refcnt;
 	int cpu;
 	bool orphan;
+	enum coresight_claim_tag_info claim_tag_info;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;
@@ -664,15 +680,14 @@ int coresight_timeout(struct csdev_access *csa, u32 offset, int position, int va
 typedef void (*coresight_timeout_cb_t) (struct csdev_access *, u32, int, int);
 int coresight_timeout_action(struct csdev_access *csa, u32 offset, int position, int value,
 			     coresight_timeout_cb_t cb);
-int coresight_claim_device(struct coresight_device *csdev);
-int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
 int coresight_claim_device(struct coresight_device *csdev);
 int coresight_claim_device_unlocked(struct coresight_device *csdev);
-void coresight_clear_self_claim_tag(struct csdev_access *csa);
-void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
 void coresight_disclaim_device(struct coresight_device *csdev);
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
+int coresight_init_claim_tags(struct coresight_device *csdev);
+int coresight_init_claim_tags_cpu_smp(struct coresight_device *csdev, int cpu);
+
 char *coresight_alloc_device_name(const char *prefix, struct device *dev);
 
 bool coresight_loses_context_with_cpu(struct device *dev);
-- 
2.43.0


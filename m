Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79143F081
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546327; cv=none; b=ET+sYC+LMeUGXnPPgB5beXqpKfMzz/y9SXEMVOAkiZC3DbBiBW8H1xvORJJBhKZ+4yA1+m1/hXQOjaF4G1S2wMU7grIhlEldKpVnDmLGLs/OLMCgkxxvcPVcKVKTlmta6faoLfVICPR7Dff6eSYGcJB6wa7EJdPEPAwMluBohKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546327; c=relaxed/simple;
	bh=b30k1DAFQqj6/9YKNYP0WdM0jdd2fXCEtILHyGoOPYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XMJoCpQqff6YYfLDQeNq7LxaqLM1FGaT3uUHlFoJmtBEdnv/WcALbTjLpPx33dAtyTGA7cmEYQV3ICkzPiLkSkDu+clH8Gf5nWTqG246T31RHM1yv/RLVS++WvlvRZztlCdruZs9ds8WFZtri3gScY0N7aRJ0hgy4sTOhrwd7+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=te4gs5bg; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="te4gs5bg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789546315; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=f0L59z9QBVvepeihCaeFjam36j6qvdpbCrGpd5LB3wk=;
	b=te4gs5bgNBT+LdiBWZ7sgxk8XKo1vCZoG0YOlSqiS3s7Jc3R7oOzySh8PNKSQBEE4kQd/9YvJbioSZPQHV+DMuDG6QYLphCwf6yowthc/QFuQVLZ2vdzdpubCL6owctLF8glo1lep0DpW1mn6/2cq4b+WgC4HREEdzPXCImcWho=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R961e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XB4QlaG_1789546295;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0XB4QlaG_1789546295 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Sep 2026 16:11:54 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: baolu.lu@linux.intel.com
Cc: bikuan.zbk@alibaba-inc.com,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH v4] iommu/vt-d: Fix IQE handling to cover all descriptors in submission range
Date: Wed, 16 Sep 2026 16:11:35 +0800
Message-ID: <20260916081135.2038574-1-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <e56a23f2-216c-41ea-991d-495962e6b7af@linux.intel.com>
References: <e56a23f2-216c-41ea-991d-495962e6b7af@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When an Invalidation Queue Error (IQE) occurs, hardware halts fetching
and IQH points at the faulting descriptor. The previous code only
checked whether IQH matched the first descriptor index of the current
submission, missing faults on any other descriptor within the batch.

Expand the check to cover the entire submission range [index, wait_index],
accounting for circular wrap-around.

Furthermore, after detecting IQE, the old recovery only replaced the
single faulting slot with a copy of the wait descriptor and immediately
returned -EINVAL. This left two problems:

  a) Hardware resumed fetching and could hit another invalid descriptor
     in the same abandoned batch, raising a second IQE that no submitter
     would claim — permanently deadlocking the queue.

  b) The caller reclaimed all batch slots (QI_FREE) while hardware might
     still be asynchronously processing descriptors from that batch,
     allowing concurrent overwrite and descriptor corruption.

Fix both by introducing qi_drain_remaining_descs(): upon IQE detection,
overwrite the stranded slots in [IQH, wait_index) with fenced no-op wait
descriptors, resubmit the wait descriptor at wait_index, clear IQE, and
spin until hardware signals QI_DONE (with DMAR_OPERATION_TIMEOUT). This
guarantees hardware has fully drained the batch before the caller
reclaims slots.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/intel/dmar.c | 73 ++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index ba675b08cd20..1aa1bdd796cf 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1344,6 +1344,49 @@ static void qi_dump_fault(struct intel_iommu *iommu, u32 fault)
 	       (unsigned long long)desc->qw1);
 }
 
+static int qi_drain_remaining_descs(struct intel_iommu *iommu, int head,
+				    int wait_index)
+{
+	struct q_inval *qi = iommu->qi;
+	int shift = qi_shift(iommu);
+	struct qi_desc wait_desc = {};
+	struct qi_desc nop_desc = {};
+	cycles_t start;
+
+	nop_desc.qw0 = QI_IWD_FENCE | QI_IWD_TYPE;
+
+	wait_desc.qw0 = QI_IWD_STATUS_DATA(QI_DONE) | QI_IWD_PRQ_DRAIN |
+			QI_IWD_STATUS_WRITE | QI_IWD_FENCE | QI_IWD_TYPE;
+	wait_desc.qw1 = virt_to_phys(&qi->desc_status[wait_index]);
+
+	while (head != wait_index) {
+		memcpy(qi->desc + (head << shift), &nop_desc, 1 << shift);
+		head = (head + 1) % QI_LENGTH;
+	}
+
+	WRITE_ONCE(qi->desc_status[wait_index], QI_IN_USE);
+	memcpy(qi->desc + (wait_index << shift), &wait_desc, 1 << shift);
+
+	/*
+	 * Order the descriptor rewrites before the writel() that restarts
+	 * the fetch engine.
+	 */
+	wmb();
+
+	writel(DMA_FSTS_IQE, iommu->reg + DMAR_FSTS_REG);
+
+	start = get_cycles();
+	while (READ_ONCE(qi->desc_status[wait_index]) != QI_DONE) {
+		if (DMAR_OPERATION_TIMEOUT < (get_cycles() - start)) {
+			pr_err("Timeout draining invalidation queue after IQE\n");
+			return -ETIMEDOUT;
+		}
+		cpu_relax();
+	}
+
+	return 0;
+}
+
 static int qi_check_fault(struct intel_iommu *iommu, int index, int wait_index)
 {
 	u32 fault;
@@ -1366,18 +1409,26 @@ static int qi_check_fault(struct intel_iommu *iommu, int index, int wait_index)
 	 * is cleared.
 	 */
 	if (fault & DMA_FSTS_IQE) {
+		int head_idx, ret;
+
 		head = readl(iommu->reg + DMAR_IQH_REG);
-		if ((head >> shift) == index) {
-			struct qi_desc *desc = qi->desc + head;
-
-			/*
-			 * desc->qw2 and desc->qw3 are either reserved or
-			 * used by software as private data. We won't print
-			 * out these two qw's for security consideration.
-			 */
-			memcpy(desc, qi->desc + (wait_index << shift),
-			       1 << shift);
-			writel(DMA_FSTS_IQE, iommu->reg + DMAR_FSTS_REG);
+		head_idx = (head >> shift) % QI_LENGTH;
+
+		/*
+		 * The faulting descriptor can be anywhere within the current
+		 * submission's range [index, wait_index]. Since the queue is
+		 * circular, this submission may wrap around QI_LENGTH
+		 * (index > wait_index in that case), so check both the
+		 * non-wrapped and wrapped cases of the range.
+		 */
+		if (index <= wait_index ?
+		    (head_idx >= index && head_idx <= wait_index) :
+		    (head_idx >= index || head_idx <= wait_index)) {
+			ret = qi_drain_remaining_descs(iommu, head_idx,
+						      wait_index);
+			if (ret)
+				return ret;
+
 			pr_info("Invalidation Queue Error (IQE) cleared\n");
 			return -EINVAL;
 		}
-- 
2.43.7


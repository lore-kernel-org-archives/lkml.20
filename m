Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2AA552958
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082812; cv=none; b=Ew/Frvcatu1kpGeEmnPxdCuPyehVafQX2PA3UtEppOMEGcY6vg5tFU7/xf/iThXoHGBsJdym5r9SqIa1nw9VXirPNulr7BBBl+uuJ8UdhwqQBi0AdHO6TsbaJR2j3cGrlfzWKCKBdIktl2EQP9eKMm0YFCdvrASAL7nEh7p6ft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082812; c=relaxed/simple;
	bh=HCmVazmRy5W0CFgeQvUYM2FGPxm2BiIy/ZPSTmdmcFg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vCaDPFIU+i3pMjlPlXP39LmeQ2iRd4M4wD1rAIrGt2wQaM5ixx+74MiXPyGwMSLGcTEL/3zG4/rEcR3UuvhJk3K4NhApgk1hPAohu+u+N5JsTx+PceDB02i71g+1vaBhZLxIgq4iBnntNCXu9uUITtsw/8kiCDjlWSkXXB14Vng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vF7yzPwV; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vF7yzPwV"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so27434725e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082806; x=1790687606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRBroGKsK/EO8xs+s+H8im0EjosulEEiERGNVqEejnQ=;
        b=vF7yzPwVVk1jWGE7AZl+AmImSQWidi5EOt+HgDG4OLGBHgMsMG1Mv+vTMAZz8r1MjE
         n6vyvJkZJmI9uGPQGRdtLYhrnO5jcECkPE3u9EoWUXGJSU/7wjQ4oQHbYO/CwXqU8n3h
         odNbmma1A9wHdVlyJOiQi1I2mBvaPdiiWB1ao8fZttoNEh3knRPdNmOCX83v2MnG7vGd
         AY09aeN/7gxN4wPlAWlUjXt121cKV8x6x0pKWsT1noEFPJSRr6nDDrdeVXrA2OFx9LsV
         jYBUt9E6f7KHN14MEzB5OI2YMxlgLpJB9AlQusbMqun5fj3JE0f//+SYaJOuBRRYa2YB
         CFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082806; x=1790687606;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRBroGKsK/EO8xs+s+H8im0EjosulEEiERGNVqEejnQ=;
        b=kmYOba4wizkyDofFjhr41BjTIM/clsMmIcin2QIUPPbIbDOmjEgYRNbdZFgbFXr8a2
         0Sb3JyUam/gwO+7QrJU/R335ckEg7IyUAijSH5EOI+yWoNEcz4JQK3j+UhQfw4qm86Pb
         XDZofNLk2ViXM2bnk8N4wM1eHT25mu4NU3QZQDv7DpUVww/jYEq2UOom55AaoMeDwmNk
         J45Fg28wakCj7MfZWMY4fbbFgTodahY0xFF5e0GMUNbyuCgBhzwS+QSb1qRORAkatv7C
         oD+GH/clOF0MqwFIFoSfIH4IZGfn2u8WvMCP2juAy9ZkWgnLSNac14LtCsTgjgMXRkbQ
         hZpg==
X-Forwarded-Encrypted: i=1; AKwUvBzWz4s5/g//2j9oo24aT8Qq8hqMlJDZTVIGteG6NNhx56ka1A+Soea0muvLcBTaJieM0REGItNHbnqI8ZM=@vger.kernel.org
X-Gm-Message-State: AFuF++n6Gifyg9DefkqVsWT9QeGB745sV0g482aoiqN4jdDfPj3v/po4
	sAaE0AuIqgos8QJ1k5H48eXJIdUWlmGX8PodTDc5MW+0Rh1+Pv8f+YkjLPek3qL8WIzuFlQ1fdx
	u66p0YLHuEyrsxw==
X-Received: from wmga20.prod.google.com ([2002:a05:600c:2d54:b0:49e:6308:e0bf])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548a:b0:49f:ce73:7ab with SMTP id 5b1f17b1804b1-49fce730859mr138765725e9.34.1790082805696;
 Tue, 22 Sep 2026 06:13:25 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:52 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-20-smostafa@google.com>
Subject: [PATCH v8 19/25] iommu/arm-smmu-v3-kvm: Share other queues
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Other queues as PRIQ and EVTQ do not need to be shadowed. However, we
need to make sure they are in a state that disallow them to be donated
to the hypervisor or guests. So, keep track of those and share them when
they get enabled.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    |  8 ++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 81 +++++++++++++++++--
 2 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
index d4700d3a3c10..ffc57182e57e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -32,6 +32,10 @@
  * @host_ste_cfg	Host stream table config
  * @host_ste_base	Host stream table base
  * @strtab_cfg		Stream table as seen by HW
+ * @evtq_base		Host evtq base reg
+ * @priq_base		Host priq base reg
+ * @evtq_shared		Whether the EVTQ was shared
+ * @priq_shared		Whether the PRIQ was shared
  */
 struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
@@ -58,6 +62,10 @@ struct hyp_arm_smmu_v3_device {
 	u64			host_ste_cfg;
 	u64			host_ste_base;
 	struct arm_smmu_strtab_cfg strtab_cfg;
+	u64			evtq_base;
+	u64			priq_base;
+	bool			evtq_shared;
+	bool			priq_shared;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index cb9aa7e4a394..00528380774f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -80,6 +80,16 @@ static bool is_smmu_enabled(struct hyp_arm_smmu_v3_device *smmu)
 	return FIELD_GET(CR0_SMMUEN, smmu->cr0);
 }
 
+static bool is_evtq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_EVTQEN, smmu->cr0);
+}
+
+static bool is_priq_enabled(struct hyp_arm_smmu_v3_device *smmu)
+{
+	return FIELD_GET(CR0_PRIQEN, smmu->cr0);
+}
+
 /*
  * CMDQ, STE host copies are accessed by the hypervisor, we share them to
  * - Prevent the host from passing protected VM memory.
@@ -660,6 +670,20 @@ static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
 				   cmdq_size(&smmu->cmdq_host)));
 }
 
+static void smmu_emulate_queue(struct hyp_arm_smmu_v3_device *smmu,
+			       unsigned long q_base, size_t ent_size_shift)
+{
+	/* Q_BASE_ADDR_MASK is not enough as the SMMU also ignores bits > OAS */
+	phys_addr_t base = q_base & Q_BASE_ADDR_MASK & ((1ULL << smmu->oas) - 1);
+	size_t size = 1UL << (FIELD_GET(Q_BASE_LOG2SIZE, q_base) + ent_size_shift);
+
+	/* The host must program the base first and it must be aligned to size. */
+	if (WARN_ON(!q_base || (base & (size - 1))))
+		return;
+
+	WARN_ON(smmu_share_pages(base, size));
+}
+
 static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 			     struct user_pt_regs *regs,
 			     u64 esr, u32 off)
@@ -764,12 +788,34 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 		if (is_write) {
 			bool last_cmdq_en = is_cmdq_enabled(smmu);
 			bool last_smmu_en = is_smmu_enabled(smmu);
+			bool last_evtq_en = is_evtq_enabled(smmu);
+			bool last_priq_en = is_priq_enabled(smmu);
 
 			smmu->cr0 = val;
 			if (!last_cmdq_en && is_cmdq_enabled(smmu))
 				smmu_emulate_cmdq_enable(smmu);
 			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
 				smmu_emulate_cmdq_disable(smmu);
+
+			/*
+			 * Share PRI and EVTQ to avoid the host using them to write to
+			 * protected memory. However, do not unshare the queues at disable
+			 * as that is more complicated, unsharing from here can lead to
+			 * use-after-unshare issues, and requires ordering with cr0ack.
+			 * The host can disable those queues during shutdown, but it never
+			 * changes the base address (even with RPM), so leave the queue
+			 * shared and assert that multiple host writes do not change it.
+			 */
+			if (!last_evtq_en && is_evtq_enabled(smmu) && !smmu->evtq_shared) {
+				smmu_emulate_queue(smmu, smmu->evtq_base, EVTQ_ENT_SZ_SHIFT);
+				smmu->evtq_shared = true;
+			}
+
+			if (!last_priq_en && is_priq_enabled(smmu) && !smmu->priq_shared) {
+				smmu_emulate_queue(smmu, smmu->priq_base, PRIQ_ENT_SZ_SHIFT);
+				smmu->priq_shared = true;
+			}
+
 			if (!last_smmu_en && is_smmu_enabled(smmu))
 				smmu_emulate_enable(smmu);
 			else if (last_smmu_en && !is_smmu_enabled(smmu))
@@ -792,6 +838,34 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 
 		mask = read_write;
 		break;
+	case ARM_SMMU_EVTQ_BASE:
+		if (len != sizeof(u64))
+			break;
+
+		if (is_write) {
+			/* See ARM_SMMU_CR0 */
+			if (is_evtq_enabled(smmu) ||
+			    (smmu->evtq_shared && (smmu->evtq_base != val)))
+				break;
+			smmu->evtq_base = val;
+		}
+		mask = read_write;
+		break;
+
+	case ARM_SMMU_PRIQ_BASE:
+		if (len != sizeof(u64))
+			break;
+
+		if (is_write) {
+			/* See ARM_SMMU_CR0 */
+			if (is_priq_enabled(smmu) ||
+			    (smmu->priq_shared && (smmu->priq_base != val)))
+				break;
+			smmu->priq_base = val;
+		}
+		mask = read_write;
+		break;
+
 	/* Allowed 32 bit registers. */
 	case ARM_SMMU_EVTQ_IRQ_CFG1:
 	case ARM_SMMU_EVTQ_IRQ_CFG2:
@@ -821,15 +895,12 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
 	case ARM_SMMU_EVTQ_IRQ_CFG0:
 	case ARM_SMMU_PRIQ_IRQ_CFG0:
 	case ARM_SMMU_GERROR_IRQ_CFG0:
+		if (len != sizeof(u64))
+			break;
 		/* These are RES0 as MSI support is hidden. */
 		val = 0;
 		if (!is_write)
 			goto out_update_regs;
-		fallthrough;
-	case ARM_SMMU_EVTQ_BASE:
-	case ARM_SMMU_PRIQ_BASE:
-		if (len != sizeof(u64))
-			break;
 		mask = read_write;
 		break;
 	/* Allowed RO 32 bit registers. */
-- 
2.55.0.1082.g2b9226bbc0-goog


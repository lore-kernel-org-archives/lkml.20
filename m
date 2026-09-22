Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE96A54A7EF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082795; cv=none; b=EatcssNc/p2xP/yZq9LiSBEl5gMeiG4bI/wIbeYrJG7JXivAQvRH8yngr/m0VBJbjsLI+wK0OrXzNWlebTyN56hYUCajr8Kj6Ym8eMk0Kncr5UtQeZXhDRcu/L3X70oxLSiHy0InMMzGyS4qwIPXARWLSqT4GkEVctl+ouhaqbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082795; c=relaxed/simple;
	bh=dUxE5mNIeukUldblked8004/Yygfcq19gYw2I3T7rmc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VQlpveFHxpRaxAhMQFfHxsJ7zo0i2tI9OyFlDKv/JXITGvphb+eVEswWwGmGm5kwmgDGGf+4CDbZBfX8zp4dOXwb4Bh6Gcp1RtPvK2F3CPersXji5vbWoioM1SWH0gFy1ugwKiXhDUa5q9RRBOnqoN3s3nEkMnwVIFiXKX1bc6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P0efeLza; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0efeLza"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a9cdcbe249so4147838a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082790; x=1790687590; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEPQieGs38qja288Nq+x3XKvBGSW7T//30W/ZzzD6PA=;
        b=P0efeLzaUWkqicFOuDDyo2AdYbfboghuptbeZXJ7OrwEPxcM9+r87iliMtlOMZbvIl
         LjwR/4iH/GPrlBT1YLsUE61q/AObRCsyijbekgcEV8NZPySAIFRl2KYSIdi6O7nW2Ow1
         UhTCNfzipR0NTq7DMRfMgwj7JihF7ZVCvYfxZ9ejd1pEfgVSKedt9WIsx/0CtX/oFiBE
         0kS4jT44wQ3Kzl3gRKUv2TkEbgBtObL9incB8O3+Iui4za+KHUvzbM1aKlwgWC/lrEWO
         6tSr4Ahl1ViC1kPBIAIWHUG72ggAPKLOuia+Ubf6nkuVUd2z2SRtFY4WkAu1yN1XUXED
         rrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082790; x=1790687590;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEPQieGs38qja288Nq+x3XKvBGSW7T//30W/ZzzD6PA=;
        b=jXIKGnLLgvk8a6pGSm84iLPa+FlhKcw2/3O9r1CTXwryPe2L6JvBu0nbP2EwA62B8t
         FgYJ3poPh+8clBTzham610gAQoqKliCPF6O4xC/ZdC0yOChKMmAwV/VYVEIbesDpHhqy
         GDnzYt/7gABBCzsgqLJwN0/8ptcHTzVyYhQRvD0KdPlgMLIpzWGHxpU6DRyG84WK87Td
         chwSk2+25JsaQGqdRdK2YTjelMfTWEvekrOKg/hooFKYCkbh9qBYWkkO1zgcQUfKfkUO
         SfIEuo1wl2SPAqyFrd9ra3xmw3QJCmYtF/A99/bPGIZanrx+KFHFCghXTCh2VhJFUgg/
         1FMg==
X-Forwarded-Encrypted: i=1; AKwUvByJ3EhNkilKIm1BRn3chIZRiaeuW3uf1DqaFz6feNcdeT3RJYcg0JfGF1y/cSPRT8XbyKJNYiS9AcQwWZE=@vger.kernel.org
X-Gm-Message-State: AFuF++n3BfX3fiHEk2S1yJy5K3L4yTSqBTS2FDqpWKost803DmHP/42g
	K2EX0emxGF9nyq2hbKbmwFqQpt7gPfT3/PH7qG4azvr+v/4fAZUDzfyjNKGDcmtIrGFleWD9GOD
	hqGxPVybYjN9Fng==
X-Received: from edxs13.prod.google.com ([2002:a05:6402:164d:b0:6a9:cb33:8782])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:23d0:b0:6a8:59aa:214c with SMTP id 4fb4d7f45d1cf-6aa55eee346mr10169438a12.11.1790082789756;
 Tue, 22 Sep 2026 06:13:09 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:39 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-7-smostafa@google.com>
Subject: [PATCH v8 06/25] KVM: arm64: iommu: Introduce IOMMU driver infrastructure
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"

To establish DMA isolation, KVM needs an IOMMU driver which provides
ops implemented at EL2.

Only one driver can be used and is registered with
pkvm_iommu_register_driver() by passing pointer to the ops.

This must be called before module_init() which is the point KVM
initializes.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_host.h       |  5 +++++
 arch/arm64/kvm/Makefile                 |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/iommu.h | 11 +++++++++++
 arch/arm64/kvm/hyp/nvhe/Makefile        |  3 ++-
 arch/arm64/kvm/hyp/nvhe/iommu.c         | 19 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c         | 10 ++++++++++
 arch/arm64/kvm/iommu.c                  | 25 +++++++++++++++++++++++++
 7 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/iommu.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/iommu.c
 create mode 100644 arch/arm64/kvm/iommu.c

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7..7ba7d384889e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1717,4 +1717,9 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 
 long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
 
+#ifndef __KVM_NVHE_HYPERVISOR__
+struct pkvm_iommu_ops;
+int pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops);
+#endif
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 59612d2f277c..0ddef54f7434 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,7 +24,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
-	 vgic/vgic-v5.o
+	 vgic/vgic-v5.o iommu.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
new file mode 100644
index 000000000000..83abe1a443c6
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ARM64_KVM_NVHE_IOMMU_H__
+#define __ARM64_KVM_NVHE_IOMMU_H__
+
+struct pkvm_iommu_ops {
+	int (*init)(void);
+};
+
+int pkvm_iommu_init(void);
+
+#endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index f57450ebcb49..7cb79db9bc47 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -24,7 +24,8 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o early_alloc.o page_alloc.o \
-	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o
+	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
+	 iommu.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../hyp-entry.o ../exception.o ../pgtable.o ../vgic-v5-sr.o
 hyp-obj-y += ../../../kernel/smccc-call.o
diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
new file mode 100644
index 000000000000..ef456eff42d2
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IOMMU operations for pKVM
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <nvhe/iommu.h>
+
+/* Only one set of ops supported */
+struct pkvm_iommu_ops *pkvm_iommu_ops;
+
+int pkvm_iommu_init(void)
+{
+	/* Keep DMA isolation optional. */
+	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init)
+		return 0;
+
+	return pkvm_iommu_ops->init();
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 75b00c323310..9607d1b18a88 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -13,6 +13,7 @@
 #include <nvhe/early_alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/gfp.h>
+#include <nvhe/iommu.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -328,6 +329,15 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	/*
+	 * IOMMU init is done at the end, as it sets up and initializes many
+	 * resources that would be leaked if the hypervisor fails after as there
+	 * is no remove_iommu_driver() at the moment.
+	 */
+	ret = pkvm_iommu_init();
+	if (ret)
+		goto out;
+
 	pkvm_hyp_vm_table_init(vm_table_base);
 
 	pkvm_ownership_selftest(selftest_base);
diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
new file mode 100644
index 000000000000..30a3862e93d7
--- /dev/null
+++ b/arch/arm64/kvm/iommu.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Mostafa Saleh <smostafa@google.com>
+ */
+
+#include <linux/kvm_host.h>
+
+extern struct pkvm_iommu_ops *kvm_nvhe_sym(pkvm_iommu_ops);
+
+static DEFINE_MUTEX(pkvm_iommu_reg_lock);
+
+int pkvm_iommu_register_driver(struct pkvm_iommu_ops *hyp_ops)
+{
+	guard(mutex)(&pkvm_iommu_reg_lock);
+
+	if (!is_protected_kvm_enabled() || is_kvm_arm_initialised())
+		return -EPERM;
+
+	if (kvm_nvhe_sym(pkvm_iommu_ops))
+		return -EBUSY;
+
+	kvm_nvhe_sym(pkvm_iommu_ops) = hyp_ops;
+	return 0;
+}
-- 
2.55.0.1082.g2b9226bbc0-goog


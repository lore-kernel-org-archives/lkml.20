Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675FE386C25
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385424; cv=none; b=sDbIBZWzbm0lZYAZMW2NigUKUZu+KbsZbPqq7jBaqb3X4ncLL/HSbO6S2ehaRPG/fSsEa32QdWkgx5uWyxKohSghPOTR7yMu+Iuhgunt+wBs98Euvr47vBYP/H/NkgS/LfQImUV/0Ww2A0cueovD9Kks7FsArC5C000O45bRKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385424; c=relaxed/simple;
	bh=GO6JuNJPllj7FT4RPOobLmNGCPg7MHRgwgvWNU86CaU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wkx/L98CvGXBerA/sfHFmuP8xmYBjTj8r0rk1vI538YAmyloALdVqevmavQOCd31Oce2rHPVNwpqeoFuxMN1KzTezmPUzO5de2F0nggiYdhKCcPnmLdmCjP+Tb7buLyzRI4ddADKCztCueqbMrP+uOy2LN7pwCNFphx+m91qRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m7E1TtGL; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m7E1TtGL"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c4f6f6691so3550566f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385413; x=1791990213; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgSnC18Dz3quxUXIwZxhZ5WsitMjATqUzKSpKj/iUwM=;
        b=m7E1TtGLS64Iyura5QqdVX4vZiij6pYM0wFI55Kkg5PIJO0Zkf5o1IhfXOSOMRFktT
         /gfaRWuC9UHREV/xn0dsSNlUs5j8mDsU2XIX4bJzFGUsTqjuoZRhk3zXK5EAnY0Eaaql
         sI8mbJB4g0Mapj0riH0KYtkSCAq4QrMSeTo/2w/G5AiKMbqQ5GxZ4OhXWD+QRUG/5TB6
         qyd083iCbMWrZbhF6MbiyKd5hPUVjpBlYDcfNeNzlnHubPu8IHuhYL/WjYHL9DDl9oWM
         JTvYJDdUneuqTadhYezIve6qv7UzzTGFiMSR9rCJbkE3V88OikghB31QgsOAC65TcZVa
         FXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385413; x=1791990213;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgSnC18Dz3quxUXIwZxhZ5WsitMjATqUzKSpKj/iUwM=;
        b=TSageY/wm61J8bIFlcsSb6q/Ih3lFCQgxrkmSIJs7XCRkyxSxmrtaJ6LCDU7YLzkIp
         hvQlUM0mAVfSLxbPPgVhADzDY4VSxUJbuk0RMUgNnKbmpjv4bSf5t+TONwkhj6d5subo
         cfDMV1Fvcz6W1VC8VgggLL9liEtKm9PlUVRydKM3/O0UgLaw83HG3b6tvJdURWH+RBGx
         FUmjMZ4CmHiuj0yLHMld/tZ9CQC3cCBOScMxHXB1PYvPTMKa/A3mvTF4tqrXPAgY7zrB
         Z0Jp2cKC8unmsRfJbwHPiDHvXPVz8Mo1CqiBA1AuQXvu3Q7rTVsZSF6uj2vAwxDrvNNb
         2vrw==
X-Forwarded-Encrypted: i=1; AKwUvBzb1IxRpeTQW9HzWUxkhTqKn8tKcB6cWjOnpFMy++qPlSyORGeUqP9910xr2Zn0QvG8Y9p/qyFxLfbvms4=@vger.kernel.org
X-Gm-Message-State: AFuF++mdj49Bg1ZrzZNvZ6NWov6XGpe8BJn2AID7whvUK7TXkC3SAOMT
	x+VJdia/CFLkhXt7UDwAp5cWcul3xtFATzWOKr9XwXDGb5f7sJ7DaSZk7lGu7iUemc0+OEt0v4s
	13OFrYBDqG4Ae7VG5WF7hHA==
X-Received: from wmbil21.prod.google.com ([2002:a05:600c:a595:b0:4a1:82c4:6b15])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c6:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a180455e85mr45957945e9.28.1791385412933;
 Wed, 07 Oct 2026 08:03:32 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:54 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-5-vdonnefort@google.com>
Subject: [PATCH 4/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MMIO_GUARD
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

In preparation for allowing protected VMs to run on a system where the
granule is bigger than their PAGE_SIZE, allow MMIO_GUARD requests to
overshoot.

Validate the memory regions are aligned with the hypervisor granule
before enabling the MMIO_GUARD support. If aligned, then the MMIO
regions are and overshooting is safe as MMIO_GUARD is solely here to
indicate to the hypervisor where the MMIO regions are.

It is possible to add new memory regions with memory hotplug later.
However the alignment requirement is way more conservative than the
maximum granule size of 64K. Nonetheless, add a test to document the
limitation.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 51 ++++++++++++++++---
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 98b1026cf68b..3852be6bd16b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -12,6 +12,8 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
+#include <linux/memblock.h>
+#include <linux/memory.h>
 #include <linux/mm.h>
 #include <linux/pgtable.h>
 
@@ -70,17 +72,50 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	if (protval != PROT_DEVICE_nGnRE && protval != PROT_DEVICE_nGnRnE)
 		return 0;
 
-	end = PAGE_ALIGN(phys + size);
-	phys = PAGE_ALIGN_DOWN(phys);
+	/*
+	 * It is fine to overshoot MMIO_GUARD requests. Its sole purpose is to
+	 * indicate to the hypervisor where the MMIO regions are and we have
+	 * validated the alignment of the memory regions beforehand.
+	 */
+	end = ALIGN(phys + size, max(pkvm_granule, PAGE_SIZE));
+	phys = ALIGN_DOWN(phys, max(pkvm_granule, PAGE_SIZE));
 
-	while (phys < end) {
-		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
+	WARN_ON_ONCE(arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID,
+					phys, end - phys));
+	return 0;
+}
 
-		WARN_ON_ONCE(arm_smccc_do_range(func_id, phys, PAGE_SIZE));
-		phys += PAGE_SIZE;
+/*
+ * Return true if the MMIO_GUARD service is available and if overshooting is
+ * safe, which it is if the memory regions are aligned with pkvm_granule.
+ */
+static bool __init mmio_guard_available(void)
+{
+	struct memblock_region *region;
+	phys_addr_t prev_end = 0;
+
+	if (!kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+		return false;
+
+	if (pkvm_granule <= PAGE_SIZE)
+		return true;
+
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG) &&
+	    pkvm_granule > memory_block_size_bytes())
+		return false;
+
+	for_each_mem_region(region) {
+		if (prev_end == region->base)
+			goto contiguous;
+
+		if (!IS_ALIGNED(prev_end | region->base, pkvm_granule))
+			return false;
+
+contiguous:
+		prev_end = region->base + region->size;
 	}
 
-	return 0;
+	return IS_ALIGNED(prev_end, pkvm_granule);
 }
 
 void __init pkvm_init_hyp_services(void)
@@ -108,7 +143,7 @@ void __init pkvm_init_hyp_services(void)
 		pr_info("pKVM: sharing memory in %zu-byte granules\n", pkvm_granule);
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 
-	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+	if (mmio_guard_available())
 		arm64_ioremap_prot_hook_register(&mmio_guard_ioremap_hook);
 
 	static_branch_enable(&pkvm_guest);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


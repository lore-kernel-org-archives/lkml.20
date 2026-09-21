Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA845484238
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989281; cv=none; b=p6c+MtOQ/qfvxRK+28wiK+gi4qKTGpcbt1nu93x6patttifEUQsPGpSVPc8/3SZxR22mm1tZNCKxTkLWf+L+/IsK52pHqg+hPxDDtWTZfFrPU1q5+YNj1IR8JjprLvi24jUbX3t81eezcIGd3hImLx4H+iEVLhaBr0z2fMWbo48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989281; c=relaxed/simple;
	bh=I/vrSTMKABeo2I5WHFzvnttJqh0/4r7sFNJ5F/4nOHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTz5D4YX9qKTpbKXHeRAkH28ulAH5gmIezhusc+SDdvINo6xfGEoe3W2zdAS0PAi2zLoHAaVSiwGufR8kVQeiWcHPnhg94K1lqxG3clJgwZT8y0j+OPGiJwjj/ZkIr+9LaYoaxFTFPKAkWPLo0jo+10STMCG9UQF/WbZIlujJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltJ+4EU9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltJ+4EU9"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so1902481a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989277; x=1790594077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xMVi+cD5sodYKE++E9vQWOcZxlG7jO/nwtdaiSfROQ=;
        b=ltJ+4EU9zK+DVRa1CFbt692UfimWgcwW0z2YRIWDpG2UDx0ROLHTnOcRKTSzuKXPOM
         6wwhIt0MAGs9I9h0neyRVhZFHVJmjP/j8pYElPO9x/8RqcCUiOfbyDCa459EAgY62Tj9
         ekqoYGxf4CKnzOTFQrAXUYnPlk9ruI9OtehnLiMFwCQjD9aXhQFpTKLIp+zltAogRm1z
         OqAoeJhu4kl+ciwTTTr0AZNxm2NVDWs7rqzUOR8Pso5lt+qIKT/XviqbsA0s4yZMEMkr
         6kSfEjZS3ujMmDUivRGzD7JmO9u2AyEtp+158b/HkgVuwkV2W1Y5IFaX78TBPDbwQOrI
         w9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989277; x=1790594077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xMVi+cD5sodYKE++E9vQWOcZxlG7jO/nwtdaiSfROQ=;
        b=FFzMxzJFFVxOZoOBtH1+exth/blVAeJmbGPO3EMfW1Dd7Dt6124Spoc9TN00KpILuE
         EJLKFlyCAMi8/TnBC4eFavaaytY/s8ZtHJWMxOoW5r9MULixNN6O9W8TIaV93AbAghyH
         hva+6SY3aQHQ51btFPHrlVnE+P68HqTIHjv1JkIQmioZHP3G6BinETv3vtHq7lEYQZkr
         h6C3PJ3CwfzmEwtuLSluT3dbw0uwtysAMNVeJSDCsCIzVDeb7mzSnDINaYULZzDRIc1o
         /LcKbhJX9Zpc/XD9eQfwmowyidRKZXKWHz/Dh0n2bNkgPVPHF1900ETvBce22K1y/Ftj
         rBAA==
X-Forwarded-Encrypted: i=1; AKwUvBwZjutZJ+8723nEzBe9wOPNE0w0kCkk6mL9zind8uv3D2BB4J7oU0I1D9NBhxXUGCLNL3ViTcpJZBbHOhI=@vger.kernel.org
X-Gm-Message-State: AFuF++m0YZ3wneVRtjTLMJ46vwvNeYT27luhYUbjy2W5Owzwq58gjSU4
	NKmzSAxQaFgeLAbjzjAVZGxfT2Vlv3AkAqZoPcemTnlszu6ArcQmo67w
X-Gm-Gg: AYBFou2LOjZ907ulmyjk0w58wUTNL+SA2/LHeliiRP8BhFYhZ287Uj0+fQLQJ0hQdKi
	Ud08nsTiQlDWNV4WYXMMNjv+j/n/b/NtskE+O9Dczt3WvrVOh+cy7j1PTVV388vwZkBxgqm3Uu6
	aHbjcDRewbWm9yYSa4CFxWKCf8YLHN3sJzbzsKu/gSjIe5KPgIWC7qXoPFZrOaBk1WwweBziEjm
	q79Fv5Qbchh9rdY69yhNM00INAD89Jr7wWbtXYwllZGAVMTHMU7FgSnoOJ8Md6BB1IVra0sYi0m
	b4k5LfK2GsAQi66ciVlsI7Kqc4QW3y1bzkiT7C0qveYH6W5xwVIVXdIFMJfOxEzy+QmaNIyUzad
	WSc+lwA/XLF0b20vu09AIz5eP3sUKJNROfiKDR6Ct4uWcEpLxi/gnwjEKi47fyKH0VL/2H4+LvX
	tamhb8Oa1k9b2Cd0wnmk+6n0ipYQ+ruPjuzFZaJx8QyennZOyD840kxxzPsziLNUIK9Njn095VF
	HdQagNaffBQtSgYq4Lc8w==
X-Received: by 2002:a17:90b:17cc:b0:39e:135e:130e with SMTP id 98e67ed59e1d1-39e54af6a0emr16005396a91.3.1789989276896;
        Mon, 21 Sep 2026 04:14:36 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:36 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 5/5] KVM: riscv: Age G-stage PTEs locklessly
Date: Mon, 21 Sep 2026 20:14:02 +0900
Message-ID: <20260921111402.120911-6-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aging G-stage PTEs currently runs with mmu_lock held for write, taken
by the common MMU notifier code. When MGLRU or kswapd ages a large
range, every vCPU taking a G-stage fault blocks on the lock, and the
dirty-logging read-side fast path blocks behind aging as well.

The preceding patches prepare G-stage page-table walks for lockless
aging by using consistent PTE snapshots, preserving concurrent
Accessed-bit updates, and deferring page-table frees with RCU.

Select KVM_MMU_LOCKLESS_AGING so the common code no longer takes
mmu_lock for aging, and protect the G-stage walk with an RCU read-side
critical section.

Read the root inside the RCU read-side critical section and check the
resulting snapshot instead of checking kvm->arch.pgd separately before
initializing the G-stage context. This ensures that the root used by
the walk remains protected until the walk completes.

On QEMU TCG with 4 vCPUs, running dirty_log_perf_test -v 3 -b 256M -i 3
with MGLRU aging of the VM's cgroup forced every 100ms (86 passes):

                              before      after
  mmu_lock write wait, total  44.4 s      0.15 s
  mmu_lock write contentions  1,002,092   30,092
  mmu_lock read contentions   351,937     0
  guest dirty-memory time     18.6 s      16.7 s

Before, 93% of write-lock waiters were kvm_mmu_notifier_clear_young().
With no aging, no meaningful difference was observed between the two
kernels.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/Kconfig |  1 +
 arch/riscv/kvm/mmu.c   | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..77898d58ff9a 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -32,6 +32,7 @@ config KVM
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_MMU_LOCKLESS_AGING
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 8aed69abf814..ff282bdbe492 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -349,30 +349,30 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	return false;
 }
 
-bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+static bool kvm_riscv_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range,
+			      bool test_only)
 {
 	struct kvm_gstage gstage;
 
-	if (!kvm->arch.pgd)
-		return false;
+	guard(rcu)();
+	lockdep_assert_not_held(&kvm->mmu_lock);
 
 	kvm_riscv_gstage_init(&gstage, kvm);
+	if (!gstage.pgd)
+		return false;
 
 	return kvm_riscv_gstage_age_range(&gstage, range->start << PAGE_SHIFT,
-					  range->end << PAGE_SHIFT, false);
+					  range->end << PAGE_SHIFT, test_only);
 }
 
-bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	struct kvm_gstage gstage;
-
-	if (!kvm->arch.pgd)
-		return false;
-
-	kvm_riscv_gstage_init(&gstage, kvm);
+	return kvm_riscv_age_gfn(kvm, range, false);
+}
 
-	return kvm_riscv_gstage_age_range(&gstage, range->start << PAGE_SHIFT,
-					  range->end << PAGE_SHIFT, true);
+bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	return kvm_riscv_age_gfn(kvm, range, true);
 }
 
 static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
-- 
2.52.0


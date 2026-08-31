Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A83CC9EA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163826; cv=none; b=nArI7kIjKR676KaynYMHbmLna0IB8uHL30PleClMRXuWzzvwBkzGLmp8CMvwuiv2wQ0Zd0gi/UGgggYQp93IXS0rUugNwUD0jVExG3dIFamQiW7T87tSdX6ZP9x29fpLNSunwe71xdfJ3+ntlVsen8hx1xsyU8F5tIpqXStl76U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163826; c=relaxed/simple;
	bh=Aob392KCiPwYOZ26v4z6ameSKdVNEWay1hUTRybnICw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g2ZtJYaEmwx7Uja01GnzrwfSSYxki0r1fGIueXQifYpjQHRgUSSdyS1aa1RVUQWpdGtvFMaejh/85UOuTM7oJq1RAcnnrP6lLESeigcF/YB5/5XlaNsetgH0DRuzlM6hfQAAs2GEgweQmkhdNub919gr6P6ormiEsuvh7Z4U7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6YXr0Cc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6YXr0Cc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so36101685e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163822; x=1788768622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQe0/H8SNUjRW9auKFahnt1W5WCW5fFGWugsoqcSd7E=;
        b=a6YXr0CcMuslOhGbOHvGG1AENbfAN3dxqwa3TkpYpBo5n7hRhqUs2JZTcJnrQQa0Jw
         EkBlGwygKVozAStl49+wKrfR9OVVzFD86NTxMOVtM1ELDvyNc+tndJ+W6ak4WoAAbowt
         g78k7jgeXfUyH9Wh8boZt0NyrRZ1WtbMSES0ppouGrz93g/55xSGx8Y0bHrsMigd5SXz
         US47fdUr0DFqw6giI1o/3lchJ4gL0nLAieNgOfLeahlayRxOuCpd1Kf5R+f4sCI3T+8S
         IwgpmxsSajV8QOEQ/wtwtZaQKcLr94Y2O10vPC97VZuW7+AvHtoVGg8vM6AyGWU22W0P
         moyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163822; x=1788768622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQe0/H8SNUjRW9auKFahnt1W5WCW5fFGWugsoqcSd7E=;
        b=Hj909VwtUp4/Q8F5dd0RYpVyi+Z8PyoSJOJZ0mlOFKrHqRbAEszC7JNK/d7FUVswC0
         KV5kH9DSKKffPZRcZTPCf57sa6truoQTctxFQLJNysVubQbr/rC7C5LTn3SOGe3lD1ag
         guQgn5aF+EIeK/LvpxdRg+JwraH82yzlQ7l56kCMXeZT0iUXhU1t4np7GQIcgaavu9+e
         CpNj2yvMdT6blBo2obnpHEdTDjPjgjRw09BNNv7A1rzfZOgq+U9PzJdjBe6ivt1O6mzb
         oJnl90itc6eVO5ojcjWU1P0Fj17qVhJqBCiAj6evULYWtNPsSLjhdOX7QJ16s7zx4QG6
         3GMw==
X-Forwarded-Encrypted: i=1; AHgh+RohQmOOM290/XJKagTQ/XGJ52K4dmAh5GdDZdyDsm/35bsm+T/pRCb66DiuWOeNgfZLWdl24LmuH4vHC4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m23WsAblxnA71ZtoScnXWYawGvf9jo2NHPQWnG2hQC/hnT/0/+
	/6vaQxC/X/7jGfLFvjw3N4AzY5veni2rDe1UzvBv/rFEm4LNG848j/pD
X-Gm-Gg: AR+sD12UauX5QwHqEB8dOQ9dGYYKyhPAuMDVx8xb6UmpLEDWMXiAuotHl3tuDVTv8gj
	v4HWg5eMeDY20BigPvpq/HsA8H4ymYhYjwVwxbl26kzrOy1aKmXJkc2BzGETkjPl6Zxp8B/SLir
	dCCeNxI2h1mcstJ+mVwwVUbeavlW6Cyr180aLGvF39CO7jNQGrVQbWzS5Ere/m63btEBVX2VVzq
	bcaEF62rA4OGaCzUeZCsDTgIjWd7r1GndG//feDYKN6/l52cHDUU1aExInqPRnSYy/NCbRQUdkt
	PIkWtooPd9SpHBc1jmKPH7CIfPqCwTrK4km8cb0aGz0wtBlKoK4/oXjNZqRzNck8IuDS5sbndg8
	IDm2IOTPr8YOlTcx2JX3sb2t9YLHXuV+RNwt8eQjRwFE1fUBiO8eT3HWM3aJxQTbSopq1bjnQJk
	Ljde4U9XFk0iMOZUWhcxxBXoS+QRre3lCEmGNBawcfLFLmFhZBN7MxDsRT1KZrkbuJR/COoOzDY
	x4PuqnTKaf36sethL1BTj4kTGzQAR0fsaorYjoqrhUQUL4ilS9rjFeD0fAXg5ggu6dKmfKp2UZZ
	DKylZIi5q0fFBCuAyIEF+nyteRj/aIWLUrf2tHeAgDorUTTECnXgAM0ZK8rlaYOXXC26wQ8=
X-Received: by 2002:a05:600c:c3cf:10b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49b91c47b76mr281088265e9.12.1788163821808;
        Mon, 31 Aug 2026 01:10:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm370393515e9.12.2026.08.31.01.10.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 01:10:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 2/4] KVM: arm64: vgic-v3: Roll back assignments from the new region
Date: Mon, 31 Aug 2026 10:10:02 +0200
Message-Id: <20260831081005.41346-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed REDIST_REGION write unregisters the redistributor iodevs of every
vCPU processed before the failure. This includes vCPUs assigned to older
regions. Their assignments remain cached, so a retry does not register the
iodevs again.

The vCPU whose registration fails has no assignment to roll back. For vCPUs
processed earlier, limit rollback to those assigned to the new region. The
region is removed on failure, so its free_index does not need restoring.

Resetting assignments from older regions is unsafe because a vCPU can own
one before kvm_for_each_vcpu() can see it. Rollback could then move
free_index behind that live assignment.

kvm_vgic_addr() holds slots_lock across the REDIST_REGION write. vCPU
creation takes the same lock before assigning a redistributor. A concurrent
vCPU cannot acquire an assignment from the new region before rollback
completes. The lock also keeps rdreg valid across the config_lock drop
required by MMIO-bus registration.

Fixes: c011f4ea106b ("KVM: arm/arm64: Check vcpu redist base before registering an iodev")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 32 +++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 22897ce64dbf..77aa8433701a 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -855,7 +855,25 @@ void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu)
 	kvm_io_bus_unregister_dev(vcpu->kvm, KVM_MMIO_BUS, &rd_dev->dev);
 }
 
-static int vgic_register_all_redist_iodevs(struct kvm *kvm)
+static void vgic_rollback_redist_iodev(struct kvm_vcpu *vcpu,
+				       struct vgic_redist_region *rdreg)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+
+	lockdep_assert_held(&vcpu->kvm->slots_lock);
+
+	if (vgic_cpu->rdreg != rdreg)
+		return;
+
+	vgic_unregister_redist_iodev(vcpu);
+
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+	vgic_cpu->rdreg = NULL;
+	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+}
+
+static int vgic_register_all_redist_iodevs(struct kvm *kvm,
+					   struct vgic_redist_region *rdreg)
 {
 	struct kvm_vcpu *vcpu;
 	unsigned long c;
@@ -870,12 +888,12 @@ static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 	}
 
 	if (ret) {
-		/* The current c failed, so iterate over the previous ones. */
+		/* Undo assignments made from the region being added. */
 		int i;
 
 		for (i = 0; i < c; i++) {
 			vcpu = kvm_get_vcpu(kvm, i);
-			vgic_unregister_redist_iodev(vcpu);
+			vgic_rollback_redist_iodev(vcpu, rdreg);
 		}
 	}
 
@@ -984,10 +1002,13 @@ void vgic_v3_free_redist_region(struct kvm *kvm, struct vgic_redist_region *rdre
 
 int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count)
 {
+	struct vgic_redist_region *rdreg;
 	int ret;
 
 	mutex_lock(&kvm->arch.config_lock);
 	ret = vgic_v3_alloc_redist_region(kvm, index, addr, count);
+	if (!ret)
+		rdreg = vgic_v3_rdist_region_from_index(kvm, index);
 	mutex_unlock(&kvm->arch.config_lock);
 	if (ret)
 		return ret;
@@ -996,12 +1017,9 @@ int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count)
 	 * Register iodevs for each existing VCPU.  Adding more VCPUs
 	 * afterwards will register the iodevs when needed.
 	 */
-	ret = vgic_register_all_redist_iodevs(kvm);
+	ret = vgic_register_all_redist_iodevs(kvm, rdreg);
 	if (ret) {
-		struct vgic_redist_region *rdreg;
-
 		mutex_lock(&kvm->arch.config_lock);
-		rdreg = vgic_v3_rdist_region_from_index(kvm, index);
 		vgic_v3_free_redist_region(kvm, rdreg);
 		mutex_unlock(&kvm->arch.config_lock);
 		return ret;
-- 
2.39.5 (Apple Git-154)

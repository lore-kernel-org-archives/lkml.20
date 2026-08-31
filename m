Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84E3C65FD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163824; cv=none; b=VdmTGak8MUX7B5SlzEFg51P3xDleI+AXf6Gm4kQY0qh8TwfUdVC38YSWE0WVZxPTtuWhhfRbbxhx2sPrOjt4pcU6TIR7zjJfPeqR/AiYmMRl2tp6XIryqcoEND7MwCph7JhPprVBO//wiDH5Ntdpd1fTH7x2wsNnwk5kXNiphXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163824; c=relaxed/simple;
	bh=r/bufVq0OkVZwEdQ//AHO/OTUOmVemWl8G+OQpZ2wJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uHR4Y+OYFCUxNvbrXAfWNCCvh54Ua3oohL+tos7dSl6IxyEbGVIlLmihoJKA48YoUCV45yec7T11ft/iDjHw36chRPAyp+KuI6fc40rvPdTQBFrwHP/SklKE45MqNPTQXGO+dCGVrbX18+qVvKQ3NWGLgMnAAVDGZ9PbSBTbW34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oa1FPmK+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oa1FPmK+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso12665995e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163821; x=1788768621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg0FhLj+v96vUWe+LyIXKQir5MTYCv01Q4cNbefOBGw=;
        b=Oa1FPmK+llG2ZjaXwPvqJ403Aks7qoUpHSGmpXCa/9SUl+lU6W5FLrxK5+cUpdMw1N
         7WBH+sDUtnN09CiqCZGvHJRiktyLn7FwWEbpUA234w8m0OFA6eVCQ11ss1gIhM7PJEwD
         qZZ4pa3ivIs0sxLIP4EiGEDDf39ElWG5b2JpnrUV8BIWkv0sjRPLB/C7sOQJRybJk19g
         HAzdm7yuYwx0VXGeffIIrKCtxA8qWMqiX3Od0J0zKjR2fbe8lux4qjkHMaiHzvTzGAIb
         ZE6uF3gTnhOnFbXCQw/7CGl/lVL+NhOGNmDuwF20haJ6dV12Ihc+4QFaaxeihcCfR5Be
         Gj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163821; x=1788768621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg0FhLj+v96vUWe+LyIXKQir5MTYCv01Q4cNbefOBGw=;
        b=OMJk+Rc9+lA2JMf+IZ3fUpF9vsXTZFbKoEdf5J9Quh5tugSTF4SIxFWsRrtMR3oK+0
         bWBfdxH6N4gOMPa6TRvQcLOiCq3WCAOAODT2DO9c81wlxa59kZVRQuX7v59p0lPOF7qR
         fv0Qe+BzWjDdZFnBEgK3vkvctYdEqBtt7RqTPnaaT4WTzgU+kLBDP3Qy5EsqZKZYGtuo
         j55wBLxPU40WAZ3o4ceaZvLFZrr/85iDWUakv4Lt9NoBJjXGFhOwR+TWl3J58FZ446rk
         de9zJL0axdfp5zno9FyrThJNxkrgZhR9oryWfuyoqW8VqPKkYD/Burxb8EDYEsQvDVHi
         hpww==
X-Forwarded-Encrypted: i=1; AHgh+RquMW3Y8RqpTQKKSZcz3D6eCpp+O8RwQUqBos3RVnKKiWVpbVAdjaO0o04tCw88gc61Y5kuxnsvbE/o0vY=@vger.kernel.org
X-Gm-Message-State: AFuF++nB6tQku987CYd55zJkzA2i0l937hduFgaEZ8saxSyJu2hnoQDT
	6reKPmTmYGZaNa663Yt9yFIEfgrAGIsGrCADOql3ZFCBDqW2Rnu3wJSB
X-Gm-Gg: AR+sD13iFbpb0Xx4uhrI1nnTTUa/MeEnjj1W7NW7URXP6p4a4ZuzD84mM5S1as+tN19
	Tu2uRSkLxUQAYuGRnVFD9aUmnpeYNfUZPj0CFCnRHwrhklVstndVi67mynV2CKyrDo/9aii21rL
	X/ykpHHXddq4Tbtizj4rzA0BbWFUHf9YDzirTP2rTQsfM/AgjWXA5L99Y/nXkLzI4I95FyCnPQc
	M4+f3hCWC0+aNdAG3KjJPt3RPTjIwe3HiZQInwiyMKjoitmCRqy5UKvFVRCgJLaIzLfpHeWxFj2
	pUBqIJgt89he6wjS4ioePqLTiApVMOjpMt/fPhLKTWQNCYtC4nOzt5y7lguphnE+cBTJSjHVVwe
	cNAewYvrcNfyFDNJtQPt7hbQqXoavaBhtYxA/SyclOXBmcPAicbNn3V2irbuN3iBCRj6qRDB4uq
	E+48uFzfwDRrS7YdLfMg3oitVieyy5i0YDAZfymi5vfJuPnxqoeI5sxGXsVgXWnTOswq/dMDh+C
	pRGKqFHL3CxU78CqcWFTJ1pk3gWJa0wUYopI1B6E8e3cGz2WompxrdUwBFZY0qnzjk75Ndq4UMD
	lyiVjif2lSrFNbmO7YqtW+m1xbRr1E6Cq2gqWDzt9B9Fc94Lj+3WwvYHn8luzRWGaBtSKrg=
X-Received: by 2002:a05:600c:4f92:b0:49b:90cc:3c87 with SMTP id 5b1f17b1804b1-49b91c487b2mr367309225e9.13.1788163820227;
        Mon, 31 Aug 2026 01:10:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm370393515e9.12.2026.08.31.01.10.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 01:10:19 -0700 (PDT)
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
Subject: [PATCH v4 1/4] KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
Date: Mon, 31 Aug 2026 10:10:01 +0200
Message-Id: <20260831081005.41346-2-kmehltretter@gmail.com>
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

vgic_register_redist_iodev() assigns a redistributor region and base
address to the vCPU before adding its iodev to the MMIO bus. However, the
region's free_index is advanced only after registration succeeds.

If kvm_io_bus_register_dev() fails, the vCPU retains the assignment while
free_index still identifies the same slot as free. A later registration can
therefore reuse a slot that remains assigned to the vCPU.

Reserve the slot before registering its iodev. The caller holds slots_lock,
so a registration failure cannot race with a later assignment. Undo the
reservation and clear the cached assignment on failure.

Fixes: dbd9733ab674 ("KVM: arm/arm64: Replace the single rdist region by a list")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d8301..22897ce64dbf 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -766,6 +766,19 @@ unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev)
 	return SZ_64K;
 }
 
+static void vgic_undo_redist_assignment(struct kvm_vcpu *vcpu)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+
+	lockdep_assert_held(&vcpu->kvm->slots_lock);
+
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+
+	vgic_cpu->rdreg->free_index--;
+	vgic_cpu->rdreg = NULL;
+	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+}
+
 /**
  * vgic_register_redist_iodev - register a single redist iodev
  * @vcpu:    The VCPU to which the redistributor belongs
@@ -818,16 +831,17 @@ int vgic_register_redist_iodev(struct kvm_vcpu *vcpu)
 	rd_dev->nr_regions = ARRAY_SIZE(vgic_v3_rd_registers);
 	rd_dev->redist_vcpu = vcpu;
 
+	/* Protected by slots_lock */
+	rdreg->free_index++;
+
 	mutex_unlock(&kvm->arch.config_lock);
 
 	ret = kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, rd_base,
 				      2 * SZ_64K, &rd_dev->dev);
 	if (ret)
-		return ret;
+		vgic_undo_redist_assignment(vcpu);
 
-	/* Protected by slots_lock */
-	rdreg->free_index++;
-	return 0;
+	return ret;
 
 out_unlock:
 	mutex_unlock(&kvm->arch.config_lock);

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.39.5 (Apple Git-154)

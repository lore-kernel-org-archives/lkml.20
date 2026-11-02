Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606333;
	b=DqbrxeaBVt0r/36GMV2f9H//Za8JS1Z3QwwcVw37SaechUwpGFAdbUBbNDWn47vFCdss
	 83XLypvWtwrd9b3eKSjZs6BaBOuMA1qe1xsP3HuME+7dY8M9Xg0STMsvqZ/ucGjntDrL8
	 sF27cMQMXTFxNd6+VZSiMJtiXhBGvSmllWUILYx+7FrPEwtqEyfcUCsgk1WkeTgoBxD3I
	 BF3i6eWXmfBt+pFldOtan88ffDURe1SqJHIlFR3D8h/Xnxjh2hhoZeGsgHpKossd1WCKZ
	 6rz14i1w2uOSzbXnZLPWknJo0k075AA6K3dpLv+0/2uqdTwoWXDaBnj2HdAygFRo55A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606333;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z58+V1LgFPW+j6akovhxZv60ektir/LOJatWFadIMFw=;
	b=FsHyUwVaCpLIv6qGGfkabP9IZMae/a1xez8TbeviLU08OLVY689g2QMqIlSkbZ3JlfBZ
	 ARWr+2XJtRXuEBxqmzZmnU9dHelXrRAxYm+uMvmG1Uw0ZOwDyf1iYqu5H4zeuAK+yN4Il
	 KQcSJyPe8pG0yt21xxkAEju4Oygbws6n1R7s3cAiDSIfwyf1GywSqugf3G+kby1tcdfAO
	 LFgwp+C4iMT+IQdKsBqXqBVuE/qi8saG+Mvuy1lwZEYs6iCrD8WxrA4JnIc4RCrvBYmMs
	 JINCERRCdKysbJPn7JVYQ/hmGeg3soldknWwGTznl2cQVip0VTBVzJAgdCir2Xf33QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0DPpKqq;
	arc=none smtp.remote-ip=95.215.58.191
Received: from mta1.migadu.com (out-191.mta1.migadu.com [95.215.58.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D1606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0DPpKqq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E+yNN660ZSvNAcxzl1biL8JK8VlI5gYHahRxIDWZ1l4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793606329; v=1; x=1794211129;
 b=a0DPpKqqdE39iZynjDq4nwTpgkIP3QqfmtbeYZJHXrl5DfT9kvVRcmYbyltl5ncZtL8Z7ZyM
 tzWmjc6Nh2e7Frx+sERoyChDcCA/2NCCwBXJ5qhqTBtacqIW9NX61nODjv+I4kvkjqwoT0rrnBI
 HOnd7vRXi32EPLCIwHGpJnjU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id af6687c61325397b;
	Mon, 02 Nov 2026 07:58:49 +0000
X-Mizu-Trace-ID: af6687c61325397b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jack Thomson <jackabt@amazon.com>,
	Congkai Tan <congkai@amazon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v4 2/2] KVM: arm64: Clear the default PMU when kvm_setup_vcpu() fails
Date: Mon,  2 Nov 2026 07:58:43 +0000
Message-ID: <20261102075843.2556018-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102075843.2556018-1-fuad.tabba@linux.dev>
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under KVM_ARM_VCPU_PMU_V3_STRICT, the VM has no PMU until userspace
selects one, and initializing the PMU fails with -ENXIO until then.
However, without STRICT, kvm_setup_vcpu() selects the default PMU
before it prepares the vCPU for nested virtualization, and leaves it
set when that preparation fails. After a retry with STRICT,
initializing the PMU succeeds and the guest gets the PMU of the CPU
the failed INIT ran on.

Drop the PMU and its number of counters along with the VM's feature
bitmap. While KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is clear, no vCPU
has been initialized and the PMU attributes return -ENODEV, so only
such a failure can have set them. Once the flag is set, every INIT has the
features of the first one that succeeded, which either selected a PMU
or had none to select, so kvm_setup_vcpu() doesn't select another.

Fixes: ad220e275c398 ("KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 3e91e01b032c4..65194e02cdbc2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1857,9 +1857,12 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 
 	ret = kvm_setup_vcpu(vcpu);
 	if (ret) {
-		/* Clear the bitmap if setup fails on the first vCPU to be initialized. */
-		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
+		/* Clear the bitmap and PMU if setup fails on the first vCPU to be initialized. */
+		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags)) {
 			bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
+			kvm->arch.arm_pmu = NULL;
+			kvm->arch.nr_pmu_counters = 0;
+		}
 
 		goto out_unlock;
 	}
-- 
2.47.3


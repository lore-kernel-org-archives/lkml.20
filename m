Received: from mta1.migadu.com (out-225.mta1.migadu.com [95.215.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134440B0EF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764425; cv=none; b=LSuTSfFjhhDqvWeHkjOGcqE+yj+tvRwFuqD8kC004ve+GD7HzxKIwWlCLkK8ctKDkVnYrdoLfMsYF/e3A130pISL6+fMy1514KMFtppBylvvk2duTMByDAYqRt2PVM3px/5SiT6PZBqNBgb1ubGw+KtL4fa68Xejh5BZIYhPsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764425; c=relaxed/simple;
	bh=PK1z4T8+HJA4CmHfQi7yiSBW4CDCz2oM5Ruw56h1rLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W9psZEwcH8+TeYtsh6rlVzZE84se0vl2DERVN+d9pFBQcI/ep4r9/onEI7Z3n0IFfwN2LVcpZ4ZCMf5wFfs5oyOaOBEHTQ/G27pmg9BCoXz18ZE6/zc9VCUMtClG5jxhAUsWQVLjjWCr38hHK2yYI6UgvLH2loZPrLz9OpKsoyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KIAJh8wv; arc=none smtp.client-ip=95.215.58.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KIAJh8wv"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PK1z4T8+HJA4CmHfQi7yiSBW4CDCz2oM5Ruw56h1rLM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764421; v=1; x=1789369221;
 b=KIAJh8wvoMZVe8f+WnnXTzrEEeNxpQoEXly03XKOnbZM6Tikcmzz3BHEjfH87x7Ua5LfOTpy
 X/Rrsj/2gN//A6JO8jRP/PFwCB6CRcex4RyaQcVD6nYZff2G3eGhKU5ynXoxda24qqRCB13EN3P
 XYxmweHod7U3LWNm4X1E/Q1I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1bd4e47017fc79c9;
	Mon, 07 Sep 2026 07:00:07 +0000
X-Mizu-Trace-ID: 1bd4e47017fc79c9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 02/17] KVM: arm64: Reject the PVTIME vCPU attribute for protected VMs
Date: Mon,  7 Sep 2026 07:59:47 +0100
Message-Id: <20260907070002.3333525-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pKVM currently doesn't support steal time for protected guests:
KVM_CAP_STEAL_TIME reports 0 for them. The host still accepts the
KVM_ARM_VCPU_PVTIME_CTRL attribute, whose IPA would point
kvm_update_stolen_time() at the guest's private memory on every vCPU
load. Return -EPERM for the attribute group instead.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/guest.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index b01d6622b8720..ab659795d4b2f 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -916,6 +916,10 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_set_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		/* Steal time is not advertised to protected guests. */
+		if (vcpu_is_protected(vcpu))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
 		break;
 	default:
@@ -939,6 +943,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_get_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		if (vcpu_is_protected(vcpu))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_get_attr(vcpu, attr);
 		break;
 	default:
@@ -962,6 +969,9 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_has_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		if (vcpu_is_protected(vcpu))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_has_attr(vcpu, attr);
 		break;
 	default:
-- 
2.39.5


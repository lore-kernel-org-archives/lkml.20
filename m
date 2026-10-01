Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAA451B17C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863163; cv=none; b=mjaQ+QxzqqSftdJChaeDcprefxp3GM1ph23WG6FAjpINmEb+QsFkYHxq3lISJ92SICl/jPEAWlHG50qjYtEjcB4vY9ltiMI31cRzrocTjP90CSLJ9D7UkoBKA5VYy+uOF7t/ugV1QrCdgDhh10Wmlk14A75WMJKvTXahS7JYB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863163; c=relaxed/simple;
	bh=2tuch6nKrMgq3ucfEYUyfKrn4X670ODoqukWreMj99k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bVmtFZUjnG9sTYUEZMi5sfoRD2FA4KnLtWGVJbxLbEN3xdk6vs/Y8cKVdWGHSTpxpTqFQ9abd+Cz0PKIXbR+YzAXXcR4vi79XzBsNi2pXsUY2bq49FMu+Dt7kt79C23Zumo7E1fQPBIeMPqbikYamts4TbhA15KQXFnGHkcYGnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g4ddRnEP; arc=none smtp.client-ip=95.215.58.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g4ddRnEP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2tuch6nKrMgq3ucfEYUyfKrn4X670ODoqukWreMj99k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790863160; v=1; x=1791467960;
 b=g4ddRnEPcl7eN0+TOAnbPR5dxIph8fgF/LwtiN+mK+mQy3zflFlGRQyxgJzCB+BoMC7FoJVy
 ksZNzFqJh4WfR428/Zac9RlNQnseE5C9xEJtvGY1KuW3PNBorAFXMiXui10X/BaseB7JY0HUrSo
 b3S/kGXpAGHpEuze60hCikjk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4903d713226fb509;
	Thu, 01 Oct 2026 13:59:19 +0000
X-Mizu-Trace-ID: 4903d713226fb509
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v4 17/18] KVM: arm64: Advertise the capabilities that protected VMs support
Date: Thu,  1 Oct 2026 14:57:10 +0100
Message-Id: <20261001135711.1640520-18-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001135711.1640520-1-fuad.tabba@linux.dev>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a protected VM, kvm_pkvm_ext_allowed() returns false on every
capability it doesn't name, so KVM_CHECK_EXTENSION returns 0 for
interfaces the VM implements: it denies KVM_CAP_ONE_REG while
KVM_{GET,SET}_ONE_REG stage the guest's boot state.

Allow the capabilities that work for a protected guest under the
restrictions the preceding patches add, the vGIC and the I/O bus being
host-managed.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pkvm.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fbea052fa3e16..a165af0d75689 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -42,6 +42,15 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_VM_IPA_SIZE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
+	case KVM_CAP_ONE_REG:
+	case KVM_CAP_MP_STATE:
+	case KVM_CAP_VCPU_EVENTS:
+	case KVM_CAP_VCPU_ATTRIBUTES:
+	case KVM_CAP_IMMEDIATE_EXIT:
+	case KVM_CAP_IOEVENTFD:
+	case KVM_CAP_IRQFD_RESAMPLE:
+	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
+	case KVM_CAP_ARM_INJECT_SERROR_ESR:
 		return true;
 	case KVM_CAP_ARM_MTE:
 		return false;
-- 
2.39.5


Received: from mta1.migadu.com (out-61.mta1.migadu.com [95.215.58.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7B4E9C1C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609165; cv=none; b=QwKQuwznwvCKq63cdDCpzjK6UMRewG7IIOWXpr1CO56A1MpHZ+53y3KDnOOMM0yTTliPl2EWwZ8bT//r8VMafGVKqTwtbyqK6eUZUCRqGgLnKWGuVLQQhAjc+g57vQwTGEgn3fPWVZbWuBtlIi3UjCRtXGrUjPDryBCqKYKeFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609165; c=relaxed/simple;
	bh=4CRRZjkC/vJWP/qd9Q/7VyTKTlYxIPQ8NjIByQMRmVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fg/g6O6DcuUGs+R2I/D6p5wf2SV7rITG5s2mww00qzJE3C3jT+/t82305/SHtuZd8A5FvXBcACJer42evhtoAcXqt3o6iOKnw34zKPa8o4r+wFJyrqb+qttx2v4NqKUHxpu2F8odyuKZ6BC5ThRw2xZScSENqAz41wgcYema7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=juseSFbD; arc=none smtp.client-ip=95.215.58.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="juseSFbD"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4CRRZjkC/vJWP/qd9Q/7VyTKTlYxIPQ8NjIByQMRmVg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609157; v=1; x=1791213957;
 b=juseSFbDLvdYE+U7VKuSi0P0zyIkyPKbOuvO033G6iVxSYrxLjS0iPlPbVV5N0bS9AFb1+Ah
 2IwFiyjEq/hRrBBtub7QHJdVdZ/ql7kzDpWOoFcTc5NCCxds6qRtCjEKauVzOctoa/tytsBET2z
 ObfnAPXG49MD9XHPOpSUjBgM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6782b16b2001397;
	Mon, 28 Sep 2026 15:25:57 +0000
X-Mizu-Trace-ID: f6782b16b2001397
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/10] Documentation: KVM: Fix the name of the SMCCC filter attribute
Date: Mon, 28 Sep 2026 16:25:03 +0100
Message-Id: <20260928152507.2116110-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

api.rst refers to the SMCCC filter as KVM_ARM_SMCCC_FILTER, a name that
exists nowhere else. The attribute is KVM_ARM_VM_SMCCC_FILTER.

Fixes: 821d935c87bc9 ("KVM: arm64: Introduce support for userspace SMCCC filtering")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e0430cc750c9e..fabb1d4bf8f8d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6873,7 +6873,7 @@ For arm64:
 
 SMCCC exits can be enabled depending on the configuration of the SMCCC
 filter. See the Documentation/virt/kvm/devices/vm.rst
-``KVM_ARM_SMCCC_FILTER`` for more details.
+``KVM_ARM_VM_SMCCC_FILTER`` for more details.
 
 ``nr`` contains the function ID of the guest's SMCCC call. Userspace is
 expected to use the ``KVM_GET_ONE_REG`` ioctl to retrieve the call
-- 
2.39.5


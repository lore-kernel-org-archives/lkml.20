Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782140;
	b=wU+rp08c9WErzzx6GMoxvrUh7UufSNnvJiUmjfOB7lHJPg82LD+VDoaoRsXkDTEE3HZB
	 cpihQIUJ4sRWKKkqg5QLky9LuV30/ESjHXU9Rak+lMwkYUx1Nmwzrl6nlOWlNR5Xip9Gd
	 y64j+f3j5sUzGnLHkURoosfVmroCO2wu3lHrIKf4uOGihKIn3DC0VWyI/9jDLpulGiicn
	 9q5j1OtRWec05sJspBRq6zl6fsgxkBjiO2TAHGNUuuldsqGRd0tDXsC92gnWqaGPOKc7u
	 v4vU9TkdBhSbodPLNaEy9IKltMfBsh4O4stEZimU3FPgTFp6Nb5gwfwccx1wH+yc4Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782140;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lHuHnqCqF6K6uaueK6Sr4c00lW3mD3+MLoiZXuZlni4=;
	b=MEppYM1UOnGSFadIztV7r91x0KUDjDXTpMQpTjxuEwIh1bJiLW/k0bkBTe6ECup0Jejc
	 x+XFS+CklnrnXxlxpAb3BcSacgml3D8Zx18xILQj/0wB8+Kr2BK0ldkHigk/g+k+xsQV0
	 x7aa1Og2oigo+mXbicwbOlQA5FBBaCCDjWG3p6gQZcJ4/XLz8EBzfQKZbGMHEw0WbfXPK
	 1mZJSnEKNaV1pCZRdHa6UDvqvGq+MjRxrhya04YfJQC+3WCI5nPDkB8NGrVuXoFx37Ktg
	 nWMMhS+5C9Odr8BxYNXZ4hND3214YqPQ66NvHMCjpSrTNupjcLiPQ5IYLJ3QFhEbm+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k8mGENjt;
	arc=none smtp.remote-ip=95.215.58.30
Received: from mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66A606D802
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B66A606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k8mGENjt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cCLqiN/2yb0grwWK9kGanBFuqdVWEkSHBIBzeKIBjnY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782137; v=1; x=1794386937;
 b=k8mGENjt6dpqYvnBkvT/loF7Zxaf3ScEyYErTu3eE+QxXOcDNiFhEVco2fqWxrsACR0kKJa3
 1R7OoXPvewqN2DBVVdOmm2wYkdK6PgiIcDMQ7W9OkmOD3cmvt0/KvI1IV8/toDTmyv/vBhvEU5i
 9uav8D7+ZITB93Tnjtqs3nak=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id afd5417ac097421f;
	Wed, 04 Nov 2026 08:48:57 +0000
X-Mizu-Trace-ID: afd5417ac097421f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] KVM: selftests: Allow arm64 tests to create protected VMs
Date: Wed,  4 Nov 2026 08:48:28 +0000
Message-ID: <20261104084842.132944-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
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

On arm64, the VM type passed to KVM_CREATE_VM carries the IPA size,
which the selftest library fills in. The library rejects any type a test
provides in vm_shape.type. A protected VM is created by setting
KVM_VM_TYPE_ARM_PROTECTED in that type, so a test can't create one.

Accept KVM_VM_TYPE_ARM_PROTECTED from the test, and add the IPA size to
it as for any other VM.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index d42e201eba763..96c1e70dba3d3 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -400,9 +400,10 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	}
 
 #ifdef __aarch64__
-	TEST_ASSERT(!vm->type, "ARM doesn't support test-provided types");
+	TEST_ASSERT(!(vm->type & ~KVM_VM_TYPE_ARM_PROTECTED),
+		    "ARM supports only KVM_VM_TYPE_ARM_PROTECTED as a test-provided type");
 	if (vm->pa_bits != 40)
-		vm->type = KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
+		vm->type |= KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
 #endif
 
 	vm_open(vm);
-- 
2.47.3


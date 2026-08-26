Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6B93BE645
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785545; cv=none; b=Oj8+ug6Ar+TiVDBxmaAWAPVU+DTQJhDGCeK9i8wWbDUttxfFlknR96YtkOvdkoBvFLo0Vtf+hJ50S9oevY6dFmeUjfrR4BMeMmgbYyGkJ5CcmOxwbixDwf+EAdHQRJGeGktkUUg0zwKT1NvCtHxQOvCaGSVjD6MITdlkWzzZqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785545; c=relaxed/simple;
	bh=lKXQlA+oesJrtxD7c4frkF+V9E3fuZX9xGPyHMdrXvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MU0mIanWmx5Zq/+7ZofECVfRKga1ypnzUmIwSF2YcVyy5HTuMHgtk4RMNNuIKzYA0msExgp//a8hF03qt/+C0aatINZH9hzFu8HAaa3z17S8s/qjZfbolKccjiz4lIXMXNUuslAulnESK+AzNPrhO0/oCtEYNyTT1NbgcmUI7pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u5fYD3EC; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u5fYD3EC"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84857446424so2690173b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785538; x=1788390338; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=;
        b=u5fYD3ECN63cZG6LVwmXOHdxe4K8N8vtjGMIsOqRPv8taiWDDmDOX6riooYkFHufnU
         ivSD6slgS30NwbpDwLsmtjBWEPSwvVe6IAXNCyG62V5u7P1Dun7Sg0RP8nbyAaSP0VLk
         qyjRo80oyO0pZfajhrZau16J7C76WseRjCoc/nGiR/pd5siLgH02YaJ1A+/Qjgjw2jlt
         eWFLTxHHBsIQoVAUanJZcWHcA6mv3tWEOIspxznJuUgnBIZM+O3+Wt8Ou0lYPYx3KAjT
         /84jo9FN+iqcHVEhU1p+wcBpCa/eU1Oh6E++qCV+PYIkDUeFeCzfoPtm+m3MJebzW3OM
         GWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785538; x=1788390338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heZN2DuvfOxZirlVdynH6v1916EkfGJKRv4e6fIVLjM=;
        b=lBopOwVWlKx8HKm+R9Id/aLo6VQgOag+qCe2lw/fhiYDoHlMM6PMsSgMGjHD1/C/W7
         ha7x6zByrNeuvpn+kSfqqgD3vfXdPaIJqm+q6cH/hL4iBhJXbvpYLzh2TaZf4ELFVpEO
         zl/KkkZmtxcKZbmQ/2Cf3K+p03LAazK8QgyMxQ8T7/eTwuviCRpXCZRCT2VRVfoR7dML
         iZPFykicQ96tyMQ3wKwvMrgCIHitbq0PAPEHej4uxkZew7qtyC994rUf12TNq9vu59ER
         6iFObXYKeYGHC1lrP96gSo4Y+NfeP2Z7W5dA9nR0xEJI+DNV0lPMQNeYJ4ebmNRElMds
         295A==
X-Forwarded-Encrypted: i=1; AHgh+RrjLEAtyiPctF+nhcdJD4cFoxjH2BvQ0h6A8fZieXT2hG4M80fXLBc7Lft+GM7DgfI63UFbt2pnqnHsOZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kRmTcgw54zEYDhfUHD4enQlkX9nxQKiNKk5rTfKbadP15BdPes
	FmKTy2gEYkdMZSReFHeXiWUS091AV7xOSGv5/f4nyweawFT4KhwXTBZ27QEbAla0/dQ6QAmzmtL
	06MfpHw==
X-Received: from pgce14.prod.google.com ([2002:a05:6a02:1ce:b0:c9e:3c0b:5818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2013:b0:3d1:3c2:85b6
 with SMTP id adf61e73a8af0-3d103c28dfdmr4039415637.5.1787785538103; Wed, 26
 Aug 2026 16:05:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:09 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-19-seanjc@google.com>
Subject: [PATCH 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
input is guaranteed to fail the test, and with the standard error message
format.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 783f060faf9e..a0cd1b6598d4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -198,7 +198,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot);
 static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 							     enum kvm_mem_region_type type)
 {
-	assert(type < NR_MEM_REGIONS);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
 	return memslot2region(vm, vm->memslots[type]);
 }
 
-- 
2.55.0.887.g758fc8c411-goog


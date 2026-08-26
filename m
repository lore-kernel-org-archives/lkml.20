Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700833DAABF
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785539; cv=none; b=f4CavzbVLrFiifP4OklVLDb2/+wNe1npzVluk/v71I6u0aAe+Goxb3V/3KmAVTI+W/6tvQq+k52pqWnalM5qWM+/WJmNu/QhNc40pPXQYl85Y8AxivpZnKSncwPc9Ct8ukU64ftvnK0C0TGye80kMSNbQ2IxcnE+6y/t8J5YwrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785539; c=relaxed/simple;
	bh=tI28fyZgaxj3QeLG5gsP33C411QZoueUpyjlmbF4icU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SMnpeqhgcUMcAvqNmAoX7PUvhFHcA1UZ9nAmg16Em29HkdujhSp+gb8T3ZvGhegvSUMXSOohc+KGWrGagFuXEBZJdR1AVbvBg5G+40j5CLNig9OUvkQJtlJI3GN2+vV1+p70PUXftlpRU8+L9HlXnEX3zvKnqD9muvorxslRK6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q5I9kapq; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q5I9kapq"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so3123456a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785535; x=1788390335; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lK9hNNEVcV137VJifUj1j8FlSQZ8ZR6EJrURDAfa97I=;
        b=q5I9kapqb9yK8nj8zif78XTKNvR7cRMAEO63Q80D5+vLfYxgz50+WkSjui8LDHvZrK
         zxTQcfbJmt2lsL18Rs6Un9II7w8z42VR7AIWUJ0wmrYiYBjNTQ07RiKzHhI5MjPab50m
         NNl7d25azAXXXF43BCK6M0l2F+aXa3wFVD2XLHXUIEfEpSn0tbyBBe9bYtPMhTlfynfd
         rw1hLdKponHr4q8XGBARlAZbw94QYxnx0TuYFuol32hmCxZDoz7YNjj1BAY64TJXZ99q
         cTx7HgYndhopa127SteaBxNSkP3r/j8CImCc+A5WBnlnvcK5tqzBdXrzd+6Uc8DTRzBc
         eQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785535; x=1788390335;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lK9hNNEVcV137VJifUj1j8FlSQZ8ZR6EJrURDAfa97I=;
        b=ffe7elcdQKQU4kVhpw4eLMc+/OInncV1QeImsMqTSyliwLbNX8w4w/ZFiB/RNHw0Pl
         RYB7AdfZz7XXSYf3D6f56LoOv/NMfaACGqyFe70Z9DZDPVnacynSyjbMXzJrmBWeXUk9
         uGC1fas+2wHhYlbFiGf+JFWrYQv5QJJbBk5GxR80QwiQeE9SkSUdSzxOJ4+9vXWje1Ab
         ZqMypCg+q2LFBmDQRjkKyGYhrImfnVwMYN/7MFwEeib13HMvgr/YaKoa1W1t9JFRV27m
         WnTlIdgIkiV3KX0MphkUz6FAxp6R5C2Fof7wKFLcqllTMuGgalo1bkSZHPr4TLtq9+ro
         5bag==
X-Forwarded-Encrypted: i=1; AHgh+RqkbSDaW1grsFpj7sRPPG2tfhVRRk8H4IoZM3upoln8oAVa01ltMooVCLLfkSc2XsLNsZdrh2QWDmBxmtM=@vger.kernel.org
X-Gm-Message-State: AFuF++kX8T2EWkXBQ6v1R/0BLujMawI81b7voqAGO/W+PRSOo4YF9i7K
	YJ+b8Vs2lJM56gxdOOR3zuyX4Qv92+T9jYPHanUVKY8tRnBM1qJQ8RbwPdlJ8U8ETySUIgNNOlY
	xfbM+Uw==
X-Received: from plblc16.prod.google.com ([2002:a17:902:fa90:b0:2ce:9b92:ec60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c7:b0:2ca:6d87:cda0
 with SMTP id d9443c01a7336-2d7079fa6d5mr157756405ad.6.1787785534676; Wed, 26
 Aug 2026 16:05:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:06 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-16-seanjc@google.com>
Subject: [PATCH 15/20] KVM: selftests: Use TEST_EXTRA region in x86's smaller
 MAXPHYADDR test
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

Use the TEST_EXTRA region/memslot for x86's smaller MAXPHYADDR test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_add_extra_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 3dca85e95478..b21798a385ca 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -62,9 +62,10 @@ int main(int argc, char *argv[])
 	TEST_ASSERT(rc, "KVM_CAP_EXIT_ON_EMULATION_FAILURE is unavailable");
 	vm_enable_cap(vm, KVM_CAP_EXIT_ON_EMULATION_FAILURE, 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / PAGE_SIZE, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / PAGE_SIZE);
+
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
 				 MEM_REGION_GPA, MEM_REGION_SLOT);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
-- 
2.55.0.887.g758fc8c411-goog


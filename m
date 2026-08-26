Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8413C0634
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785530; cv=none; b=kIEL6XSfuMofoX4efl1URM2t+9UbDRSpQxuXAwOopL36ODVn7YL4jJ8RsM6lhDspS17B0bD7wHBS5G2upaEor77ordGxC/SfOSzqYD/ZCY2xTPWijy8cJ0OdqZ84hO0xJhQ+2jsdp2pUV3GNk7gCFqkgQU2Ul5j1pXrFSFJlOKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785530; c=relaxed/simple;
	bh=3W6Dy3uU+CoTj5YuDL9UpW6yQwbWSR/ky+isWorLm6M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o5tE3Y4GE2RCl29OAsM4zC0Y0ND2Foptl3wQVJzbF4wIZ17vPlmal/rx49IZVARa9Kk2DLIhJuezPSmhY5H0gZwuAMwCpI5j3vQmUrTjSpAWYZLcqu0VVBaZYlVqe7EX2MuZmaWfkwYKIeCwDwzfH+OkbcCVvyk5mPr8G9m7bCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fAyDS2cI; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fAyDS2cI"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e048a801dso2173287b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785527; x=1788390327; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O8gpVGaSftwEDfNK3yhe7P+6kzj8cM/DRvM4h41+9U8=;
        b=fAyDS2cIyN8Jch/7ZuCo+NVdMolAqxpysNMNhH3pH8rrbgRFvyJqDapDr5apTlsuDU
         ZZoM7sX4gEWO8FDis56W4mHSXaclI13zQLyqi/y9KBXhb18BNyrzpFTsF+L1kSJxRiep
         +pV680T8ImHVpUzhbFjdXnzEuasGkRExE0Z5jeQZMeiKVthpovyFltOpl2P+3w5G5DFU
         9mKEBKPCnqvAaovV7js8rawL4h/RnMzOA1g/foCWA0WuM7vhqbEME4ljFgAGnCYmLOPx
         EFPA5XI7dZLrA1z4RN8LrTibj7oUzmYAXEBJSe2gJ99oKMlGayWO/M9eh/9pZD/oLZDD
         42Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785527; x=1788390327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8gpVGaSftwEDfNK3yhe7P+6kzj8cM/DRvM4h41+9U8=;
        b=LZG7+5+/Oy379sYjfvY3VhMEVi1GHCIumvDGPQvKqVvjM3JQG9Pu+zZbgnoXtOJkAK
         lLbIAy8M9EG1aSKDHGkqG0kVKAymTaWvp8qLIRo+tLZ0FlPSiPO1cLmXj0SLSf8hue/L
         MM/Iyeq76UYojASbt3WwNeewtzVFRmBNya7yryDiLpWvLM+NOD/yRriPnaVi7s0i7OKk
         6ILtVv2WNVMzdVKOp543aZLDQtkgTUoSL0gocFoxSjIg9UQ4OpgjGIm2dvp5p4FsKpol
         8twg8bvpw2Y127AWk3aFIFsvegsaLLiuRe3nnc+BMmek3M5DxQdfl3WPbvbf50rPoFFr
         Fw4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp5UXNm6AJer4WqiYgKugVV8SNBdQi/CadCbD1lmU+n+3b8/x3ofUPgHtnqhuv3JKhveyTQhYEbPDkOeEo=@vger.kernel.org
X-Gm-Message-State: AFuF++kdiYjOR6DhVI1y0rNKhzSNxiLd82lSTtc0MNZP8qDPAdEwZwGU
	1L9hsDlBirUKgPuYjizOTSJTvNVL74/330ay36OlyJDkI24r4la3m58UDNZOjLFWVzoWeOiAiOT
	ZnDatgg==
X-Received: from pfpk15.prod.google.com ([2002:aa7:9d0f:0:b0:848:2e0e:62e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:301e:b0:848:34ad:3d6c
 with SMTP id d2e1a72fcca58-853750ccf97mr20523023b3a.15.1787785527096; Wed, 26
 Aug 2026 16:05:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:00 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-10-seanjc@google.com>
Subject: [PATCH 09/20] KVM: selftests: Use the innermost page allocator API in
 s390's IRQ routing test
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

Use the quad-underscores page allocator in s390's IRQ routing test in
anticipation of dropping the @min_gpa param from the primary APIs.

Note, it's not entirely clear that the test *needs* to use a very magical
@min_gpa, i.e. it's possible a more elegant solution exists.  But that's a
problem for a different day.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/s390/irq_routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/irq_routing.c b/tools/testing/selftests/kvm/s390/irq_routing.c
index f3839284ac08..cd26cc1aed80 100644
--- a/tools/testing/selftests/kvm/s390/irq_routing.c
+++ b/tools/testing/selftests/kvm/s390/irq_routing.c
@@ -36,7 +36,7 @@ static void test(void)
 	};
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
-	mem = vm_phy_pages_alloc(vm, 2, 4096 * 42, 0);
+	mem = ____vm_phy_pages_alloc(vm, 2, 4096 * 42, 0, false, false);
 
 	routing = kvm_gsi_routing_create();
 	routing->nr = 1;
-- 
2.55.0.887.g758fc8c411-goog


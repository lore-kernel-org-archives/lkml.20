Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909594AE8A5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367319; cv=none; b=aKHmqlwlKzo8fBOOTAguXrrzEPhVzQ9LQEFJTYiSX6N3hfoD4C32FcheFrmOvmietlSB/PYg673LWTF5J+VCaqA6TDmjRs5pFtWsJ9JZccbDOKRVbJm/P112hibpObjplkEj19ll6/NbzheIxUK4uUq51jIQHEP6wP0EiQFt53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367319; c=relaxed/simple;
	bh=OA10wlnKKQ7EEM6YlvfJ4xQQrgVCfQ10w2yj5EgWY/0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bfxypJ5/qOOW9Sgzs5kOk8Z9i1HH67K45LSMMBrtxo2T3qGHwc76d2Rv09XOmSUMFRby8FWue17V/OKzY6C8JeDO6y6kWxKIh/R03+UvoQrtsDznnDXNzS9ybTI2wIY4p38yqfboy9ypJ2WZKDWagl00DOGyLIZKWvkiru3Dud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZRdPfYeD; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZRdPfYeD"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e01a62d99so1756492b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367304; x=1788972104; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NSZqPcNxcDapPNldInB7JTSEZaOXSqhsga2ZRaSmlrM=;
        b=ZRdPfYeDuF2PI96J3h2s0LwwuVEN1RcPfvmFxt8gjmmgjFkddvmlQeugIuTJ/aSjg7
         eawo4QBP1/CzVzhLK8z8aGPHeDiy0WO0X0LXp3J/mTzBQqAPyReJP0RpLI+cXOybh9xp
         yb11PUUSlNb+XO/ILXqlDZzokMarBzqG/59PNIt1i/0xXp9ukBQNqhyl0X/aLNLFoqjQ
         9jwdeXumWNiFEzvYA19G6a3veIDAV8Y/+tuu5yTzxJeHGXDPgJjqIh+kJkaUbAeMnUFv
         8mFCcp+uRC9eM/6TJgdRmvCgWQoyZGm6TjSpKKg9PXivCKCQD2/MhGhWnpPd1WMyM0zz
         QTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367304; x=1788972104;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NSZqPcNxcDapPNldInB7JTSEZaOXSqhsga2ZRaSmlrM=;
        b=ov6jjYZpMVBW+6gZC9GcZ0RcrMWdhvKz8/iIpK3ki0HJG5j04/DjzlWTc8AbPA7y3t
         mIbBQE6WKthD/+nspR9lHIFQM/sOduDQ/x0Q3aeFauo5d12r2i8CFOaHJwlxyMjfb/hp
         AldmtC9BdTyc37klVvP+6RK+z71XiBmd8E12vBs01AGLdVWBfkaQbvNjXdtRl2Iw5ac6
         uRDuRBf06DTN3mD2RyH/tQO13CrI92wUV+QA8BPAafkMcL0zAXkw2Vz+txAGJ/QQXF5n
         LqeVRxIzjqiL3XFZsa4EPe4NOPdHRIjAstV0RN1ETLlPZW7/sXmSBRQx2GIMqudrt/ZY
         dBeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZcvlPN+8oq9Sy0WROwgS5R6u+ek+xRgYQevOyRLmGRU3EbPcMjMwz7AOXrRfZ/HGdLL1km9tgSBnOKco=@vger.kernel.org
X-Gm-Message-State: AFuF++mtaDzZXQmG43xW9Vl/UwvHdCJfFeblfzcfLtwZ0ImcT8dr4zqe
	sIpHqO5/NajiHz4UIWmRDLrNpZotY3vifkJt7WYN80EymGk1g6nT/TFY9EusOGtdWEAhbJtvfPt
	kLLJO7A==
X-Received: from pfbgv8.prod.google.com ([2002:a05:6a00:4e88:b0:853:9149:8801])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:238b:b0:85c:c8db:8e4b
 with SMTP id d2e1a72fcca58-85ed23dea9emr8785308b3a.6.1788367303872; Wed, 02
 Sep 2026 09:41:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:19 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-17-seanjc@google.com>
Subject: [PATCH v2 16/20] KVM: selftests: Use TEST_EXTRA region in set memory
 region test
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Use the TEST_EXTRA region/memslot in the "set memory region" test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index dffe9654f45b..9d21594e2f81 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -116,9 +116,9 @@ static struct kvm_vm *spawn_vm(struct kvm_vcpu **vcpu, pthread_t *vcpu_thread,
 
 	vm = vm_create_with_one_vcpu(vcpu, guest_code);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS_THP,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / getpagesize(), 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS_THP,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / getpagesize());
 
 	/*
 	 * Allocate and map two pages so that the GPA accessed by guest_code()
-- 
2.55.0.966.g6673acef38-goog


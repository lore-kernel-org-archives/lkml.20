Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD24AE139
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367320; cv=none; b=RnnEVPgWvTyHJC5oUz8W00SmAeoWPleQZ3GA+zj31W4YgLmd7ezWw/LyD3FoDehZGlhiGzONNxnUepKQFCeMiQ1SpTbBMIJ+NA3oIN2D55XNhW3T/ayTGm03Tj2cqvEvhWfB1uwkmjiUd41j2QBna+7U73/o4SOlbExXbghPrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367320; c=relaxed/simple;
	bh=x3gHoQm6151eyOz2sxvBb0hZCS6dwBM8KBP69Q1Eww0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EIIOHzbpaRcNwYEIUq7iOaA2QDqNBWFfEqkEwd+TdYle/T/eJaTtSjSqq9chcYLRX8F5bh/0vs5vV8+Wdp73ceNIMn+Z9fNjFeGPAWYXKBTIh+s7oyhYz1Prey0kkVUxR6tVBmXy58HY7fwfraJcXbeCOeZC3bcYxc+IQu7nIJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZvgkATqb; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZvgkATqb"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso50261a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367306; x=1788972106; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=;
        b=ZvgkATqbgOXz1Jz7uj00M0H04UqIybAwIXkHoGFlFJYvoMKdsB3xbFnol3RxFNmFpR
         wX0hQZbJeAfy9qrEq08y6gB0XMJo5+y68AhLFbaclMeQMPRjppVjT5+We6oAV93zW/+J
         mDEKJxehqVc+rDJc+gC6Vol8088a+yJLSn3xnzClq87iL1oD4M/X7MWjFM83OeRgexst
         Mg6f0jfWm/BvBglHdjDrzFEA3XZKskYTtbwnqhER0hjNL7zOOunSYYbLF+50pgwiuSzr
         cN+XfqfBwSATksn/6NV8ZLc/Z1OemD2BJE4X1QCeCJloISOw7QaYZDYUIo+V38qbZnMQ
         ++7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367306; x=1788972106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ff1nydjVZ5E7b5LVcCvqITlv5jcgKgSL4KOLnEEEgvQ=;
        b=U+wZvfJLuZEKEbC/Eeehh7QcG7VeOLMlUmHfFGi3OpXDNvCkk2PVT36yIFXQywII4a
         TbrVCx4tZ99J4bEjCyLpHh6KATdqiPETUOImRP+Lj/i9ADza19tNwxycgg/ZVQfitgJc
         THEZ0CMRumlPMSA4Uu/y+SJOq1GawWGQW/HBPTJEVfaGxgg6epGMyYTt89vciweGSyhv
         epQlsNU+RbFbljoyNHDGUkTY0DPRWeCp62UvnM6xJM9UO1o2KbklAffttLlj8MQJLl/X
         JT/8VwdUehRrN51y7+Pg+puQ/b8evu5iA1L4kms+sECO8WWarhUJ7LdRLrOV96+vc/sq
         z9gA==
X-Forwarded-Encrypted: i=1; AKwUvBzj2bciM8B7beEYCGFQx+LGDOhLPe9FuyLUafijdM+QJ96/CHEYoSBSgvwbN9wSjD3EU+HnGzxs4MxDtPU=@vger.kernel.org
X-Gm-Message-State: AFuF++n/+G2CsxS3V+xTgFzfiKsDtMaW49qVCQWFPSo3omi3IdQE4QH+
	cipVZC689IDmi1oxBKSdhCod7HEoCYsNCUGEV+FGAwJv+k0H59ABWvO3GEJuY41rczho+FHipON
	4/gduTQ==
X-Received: from pjc15.prod.google.com ([2002:a17:90b:2f4f:b0:380:cd24:3a7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dcd:b0:398:9bd3:d6d1
 with SMTP id 98e67ed59e1d1-39b083af6fdmr384502a91.11.1788367306328; Wed, 02
 Sep 2026 09:41:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:21 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-19-seanjc@google.com>
Subject: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
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

Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
input is guaranteed to fail the test, and with the standard error message
format.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index c9ef2e5c9971..c166fce4599c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -200,7 +200,8 @@ memslot2region(struct kvm_vm *vm, u32 memslot);
 static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 							     enum kvm_mem_region_type type)
 {
-	assert(type < NR_MEM_REGIONS);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
 	return memslot2region(vm, vm->memslots[type]);
 }
 
-- 
2.55.0.966.g6673acef38-goog


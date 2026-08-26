Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F5C392C2A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785529; cv=none; b=r/tOvVRC9jACv09ho5efKqnGbk2oVfe0XpFNEZyyRIAF2EFrQ9yn/7a6o7hbZUyK4310L7nLxsJjquQWoIEBDFRrxHoQcm2bYQDrlFQV42sU8oOdPgtnMASogJJGbRtQJPpEWQt+zcYdQaESvYhccRTPtgFEi6NHiklw/KlYcBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785529; c=relaxed/simple;
	bh=lDyYEYe/N4mhHSMmROmNTfj8SUYUweA+PUQNctk1vn0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sKKRn5hdvDtjRLpBgDDydVHsT3Ma1902b8AVUU2MKkLo5gbpq9enMbW//PLXaNpfUuKwsOKEeJZbzgXcH7Ikkn4UUS71z3N26RTCSLj6W6msIUa8yNHEOoeYKXEAKpdzsF3Gsc3TsfuH23h2vP1E/0mzuE3RYdIOaSyavz2wNo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BBtxNGxg; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BBtxNGxg"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d70d8839f0so1301365ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785526; x=1788390326; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkGDVNWv+E37i1qgZxGANcWGk8EcR4uX9VZBG0WIwSA=;
        b=BBtxNGxg3krk4mAvhxSgY8jlwiBzzaX9bWxm9jpVEjAh5jaN+7aCYp4XXze/RyfFTN
         yx25c6MC5q3R296HPJe5js/bj9Pz2x1q1ZN0Ie1k6vru+tLXhDMQyTrgwt0mySLTXZ/M
         D7k5fPS+cGu+C3j5jAmZFcbpkTfgqy1CqJpqom79b36GVcUkVbdTFhgCiJ6r1XCFaeYn
         rR+q52pzw+Zm149LaeMf0OUo80YBWgPmihvzG5975lK6PSA1awWeED1bxX7cW4POGNSU
         jbg7KvF/YgZcnT1sLa7Jq3/TR1pwOigdFQxJcc4CFaC/+cpRHFkc4Z3627vhLDs4DMmF
         /v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785526; x=1788390326;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkGDVNWv+E37i1qgZxGANcWGk8EcR4uX9VZBG0WIwSA=;
        b=RoxnYDRe9AAdj73SM1hG5Wf/momRv3SmPIxrMwz6aXgmW8YNHNfty4RGwk2UT4x037
         2AWzKiRVwI+/0GOc7w5yqYREeAWRm3YAVtpeaNqZeneTTg/m2dG64FMEzHnW+6Sro5HI
         PH0GgpGbG9w0nPuAzx+GTqBdUDzLedvXryX52GwBbcQeYkN61Zt7uCF+QWnuz7U5AkUK
         yeBTTOoX06Tqpq1l4NUr6dpl6nhzXz5h+86oDbxwoIRLSfsi5/nSfuwi6NJzP4Y7BAh6
         ++F5ilIAWpwRmyijIY3oimzEbFfU3deW6HhHyKOMbNNSetBBFhhERd3YBEUwY6a0wJnq
         fFog==
X-Forwarded-Encrypted: i=1; AHgh+RqOjk0Ec2UJYZbDp6WyCwAE0li2ZHYSRwufQWe4DAfMBc7GYx8VIUgDn8c/EcPOyu9tTmIuYSp/fJVBWqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kuN7B+Fa18GnWy5ZOJIZkh0cwC4pxvzRzXlRFrNBa+J4q1Qa+l
	d8D2l3Y4O6QACYKhk71JgBqFnWM0odLHXbcs9Qxaw4JqjW1JdYFuMI9YqFTXIdkXII2PolVLU4h
	shj0YSw==
X-Received: from plblc14.prod.google.com ([2002:a17:902:fa8e:b0:2d5:62cd:db79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19ed:b0:2d7:107c:917b
 with SMTP id d9443c01a7336-2d7107c934fmr164734915ad.0.1787785525359; Wed, 26
 Aug 2026 16:05:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:04:59 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-9-seanjc@google.com>
Subject: [PATCH 08/20] KVM: selftests: Use the innermost page allocator API in
 the memslot perf test
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

Use the quad-underscores physical page allocator API in the memslot perf
test in anticipation of converting the outer versions to take the memory
region type instead of the raw memslot.  Stating the obvious, the memslot
perf test creates and allocates from multiple memslots, and so can't use
MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/memslot_perf_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index e1299611be32..844ea9b7bb41 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -339,7 +339,8 @@ static bool prepare_vm(struct vm_data *data, int nslots, u64 *maxslots,
 		if (slot == data->nslots)
 			npages += rempages;
 
-		gpa = vm_phy_pages_alloc(data->vm, npages, guest_addr, slot);
+		gpa = ____vm_phy_pages_alloc(data->vm, npages, guest_addr, slot,
+					     false, false);
 		TEST_ASSERT(gpa == guest_addr,
 			    "vm_phy_pages_alloc() failed");
 
-- 
2.55.0.887.g758fc8c411-goog


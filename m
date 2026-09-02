Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293334AC15C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367301; cv=none; b=pa82a2zKbe6o7Err0ceWUTg5Tqwz76jfoMAYXOKZN038MaWuKk2GuJ4cdkIi/s3x6NyE1/bMl5gdj+0ZqLMpk+20QHIXvLKDJRFfBkB7wwGfoLVag3TtPkoMjgRhfk2Q0m/i/RU2vEkrfO4t9znC9lMTqnocGIRd3js2rdWu9lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367301; c=relaxed/simple;
	bh=WDeJfGuz/+J1eB10aOiEcQza2SsiAbDgMT/21OjsgZQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nNIWAis0UtxMZlbIx8Sl32XniP4Q0vle8vddI3GGNSLmnzGOoq0/IRykb04iEq/EDqLu8hh/NCJzKvL5O9Pb7hW0UnWf/H8u88G+zAdO9V9dTKP969+8jaDuB0s0wcJhKzjGkxucnxIxiQBgXINY1lhIqar2iOE0KF2iOK03Teo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LfUbK5Q8; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LfUbK5Q8"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso542805ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367295; x=1788972095; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=;
        b=LfUbK5Q8vMNCyel+W5GCb23Ed/cCPLc5B0oEX24NzaBMG0/LHWBEbcrTDEL3hZMazf
         ca6bfkfZC2l506F8e1DcuupelkRTu0dz23wNucbhaPJqEIyNmN2TgiP7y/ADT/aBL4QZ
         FCiFTlfznuO2gGIDPWiNFHEeMs3cHrU+kCuDA9Bn1GEaYAY83OfqjOSiIoiwiUZDs7Lc
         1dKl7DhIpwE9vs8lTIUoPxTp2w/zkFcNw7kH+PxLzUXzlmxDc1kt4NCJi+3MoedFv7ik
         3YqivnY+nrPgJDlNZdjZvS0ocJSv0VCa+Z9BenQ5xWKpKj8AG7T++oBs1h7ATpMzkdS4
         Fpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367295; x=1788972095;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=;
        b=QBGSe6w72p2vBX6vtCt+0PeeKTaJ/9wKJcMdqq5jyC49MtittJwBdidsthsOTidemh
         rlhLH2DuJEyoObp0Ie0kk4n9+he7REieRczDC/fZM9mOKmYKnbEnpDvvb+HcV9umGrtJ
         P6kisyuTB3j/PWDuUFenCcRhphyWQ9sm2r+7qYW2O0C1eONrnEI/hU6xcCW5yAiS+c1Z
         nre91oPmgGxvBYvqmNk1ZbWVY/sXTF709Jq9lxF1rW0pjRmt9WMUoHUxusR3csquNZpG
         abcgHm++RiKMPCzQS8SLs2V7pB3J93CUFwkph1DIlICYRmKT84gYdjKGSmzWt6VoyS3n
         tM1w==
X-Forwarded-Encrypted: i=1; AKwUvBwxf+8sXXtG/OQMlIBQdKlLe46It0Qr3wXux5oYefChiUi09O0maVnK7LNPLAkq/cEBMNGp5tuBrYnbGm4=@vger.kernel.org
X-Gm-Message-State: AFuF++mw8X5cRAIgs9Es2/PpXDfffMvC1mSF2+/sh5g8HLTTXEA8drKd
	JGNSohrzQ7rXAzLRL+O9iR3OIOTUpzOWwxr/bm32ERgZhcYtNsR/nY+mV8fk+4I3OHY/T9ZIZtj
	SkqjUQg==
X-Received: from plpf12.prod.google.com ([2002:a17:903:3c4c:b0:2ce:9b49:d497])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:946:b0:2da:fa62:4aee
 with SMTP id d9443c01a7336-2dafaef6574mr4292355ad.1.1788367294564; Wed, 02
 Sep 2026 09:41:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:11 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-9-seanjc@google.com>
Subject: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API
 in the memslot perf test
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

Use the quad-underscores physical page allocator API in the memslot perf
test in anticipation of converting the outer versions to take the memory
region type instead of the raw memslot.  Stating the obvious, the memslot
perf test creates and allocates from multiple memslots, and so can't use
MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
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
2.55.0.966.g6673acef38-goog


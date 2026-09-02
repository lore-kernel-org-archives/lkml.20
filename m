Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC14AD7FA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367309; cv=none; b=IDTYSjUg7GYGYXB5TLa1K5c29QOQer81292nP/EHTp8kiC+INKubBYaengr+adFw7YMQYybgI4ssw01rk721eF81QYuo6plMEk06C4M7aw2Er3bmQ41F19F5S5rg6Ki6MXVD+9wP4gnEQIzEpcdZJDkLZEWidD1+9yrnObtvo6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367309; c=relaxed/simple;
	bh=c6Dq51OifpuOLQwcC4ZiEV4FEdSDUXT41cx47drisuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A2nE5neGFjlzJmPBMxw+VriMhnXs+vfR3ilLvvpMDizSTGzMIkG/IvuEZAvhJ4e3byJVX7zDtlKQ+7xfdrQKd6NjDMf/9w2tjvSTtsiyH3R0oPt+FgazdBpiXPCPbq3yEORhzV2sgsfuYhJhJ9D/fhFNLTwMX6DEnDbxEq7NoqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wivVQve8; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wivVQve8"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088203so1665378a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367302; x=1788972102; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5u+D2Eye+Inmljua0Pt8umFr/3SFEmDrz+aVxfwQfA=;
        b=wivVQve8F7sa3q55aoJDM3BP36qbPIIPO4c0RWAGysBNiLqFOYkfZD2MJ3Akjekk8K
         QUoE0lO5MegcTYZK/cqRK3eGUJMcG45YjAYbGq0hf2VRLqlyrHgozewFyMaA21r/Mne0
         jypeFN1H+XVIqa333kZ0VFXkj3x/EonhE/qCeNCsSmP6SpgO5ER6NriYdoXrO8ofChiV
         ghdWjPvMC24NuUaIIOk5qlFvI/P19aywLmF/TW1To26kb8qQAKR/S0fAYRdgYa7l+n1a
         YU+bc2EF8qA1nGR1Cma9qdLff2czYJheqx4/baM+D1/V8NwnQs2lgTUC/+D42a6+QZpc
         9UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367302; x=1788972102;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5u+D2Eye+Inmljua0Pt8umFr/3SFEmDrz+aVxfwQfA=;
        b=j/Vh18DBKV8bDop3qjWyISMAWinYtbwGdOG+7TJlQEGiFXTFp6TzfKX5nac+MlgdLR
         zVv0rWPOQA6LAj3t/kKKstu73YJCKbqSMhKtb+RDYnvIWny8xgiAm1ZndfVGkhAKvcN7
         T8mChZHmeflfa1VBUOIwNcXPY5sCl8k2Lis2eE9sGUqNGmXKWfwXAnTC+P7u2DRgh3jf
         DSicNudIX/3Qep1MX8UvnSb+83qxobIs2uND/iEqBKLF2+GB9aeoL4S11xOtlzMnKZdq
         MYSfUjd2ZBJ3FIEN87PcovF3zUT937JeZUw1qrdOMG92E9apVz2XxSOsrnAL3RQEySPJ
         X3dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV3YOTEKocMHBcFteRGeiTC5yOR0fjgQNbiM3xCyIZhnvrcBobMrAwZznsWdGDC+AOzWI7iOYb5Zv0BS4=@vger.kernel.org
X-Gm-Message-State: AFuF++k882xYujtS/nnPAIn6+SOgApLNWfTCvIKHLv4WqqyDB7S32sta
	v3ZzqoHhE0jBy36JUNLYADddM26zpyKdKogjtmTCjf3BA1J6MuSD1qmp/glSlOQlMt0yiXWD+rt
	6VofIpA==
X-Received: from pfbhm12.prod.google.com ([2002:a05:6a00:670c:b0:84a:30be:791f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:35c4:b0:857:73e2:9107
 with SMTP id d2e1a72fcca58-85ed99b48fcmr9375483b3a.23.1788367301626; Wed, 02
 Sep 2026 09:41:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:17 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-15-seanjc@google.com>
Subject: [PATCH v2 14/20] KVM: selftests: Use TEST_EXTRA region in arm64's
 vGIC LPI stress test
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

Use the TEST_EXTRA region/memslot for arm64's vGIC LPI stress test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9a69c439a0f8..9865b204fdeb 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -164,8 +164,8 @@ static void setup_memslot(void)
 
 	pages = sz / vm->page_size;
 	gpa_base = ((vm_compute_max_gfn(vm) + 1) * vm->page_size) - sz;
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa_base,
-				    TEST_MEMSLOT_INDEX, pages, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       gpa_base, TEST_MEMSLOT_INDEX, pages);
 }
 
 #define LPI_PROP_DEFAULT_PRIO	0xa0
-- 
2.55.0.966.g6673acef38-goog


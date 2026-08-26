Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB539E16C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785517; cv=none; b=PGl6XdZS61Y/vrN0IwZtTFHUWmx9pyIq3Isz0kRZrAvKYnEBazT1yzcHU9n5gs06anNHCcmYKXVgDe4U4YzksbOlkEiAIzSERRusbgcUg0UQn4E277zV2IA4CZ5ZeMiX1NIfSNqRfD+9Lq00SFXxf6MGPRUJO28dhoIIH1nv880=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785517; c=relaxed/simple;
	bh=bbwkNrWPELDGGOA1Zgqc6lm5Iyi+SZhGGDW/VfTBloA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gYDF8nZElafgLnIeQ8EoMUI8uYo5W+1V6F0FObb5PuhKpnMKalk1C0r4qYxVtX3WbYzZOHNR0Hj06ar3er29GCquxLQ3ZZ2E3uzqp09pzxJHPNVSAHy3CikTK0wXuiKoG03AEp69wtxLtpPc9wLR/L454tBfr4oJ+XHgaRe2LeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JX4yCNKj; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JX4yCNKj"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e375d9736so61997b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785515; x=1788390315; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4+F4DrSTt+i0FxJ84+DMWU3o/oO2URpTpZf4B4dXhQ=;
        b=JX4yCNKjLmChmqga7y3mrfCXe7VWt3QRCQIrDlVL+CCeukLUyu7inLGVY4dVeIMmMp
         6c4JPSKxdRSLSjkmgV/h1kgTQaoKiQAGdxmzIyz0miPTmBPKfTNdoPzAO4M/vCfWGNZQ
         y2AuvAz3E0cpgM0NgGfMtAVDHg2vYnFdMouiqEDdEBrUz/lyDKOJrE1K1JRsfywUr+e+
         wfnZ83f8MwtdhAJxl2wvjq9X+Xz9OJocXIGMBaK13XZzFecduBho8tlul+ydSWeVOFd1
         dr8cK+od+YX1CdxsExzhOXxdEuruEj++9aAR+IVpMlbkpx2yQM3RN4CCPVDf8rZPUWbw
         wMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785515; x=1788390315;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4+F4DrSTt+i0FxJ84+DMWU3o/oO2URpTpZf4B4dXhQ=;
        b=Ye9wXfDntQcwKfXWvsX5S/tUSbStM3251Po2Ld2tlQJCyDVk10DpDMwWRlHCBsJSTk
         Xu/n6wqRG+KZHMK2ooIfVnYBP5JXh0iQilH2Kh8EiVl+aunFrPdzFJbxCanMHTdhfuSU
         zGKG8CELm8nTQ5MM+p+CrUWePY+yyLuI4gRs53+cGixmljOImePMMgyJ6EEWhKUPvT1x
         HW5iTfMmzy/IzsTzhgzUW3dz4Z0wjxs0tiOrR9H5kOruhVDN4/ec9bzBcqOuhXT7P7Uj
         5XnTCY8mevRVHFU8xzSMao0mqYOqkucjpaoEIrDlXNzuUkhmpKC4yLHwhazh5Zczm0Gz
         G7Kw==
X-Forwarded-Encrypted: i=1; AHgh+RpiPalptW+gHgIQhszeappNjtcKB7UZWa/MOk36iWh1yLqRvu9rneR+nRc5Bx76CyybOoIjlrT+4Ohssww=@vger.kernel.org
X-Gm-Message-State: AFuF++mjju9D4xUl8xMvbhLEXG3gHSnFiDiZ4JFH30/GSyT9UXbC0rYX
	cdf4n0aEq+F8xYPlbgUQKnPTc0iBi+lsiUL4ADTso3GTjbEuvyxF2aD/450sUNFmg2qyBX2G9AZ
	Wadj88A==
X-Received: from pfpk15.prod.google.com ([2002:aa7:9d0f:0:b0:848:2e0e:62e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c96:b0:845:ce5f:c926
 with SMTP id d2e1a72fcca58-85372ea6666mr19057054b3a.1.1787785515178; Wed, 26
 Aug 2026 16:05:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:04:52 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-2-seanjc@google.com>
Subject: [PATCH 01/20] KVM: selftests: Use MEM_REGION_PT memslot instead of
 '0' for s390 regions/segments
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

Use MEM_REGION_PT to indirectly specify memslot '0' instead of hardcoding
the memslot in s390's virtual memory allocator, as a first step towards
taking the allocation type instead of the exact, raw memslot in the
physical memory allocator.

Note, the only tests that set MEM_REGION_PT to a memslot other than '0' are
arm64-only, i.e. s390 always uses memslot '0' for page tables.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/s390/processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/testing/selftests/kvm/lib/s390/processor.c
index a9adb3782b35..fb9dab92d4d1 100644
--- a/tools/testing/selftests/kvm/lib/s390/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390/processor.c
@@ -39,7 +39,8 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
 	u64 taddr;
 
 	taddr = vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
-				   KVM_GUEST_PAGE_TABLE_MIN_PADDR, 0);
+				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				   vm->memslots[MEM_REGION_PT]);
 	memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	return (taddr & REGION_ENTRY_ORIGIN)
-- 
2.55.0.887.g758fc8c411-goog


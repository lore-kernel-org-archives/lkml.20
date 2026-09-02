Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B04AA1C2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367289; cv=none; b=WS5ayKUaL7caUKO34XuJu9aeep6wlvZQK4KC0/Uc2rGB4S2C5QLWuVHta9CjeJsX+fdOQQX+qhxzV7PlrfanNq/by3u9iwVqyzLzUQYj1aSvwQL62XvWpazb4/0aVEwmAFQWZ9SvhXo4Qr60SnjjesjLWin12JI7JTca0P6tms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367289; c=relaxed/simple;
	bh=HSDUOoQrDrmlHFwLRcHbs3L5ZjzaqYAkiuTkthsWXI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MY/2b8Z6BRFV6EwVDZCURaImkd8+9zk2SiS1KQgYMKVkhmtrp5Q2gQgdpw+OFVsKoIJr/05nBCgXqvnlJVDlDHjkGGlwNMOcDwBWdql7Cm9Ikjy/LIX7OsGGS9R9MgnSFdFUG8eYhTaHDng/RCOfbo3OnTu5grAA4v9CpcRj68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JGxOuW5W; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JGxOuW5W"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso17985055ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367286; x=1788972086; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=377f8tXnWvaciY/JLF+PS/DOVpUUGqN5+0rwp4hwx/U=;
        b=JGxOuW5WZ1m8AaDa+yi1k9fePu3TilVix2Uy9+kAFQaWJxbDCfaTccWAjs/Iqy2Pqn
         4WDOTg9vq701lSvxWWGvB5GGleZn1CEq2JUG78EUG5srJbrf+P1a9jlI/Fa1PNMgpqzT
         hJWqt+Xf7zbMCBRulLk76vsowAfNUwKis6TtInQkHIvqMAR/aT6OdzS5o9Rbpwv9WKCN
         L2TJaZghBAuK866SVyxKrnVIl863K6SzHYilykU+Q1JwPEKXNHcopWjC51D0N/ptFcv9
         xjxNcAm7iwmYaHKGlZdYDp+8ogbi/l4EpawEQt1DWFcX22uD6s4r1hnVy6JWj8vk0LV/
         vqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367286; x=1788972086;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=377f8tXnWvaciY/JLF+PS/DOVpUUGqN5+0rwp4hwx/U=;
        b=EaPNjIET2+SGDx1zcrO/iT3tpw7ymL9NCip7sF53h+Hl6Zr7J48dPE1mEw99m3SCj0
         NJenE80snEOTbMKE7IRDG9ZqSSeQpy8BIip8IP5awV5ln/0ZAqMkECv+qwpTVbDyL3+W
         EPHkliD6+HC+X3fomFNQm8HRo9T/zaf2SiiY7u/GtfpF6hwm2vSupOZxWzr+5+TPVqeB
         F21uE69Mu7kQ39s2oOHRvL5UCC6rXcDkyablR2Tcx4jhZXzAi5aDbOJRSIuoZmbodwrf
         ZGwf1C+IA+pGE7Op8l9aay2bpuN4vq5vuKzQz683X6+QOQJvbd3Q03YfO/eLyT6hIRSu
         MLNA==
X-Forwarded-Encrypted: i=1; AKwUvBwxtRz/DuzbUpbMng5Ahp77gddC975GBm69c3Vd4TBy/bvm2Edrld7Hk7HwO/G+CIY3uCDgL/i5KggcRKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n4w2OLyYeOTZUX/Mu0wntncs5kFWFEZHGnMQusi5wBeuaHNivz
	77343XsVyDSoVt1g9VDhK6yeiH1vqlYX2LtqSjFD1LiEyt5VUfCYn+i4RHPtRZsANInuq6GQuYy
	fEacJTg==
X-Received: from plru4.prod.google.com ([2002:a17:902:b284:b0:2cc:e407:8fef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf0d:b0:2cf:4339:aaa
 with SMTP id d9443c01a7336-2daec6d8a20mr100626665ad.12.1788367285568; Wed, 02
 Sep 2026 09:41:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:04 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-2-seanjc@google.com>
Subject: [PATCH v2 01/20] KVM: selftests: Use MEM_REGION_PT memslot instead of
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Use MEM_REGION_PT to indirectly specify memslot '0' instead of hardcoding
the memslot in s390's virtual memory allocator, as a first step towards
taking the allocation type instead of the exact, raw memslot in the
physical memory allocator.

Note, the only tests that set MEM_REGION_PT to a memslot other than '0' are
arm64-only, i.e. s390 always uses memslot '0' for page tables.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
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
2.55.0.966.g6673acef38-goog


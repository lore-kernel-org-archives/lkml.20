Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE8233947
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986898; cv=none; b=aQXMOv36mMeFcA42SaFDjIalTP9ZdoHyrO/t+jdGZIojtvWbIoujJX4lr7vAxBNyxcCWVO86+1bKKQ+izNwyVmwp/JNeK5nqxJIR97wA0NdUDsi14PjFyOXdnkP9gNEK/+/Qek7BTGrp2QKMBUJC5meMB2tw3O9K3RcnbC3KzeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986898; c=relaxed/simple;
	bh=HqTCHRDMdpFru6x9hsQW1qGs5PJb7+vxMhaZ/3Sktos=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G6yCarI6N4URKxsKSRSkhkJFeeepXI85hcH+PVbOURzPwL1Kj6F2HRlWeLhGsJ2hZtuGjQAjfVN4GK+ezm0XhtPMISg7h900CmTOxvSyUABLz1icVUuLwvioV+9YisUy6LVa2duWwLZwRGaAdu95nC3ok2rndBEeWpC9+QtPnY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fso26Zsc; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fso26Zsc"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8868ad2ed1cso135b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986896; x=1791591696; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jojM/RXyQILqjqfcPpQ8uAxcOK5eNU0AKu35ZovnhAc=;
        b=Fso26ZscZdqeDW6RA7hmM5ssMTltOj6aCMo9/pF4CA8qL/w58rv1GE2mvUUbQIcJ1+
         8hgHqvG84gCGHojR4l/SK9HegEMUk/IKVGRSSsTvdSpaEAebUDWItet+QTucA7K6qLmz
         3mqD1bW4VD+FlMCKEPT827nzRMcvSiyCk4kLX5ldUiqVyZQ7SLLU9P16/xYnDJIXHrrS
         lb+/MyRQ5eEEXUEj/AvNElEhkNBZ3wJfTTUyVfyLonJsirfSArqw6VVbvAeR5KkX313e
         /3TTqu0zW8wgzUUdvUU9U2U29y5u6QM5Jjpa3V4MBGn+0UrcTjLPC4KqxmWZYzV9gnRk
         L5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986896; x=1791591696;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jojM/RXyQILqjqfcPpQ8uAxcOK5eNU0AKu35ZovnhAc=;
        b=rCWQmxElws7HJUHl6gcNwDwq+5yR8+LbqS00O5a+cNeDizzB1HGwL+oFA9TuAEXWGD
         5sFar7RRUeI/nz5sk1K238l23ekFD6TqtYEMSW83vTgKgz4161TdOTpuvIdXlK/4V02c
         k+8h3f3mPZ4LZZPwDGYfrl4CopJXaaR1Po5IMEghULDBtV9OQnVolim2Mg46pngyyxlw
         d9HQcd7zG0HtgeHjBZHeQMwALKxtLWIaRCn6JnMYISnvgeTt8ZnnG596OpghsmrYCJ6u
         XIyxBCJyo8Lsi/pHJ6Qr6L9pkEHl8RhGzgzfU7ECxISUL9fQxr2pWM2Mtj3F+1UgzV59
         UJEA==
X-Forwarded-Encrypted: i=1; AKwUvBwWlPWwXdd6v0Eu/kqfF0kIEJ/FPSHhePgS6TMfu9qKZx/mtqTSwDhKU28kCfeWSpV7KIlis1lOwYQvZt0=@vger.kernel.org
X-Gm-Message-State: AFuF++ln+f6Pk3Qtj8FP23HENqfHv4M4afK8oL3V4jAFFzoUZf0gGXg4
	V7IDtvmFJjqR00hLJOA0i2n8tYNUaZEn8GXFQwq77qtI/fSxIBOQ8VrqUCVFdUgf3ArSX7rKahZ
	qImkqeJD20syLWk9qPS8Xyg==
X-Received: from pfbdk13.prod.google.com ([2002:a05:6a00:488d:b0:887:522a:478b])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ac0f:b0:880:57cd:c32b with SMTP id d2e1a72fcca58-88af6659219mr3895203b3a.21.1790986896172;
 Fri, 02 Oct 2026 17:21:36 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:05 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-3-jthoughton@google.com>
Subject: [PATCH v2 02/20] arm64/pgtable: Clear AF with LDCLR on supported systems
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Replace the cmpxchg loop with atomic64_fetch_andnot_relaxed, which, on
systems with LSE atomics, should end up as LDCLR.

This is somewhat overdue. In recent versions of the architecture, if a
system supports FEAT_LSE, forward progress guarantees for exclusive
monitors and cmpxchg loops are relaxed.

Mechanically, I would love to write test_and_clear_bit_relaxed(), but no
such function exists (test_and_clear_bit() has full ordering, which is
also undesirable). Implementing test_and_clear_bit_relaxed() properly is
a pretty large change; use atomic64 instead, as pte_t contains a u64.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 763c5a411d64..e47c3d010715 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1252,17 +1252,11 @@ static inline void __pte_clear(struct mm_struct *mm,
 static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
 {
-	pte_t old_pte, pte;
+	atomic64_t *pteval = (atomic64_t *)&pte_val(*ptep);
+	s64 af_mask = PTE_AF;
 
-	pte = __ptep_get(ptep);
-	do {
-		old_pte = pte;
-		pte = pte_mkold(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
-	} while (pte_val(pte) != pte_val(old_pte));
-
-	return pte_young(pte);
+	/* Atomically clear PTE_AF, checking that it was set before. */
+	return af_mask & atomic64_fetch_andnot_relaxed(af_mask, pteval);
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


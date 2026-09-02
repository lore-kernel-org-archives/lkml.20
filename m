Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA5471255
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346294; cv=none; b=hTN9UWzl6xb/STwaNQk3f5tYsZzU7wrSiL9ktZxdlqT5Rc0Vs6WqRSCDWlGvJtwrilNffGK1a4jIQS+zw90VjoJbO9HTUueUjSNSzTbDFf6GFtiV8byUQNOtbkCf+oJDksKdmvS5XtE2f7muh0mfm7DSQCfWUhq79cOZkqU8rSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346294; c=relaxed/simple;
	bh=nMu6uOIdcSiaN+JYugdLeZy5798bpsbb/pHYStuoqbU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WDKwZ9Fw1ifdK+VitvhRy7wOmKmPxZA0Y8k7Ho+DTtVqc6P7d2xs1dvF1+C3RswJ8KPcLRJebiIfyWBCdS+HlM7kwEp+Lushi/L9S+wPOISZPv0FJ0AjXZ4D1f2Q6uN3E+TpLJ9oXNUmx1BlK6/pm9qXI7FtnQWjjCAExIsokv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u3PXF4vQ; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u3PXF4vQ"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a57aa07476so1034732a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346274; x=1788951074; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gODwxuTtOVKQ6CMnGDMT0l3+wYWk2p1Ok9ZsUXJwJCE=;
        b=u3PXF4vQsvb9b6DDt1uaqig+t6k0iJ0rZtFkFFlH2UTJupC/ymMzaK/xSrL/FmcT2U
         9ODi9WZk1WG4X9Jj4TF0vigTq6t0W1UMJ+iO3XibVmfxi9j3Q9s2gWWCug5u5JPX3sjI
         8IZBH5AtoU3bnhtKn5NATG9NE1V29igdbUDAgOOk7tJug5lwPpUZgJTuo9z5WoaOuHs8
         AVQBaf7aux7ECtZ5LCUXIGgsZ8NU/XxzqhUk9aBNSAk/jWH8CLCfDbIJVac9JZfd3wNd
         JT+KQrJfXC1Wo+vCqkRup/sf9vLdhJdEuqInv5MkEr1Du+rbQ6V53WxFD88ZS7fCnkQh
         yEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346274; x=1788951074;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gODwxuTtOVKQ6CMnGDMT0l3+wYWk2p1Ok9ZsUXJwJCE=;
        b=V4YrS1OaDK+JWaMHJd8V1Pk0/MhsCxYgLgyIEsnR2SxsFIytok/foUn6oSDvLU9YDR
         3fAPrYTcR6XfBZWoTUqZf43UQCM6UTMKnnx6S2l+DMr8AuRCiyaQ9uW3tW0Y8U/iAklo
         WsmxiHgkvNmA0gKwB80RFLxYZ7/RbTvP9AZg3U8SKp9vyuH/f3NdXQ3yKenIf1k56BCi
         h31bees7jb9ea7ABjQOfphSmxQjmgREbY9HJtMT4MO4umhNooSQJKCdFhqa9H91jkBqp
         iokwag2bQs+dWYjuqulhpi0zQWf9nXfwqCYEr17dqgO39ObQwG0MiM+kMnwix4MZY4iR
         PaPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4T1ry3EFti4GqllUVopRErQRKAhq20b21SVDG5HpagVcT362Cj0OnZbreVp78Xx9sFq+vMYzW4Rplv5U=@vger.kernel.org
X-Gm-Message-State: AFuF++mBjFfVwMY6uppMf+K3OKa3P6Ny6S715zlVnoP5S2FzvRkRFdEI
	xef6kMox1B6H6zcaS57ePG4DtxoTkKd2h4zwheUqNJSVijMhrP0QkEY1BehS6IFDr74+/Sb+unm
	QAWWlT/uanoSrI0FvVJxjuA==
X-Received: from edy6-n2.prod.google.com ([2002:a05:6402:5346:20b0:6a6:8ab2:8708])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4284:b0:6a6:32f5:ff40 with SMTP id 4fb4d7f45d1cf-6a682af8134mr2906512a12.20.1788346274084;
 Wed, 02 Sep 2026 03:51:14 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:08 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-7-vdonnefort@google.com>
Subject: [PATCH v9 06/10] arm64: Implement can_set_direct_map_range()
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

For systems where can_set_direct_map() is false, it is still possible
that a subregion of the direct map can be modified if it is mapped at
the last-level. Add an implementation for can_set_direct_map_range(). It
falls back to a page table walk to verify the mapping level if
can_set_direct_map() is false.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..1a37f4ef130b 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -9,6 +9,9 @@
 bool can_set_direct_map(void);
 #define can_set_direct_map can_set_direct_map
 
+bool can_set_direct_map_range(struct page *page, unsigned long nr_pages);
+#define can_set_direct_map_range can_set_direct_map_range
+
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 58898ae53f5d..c59ef17eb0d0 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -103,6 +103,48 @@ bool can_set_direct_map(void)
 		system_supports_bbml3();
 }
 
+bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+	unsigned long end = addr + nr_pages * PAGE_SIZE;
+
+	if (can_set_direct_map())
+		return true;
+
+	/*
+	 * If !can_set_direct_map() then no one can split blocks and it is safe
+	 * to walk the page-table lockless.
+	 */
+	while (addr < end) {
+		pud_t *pudp, pud;
+		pmd_t *pmdp, pmd;
+		pgd_t *pgdp;
+		p4d_t *p4dp;
+
+		pgdp = pgd_offset_k(addr);
+		if (pgd_none(READ_ONCE(*pgdp)))
+			return false;
+
+		p4dp = p4d_offset(pgdp, addr);
+		if (p4d_none(READ_ONCE(*p4dp)))
+			return false;
+
+		pudp = pud_offset(p4dp, addr);
+		pud = READ_ONCE(*pudp);
+		if (pud_none(pud) || pud_leaf(pud))
+			return false;
+
+		pmdp = pmd_offset(pudp, addr);
+		pmd = READ_ONCE(*pmdp);
+		if (pmd_none(pmd) || pmd_leaf(pmd))
+			return false;
+
+		addr = pmd_addr_end(addr, end);
+	}
+
+	return true;
+}
+
 static int update_range_prot(unsigned long start, unsigned long size,
 			     pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.55.0.970.g62bdec98f9-goog


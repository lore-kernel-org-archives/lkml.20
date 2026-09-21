Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529E3905EC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988464; cv=none; b=oYv5tC8k5wGb1QKvz3SK05p371Mx8yz+7pDW7dk988og8KUkVuuqOUDM6KOx6W9af4Dv0ITh2jMWpxem75Rq/maaNqN1+Tqpp8kizByaYKAVjzpzaFvoQqdksJvi1vK20ZOflI69zZv9zapVfZuT+NzxS6vbmNV/iaNF/exKF/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988464; c=relaxed/simple;
	bh=g0ILEDzn/1wNfpkkWXZLtbOtycO1ck/Djp6L7YWIBhE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U054TMXlC+6KIlPotWi7GWni1aMzjGSj25rBYL7+zhHb43XrNXstcW9eMRt/VJ4uo4L2CHA1E+PXpV08oQCtzTtDyz0EdzDKSQGHndJsxQqhP2MaafctyAeGtY10EbqTEk6ygVJj3Np2mZCHdyyb3gYjSNSuloMk3PHc/a7+bOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tonceGiV; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tonceGiV"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c251c140b41so258991966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988460; x=1790593260; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8VZDFkjWzOugDjBak5KEVL2CvMFyhCyJVy2+GxZNxI=;
        b=tonceGiVClfq6MVltEgM+sw5FAN15jwnd0xaABp3ozUFvSgqC2Q2kqYD4xlFrTVQvf
         Sj7w1P70z1emxHgK+lEERLIgtbHZZu29b+4FzX/qtGK0U84aKqWmWZdT3wFkZbnZwuRq
         s6+capGZp5BbjgR1ific1jR3fg/KxUyE+uENLEp0SAD9Ssn7Un8R4rCVmQN3V6EaoA0l
         ZXadtBpT7eb9zujRD4d/bIzn31MHiHxdMcBYqPzuegjC0XO4XTn4inGPzf7agS5EMFGV
         GHraWUhya9jjiAO/EP0rQ1ClNV3Xm+NreNHnEQduEhvycUVFqjFgFjTldRZJxr/RXrVL
         yHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988460; x=1790593260;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8VZDFkjWzOugDjBak5KEVL2CvMFyhCyJVy2+GxZNxI=;
        b=YLCrGgSgI9gPy5EuLbnF+G1om9Q6XKNuBCt4kq4J4naM0l15wWtcGGTSpcICWm/q5p
         vmBdxxNkzwpWUvoAujA7dVpklZVn9/ftEcgdVX0C2hHn630aw3zbA8CwmIO0OeIoYmGG
         gEAqGRms+njBlG0DEF0k+9sAbcAAJEu48BztCZL/WHSikIgDO/akZIUmNMCnU5lh7Oxh
         Boe19SSJuhvuyKJ+27KcjTZTNs0JtaMt0kl37dPArrNY4TP6ev0WMQtkw73cCr/P/LJZ
         6jJr/XG/CTxoOlZG/NmpT1gJ3y8V778fIzX+bS73TS7MCZe30gZo8wMDrOrXtlbO8QcI
         D+dQ==
X-Forwarded-Encrypted: i=1; AKwUvByKcYg7QMIvO6uRuQeOFWrZ0tZpO0XG7Kl/cOQXbgcSIfp1FJUtulBsYAgiP4YHLcftE6tcXaH4qDqIiEk=@vger.kernel.org
X-Gm-Message-State: AFuF++mBZ8rncZh0ydLAuR+1IoTaIzham8EkUW4NXUQRrZ71821z0ZHT
	O/HiiEQYV/kZabL+UZKwbHCs+kSDC59PD5D/gB2Tyh4fl35eQMBxiwIL1u7XMqrE7XnN1S3ePWn
	HRy2rHDvEwd27oov6xPgQ0Q==
X-Received: from ejcew23.prod.google.com ([2002:a17:907:9517:b0:c2a:25e5:645a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d17:b0:c26:1649:47a5 with SMTP id a640c23a62f3a-c2a15aeb6c4mr860923766b.27.1789988459841;
 Mon, 21 Sep 2026 04:00:59 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:45 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-4-vdonnefort@google.com>
Subject: [PATCH v2 3/8] arm64: Introduce __set_direct_map*()
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

Add implementation for the unsafe functions __set_direct_map*(). They do
not verify for can_set_direct_map() and expect the caller to do so
beforehand.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/set_memory.h |  4 ++++
 arch/arm64/mm/pageattr.c            | 22 ++++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 80bb94a340fd..5e372a02b825 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -16,6 +16,10 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+int __set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
+#define __set_direct_map_invalid_noflush __set_direct_map_invalid_noflush
+int __set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+#define __set_direct_map_default_noflush __set_direct_map_default_noflush
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 5fcdb292905f..3aaba7f988ce 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -301,28 +301,38 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_PRESENT_VALID_KERNEL));
 }
 
-int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+int __set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
 {
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_VALID_KERNEL);
 	pgprot_t set_mask = __pgprot(PTE_PRESENT_INVALID);
 
+	return update_range_prot((unsigned long)page_address(page),
+				 PAGE_SIZE * numpages, set_mask, clear_mask);
+}
+
+int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages)
+{
 	if (!can_set_direct_map())
 		return 0;
 
+	return __set_direct_map_invalid_noflush(page, numpages);
+}
+
+int __set_direct_map_default_noflush(struct page *page, unsigned int numpages)
+{
+	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
+	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
+
 	return update_range_prot((unsigned long)page_address(page),
 				 PAGE_SIZE * numpages, set_mask, clear_mask);
 }
 
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages)
 {
-	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
-	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
-
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE * numpages, set_mask, clear_mask);
+	return __set_direct_map_default_noflush(page, numpages);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
-- 
2.55.0.1082.g2b9226bbc0-goog


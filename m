Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62F1471CFA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346286; cv=none; b=IgW4RKt2cZLk1y/OGUSboJK0ne6LEXqDS+4ZyKwTmTw6mFYsSkzI/wo15WrZUyPnB7VJ/+1PmxwM9Otma1e56pcyAFycT49r/imIEPCk+h7/2aeweeDthAFqnwSDT+09F8hHYlHAgc4FQb/1eT9q8C3vVVDwJoZsnJngLoVd7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346286; c=relaxed/simple;
	bh=BkWHB+IxRJyp/mrL2MDxtxRI3LoQB6qxpIKEIBvf9+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U+qCGRklw/fhpv0LVJi4Us9Xl+tGgS94fA4h398PtElD2XOv+OvYs8dk7flQeMw4qRsTGPVbZbgvs35zYkNnJuvgpcoG5c2mEq4DRMeGboii6pXdVIJ+7+AwSunuBRHUgtTkKZoH7nYJ43VAQ3O4fN5fTZHZed0C04iKxTeyv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BFKpjqZG; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BFKpjqZG"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so10256865e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346275; x=1788951075; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNWZLpQFf8So7isbdfRHNiNRkktdYQTRcSFjKmsQSY0=;
        b=BFKpjqZGG9ZFudht7p8ohZUiD42cVUS8Mx1ongokDof2Fn9NyBS9ciAixLiPp3qyys
         o+kaLmLXT4bc+NHKn5eHKho60KauP+ghtv8AblQKLbyT/JmO6yJKrgL2RAlWqo7tgN53
         NWnCcxfVUumyyNBWGMH5qEQLvwsD+aOQjQwrujvXC7Ufk/KzZ52z9EHkzCoEIKhVjwDu
         u7IhAdkZkSHQBo+kYO+62PylsK8ePSwoh4HFNoUDPHNewrWwpv42Gs1109obDhnyv1XV
         s4aaRoe6Pmecx6KkO1bXXMrQGvjBNFcNMkitp8sIy3uA0Nk+qJ9evHvlg7uZKaJse6UM
         uLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346275; x=1788951075;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNWZLpQFf8So7isbdfRHNiNRkktdYQTRcSFjKmsQSY0=;
        b=YOoRBIyeTs6sp1mi9aOC3CadPUbf7aohumqok1m26pBPb0qpw2222GZSvf+Ue8JwJa
         41wg01SqjEBcaXdNfqQP0ke6jQ49edZuRb49nfS8/uvHIaC2OIJwE+s9I13flSsHyvGA
         rl49vtTMwtYNEUUG3WDvAbxHMpUHsFLsDvsLuVC/xd06ZDrtCZInFyLKID72EzQhpCdk
         OL6CuhGOqoRrsgdRc11N+jB6+ydAsrWgHiBtzAhQllkrargEXFBMx9iglfUtage2kPtM
         FO45OWUAlY/jz5mXpWJtg6a5FgukYoW1CiZCFNViNf5I+QrMenteZZiAOrR/9LZ0ZrfJ
         UkHg==
X-Forwarded-Encrypted: i=1; AHgh+RrU0Zm8/Uyt+fI7V7j5AeclWuqVbRAZXUThUkeeXLHiptJoQYZ6cCyIernUhCaA7ES77CWIGRoIn5seH5E=@vger.kernel.org
X-Gm-Message-State: AFuF++kyVEnr7HIb61Yr2ZL+abWSKIgCtEr0OqsCCqTGBph0jobipRwO
	//EvA8f5bGALh2+8GqFeRBFbcNYMTFwzQhEMM/8JtTZxsep8QqbqZ+lBI2urUuAPfg1P9SUyRLw
	nS/y3TTHr9UuwphV5SzKqBQ==
X-Received: from wrpe17.prod.google.com ([2002:adf:f351:0:b0:484:3204:23be])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e93:b0:499:cd34:100d with SMTP id 5b1f17b1804b1-49ce57f5235mr66954815e9.7.1788346275192;
 Wed, 02 Sep 2026 03:51:15 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:09 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-8-vdonnefort@google.com>
Subject: [PATCH v9 07/10] arm64: Implement __set_direct_map*()
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

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 1a37f4ef130b..080a40846bbe 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -16,6 +16,10 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
+int __set_direct_map_invalid_noflush(struct page *page);
+#define __set_direct_map_invalid_noflush __set_direct_map_invalid_noflush
+int __set_direct_map_default_noflush(struct page *page);
+#define __set_direct_map_default_noflush __set_direct_map_default_noflush
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
 bool kernel_page_present(struct page *page);
 
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index c59ef17eb0d0..28adab0edace 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -294,28 +294,38 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_PRESENT_VALID_KERNEL));
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int __set_direct_map_invalid_noflush(struct page *page)
 {
 	pgprot_t clear_mask = __pgprot(PTE_PRESENT_VALID_KERNEL);
 	pgprot_t set_mask = __pgprot(PTE_PRESENT_INVALID);
 
+	return update_range_prot((unsigned long)page_address(page),
+				 PAGE_SIZE, set_mask, clear_mask);
+}
+
+int set_direct_map_invalid_noflush(struct page *page)
+{
 	if (!can_set_direct_map())
 		return 0;
 
+	return __set_direct_map_invalid_noflush(page);
+}
+
+int __set_direct_map_default_noflush(struct page *page)
+{
+	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
+	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
+
 	return update_range_prot((unsigned long)page_address(page),
 				 PAGE_SIZE, set_mask, clear_mask);
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
-	pgprot_t set_mask = __pgprot(PTE_PRESENT_VALID_KERNEL | PTE_WRITE);
-	pgprot_t clear_mask = __pgprot(PTE_PRESENT_INVALID | PTE_RDONLY);
-
 	if (!can_set_direct_map())
 		return 0;
 
-	return update_range_prot((unsigned long)page_address(page),
-				 PAGE_SIZE, set_mask, clear_mask);
+	return __set_direct_map_default_noflush(page);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
-- 
2.55.0.970.g62bdec98f9-goog


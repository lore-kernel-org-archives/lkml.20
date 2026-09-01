Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8AD47A871
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277893; cv=none; b=TKc02TiplTU6G/7MWfnXUS2sYL0KT1Fi9aAk48Q9060l/IRvMMjdL3QCVqrmUn3GoPuP1HVw89kqKC8wAkSQIBhjWgbamw8xT6QqhPRMFp4c81BU8wAVUeZCpCLXxPiwuR2rx1HlICa/Qe/nVSv52xXtQTawy+Klm3NEzRKGHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277893; c=relaxed/simple;
	bh=9Xg1mYTY71JWy+0ejzUul8PAG4NMQUH60bKlfKZvQtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOTYazEunNxiJjXYwS8HUTTUpqw9OL703TR3uvcQ6yt8ucR5cG+0v57IaElKnpsWYuN5wJ4fYpdNhG3HSWvG3IBkTNVFhMR7ZGUVxtdhaGwhzHwg4xb6U6Q6jbmrql0jaLA/hZnwvYBZfEwIsJDms22wwMJcad8xW2v4aplBu1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fs3vwwxt; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs3vwwxt"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-836ce6cbe1eso995857b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277891; x=1788882691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WrIjHrUzfeSmnNpoFpFwykQuRi2himcgHlf8T243BI=;
        b=Fs3vwwxtT1g5YoAvrgGkG4+tMB+fGoV+DWIdJPrsYwnafkW19240OpygTAUnnS6GZT
         FVBD6wwZ2nUGUCDF4zbCS5Th6HF9hjpqW03S3AGwhC1X1IParzhQcjo8QJgaPgtDpcIe
         +lPkMiYfU1Iyz9T9AoRXihBG6zslppuQIR/ae2WdZ63UXsPH1Md1y+Zmh48eQZjTTJzl
         9NLuVdtIsn35HDjzI3h3exVtZ7vluTjO1qP+KCqllRkO+uN9g7mBdqdBtaOU2o9QEoeE
         kHYmgokqX+qQrjAzCkIRxlEnCf3M8zcawmvOShlG8OC6nFXSv2/vrWH6EePlF+M0aCGQ
         dPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277891; x=1788882691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WrIjHrUzfeSmnNpoFpFwykQuRi2himcgHlf8T243BI=;
        b=eSU/FCSgPPSxXCTaJefBiquiEmPDhRRAKK6eRPEbqLelZ4iphUpO+ZzTh2ape3ecC8
         vLFQpXlzurpT4jaCn5TbNNkyFlZ9OaZwJHAfRhf3opkkf3vMereDChT7Rq2fJpKwcAbO
         wPtJZpevzC9yq5W6Xj0vEZ4AaZz3+Flc6u8xvHIKC9VUl28BJVNRIFTFsv+Undo1fIeM
         tvYSt225R5OzUhiScSkmrgmDOMLvSwBWbntwQvrwjS/M9JmiK5AXdT9M3qz/i6tTYB7S
         rMgtxkw0zw0sUn4j5zW/5llHpMWGLed6L+cZ3JBkfX29BlnldxLyEHMxeHNkkAbQT2hf
         rFVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+Hh7htVNqK9/2mt6a0D94B8DKuADP73llFEg7F7xO5lWkbQuGNZq5fCC2r5fpc35H70Lp8XX/fK6nuN0=@vger.kernel.org
X-Gm-Message-State: AFuF++ll3Lg5ku7Qsg3LslAvmW0jj1fZ8eZOOyTP6P/16VJBSVGV2rb7
	D1a5osGMEMmPQkhjHXPxm088JYNWF00WDJX0Y92cZY/4J4aENdiWvwHzm50W2A==
X-Gm-Gg: AYBFou2eeGpy4Fjzh7+zgkkOULtPvVC1qRPh2NfQ8Q+fVjm6/zJslSqtuilgvhELsqb
	7CRiT9sCmAcItqCl6Y7PmHmS4BIaOFp8A255Gy3YFe5eftO7sGCCk8/+p2KaOSwalofjCIVLa/U
	sT/TMMn41PuMA8vrimz6UzHYRIiwKyAKttJ75fPWYBF9vEmsQlvaFlqfv//E7cxb9GvtxI0v0P3
	3hPNRF9GPwHLtCVAWVlNIz2LhVcae5tyHFk+sGkEMrrZs2yy0lQs8sgIB50HC/BPypWWdmDdBo1
	wDKMGh5oh68a5oBnBSt1HNR5xJ7eyPqqeQnW5xBjND4UeyWqgcZjvUNtg1bOG9myDguf9iPMa2g
	d5IlArsoEkneUEy5WgsSDTl18Df7bmQRU6f7095iV+91zvedzcHezId794XWNrhXaU9SFMU7hSN
	yAdjz4OVX1qqLxI1pYhGVisUbSiv5XCScfz+zZTb7nRCVHsof7lbfhCjwoLPWZkigF9sz5KxsGK
	xVzWsRGo8cPzYm313wRjjnzeGdlU+5YVHhnJaxc
X-Received: by 2002:a05:690c:60c1:b0:81e:695b:585c with SMTP id 00721157ae682-868701f7a41mr40689507b3.4.1788277891125;
        Tue, 01 Sep 2026 08:51:31 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1cd5bsm76405047b3.17.2026.09.01.08.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:29 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/24] alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
Date: Tue,  1 Sep 2026 11:50:27 -0400
Message-ID: <5ad0fa4995f9b0e6aa4af672e987a9b9ee43645d.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the page table check helpers needed for CONFIG_PAGE_TABLE_CHECK
and select ARCH_SUPPORTS_PAGE_TABLE_CHECK in Kconfig.

Alpha does not support huge pages, so pmd_user_accessible_page() and
pud_user_accessible_page() always return false. pte_user_accessible_page()
checks for present PTEs with user read access (_PAGE_URE).

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig               |  1 +
 arch/alpha/include/asm/pgtable.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 4c38405cd6cd..d7e2859aaedb 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -17,6 +17,7 @@ config ALPHA
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
diff --git ./arch/alpha/include/asm/pgtable.h ./arch/alpha/include/asm/pgtable.h
index bdff33b505bc..310361920a1f 100644
--- ./arch/alpha/include/asm/pgtable.h
+++ ./arch/alpha/include/asm/pgtable.h
@@ -232,6 +232,22 @@ extern inline void pud_clear(pud_t * pudp)	{ pud_val(*pudp) = 0; }
 extern inline int pte_write(pte_t pte)		{ return !(pte_val(pte) & _PAGE_FOW); }
 extern inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIRTY; }
 extern inline int pte_young(pte_t pte)		{ return pte_val(pte) & _PAGE_ACCESSED; }
+extern inline int pte_user(pte_t pte)		{ return pte_val(pte) & _PAGE_URE; }
+
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && pte_user(pte);
+}
+
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
+{
+	return false;
+}
+
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
+{
+	return false;
+}
 
 extern inline pte_t pte_wrprotect(pte_t pte)	{ pte_val(pte) |= _PAGE_FOW; return pte; }
 extern inline pte_t pte_mkclean(pte_t pte)	{ pte_val(pte) &= ~(__DIRTY_BITS); return pte; }
-- 
2.54.0


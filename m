Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1654A7FB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954960; cv=none; b=NBJXH6q7tM0xzbevWF8lT+Z8oLfUmkyHEb+h66vvyPiPStJ4kbGtRcD8sMvlP/R92spTwYA9Dnoj63aDa32SRX+syUfYEE6Cdbqy++ke4d2kHMcSgoUJzPsJlK2z7f81/M5O8S+CVVdU7BSzirZzKeS6pROFyeFN3idFM5iDsB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954960; c=relaxed/simple;
	bh=sGZSDI9LoB4j8Q58me441VivPfwEK65+W5D4R01Y4jw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s6SKB6mgWSQ8/oQkJb3IJUW2imvlfaVL/tZBn/wt10mM3ge17HGOZ1ETjhvRC5bCrSQputXo+7sTmDz1/0onIDZowb5IRKthetrKzotZqWSipO9F/r9Sbp2KOMqzTLlljHqiyq1bSwaifCNNKqvRaoOeHljj2rLjLis2XPr3WZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=viFGTJg/; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="viFGTJg/"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c251c140b41so404018466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788954956; x=1789559756; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8G2xiGwGscqCz2TsV89VXPggp4ynR4SYjKKcXLzYJM=;
        b=viFGTJg/ClyL8LKBVVDztDXA7aBs2dnWkBLyL6ykO5nQK0cmevhFGlnhjEUomrSABP
         XBASyLQWt7fEk7f5lPtiwfAKWqZB1ci2crYfVYCsH0dTlszSaIYDbKdEn30m1f4sLjEw
         aF7BbrcH2BqtyleROj6VPx20S0n28TYh4v/DyhdLz6gsoRe7dkYFea3IqjU3zkB+GGFe
         MhS0cnWAor3PuttfhKCdQQlE51fLWWOhTu6r/en+3kbDvp7Hzazv064rnm4+0NVEhXXx
         BuOElkhxIJSr7fGP1oEsF6HCScWaqpNuQm6y+SwaIPMiaHUq9HPzMrvwgrO0mSAxtOBN
         G8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954956; x=1789559756;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8G2xiGwGscqCz2TsV89VXPggp4ynR4SYjKKcXLzYJM=;
        b=KQcVDdcyRtFUF3rDpz4QDyKNu4/kq6sziM23oIxhlrQSoFp46KD0ZGvBbqeFzXYZn3
         +sfjk1xl4+hVK2iil0yHahnuWz3I0Jhf3dsTK7hEb5VwHfoPx9IMAmEUiKceltuMVPLr
         EzwYQOqRelxmJJmzqfDddhwkqX2YSg51+pXK9Ah6A9xyyazxO0Z0pQHjGvoy03qI21e7
         fCD5UL8VRoP78mMOUmXmSKDyffI+MqjITNuRpvtfZ6Ca2OBbTC1hPdBh0ErsLyDcK6f5
         vI5Mvrwbm4NAv5KGh5KTDxZ1t+2N59WMHOrSxhPZ3tdBu/k4qL3fE07kxFIRdKAuQraS
         5dFg==
X-Gm-Message-State: AFuF++mYR6EWxxdgeDh4Qa6p0PDJiLb+DmtJ47F0VmSVvIWKeEr6L292
	2wx4xoptGTA9SRpc/4AYYfVBK7bpItKVYDe+NSH0fqBL8Ot7/WpkP4piEzcl+NbFezmdVtT15Q=
	=
X-Received: from ejbb16.prod.google.com ([2002:a17:906:30d0:b0:c29:3b60:12fd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:2083:b0:c26:1649:47ba
 with SMTP id a640c23a62f3a-c26164956afmr846902566b.48.1788954956190; Wed, 09
 Sep 2026 04:55:56 -0700 (PDT)
Date: Wed,  9 Sep 2026 13:55:32 +0200
In-Reply-To: <20260909115530.1924665-12-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260909115530.1924665-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537; i=ardb@kernel.org;
 h=from:subject; bh=jHiqT7EJ3nijNDYj+fN+c7L8/vUmjy+4wIUAjyL6m/c=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWuhp4kAjx6TWD23a7nuIsmEa/eN34avUfQz3relLKGfP
 9f10oWOUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCcJOZGP4pdZRman658sWTM2a7
 uvm+3sCXUoVx5hcMbojIf1A+ePcsw18xGUH724VXPkrt87lzTs8t+pXXJl5FIaaq/Lu5iR8m9XI CAA==
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909115530.1924665-13-ardb+git@google.com>
Subject: [PATCH v2 01/10] x86/boot: Drop pointless re-implementation of panic()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Vincent Mailhol <mailhol@kernel.org>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The decompressor has its own implementation of panic(), which is based
on the vsnprintf() routine provided by the EFI stub.

Relying on the EFI stub from code that does not execute in the context
of the EFI boot services is a bad idea. It is also completely pointless
in this case, given that the only user of this version of panic() only
passes a compile time constant string, without any printf conversions.

So use error() instead of panic() in that case, and drop the panic()
implementation entirely. This is needed so that the EFI stub's
vsnprintf() can be modified in a manner that is incompatible with the
expectations of this caller.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/error.c | 19 -------------------
 arch/x86/boot/compressed/error.h |  1 -
 arch/x86/boot/compressed/mem.c   |  2 +-
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/x86/boot/compressed/error.c b/arch/x86/boot/compressed/error.c
index 19a8251de506..ce5ed7d8265e 100644
--- a/arch/x86/boot/compressed/error.c
+++ b/arch/x86/boot/compressed/error.c
@@ -22,22 +22,3 @@ void error(char *m)
 	while (1)
 		asm("hlt");
 }
-
-/* EFI libstub  provides vsnprintf() */
-#ifdef CONFIG_EFI_STUB
-void panic(const char *fmt, ...)
-{
-	static char buf[1024];
-	va_list args;
-	int len;
-
-	va_start(args, fmt);
-	len = vsnprintf(buf, sizeof(buf), fmt, args);
-	va_end(args);
-
-	if (len && buf[len - 1] == '\n')
-		buf[len - 1] = '\0';
-
-	error(buf);
-}
-#endif
diff --git a/arch/x86/boot/compressed/error.h b/arch/x86/boot/compressed/error.h
index 31f9e080d61a..87062dea9a20 100644
--- a/arch/x86/boot/compressed/error.h
+++ b/arch/x86/boot/compressed/error.h
@@ -6,6 +6,5 @@
 
 void warn(const char *m);
 void error(char *m) __noreturn;
-void panic(const char *fmt, ...) __noreturn __cold;
 
 #endif /* BOOT_COMPRESSED_ERROR_H */
diff --git a/arch/x86/boot/compressed/mem.c b/arch/x86/boot/compressed/mem.c
index 0e9f84ab4bdc..e1c017b55184 100644
--- a/arch/x86/boot/compressed/mem.c
+++ b/arch/x86/boot/compressed/mem.c
@@ -37,7 +37,7 @@ void arch_accept_memory(phys_addr_t start, phys_addr_t end)
 	/* Platform-specific memory-acceptance call goes here */
 	if (early_is_tdx_guest()) {
 		if (!tdx_accept_memory(start, end))
-			panic("TDX: Failed to accept memory\n");
+			error("TDX: Failed to accept memory\n");
 	} else if (early_is_sevsnp_guest()) {
 		snp_accept_memory(start, end);
 	} else {
-- 
2.55.0.1003.g10538fe699-goog


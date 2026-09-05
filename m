Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084A374E79
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788648928; cv=none; b=IUtV48rXGH+2d3q8oyuemGEbfWX8duWAdHHH0dyvISVTBKCQuBCvAgm8QYbfQOJwt5B9PJvnqXQFHg7g7facjhsHirw4tdpmyh8FicCoKkuCRdvbqf5aROym6ZQ03Y7w5DPrxRMoEN5i2GF587i1azu8QZJA5Z+uJ+SnMnM68WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788648928; c=relaxed/simple;
	bh=XS4XMdFUvg81E3l2j9Jg4koF20RK8SyqrHXd2TLOUXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EI8ma3cmZfnWDmHukCtkZ8ny9CASrEMBzIsPUGQ3uCCacr8NXV1z6cAf0iAlafa/MAqU1xUTyDUC0nI8Qn8q6VtUQMuDyo89K3biILFNtaaDkMeG+e7LClTr4twCMxiRtbnUDMmUzWsUCwgzPff9yNBStGEDEy8E5FLACDEc6RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFrv4Axe; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFrv4Axe"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8588583a7c3so23560617b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788648925; x=1789253725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Ru3IwpQjHIwS9TbLkhRJiSsP3088o2a0Klb7snW/5g=;
        b=OFrv4Axe6Gsk0Janv45eVWPvSa1Ns65EK7evbsP4UQwC9PcZxzsqU47N3szgVethBx
         g/ql14NlxoHqcqGUbIYgjOXpz/XcisrtmTQ7wnhIiThNGwgAETKIFnRnXkj1MWL0sy+J
         AFgb+E9Smv556wMOKLNwmEXh2sBeA1rQYjJo4p3639D4B9//YfP3HUqObBcEc14ffu1c
         hLxemwCNHQb193mDkM1yHKLk3A7Sndn1GfMdAt7rGprtoiCr9UXdqz+DRHEUgxieor67
         DM6+WuchRjlDzGQXb1RLhIMemn1+WZOcXonMn9cgvR1/MYMLupicC4ZE5wEc9NfUnlQH
         TVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788648925; x=1789253725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Ru3IwpQjHIwS9TbLkhRJiSsP3088o2a0Klb7snW/5g=;
        b=NBaqTbKrLvAY5ktdYwtPeycZlrEh/e01clyu90xcmtUpniPMqRg7GhWRBX+ATeJLAK
         g3f7bSVNoxJZFIUW7WcQuFXAbIJrr0q8QE3UUEbhBiDszqmKj9wFfVLLaROxr/phc8O4
         1jddHaXKH4NFljabGzmDUzr94byO0TTWu4usz3Dsv3QvhhHkg1LtJQmMQTIiTgCZFs5v
         0OPJ0S+GskG+G4cz9DJFIvj7JIaUcF5d52UtyFdvwrn4FdFHRYrIIjFXB5C7WQNgkzQ7
         EYNtp4o5nZf22A8sn0XnVH6ZINEEwqSEhaPdmMAwTzkw7cqGIlwugPmIuPsuD0th+35V
         /IBw==
X-Gm-Message-State: AFuF++mfM4btQouuLquBnJUxyyaRvk7heDYH/eGda//emV8jQDJ6eScl
	dhacaa5jRIwPBfiMiO881mfavdoafwRrDVqfQ+pOlXtLhcNE1AT8V1RrD2jZ
X-Gm-Gg: AYBFou26BlFcpKjtmyafkCbRNRFccgbNhd9WkiTryZ5okxL7p3bEXBRogj0eZTrkyzE
	59489tHgIlIfTaaVRiptb7VNtGS4YvwpTll7ISBNx2jwcg4Ct/KM4L1/JQ+fVA/kiPtq3grhf8R
	MY3pcgFeG6UE+2d+upOhWfv8UC2LlOcNCpDDYikneDoD2NOvRR4qDU0NbWelOFaJyIAnlyRqGcH
	RrfxtRoqzBw396w1xo41pfyLrikl27QoZ3CznFFNQK04mlrnoBleT5OJsRoLQlVWEfxqvTL4vtm
	QOO/nERSn3pHDIBwcxgdp/OWFm76PJBrqu9aLuzGcmLWGwIxrdxF3gZhLuO5/6nDdsnx7ERgEWo
	6kKf5VpMDiGv/KxS861X67Co1U2CnnxkMdgBkQYnm+nm95UXQqZjKbiHfSEujkMBsNsZNRDi6ru
	z5J7ZhD/HrYjYOnTEDYBO9ymytt1LnowwcKUeVZRQk1WJN2Z5u47DO
X-Received: by 2002:a05:690c:39b:b0:873:5bb2:6c07 with SMTP id 00721157ae682-8735bb26d1emr28823247b3.49.1788648924962;
        Sat, 05 Sep 2026 15:55:24 -0700 (PDT)
Received: from citadel.lan ([2600:6c4a:4df0:2c10::1dba])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714af5581bsm45693917b3.36.2026.09.05.15.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:55:24 -0700 (PDT)
From: Brian Gerst <brgerst@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Brian Gerst <brgerst@gmail.com>
Subject: [PATCH] x86/asm: Remove CR4 read fault handler
Date: Sat,  5 Sep 2026 18:55:19 -0400
Message-ID: <20260905225519.1002976-1-brgerst@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the fault handler from native_read_cr4() since 486 support has
been removed.

Signed-off-by: Brian Gerst <brgerst@gmail.com>
---
 arch/x86/include/asm/special_insns.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index 46aa2c9c1bda..6c80f69cf62b 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -46,20 +46,7 @@ static __always_inline void native_write_cr3(unsigned long val)
 static inline unsigned long native_read_cr4(void)
 {
 	unsigned long val;
-#ifdef CONFIG_X86_32
-	/*
-	 * This could fault if CR4 does not exist.  Non-existent CR4
-	 * is functionally equivalent to CR4 == 0.  Keep it simple and pretend
-	 * that CR4 == 0 on CPUs that don't have CR4.
-	 */
-	asm volatile("1: mov %%cr4, %0\n"
-		     "2:\n"
-		     _ASM_EXTABLE(1b, 2b)
-		     : "=r" (val) : "0" (0));
-#else
-	/* CR4 always exists on x86_64. */
 	asm volatile("mov %%cr4,%0" : "=r" (val));
-#endif
 	return val;
 }
 

base-commit: ea789738cbf82b72f5495cd1e2b231a917e0e6d5
-- 
2.55.0


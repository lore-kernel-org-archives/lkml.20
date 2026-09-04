Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B346D579
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521135; cv=none; b=AEwE8KELIY0Fp2OpK/dLFmo2C8FtmsFRA3Uzh8VVUj82ytzOOoGSpv6pVJ4kJkULcGt0zzQmgojt8DRtfJG9LvdUajZYPNMUtsEbfiuJBTakUK/bH1F5/yOm4zjgttUWb5DxbN5+id+u0tJlX5qQ3TN3n1xL0tRTe4sqCtA4rHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521135; c=relaxed/simple;
	bh=n0XIBO2aFgHV/wD2isnhVMiKn3dGUL/sbIadChSZ46I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VORmQgHysooj0SRtECEtsT4skj2LK7HuzF1fvB+nw30LVW3W/n6JLZRrZ3VS8mfVXP8vqm5A/Z4rOxh/Bv+89s1xmTsA12uMNHrJSj5vOSFGXCJJd7mnjqMzXGfqNyG31jPz6jsdToprsvl6h9qqWTUaEx3UwBnw7DH1t7pxFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skhjlgTF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skhjlgTF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d53197d8b5so7877785ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521133; x=1789125933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jzeoz6MkP/xVBAuo5DlGmmGabrcP5zC90RAVfVgH1jw=;
        b=skhjlgTF8FPLFMf72LvPq/OVn1qAU9eXZin5wbWUmfbW9go5Dpn6SO0lBMo58aJ+Ag
         NE2e/HjaiVQqdg2awVCMa6JbWvakcqHbhfytDnePTVHpE5xCQDBVTSfrU9RP8p7FiH2K
         DLRZRV+12C2rLvn7ONHRmvwNMgrLR5P6crxfl6TreDLPYseDNkgjpIGWkO/Ykd0+MocH
         bpRxkLbwHPUIORHJmr/eyzW57/J1o+bqjvuF4Rv8fOlax/SDw/YNyjPlrw1WO3fVlSTw
         ivZG4OFlaCX8ldzwx/DUGUX8EIYBM61jQfXjp0DBpmGrNYiSlRzQZT3zrFsfUS5zjmgM
         mLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521133; x=1789125933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jzeoz6MkP/xVBAuo5DlGmmGabrcP5zC90RAVfVgH1jw=;
        b=M/3eCtO+p4VU0yptUn3Ygbk+BDWQIawBIODS0wKXLqdja2y9gsfLcjLCmwn0mgbwlK
         Xn/r5sI+e1O8BrQxoixWKGIDpF8+F0NnQRIKR93EU6yL6qeORQ7jKP4PcLqqWA251VxX
         6XoYoJMesX4W2S36szh+SRSYvOQE3KXxMTcZrc4Tpk9V5tjOusvaHkANBC10sDlH6hPN
         Nh7UJyL/hSwNnKzuEh4fAlJXgi37pLpzOdvQGTOQ6COPhUdLeXp+rR4aUBcOBULXTSUA
         Clz8k7GGlw2ZEbr7AVVn72Z5qkW2fZEHUEB3pSCl1wt4K+Chcj4y7DS9Gzqfyy95BcNb
         RABg==
X-Gm-Message-State: AFuF++lP0VP0RA6x+eauE0h3rpvh8g1Zk5ELf/WdO7oldvo69lAtIsgf
	WNtf6ok6HOc87vfMfQfMAuaAYXs98YUlRYvXaDnOu6qHvGziO7mCSuDkVA2vnI5n
X-Gm-Gg: AYBFou1wywUjsgfzdX6dRaiocB6T6KsrhaX3yElAdn1ioPGgoHuJAasdly6miZopIDh
	c2U8lAkPWjM/5wnNz1Db5W/6QnZ7U634EHWGXCB1CWmvWL5n51rJ2f9TID+dFHWT1z922vNixA+
	0WpH1kXsEMIPsDIB3Uk3tLgcg6/iG5XaIu6tfp287XGqrxsnLZtSrq+Rwd5Q21a4lfe4xIw0G1I
	vF+AgSEiIUZ9n+maiUnw9jhimK+ecdlaY8TNlq5khwmjN5+r23NaItkvlLu8f2zXru72r/bDCQT
	hDGVimMgu6pbDy/+MklqM6rVHhGX0nPuUOU9U7tKvnCoOeYIWPw1Y/iFKhVS0cFvxmSKIndi5Bc
	CXUIgqpJ3s5OUGC5/hdLFfRfOU7LJokrxz/uhM+JCKmQNA1I50gDPUYftLDDcKZNlG1Y5JPZaAL
	CGCFg2kxCdfi/CBU/B2SuxVPjjlauTFdMos4Xkh8I+F5R3lWzG3lVptMGGx1Kng68tzmmdpwNhL
	rFU7Q54/PJaNaG6s7QtFyjXau0=
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr7172844a91.18.1788521133139;
        Fri, 04 Sep 2026 04:25:33 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm8970969eec.15.2026.09.04.04.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:25:32 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: fix repeated word 'there' in comment
Date: Fri,  4 Sep 2026 16:55:18 +0530
Message-ID: <20260904112522.1426-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904112522.1426-1-hemanth.selam@gmail.com>
References: <20260904112522.1426-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'there', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 23b87b5ef7f1..2a6b6e29c118 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -1288,7 +1288,7 @@ static __init void prepare_page_table(void)
 	/*
 	 * Skip over the KASan shadow area. KASAN_SHADOW_END is sometimes
 	 * equal to MODULES_VADDR and then we exit the pmd clearing. If we
-	 * are using a thumb-compiled kernel, there there will be 8MB more
+	 * are using a thumb-compiled kernel, there will be 8MB more
 	 * to clear as KASan always offset to 16 MB below MODULES_VADDR.
 	 */
 	for (addr = KASAN_SHADOW_END; addr < MODULES_VADDR; addr += PMD_SIZE)
-- 
2.48.1


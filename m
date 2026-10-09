Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EB51A9B46
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581578; cv=none; b=qntdGM5Dxy9GJDtdI03TgW/EfVWJehq7mbCccgkFWLY28mG3p7NYrCKvKWjfgxl3PGSk257z8PfQx4++rppYVy+RfXt54HC+QwAFeDGupOORjBB1xyQTaP2p1lbLVecZa1rHMuk1cHPiBhnSYeGC+RJE//JO9ZLDS3+0PLRdzeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581578; c=relaxed/simple;
	bh=tYoPTUJ3dCvu5GHSRIsiqDZLpqiBVrZfjRC+6TGss30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIV0Ua4piHHnv/GLBtx/E6y+4YEvDFw5NxH2ggf5m6BEtcwa0NrcFKyY4r3I2L8M9fm8GivgcdID1vWOHl0PI1xYKeDYzLp6pT75goF/YSexw2JLYvUo7lvcDvpPR60sEbh34tH1+GbvTRBd6idrg+VYAINXmVrPkrKhNpk6W2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSh2i8tk; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSh2i8tk"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e61f017091so1032035ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581576; x=1792186376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/FpltOJ2Bx3xU6yFNT6UsoheDoakZFC4nFP/xB2F2U=;
        b=DSh2i8tkMBoVnrtSLpZR/bjsbZ22nMntQjHbaR1k6CJFZAXtOhvUp69H4ZS2GdObNj
         +0YQwwXrpvZpjCIxr3IiqmgZDCDijvsgarqxSfZh+gxilbBYWiUEHBpiPD18Bxb0Srmn
         TGroLy6hVfT380SoKSoDfsHlGFVDH18ojegy39aXj/cYUHZCGo9a/JhTAU5NSH51v8Ez
         OKv46H2XBPS3xM1uXgrfpGPlY94OF/CrVGL0LUs3bgRPpo6wfNmp+7hYmGB31AfChWGI
         aHo7ydv3NdzPNlalIurkd0HBPGzvkyVri3nu2rAO65FvgsPg8ecHhtk1qL8cfdmtVAWI
         1+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581576; x=1792186376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/FpltOJ2Bx3xU6yFNT6UsoheDoakZFC4nFP/xB2F2U=;
        b=LQ7K+be94cE6XjfRdDT8WHn57MfqxaDDkl2MFiNsb7jwg0GUWk1A4eVYz8CbIdYtSa
         DsBoRtd4NtMFrkivJYlOMuz9LzFH9MGCIt3kBoMYW5i05es+S1dCL0e+Dh6a6xanRCNb
         7j+SkFjoeFcUGuQuKnn0ZgCucDEoXLJZv8urn+cYJDXTNkqPGwybfvfoCUCzhjGk4uuE
         5J0IyRSHw5aetyREz1TRqdNVojEfq0lTcD4Z24AoEn0DInpQ2rCz6MJWG1ttBCBDYex5
         ZPRYRrg8sG6mTvdxbetyfySUnqYBKzcevnSAxUkRhpZBMinxqqDc2LxAL2MT1QCMDPPi
         BnBA==
X-Forwarded-Encrypted: i=1; AKwUvByXsoq7J13VOS/Fyegy76A3iTj6jR5h9GurjHaz0lN/PnmN/s0xHNzdTPrMui5PjWN8Ybi4x8aub17F1vI=@vger.kernel.org
X-Gm-Message-State: AFq9FYISTkFP9i+GcWUmFfW21RVcpFdZfGwI0j/qtSTgAwsHnW9OrWdu
	lPuloreNW8f0GFXUF5fjmmFaXe+Tv08GzRzDlLsuKmtxVCR+pvpuVY10
X-Gm-Gg: AYBFou1Ruym/33JqRjFNbbbSPYwM7lOTUXD0sdcKRCTt/ZIXFk3tWfacqEosk/jVK3A
	I0ZwiMuVMZ8MVsIu87jVQrqAdNY163xeyTDcpH1wRscktwx0wFZNWL6G8yBtZji6QHEIKSsdhzs
	/1YBq50b+SG53lKnkQ8bD3L0rGjgPaz540O7qsky0zTkmfMp1pNbsTvM3QMB0vjnACgjUBiBjd0
	cSBiGOHpRASJAQRpqrqxu52HBYMnyObxGG6mDdJPY2YRQ0S5K64qBNTgnoY6Y1Rcng5em+7Lu4u
	HbP+ty76J5+38VxahH6ziLB35wwu10uAIk24qQQ2nutvw2yfu9cGFXXPnlwpJ+R0yLiBuV8VgeL
	VftuaqOmWcZOV7uJ21HV7a/CBqVDlyN8pw1hiDj/cRV5ukzCTkmYPUVOQ6QcVB8D5HdHkQYxy/N
	a9Q/Ac0/YcnCSzRL+/vnzAeZdwL8k1YGd/QlMr98yyhDQhViMZcr2D2pyHucwDZ3wSDTlTHPhTS
	jfeLPQUzcwCl4KMkSmFXD9DmU5CvHys0VzOwSOQKjoGqYBOrRnSITzArpqjLz7RExOlPZhycTOv
	eMQQgPMol3jjeMnBu5FF0XDJXOgx5tKgE6l18y1+ahkPY40K
X-Received: by 2002:a17:903:2987:b0:2e2:b557:aa56 with SMTP id d9443c01a7336-2e842dfb377mr27906225ad.57.1791581575590;
        Fri, 09 Oct 2026 14:32:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8dabsm16581735ad.58.2026.10.09.14.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:32:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: sparclinux@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH v3] sparc64: Define p4d_page() instead of stubbing it to NULL
Date: Fri,  9 Oct 2026 14:32:52 -0700
Message-ID: <20261009213252.111043-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():

  mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
  has undefined behavior [-Werror,-Wnull-pointer-arithmetic]

sparc64 defines p4d_page() as NULL, on the assumption that it is only
used by stubbed out hugetlb gup code. Generic code now uses it in
vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
used in pointer arithmetic, which clang diagnoses even though the
branch is unreachable on sparc64.

Define p4d_page() as a NULL function to silence clang's warning on an
unreachable branch. sparc64 has no p4d leaf mappings, so there is no
functional change.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: do it properly.
 v2: use a NULL function instead.
 arch/sparc/include/asm/pgtable_64.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 35a217bf6e5c..bd4fc65e4bfe 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -851,7 +851,11 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
 /* only used by the stubbed out hugetlb gup code, should never be called */
-#define p4d_page(p4d)			NULL
+#define p4d_page p4d_page
+static inline struct page *p4d_page(p4d_t p4d)
+{
+	return NULL;
+}
 
 #define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
-- 
2.56.0


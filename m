Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4003859F9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787799960; cv=none; b=eRvlII+YDppiGINVjvNRxab39UmJcDE4vsEewq1kxuGyWKb183+aonWSbC24w2cKptiuT2g7fyNhoe/kdIXbyh2xsCjBCbJKNXi+oixQwCFc+2blJ2AOD1EM5pMqGYrMlEvO34L0sWOZbHun0Zr8yua3jSnR9ATxvEvCiZ3hDQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787799960; c=relaxed/simple;
	bh=PgTwae9rp5+uHQu2x5Plm8RvuP6NFVgtME4CwAVFnT4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=T+1rE27pRhlUPDMxMgPFRe1uQmgB+IPBFCldo/8xvgg4f6eNtuKIc1n3Ayt3Zu8kLT1G4Ezhvmn9XJIIrYiumAFXlUpSxiVs8ga70AJBg02SL7L1907zYc9wTsUAK6eQeqvV1WCuG+u0iyDTDhk+cQaTltcAqN/EzAxRX23yg6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mbou9KgA; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mbou9KgA"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso245157266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799957; x=1788404757; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ABL0lVs2T4omHeNrhqinBnCW8Qg/CEyqGSbYpdEGHI=;
        b=Mbou9KgA0FluplSnZFho7MCf90PdKQNY1Llrq0/Q+MyfueS3FANY8zafx9ZG0HS1+6
         XmynzRc+izjBj7AGP0lfYUmtpL707t3emIVp51qdLWk66c8Pxrz0sM+h9sBMf+68s4bh
         BOdPbBZSLopJmMUm3e6EORAsIy9pWZ0StwyfGZOHFxiUK9SZV8fG2e60FyfyxbhG8xKT
         K4opxrVYSVvwRXY5lSzOBRbZW6OE6ae8x5HmkxcD70qWgnFoju9cuc5qL4GgkKyqtruE
         pGuGmN03q3vVgtINpVYwa5FIktlk3dGh1PxzbhwroKVNrlAqeuSKY11csdsHCmPc7nCp
         GJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799957; x=1788404757;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ABL0lVs2T4omHeNrhqinBnCW8Qg/CEyqGSbYpdEGHI=;
        b=kCH88qL90Dp1cOGaImKtbCIyUo3aWr8arUrvURV+FYGjZDEtWgYH7vC8UDr2qpwWbe
         HE9Ze7lBy/8bSbpmIymZmu+wr7TyXpaDMu3AvbaUcnwBY+oOpDkNLEP+KTlGu1CZO741
         CtoWr80EUt+gfX/kC1lfLcSHgrPT7CXU0Yeb6jff4aZo3tmYWH2MeO1pPVbwFeTxr8qS
         +8EuXMiHHyD2asx1UAFTbICPerEi28n6wNVvDHnrHy5JfZ59ulM9AZV+ydKkB4fIcGn6
         d9h+CufN2p0FpzqwoQEAnKJYfhStIMpMy8Sy9wkCdnos5K4MOzjmPCUor5l0ww07iV+l
         li/g==
X-Forwarded-Encrypted: i=1; AHgh+RoUWggK2dXGmKqPhnqJlgUQ2gAeGsJiC8uYnPVifv8vDJJzw8uvIwTfowOdccxwPl5+lGjspYCXSzhBVKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ljtA68tLC7f3stOVlZ7pVZ3+qZFZYSIO/vKHQGWJtVUtNJWHr7
	70/Y/b/8YdzRmHGvDR+s9CYjnyrUfTDFou4VDBh8xsjtIed58miske87
X-Gm-Gg: AR+sD12TR7OlHdmvubBv7WnKCVeEASNGJEOS4IU/4wD4VMg9RpwOlRvMCyrkYrbKMdI
	Hy2Qg1DnypThw7kzgLnvkiylYtD9v3dmAiPZm2JhLIAE/18oyi+cMZcnhvEAOR9z1zCbg/iRWeH
	/A41spW9tgdhGcqYbzwzyXIb35fBKO4J/sPexwRCNGCd9lAYhuzCIgGYOumCp2obyQ9aN7yOgH+
	3y1PidBRXU1N+THrCYe8wo/36fMuE5pAN10GHWfRTyoA67iBxhGwcc9E1bBZ3Gvna61HXqlFGyC
	6svdDx2HyoEcjNFb3pF72XUNhT2pwWYUR+pOub3eJ4or6KwjTyatTs6yy3Pka2VsvEiGqzHsBsd
	AMKnTLy4VikVjvK8gSNgNIUfK8dL+IBobNfgRQ3A4sASrxq49kBaaBCxPrsTJnhbw05fCamnijD
	fTmhr/S8U3yCK1M8ZYkgNzhgguU1dh8a5MihNvVmoC4HwFNCMei9Cu7K8XR6p9
X-Received: by 2002:a17:907:944e:b0:c24:f8e0:f092 with SMTP id a640c23a62f3a-c250bac7f88mr1102590766b.1.1787799956563;
        Wed, 26 Aug 2026 20:05:56 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef92csm690682266b.63.2026.08.26.20.05.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2026 20:05:55 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	Baokun Li <libaokun1@huawei.com>
Subject: [PATCH] mm: remove out-dated document of __GFP_NOFAIL
Date: Thu, 27 Aug 2026 03:05:48 +0000
Message-Id: <20260827030548.16631-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
with __GFP_NOFAIL") remove a warning on allocating large folio with
__GFP_NOFAIL, which is adjusted by commit 903edea6c53f ("mm: warn about
illegal __GFP_NOFAIL usage in a more appropriate location and manner").

While in that commit, it also documented this behavior which is
out-dated now.

Adjust the document to align to current code, and adjust the comment
while at it.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
Cc: Baokun Li <libaokun1@huawei.com>
---
 include/linux/gfp_types.h | 2 --
 mm/page_alloc.c           | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index 190191411009..24fde8eb73df 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -243,8 +243,6 @@ enum {
  * used only when there is no reasonable failure policy) but it is
  * definitely preferable to use the flag rather than opencode endless
  * loop around allocator.
- * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
- * not supported. Please consider using kvmalloc() instead.
  */
 #define __GFP_IO	((__force gfp_t)___GFP_IO)
 #define __GFP_FS	((__force gfp_t)___GFP_FS)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ab385bc252cc..146f7e0a9462 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -4804,7 +4804,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
 
 	if (unlikely(nofail)) {
 		/*
-		 * Also we don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
+		 * We don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
 		 * otherwise, we may result in lockup.
 		 */
 		WARN_ON_ONCE(!can_direct_reclaim);
-- 
2.34.1


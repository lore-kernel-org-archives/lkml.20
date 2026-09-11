Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244436EAA4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110283; cv=none; b=HMmH3cTcwpslqlkIbJdI3ffDEZqt4fuljonhWrYR92wtjp6VouQkwCfD+Seh7YuimhfKYCmyVxrW0FOiuszOx/QjiRXyjh0lASQegOvhBffO9TW4Q2dyfH+XlPvIClaGj3+BkRLykI6jKFh7pt0ccWIWHN0L3U8LPG/XxRWgCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110283; c=relaxed/simple;
	bh=oOrrt/5TTs6oyKIOw4u3tTYoWTVlG9WJDu4znEAehhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WQohx4ROVdhqizwUUghcwgDux1RsI2yjAHQZoKZ+WhvFt4H6AaA25G2lByZEaesNY30UyLv2AKuPG7pDCaHb76VIyUiCnW7yK2/RKxVdaIOA3r4v4zxnHXa+r3oIXpyo7Q9T3jO2OKz5G5XQFRAfMnSGquPy6Mb41RuppsF6kI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B8ncdw+P; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B8ncdw+P"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so10914225ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110272; x=1789715072; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWba0MXKPePT9+pbYbVkPTqSSVKwgxdR9mpJ5XY3bKM=;
        b=B8ncdw+PHYpoyRpNfyHUSyb3UebcH+h9pCE6GKx2aGh+HN+kjdLN8Z20K3biP4j4Go
         fPBHMLXzqfQSkV+eK63Bc0WzMdPcOzxOUUK2/WJmNFzrqdYGeBBHu2ahJgxITyH9PTX9
         jmMCytgDtS0COvvFXjvMzYiBxkS9tlJeyzJrtAm2pi2IhbuInQmg49FaPVDPmXI1SMTR
         BbSmvxS7vh3vbjmJE79l9yJhiDHr940rN5hnhCC0j90CrXw4+orPj/HBYvPcbemBPUA1
         Xzw5a5DWHmOo9MyOv1uEOA58aEWTf3eo/NxZ0WkkrZh2zZc8Z7EWx2q4FUoA2KlsudY9
         /xBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110272; x=1789715072;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWba0MXKPePT9+pbYbVkPTqSSVKwgxdR9mpJ5XY3bKM=;
        b=lwwsYsCBz1sVqDID8aT4dgxt4kOw1MFe4xC/eF/1ta7b6qEuu9xvZZ/3clkQNeqLZP
         e2hXEKKXA/QBz4+bC+HPeIcPQ/wWkadUAiNCqDFEiR29i1LbDzp1y8PXZPvFsqYbKH6Z
         hBt4ZlhbiJ7PtchlEVgnTdUDoMCQk2Ix0TXUkt/4qp/YS9UVnp7Ooust1J2W+WuoZjbZ
         /7xHWzK4g3fQrTZhFDl2JjpwH4b2FEP1qmlWDQkIC2gKf5prjo2NhGUnlSHH60CwKIPF
         +IgGe4tW/kH9HBiSTwyc4k7iLzqxl8cE2Rda0olCCqZdWAFGriry434BoBOWoJz1IBRg
         /Q9A==
X-Gm-Message-State: AFuF++n9i2Bwi8TTvi2x+0V5MctgqZiU29G71tj4fkMzt1vyeuPX9J6X
	uhfifxR99JPRq4J6UIBo77W2avHLyB9S7bK23FhQMNdi6L23aDpjrDRYysgnROj/uNkKxBDt4zb
	VIn2310hqtJYqtJWb0h847mvwRFq4/zwqVnEkRAtLnwLFvE3jrmpNhJlDV+gd8nyvM9tIRHHl0M
	0aYC/xpo7wFHMhy0PJ02Kb+3sZciuFrlCO3yIJTQ==
X-Received: from plbkq15.prod.google.com ([2002:a17:903:284f:b0:2dd:1c44:fe2])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f605:b0:2d9:464f:d45f
 with SMTP id d9443c01a7336-2dd2a1c4541mr62202195ad.5.1789110271979; Fri, 11
 Sep 2026 00:04:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:42 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-5-morbo@google.com>
Subject: [PATCH 4/7] arm/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Liyuan Pang <pangliyuan1@huawei.com>, 
	Xie Yuanbin <xieyuanbin1@huawei.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Convert arm to the arch_load_unaligned_zeropad() /
load_unaligned_zeropad() split introduced for x86 earlier in this
series, so KASAN/KCSAN also see reads through load_unaligned_zeropad()
on this architecture.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Russell King <linux@armlinux.org.uk>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Liyuan Pang <pangliyuan1@huawei.com>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/include/asm/word-at-a-time.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index 5023f98d8293..ef0002d16dc1 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -65,7 +65,7 @@ static inline unsigned long find_zero(unsigned long mask)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, tmp;
 
@@ -96,5 +96,7 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	return ret;
 }
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif	/* DCACHE_WORD_ACCESS */
 #endif /* __ASM_ARM_WORD_AT_A_TIME_H */
-- 
2.47.3


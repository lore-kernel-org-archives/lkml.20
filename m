Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7656A4734D3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305090; cv=none; b=M39iBZmgdthGZ3L18FEaxlthp/RY2bTRA8aAZuWbfoA+8eU5VRC1qwRR62Ad2YAJLcRF3GlBhfoAuOIfnsBYbzAATb5pEf4jEpbVy9bALcaQaW1zZQOflt6ckrsQ2UB7YdRJxRN2tDJNQYanIkL3m3dBV1IrYYdAKN9dE7cD44w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305090; c=relaxed/simple;
	bh=oGBCxZ/W1ePKeKfKC+WTKK7+1MAv4ztkQG0NEUx6DE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NeA7fVbNCLsKh4E/nNh5LbSMOo4PJns2peXBjncXM7CD3OvSCOvmM9Ckx+IK8MS7wAt/bILrh6EMEW8QqckP6ld1vZaRXod2tL+iH4PUeP3F2eRXRtcqx/ph/NX7Y6CvUl9+RmhlnkyCG524sFCASHFnUofC29h6S3K93rZD8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibSekCGB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibSekCGB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F941F000E9;
	Tue,  1 Sep 2026 23:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788305089;
	bh=dD8NdLX7k458iQXtwaaXdMdVjxLHPxreylsAIMI2VEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ibSekCGBXiuyZPZB+TrUcrTvmAVz4J6blUZQSkuuhDcLDR9ixnqf+520nUiUdNc6T
	 /cpaWjlXga/eXeMvWhdiJdjIq5EufHp0OkMW012RFkqkkeR+Lr7Z+U8P3LKYiPRRyR
	 dOBRbhWd8KtLI007ns+Kd4ST8tbyD0yo/O5kzHGxZGFpRpOga/W8TMY/QblqcaC8Ny
	 mchLUVU7GQlymWA6adU+ZBXG1OEHfMZU6ex7wEs3LpwhePv5+aAmVavwglaYKnv+d2
	 HAf4VC18aG9u8u4oldXleMhgNffeppkJBDl3iii0bdGyOBwLfUkW25gCsqXguV4Y3l
	 Ar+vE10FgAfpg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v3 5/7] mm/mglru: make LRU folio prefetch helper an inline function
Date: Wed,  2 Sep 2026 07:24:19 +0800
Message-Id: <20260901232421.40157-6-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260901232421.40157-1-baohua@kernel.org>
References: <20260901232421.40157-1-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`prefetchw_prev_lru_folio()` is currently implemented as a macro with a
potentially unused argument. This makes the helper harder to read and can
also trigger checkpatch warnings about unused macro arguments.

Make it a `static inline` function and remove the unnecessary `_field`
argument. The helper always prefetches the previous folio's `flags`, so
there is no need to make the field configurable.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Reviewed-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/vmscan.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index ca57f6095b37..1907a946840d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -182,17 +182,21 @@ struct scan_control {
 };
 
 #ifdef ARCH_HAS_PREFETCHW
-#define prefetchw_prev_lru_folio(_folio, _base, _field)			\
-	do {								\
-		if ((_folio)->lru.prev != _base) {			\
-			struct folio *prev;				\
-									\
-			prev = lru_to_folio(&(_folio->lru));		\
-			prefetchw(&prev->_field);			\
-		}							\
-	} while (0)
+static inline void prefetchw_prev_lru_folio(struct folio *folio,
+		struct list_head *base)
+{
+	if (folio->lru.prev != base) {
+		struct folio *prev;
+
+		prev = lru_to_folio(&folio->lru);
+		prefetchw(&prev->flags);
+	}
+}
 #else
-#define prefetchw_prev_lru_folio(_folio, _base, _field) do { } while (0)
+static inline void prefetchw_prev_lru_folio(struct folio *folio,
+		struct list_head *base)
+{
+}
 #endif
 
 /*
@@ -1695,7 +1699,7 @@ static unsigned long isolate_lru_folios(unsigned long nr_to_scan,
 		struct folio *folio;
 
 		folio = lru_to_folio(src);
-		prefetchw_prev_lru_folio(folio, src, flags);
+		prefetchw_prev_lru_folio(folio, src);
 
 		nr_pages = folio_nr_pages(folio);
 		total_scan += nr_pages;
-- 
2.34.1


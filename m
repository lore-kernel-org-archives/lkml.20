Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D337F006
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874453; cv=none; b=fcJwL00yXakA6jBhhfkk5sEJAQVD6Vt+WXMKZH2uK08yubM7bQPuWym6KRA+1X2Ty468UPgmLvnWjUBO2OhxgaN4f9UTuddWASdIiFvrTV+O3ZlyrECoglRSyNOFtiQIFw1sDbweR3wX6mELP3b7NzZjjuYHrCi2EUTfvuoiQXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874453; c=relaxed/simple;
	bh=CR1YMm5eq3PxF2FFFWNolcPx2l/5uCA6SnVt9OPlXAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gm1smNLUHrN4TRA30QwcknWOKgpKu6E3ptM0NV3fhZD8VUnF0Em3Kge4IPOWkXcDKQKUyCIMffphRqxRCW0C1JtNy46V3smsgemBqJ++yvys6TlgYQyCtNcRDNQRU0sJ38S69UNhR4GLRYDay1An7l9cFT1qDdtSzzRTJNop354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQ476tXi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQ476tXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7321F00A3A;
	Thu, 27 Aug 2026 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787874452;
	bh=r2jDlzFvOsWktkoLH2gzIr7hlSlT/K6vhqtCTnrj+Wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fQ476tXii4CioaYamLqQ/awsDE6PQpgfETtgAKJTmpSICmIKTCgdvm//WaUr3jg35
	 r+F1JgTYduERgjwWe0TRzqGHloyHBpL62wvTcBogYzWxiqm55kGsSFisQa6/ZcIHKT
	 EP0/3uMS6bVS2tMqssEZA/uYXO3Xor6TFds1WvJNEWzn6H7iSjKlvhvuWsCLV+EA3I
	 N45O+WAqd9CvsWDYujs5XJg4Qm9GiayzuUvglk2euF3DKtZMQuxWzHA0o6S2jdb71H
	 Ru7Nh53BHtTGJ+NSToSLHu6Agf5fHHH/uY+QoddJMFVGnUA+4IYfy5Z4SYBA2lWwUP
	 gxU7MUtAEbKVg==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	lianux.mm@gmail.com
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
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
Subject: [PATCH v2 5/7] mm/mglru: make LRU folio prefetch helper an inline function
Date: Fri, 28 Aug 2026 07:47:02 +0800
Message-Id: <20260827234704.63163-6-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260827234704.63163-1-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org>
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
---
 mm/vmscan.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 2b33d3f44682..81f95a968447 100644
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


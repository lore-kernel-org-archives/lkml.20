Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B7A4E77FD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997947; cv=none; b=o3b7N4lDT5viz890GgfHy90DciZXiT3AI6IcIoDWqqhmsdS1Vq8jXtZ6Rii1uJTL+pq2F0SVrLwa8ma6pNwxZu5dOGNlErMnVWcGdW3CpzrIlny9FlIj5X4cEoPoIm6RlrKpAUw2/Qj/cnZZFOjBDhGUYKp6sDBdHPJOZfASU4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997947; c=relaxed/simple;
	bh=b4uysr73bcfMOZIpbZ4LyDRIv/mJdrJGPNVHhMK1A7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QL8XjlqGgmP9mqIH3BEYsjKbfdS9y463ITuwItyipNQpX5JofpezAxNamOUVXMo0N/TddMxRE1k2Aio9BXtU247QaDpRiqCbgnorx2WrariG+YMFqEq2V6U9MYsq5rnDL40c5+NdD3bxTG11V0CjnmeEBzuNmBuLGYG+/ljnUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2D9riPQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2D9riPQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7236E1F000C4;
	Wed, 14 Oct 2026 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997940;
	bh=Dpuf9YwQeXbyxpKeMDvzTwCnwr2xLVuFfJ1Lcw9LKFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g2D9riPQbVePOj+aGiP4CVAucNUxKE2xPpGwXSibS1LjpFXKWeQyAc7oUw8c0B3uP
	 dA9wS/JPrRT1m/wsIC2bszUPtd1KGz3bkprv98oTDwe1BOIy1cgU/6b91vjUkWTunE
	 rGAZZSD8brlEIEJIy7GPxXjZPoUTjQsyGLRVKlbVavukXgg0NdExOfcBZ3FK7+mdw6
	 S/KgaHmninA6ZDwJd2jMrGH9oaFmb8nLb1KOIZXk6U4ofbiOEUhYTCxckyMBMZJM1C
	 upXvZ+OmRmMy8wne+TTAACexd+uwB078cvmWjAvGvXPDhsxjz2tdR+Alz170+Ycomk
	 MB3vGFIGXWbWg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id AEF381980047;
	Wed, 14 Oct 2026 13:12:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 14 Oct 2026 13:12:18 -0400
X-ME-Sender: <xms:8LfPanoI_J4nKlR1hVgJiS-mm5kJx9gUTWeAv1sJ4HoFoJLhWn36nQ>
    <xme:8LfPatn2qQYPnOcNEfgNrBXS3JfMcFkJg7YbZsy2nlM4vK6D5FAPhGirdk4Mqk4OC
    jvj3NUFNSDVD5ccl6uGqOc2jC6uYRAUjQXqZpT4Z5GogIqTMLCzCKw>
X-ME-Received: <xmr:8LfPaqWsEgtzdrC5kdiHtQHs-nrHZVGWH-K5LXFcx8otWERAwpQTvXhq4yQ>
X-ME-Proxy-Cause: dmFkZTGg3k0TVKsEP7CfoR57WWB+3h574BO5vjP4iWax6f9GidZ8szHobtaOvLAEbPCZ2m
    mw+y4/PWP+fl/ZrEvowyJM606Aqux2KjdkbOrs1qTyDsxUDjHhZTWksnA7am7MGg9VukjB
    qcXL+mBtcoMF0nKIYV1Ko0CB5fx2IplfPHhSynDMYzb+URxJm2HhB9bzqvrzy4Cvkw3z4+
    1ufb70dVHftr+eFTK65fTPkzZfMFIkT+fPjngxsm3eiPLOeyYT2uqJ47ZuQsB+0l7i804Q
    fk/9VtLe5apNPJHA5iwMfFjFMaiWANNYkGgKJdhqeFkBwi3mvIJ1y0E25HLDGDGvYAjfQC
    4ygZZTkTFcmLIU84Rk2K3neDXBN23tMe6KTwPsi/aeT1PwjzNdrJAf+hMCpq7X4yJ09ecd
    6PJ+ZULyESbKHbCKzYlCQXS6xBV7zpJWdOiJbnCfk64pYNlUWbHvX/y2SH6LF3z40FD1JE
    YYGlMan+hWIOFGl59r6gt+zYj9gYSC3gbxvB1w67A2Hm4QhJBmet/agh+lS0whzgqdm6YF
    tSTLyPKC0P0sOWyhOXOA5tEdGY58aOLhF2h7N2x7ctGtA0j/1NiflaFdsHBPCvjEb2+0fc
    AlBiXKDf5GS3gW6UPaJlUPPH6pI6VbLlPIqn1FAcxlwgcNq2qF9n9yLbm+XA
X-ME-Proxy: <xmx:8LfPahSZ0d5So_IqKt0tHYVApDnyrheDFRR8jaXhbsJlpKb7GYuIcQ>
    <xmx:8LfPalDY9bEFwpb02Ma69qUYOGRR9fkdvlZ1uKdVekcgDjrV8F5I9w>
    <xmx:8LfPasSV7Qx9AAP7n_Z_B9TzuKzqouQ9E6_gkAH1-XoC37spLM7UOA>
    <xmx:8LfPavT7BUklSsh7Pyzcw6ZT6X1MmNT8qJSHJyjHXDMeGH6yY4xXJg>
    <xmx:8LfPaiIW9LZm_7hsXvehx0-09ojDyJOwhCuwQ7957h9CLPodSbdTsupe>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 13:12:15 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v5 7/9] mm/collapse: name the per-table scan reset for what it resets
Date: Wed, 14 Oct 2026 18:11:40 +0100
Message-ID: <20261014171145.3292736-8-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014171145.3292736-1-kas@kernel.org>
References: <20261014171145.3292736-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

collapse_control_init_scan() resets what one scan accumulates: the node
load, the allocation nodemask and the eligible-PTE bitmap.  It runs before
every PTE table a scan is given, not once per control, so its name points
at the wrong thing.

Call it collapse_scan_reset().

Preparation for giving a control a real init, run once for a whole series
of scans.  Two names a word apart would then stand for two different jobs.

No functional change.

Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cc69281c542f..60ec7e80d554 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -532,7 +532,7 @@ void __khugepaged_exit(struct mm_struct *mm)
 	}
 }
 
-static void collapse_control_init_scan(struct collapse_control *cc)
+static void collapse_scan_reset(struct collapse_control *cc)
 {
 	memset(cc->node_load, 0, sizeof(cc->node_load));
 	nodes_clear(cc->alloc_nmask);
@@ -1577,7 +1577,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		goto out;
 	}
 
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 
 	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
 
@@ -2655,7 +2655,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 	present = 0;
 	swap = 0;
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 	rcu_read_lock();
 	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
 		if (xas_retry(&xas, folio))
-- 
2.54.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC644734D3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305086; cv=none; b=m4pckQQeiYFqyrt/uWFay2UhjahU6uLNVeVFElchjqfNE5ayly25wvPQdt0QOlp/sCl1MJSj3+JU9kNMxT1lDJrh8C7IgOEp9Fsd1+mz1/hrC7yKfH2wsosrUrrdlzzaWM5k9vKl4xHEQkTgJL2r/BMVaXLBKhcn5DlZ+kuZifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305086; c=relaxed/simple;
	bh=ftgkjq6TXNX4FIULhVflBvdBaWOKXrO9O9lbOJaduH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nLK24JaoWWjH+asBGBLZ6fc3l5b4rXI3Ig8zk5F85AJxhbgryJ+DfWzqlmfq7ykeoGY3YhIZzLwh6P+AIHUZQlN3MwegMk2DQcTDUFJB1I8anbsQrNyQ0keo+u8vC/WMXhPDf6SdW1/NbMPBa6LiRWhU/blm6VtKo4v4NCkxsuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxdpiHeb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxdpiHeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDC31F00A3D;
	Tue,  1 Sep 2026 23:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788305085;
	bh=PgOmxkUUjVNV1Eh5GMR0aIwGNf9xgs0cOpQXYVxNorE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AxdpiHeb7kJvNzMGM7D5vEhXi7aegklfIJNMxOX683Do1AQIZNYHwN6ILMk2lUsko
	 cvujbCse6W3W8ZTMaEckADtZ1pGV2z3BmYmf6cqB9k+7oXeukTVEtTpS9X8Ofkjun4
	 qGnuB77ySAUsIEipMxEHjiJO8xwpPnjSm2BKrcwFxzwOr/nLkwe1KTFzIP0B++Iyva
	 Yxk2e3ZHHRs4mVY4BWaaLD6VscDJJiHGyPAOTmCUpAeCWhOjaTsccmAnobtiZIBaEM
	 4RH3KZqA7379HOf0RhZ/+/hHi9X1HFovC5ei3N5Y8MZ5Jja2V8a9BfAaevKBNkLB32
	 ai2Lhi1XrkGrQ==
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
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Ridong Chen <ridong.chen@linux.dev>
Subject: [PATCH v3 4/7] mm/mglru: exclude folios promoted by aging from protected in inc_min_seq()
Date: Wed,  2 Sep 2026 07:24:18 +0800
Message-Id: <20260901232421.40157-5-baohua@kernel.org>
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

Some folios may have been promoted during aging, so don't count them
as protected, similar to sort_folio().

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Reviewed-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/vmscan.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 95d48f9efc09..ca57f6095b37 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3957,17 +3957,17 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
 			if (gen_increased) {
 				delta += nr_pages;
 				list_move_tail(&folio->lru, &lrugen->folios[new_gen][type][zone]);
+
+				/* don't count the workingset being lazily promoted */
+				if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
+					int tier = lru_tier_from_refs(refs, workingset);
+
+					WRITE_ONCE(lrugen->protected[hist][type][tier],
+						   lrugen->protected[hist][type][tier] + nr_pages);
+				}
 			} else {
 				list_move(&folio->lru, &lrugen->folios[new_gen][type][zone]);
 			}
-			/* don't count the workingset being lazily promoted */
-			if (refs + workingset != BIT(LRU_REFS_WIDTH) + 1) {
-				int tier = lru_tier_from_refs(refs, workingset);
-
-				WRITE_ONCE(lrugen->protected[hist][type][tier],
-					   lrugen->protected[hist][type][tier] + nr_pages);
-			}
-
 			if (!--remaining)
 				break;
 		}
-- 
2.34.1


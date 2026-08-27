Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4F344031
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874449; cv=none; b=P5eUT/TUDYDOA4Iu3kAvqpE8Mb6m8+2cQ9oHPm0JjH+Zn2jmAvjAuajfkkY1e661cI3eubwSjVbEr9HUEaJPjN2zG49K691p7Ma9DWa6vxUltIzlDu8UFzdmOso4e5uuqUIG/NoObIYSKkTq6bByTFEmDNI5i0upDoWfQha9rGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874449; c=relaxed/simple;
	bh=XBhPG+6Dr6CO0ZYGyASnz1zIW8XrRj6w2+sUmw0QPyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mfnSI57TqeulSgkzosgTKplvJKN4Hnlc6FWc5us0hfBo4VN5NzEY6vql+PwbJHumlQfgtPj9If2z0KoPiYwCzvIVcdBkP9pnQ7AtyRKKM+3OW7uuI2EGJfsccqoUi2u9h1u3jL2mzbQGq9JM5KTG3ib1yjZkkdaVjVKNI5Tp3JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhR8wbY7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhR8wbY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7ED1F000E9;
	Thu, 27 Aug 2026 23:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787874448;
	bh=XpoXXZeU8kWFe5s2ICH1kueGMPGyd+PONtE3ej8VrGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XhR8wbY755E4SSkqcE9MoEeN68jEYcQaM1A4b08q+UG4rIUxm2uAv78LbMZvoh5d+
	 g6gehELG5vSwKTnG3B5FcTDJIUvvrx1QIMwyfn5Fj4EIbmoSFehR1i0enLupWQPP/n
	 qKsntasHkCzEdm6QEYabfxmLMIEFDkavBd1LMsseR8AA9Cfoh+/mNJf+ljS2s71GFT
	 84kmA6eZXYM2jYuSgOgeIFPSMnCvGM9XFK2ifqLhr7LC7Bryn8yZ0Fgtk2ROpUJt2q
	 1+sjhqBDeCGIJ3BBxOy/CeZ9CJo49A+dEPKpafC9wKqCAisBjBXuw+ie/Z5ZpEQo7a
	 Wvp1+J8J+xLnA==
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
Subject: [PATCH v2 4/7] mm/mglru: exclude folios promoted by aging from protected in inc_min_seq()
Date: Fri, 28 Aug 2026 07:47:01 +0800
Message-Id: <20260827234704.63163-5-baohua@kernel.org>
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

Some folios may have been promoted during aging, so don't count them
as protected, similar to sort_folio().

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmscan.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b10d1703d907..2b33d3f44682 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3952,17 +3952,17 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
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


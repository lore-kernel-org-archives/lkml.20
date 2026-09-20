Received: from outbound.st.icloud.com (st-2005h-snip4-10.eps.apple.com [57.103.79.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992CC375F7B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789914332; cv=none; b=B8VrPVKCqfiuN1iiXkLPD7FgFViQGY1BOkSPFLu41ySBHpWQaKfEZ7216C3V/jqtA339Pn7ATr8E+b6RiBIASsLj+q6eb07G2Y1Ore4t680sL2l3ZkcsRakAfnQOe9U+XDTf/YnVlIB95gqLgOVUD7W8tsMA+Zk6zr8EDqGLqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789914332; c=relaxed/simple;
	bh=X1kG1tLczdpxshFwa4rihpmOvqJW54t/bXWnOoitkBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Va6/K946wq8WWFQ/VvT5RekUtoJvEF9Jri4mCb1ZMy7/qXXCGsqPfWGROuDYS5lgrAlgcmkks22vJBvEjT6DcnHdmc3X5h6PBmc8ryNzAevW+BmoZ88eXV/wT4zTi3XN/y6sEO9R3I2mQ7e9K4TmUXKPWh854PwSI5LLeskc5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=CC6rXqpY; arc=none smtp.client-ip=57.103.79.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="CC6rXqpY"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id E553118005AD;
	Sun, 20 Sep 2026 14:25:26 +0000 (UTC)
X-ICL-RepId: 01a0bf35-2754-75ac-958d-7cef7b974086
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKB0MGWQReCEsEQwFbEhVdRUkERxtXAlQXXQZSEnIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXABLWhVVFw4CQh9QH0wWV0NEHxwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoCURxWDVdDVARfUFQRV1ALWQJCD0gKXwdGRB1KG1IDGhlXFlgbRwJFRkRBFEkeCFRbBhQOSVAPAF0DME0dXQ5SBUZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789914330; x=1792506330; bh=itZXbhu1geEQDhiB21pBCZPn2boqK56cKpNzLhHjS5k=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=CC6rXqpYdJt2iWT+YOqGeKKa1bwsdtIgiMTKa+hKVReinjnwzVLGPYPw9nk3gsijeB9VM/xG0k9vf8PjXkUzOlHTqJJB/s0upcXlVKO+3eK1++8TuHtN1/NVm4drrKGvsplxm4+MrZaHt0WK4Yh8DTbl1WlwYnzmgge3SErkt7LiPIv/5CAXQkVfX3ASoELz6AjGMNapNgnJnyAtzzJNHzWPguh+xKBGodDIbu/3j23+jY/VWAUgo7TyirGwyxOfsRQ5wAAobyVcQ0FfsSlWhki8QfN5LVadMPxQb58joDLsgzc5Y0hZjzwA5RzFOH1QTITPHPbUvPb4LTldnKMf2w==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id 7136F1800BE4;
	Sun, 20 Sep 2026 14:25:20 +0000 (UTC)
From: Zhang Peng <zippermonkey@icloud.com>
Date: Sun, 20 Sep 2026 22:24:14 +0800
Subject: [PATCH 1/4] mm/vmscan: introduce folio_activate_locked() helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-vmscan-refactor-v1-1-ec04d71cb761@tencent.com>
References: <20260920-vmscan-refactor-v1-0-ec04d71cb761@tencent.com>
In-Reply-To: <20260920-vmscan-refactor-v1-0-ec04d71cb761@tencent.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zhang Peng <bruzzhang@tencent.com>
X-Mailer: b4 0.16.0
X-Authority-Info-Out: v=2.4 cv=fLc0HJae c=1 sm=1 tr=0 ts=6aafecd8
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GvQkQWPkAAAA:8 a=VwQbUJbxAAAA:8 a=SVDCxekAgo2Xo8Fb88MA:9 a=QEXdDO2ut3YA:10
 a=J82S1U87d15UFHHUFZS8:22 a=J6hPbylVjWXjVQVODqME:22
X-Proofpoint-ORIG-GUID: tYUsyATkRx1G_HLt-XrwRX7bTfu0HAgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMCBTYWx0ZWRfX5wHKd7rfIJND
 QHzvqKnxnnhc8FS5rmfpafKEsAyMErKxYdeSRU2Z43pIXIDvF6T2Z4GGgQgC0un1oM2wp7HbbO6
 S3NVgma1rQaUanjHfk67Z/5pOOcuE3hwt45zMYjyAZNDmGWJxo7AfYerRlH18eS0dMuJeYBGTGH
 7v9OeLHquz5sJH7WB0sLKpFbb5Au0+0jvL3w5S2COXCFVJcMp9swn4ASc4RNN20rHm3fhrn+SBd
 i+2q09mAIiQJDoJBLrDNTU2nPuN0p73r8kccYytZGRcu0couLLhtyK7BYzSmeUmSJ81caRdzpdu
 8g9jxSUrXiYvz5jt0CyWWE+vzPvCggCdNCmq9JFZmbC31Sa3Vn3YE9FAl0pXHE=
X-Proofpoint-GUID: tYUsyATkRx1G_HLt-XrwRX7bTfu0HAgP
X-JNJ: AAAAAAABWCOK1qoNcNK+506RHFFGeBNptfW73pDup1dpgJCCKC70b7XS6Zo0GCq8tojvcUlwX4gMXZQzcBdQQQC8infduJkkFUXAUbY7SviKI/S2i6LagEHi2qLfbXrrBq9uUOmINdOcO7sSKE3iS193tXpRX8A558VDXxqmUb9jYiW2O8Y/WAj1bBClaqLW6zhucz1qtwyQxSJOC2eNYmdBhxn3nhPgqZP2LPbIKuk+lIFa09yQBdthIgIo5UVMnBvgKOEs01vmY8sIifjYqWiNBnRI4qspQ9ePHP6hk89LX/sMvnqo+wYZ6RGrGjk1Ws4gWkiiflRbSBFwkLfNnuHj6q5x2wLJGeM0KI3aBOJ79Qc70FX072Mb8qgvg4Tu4K2NDCL+uVwZOydbi6qgeoQhxApNyVjGU3msAvAJoR/eFeu8V30onPIdYm1LbvEjz5EIpM2d4JuOacbC1or5kMHX8sE6cGnjw2U50oXmfAGuyEv1a+1uiUdet+Zm8Ow1wV/wVervgOvxlPhSsgrWUDoqsHrabMPUNhprRrJLwx+YMLHTDodjzWY80YK9t16C8SSg6amMSV7Oi5vdUI0gd0htbqRD0RsBkmrwB7sfBjTsz7U/qR4BdlC9qeFusz2QR7APcFY29GomXLLNsWR3DXIm6pISA6dubTauFIjsTPx7M1t0UPtA54HkzRkrjLNoeOFSNdBy1kBTroUU2Wubn7Emddt5zpSU20ewKYofgHJ5inwQrQN8yJjv0lx4sbzkgkcO1l7Lc9aeZX0kHgrG1u17D98yeA5ZR0q9OpXX+bGSID3KzheW67GF2wTzHgKA+ZmCz3mArHVJTZvY2ESNS1F2LqVzDT7Ui4qciXX1A87fnuvNhEveFPb1CyL5QOfnhoHWDktwISYgJAdgvkKAAFu3rDoNIiWTyW/VaQ6e+MphPSEsEjlSNeYZgGhR

From: Zhang Peng <bruzzhang@tencent.com>

The activate_locked label in shrink_folio_list() reclaims swap cache
when needed, marks the folio active, and updates activation statistics.
Extract this block into folio_activate_locked() so it can be reused.

Replace the active-folio BUG with a warning so a bad caller is reported
without taking down the system. Otherwise, there is no functional change.

Reviewed-by: Barry Song <baohua@kernel.org>
Signed-off-by: Zhang Peng <bruzzhang@tencent.com>
---
 mm/vmscan.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index e200ce3eb056..c6beca88079a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1155,6 +1155,28 @@ static bool may_enter_fs(struct folio *folio, gfp_t gfp_mask)
 	return false;
 }
 
+/* Activate an isolated, locked folio and account the activation. */
+static void folio_activate_locked(struct folio *folio,
+		struct reclaim_stat *stat)
+{
+	unsigned int nr_pages = folio_nr_pages(folio);
+
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
+
+	/* Not a candidate for swapping, so reclaim swap space. */
+	if (folio_test_swapcache(folio) &&
+	    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
+		folio_free_swap(folio);
+	if (!folio_test_mlocked(folio)) {
+		int type = folio_is_file_lru(folio);
+
+		folio_set_active(folio);
+		stat->nr_activate[type] += nr_pages;
+		count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
+	}
+}
+
 /*
  * shrink_folio_list() returns the number of reclaimed pages
  */
@@ -1623,24 +1645,12 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 activate_locked_split:
 		/*
 		 * The tail pages that are failed to add into swap cache
-		 * reach here.  Fixup nr_scanned and nr_pages.
+		 * reach here.  Fixup nr_scanned.
 		 */
-		if (nr_pages > 1) {
+		if (nr_pages > 1)
 			sc->nr_scanned -= (nr_pages - 1);
-			nr_pages = 1;
-		}
 activate_locked:
-		/* Not a candidate for swapping, so reclaim swap space. */
-		if (folio_test_swapcache(folio) &&
-		    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
-			folio_free_swap(folio);
-		VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
-		if (!folio_test_mlocked(folio)) {
-			int type = folio_is_file_lru(folio);
-			folio_set_active(folio);
-			stat->nr_activate[type] += nr_pages;
-			count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
-		}
+		folio_activate_locked(folio, stat);
 keep_locked:
 		folio_unlock(folio);
 keep:

-- 
2.55.0


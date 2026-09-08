Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F86A559C83
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880625; cv=none; b=ddx3xu91RMjE/hgCzbwJuUd1RlP2cgT3i2I375bCTj2uOF54QdBns5zowZDG3AN79nc+W21SUN7fhHu0K9UZEP3z0tWaF6CJlKM10s1WbQyjItIa8sJsoOvRxc05z7a3gsz8/T2wzhfMPn/xbe9wN0kll1EH/r+4tWMFs9l6lxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880625; c=relaxed/simple;
	bh=8STOz0RYKi+7v+knfY76tg8bbf4f7uqOVYm5Jf2KOls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZU8Di0iHZtaUhtBFNVteABbGzMm3rkkrPEgutP7LnbDct3yORQi7yB6TEk8MKhttL39ENu6qg31udALYOY8ZI/Q1wzura3QiCH9YG6MM2lMFmJnGeASSGNkGMN8ykv33fLqsT+lE1MbTXaBp6huXjGL3dlfgC1nQw7CeBXSccVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=VPfBwFhT; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=1AvnpUXa; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="VPfBwFhT";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="1AvnpUXa"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYpVw2420866
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=TUGg
	y+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=; b=VPfBwFhTXlKFwWloCWqY
	doiDToCv+ItHMrqPO8i1W6Tgwgz/M5rRQJYpKEfNUMWz5BJ2yLG+uh5r0CX3wyyq
	TKmf1kQmAGXXF3BJiEXFXxeso1ZOcG2jGlJZLCjrKINYDYBLatBvLKfKfPfcWcvO
	m0ayVUqVqT1dVAi7f6Qsa0hLZhPTzL1rNniu2/8pm2cMKQP+Sgeb0CvIqJl2TFbA
	vSLEIvvAgpI3kJk5ot7pZHladU6eFzG7h4Ajx6Xp1X0gl390LLJ48qW4au+CZrVI
	h4yF2ZuGZGkAOgNtYYq65A/PBG/UWV0El1iRS9lZegUCHrlUD+ytH0gxUUSpGfRw
	mw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d5d7t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:16:52 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91054f537f9so42300346d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880611; x=1789485411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=;
        b=1AvnpUXaGJ5/MB18RUWA+Ww7zXZ5k2ZS9NUjeMiWaebqmpFsWZAwUtDeszcP5XyDrT
         qfB6natl5RGeG1w8CTDs49MHaZqpYCSYZG3swhSsSySSGxcwQDg/PKBrEurSUij7i4rC
         hn4NvBkGM1xhrm4vcERW6+746Eh6uNjTBU8AIEPmgFKwv47a1nC4TLu34wpk3ueRlX+l
         bYIfzTvkufNcCcM3ktUv1kn+NiOgraAP4euysB76/0kEXzct98z26v5OoLLbZ7RUdWza
         duG4ARiuWCAiinVeImBVsoh03cC47Kq3tM8FNhqDAoxO93P2FapEm79U0II7FAQmE3Re
         JOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880611; x=1789485411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUGgy+CgNjku4PJ/FQqlsQRbEqOOlPzZGqKdff23MIY=;
        b=eavBItIbIOdazrB79IU5Bh0Mwjg/UJOAmtjJlbDL7+qNQcGM75bktBPZ972N2cZjP3
         lhVX/gIdTkEtAaK+5nel615dmutHn2tUVgrJhtRn+IAfiwCv1YDfpvLy5gmiCEC1RLr0
         QH1M2NjWYvxCSR0IJYKQEHpnrIC8oDcJjTKEDm7RzKXjBgtfLvwlHBJXkQOFfqT6lSgI
         Q09uSOKmlmqc8jceAKc8kjBdf8zt0kQydjUNXqyE/wbPTmNJoMdvSDdQLpT9G7tVHSuP
         n5NjbGjB4LhZnPaM3zsr8UXrDp1V3Br56+kMbBn8KohFSejyajMXtTSJnx3Xt25xdtJI
         fyng==
X-Forwarded-Encrypted: i=1; AKwUvBwrGLzpDhK62borxHQZ0EPUfw3yyWZvcozKOxaa465mD6xCCewT7bKEX/lz0n66dnSMyslJDW0DdlMqy9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ny4GGJaKQ0RFK1d41pZsyY8IUYywx28MjzZ91PESQfCKhUZos6
	wsppfjrkTF40wb4W9O1jqq0GtbVXZAkWRlxC0c/cvcH75u4mpABBWpuRoOOTM7TMZpLazwmtFYd
	eDmdfv9RjjX4rN/vkaGroLwnNcaCBhdwKjjcsUg0KGusTEvhITfMeIj0mUFTRvA==
X-Gm-Gg: AYBFou0r2iN+DVLbf8rn9YK2WWzLjOvER2ZW+wQ9l13YOFtP7z4dCY+BnOaK3GZchag
	BpM2JukmjSOouJ78N+PP6reQCl4WlWtoDF+3YgKjHA1H+XG8QZp4uiuK7y+x/bwO6Hyg5ZKlfC8
	mp5tqP/EmqI1W4tFm9K/EepgZWCq+cXoj37915QxSEO8B7vj4K2Luf78DuEkKXfDzJviTY3Ox4v
	FmuXveLaqB0U1UzaMsXjVe4ur/kBkBEbl9fjGI35xa1xxCrn9uOZqGiC2uxBBM5gW/NJinbpeZv
	x1Dk3V4gTJfw0XC+IWk8nVEXfPT+s/pxMrKfSxczHtV1rOkEZE4cXzotbb5w2rUHDfgQ+XvaHq+
	b63aqpelV1DVNTjyM/X2PsyKBgkZsR72Eq8j13S2Y+6Xe860ICeS6QA==
X-Received: by 2002:a05:6214:29e7:b0:910:3b67:b793 with SMTP id 6a1803df08f44-9103b67b7f9mr305200346d6.24.1788880611482;
        Tue, 08 Sep 2026 08:16:51 -0700 (PDT)
X-Received: by 2002:a05:6214:29e7:b0:910:3b67:b793 with SMTP id 6a1803df08f44-9103b67b7f9mr305199926d6.24.1788880610996;
        Tue, 08 Sep 2026 08:16:50 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:50 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:37 -0400
Subject: [PATCH v2 7/8] arm64: mte: pass the swap entry to mte_save_tags()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-7-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=2617;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8STOz0RYKi+7v+knfY76tg8bbf4f7uqOVYm5Jf2KOls=;
 b=3yiqYYUgynKMq+RRIEdaUti5K7MwMUXqY3WMxl1fsFaH046VsOb7qrugj7sTwz0D6k7kygoPl
 s02ruplAlBsCYZx/5WBodJl3UJIHGU4Yv+lkcZNrMnk7xeKVJglYrmg
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfXzRQtrZhwGOmu
 /ouzSS1kSvQDfTlqhg8S1IVz0kcR6e5Xka4F+2H02RjmDcs+aNX7rOHFfS4gBG6dscbR6pdJsBc
 A3EEXQlgeY0tR0lByCpW8CcrWIuYOLLi9g2xb8Hn9tsrdndghwgBgoCu+m6ZroK4WkXw1VhmQdP
 rDc3Q8ocqucwiPBnHvodve3X8mZYQMx6zfmTeQuuhaC5YK6HSIQmgXHm8qwCPKMc1ixKq0VzeLB
 PgcMd5c3WovnJ/Nx5Cy3Olk76op/svBOKIjhpPpuW+XXwovLGWpiy7WWGOHPKdpH4S3v9sfiafw
 zQhg1xk6fJihAV1G13GV9/Xe0YTH2hZYFxE7L/dwac5ZBw7vzj5vD08oiHGHX06DHsFEk+3lFdB
 klnw44dd8o+6Y+RDI3FrrRH4uwAobCpOF1qTwqeu+lTI4PTStipr1OpnszbQymxrvh2x/1XvC+r
 teZMjsmgbPIR7itBUDw==
X-Proofpoint-ORIG-GUID: gwkPy1RmwzemmGPD1PhGlCBQDFi57kHu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX75eMq78QOgu+
 mPBU+GyrAq0N/TAOa4mBpNa7nwR5JckXmPBhOMOYhtn3P01Iqds5dRm9+VbW+u6tIuI2D0nPkuH
 Vl/b0jSx3rzCNcOWZnMGhrzer+79dNkX6tXD1nfWUgBoUcSFuLcj
X-Proofpoint-GUID: gwkPy1RmwzemmGPD1PhGlCBQDFi57kHu
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6aa026e4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=p1CcqGZxNqfKctaSDs4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165

arch_prepare_to_swap() derives a page from the folio only for
mte_save_tags() to recompute the folio's swap entry from that page.
Pass the entry in directly with folio_swap_entry(), matching
mte_restore_tags(), and move the page_mte_tagged() check into the
caller so we only compute the entry for tagged pages.

__mte_invalidate_tags() loses its only user, so remove it and call
mte_invalidate_tags() directly in the error path. This removes two
calls to compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/mm/mteswap.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/mm/mteswap.c b/arch/arm64/mm/mteswap.c
index 3c54afc8b758..f64202b69309 100644
--- a/arch/arm64/mm/mteswap.c
+++ b/arch/arm64/mm/mteswap.c
@@ -20,22 +20,17 @@ void mte_free_tag_storage(char *storage)
 	kfree(storage);
 }
 
-static int mte_save_tags(struct page *page)
+static int mte_save_tags(swp_entry_t entry, struct page *page)
 {
 	void *tag_storage, *ret;
 
-	if (!page_mte_tagged(page))
-		return 0;
-
 	tag_storage = mte_allocate_tag_storage();
 	if (!tag_storage)
 		return -ENOMEM;
 
 	mte_save_page_tags(page_address(page), tag_storage);
 
-	/* lookup the swap entry.val from the page */
-	ret = xa_store(&mte_pages, page_swap_entry(page).val, tag_storage,
-		       GFP_KERNEL);
+	ret = xa_store(&mte_pages, entry.val, tag_storage, GFP_KERNEL);
 	if (WARN(xa_is_err(ret), "Failed to store MTE tags")) {
 		mte_free_tag_storage(tag_storage);
 		return xa_err(ret);
@@ -68,13 +63,6 @@ void mte_invalidate_tags(int type, pgoff_t offset)
 	mte_free_tag_storage(tags);
 }
 
-static inline void __mte_invalidate_tags(struct page *page)
-{
-	swp_entry_t entry = page_swap_entry(page);
-
-	mte_invalidate_tags(swp_type(entry), swp_offset(entry));
-}
-
 void mte_invalidate_tags_area(int type)
 {
 	swp_entry_t entry = swp_entry(type, 0);
@@ -102,15 +90,23 @@ int arch_prepare_to_swap(struct folio *folio)
 	nr = folio_nr_pages(folio);
 
 	for (i = 0; i < nr; i++) {
-		err = mte_save_tags(folio_page(folio, i));
+		struct page *page = folio_page(folio, i);
+
+		if (!page_mte_tagged(page))
+			continue;
+
+		err = mte_save_tags(folio_swap_entry(folio, i), page);
 		if (err)
 			goto out;
 	}
 	return 0;
 
 out:
-	while (i--)
-		__mte_invalidate_tags(folio_page(folio, i));
+	while (i--) {
+		swp_entry_t swap = folio_swap_entry(folio, i);
+
+		mte_invalidate_tags(swp_type(swap), swp_offset(swap));
+	}
 	return err;
 }
 

-- 
2.39.5


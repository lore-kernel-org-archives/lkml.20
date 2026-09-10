Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20974825DB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041775; cv=none; b=qImwGjNpln7Cewp/3s50Hs6jj7y6C9EeJaz9mdqcb4CiFDXvrLfkQllLGB1n6yJ8MoXaGlQ3olqH+YNm2FKGPvyJ36EG1VjDk3cmGdOwL+aGN0hQLn0FoGx07m5mY4MTEqltVqqFjnUBowypjfIIwtZlQimRQ5iHJkKSBkzidz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041775; c=relaxed/simple;
	bh=oZSNA87hap+8LZsY08iTLDC7668XQYqV9pSMcwVgaSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4VkHdR+qU9hWxO6+gRkYdZcr6V+sRsYJqxa3Y/hyxRJfmhxQqyiUkj0lWsnwQOIp1719AuTV5F7zlZG6VCk2sfPWX4+IBIh3dQ0oEM5ic3MlFIJT1xlIn/bGqZeSBIjY87jK07HGzi3dmPdt4X516R++mVHfyGxouzqcaQexUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=gAkp2IS3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cBn3+Vw8; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="gAkp2IS3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cBn3+Vw8"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 32D381D000AF;
	Thu, 10 Sep 2026 08:02:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 10 Sep 2026 08:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789041770; x=
	1789128170; bh=8kffjeZ0BbAQk8WNkrJMcG1UR27PMTOcUlnehRZ4hss=; b=g
	Akp2IS3NHDVLdMko2d0FV0YB9jFZ8P58J2lDDhdm+9rn2ICnAutLjjqPNBKXg5ji
	lOI02rQhsVa5mXv3g/m9fV0xldDJQ2Inh16KvSZsdlBpaCdx18L/X6PWmvghqoEn
	TkljnvzD3nue6abvEgrfgqpzSAa+k34eHKHFdenFppTVK0gWBTYHpals4W/6j+ys
	zwrHjEh3mfTvMsUghgzLROyM400/foH2+TsWMn3WK6buUEYVBgcW+DNki8hsl0Wg
	XSmzuwv+hmkJFLXpd/CBy66Cp+lgdWF+0nCtnHJZB8NLNIK0GORKzn5hiun8QHXJ
	HatFXX6MRpAlEmxYMxkrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789041770; x=1789128170; bh=8
	kffjeZ0BbAQk8WNkrJMcG1UR27PMTOcUlnehRZ4hss=; b=cBn3+Vw8POMp+fium
	FQ//oEUoWBMKXZdRZ86XmcbWe3fhuloiKaHwzrKiMyDUUPzFJoTAU3VEYgbKeTOK
	j/tqsnDr5jSq8iJpLC0bWqmyKkX8W7XHXARs/lbBoRy0jErYut2DmM9cTw9gyi6g
	Fo8Gx9oNLlc1jEbFFgJMc2BqCtK8zTWJj0nJW+JwNE1Gx1ndN08sd9TfJBhKNrMx
	zwh0jWKP5PTh45SFCtHgVlXDMSswUok9TXoy+ac6iPGNGjc65vvps9KrrCoDGKyk
	oSy+EDoI1kLKNQmz/GWZQOeczDhEx0llpanWN3rOOhuc8tTNKSwBofM07oLxeOkA
	TI44g==
X-ME-Sender: <xms:aZyiavIh7p5NixtID34QQtB1eVLozEiAENhyMdgT-s_uAfxfbeHzWQ>
    <xme:aZyiavGeQA7vI0J-4d_Kc49zX_HQz14E6ycycMDOKc9IqOf3vC2q4oJ-_jo12CWcg
    ipsdZKPb4cVGT_UVGnoeSwRFlVej4gisvItw6tfDUpk2kCi0dy_wBLA>
X-ME-Received: <xmr:aZyiat3OXWeev0a7czX4UgyDQKGJJlHfNSh4BJIXf9TBZD4X_rq7P0YGMns>
X-ME-Proxy-Cause: dmFkZTEVCHaom43ud29NDpH2Ao3u7HJ/1ECQvA0KKWbvYxhttLa4TfzKR6zF5UuYx3UdSX
    No90AnuR4y57x1CX4a9AAsMV1JR4eQYCvRkfoTmW6C9Lc6lI8AZbTNwmqz4UTzT3vnk7qg
    ph+TCI1xI7srBtDO6Tg5MLzI4vqgzAzQGVqRHCjhPRmxizMOs2MvZfOp4fytB88FrNmNEM
    gORbCSjN6PT3vgIUt7WNrJZsAWFpVymtt3pMoPYb3jF9rU+m42uK7S67tVqaIc+biyrQXs
    /trDbiCnZfBDKlB4R/Y3z4EcguiWXCyuMp2o4aP4AZn5jbn1xeIsCoHcLAwPh3Pk2CuoZA
    UmuXX4LIsJW7XVhqlJ8zVOJIJ0NZD3NUnvHLW/LU5aYowrVKTasei+Z3d2uPbvnci0030K
    yz8sOx+VruTDAAU4PwIeDL2+c/v69MtCSMnOR2gZBHe1xmwcFNPzazqUiDd28vHkibOjBl
    rydmZFXtzNseUJaRa69q6JOEKLHbI//bE8Wmkdx6AhpI6UOOXADahWweL3ANdYpno/6T09
    aeZ/Owe5RdNZf5Setq1i2PJ7LMhHyjLJfZELXrv9fOvpeSYe0A5jBN8sv4Sj40ecqCdKBY
    WMnR4RMhwbxccxq+s/2o8NRXwS9R8hFoxtFyZYufbV+lgI2m3qedCD8KSyag
X-ME-Proxy: <xmx:aZyiaux6LcdLjkSvTRSrNZkw2w7y4AUEyBq9QobZ3ViFAI6fVp4xFA>
    <xmx:aZyiakgRHbFSW53CW5Cpz4_NFSzqJG5vGeRZrL9W1Toy1gnY1h08Kg>
    <xmx:aZyialynb4LFmlvuhEjIHM23pQr13s71-B1dET0RIUOV1Zu6TguLnA>
    <xmx:aZyiaqwJVjWkv8lOp6QD3_WcVYc8808VK9yFOXDlU7Vcf-RflZqovA>
    <xmx:apyiauCl9mPky25QS1wxM759gmk4WN0YzQ2aygLrcw8WP6GlGYk7Rlgq>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 08:02:49 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 02/12] mm/khugepaged: count collapses where khugepaged makes them
Date: Thu, 10 Sep 2026 13:02:22 +0100
Message-ID: <20260910120238.2529819-3-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910120238.2529819-1-kirill@shutemov.name>
References: <20260910120238.2529819-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_single_pmd() bumps khugepaged_pages_collapsed for its caller, and
tests cc->is_khugepaged to know whether it should: the counter belongs to
the daemon, and MADV_COLLAPSE must not touch it.

The daemon sees every result of every collapse it asks for, so it can keep
its own counter without the shared path testing who called.

Assisted-by: LLM
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 75c876acf527..4979a93e3648 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2815,10 +2815,8 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 
 	mmap_assert_locked(mm);
 
-	if (vma_is_anonymous(vma)) {
-		result = collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
-		goto end;
-	}
+	if (vma_is_anonymous(vma))
+		return collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
 
 	file = get_file(vma->vm_file);
 	pgoff = linear_page_index(vma, addr);
@@ -2854,9 +2852,6 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 			result = SCAN_SUCCEED;
 		mmap_read_unlock(mm);
 	}
-end:
-	if (cc->is_khugepaged && result == SCAN_SUCCEED)
-		++khugepaged_pages_collapsed;
 	return result;
 }
 
@@ -2933,6 +2928,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 
 			*result = collapse_single_pmd(khugepaged_scan.address,
 						      vma, &lock_dropped, cc);
+			if (*result == SCAN_SUCCEED)
+				khugepaged_pages_collapsed++;
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
 			if (lock_dropped)
-- 
2.54.0


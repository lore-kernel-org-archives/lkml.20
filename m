Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88BF48592D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041786; cv=none; b=aFTyExGxRO7dulGUUbHCyYstahTjHOYfz8MWMI4Mv7DAze62dipt6Lt3gp3FseVuusZ1hwzsSapRWhy7hK1PTxhynMbYmB7m2rgjZCceMM0Q0XwdOQzKtcaY4TfUqKSCfi2qqrEUefpRLjCeqrfwRPaJoFXcLrSoORqyIIOlGV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041786; c=relaxed/simple;
	bh=FsntK079ojb1NSC5PYEXoKjgxib/Hm4XcgWRqpaOndM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcVhFqOKTfoHcqpwDC/FgKlgCp1dOwy6X2M3Z193SQ3IZlixsFhxk11D2SqV8mFy6/1pbPa4t89ePY4k5pwt9EV9OXbsrz9xmqBh1B8Ea9wa6ZA/ccI24RYoIki2VFq5ZbAtjLNfKSqRSHAHFMrlx3KGUNT/NfbiKR6wYbS1pLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=EE4ZmaYn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FimdyeX+; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="EE4ZmaYn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FimdyeX+"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9F3887A007F;
	Thu, 10 Sep 2026 08:03:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 10 Sep 2026 08:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789041783; x=
	1789128183; bh=3P2qVnrMLPFA6A73AmtwzSkxgpkuNKe+y7ebrjYnAuo=; b=E
	E4ZmaYn+xzGWUrFAGxtuMzW2lgwc+5yQHzoW3tUnRfFCReRK2pZcN92qd/KdVxme
	dP3feioWtbpSG2j/mUuul/CIX6lTRTy1jqjZqiIHXMjItrCTLoRk3r3xbAFlNCBf
	Wc+dyyesEZJtvOPrrDRIcLfl7pLJ3dk5Nby609dVpb+nySy3xIktrteojQ5z8skB
	XE7+hKRX4ykHnWVBPgd7f4Sw1hOU6A3MHLWjb1BSDKcIeGczic5AQaRJOT5MW1QH
	2sBVYhCKvaQobKwXWJrZvXm4vdxzIuIp78jJNZfcYIovJ12S2yVXwNxUK7lqvllA
	+raLeuq6eBdSAu88GXTig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789041783; x=1789128183; bh=3
	P2qVnrMLPFA6A73AmtwzSkxgpkuNKe+y7ebrjYnAuo=; b=FimdyeX+I8ss92KOM
	8oprLKsYgVjsO24m/kSxVTReJ3pLyOhpsEoBfBke0mHEo89/2GPjIh21X3eUfh1W
	CMhmU4BnBNMpCGXdGnneUhzs3HeauGmd4aWY3jv6cjp6HVfAduY3RYEMpHvs0hc2
	3TtHp8GTUxM/DHseXCgI5EfgnQ78WfaaqODpG4wGbA5ucgXC+DHlnoX58ugjPlsA
	Zpaf3TuB+vGS9a10O4ujldrhv0tPtdG9XXY2gYxFjWzBOJedsX/b7HPdT/xFKPvT
	QgJaJpIMU5eisXKkJSCojKr3LqdER3TwMQMgbiR1BA/7yy/U1UymWurbc1Q6CXXa
	twGTw==
X-ME-Sender: <xms:d5yiasfYXNRd6LCkwBvWRJdbswcLfI-Cx5cttFtQaeuBKssiiVtvqQ>
    <xme:d5yiaqLVA4knxqFHNs6xJiDepBRPlyquDEqA2ik6B91pTn8q4wg3QI1E8lU56wD98
    oqHeOPpIrhU-8vx5fazoJ79GC-ssgnRBMOPSky0TCMoP7h5m6Y3CIR7>
X-ME-Received: <xmr:d5yiajoey_hPVT18zmHfaIZUqkKEOCrlSYK32uZN3oUIt2L_BR2QSic06ko>
X-ME-Proxy-Cause: dmFkZTEVCHaom43ud29NDpH2Ao3u7HJ/1ECQvA0KKWbvYxhttLa4TfzKR6zF5UuYx3UdSX
    No90AnuR4y57x1CX4a9AAsMV1JR4eQYCvRkfoTmW6C9Lc6lI8AZbTNwmqz4UTzT3vnk7qg
    ph+TCI1xI7srBtDO6Tg5MLzI4vqgzAzQGVqRHCjhPRmxizMOs2MvZfOp4fytB88FrNmNEM
    gORbCSjN6PT3vgIUt7WNrJZsAWFpVymtt3pMoPYb3jF9rU+m42uK7S67tVqaIc+biyrQXs
    /trDbiCnZfBDKlB4R/Y3z4EcguiWXCyuMp2o4aP4AZn5jbn1xeIsCoHcLAwPh3Pk2Cuodv
    jdvPCsgoell1QwQOyq0lvh52cXi36YL8xROZPqyLVvgeWiebTZZvmdLF57eQz75ZMRoVgY
    ljlYRhwz6gxNZoz8VK/FA0zpwTwkN521ywySnZx/Vyub2vFHRCS3SsNc4fNTJQkus5W4dZ
    T6RMH4i7St575scy7WNwXS5FlI7RziOulg6yL8fAjn9BarOT/I7NsStoDPdP8Akd7ladfM
    lVox66/G2cLMhZYiWREwxfvNJVxLr6APh9MeluH/Fa47cZA0HeyBDs5+Iop73ziWvaYaiw
    9CgEi9ST5w0GkoTFe5UjIrTl235lyRYdb63sqaOkJwGIBVe3qTOpwpS2xTpQ
X-ME-Proxy: <xmx:d5yiaoXTwbdKJs3hScmRlbF_u_9FYjiorjmZq3L3OwxyBELPXYUhBg>
    <xmx:d5yiam1A7MJhoYX9S7DhKVohRNc_sBjWY-OV7Wa0lDvmtGTW2x5BWA>
    <xmx:d5yiah34Hci4Wk73ePkTNRPvIz8lA_Ks30cGCl_X5K1hu4yoUgcDzw>
    <xmx:d5yiatnRB03BHf4OuS1_g2-Uhpq3uQMJdpvxNGQOy2cCryu48eh0oQ>
    <xmx:d5yiaj1k5J64ERDqzZ4R0kWh__GC7j8tjW8KIg5wxrQKNBYxrBMwSxZa>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 08:03:02 -0400 (EDT)
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
Subject: [PATCH v2 07/12] mm/collapse: name the per-table scan reset for what it resets
Date: Thu, 10 Sep 2026 13:02:27 +0100
Message-ID: <20260910120238.2529819-8-kirill@shutemov.name>
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

collapse_control_init_scan() resets what one scan accumulates: the node
load, the allocation nodemask and the eligible-PTE bitmap.  It runs before
every PTE table a scan is given, not once per control, so its name points
at the wrong thing.

Call it collapse_scan_reset().

Preparation for giving a control a real init and release, run once each
for a whole series of scans.  Two names a word apart would then stand for
two different jobs.

No functional change.

Assisted-by: LLM
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 2a9f6d8d6695..d38ba030107b 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -550,7 +550,7 @@ void __khugepaged_exit(struct mm_struct *mm)
 	}
 }
 
-static void collapse_control_init_scan(struct collapse_control *cc)
+static void collapse_scan_reset(struct collapse_control *cc)
 {
 	memset(cc->node_load, 0, sizeof(cc->node_load));
 	nodes_clear(cc->alloc_nmask);
@@ -1579,7 +1579,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		goto out;
 	}
 
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 
 	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
 
@@ -2657,7 +2657,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 	present = 0;
 	swap = 0;
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 	rcu_read_lock();
 	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
 		if (xas_retry(&xas, folio))
-- 
2.54.0


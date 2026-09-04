Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0D4CB8B7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534637; cv=none; b=jo44maCs6Ynnt+tolR1LKy3HrfOjqFZOa49Kb4HVhF7P8JJ1gZ6HxhOuRUajpSCtOPwql2IgKihYE29mg1gRmpuUi1XJjJbtsnucaSx0pAnlJ7TnrnNNXRkafskD6D4KSOQguisAipzLjuG1azH7h9O3W96MB48kfGzOnSOuuQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534637; c=relaxed/simple;
	bh=pNR48Fc/9IOVMlUYIZ9D1Mkt9Aw1S4x4HIvGKwL0w9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePd8+X9Q/aAhIplBcD3AVtz+X4JZM7mrw+oPcKwF+PzdMfTlD98I38ndunrhGC0j8eDmkgE9XeunYYJW8A5xG/uu09VP9RQjI45rTc7EmbMHCneQLKczOF2JHCZzj5HGWdc7aIiy+TALR9SBPe54l14vsZYddAnLlx30efvqVMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=L3NweBxO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gyV2zD0K; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="L3NweBxO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gyV2zD0K"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 262ED1400106;
	Fri,  4 Sep 2026 11:10:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 04 Sep 2026 11:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788534634; x=
	1788621034; bh=b+81dAj5x80FGoAjSvzsRnSg4Kzca8fLKWA2APX95ZQ=; b=L
	3NweBxOYvekh7y+hOqszpAnTsy8gz0WprsWq8AldTZqaL/QPKFChdgvlQrLfc5Y6
	aqXesZ2d9nEwwTqE9cR6Ivgc0b3042sKxWSgANB2qWTF5KD3Ijzuqw3ZwjfQSneQ
	3UtQLvzV5hPT5zDu3WX4SlMKFiszdVoUK/pjKw3IlW6k+Gr59ovuysX6fMaaCbL/
	aDoZ0aJbBG0bQFGmRs9JtnF14+SJCcnByRyzvJmBaPSY4RJfW2ObrlDgq1GXoGjO
	mc+9E9DURSxJ/XYL5lvd+QAw8Ar1v0PMwoxF1fsHmlKKaZt5SFOaNenQY6QZpG47
	srbYSaeyQOf6m7DwbmBRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788534634; x=1788621034; bh=b
	+81dAj5x80FGoAjSvzsRnSg4Kzca8fLKWA2APX95ZQ=; b=gyV2zD0K4arKTtjK+
	89MDgRn69V26iXslSbZHsojlXX+xmoSbFVH6nABVDMWD8tO2/sZv6ko71UnxWQXE
	xGDSSeA0yRJq7tu85SH/ENfOCw0ImG1pFhRwD+ZWfSRbzkXbWIo5p8c1sP+aY35b
	iLnC1mKnostEQ9pyNkYX7BANKA00/iX9hP9AJ3KLcL1JCrmjJoqdPmO6y7iTczon
	AgrxR4aQ+QKDO3lwuQhm8NVkLBR7aoMLp5Pj15nGOJzVRK5nlFJGoPgfnnvOM4dp
	0rc0bA32oZfval7SI2f7+egEvMh4ylVRp+EzTYIt4LzPag2gC8hyJRKROgECubqT
	1ThNA==
X-ME-Sender: <xms:ad-aar2BS6CodJ8deXMTA2O5dMh858AhxhrdFzSzk7RQ3ScbINEsSQ>
    <xme:ad-aamDKNuB8LtaUm6vTuVqXqDdxjrMQCzBUnnuj2jh6jhTmkFszbXc8uf71KSGsg
    -BZKjeOuoesIYC2jlhibbcY7GDLjVja7zX3fTSrum1LdkmhED21s-Or>
X-ME-Received: <xmr:ad-aaiAHiERYuIuqxWxXB8oL6ki2ap0oiQ_mo15vXZcbsw-OatJekQ61-eY>
X-ME-Proxy-Cause: dmFkZTFdOocfRN4jOpcQf0AqfSai/YCGo+xlO94MLvzn7lqitof50EENUNEgJzLPt2H+RQ
    DWgrwJL5dg2BaLkWQfjz0w8mX09EzID7A24sM1R0CcrzJ0aCsxP+pgO1accdG5RnvXKoNP
    Qi2+ranCgsFBQlrx3RUM64Xgm9l9zr2TPWbzFNtan3mUwkVlJ/gBEGXolzLuuMZ3CJ6e8L
    gmzum6oDDF3av5ecJE/wINba64+XlYa/U9oL8c0Dkr16eu3wp8w8wOsHTRTsCgO4oV0meO
    0fb7rtZliPO8XPlA3k/rGcTv+01JWMnSe6fG3OACTE4UctUjoP9cM2YnBbUckeF0hhckpt
    aMYL+zmXSgfpUsAfEbdq3YcIoDlCmZxuiv4vEQV80awfFv7+kV3xGOfWwk+caLcPCmKQfj
    TKRiZUVKN65tTPwVy12o9rg9A8OAnzwOdHKxy66fYZzQOeRzRghLrCcywsyUmjySG2SorR
    AI7XMp9dEEpZKqUw0c8FQEevu0Y2iZ3joWaO39rAcm9Zba9QxhTcdlDK8OlRJM7b/9GNfo
    rX6/rUjmWqQUUBqaQ7kTJfP+KvRdWdx9PhtIWbhMDsjMWyFqorifeMQGo8xtnO9vLKpSNG
    Oo97AIto7b7gxYB/alJR+3nNAoiHuOgKfpdgoWIPPdo/w6UAQeSR9SqqhTMQ
X-ME-Proxy: <xmx:ad-aanOhd9h7_JnBXTViOlgfJxYx-c7W6wO5SaVLOMyR1L_kmPPTTQ>
    <xmx:ad-aasPCwEL8c8K-rzsd0SK6J6o6egpUjjokjZkaI06QM3_7SkSglQ>
    <xmx:ad-aaru6-t1H8iBob3uNYt4lNi7IzgU2ZlB_gCHXm7Zks9Lqcd4oKA>
    <xmx:ad-aah-jiGC8JVyALvoaiuitYpPSAcv3yKVHlgn5U9FcM8LA9bGLqQ>
    <xmx:at-aaiNPopID2c3MM0mzpm1g4Eg-hkDhKaur5yjr0NLQDQhros6zKoM4>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:10:33 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 02/12] mm/khugepaged: count collapses where khugepaged makes them
Date: Fri,  4 Sep 2026 16:10:16 +0100
Message-ID: <ef229484e454d804ffbdbf8ae87798919594fd1b.1788533997.git.kas@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788533997.git.kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
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

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f1f8d4375e96..a6dfd8cddc50 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2822,10 +2822,8 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 
 	mmap_assert_locked(mm);
 
-	if (vma_is_anonymous(vma)) {
-		result = collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
-		goto end;
-	}
+	if (vma_is_anonymous(vma))
+		return collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
 
 	file = get_file(vma->vm_file);
 	pgoff = linear_page_index(vma, addr);
@@ -2861,9 +2859,6 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 			result = SCAN_SUCCEED;
 		mmap_read_unlock(mm);
 	}
-end:
-	if (cc->is_khugepaged && result == SCAN_SUCCEED)
-		++khugepaged_pages_collapsed;
 	return result;
 }
 
@@ -2940,6 +2935,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 
 			*result = collapse_single_pmd(khugepaged_scan.address,
 						      vma, &lock_dropped, cc);
+			if (*result == SCAN_SUCCEED)
+				khugepaged_pages_collapsed++;
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
 			if (lock_dropped)
-- 
2.54.0


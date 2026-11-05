Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904131;
	b=i1AFRkasgtAeB5HZfbqJT031AsNwJhTW87OAqf9HLA7v/bDba3o2mh78aZrEY1b3k5+k
	 Fz5eYaq0FBKBjkq4TFCx7EMY6CaYtx673LMWzLZPwfJDVHvwRbLixW88G0B3vFtHibRP4
	 jF+8kvyb4nysCVv8+VECMhIoyDWtFfkE+UrBm4lUKVvjXyyLyNWjRkNaq8gT5Qnyz3srd
	 wLMW+zU6R5eRGtXmA4S+dP3QyxwwohUAlPT0rX/Ag+fmHAwwcqWfXoo5pahVtxp+e1bVF
	 t3WF98JHgWHNXaup0UGtCX6eN8Zw7R3UQL7ndM5KK5ou6SZSnehT44g0Y6zha1HiALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904131;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XqXD/2lRDAC3Cnm8xmgp9dv4WWL3d1GwgU0I0vWe+J0=;
	b=UKPwA+G3WB30hVpPYBahRnzS/janXyQj4qh3EyjIYz6z8m9M4ZgbDXxZ/YMZyy+VUKUR
	 xs1X43hcyWIYV7PCKMht/w48IEd1rIFjbtyCSHLOH7NdN9+Iipi+/PP87ZxCGQXHygM+/
	 36Db110kQ8yocotzVUvthdQeCOMkSIqf+WRVtWFQYyp7HI/Zft16yBOq+cTxHEYqDELu3
	 PWkZrR6D+LLmEAEj3ZI8SfP2XdomuyvbxoMMpUsVYRbVHuP9KuMNLzPIozrR+hzOVFurz
	 NoW/J4MPsqZS/nW2gBXlDkWuoYDp29qn8cnE5HkkEVR6vr3gQvoucL+huRsPqiFzdBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DdUxBCDe;
	arc=none smtp.remote-ip=95.215.58.122
Received: from mta1.migadu.com (out-122.mta1.migadu.com [95.215.58.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ABF606D809
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38ABF606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DdUxBCDe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Oac/ikxAEitIxX3vkVIXGNQJ0CtOZchotmEuyKH1+mQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904129; v=1; x=1794508929;
 b=DdUxBCDeUA0lDuFuQozci7cp7RXvJFszP+waC3nslSx79HXclOQ+fDjPgLmLQo40t+aQrjOa
 ZwiH2vLu5DFLnzLgBuC0tHGvj4TTG8JoSv6SuZf8KY9xfM5gtsKyjdzzqUhoIOI64lvsrixQPed
 xzVdIm2iFs9yFDNdJNIr/B5M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 049b5ed1b8e5d6a9;
	Thu, 05 Nov 2026 18:42:09 +0000
X-Mizu-Trace-ID: 049b5ed1b8e5d6a9
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v9 26/32] mm/khugepaged: treat PMD swap entries as mapped THPs
Date: Thu,  5 Nov 2026 10:39:10 -0800
Message-ID: <20261105183940.2236717-27-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_pmd_state() would report a PMD swap entry as SCAN_NO_PTE_TABLE - it
is not present and, on x86, is also pmd_bad(). The range is already a THP;
it just happens to be on disk.

Return SCAN_PMD_MAPPED next to the existing migration-entry case and before
the pmd_present() and pmd_bad() tests.

This does change MADV_COLLAPSE. Today a swapped-out THP is HPAGE_PMD_NR PTE
swap entries and MADV_COLLAPSE, which ignores khugepaged_max_ptes_swap,
swaps them all in. With a PMD swap entry it reports SCAN_PMD_MAPPED, which
madvise_collapse() counts as success, so the call returns 0 without making
the range resident. It still faults back in as a whole THP on first touch;
only the point at which the I/O happens moves.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/khugepaged.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index da91762f6358f..b900037bb43c4 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1065,6 +1065,12 @@ static inline enum scan_result check_pmd_state(pmd_t *pmd)
 	 */
 	if (pmd_is_migration_entry(pmde))
 		return SCAN_PMD_MAPPED;
+	/*
+	 * A PMD-mapped THP that has been swapped out is still a THP from
+	 * khugepaged's perspective; treat it like a present huge PMD.
+	 */
+	if (pmd_is_swap_entry(pmde))
+		return SCAN_PMD_MAPPED;
 	if (!pmd_present(pmde))
 		return SCAN_NO_PTE_TABLE;
 	if (pmd_trans_huge(pmde))
-- 
2.53.0-Meta


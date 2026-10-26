Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792983463;
	b=wV0Ud7uI+gslOaYTA2ZkGUANihDnEdzySBQA3PpNfayug28aXgAIVc29wlb+GaUMchbL
	 57psqjndonDqHv581exyKqkZor+X0AoDUeMmqn8DdIS7Tt53xhqHlZdjpnPHyIaWDZbb0
	 esAuubB71mMJ6WRfTHGMHQnweJr5BrBruWW6iV/3ODGnnWV/VwHCH8vArpXJaXhM5ydRh
	 FssaFROyKbrs6xUvnafDUtNhRkNWXxUXsC1qzfE8J/1iDx2IGwv75gJFWdWhQ1sYWYvNH
	 S1MUvUvMxePvsjyydFZf9O6VCfyQuIbXCL112DYqGkcjsOb+wFnV18UKbLvr0AoV5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983463;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NzJdTpJrDb5R72neOAFckZsEzGBQ8VMj8qau5faLwV4=;
	b=07v4XChkR1KWEfDxoYY16rKFb7jjyzUeMSngT6LOHVh7V+YAZbfy225ApEFI+QSQLVN9
	 +mwANzIKOVZLslC/iWrxCSlFJ0vMxhbHeOnT1lQkgZfdxomjCceZVSFUe+2TVEkCvu3Ob
	 uZ1B1AiUeJFzbafnDSxy1LlsLETQUFAboHKNgJ+L3PqzDY2jLiw1RK+nZsbjxgzWIveQU
	 L4H9IYSXUyHbRHd3bCC/8xu1l/A297+vQbzXH4lM+fMYWULTjeuXxnrFTIA48Rc988S+E
	 cCNFjF7Rgyq7jf/BjVnQSR2db2xUyJnsGG1SqAZ4+HF8eiz9n5WjGfNZ6wobAxDXYqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=A4TATAUp;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A0B606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=A4TATAUp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792983453; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=NzJdTpJrDb5R72neOAFckZsEzGBQ8VMj8qau5faLwV4=;
	b=A4TATAUpLx7wM35b9j7A15JDDeAOfpxrdKCNUtgnyJ+onSKyhoGmvlWiD4bWBDJEPuEENXl3lT3VDGAq0mkmClOZbzUdsTJO//B8pvzu+YGzVXqWFAfZiK0Q6q++IryiN6pnxpB7cEu9ZJ3alvDNWPR2j1pVW/fhwQOADXzH2h0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R541e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XDRaNAX_1792983444;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDRaNAX_1792983444 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:57:32 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>,
	Kaitao Cheng <kaitao.cheng@linux.dev>,
	vbabka@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the !copy_mc fallbacks
Date: Mon, 26 Oct 2026 10:57:24 +0800
Message-ID: <20261026025724.1430747-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

Where copy_mc_to_kernel is defined, copy_mc_user_highpage() and
copy_mc_highpage() stop at a hardware error during the copy, report
the not-copied bytes and queue the source page for memory_failure().
The !copy_mc fallbacks return 0 after a plain copy instead.  With
PG_hwpoison set while the data stays readable - software-injected
poison (MADV_HWPOISON, the debugfs corrupt-pfn injector) or a
transient hardware error - there is no fault to recover from: the
copy completes, the destination folio carries no poison marker, and
the poison is consumed silently, the same poison consumption
commit 841a8bfcbad9 ("mm: prevent poison consumption when splitting
THP") refused to risk on the split path.

Check the source folio with folio_contain_hwpoisoned_page() in both
fallbacks and return PAGE_SIZE, the not-copied-bytes convention of
the real copy_mc paths, so the callers take their existing error
paths: the COW and fork paths fail with -EHWPOISON, KSM and
khugepaged abort, and folio_mc_copy() propagates to the migration
core, where this composes with the separate migration-side checks.
On archs with copy_mc this code does not compile.

The check runs after the copy: a check before it would leave open
the window between itself and the copy.  A flag set before or during
the copy is caught, whatever state the data is in.  A late software
injection cannot have corrupted the completed copy, and a synchronous
hardware error takes an arch without copy_mc down at the access; the
residue no flag check, before or after, can catch is corruption whose
hardware report lands after the last check.  Closing that would need
architecture support, as discussed.

The fallbacks do not queue memory_failure() on refusal: the flag is
already set, and memory failure either knows about the page or has
abandoned it.

Suggested-by: "Huang, Ying" <ying.huang@linux.alibaba.com>
Suggested-by: Kaitao Cheng <kaitao.cheng@linux.dev>
Assisted-by: LLM
Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
Link: https://lore.kernel.org/r/877bjowf9i.fsf@DESKTOP-5N7EMDA/
---
 include/linux/highmem.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index d7aac9de1c8a..f90f0c6204a4 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -474,12 +474,21 @@ static inline int copy_mc_user_highpage(struct page *to, struct page *from,
 					unsigned long vaddr, struct vm_area_struct *vma)
 {
 	copy_user_highpage(to, from, vaddr, vma);
+	/*
+	 * The flag can be set while the copy runs, so check after it;
+	 * a flag landing later can no longer have corrupted this copy.
+	 */
+	if (folio_contain_hwpoisoned_page(page_folio(from)))
+		return PAGE_SIZE;
 	return 0;
 }
 
 static inline int copy_mc_highpage(struct page *to, struct page *from)
 {
 	copy_highpage(to, from);
+	/* Same reasoning as in copy_mc_user_highpage(). */
+	if (folio_contain_hwpoisoned_page(page_folio(from)))
+		return PAGE_SIZE;
 	return 0;
 }
 #endif
-- 
2.43.7


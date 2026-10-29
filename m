Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281543;
	b=eygeUvmdm0OsTen3lpvYfcem6PIFVziupxqQR3YkoOkCNsKXvMjmCJ5bz8QwIKVC6oHu
	 aHISmroGqaDH7lUpvra64QIWRdqSpH0rRcqHH/rMWM3bDdoXXKH6Hc7LbtJ6PNXVm4qOL
	 KauJOKr2Sm+F9cdjauE2X7rZpQWtZAPcaKXPjmDU/PhrqVGQBkIjS2Z91wwAP+/OZLndA
	 JFcUc5erI7cx++MJkLpdcCydtzkrQOvEIGvFrclnQwOlO430dTDSitr/MNggfYlFhmue7
	 oHz0I925SG12kRn7r9cvygNCz+eYsnSqnTGjic3d416k6W8y0iSGRZV+dKbHamwTCbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281543;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wJT0qNivsFiEMNKsSij5ScAgPVWg2VVQlzOAywU4J9k=;
	b=mAgdySy0EM9rfsNgIXToFLEsBMtD/HsU03cron3k5yFo0sre7Hx8fy4SZzavlwXmg2QI
	 C0D5eN+8zLuz23jkMecWAlbd0wtoxQHtxUNVPfxm3qIRk+J3fQQOlD6i2sPkvfjdOq83c
	 7xcr7rT0PXNzFp1U3eDqparIrBhKX2hOxCpeZtX66zHlzBHojMmuO0oumBQXeLo3FzQLQ
	 byXSJAANKpz27ujWEYmE4cigLXVfIkrJ5Q2XFhcAr78hVpcQQbFeCDYhiwpCWCns1oKq9
	 LXvdt0kx834QR14aE2xkXustm5FH/35li1msqZeSVOx+NCwXkPfKAulvqV7HqcaFhhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Cz5HSguP;
	arc=none smtp.remote-ip=95.215.58.176
Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FF5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FF5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Cz5HSguP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6DYKw41ZmZGB0uwcA/t8yCtX3UGied1T2paRqqLwCDY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793281538; v=1; x=1793886338;
 b=Cz5HSguPR83KNma2vGPylNYYzanACosUzv6DCUd/SGnlh0nUQ1YEpmAV2GAFYhMsypRKUtWC
 r/AarEpJUNM5uMjxnJtfesPmAhA/J2cqH4VIPJFndj8ttSrTB5oX+w7s4GlAVlEsw+XhGSERakq
 NdDwWJSyLO8Pc/U8yGnrLDrA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57fb9af743bccf99;
	Thu, 29 Oct 2026 13:45:32 +0000
X-Mizu-Trace-ID: 57fb9af743bccf99
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v2] mm/sparse: simplify the vmemmap alignment check
Date: Thu, 29 Oct 2026 21:45:21 +0800
Message-ID: <20261029134521.62146-1-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
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

From: Kaitao Cheng <chengkaitao@kylinos.cn>

sparse_init() is called only once during boot, and the vmemmap alignment
check is outside any loop, so VM_WARN_ON_ONCE() provides no benefit over
VM_WARN_ON() here.

Use VM_WARN_ON() and fold compound_info_has_mask() into its condition,
preserving short-circuit evaluation.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 mm/sparse.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 6acb628c8a73..759b85172adb 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -277,10 +277,8 @@ static void __init sparse_metadata_init(void)
  */
 void __init sparse_init(void)
 {
-	if (compound_info_has_mask()) {
-		VM_WARN_ON_ONCE(!IS_ALIGNED((unsigned long) pfn_to_page(0),
-				    MAX_FOLIO_VMEMMAP_ALIGN));
-	}
+	VM_WARN_ON(compound_info_has_mask() &&
+		   !IS_ALIGNED((unsigned long)pfn_to_page(0), MAX_FOLIO_VMEMMAP_ALIGN));
 
 	sparse_metadata_init();
 	sparse_init_subsection_map();
-- 
2.53.0


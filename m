Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397168;
	b=YYac0OV0NTM7rohHn6/YP5ghLo17HMeq8wq3zN1zp5kD0FzGN8oWuS7i2CqbZMQXXV2u
	 4e1A93Yg7BScub3SVD/fs2CRaarpb8Nky7IrLsBKDFaq3zD9SMo3eCJMCOVwB2XxdZZCS
	 58V8pv4GolVh6zvaSUvZsNw7rHu5M5aJX8gpSO5457pKG6NUwSEZbVMm3UsCexrVJh7iH
	 hngxRZr+lqVExHlRwPWwpYIj+dGHOUUSnq4a4TCYNNf77i7xO4t4wfKkz3RPNrpXn9hQ5
	 6arXIueZrrTIRlTb7jIb97+yQDfP0a1St2bURjtXPxGXCJwZpNn21chgxf5tWMr9Adw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397168;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ss6GPqajhnLoAGvpkwWgAL30Fbn2tVqWEm0t1Mamd/I=;
	b=QX3G9MidD93JRNo1vP5PFMy7EtyINhqhg2VypA2d13FgLvZqUoLwnYSadummr6vpTqT4
	 ztJmgPNeojucj32E3ytDjaPor/kFiuwBMblbYahRnzA82FbPYLgKvRBoZiJ96bHQac3fI
	 u1lxmT593jP5mlwsJvZb7X9zBKUJAbTrVPPJRkEiR2TQmMePTQT6TY5bUfI34G7CxYoOQ
	 1nd/vAYEfRhwn0aptSrqSJssnI1aTKxRi1d8dKrVWabH9jB1oltIL8mgvgkYiyVq0t5I4
	 EDDkWM2h8iVC7UezLS11w7CAxcD9VHi5jWF1eTj5rNEsNQ6PX48MTqJ6xi2hM7K7yhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FYJ36vzk;
	arc=none smtp.remote-ip=95.215.58.184
Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA058606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA058606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FYJ36vzk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PxRmG2FWyo+pFqNDGwdneDF6Wr5yBgEA/EARM77L5Wg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794397165; v=1; x=1795001965;
 b=FYJ36vzksOCCsexC4Nfc0EjBeGRz02DN2aWs5F+SXhhYb1uihrcW4LnX6Z7s7sylG5IMBCBm
 bHF7fJg2UO01tXG8ZRmWqkalW06PF9jYozU3pm4rIsnaV0yGASbqMBLttquRoIJ+iGyHLzqA8Np
 fG5mN9dypHX+/kIKrEZ8vrgc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 997e08426fbd59bb;
	Wed, 11 Nov 2026 11:39:25 +0000
X-Mizu-Trace-ID: 997e08426fbd59bb
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	apopple@nvidia.com,
	byungchul@sk.com,
	david@kernel.org,
	gourry@gourry.net,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	liam@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	matthew.brost@intel.com,
	mhocko@suse.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev
Cc: Usama Arif <usama.arif@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] fs/proc/task_mmu: account device-private PMDs as present in smaps
Date: Wed, 11 Nov 2026 03:38:31 -0800
Message-ID: <20261111113904.650722-4-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111113904.650722-1-usama.arif@linux.dev>
References: <20261111113904.650722-1-usama.arif@linux.dev>
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

Device-private PMDs represent mapped pages, but smaps_pmd_entry()
passes present=false to smaps_account(). That treats them like migration
entries: mapcounts are ignored, PSS is charged in full, and exclusive
mappings are accounted as shared.

Match smaps_pte_entry() and mark device-private PMDs as present so
smaps_account() uses mapcounts for PSS and private/shared accounting.

Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: stable@vger.kernel.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 fs/proc/task_mmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index c0d391186c2b8..ad97532fc1184 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1032,8 +1032,11 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 	} else if (unlikely(thp_migration_supported())) {
 		const softleaf_t entry = softleaf_from_pmd(*pmd);
 
-		if (softleaf_has_pfn(entry))
+		if (softleaf_has_pfn(entry)) {
+			if (softleaf_is_device_private(entry))
+				present = true;
 			page = softleaf_to_page(entry);
+		}
 	}
 	if (IS_ERR_OR_NULL(page))
 		return;
-- 
2.53.0-Meta


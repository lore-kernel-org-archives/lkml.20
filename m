Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904087;
	b=FvJASBreAP/3Ek4IlQUPLtaSVXovtsuNYe+EdU0BcEiIjG+CXRmb038SSk276Emn6psK
	 wNL48hZN5f0HtSRXQ7O5+skn+BwY6Gd6K+RWyjDTb43/9iGSH7VvdFDKHUOVI38pn5AXW
	 qv+TjNFj9NImUHWfxnYCJjX5oSMi9CI+qWhrcF9Jo55IkvyhSOdF3ozMVl/kU6aR/w0FO
	 xJGz6ozymNO5dDSex2tELzR6SMRXeEVfIU+UUVlhuW0cvBtvRhI1gpeN0aBHLKnc5mVID
	 UYPYfaFpAeF6uAx03uu1XBlNDicxne11rBP9jbH/lE9UQCZYnQNa/eQVcDCkUGkPHGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904087;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nt953ET9NtDcT5DOJGv9MY7MHC3tnD4Orm6EPXl4Ois=;
	b=fN7z1q8lPVCjS9if7R119GMBNYhibROKYEQPJqa620LQDf5CMM7zsK23Vws093o779S5
	 3B53G2rVQb6nh4tLqmv7rdP/7sqqCflO/1HcVrjCcmLwu+fjd7olRdSxxA8UxuItfNweR
	 7/A8mdsYCn6OwTRpPrh0zcToPHYZSwgYg3xbvpzodPvEO0MQiDoJsROg7qdemF0VJVAmS
	 9Bk2+myqt8KCZQ+xknY+pVTrjmzq5quEOko68A+wsLSCoTuUE3sKsL4e9rQh5x8m4vDgJ
	 jZn+jJTWCZXvseTu3hXggQJSbRgOGERx7PZ81osTwWl+lf1tBsku8IEznxP6fLn03hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=roPZPHbn;
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF41B606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF41B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=roPZPHbn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A2DSiEYroyA96+szTGlscsdo/zoqOliyNkD97G8H144=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904084; v=1; x=1794508884;
 b=roPZPHbnxu9Gmaa44FvptpdCn5UQ3IK9EoRxph6BzbewOihpqRDVuqv2bJFR4JDhtfopyf9E
 JW9d+mp9uIzERHOePHaJeDoepsqZEAp8Y5oid27k/XlfPOviNzg/4MbKq2OfTglfkPeZkWCftXK
 Z2xfvSsyBbs0o28ZuTVNrJVw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 79d16db9a293cdd2;
	Thu, 05 Nov 2026 18:41:24 +0000
X-Mizu-Trace-ID: 79d16db9a293cdd2
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
Subject: [PATCH v9 15/32] mm: swap: share swap-cache allocation error cleanup
Date: Thu,  5 Nov 2026 10:38:59 -0800
Message-ID: <20261105183940.2236717-16-usama.arif@linux.dev>
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

Both post-insertion allocation failures remove the folio from the swap
cache, restore its shadow and drop the folio references. Factor the common
cleanup into one error path so additional checks can use it.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 mm/swap_state.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index da65d75ceead1..a8a486b0403ab 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -484,24 +484,14 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
 
 	if (mem_cgroup_swapin_charge_folio(folio, memcg_id,
 					   vmf ? vmf->vma->vm_mm : NULL, gfp)) {
-		spin_lock(&ci->lock);
-		__swap_cache_do_del_folio(ci, folio, entry, shadow);
-		spin_unlock(&ci->lock);
-		folio_unlock(folio);
-		/* nr_pages refs from swap cache, 1 from allocation */
-		folio_put_refs(folio, nr_pages + 1);
+		err = -ENOMEM;
 		count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK_CHARGE);
-		return ERR_PTR(-ENOMEM);
+		goto delete_folio;
 	}
 
 	if (order > 1 && folio_memcg_alloc_deferred(folio)) {
-		spin_lock(&ci->lock);
-		__swap_cache_do_del_folio(ci, folio, entry, shadow);
-		spin_unlock(&ci->lock);
-		folio_unlock(folio);
-		/* nr_pages refs from swap cache, 1 from allocation */
-		folio_put_refs(folio, nr_pages + 1);
-		return ERR_PTR(-ENOMEM);
+		err = -ENOMEM;
+		goto delete_folio;
 	}
 
 	/* memsw uncharges swap when folio is added to swap cache */
@@ -513,6 +503,15 @@ static struct folio *__swap_cache_alloc(struct swap_cluster_info *ci,
 	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
 
 	return folio;
+
+delete_folio:
+	spin_lock(&ci->lock);
+	__swap_cache_do_del_folio(ci, folio, entry, shadow);
+	spin_unlock(&ci->lock);
+	folio_unlock(folio);
+	/* nr_pages refs from swap cache, 1 from allocation */
+	folio_put_refs(folio, nr_pages + 1);
+	return ERR_PTR(err);
 }
 
 /**
-- 
2.53.0-Meta


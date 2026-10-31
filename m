Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442951;
	b=TX4MGyok5LLy3P2c2ZK5OxdAsSqKU3UMqexyZ1uaEPaCTn/QsLn+b8KubvbFeiXt7C4U
	 PlSpcPlHrfn8DSagjPnkjChoPAk8U57+QhN7Z23TCxx6Huh7eMxjHqUXgIsz5UiH4afak
	 YoQh7trez2CW4l7qOI7AGvlx6SW/Blz8bWIWdHvYrBcFZqCgZrMQo+d4GKbKW28DcLO37
	 hU3aG1tIoF+WxfZ0pYZtWJp+LhRKtXCTdUQplZbzjyL/MUwgKIXqyyGOZY+63TjpT2qQh
	 jePl+gM+gwBCALtz/Ot9DcOcnkJ5Raq9Q4TySz1rKEaOPKqcxXpYHXid9JCfKfj6w2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442951;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Authority-Info-Out:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=3wvj0yteebUhNouzV0u1oXFuQXUQTsJ5ZBVwO6rlosI=;
	b=Qv/a3CSMax/8TEXAF803Fd/0yh3gtV9LR9QJnuyfk6yOV/I5bueGa33UQklDrSPPQOn0
	 OS90sPl/vnmkm4vw3ceoEeOya834PMgy9eABR9IqoWTN+uzfgzBBs/04aUlzxblhnKuan
	 ufGPuRgw4YKROeUHUfQhLakAI1m29rhk+gzCDuuP4jVmp+rl0zAZaGpSBHthLyNMd/awq
	 /Ap3kjA3quOGWsGjifo4VvmWzoboHqzb4S2ArSOQOGKYZsLde2MbP+ZWJFOanp6prAqnT
	 QCEAPu8JryO+BCQ+lbOI5f5yZE9BAEe8VQe1e+6OfhK+B2Ru8cjpbnDqrnMa+6ulEWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=UHL8n9Pi;
	arc=none smtp.remote-ip=57.103.79.22
Received: from outbound.st.icloud.com (st-2005b-snip4-10.eps.apple.com [57.103.79.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982F606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C982F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=UHL8n9Pi
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id 97CF01800162;
	Sat, 31 Oct 2026 10:35:46 +0000 (UTC)
X-ICL-RepId: 01a19187-9dd9-71bc-8209-cc9cb851003e
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQtJCkMGXwFeCEADQwZbC1BcHA4XXhtCFUsVXANcDkswUBtfAkIPHBNWFRMLU1ZbE1UXRgkZCF0dGQpQUAZcEhhcFFxQWB5GElYNXQkZGEZeUBtfAkIPHBNWFRMdQxkPKwhKBEMHRQJeCyUTCVNWWxNVF0YJGQhdHRkVWgkKVwBAC04CXQRaHxJYDFAFGh9eEhQeXxhEAx8GD1UHQAZSAkUKQQteDg5XE3kMVgNUDlwEFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793442949; x=1824978949; bh=3wvj0yteebUhNouzV0u1oXFuQXUQTsJ5ZBVwO6rlosI=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=UHL8n9PiBuFiHXs+F6S3QPKrJqgxSJAVKm+6lf5kujeTrBK/V3Jz2ZkGRII/zoVExP7yRw+yoTH7ZCD9OsdF+hfI1b+Emv1zN94m5r5g+IWaNZQwtPbMWg7ChWFpj0HlA3cxzuGlkMSBfJgf6Oy+nEU1HaC2hkiMl0CgDnzIgt0z0yVociRpTdlv3bNf3wCvpXLXb2rPFWgTfI8AT40YQBVZfBUXh+I47Yk1e0ITjjRDxMjx8JTQGWN7yAPUauC2kzpD3jB6INR9/sUbnbxdSuGy0vVDffKVcmc+v4RduN1B6xB26FfUMVQt+SQGmyeE0ZjywVo9WgCp8NnKjhcUZA==
Received: from [192.168.5.15] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id 8931818002A4;
	Sat, 31 Oct 2026 10:35:39 +0000 (UTC)
From: Zhang Peng <zippermonkey@icloud.com>
Date: Sat, 31 Oct 2026 18:35:11 +0800
Subject: [PATCH v6 4/5] mm/vmscan: extract folio unmap logic into
 folio_try_unmap()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-batch-tlb-flush-v6-4-190539839eec@tencent.com>
References: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
In-Reply-To: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zhang Peng <bruzzhang@tencent.com>
X-Mailer: b4 0.14.3
X-Authority-Info-Out: v=2.4 cv=IYqKmGqa c=1 sm=1 tr=0 ts=6ae5c484
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GvQkQWPkAAAA:8 a=VwQbUJbxAAAA:8 a=TAw1jgvpd6mOHMWS3hAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0MiBTYWx0ZWRfXwKIQMpiFCVuQ
 M7lCuOYrwdg8vuDNQpQWEGCWqndiAn1pSpeOJ/fQs611CdA9dHlUAhawXbulPJ+mjT1K7uv1XKh
 KArPxcB7mRytPdlbtgjUK+VIIhPQYiMnQpHioVxJeOSrCM1j/0slXX52gNxE6SXaAgP0EaEhult
 CeB7Rvg6P7eTC/SO5ThLJqLhCSiP7YNOQnveyP67/t+D9ODdwt3vSRJkqD0btRdY0Gspx69xU+7
 59MGX8eKWUn6KoE8iIHWoTWkRcMMJHWz0Fm95ShlVkvUX9px5jrIkJKnZsy6Q76VIU0WzItUjoO
 fnyGfIWx6PUK9c1DixOViKpQ3gR1jWp7VgYIWhC1kxSoosKXC2erOXdlgHHelQ=
X-Proofpoint-GUID: EXQZDjnrhNSrllZK3KzfNYimNc6jZuoJ
X-Proofpoint-ORIG-GUID: EXQZDjnrhNSrllZK3KzfNYimNc6jZuoJ
X-JNJ: AAAAAAABbjoSBQGhxSG3QjLu8H6BM+qzsziPc4u861tewazawSpDoHwz/Oa1LthFuXc/S0
 avTB5AwIlFzE4uMFYrRMzMeXojhAc2yTzgFv+2gxaNhHWmfcKRjVoVnL2E2k3VmZLI6u6V
 4kcoVMgoOw5CkjSeDywUmQnooF/MST7I45yxIkrHyXj+oQr+PbiCgx7UoglLNBQ+4qhUrU
 ZpDF5nXCMWP4GHfHPmF0++uLCFMO9b5BCkptRiZkIPXeLfAQoLFwMZOpBBKQZ/5dyYMSwY
 VfKj9/DEyR0V92RudLak0uB07ecOJT3opsG+KDw/Q2erVpLqaAJ4IyCLaNBgBF3WFOxuzv
 7jVvCbbuBPZQ40wFV+V1aYtWp8JMyEvRrr6caHyJ96lney71OgYlB8mL18uHLph1hQmRyS
 miNkPPe4Y684hdHlMguWn4KVMkSLqoAUhuS7JJotYD2pt9ulLt/sr6z24+5jR8dJW/saHq
 cBwNtsWxiiom1uAdrmCooAu9pRadiDSICIoJPXBwOY1nANkvaUje2/6CfuX+v6Kf4Fn+f6
 CVz1VLaclY4sx4UnVrNtw+nrb2xuABZFYu3TFNXW7SJL/xbzEdueqfirwPEmcROR1bea/i
 IUJPZVMOSUmYkTGqQBduW9efoYyFIgbXjOVDS9pk4X3qmR4YlkClrQWn6J1WnGLrtMk8f+
 Zxxbo+w1pSd0ymnK0Ia7q1nBb/3RCaDnZeLtJi7Z9eRrgf2qEMXnqoDs4hbBWXraPa6KGp
 BZVUgWTmRv39X7VbFU3Xqruvn25ptXUkoz4ic8vYlw7OSmmEHUY1uMOYNijyOOB4KVPyV7
 DF5SVfvMIcXUR91EfvWTtgQ71NaErQTkns22HDwOwnn5Ul64n2AANXF88uPx8Gs7zyfmd9
 8lyjr/FQpGAhzpLLTdQQAesPlyo1pEwwo=

From: Zhang Peng <bruzzhang@tencent.com>

shrink_folio_list() contains a self-contained block that sets up
TTU flags and calls try_to_unmap(), accounting for failures via
reclaim_stat. Extract it into folio_try_unmap() to reduce the size
of shrink_folio_list() and make the unmap step independently readable.

folio_try_unmap() is only called when the folio is actually mapped;
the !folio_mapped() check stays in the caller, keeping the function's
semantics clear: it tries to unmap a mapped folio and returns whether
the unmap succeeded.

No functional change.

Reviewed-by: Barry Song <baohua@kernel.org>
Signed-off-by: Zhang Peng <bruzzhang@tencent.com>
---
 mm/vmscan.c | 65 +++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 36e3f0829f08..061414ff45bb 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1334,6 +1334,38 @@ static enum folio_pageout_result folio_try_pageout(struct folio *folio,
 	unreachable();
 }
 
+static bool folio_try_unmap(struct folio *folio, struct reclaim_stat *stat,
+		unsigned int nr_pages)
+{
+	enum ttu_flags flags = TTU_BATCH_FLUSH;
+	const bool was_swapbacked = folio_test_swapbacked(folio);
+
+	if (folio_test_pmd_mappable(folio))
+		flags |= TTU_SPLIT_HUGE_PMD;
+	/*
+	 * Without TTU_SYNC, try_to_unmap will only begin to hold PTL
+	 * from the first present PTE within a large folio. Some
+	 * initial PTEs might be skipped due to races with parallel
+	 * PTE writes in which PTEs can be cleared temporarily before
+	 * being written new present values. This will lead to a large
+	 * folio is still mapped while some subpages have been
+	 * partially unmapped after try_to_unmap; TTU_SYNC helps
+	 * try_to_unmap acquire PTL from the first PTE, eliminating the
+	 * influence of temporary PTE values.
+	 */
+	if (folio_test_large(folio))
+		flags |= TTU_SYNC;
+
+	try_to_unmap(folio, flags);
+	if (folio_mapped(folio)) {
+		stat->nr_unmap_fail += nr_pages;
+		if (!was_swapbacked && folio_test_swapbacked(folio))
+			stat->nr_lazyfree_fail += nr_pages;
+		return false;
+	}
+	return true;
+}
+
 /*
  * Reclaimed folios are counted in the return value.
  */
@@ -1612,36 +1644,9 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 		 * The folio is mapped into the page tables of one or more
 		 * processes. Try to unmap it here.
 		 */
-		if (folio_mapped(folio)) {
-			enum ttu_flags flags = TTU_BATCH_FLUSH;
-			bool was_swapbacked = folio_test_swapbacked(folio);
-
-			if (folio_test_pmd_mappable(folio))
-				flags |= TTU_SPLIT_HUGE_PMD;
-			/*
-			 * Without TTU_SYNC, try_to_unmap will only begin to
-			 * hold PTL from the first present PTE within a large
-			 * folio. Some initial PTEs might be skipped due to
-			 * races with parallel PTE writes in which PTEs can be
-			 * cleared temporarily before being written new present
-			 * values. This will lead to a large folio is still
-			 * mapped while some subpages have been partially
-			 * unmapped after try_to_unmap; TTU_SYNC helps
-			 * try_to_unmap acquire PTL from the first PTE,
-			 * eliminating the influence of temporary PTE values.
-			 */
-			if (folio_test_large(folio))
-				flags |= TTU_SYNC;
-
-			try_to_unmap(folio, flags);
-			if (folio_mapped(folio)) {
-				stat->nr_unmap_fail += nr_pages;
-				if (!was_swapbacked &&
-				    folio_test_swapbacked(folio))
-					stat->nr_lazyfree_fail += nr_pages;
-				goto activate_locked;
-			}
-		}
+		if (folio_mapped(folio) &&
+		    !folio_try_unmap(folio, stat, nr_pages))
+			goto activate_locked;
 
 		/*
 		 * Folio is unmapped now so it cannot be newly pinned anymore.

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950046;
	b=Jhu4AGHfJkacyXW6gJd1ymHcBXqUi8kp+S0tAId6T0pxjjbPZE8kQgwNseY/D2hqHGAC
	 GJLdzl4ke2NQpDltmpeiTM4pvNe5O5x4PexzOdGGLKSORJ4n6jXqigfpABWfPwg8h++mp
	 8Eceq1+OeNUVwftd+VmSQFblI4SA1O5Gt5I2C6YEbUd+KkRK1KlMB4HG03RFx7URf4PIu
	 QX7JhDf+2coAv6ufRGmcvHNozrdNnwOtivaoHEPTi/94o8Y5+9aE0AEHyU9ewW8BOWfDh
	 CP4vSdooD94+rd/gEaHoaGQ7XlkG3n78Vtv4nAxqQE97YXALb6ajYOv9f6Zv8KqwGLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950046;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=wx7DtEnW/yiqV2jfL4jW638vppvg9yzl2vShHqhjnzQ=;
	b=LTk0OFkWGliz6Csxv+1jwW1qV0zz05nGSg8lpZj0M83P92AV7Oj+GUlFWuZQVW/gh5Y5
	 hdazO+dqswQHhdY0LIbUBQoricLQD1G1HP5P6zwMftVLtPAG/hJLNDop7QOHOAVPKfEq3
	 g5fSNC09X4YCIzPbHL0dgHn+J/YgXtirOKOZDebMF9gtOmtt7HzWLfaC3GEoHXN25cHZ8
	 DakVWq9SebdWtVzIhbZZIDwv3sMsPYiP4803rvzR3TYvqSIwmMjGx7kWKESkohi4AF1oF
	 Jg5VyXEL3tkOnbLkY+lut8a6o9vZoxwUrKB9le2NDElxHooxxOEJWYh7hQUAWoKb1TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gT796LRL;
	arc=none smtp.remote-ip=91.218.175.202
Received: from mta0.migadu.com (out-202.mta0.migadu.com [91.218.175.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C23606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C23606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gT796LRL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OWOq7n51OZNlSYTiLRU59Gz0Q2na9qpH+zMvubZiDBc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792950042; v=1; x=1793554842;
 b=gT796LRLwsqHeKK5Gm1O7PXv7PjYZqZnGEQMo1b1BHHXGFRMX8GbgNDe3JAvxpKb1GxwTyLb
 kYgsYOtk/zUQWTCTpbRQnsMTzudDk4Qvmr7mfH71BESGSTl5FjvhQL4vGfWUspQw0BK1vrOoKCY
 x+IthNE1nY9xE5RZ1bLust68=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 75892baac6524e44;
	Sun, 25 Oct 2026 17:40:42 +0000
X-Mizu-Trace-ID: 75892baac6524e44
X-Migadu-Flow: FLOW_OUT
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Date: Sun, 25 Oct 2026 11:39:46 -0600
Subject: [PATCH v2 1/2] mm/huge_memory.c: skip zero-page remapping when
 underused THP shrinker is disabled
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
Message-Id: <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev>
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
In-Reply-To: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usamaarif642@gmail.com>, 
 aarcange@redhat.com, "Nico Pache (Red Hat)" <nico.pache@linux.dev>
X-Mailer: b4 0.17-dev

The zero-page remapping in __folio_split() was added to support the
underused THP shrinker. When the shrinker is disabled via
shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
to avoid scanning subpages for zero content unnecessarily.

Suggested-by: David Hildenbrand <david@kernel.org>
Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
Signed-off-by: Nico Pache <nico.pache@linux.dev>
---
 mm/huge_memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bd44d58e8684..2d56d1bff0ea 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4104,7 +4104,8 @@ static int __folio_freeze_split_anon(struct folio *folio,
 out_no_split:
 	local_irq_enable();
 	if (anon_vma) {
-		if (!ret && !folio_is_device_private(folio))
+		if (!ret && !folio_is_device_private(folio) &&
+		    split_underused_thp)
 			ttu_flags = TTU_USE_SHARED_ZEROPAGE;
 		remap_anon_folio(folio, 1 << old_order, ttu_flags);
 	}

-- 
2.56.0


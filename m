Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82923CD8B8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842580; cv=none; b=pv3pdGl7DNOjqAr3RoBIOAp4ehUqnFfl/cv4L7KvGpZUlg/dqHoTbC/Stg3JVap8/9QHLue44AaExxliruG6wrGnRFJTwqPzC/CkXUb2d07NaiJlKwJlLB/RnEWS65dFLgLjmZPQX8PyQkY8N0Sp1osU4jQwUYNcu1FjwO8QRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842580; c=relaxed/simple;
	bh=c+DPVphSAp7/zj1M/w64+ydC3uV12W1BTIYcaSRdGYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XJz9FtoMLKGwrUQuft30LrpvTSM9voAoPJjP1Mb6oKcxEAnTnBjkfCUpeA7CRPPPsnCEUTWi9yLEUQaEmVSApcFLPxVZ4uoL7bXe5uCBhpyqMSZDLibyCCcomj10kEuXgU/bMmVXxJzzsen4PWaK8hFvxTvpxMom1Yj81JR30Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=etmsx21B; arc=none smtp.client-ip=91.218.175.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="etmsx21B"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=c+DPVphSAp7/zj1M/w64+ydC3uV12W1BTIYcaSRdGYA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790842570; v=1; x=1791447370;
 b=etmsx21B3p9TDxz9Zs7sS1mQ0e8Q9g/SOC6YsJrQvtJpHECx2QiB4FjodfhWMjjyInSi+bzj
 XnoG1DQaE9RLslbz84HCTMxUJSVb1mItgSnaS1kRLOOKx8Hvm7c5sqJBRJDKMy/uZuv2ccWccmq
 LYmMnemxq/S7igFuXnFC1/f4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de19fbd9b491b7ab;
	Thu, 01 Oct 2026 08:16:10 +0000
X-Mizu-Trace-ID: de19fbd9b491b7ab
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: dave.hansen@linux.intel.com
Cc: luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	muchun.song@linux.dev,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] x86/mm: fix spurious warning on __add_pages() failure
Date: Thu,  1 Oct 2026 16:15:55 +0800
Message-ID: <20261001081555.35485-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__add_pages() can fail if we run out of memory. The caller already
handles that, so we shouldn't WARN_ON_ONCE() just because an allocation
failed.

Let's return the error instead, and only update the end-of-memory
variables after __add_pages() succeeds.

Fixes: 10f22dde556d ("x86: arch/x86/mm/init_64.c printk fixes")
Reported-by: David Hildenbrand <david@kernel.org>
Link: https://lore.kernel.org/all/d4fac8af-fd71-47a2-bfe9-3c6559b92209@kernel.org/
Suggested-by: Muchun Song <muchun.song@linux.dev>
Link: https://lore.kernel.org/all/203892F4-B04A-4F69-A1B3-DC1619176C67@linux.dev/
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 arch/x86/mm/init_64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 70e682180291a..8b6d86fb5a42e 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -970,7 +970,8 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
 		return -ERANGE;
 
 	ret = __add_pages(nid, start_pfn, nr_pages, params);
-	WARN_ON_ONCE(ret);
+	if (ret)
+		return ret;
 
 	/*
 	 * Special case: add_pages() is called by memremap_pages() for adding device
-- 
2.49.0


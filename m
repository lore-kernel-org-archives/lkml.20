Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813270;
	b=spkp5C3B6MtcBnOHUAPqY/ZoAdj19PymOkztLXsKlnbD4Y31AHSPNWDgKxf3HruwzjqC
	 cjQ3PFqeRwiHsFfghcph32quLJ6AlhrLKbKsGTNnDL/cMEb1G9uANEXdtDI6TNKGy8nxk
	 eQztKFhHaZJlevB7FJ2yxQGtdWsvTXV+H4NXT0rV8mppg+7Tek0fHhy4zOQYmdkvyRswP
	 LhrisUWeCkJ9E+ZmW53DTnoWPRGAuhagngnoj/FdHwOFmlEqUqC1kIjIVoSExYvTMbI61
	 nAt2EDJC71wRa5dm3VLTzpjdGrz68lIaG/Y2fehF2xsTkwPGQSubYxmJEHEws7eeESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813270;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oDNNUKcQznYLFvs5X+9GzieDpnGR07oToeUGRcsD+jw=;
	b=UTa7zWPubJwqLczezdbzqVxGgRqvq2ZNmW05xuN53JFUSplkQcEyf4ffSTQF+RhqAXpr
	 tgOO6zD+Y27DUHESOtlGrPS/KX5QIxMK9H5dYa1q+y++1+4JrI2LZFjYn+eygFCSeK2AP
	 pMNa+fIuVoLh0uY+POGEKNtRPh4WL4gaH5y6111FpKqdypiP1EL5RJY5+xlbsBd6Zp6bv
	 pqCSxybW2UOZsFJqPl9YN6ZFM/4yV6gU5H9OjM8rW1cl9k4THX9rjm9PehtbqEYWFhTCA
	 lkw1av57/+XRoePRodtySUtR/3PImBWVJP6me9HMuBjg3rv74fMEJ0So981ttlOnqJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XbIgeKT4;
	arc=none smtp.remote-ip=91.218.175.236
Received: from mta0.migadu.com (out-236.mta0.migadu.com [91.218.175.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012EC606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 012EC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XbIgeKT4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ox1OF4PmGlhBQ2M/eFtocGrA519OKUW6bkxfmgExDOw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813268; v=1; x=1795418068;
 b=XbIgeKT4qsJbDHNO3O6KZTrnqZwO0ummpfSNBOuRvtNbiUoxtYGItkrx6cB0AKHeRzkwxaXs
 GXKp2dzSTRD6cBaMDaQecPXbalDHjtz+qysvD/Rgn/1IUoy4E5NWJl0BOSCLoXB66NWqFloqFOw
 sGrizAKGCZTvdXTck8SMsb1g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e7a04197984c81c5;
	Mon, 16 Nov 2026 07:14:27 +0000
X-Mizu-Trace-ID: e7a04197984c81c5
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>
Subject: [PATCH v5 08/11] mm/vmalloc: drop the KMSAN metadata in vmap_pages_range_noflush() on failure
Date: Mon, 16 Nov 2026 15:13:22 +0800
Message-Id: <20261116071325.263682-9-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116071325.263682-1-hao.ge@linux.dev>
References: <20261116071325.263682-1-hao.ge@linux.dev>
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

vmap_pages_range_noflush() sets up the KMSAN metadata for the whole
range before it starts mapping. If the mapping fails, the page
tables undo themselves now, but the metadata stays behind, and the
next attempt to map the same range hits the leftover shadow PTEs.

Tear the metadata down on the error path, it was fully set up before
the mapping failed. The teardown follows the page tables and skips
cond_resched() when the caller's gfp mask cannot block.

Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 4f3c320a4849..28e65073624a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -801,8 +801,18 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	if (ret)
 		return ret;
-	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift,
-					  gfp_mask);
+
+	ret = __vmap_pages_range_noflush(addr, end, prot, pages, page_shift,
+					 gfp_mask);
+	/*
+	 * The page tables undo themselves on failure. Tear down the
+	 * metadata that was fully set up before the mapping failed.
+	 */
+	if (ret)
+		kmsan_vunmap_range_noflush(addr, end,
+					   gfpflags_allow_blocking(gfp_mask));
+
+	return ret;
 }
 
 static int __vmap_pages_range(unsigned long addr, unsigned long end,
-- 
2.25.1


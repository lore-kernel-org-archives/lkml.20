Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309895;
	b=XVzsFp1As3OoTErhzV4kp6pzBmQ5TBEziwtcLlm8GtoxO1b+cUO6CcVQ5sm5rIlFDtBa
	 aBJvpmnkT5p1WYSxlpltDjJeJIFvogBFDJ7+juQmEm9tXsCqhQJ3FfBFxEeEQRnC76mBj
	 ZW7UJ5EQE/qg+N2SJPirLLs14RyHWEh5dYUTMcGEfQdp+1DC7SmHnpQBTgTHXevmcPW5A
	 RCV+YHLLXSPlr67uH7evF4iIYalxxmyDKR945E7Ms39GtlkttOnwAb/IXQJ5dLN2dY9H1
	 TxLBCTy/gj/5p/ItA9yab6/aoEBmWE1gRARgFJoYUJYM+zFa95CTOPLpMnIZXvj28jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309895;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ndl0Xjf9nTZN6dKbs+SZ1IK92guKL0Ouhq0SwgbwTp8=;
	b=YESeG4gTmi06WSClxl4bkS4X7bTzAdfJpRjwrBZRn4UXWmGEuLmDR+XeAnAWuzmzDtA3
	 evzIOVNB3SBzLtswvX0IxvKL/dQpDGg6+qFu7o/vasVIGNpJdb8N4iSbbTk0r+2s8WqL+
	 muoNKwhkQnUbeexQevgUHB1sk2HBtCr17vDBfw0bBFuS/pnTIWr1LFnbPQ7m6m57yWXTX
	 lwmpXyvphhrJOtvk00lzydd4tjmqxwPdVdVlNzf4lR/oLFFFpx7RGXnwzromwkN8wRg+0
	 97O2Z5LmaCSnSLIhbotG86DR5nUJHhfLWsgDbsVKrcBy1FkKUHxkFtZMGkARfJGMmVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vtJz28sT;
	arc=none smtp.remote-ip=91.218.175.182
Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8908606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8908606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vtJz28sT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NOOAGkQRj9IyYCtkbJXvFPbThNHcQSekySmu8iG/sgo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309892; v=1; x=1794914692;
 b=vtJz28sT/KVs6qZkwUmASw5+4Agm1kl9YSBP8nEC90fnr5pynQsFW7rdh2PJWOA9UHCyAvTO
 catop/zsJCGFvsaaSDK8YvsUBeUKt1svu78nLTRWQIrv0BEaEZRGTPn0wEzQ78uZ6rYonYdrYR4
 phAemA1+eIMSUqijxdKYSVrQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a353589fd710b990;
	Tue, 10 Nov 2026 11:24:52 +0000
X-Mizu-Trace-ID: a353589fd710b990
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
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
	Hao Ge <hao.ge@linux.dev>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 4/9] mm/vmalloc: BUG_ON() on an unaligned range in vmap_pages_range_noflush_walk()
Date: Tue, 10 Nov 2026 19:25:41 +0800
Message-Id: <20261110112546.261415-5-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261110112546.261415-1-hao.ge@linux.dev>
References: <20261110112546.261415-1-hao.ge@linux.dev>
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

The pte loop of vmap_pages_pte_range() maps whole pages and stops
only when addr lands exactly on end.  An unaligned end lets addr
jump over it and the loop keeps mapping into whatever follows the
range.  An unaligned start maps the page below the range with its
first pte.  That corruption is impossible to debug afterwards, so
bug out on addr and end at the entry of
vmap_pages_range_noflush_walk().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 27f2674a5556..86fbb1d2b27a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -698,6 +698,8 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
 	pgtbl_mod_mask mask = 0;
 
 	BUG_ON(addr >= end);
+	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
+
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
-- 
2.25.1


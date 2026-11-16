Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813277;
	b=yLauMpeGimaSAfuZScQu1w9+nwyvSUIYxoK0+9jYdl/GgrISpfusdNNBe7sa0YCCEW7m
	 3yUFNMb7M5NmwrsuWrAQfpPn8QhJnmA3cwE3bvKU7W1EBqx1EH+2IIVP4OU2zYkMZ14e1
	 nG74+tIGtnJh3uSiMh5FVYTlIaIRPpjSgcfH8WFLqU2qC4UbAduv/CJlf1eyOUKQFCDCU
	 ftx8TQSEYzSw/8jxsdKPfSTNQX7LDLC5k2CnXnDNmv+f/FRkTgQLnis6o+kDgKVoaG1Uu
	 AjVMUIJ6OZXjbCfJjVm/BQzAWl3SPuu4McPkevIw4ZBRTr1iZLT2PbAjyfK9iT7MBoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813277;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S4xwi4aHh7ZD/bHp2DRcoCULX4dT5zb31C8Z9H6qmb0=;
	b=wEf1N452zEE5gTeKLyhgGPQFi/apI8PMbUkHwfwuN4RfJJvhmmKggXVWDoZPFdqUwWEw
	 fBBzSdmUjv6UmT4Wevh/KXLpQXXTHIhHOJyzSP+iROQuAy2xcDK5J9LJKiYCdP5sZ1vXG
	 Hb/zbkPzcNV2DjDz3n6j0kof8JNbCclgt/zFrxV0W+kXwU9+ulxNLqR4TbJORpeIGpMnV
	 a2mauaMzLPcDIyRuFPMfqGYniHXaYyZpcNEw5jRPjJsBkVzq6oBsM489ntX7Atevl0PZ/
	 qgb5O6Ta+TU2jHhRdUgMFJEIcr33uDmhQhqGlezbrhEK5Fq0m1ryMMIaasHAkOBf4uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CFTRgDEB;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D1606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698D1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CFTRgDEB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EVDQOgm4eiv05oSXsLTtEpFF+tsRKuMQEvt8DaJEU2k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813274; v=1; x=1795418074;
 b=CFTRgDEBH3j6pmg1ej7njFlv3ud01xfdaOMBaTZS5DBJoWFHZXBdM8Ebo8YkQ7AyoQbXvHJk
 mGFmVZznl5qN2rMEHNFvfRCTsc8E8IoOwvYn28vfB6raIhgTC2vZ47Mamjls2WYuTAi7GiB5cM7
 bwG0TjPRZqKoCRang6O0DWVE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d81b1a6ac4fe3573;
	Mon, 16 Nov 2026 07:14:34 +0000
X-Mizu-Trace-ID: d81b1a6ac4fe3573
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
Subject: [PATCH v5 09/11] mm/vmalloc: undo what vmap_pages_range_batched() mapped on failure
Date: Mon, 16 Nov 2026 15:13:23 +0800
Message-Id: <20261116071325.263682-10-hao.ge@linux.dev>
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

vmap_pages_range_batched() maps the range batch by batch. When a
batch fails, the batches before it are installed, and the failing
one may have installed some of its pages. mapped_end follows the
end of the last installed page, and the error path undoes
[addr, mapped_end), never past the point where the walk stopped.

The KMSAN metadata is set up for the whole range up front, so it is
torn down as a whole when the mapping fails, like in
vmap_pages_range_noflush(). The only caller, vmap(), also calls
vunmap() on its error path; the double teardown only walks over PTEs
that are already cleared.

Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 28e65073624a..aa80bc273ec0 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3748,13 +3748,14 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
 	unsigned int prev_shift = 0, batch_idx = 0, nr_mapped;
 	unsigned long batch_start = addr, batch_end = addr;
+	unsigned long mapped_end = addr;
 	int err;
 
 	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
 					     PAGE_SHIFT, GFP_KERNEL);
 
 	if (err)
-		goto out;
+		return err;
 
 	for (unsigned int i = 0; i < nr_pages; ) {
 		unsigned int shift = PAGE_SHIFT +
@@ -3764,9 +3765,10 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 			prev_shift = shift;
 
 		if (shift != prev_shift) {
-			err = vmap_pages_range_noflush_walk(batch_start, batch_end,
-					prot, pages + batch_idx, prev_shift,
-					&nr_mapped);
+			err = vmap_pages_range_noflush_walk(batch_start,
+					batch_end, prot, pages + batch_idx,
+					prev_shift, &nr_mapped);
+			mapped_end = batch_start + (nr_mapped * PAGE_SIZE);
 			if (err)
 				goto out;
 			prev_shift = shift;
@@ -3786,13 +3788,21 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	}
 
 	/* Remaining */
-	if (batch_start < end)
+	if (batch_start < end) {
 		err = vmap_pages_range_noflush_walk(batch_start, end, prot,
 				pages + batch_idx, prev_shift, &nr_mapped);
+		mapped_end = batch_start + (nr_mapped * PAGE_SIZE);
+	}
 
 out:
-	if (!err)
+	if (err) {
+		/* Undo the part the batches installed before they failed. */
+		if (mapped_end > addr)
+			__vunmap_range_noflush(addr, mapped_end, true);
+		kmsan_vunmap_range_noflush(addr, end, true);
+	} else {
 		flush_cache_vmap(addr, end);
+	}
 	return err;
 }
 
-- 
2.25.1


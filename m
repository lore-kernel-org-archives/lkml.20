Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001794;
	b=SjP7Sb1i2g59lxct1ngcU7gmZFkATd0vH0DGpX355UOCkl3gr0YEOYUeIDg/LZlaPGW+
	 8xtPz9aqsmIVErMv4N5nLmQWXG+NeZzfzI3yhAt+UmYIRkR8E70hf+q8WppZdrHYJV4hN
	 WOizH1rRBUl5XE20hLu9FHc6kyoEvnB3F22AmPW8/XZhGEtn4kKg5l35cmyKuuY60dlVr
	 LD9fSePxJ2l8FwhWRnJQ/5CdcN9ltPJAg6XoxJf25iUN5Mb+W8FeqZu/DWJcDo06Xksco
	 tmiMpUzMvdi+1EiA9GxkHd3HnT5B2wpn61Iuq1/6KlAdCFherrnxaepEiBtBNsbW+OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001794;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQRfqxKZWPdgYi3rSnDhlWYdHqbhXbBOf3zmvKiqynk=;
	b=IgpN+EgYGGl61rp3TjLPc7liUf3a9CYV04t2YcDm5rv+6fJE/K0nCVjdMmdQ04Z3qfcl
	 I5FRfPZMoZ2koiz8SWoL8imUZ/FTgjpvaNYufIrZbDgV1x+O2lAeXzGVOmsfrugsoJ7Fe
	 zAYLhscp0PEWB6hr2g90i9cbyqO+1BRfaox+3rbT5dbicBHsloxDibpThhZKbE4VvlHD3
	 Rxy6wrL7Fe8ID3TmQ1e5i0Dn0kyr3wTXLZ/OsH1aAbxoK791DGWjfbJ0tntEyDixfUA/1
	 aXQuhCuhUbA0cWvKf3QxdLpy7usfi1eJZ4NVaJZ8msJaP6o0qdajnyBQoKxg3yAxC3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AQj7bhNX;
	arc=none smtp.remote-ip=95.215.58.55
Received: from mta1.migadu.com (out-55.mta1.migadu.com [95.215.58.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF6A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF6A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AQj7bhNX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=a517G3/D9CvqFMgtLJh4XZJvZjho3byqSfkgyTokHGQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001791; v=1; x=1793606591;
 b=AQj7bhNXAHMCiF8Q3PW/JjBLKEVJ9ZBNHWhP2/o9/aXfivUREuCa565zQP75zTcCqlyf1Qnn
 EQj/8dEZcXq9t21QITldHdN5V7PEVb2GPp/kWHTPYxr0zHywlec5JH8RdAfBbss54nyIg1stBQo
 XGcKHvpH7CfX8d+jVB5Y/Yig=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8477b878ce637510;
	Mon, 26 Oct 2026 08:03:10 +0000
X-Mizu-Trace-ID: 8477b878ce637510
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Hao Ge <hao.ge@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Dev Jain <dev.jain@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 07/10] mm/vmalloc: only flush the cache after the vmap succeeded
Date: Mon, 26 Oct 2026 16:03:26 +0800
Message-Id: <20261026080329.140244-8-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026080329.140244-1-hao.ge@linux.dev>
References: <20261026080329.140244-1-hao.ge@linux.dev>
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

vmap_page_range() and __vmap_pages_range() call flush_cache_vmap()
before they even look at the error code. A failed mapping is never
used, so the flush is pointless at best.

According to the Sashiko review it is worse than pointless on UML:
flush_cache_vmap() there is flush_tlb_kernel_range(), which syncs the
PTEs into the host OS. Flushing a half-installed mapping therefore
leaves host mappings behind for a range that was just freed again.

Only flush when the mapping, and for vmap_page_range() also the KMSAN
metadata, is fully set up.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 4d74144dfaff..96e15d6cfc6d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -359,11 +359,14 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 
 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
 				 ioremap_max_page_shift);
-	flush_cache_vmap(addr, end);
 	if (!err)
 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					       ioremap_max_page_shift);
-	return err;
+	if (err)
+		return err;
+
+	flush_cache_vmap(addr, end);
+	return 0;
 }
 
 int ioremap_page_range(unsigned long addr, unsigned long end,
@@ -745,8 +748,11 @@ static int __vmap_pages_range(unsigned long addr, unsigned long end,
 	int err;
 
 	err = vmap_pages_range_noflush(addr, end, prot, pages, page_shift, gfp_mask);
+	if (err)
+		return err;
+
 	flush_cache_vmap(addr, end);
-	return err;
+	return 0;
 }
 
 /**
-- 
2.25.1


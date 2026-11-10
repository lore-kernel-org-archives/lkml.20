Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309915;
	b=5lxKGzkRol4ogigrUNiLy0FbCaPNEpLJ+LE/nJzDJMMkDiIkmpJWKErkEvdIdouDFcSt
	 PS7A2OBtGoT5AAeZuPtbq86FooA1dnMTOLq8Asu/Ii52Y9tqwtM1t2gpCm6cS5cW9UTLI
	 M25towK6Z72kjWGQi0WVkaKvlsrDxW6cH1CQPnkEIEAEcur5xDi3Qw7X4qOyytiAk+joO
	 AvbX0efARx3khNTebUhp1Omk9D0xvwSv2AoEl5kRJzC7Y2OHwIcwE5tadfEwArRVLl403
	 fZVlMezSNRFlmHjHutRgCrBnIyVATdnwF8DZRXda6AIlGSIIBN+7QWL6Kz1qJO6V3Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309915;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=njIoOXK5zMREOncg8mUAQGqPEShsE5xs29xDkWFtyUU=;
	b=LosghG204nfk4TUsqv2WPwmsUEoZFmFslgwdWP4GtFva0xws6f4iwk0BTw6OPbZOhN4n
	 +NmIKWmRvP6vILRNcBJ0GKwbzn+ujTd36MC4H/SRVjQwzKgUnPNwSihdoIp58qBQHfO2p
	 NqO97bdzu5FR+ehdWTJDotpsOqvMbw/2VFJaxfLASVSZdVfqwpeL7/l5fL1q1+vtcZWae
	 pTNwVYBpVWPwi6+5lY9EGfQyhshCJEs642s4AqDq/HMdqQUDOxtmKJUDsEkruPL4+8SZf
	 wMtCGkWwAYZhpl3GE9PshuC2hIP8SnmQ+zbieaAnWNY49HRvgB159D2XUnz0ymSfcxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="mVkWfYh/";
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5CD60A262F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5CD60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mVkWfYh/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BPShZdqjxGXzG9YjR46DA5wDrW3cgTzpgUAq+Dua6mc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309913; v=1; x=1794914713;
 b=mVkWfYh/OU5ocR0W3SIgvgFGay1eXuZ9K2ZVcborArx5MMPEOCDYFyeFOxuvPOfLou+64Lbj
 NxviIlOtEWv4pnOnogTcpp3NFs6KhEcTsaL6ycgwbASbu3WK9k8ORbYH9DHGuAFwa6g6CJimA+3
 WU9vvPNnJDjYBbYQqi7Xo5Z8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aaa1849df80259f7;
	Tue, 10 Nov 2026 11:25:10 +0000
X-Mizu-Trace-ID: aaa1849df80259f7
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
Subject: [PATCH v4 6/9] mm/vmalloc: only flush the cache after the vmap succeeded
Date: Tue, 10 Nov 2026 19:25:43 +0800
Message-Id: <20261110112546.261415-7-hao.ge@linux.dev>
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
 mm/vmalloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 0565cbfe325c..3f98056f8c7e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -369,10 +369,12 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 
 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
 				 ioremap_max_page_shift);
-	flush_cache_vmap(addr, end);
 	if (!err)
 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					       ioremap_max_page_shift);
+	if (!err)
+		flush_cache_vmap(addr, end);
+
 	return err;
 }
 
@@ -758,7 +760,9 @@ static int __vmap_pages_range(unsigned long addr, unsigned long end,
 	int err;
 
 	err = vmap_pages_range_noflush(addr, end, prot, pages, page_shift, gfp_mask);
-	flush_cache_vmap(addr, end);
+	if (!err)
+		flush_cache_vmap(addr, end);
+
 	return err;
 }
 
-- 
2.25.1


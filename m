Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813250;
	b=Ly4P3ec5K8pkxXuzcJSqPvEGsROIeTFbsxmirxtXMDhDWDCwbHrmqaAdO47DZMRqwx0e
	 dqmXrouiM0IfgnvAcRWen0CTo8mbCothMqjMKhgEOangCXuNVyX1DFwFv1UZ9JIN6NIzb
	 h14Yv8ftlcf3N06Z3JKh33e/fEpfFhhiuh2bZ9qBwqx39Yc3hVtV2f9dMyn4YTrAZS1sa
	 0WhJJxZfTwjiCVlLFSS3lpBMF+W8FSN2DDX5yzyGNTL0kafDMZ3nRSaRULDK2Qc36B9qi
	 8gubmXC9ROrbPUAXc/Qougsbjyxe5z1XRyjAVaUCtI17aOAJVUfGSKQfQI0wUvQyofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813250;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gGjQzFT7VU9SxHj3qvvDunZHrMSIb/1khNf+vVXHuZU=;
	b=zFRplWr9vxNRB9gNvk2zwcZFRbm0Y30WBPVSlrOrWWT3rRlIepap3GOPuXzoSLsTL5qd
	 6PaYA5ljzNEQESu4gWtM8ACvW0RxWB4Emkge4JSTLih2uQBOOWWaArYBb3rG8SIjMKjDH
	 tlaA7w5JoEKYk2/qdE9cBtIsTWkM8Spml/HF+wNJX2dR2dh8ZslRqMCgSmntwfhJV0fur
	 XT3mj7geAKcpklRUknVcMvDZhOFCkHdbaVH09A18LY5avk65/LsDxOn74unYJ0b/2AfSE
	 Abzlliv2HRJJuUrsfCmqcJs7HcOlaaa13gFXS6+ieT4OTYsO6rkWwB+TaMZulXabckQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xl9PIEzi;
	arc=none smtp.remote-ip=91.218.175.218
Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C37606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C37606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xl9PIEzi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ohj0Q0QgPbLqG15axHAo7Ym3eVCB3YLiih+Cx6SPRpc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813247; v=1; x=1795418047;
 b=Xl9PIEziSToTgPfkrHuc1CeGEyGSWUqpioezmOLQIxRRv3kaubXUp5G8izZTL2NgSaxhvaRs
 ZRNYhoUKgBWSDFDUHXMXiqL6ADP3qQtQRbdpHgq8Oea8ST9LQyuFSWuIEnsba7eBXPPmMI8lpGn
 xOtjeaU/Ip51VExOuWp0WoY0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e45f4b823b1f79ee;
	Mon, 16 Nov 2026 07:14:07 +0000
X-Mizu-Trace-ID: e45f4b823b1f79ee
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
	Hao Ge <hao.ge@linux.dev>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 05/11] mm/vmalloc: only flush the cache after the vmap succeeded
Date: Mon, 16 Nov 2026 15:13:19 +0800
Message-Id: <20261116071325.263682-6-hao.ge@linux.dev>
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

vmap_page_range(), __vmap_pages_range() and vmap_pages_range_batched()
call flush_cache_vmap() before they even look at the error code. A
failed mapping is never used, so the flush is pointless at best.

According to the Sashiko review it is worse than pointless on UML:
flush_cache_vmap() there is flush_tlb_kernel_range(), which syncs the
PTEs into the host OS. Flushing a half-installed mapping therefore
leaves host mappings behind for a range that was just freed again.

Only flush when the mapping, and for vmap_page_range() also the KMSAN
metadata, is fully set up.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e2b63cb1592b..d99d7710e1ba 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -371,10 +371,12 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 
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
 
@@ -763,7 +765,9 @@ static int __vmap_pages_range(unsigned long addr, unsigned long end,
 	int err;
 
 	err = vmap_pages_range_noflush(addr, end, prot, pages, page_shift, gfp_mask);
-	flush_cache_vmap(addr, end);
+	if (!err)
+		flush_cache_vmap(addr, end);
+
 	return err;
 }
 
@@ -3729,7 +3733,8 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 				pages + batch_idx, prev_shift);
 
 out:
-	flush_cache_vmap(addr, end);
+	if (!err)
+		flush_cache_vmap(addr, end);
 	return err;
 }
 
-- 
2.25.1


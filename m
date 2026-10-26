Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001775;
	b=PxC57Ms5mvRp23SWSm3SAsSaaG7h0deViypeyVxqsdnHKdVXKLNy5AQRGtOop71Tltxg
	 p3HWGWnBVVwZ38/+x+/vDRTPdbJdZ2H2JxNRT4tfLWYEMJbz3GnLpXoFRp2XvVfTiaNjx
	 vnCMA93KNyZss0k896id+200pOImc5Hf5r+KOdBFOwIFRiPpE7weZx+RrffGu1nlFQMUR
	 sfUBVdRj1sZNWPLu5EB6HjKAUjTxdKkSvUS6kZrUbKK7lYMkEIubVelpdv4kCp5/b0mWz
	 mW7fEf/vhyEoPlNP4YnSaOodI74wT3vKzS/5dN2oIEOTBzZo2nfEatT3klgnynti9eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001775;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zmy3LH0dL65AyxAOzx2otQGK/mLaqXxkxMSe8fA4quA=;
	b=ncFBN9WXePdG6jNWi905nRCM0cs3nx2h6UJj3mhTm/FRXfQMFadi63Ofirg2V4nYDVJX
	 bwWN79s/FbrxctKp25C0xYt0xbo9Vf44rHDVjgUNNGl1+Z6CD8sYWdyP+/loAIBNeYn5u
	 xagD5RpO2JwbLk1AiIllKBIE41Fz/5qQJS3gl0IVwWD4xAWFqEDFtycTVs6E/QlqyJH1j
	 0rloSioetUWdjgapumdXFirQF0QlQdtnoTqhFJXsE8wKgr5dAjixci2L2KtI+Zc3Ukgib
	 calgMGF828yjJ240iN/sTfO/fDfwwHnRGSzCKcoEzWgqtkCdhOcPJ/eLElzdw8V9lDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DfcaYETo;
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C06606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C06606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DfcaYETo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rcaYfxcJJLBaD/Nimy7cPxQcpSG7l5aC5JBRtkuZ3MU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001771; v=1; x=1793606571;
 b=DfcaYEToOO05oj5XAMAuaH+q8d6pgLJ6lXHw/QEd/bWVV9BNdC9VlOhrYPLyBfBVzZ02bIlK
 hO2vnwexCD5YN6nHcqqYKLkTQtXJsMqDUoPka3SnTX2wcJyLp31rrn+cqTqMePnv7jymh8xCMvp
 DykbHKCboQtxsdddbh9NhyO4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5dcbb4fe83952587;
	Mon, 26 Oct 2026 08:02:51 +0000
X-Mizu-Trace-ID: 5dcbb4fe83952587
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
Subject: [PATCH v3 03/10] mm/vmalloc: clamp an unaligned range in vunmap_pte_range()
Date: Mon, 26 Oct 2026 16:03:22 +0800
Message-Id: <20261026080329.140244-4-hao.ge@linux.dev>
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

commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
PAGE_SIZE aligned") made vmap_pte_range() warn and bail out when the
size is not a multiple of PAGE_SIZE. That loop steps in page
multiples and stops only at addr == end; with an unaligned size addr
never lands on end, so the loop cannot terminate and walks off the
end of the page table.

vunmap_pte_range() has the same loop without any guard, so an
unaligned range would clear PTEs past end without ever stopping,
walking off the end of the page table.

Add the check there too. The range is clamped down to the last full
page rather than dropped, and the loop is skipped when nothing is
left, so a buggy caller still gets its PTEs cleared as far as they
go.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 44e0eb32708f..7131f60d1a8e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -393,6 +393,11 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t ptent;
 	unsigned long size = PAGE_SIZE;
 
+	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
+		end = addr + PAGE_ALIGN_DOWN(end - addr);
+	if (end == addr)
+		return;
+
 	pte = pte_offset_kernel(pmd, addr);
 	lazy_mmu_mode_enable();
 
-- 
2.25.1


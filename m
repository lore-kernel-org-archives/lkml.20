Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001765;
	b=iETVg4JtFwr1qFNBYVB4cwxUmGFTpjCBFaTbZonEY46iN5iKlY2w3pC7Zc2EQhYSI4nc
	 OTRwjaMJ8UZJVxsnfBnjGektsYSZm46JJcbjFWSajeTMz2Bveio3/09sRa5Q7pS0HTaEh
	 5dE1GPsy/vvVm4PRFMQzPbE3B6kDvjMGtAzyhOj1HBMswqqaqtkpnRL7jhtZEL4dRM8pD
	 JahuPgcwLl/cD9quKbDWQsFbJa70g2q5qXbAc/npXnNQ1R5HgEHICXgvh9sKKyDXrB7uy
	 gWPERBI3Bt9BwN3lIpULai5Q8onVlFb5MPK+kdOZK7AxriWsb5OHzeCCeWiXpo3nu8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001765;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hfZXr5B4QU7BP5U94Iy0bbprGRMIU7jhwwRUqW3NVmE=;
	b=UQbGbEQCYQrCrUMWjGvQhERsVddzr4SP6PZqDw762jhPv/oMRYGPq32p2Jb1qP6BPUlg
	 36SBCZzo16VS9aUwgMWFey+TG2JfX1NK21IpI05o1v7mcj5k9MRd58zQxSt2ePdcKUQDH
	 5UBNVXzwmqTN7cXKyILx7XEgATVNWwVgM9EoONjns/ZNEPsSGct9kCtaWYlu2ckQVztP/
	 whKp8x5qGBOp68maB7ydC5DXr9tC9SXb1JSKxy16evxm0zC//6kloNQwVUxhc6bp/onCy
	 JV/T8AgT8xAnzJN5Q071t10y91HATC6nb6Q31weUUetD6QHvjN3gXxuODTXEqdSrF5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="drf6L/9Y";
	arc=none smtp.remote-ip=91.218.175.79
Received: from mta0.migadu.com (out-79.mta0.migadu.com [91.218.175.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CC1606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CC1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=drf6L/9Y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oeHSWM4q5xftJC3Ex7Fav4XAopE6RwVOINuuoKO7m0c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001761; v=1; x=1793606561;
 b=drf6L/9Y2ANMwz7OLHgvyXSgRtBP5A91HYPS9zwd2ypvpeHLD4AsQW2rZToy81jjeYql77ut
 C5OyZfLmvP44UJHVFsdr9XxNwIgvwGrtOy0DKJa74gVIRPSYRlstHsMLMTuPu3JwCbl9RLr3yat
 n641TwF9RCUQ2JtgvMyVAO/k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a1cb61258a50e8b;
	Mon, 26 Oct 2026 08:02:40 +0000
X-Mizu-Trace-ID: 9a1cb61258a50e8b
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
	stable@vger.kernel.org
Subject: [PATCH v3 01/10] mm/kmsan: undo the shadow mapping when the origin mapping fails
Date: Mon, 26 Oct 2026 16:03:20 +0800
Message-Id: <20261026080329.140244-2-hao.ge@linux.dev>
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

kmsan_vmap_pages_range_noflush() first maps the shadow pages and then
the origin pages. If the second mapping fails, the first one is left
mapped, and the callers do not roll it back. The next vmap of the
same metadata range hits the stale PTEs again and BUG()s on the huge
mapping path, or gets -EBUSY with a WARN_ON() on the small page one.

Undo the shadow mapping on that error path, the same way
kmsan_ioremap_page_range() cleans up after a partial failure.
__vunmap_range_noflush() only clears the PTEs; nothing has touched
the shadow mapping, so no TLB flush is needed.

Fixes: 47ebd0310e89 ("mm: kmsan: handle alloc failures in kmsan_vmap_pages_range_noflush()")
Cc: stable@vger.kernel.org
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/kmsan/shadow.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 0c88d89bf0d6..2166086d3dc3 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -258,6 +258,10 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
 					    o_pages, page_shift);
 	kmsan_leave_runtime();
 	if (mapped) {
+		/* Undo the shadow mapping set up above. */
+		kmsan_enter_runtime();
+		__vunmap_range_noflush(shadow_start, shadow_end);
+		kmsan_leave_runtime();
 		err = mapped;
 		goto ret;
 	}
-- 
2.25.1


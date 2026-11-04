Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804172;
	b=j8W+Nru6OxEFz1T33/25oaG70zWYCnOdy1SkTSXLlJov/FnX8KPeaDfPUWdeJ1q/c6Bb
	 ViEhl8ndYzXh428AoQzbrhOc6l5PEMFDmsobGRr+CsOy5mgFwh5HXvwcxjW6g5Q4yuTzX
	 MOiZlEIWI1/cy/0vgEhIAnZ0xlwAGKk08nCaD1vTTx2oZ1T/+dB3HjlrZX8jfDZEikVXo
	 VMcoMXKGWuu+U2o+JvW7SUstukQr/DviPPJOP+Z9M802LBUVudjH60uKiyubsYbKTDJBk
	 ERpnP6RAb3+mYIt84QUGZTPFK1y1AeX5y0PbxAm6q72vN3HaVYCd+sIjXsWfV2KwHjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804172;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rNNVTnTy0cTlwSmGHiRKlZ2iEy2+6bJGyVdMK3sWxNI=;
	b=0pZmlqHO8+rEP0SmUvKcJrB0RyFtrHwxD5FWvUVjtNKt2VSstpYtq/7WKj9WriQ0A90O
	 W2VaQVYkBZzxygnAU3svFdp1UBKMt3yFe01fKSJhGchvSbJLrVnm8aUHKU5T2W2r0Ez/f
	 KE3MTCc1PrKr3fJsgSob+47F4nuvLUuHGmTUObCu5bLyj8atc4KK2i/W0zYN+RqEfzIyq
	 TvGkO2F5NDwkbHLTN/sc71fzAY/Ja4004+VWrTdCMCrORVBf/1ztShqvLsaCmAzS4k4jG
	 HYX62T0qNcsjtspVdlZcKsAfq7W9YTS7ueo9Xn1U+6wAb4TIvdCknqN9viUuRpJEU9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=luMnxL52;
	arc=none smtp.remote-ip=95.215.58.29
Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C068606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C068606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=luMnxL52
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WiQsxdd6QhzAPp2ldpcECaeiN+cck/9lOboIQqVqld8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793804168; v=1; x=1794408968;
 b=luMnxL5285DUzIM2AnuE7vWel01YwA/GscQp5xVB+8cHNDMDiOZSJ1K2BKeLcoMm3HYtfixX
 PC2yI/o6bOXb/2ZmmM/rU7qTaqvh6WDG6BELEtTyoO1wlDlh+yhQfa0VhyGoHUarl54v1XDvkGY
 4P/osjJMqUFZVmeWRk762eWU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f8a97d86c29cc177;
	Wed, 04 Nov 2026 14:56:07 +0000
X-Mizu-Trace-ID: f8a97d86c29cc177
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	jbohac@suse.cz,
	david@kernel.org,
	hbathini@linux.ibm.com,
	leitao@debian.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH] crash: keep crashkernel CMA pages reserved if activation fails
Date: Wed,  4 Nov 2026 06:56:00 -0800
Message-ID: <20261104145600.3708886-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
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

reserve_crashkernel_cma() adds each crashkernel CMA area to
crashk_cma_ranges[] as soon as it is declared. If the area later fails
activation, e.g. because movablecore= put the ZONE_MOVABLE boundary
inside it, cma_activate_area() releases the pages to the buddy allocator
as ordinary memory. The range is still handed to the crash kernel and
excluded from the vmcore, so kernel data that lands there is overwritten
by the crash kernel and missing from the dump.

Mark the areas with cma_reserve_pages_on_error(), so that a failed
activation leaves the pages reserved: lost to the first kernel, but safe
for the crash kernel to use.

Fixes: ab475510e042 ("kdump: implement reserve_crashkernel_cma")
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 kernel/crash_reserve.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index a03f0a4305a4e..a4b616ed49482 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -498,6 +498,7 @@ void __init reserve_crashkernel_cma(unsigned long long cma_size)
 			continue;
 		}
 
+		cma_reserve_pages_on_error(res);
 		crashk_cma_ranges[crashk_cma_cnt].start = cma_get_base(res);
 		crashk_cma_ranges[crashk_cma_cnt].end =
 			crashk_cma_ranges[crashk_cma_cnt].start +
-- 
2.53.0-Meta


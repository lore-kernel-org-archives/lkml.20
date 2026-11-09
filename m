Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220507;
	b=vYokc8IjpmNgVO3j6Aa15I4OutlJojbsOMvP6v/uL2UlKyfhEOz3TUsC+Y/7OPooY6RR
	 tu7qgdaDVsTmrM9DmBGqcFRZCuulnVo2gbf/TAmE1xag5NhWrIXtyTTmoukTMavU50xhv
	 zvdTEf9Peeay98gDOuLcPMAtgYVV2NyyilUjpJC3NFIxFJTIDP19wJcqJKXcmqqsA/i7H
	 lL5BC+U6x2LbJc8/1mz486fWohZwxyunQQR/48kzxTKyvk9oBKK6Tk5mopH+GOAGlBF3i
	 yE7Xt0+DBSt76rQiFlRdJJDLvMa1JQe1EpWo48+pE5zqNZauwPfZBksItVz4GPnyONg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220507;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=DsGtn4KFPLGuAk1q5B2pREh+sGKflm9tEnT1EFIbPjA=;
	b=D1s9kmYsl0lCgeGAwdzahNeU7N2dkB39WKKKKSQumXVPKTqDsqOnWOyHUzntfFNBZuyI
	 Pb7rYykZaue/RoRa7sJP0AOArz3OBOdVv86vIlVHpvmL2cI1YYniiXcqVbbUBOf7Y5HhM
	 J36Q3lfncEgxWWmYetqd0kAZabaO5zCMJWtDBhj9Zi7X8cd4/snp7urpJ1c55GPnEeIBE
	 U/SF0Yg+4VofdkUtu54tz5HPkJUU7JOaEz9klILpeCbuslnHl0pZ7RoPMexwNThppXXkn
	 RiHLK/YttzRxxzRPuLZdPQEi5IAPboxJwFxjMACEloh2V8aIPPdukWfZHXnNcUGQJjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LsCCK+Ye;
	arc=none smtp.remote-ip=95.215.58.79
Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10855606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10855606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LsCCK+Ye
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bCU29ep+uwz6VaIaH7VVMUYbRv38UnA4EsVYxT/9pjs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794220504; v=1; x=1794825304;
 b=LsCCK+YeiL7Ml+HbL21XCdTjqFj5x9+iCSUBFlkzlrluAahWpau7tAgMULaETmvvtrlZlbvf
 WCsveD3qUjSdIZ0yTKnteI14Zbj66IspTGnOG3N9agJKcXJK4NFahMp01PkGqGBxHEKywDuRXF5
 yFHshJQh1OBTwaXxbP4jUfxk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 29236d32ff73c5e8;
	Mon, 09 Nov 2026 10:35:04 +0000
X-Mizu-Trace-ID: 29236d32ff73c5e8
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 09 Nov 2026 05:34:13 -0500
Subject: [PATCH v2 3/3] mm/filemap: extend VM_SEQ_READ readahead below
 descending faults
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-bug-mm-mmap-readahead-descending-v2-3-abac52890a9c@linux.dev>
References: <20261109-bug-mm-mmap-readahead-descending-v2-0-abac52890a9c@linux.dev>
In-Reply-To: <20261109-bug-mm-mmap-readahead-descending-v2-0-abac52890a9c@linux.dev>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Vishal Moola <vishal.moola@gmail.com>, fujunjie <fujunjie1@qq.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

On a VM_SEQ_READ mapping, a synchronous fault reads ahead from the
faulting page towards higher offsets through page_cache_sync_ra().

A reader that moves towards lower offsets, such as memmove() copying
backwards out of a mapping, finds the pages above the fault already
cached, so each of its faults reads a single new page.
page_cache_sync_ra() also looks for a stream only below the fault and
takes it for a small random read.

When the page above the fault is already cached, read the window of
ra_pages that ends at the faulting page instead, without a readahead
mark. Reading one byte from each page of a 2 GiB file, last page first,
in a MADV_SEQUENTIAL mapping with a cold page cache, read_ahead_kb 8192:

                   before       after
  time            50.92 s      0.96 s
  major faults     524289         258

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 mm/filemap.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index e445279cc561f..be587f8d0e8e6 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3405,7 +3405,19 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 
 		if (vm_flags & VM_SEQ_READ) {
 			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
-			page_cache_sync_ra(&ractl, ra->ra_pages);
+			if (!filemap_descending(mapping, vmf->pgoff, 1)) {
+				page_cache_sync_ra(&ractl, ra->ra_pages);
+				return fpin;
+			}
+			/* Read the window that ends at the faulting page */
+			ra->start = vmf->pgoff + 1 -
+				    min_t(unsigned long, ra->ra_pages,
+					  vmf->pgoff + 1);
+			ra->size = vmf->pgoff + 1 - ra->start;
+			ra->async_size = 0;
+			ra->order = 0;
+			ractl._index = ra->start;
+			page_cache_ra_order(&ractl, ra);
 			return fpin;
 		}
 	}

-- 
2.43.0


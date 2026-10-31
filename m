Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421256;
	b=CXF+lGK4nnfKbNwXkqBMPbuFQ4nqp6QObiOQZOon04LIhDqNOl73m/lPsjF+EfgI9o+Y
	 e15sNg57+pcYMczuM8pJWIp6aoMrz/qxpgSSgUZ1uNKfZF9kzvehgKLoXBXStOoFhtZNx
	 cQBjkGpDpR1tkeTaYNxfGZN6NrdtQqtJ3gD8u8kMZhSx1F2qCIDSAJbyH332mewGZ5a1F
	 UEVhWdpRLhywk80QwklRnH/kRmT7vy49EM0PSAtMVhYOGqmm+4Sf2wSFbqzYxgivNhdXs
	 kWf4hLlYNpNJ9tZRS7L/ts0JUi8Wvx036mTn/xxzaS/QH2apW220DDoqqGoTArQ8tlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421256;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 X-B4-Tracking:X-Change-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Flx6BFpBHU/1mQwNgXF0H0qYyTFKKY1odWtVjJY4UAU=;
	b=xQkQI5ihOsKRLPzSGC+n6b9wTDqeCQFytS/8dQ8TVpnXXwe3t0cvBWUMtnZ04ZJvQ6l4
	 347jO9lKtbJYPvomwhAXCjJW59zUWIc8tZwgJn7ztPC8tIT6heSFKD2PuC8EXqu4sYnVU
	 2Ld/WVTvK6jvG+XwaVHLV+YQQKA2U8GNbNfd7zr9Oz/WVRqnw4j1gGOMGL60/dRWsZAu6
	 6WiQ2VsQ2CzXtvwlJ46lH19fK/SuvJqogmyUi7cJ0G0NpraMgg9AZ35hOFg5OD7VjFhAT
	 tZ06HwTEEnUaKb7qXYZFhPxMNER67W8iutJakMoNjVHo75s0Vs8MvAtSNycGYA6mdpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dfA3sF3O;
	arc=none smtp.remote-ip=95.215.58.240
Received: from mta1.migadu.com (out-240.mta1.migadu.com [95.215.58.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B901B606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B901B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dfA3sF3O
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sRRglwrZgXV0SrK/OtUomTWdFA+5PNai7nUeEM2ufrs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793421253; v=1; x=1794026053;
 b=dfA3sF3OjfsnSyAXxygps3E5xBqKVi8PVPQwEBwBYiC8Ivlyw64CIRv2XWJn8WzS/lBrwj6P
 Y+WZcoRkzXd3JehipnlmIX1nYaDmvOIzsib7XKbkj/wYYfDyN4vAHYhH072gBgRruKBd4AuVu8r
 Edhk6d3kxe6eIoHy4p9AMoVQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 84ce8c3f7c47124b;
	Sat, 31 Oct 2026 04:34:08 +0000
X-Mizu-Trace-ID: 84ce8c3f7c47124b
X-Migadu-Flow: FLOW_OUT
Date: Sat, 31 Oct 2026 04:33:59 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Krystian Kaniewski <krystianmkaniewski@gmail.com>, 
	stable@vger.kernel.org, "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Subject: [PATCH v2] mm/filemap: stop fault-around when the walk steps back
Message-ID: <20261031-jf-mm-filemap-map-pages-lower-bound-v2-1-21029744e589@linux.dev>
X-B4-Tracking: v=1; b=H4sIACVu5WoC/yXNyw6CMBCF4Vchs3YSqAmpvopxMbRTHEIvaUVNC
 O9ugcVZfJv/rFA4Cxe4Nytk/kiRGCrUpQHzojAyiq0G1aq+a5XGyaH36GRmTwn3JRq54By/nHG
 IS7BIvbqy1aQ7c4NaSpmd/I6Xx/N0WYaJzXtPw7b9AbLiH4eHAAAA
X-Change-ID: 20261028-jf-mm-filemap-map-pages-lower-bound-a623ed8a81c9
X-Mailer: b4 0.15.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

filemap_map_pages() can dereference a PTE pointer outside the page table
it locked. KASAN has reported this as a use-after-free read [1]. The
same path can also write out of bounds. When the stray entry reads as
none, the fault-around loop maps a page there with set_pte_range().

Its fault-around loop walks the page cache and moves vmf->pte by the
change in index. A lower index moves it back. xas_find() can step back
to a lower index when a multi-index entry is split during the walk.

[1] fixes xas_find(), but the loop still relies on the walk never
stepping back. Stop the fault-around when the walk steps back. ->fault()
maps the faulting page if the loop did not.

Link: https://lore.kernel.org/20260904121301.200049-1-krystianmkaniewski@gmail.com [1]
Fixes: 6b24ca4a1a8d ("mm: Use multi-index entries in the page cache")
Cc: stable@vger.kernel.org
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
Changes in v2:
- Add Fixes: and Cc: stable tags, and say in the message that the loop
  can also write out of bounds (David Hildenbrand).
  https://patch.msgid.link/0a1ad7d2-ff0e-4248-8f03-2a64a9134aae@kernel.org
- Link to v1: https://patch.msgid.link/20261028-jf-mm-filemap-map-pages-lower-bound-v1-1-0bf126e876d4@linux.dev
---
 mm/filemap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/filemap.c b/mm/filemap.c
index b74bc1e5015c..1df776907140 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3968,6 +3968,13 @@ vm_fault_t filemap_map_pages(struct vm_fault *vmf,
 		unsigned long end;
 		vm_fault_t map_ret;
 
+		/* A lower index could move vmf->pte out of its page table. */
+		if (unlikely(xas.xa_index < last_pgoff)) {
+			folio_unlock(folio);
+			folio_put(folio);
+			break;
+		}
+
 		addr += (xas.xa_index - last_pgoff) << PAGE_SHIFT;
 		vmf->pte += xas.xa_index - last_pgoff;
 		last_pgoff = xas.xa_index;

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261028-jf-mm-filemap-map-pages-lower-bound-a623ed8a81c9

Best regards,
--  
Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>


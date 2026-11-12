Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794454761;
	b=ZL/mm6HfGUEZwBr2GdEBbGjs//3vqLaSckOAhE6/bwQScsYVY7AfRtccnBUe3uNR/Txf
	 cZJt/t7lloG7bQWLovsbCPflZRnI+5PCKXY85D1fGqQykjy9f7hVgVzH2+YPTxRPc1IVx
	 +/PjFH79F9kW0KxrmHI5WCKzkq3f/UURoPxOgamOf0ttoC3hbRAEeJzNa21LZJmzW1f3t
	 dTyutKnErQtjLMnw39/3HuPJA10++EcUL72AUdBkZc/uxzD+dH6mpptKjpvTHhURYmbI3
	 y88we8KLUO4mf2Jaunsfm79jCVb3RgPl+z+ZxHMdppT9+gj25vFzG2oFjSsvS7L4YuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454761;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer;
	bh=lN/piXhtdPACOa13WtNqIwYIKwldh3lDc6Fab80206s=;
	b=NkQKJdHFi0BscTRqTuB2PDeUVpaD9kjEe2ngDXDkr9bdyPS2v9r0MaRMyLXgXe95zxwv
	 JA9Vii6QFamQwStJm0snephLJy0cLS0wj4pLJ8n5F+cH2fINDokiM6QUwFez14yZTDxbY
	 NE3z+v96S+9H4YmI5T8Xir2ZSwVUQUOY5eXC/Pat8vidwZ3cCATYKTVogPS22fT+7DGYg
	 xvyFn6uJpsgeznHMwtJF/fADR8zCG/DUjhLQMLonEoZf5mVPLmwLSsVyPiL3UDotVOU6b
	 0BK8dr/3Z3ZBzRFtsKohiDLGHyx+rEfDQZigDjbNiRB7ayCvQpcYsmV70rBedjw7GNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dFuC2xlQ;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44AD3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dFuC2xlQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WagULwVSRwlFPNiHuU3y1792mcFYfBmerRUsHRfoDYc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794454758; v=1; x=1795059558;
 b=dFuC2xlQS0kBW4rA/SkuuSMMjDzLesUOn3lOhPo3LqBgk+ewSOvk5zl+BH684JbONMg8J5CN
 4xRD7QC15enpDveMdaAKmTpkz2+oXbyUIkJa4ZzYbJZ0JQMH6LOyBxA4mXONTZPcf1i5xHKn+rz
 ciEjwSM/JXXx9dRkBFtehcLw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da00386efe8865b5;
	Thu, 12 Nov 2026 03:39:18 +0000
X-Mizu-Trace-ID: da00386efe8865b5
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 11 Nov 2026 22:39:01 -0500
Subject: [PATCH] mm/shmem: drop the second folio batch from
 shmem_undo_range()
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
Message-Id: <20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev>
X-B4-Tracking: v=1; b=H4sIANQ09WoC/x2MywqAIBAAfyX23EIK2eNXooPlantYC6UIon9Pm
 tscZh7IlJgyjNUDiS7OvMciqq5g3WwMhOyKg260UQVczoAimDchwTO6HX2yQmhMr3tSQ2ddC6U
 +Enm+//M0v+8HA8ESc2kAAAA=
To: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, 
 Qiliang Yuan <odys.yuan@gmail.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

shmem_undo_range() keeps a folio_batch and an array of FOLIO_BATCH_SIZE
indices on its stack. Removing truncated folios from the page cache in
batches added a second folio_batch to collect the folios to delete.

That grows the stack frame by about 200 bytes, past the 1024 byte limit
of mips eyeq6_defconfig built with clang.

Pass fbatch itself to delete_from_page_cache_batch() once the swap
entries are gone, as truncate_inode_pages_range() does. Undoing a failed
fallocate() only removes the folios that are not uptodate, so remove
those one at a time with truncate_inode_folio() as before.

Stack frame of shmem_undo_range() built with clang 18:

  config                before (bytes)  after (bytes)  change
  mips eyeq6_defconfig             928            720    -22%
  x86_64                           920            712    -23%

Fixes: b97fbd541ecba ("mm/shmem: remove truncated folios from the page cache in batches")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611112032.TMyPU6Rm-lkp@intel.com/
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
David, this applies on top of b97fbd541ecba in shmem-7.5.misc; please
fold it in if you prefer.
---
 mm/shmem.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 156469423a866..5bcbdd6078a73 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1352,9 +1352,6 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
 	index = start;
 	while (index < end && find_lock_entries(mapping, &index, end - 1,
 			&fbatch, indices)) {
-		struct folio_batch remove;
-
-		folio_batch_init(&remove);
 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
 			folio = fbatch.folios[i];
 
@@ -1366,13 +1363,14 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
 				continue;
 			}
 
-			if (!unfalloc || !folio_test_uptodate(folio)) {
+			if (!unfalloc)
 				truncate_cleanup_folio(folio);
-				folio_batch_add(&remove, folio);
-			}
+			else if (!folio_test_uptodate(folio))
+				truncate_inode_folio(mapping, folio);
 		}
-		delete_from_page_cache_batch(mapping, &remove);
 		folio_batch_remove_exceptionals(&fbatch);
+		if (!unfalloc)
+			delete_from_page_cache_batch(mapping, &fbatch);
 		for (i = 0; i < folio_batch_count(&fbatch); i++)
 			folio_unlock(fbatch.folios[i]);
 		folio_batch_release(&fbatch);

---
base-commit: b97fbd541ecba5d6640077618e9dfec6f5e71132
change-id: 20261111-bug-mm-shmem-undo-frame-66828e197ad5

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>


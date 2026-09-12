Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAB0356744
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789211326; cv=none; b=Y5wUn8lBm7qCa3bwl5HZNx8kHzPZ7Rh8nwrvh8EEdlUDeCh2O5TNFMc8JTL6YE3KqcaeQZ3s0y++Jtq4uAz3L2dyQVhMZGocWwQF6yBKDPqH3Wv+rH4FPoRkkr+zqcc4CCZlgrS2c2oO6D7aJV0oAGB5+h3gaLY1nBpDa56KSRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789211326; c=relaxed/simple;
	bh=w0iQ1ElPZG8CGBOxclieLTI3Hv/dWfS1jW9w6CIsytA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZxwOxlGmflnTaysnMPJv+1tQGCxqtal7IaqpUw16BAnM1QiPobDahuyYFrTUyyXHzMjsdp7crkKZRAVFQ8vMjWFkUVSvPt5D1WjGis3AIWuBhHGEhLJcCKRjexEaIafv/jrUWCwie6fr5Kfc3Bbb9DrWrJdXo4wGo8H5bOccCqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BB4vciQp; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BB4vciQp"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530de452c33so9780521cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789211323; x=1789816123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WoLZKX+VYEAJ1h2MzFjGfo+B6Qip7pZn2KfalQNbIs=;
        b=BB4vciQpFNMs9g8SMhW5mh3drCGBmfannOXxInjtV+cLpaMaDV1cIcS+3D/nT6l0eH
         4sS3gUtUBt+33J4phxyuo9FOSUV66H75dDMWxAcJLekBjl0be11c8gbR9H9sCggWPCNT
         Y+2VnpPsINOxlk8iKtRspfpiQo6MqBtuIkcBrgoFssx+trLyI6EInr57NTS43wxbeQTv
         Aaoqw8Ofk6or3nYq4IyCb538oSL+wqeYcsLXuT2650G96w2jSnnemqwVmJGhNSBMzbNZ
         xoyHobM5VWSwjMGlSA2R3iN7WSl9KEylfwhJU05m42p0Vy6VDL+qIwt/1/nq6Vud+4uc
         f/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789211323; x=1789816123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WoLZKX+VYEAJ1h2MzFjGfo+B6Qip7pZn2KfalQNbIs=;
        b=WZqiNAKjfbel0gGK5QolNf6YJil3Npp5/uK1j0EFkr+Uvy2/Aq1p2evzBAYVp+PSnM
         JaqRCxhM5avqebIS2gsMruJNApYgqOn+r7BB0A+ZTefap467xyqhkeVpb2OinjYqxXci
         j6YY+ogLsM8hIv9GqlxU3TwbVhg68EFpQF0HJHCMYK1B383rl5paJag3YLBkT2LfiNRd
         XaKcQUfGTrGv44vNYWZEjIEjJPze9LGWtqrnYkBDyV+R1hzvOwPWeXsMLpwU7q66z/pb
         0APZLKhmtZvUbTjdlMsn7c6lW/70kkLeMSTqxTgfRcdZ9UnPSRtREIqj/zydfhJFqELS
         4dWw==
X-Gm-Message-State: AFuF++ksYV7w5cCSSNZTzI9enQ6Jxa+xi0RKh0kczIA/ZSCpWzTAmStX
	D47GX3v+yQ4UNt+Qz0/1eRgQAKn+agOM3ndjpnjIL/Z1dwhqbI3YBBdGjUxyWYNSBg0=
X-Gm-Gg: AYBFou1ajiMaSBbbyHbAW+iW8UOB5RvzX++8Fn1VErt+PCnp/CUBXuTTjmqozQOaxI7
	Vx8DSZ/zd/7cMDO+BehB5S8Ki10GK9KJsVpi4Hv09paqqx06YmeQuN4MqkQvQQ+bUMXNPlZjgIz
	n76jBqVgyqnzNnia3Gt5JZobxUI6y0oDfIPA3u1VacDTj0vATWT9/YfrBtzQTlV1azimVNc6UkA
	vkCNNWa7NI0tictQDT7c2gWx2Zm+gNhAEuIemrPrIOVgFouAgynMJr3BZ6HMj726iEHOErwulgD
	ppfYdTMaYtiu+KQeSrFIX5k1B4XK5MQnSte7kALdmfoZ38v4/BQbptnHslxapvTox2cdkRH+BXb
	Vr5pvigfUppcugZgpO1pm2cvyeD5Oom1SIUhT4AwSMZyjuxLAyA1wZHEp5S1mdiXQh/+o5igAm6
	kG4xIuSAPFRBn0EsZUmJpGIWdowmGz87SzFi9Gw91fbuty4eIa0rRECpgxyOhzSxxTLE3k4Md5c
	9ERtjsTXZNCeNESddoxYrD/R9gwI+w+kh+7PU+yBiWLGKGedXI2ZHaWRw71
X-Received: by 2002:a05:622a:14cd:b0:52f:c0f4:5 with SMTP id d75a77b69052e-530c8569d2dmr120227601cf.17.1789211323502;
        Sat, 12 Sep 2026 04:08:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530d5e946a0sm33925171cf.25.2026.09.12.04.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:08:43 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	wangjiexun@tinylab.org,
	sashiko-bot <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Date: Sat, 12 Sep 2026 07:08:32 -0400
Message-ID: <20260912110832.3203902-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_PAGEOUT collects isolated folios on a local list before reclaiming
them after the PTE walk.  The reschedule path drops the PTE lock and then
restarts the mapping with pte_offset_map_lock().

A concurrent operation can remove or replace the PTE table while the lock
is dropped, causing pte_offset_map_lock() to return NULL.  Returning directly
in that case bypasses reclaim_pages(), leaving the collected folios off the
LRU with elevated references.

Route the failure through the existing cleanup path so any isolated folios
are reclaimed or put back.

Simplest userland pseudo-code reproducer:

p = mmap(PMD_SIZE, ANONYMOUS);
touch_every_page(p, PMD_SIZE);
parallel {
   while (1) madvise(p, PMD_SIZE, MADV_PAGEOUT);
   while (1) {
       madvise(p, PMD_SIZE, MADV_DONTNEED);
       touch_every_page(p, PMD_SIZE);
   }
}

Reproduced in qemu trivially with some explicit widening of the race window.

Fixes: b2f557a21bc8 ("mm/madvise: add cond_resched() in madvise_cold_or_pageout_pte_range()")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260821150912.183976-1-gourry@gourry.net
Cc: <stable@vger.kernel.org>
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 574aa2bb7c7e..ba5a3d77241a 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -464,7 +464,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 restart:
 	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
 	if (!start_pte)
-		return 0;
+		goto out;
 	flush_tlb_batched_pending(mm);
 	lazy_mmu_mode_enable();
 	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
@@ -568,6 +568,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 			folio_deactivate(folio);
 	}
 
+out:
 	if (start_pte) {
 		lazy_mmu_mode_disable();
 		pte_unmap_unlock(start_pte, ptl);
-- 
2.55.0


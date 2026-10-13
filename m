Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356A33F1050
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883180; cv=none; b=fcSupYozN7lOdR3y56jjBINO9aLCvXl15v1lDEHI8LsHIm7ip5hxCkmCufukyKEvHXsNvw9W21iY84Thf5s2tUEdbHOEFEeIVlFDAYiilFaPbLoyEo0UbYecYfbtlH6WUtVG8OFs8RrC2NmPdYWPyhDLX1dlDEDxuWtfRv1bPb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883180; c=relaxed/simple;
	bh=GQXT5Vzho3+bMmYh6YCb3zTvaiUu6cKYQIAuGkbrjHg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gDCQVjwlMHYvBIDIYk8I/cCRge3yhRTlrPi7D4YZNpCwo0hwvAN0kn3MJCXduL1blbvh1CoCZZMezzrGtSFBJx/+pBSPsdthGxC5tt+DsGJtHfNG70n2JEBmNxpzWogpyOs1NjAcEQdkJO/BoGDQvN94oS0lIo5h5QyrUg+I0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=tSH/Wi9q; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=0gcI8aCZ; arc=none smtp.client-ip=46.30.211.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="tSH/Wi9q";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="0gcI8aCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1791883104; x=1792487904;
	d=konsulko.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=QvNh11oJXl4baoOT3DDsfp6RFRaR2ZJoWtlgXXO75tI=;
	b=tSH/Wi9qixI4r+KP6FzS9zXUGshyfkpCGVGoLSlmZ+i8KrjEzp9ry4AR/gIyVCXj+lSpJRTU1I/8E
	 JK85Xqj/aHTQ7eq63qsYNxhakfGwUUZ7i/wwl9MlGwglPzKzglhA3kJyd5tZjx73jYgUffayQ6XW2E
	 VAE6D3oS74Qq4GKJb7sygrNyXw+fwEM+mhvOe9hVVmJZbn+CFl8rbJSlskMTNBtkKK928jhNkqczBH
	 PGX8f9oH+TsXvc/i8tv/EP26fGoTcVnT7kZOejqjXClOhmHBMjtZttczNeyJS73qqt1zurrF4ct0sS
	 LXfN9rK1JyK6UJER6WUOZAzcaE1mFMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1791883104; x=1792487904;
	d=konsulko.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=QvNh11oJXl4baoOT3DDsfp6RFRaR2ZJoWtlgXXO75tI=;
	b=0gcI8aCZpvuOyPEeMuf/5JJupCYCw4UOfVru3UBNBjuLktxnMxpF1HNrTVzUT318RcHLmVFyjPEUp
	 PqppCM1Dg==
X-HalOne-ID: 09f3f4df-c6e7-11f1-b88b-7d3e33f7de26
Received: from localhost.localdomain (c213-102-77-204.bredband.tele2.se [213.102.77.204])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 09f3f4df-c6e7-11f1-b88b-7d3e33f7de26;
	Tue, 13 Oct 2026 09:18:24 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Hao Li <hao.li@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Vitaly Vul <vitaly.vul@partner.samsung.com>
Subject: [PATCH v2] mempool: optimize mempool resizing
Date: Tue, 13 Oct 2026 11:14:08 +0200
Message-Id: <20261013091408.1231786-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resizing mempool to a bigger size currently requires a new allocation and
a data copy to a new larger elements array which doesn't go well with the
idea of having a fast and deadlock free memory allocations during exreme
load.

This situation can't be completely avoided but its occurrence can be
vastly minimized if we track the actual number of slots in the elements
array. This patch introduces a new member of struct mempool which is set
when the array is allocated in mempool_init_node() and only changes when
mempool_resize() replaces the array with a bigger one.  Growing a pool to a
size that still fits the existing array now just raises min_nr and refills
the pool.

A racing resize may enlarge the array while the lock is dropped for the
allocation, so __elements_size is checked again once the lock is
retaken, and the unneeded array is freed.  The array being replaced is
now freed after dropping the lock.

Signed-off-by: Vitaly Vul <vitaly.vul@partner.samsung.com>
---
 include/linux/mempool.h |  1 +
 mm/mempool.c            | 43 ++++++++++++++++++++++++++---------------
 2 files changed, 28 insertions(+), 16 deletions(-)

Changelog:
* v2: all the API / behavioral changes are dropped, only the
  optimization remains

diff --git a/include/linux/mempool.h b/include/linux/mempool.h
index 6da502aef2f7..a8a411290bf0 100644
--- a/include/linux/mempool.h
+++ b/include/linux/mempool.h
@@ -20,6 +20,7 @@ typedef struct mempool {
 	int min_nr;		/* nr of elements at *elements */
 	int curr_nr;		/* Current nr of elements at *elements */
 	void **elements;
+	int __elements_size;	/* nr of slots in *elements, never shrinks */
 
 	void *pool_data;
 	mempool_alloc_t *alloc;
diff --git a/mm/mempool.c b/mm/mempool.c
index cb74e718b2c6..1911a696737b 100644
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@ -261,6 +261,7 @@ int mempool_init_node(struct mempool *pool, int min_nr,
 					    gfp_mask, node_id);
 	if (!pool->elements)
 		return -ENOMEM;
+	pool->__elements_size = max(1, min_nr);
 
 	/*
 	 * First pre-allocate the guaranteed number of buffers,
@@ -353,6 +354,8 @@ EXPORT_SYMBOL(mempool_create_node_noprof);
  * This function shrinks/grows the pool. In the case of growing,
  * it cannot be guaranteed that the pool will be grown to the new
  * size immediately, but new mempool_free() calls will refill it.
+ * Shrinking keeps the elements array, so growing the pool again up to
+ * the largest size it ever had does not reallocate it.
  * This function may sleep.
  *
  * Note, the caller must guarantee that no mempool_destroy is called
@@ -364,7 +367,7 @@ EXPORT_SYMBOL(mempool_create_node_noprof);
 int mempool_resize(struct mempool *pool, int new_min_nr)
 {
 	void *element;
-	void **new_elements;
+	void **new_elements = NULL;
 	unsigned long flags;
 
 	BUG_ON(new_min_nr <= 0);
@@ -381,24 +384,31 @@ int mempool_resize(struct mempool *pool, int new_min_nr)
 		pool->min_nr = new_min_nr;
 		goto out_unlock;
 	}
-	spin_unlock_irqrestore(&pool->lock, flags);
-
-	/* Grow the pool */
-	new_elements = kmalloc_objs(*new_elements, new_min_nr);
-	if (!new_elements)
-		return -ENOMEM;
 
-	spin_lock_irqsave(&pool->lock, flags);
-	if (unlikely(new_min_nr <= pool->min_nr)) {
-		/* Raced, other resize will do our work */
+	/*
+	 * Grow the pool.  The elements array is only reallocated if it is too
+	 * small, it may still be large from before an earlier shrink.
+	 */
+	if (new_min_nr > pool->__elements_size) {
 		spin_unlock_irqrestore(&pool->lock, flags);
-		kfree(new_elements);
-		goto out;
+		new_elements = kmalloc_objs(*new_elements, new_min_nr);
+		if (!new_elements)
+			return -ENOMEM;
+
+		spin_lock_irqsave(&pool->lock, flags);
+		if (unlikely(new_min_nr <= pool->min_nr)) {
+			/* Raced, other resize will do our work */
+			goto out_unlock;
+		}
+		/* A racing resize may have enlarged the array meanwhile */
+		if (new_min_nr > pool->__elements_size) {
+			memcpy(new_elements, pool->elements,
+			       pool->curr_nr * sizeof(*new_elements));
+			/* The old array is freed below, outside the lock */
+			swap(pool->elements, new_elements);
+			pool->__elements_size = new_min_nr;
+		}
 	}
-	memcpy(new_elements, pool->elements,
-			pool->curr_nr * sizeof(*new_elements));
-	kfree(pool->elements);
-	pool->elements = new_elements;
 	pool->min_nr = new_min_nr;
 
 	while (pool->curr_nr < pool->min_nr) {
@@ -418,6 +428,7 @@ int mempool_resize(struct mempool *pool, int new_min_nr)
 out_unlock:
 	spin_unlock_irqrestore(&pool->lock, flags);
 out:
+	kfree(new_elements);
 	return 0;
 }
 EXPORT_SYMBOL(mempool_resize);
-- 
2.39.5


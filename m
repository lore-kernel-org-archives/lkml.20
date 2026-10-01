Received: from mail-dy2-f36.google.com (mail-dy2-f36.google.com [74.125.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A64E235D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846282; cv=none; b=J6tL0OX/Y5N9fWKIORmMblGTVHQNQoUYHr5F3E9pwHM7BLcRlcXJhVLApmICdv+n6gNf2AjEszL4O1iHnyrZth6595kE/f3g7R0M2HxeBU6DCZ0OyI51cTiS6bcxHTC6MMnq6xc08cBDOA1WyapfM+0uK9WzQYb+l6HaHZvOkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846282; c=relaxed/simple;
	bh=2J04lGMtf8mSDWLDK5C/ojbmgxuIT9YX4NIREYiSyfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqQOb4C4aYyb8tO91QY+n6Z1x7InFnLyY7TAj4e4AKNXomUe9X+T6kTak3xuTPxkhUOHDPZMOK7hnRO/ucrL5APIX6KW7aLP1U3bCDTroK29AajcKIzN6jxW9yrD7Gqa97iIUrG7zcdHpRt6AX6XfK5AKjyF/4Ddnmmc8D70ib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvSlHSsG; arc=none smtp.client-ip=74.125.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvSlHSsG"
Received: by mail-dy2-f36.google.com with SMTP id 5a478bee46e88-328664c2da6so5382648eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790846280; x=1791451080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s45y1Prg6U8JIEqBpcw11VJd/2zUrUrw7cAbqwVsWZQ=;
        b=UvSlHSsGMHbzFX1S1KZOeUMT96Sm2YOfqQjVT4rTLoP8wTA1LmwwHVolYsNQL3c+6g
         uCx0BJxQ+ONTSu9ugAiVzz4E99+N+86GheZJDzenY9qJHP/mIT0ldsYDQlnw3yYNKH7o
         HSGVwszEqArRuVUEpSEyWjbBbDPb18fSL9W3066aCT68Ym0/tNjWsjELpswlrlNcKc18
         6TgxeXheSw11eQWuvTwFw1jqlpbcWZttav7mo2/F2ddNOAROYVZ3IqWOOxijsYkl5d+D
         lI6fLUZw0C1E3ZlNM/hQG2kKwpHdzPciGDPbXLq9R1NvKXI4AxYa+a/bTpeb+w7uRNro
         Kz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846280; x=1791451080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s45y1Prg6U8JIEqBpcw11VJd/2zUrUrw7cAbqwVsWZQ=;
        b=zvv4g+vQtO/FsMM7Lr/SxoLuuFTpLGIwzAl1iZi9U2VHKew5Sbg7oDBD2BpQ4BXAj4
         kSTgxL6Qb6l4uDm2pOzhwYudZOIm2N4TEXQf4DKbjm09I8soqwotjHPOurH8cpoPK9XQ
         84i9dfkccq5XhVlsE6RGpbmAB4+LTXuoXWAMquIFprRXuxsHy8si9bH6nAyNb+ujPDzV
         ZHNxecxanKZ04o55iBNTrsn2XsJLj3ZNqdgvM1dc4Gtxf/Bia7tKv5y1jq0+asJTSBAT
         uYx24q5NdI1zzMRBsdXe1cGWpuIq5dXywSpr/ZdYeVC/1SW+1vwBd/uNaY6ItEjCIDQR
         ydKA==
X-Forwarded-Encrypted: i=1; AKwUvBzNCHEnIQp0m2BAyMHpt/bZXxfy4l3VzQU91IZySrmX+NX4v+UrEQ2DAkaSOqcp0Rb7KFvVvnPS459ayLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyjBUI0f9SFCnxI/6sG4Otvrj/ioIz5PElHFi3UgbHw0bBNZ5U
	eCUDfN0VDjqqlcmu0TFARIhlK22Fgy8MrqfWNpPXS9hlRIgo3yAbliQD
X-Gm-Gg: AYBFou1yWd/G+wYC090BtdOaWJuIgCeaE/Ji7sN+OB6VgjJz1f6rqMzu53rNNa/vRfX
	+qtMv1YYc4Ux1Fjac27QZjHG6MuV06USQGEzeEK3DLIs38NYdtJX81jINfMrzpaFC4FnvAKpkOe
	bJJUwTyWH08/lTkcGa+NBFbV0PC0fMRhFiGgHckdcKmFz+Ds7V1fq4rSUs9tAEiNiT5OS4tJQ1U
	9tvL1WS6BSVrnsSgMaKq/HxUHdtu8z0VoCrsaqmvlCaXoz88U3cix0jX+//tp2w8ORLCauQ9lbE
	yIl4Unc37ElvBnIUZDTSxOX4wKRcdwhxOyXzCR/GIA9cbDGnFPfGzH7dYv4FWwYnmiWyGYKPmOF
	tdPScAqrT3+6HY9aGNf8tjY6oCbnYQGRLAyUK6SlOlw1cnPTE6Cfjq9EQ8LFDnojnCCR5SBJiCF
	33d2ePTPxkwwYi+2ANVf/ueEiLIKeDOna74V+hZ2LkW4M0hI12Z+hD/IuKPZ86Yifyj0hixK90S
	udn
X-Received: by 2002:a05:7301:46a6:b0:33e:4097:1ef6 with SMTP id 5a478bee46e88-34cdbed5ad6mr4360133eec.15.1790846279536;
        Thu, 01 Oct 2026 02:17:59 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3750fa8sm6271798eec.11.2026.10.01.02.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:17:59 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 01 Oct 2026 17:17:50 +0800
Subject: [PATCH 1/2] blk-mq: share one tags_srcu instance across all tag
 sets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bug-blk-mq-global-tags-srcu-v1-1-e8415da10d1b@gmail.com>
References: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
In-Reply-To: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>
Cc: Yu Kuai <yukuai@fygo.io>, Hannes Reinecke <hare@suse.de>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Freed request pages and flush queues are handed to call_srcu() so that
concurrent tag iterators never see them disappear. Each tag set embeds
its own srcu_struct for this, which blk_mq_free_tag_set() has to drain
with srcu_barrier() before cleanup_srcu_struct(). The barrier waits for
a full SRCU grace period even when the callbacks are long done, adding
1-3 ms to every tag set teardown. Drivers that free tag sets under a
lock make it worse: ublk does it under the global ublk_ctl_mutex, so
deleting devices from many threads serializes on that grace period.

The callbacks free memory that only blk-mq owns. They touch neither
the tag set nor driver code, so they don't need a per-set domain.
Replace the per-set srcu_struct with a single global one. Freeing a tag
set no longer waits for a grace period, and each tag set no longer
allocates per-CPU SRCU state. The read side is unchanged. The only cost
is that a long-running iterator can now delay these frees for other tag
sets too, which only postpones freeing memory.

On 7.3-rc5 in a 16-vCPU VM, with 1 queue and depth 16 per ublk device,
median of 3 runs (5 for the 16-thread null_blk case):

                                       before     after
  ublk DEL_DEV p50, serial             3.45 ms    0.17 ms
  ublk delete 1000 devices, serial     19.5 s     14.9 s
  ublk delete 4000 devices, 16 thr     19.0 s     2.9 s
  null_blk destroy 500 devs, serial    9.97 s     9.25 s
  null_blk destroy 256 devs, 16 thr    5.15 s     4.30 s

Fixes: ad0d05dbddc1 ("blk-mq: Defer freeing of tags page_list to SRCU callback")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 block/blk-mq-tag.c     | 17 ++++++++++++-----
 block/blk-mq.c         | 15 ++++-----------
 block/blk-mq.h         |  2 ++
 include/linux/blk-mq.h |  3 ---
 4 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
index 35deee5bbc739..6e01309226716 100644
--- a/block/blk-mq-tag.c
+++ b/block/blk-mq-tag.c
@@ -18,6 +18,13 @@
 #include "blk-mq.h"
 #include "blk-mq-sched.h"
 
+/*
+ * Protects tag iteration against the deferred freeing of tags->page_list and
+ * flush queues. The callbacks touch neither the tag set nor driver code, so
+ * one global instance is enough and freeing a tag set needn't wait for them.
+ */
+DEFINE_SRCU(blk_mq_tags_srcu);
+
 /*
  * Recalculate wakeup batch when tag is shared by hctx.
  */
@@ -443,7 +450,7 @@ void blk_mq_tagset_busy_iter(struct blk_mq_tag_set *tagset,
 	unsigned int flags = tagset->flags;
 	int i, nr_tags, srcu_idx;
 
-	srcu_idx = srcu_read_lock(&tagset->tags_srcu);
+	srcu_idx = srcu_read_lock(&blk_mq_tags_srcu);
 
 	nr_tags = blk_mq_is_shared_tags(flags) ? 1 : tagset->nr_hw_queues;
 
@@ -452,7 +459,7 @@ void blk_mq_tagset_busy_iter(struct blk_mq_tag_set *tagset,
 			__blk_mq_all_tag_iter(tagset->tags[i], fn, priv,
 					      BT_TAG_ITER_STARTED);
 	}
-	srcu_read_unlock(&tagset->tags_srcu, srcu_idx);
+	srcu_read_unlock(&blk_mq_tags_srcu, srcu_idx);
 }
 EXPORT_SYMBOL(blk_mq_tagset_busy_iter);
 
@@ -512,7 +519,7 @@ void blk_mq_queue_tag_busy_iter(struct request_queue *q, busy_tag_iter_fn *fn,
 	if (!percpu_ref_tryget(&q->q_usage_counter))
 		return;
 
-	srcu_idx = srcu_read_lock(&q->tag_set->tags_srcu);
+	srcu_idx = srcu_read_lock(&blk_mq_tags_srcu);
 	if (blk_mq_is_shared_tags(q->tag_set->flags)) {
 		struct blk_mq_tags *tags = q->tag_set->shared_tags;
 		struct sbitmap_queue *bresv = &tags->breserved_tags;
@@ -542,7 +549,7 @@ void blk_mq_queue_tag_busy_iter(struct request_queue *q, busy_tag_iter_fn *fn,
 			bt_for_each(hctx, q, btags, fn, priv, false);
 		}
 	}
-	srcu_read_unlock(&q->tag_set->tags_srcu, srcu_idx);
+	srcu_read_unlock(&blk_mq_tags_srcu, srcu_idx);
 	blk_queue_exit(q);
 }
 
@@ -618,7 +625,7 @@ void blk_mq_free_tags(struct blk_mq_tag_set *set, struct blk_mq_tags *tags)
 		return;
 	}
 
-	call_srcu(&set->tags_srcu, &tags->rcu_head, blk_mq_free_tags_callback);
+	call_srcu(&blk_mq_tags_srcu, &tags->rcu_head, blk_mq_free_tags_callback);
 }
 
 void blk_mq_tag_resize_shared_tags(struct blk_mq_tag_set *set, unsigned int size)
diff --git a/block/blk-mq.c b/block/blk-mq.c
index a26a11c73ee3e..f4ba1ac92a228 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3683,9 +3683,9 @@ static bool blk_mq_hctx_has_requests(struct blk_mq_hw_ctx *hctx)
 	};
 	int srcu_idx;
 
-	srcu_idx = srcu_read_lock(&hctx->queue->tag_set->tags_srcu);
+	srcu_idx = srcu_read_lock(&blk_mq_tags_srcu);
 	blk_mq_all_tag_iter(tags, blk_mq_has_request, &data);
-	srcu_read_unlock(&hctx->queue->tag_set->tags_srcu, srcu_idx);
+	srcu_read_unlock(&blk_mq_tags_srcu, srcu_idx);
 
 	return data.has_rq;
 }
@@ -3957,7 +3957,7 @@ static void blk_mq_exit_hctx(struct request_queue *q,
 	if (set->ops->exit_hctx)
 		set->ops->exit_hctx(hctx, hctx_idx);
 
-	call_srcu(&set->tags_srcu, &hctx->fq->rcu_head,
+	call_srcu(&blk_mq_tags_srcu, &hctx->fq->rcu_head,
 			blk_free_flush_queue_callback);
 	hctx->fq = NULL;
 
@@ -4884,9 +4884,6 @@ int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set)
 		if (ret)
 			goto out_free_srcu;
 	}
-	ret = init_srcu_struct(&set->tags_srcu);
-	if (ret)
-		goto out_cleanup_srcu;
 
 	init_rwsem(&set->update_nr_hwq_lock);
 
@@ -4895,7 +4892,7 @@ int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set)
 				 sizeof(struct blk_mq_tags *), GFP_KERNEL,
 				 set->numa_node);
 	if (!set->tags)
-		goto out_cleanup_tags_srcu;
+		goto out_cleanup_srcu;
 
 	for (i = 0; i < set->nr_maps; i++) {
 		set->map[i].mq_map = kcalloc_node(nr_cpu_ids,
@@ -4924,8 +4921,6 @@ int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set)
 	}
 	kfree(set->tags);
 	set->tags = NULL;
-out_cleanup_tags_srcu:
-	cleanup_srcu_struct(&set->tags_srcu);
 out_cleanup_srcu:
 	if (set->flags & BLK_MQ_F_BLOCKING)
 		cleanup_srcu_struct(set->srcu);
@@ -4972,8 +4967,6 @@ void blk_mq_free_tag_set(struct blk_mq_tag_set *set)
 	kfree(set->tags);
 	set->tags = NULL;
 
-	srcu_barrier(&set->tags_srcu);
-	cleanup_srcu_struct(&set->tags_srcu);
 	if (set->flags & BLK_MQ_F_BLOCKING) {
 		srcu_barrier(set->srcu);
 		cleanup_srcu_struct(set->srcu);
diff --git a/block/blk-mq.h b/block/blk-mq.h
index aa15d31aaae9b..e6b463da50712 100644
--- a/block/blk-mq.h
+++ b/block/blk-mq.h
@@ -178,6 +178,8 @@ struct blk_mq_tags *blk_mq_init_tags(unsigned int nr_tags,
 		unsigned int reserved_tags, unsigned int flags, int node);
 void blk_mq_free_tags(struct blk_mq_tag_set *set, struct blk_mq_tags *tags);
 
+extern struct srcu_struct blk_mq_tags_srcu;
+
 unsigned int blk_mq_get_tag(struct blk_mq_alloc_data *data);
 unsigned long blk_mq_get_tags(struct blk_mq_alloc_data *data, int nr_tags,
 		unsigned int *offset);
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index af878597afb8c..5e130b282b42f 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -525,8 +525,6 @@ enum hctx_type {
  *		   request_queue.tag_set_list.
  * @srcu:	   Use as lock when type of the request queue is blocking
  *		   (BLK_MQ_F_BLOCKING).
- * @tags_srcu:	   SRCU used to defer freeing of tags page_list to prevent
- *		   use-after-free when iterating tags.
  * @update_nr_hwq_lock:
  * 		   Synchronize updating nr_hw_queues with add/del disk &
  * 		   switching elevator.
@@ -551,7 +549,6 @@ struct blk_mq_tag_set {
 	struct mutex		tag_list_lock;
 	struct list_head	tag_list;
 	struct srcu_struct	*srcu;
-	struct srcu_struct	tags_srcu;
 
 	struct rw_semaphore	update_nr_hwq_lock;
 };

-- 
2.43.0


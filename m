Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272DD42BEBA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122367; cv=none; b=FCk7RfqbVrgBDp2UUPhE2awbdjhb5Got4llg6CY2tp8Y+p9b3vACwCvzRtFSsfko3Rv8bQAAdXUHD3QmAVyOE/qL3/u8NgKtBOpZoKE8S/JQ1IwjsSb0daHpEMjEqBkGQYr1VJ9lGkxteC0dMJChK3BFZ5Z8LfLMQIrNzpCCmq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122367; c=relaxed/simple;
	bh=AXS4qHAgHTV5BL/xeHAWPrMzvJoratQYNUkU1MxARUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhixZnjHpoZGJFEkSGVbHlOCS/EQtZfh+rjPZM8xgIv6rimcBdIq99ieFFrXxH2afa8Ok1FsU3jKDL8eUVedjK4wHq0OVemxNxLGk4SqF4ipLTQib1ND/W40/plwJ45N5SNlG9AhZ2fTV9iLy3Fyo3y6yZ3Yvb5JC9Z08ieTw3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJU7lt/k; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJU7lt/k"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so8546285ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789122363; x=1789727163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifO3sasXxMBfgKginCHFmBB2zJHYEMMnSmBmMbp7mX4=;
        b=pJU7lt/k7Wiu544gGDO5YJpwGj6fXl5+epztjm95di4rGjQHfEYAixKkgesaSKuyCA
         kk/XnhH6G++nCnREhPOCsKvo23H4+Rc9PAZzoWNRo/vz0FDqCuLwSAjE5alUyPJEWWIJ
         tJ2FbN5fuUnPRxfOvUcRBzcTuW/5UKuXr6tVshpntGQhnA9qGREKDEf2re857f5m+O7O
         QwwYWqhEEQKy9rjF+qpB5DG4L0INXt6hWScBlwM41ariLwK1uBDWy6lbTOB1AvNhuol4
         Lw618DoyF8GDHwImcdzZQXKD66z1PrbLeg9lxOzM3gb4vb/KdLXlvbmZAjwjErBosquJ
         6LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122363; x=1789727163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifO3sasXxMBfgKginCHFmBB2zJHYEMMnSmBmMbp7mX4=;
        b=SMJW+yu4rRO35ec5iJawmU07puoRbuy9KrRRMPrfKvxrAt+I5mbsUDY5YlZodSR3Js
         OlY1zD1pi1aKYUs3Nsd2iH/URtxzIXeLgLgv/NHd7IYEG2hjhuljdvTXzu2/hYdA4UWY
         Zzk98yEx6GQbciOYebMEOIZofHDgGdMkrJS+kCheyOksF7RcxI0+WXniGBhMZXhdov5/
         PYMSAibdcSf2Ejypes61JueVEEmCFm/6e7YQKx/2GTtMpDG6gPIZb4UDESfakkxw1h/N
         calkmmqAc0IDamIxxirvG/YsLPFHdO0MTmSfqOWO6BdYn9UvTeQbuEL+4pOeD1qb+/2w
         FT0A==
X-Forwarded-Encrypted: i=1; AKwUvBzRWRhM0++gJt1GsCZC/G1VSyEDqZYrlZ8jSrK1yN6pFzOcFEDIpYbZD8mn4xiJvZlzk1zfaFzFVEM1zO8=@vger.kernel.org
X-Gm-Message-State: AFuF++l9W6q180k8nl8hlTzNVUdXCC09nzjcRRArjvbbLNMeDgQAV5Gi
	ToxNlHnPmeLftF8BMKHEiKRxkaQWnfJa9OvjB7SB5qaAtkukJ4dTJS6K
X-Gm-Gg: AYBFou2STDrIJhoUpbn9ebiafRTU4kAfWnB4mbphx7c0pX5CeMjhyVEbGxe5Vo3sP0x
	loDhgOYZEUjtqnx5GEAcCVqpL+b1NS9RPpfW2E7vTzIqfMhsIjqME1EzdxapfrEmKC2trbuW+it
	V/Dm/yP7kwtal1n8rZeCT2HF8e/VN8ensPBHJiCR4bB2ADLrHdUHoFyG6F7nbadYx74TsDTr/wS
	inLuDv7z+RXaf6vqo+4hrzhlDO4OTTDAQh7SvQ2/byUmgHMwgsFb7FV+/XiPasxBKlo6uUiTIOZ
	FGRWm37VVtG1VBoDXaB5jDIdBF2EI/A9fkM7vtDfgixGxEyoSyIf15Y/Sf5VMG05yPiY8Z8WqQh
	pdI1l0stoL+EYVt5cGhfiml1x/UMBrqF98mgNMzIKnqQOzj99FCPKici/+/LFcvQH9J9Erhgqas
	wF0F1XCZs9J+hA038APIymT/6hvdgYIn1lU3LjnO/PUfGojyzJEwx/rds4DEZvYR9XQVlZCdbjC
	CUu
X-Received: by 2002:a17:902:db0e:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd2a34f6e6mr68042715ad.15.1789122362869;
        Fri, 11 Sep 2026 03:26:02 -0700 (PDT)
Received: from Default ([2409:40f4:1034:ff33:e7d7:d190:816c:e597])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm6220095eec.15.2026.09.11.03.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:26:02 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: cem@kernel.org
Cc: dgc@kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>
Subject: [RFC PATCH 1/2] xfs: add lockref and generic helpers for refcounting
Date: Fri, 11 Sep 2026 15:55:01 +0530
Message-ID: <20260911102502.163566-2-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911102502.163566-1-jeffinphilip14@gmail.com>
References: <20260911102502.163566-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of fixing the UAF in xlog_cil_ail_insert() reported by
syzbot, add a generic lockref to xfs_log_item struct and
initialize it in xfs_log_item_init(). In addition, add generic
helpers(get()/put()/get_safe()) as part of the generic refcounting
infrastructure for xfs.

Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 fs/xfs/xfs_log.c   | 38 ++++++++++++++++++++++++++++++++++++++
 fs/xfs/xfs_trans.h |  7 +++++++
 2 files changed, 45 insertions(+)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index f807f8f4f705..1489f8f20b3e 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -1033,12 +1033,50 @@ xfs_log_item_init(
 	item->li_ops = ops;
 	item->li_lv = NULL;
 
+	/*
+	 * Refrain from using lockref_init as BLI refcount should be
+	 * initialized to 0 and lockref_init initializes refcount to 1
+	 */
+	spin_lock_init(&item->li_ref.lock);
+	item->li_ref.count = 0;
 	INIT_LIST_HEAD(&item->li_ail);
 	INIT_LIST_HEAD(&item->li_cil);
 	INIT_LIST_HEAD(&item->li_bio_list);
 	INIT_LIST_HEAD(&item->li_trans);
 }
 
+/*
+ * Only called when the caller knows the object is alive
+ */
+void
+xfs_log_item_get(
+	struct xfs_log_item	*lip)
+{
+	lockref_get(&lip->li_ref);
+}
+
+/*
+ * Drop a log item reference when called. Returns true if last
+ * ref with lock held. Otherwise false.
+ */
+bool
+xfs_log_item_put(
+	struct xfs_log_item	*lip)
+{
+	return lockref_put_or_lock(&lip->li_ref);
+}
+
+/*
+ * Used to lookup if item may be dying. Returns true is the object
+ * is not dead, false otherwise.
+ */
+bool
+xfs_log_item_get_safe(
+	struct xfs_log_item	*lip)
+{
+	return lockref_get_not_dead(&lip->li_ref);
+}
+
 /*
  * Wake up processes waiting for log space after we have moved the log tail.
  */
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index eb83c5dac032..cd469e2e4e4d 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -6,6 +6,8 @@
 #ifndef	__XFS_TRANS_H__
 #define	__XFS_TRANS_H__
 
+#include <linux/lockref.h>
+
 /* kernel only transaction subsystem defines */
 
 struct xlog;
@@ -46,6 +48,8 @@ struct xfs_log_item {
 	struct xfs_log_vec		*li_lv_shadow;	/* standby vector */
 	xfs_csn_t			li_seq;		/* CIL commit seq */
 	uint32_t			li_order_id;	/* CIL commit order */
+
+	struct lockref			li_ref;		/* log item reference */
 };
 
 /*
@@ -110,6 +114,9 @@ xlog_item_is_intent_done(struct xfs_log_item *lip)
 
 void	xfs_log_item_init(struct xfs_mount *mp, struct xfs_log_item *item,
 			  int type, const struct xfs_item_ops *ops);
+void	xfs_log_item_get(struct xfs_log_item *lip);
+bool	xfs_log_item_put(struct xfs_log_item *lip);
+bool	xfs_log_item_get_safe(struct xfs_log_item *lip);
 
 /*
  * Return values for the iop_push() routines.
-- 
2.55.0


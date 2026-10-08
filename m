Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7034221A42D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468855; cv=none; b=JZRiOOuSVTSgVTut5iBW80tXolOe5wyim4g/jt/OtbmtO+Chy60SEumwpwHcC3Tts83sG7syYCithQwgN1TGHZA2Ama8UkKNav5WBUcMJ5I0Uxwy7JTh8gN36baO39YTRiwQhlawyMCG7aalBFESljz/LSfwO5ssB9z25LTQqK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468855; c=relaxed/simple;
	bh=D1eXFAdgJ1oe+I6PKhnkb14j/hJFIlES2LpPawwZIkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5HRZj57nRigv1MxwmAZb7erWc2etBPxEIMwtV8POzAncRHx464Gi0zuwKipwxeWusRZQVxlijPyxCYBI+2gyTGAeSmdkgegwkBXZVvfEslk9aYc4dqzzynNMYku9wU1kKgvDXGMSzQ6UTHmW94MLAaX2nYK//wcF6sQ1kaRuSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=Z7px4Wnq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="Z7px4Wnq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so28486615e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1791468851; x=1792073651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrLj7myEvmL1NDZSoo6YVPO8m4//5te8foqX8lpo05U=;
        b=Z7px4Wnqv8bJYWoBEkv0SqqpZShuLVllq3GQnmQocmnk5k9QUflFkeDEP55DGTWDtr
         K9C7T7dRbh1zlD2b1F6msbv6uSzCfCV3yKxcx8jVad7z8jKwMI45rpTlGefuN8Fd7NB+
         uZY6RoB2c8Ov4kYkNHIp/Tiso9589jvODibzQxbRvvoaso1XtAIGT1B0cUJX/KPM1hyT
         dZ3KIH33iNSaz6rV52SWNd6qqjDqXUJmVdNDZq/UUQ9tDDCui6vEvgocYFi2orV5CZaI
         VBjoT9fX8xB8OWd2hMRJLOaqYuItxoOJN1TPaydV4CQkWC17YGRSOsLu4+38HVdC901s
         2KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468851; x=1792073651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KrLj7myEvmL1NDZSoo6YVPO8m4//5te8foqX8lpo05U=;
        b=cBegs8lErISYqKrigkUlXpbRa0dlWUxzce/qSzCOoRKmRgJWHyX8s6aurZuDQiXx0k
         pVBRlIiYgOOFCP2tzV6ZfXV/O0Zp60l0K7qW3ZMmJ2vIxnBMJrVFrkjPBbQmUEHHyWi9
         EuZxx13Ttcd7Xw/Fufa+zxYC+3o3w1g8mgghY473sYH7LMTbP/nPFdIGQ+JYFLJXZTz8
         NAwpKLYT9SWQEoAkPy7NPFmY0rKZ7bTXKTyw7+zACLz1FVW+/ix7upu6nxaHtcboUcxa
         upwOGoFtSURE0QhNPlpUIdI8nTRtbyE7MoAbs6eMF1+5xvkqeqJAhBNtoifbwJKhf1VQ
         rjwg==
X-Forwarded-Encrypted: i=1; AKwUvBxRx+LZo9np0d6EPF0Z0754tTUK4yu5wbsTQP8JnHASyZ7+mS1HlWHeRgAmNuLyL8d2yDJXSXc1vHTby0I=@vger.kernel.org
X-Gm-Message-State: AFuF++l0aFZvG2H9egEnpYhWAWwfuWz6/DUG5xgFLvc5El8Tc6/8LEeg
	1WdKeEcyEoPoy7vdvjM+9aaZUL9r+urR2GuwQz+QLNA7zhqkN9WSX3YheNXP5SjGYOg=
X-Gm-Gg: AYBFou00RhG1SqARUxhh9u910Zk96RECINVOtX6mPGaLh0hbsBm1cEAsdohwqXDhhPD
	v1iyj1N717g4eUyuszyGAd8LrBWji3sTBKKNDpQYr7OXIlEBEJHta7H1mUFPCjhAAIS0wn85Ggc
	Fh1RTtV7nWjqLsBY2kWIySFNxLulA0mNPalZtGTa/6HpcG8SijPQmOYxrZ1SFpwpUzU33fWJ6yl
	EGS87QM8iiysKbZ++DeCk8DwQPuj3C4hl5piC5rFt7lYv5cHQqSf1tW6NWm04+2Ykaaf3gHccb1
	7m6H5GKv853sA0W512OaGqPHa6UF895N80beaOnOwE+FZKoRXlmycOxfWj6M0HRc9pmS9RCI79m
	n2D188tDm1k667mgnZ3A4RRaWdLJYrJECAAhGCz9GssU1laC+iwqZ8MFWWOkAcp8b1rzxPiYPXY
	1DzpxyI7NVaGKAZtdU6zn9B5Qnt3m1tcdZZjNVw6WVdHD17E0/zd9ZCMW3e6jSYnhw0judk4SRd
	JBBCP/O2l2VnQTszIys9EInhS645U9je26m
X-Received: by 2002:a05:600c:8b6e:b0:4a1:78da:d271 with SMTP id 5b1f17b1804b1-4a18064be59mr101916045e9.30.1791468851533;
        Thu, 08 Oct 2026 07:14:11 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([80.95.100.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a185d914fdsm113358935e9.7.2026.10.08.07.14.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 07:14:11 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	hare@suse.de,
	saravanand@crusoe.ai,
	sjpark@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH v5 1/2] nvme-multipath: fix path state evaluation for failfast and ANA
Date: Thu,  8 Oct 2026 07:14:06 -0700
Message-ID: <20261008141407.22992-2-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008141407.22992-1-kiyer@crusoe.ai>
References: <20261008141407.22992-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvme_available_path() has two problems that keep I/O queued when it
should be failed:

1. When fast_io_fail_tmo expires, NVME_CTRL_FAILFAST_EXPIRED is set and
   the path is skipped, but the function still falls through to
   nvme_mpath_queue_if_no_path(). If delayed_removal_secs is configured
   the I/O is requeued indefinitely, defeating fast_io_fail_tmo. Only
   fall through to queue_if_no_path when there really are no paths;
   if a path exists but its failfast timer has expired, fail instead.

2. A LIVE controller counts as a usable path regardless of the namespace
   ANA state. A path whose ANA state is inaccessible or persistent-loss
   cannot serve I/O, so it should not count as available. ANA change is
   transient and bounded by ANATT, so keep queueing while it resolves.

Also kick the requeue work from nvme_update_ns_ana_state() when a path
does not transition to live, so parked I/O is re-evaluated when an ANA
transition leaves the namespace inaccessible.

Move nvme_state_is_live() above nvme_available_path() so it can be used
there.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
---
 drivers/nvme/host/multipath.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 11871f5f18c2..0d6c05f0808b 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -509,9 +509,15 @@ inline struct nvme_ns *nvme_find_path(struct nvme_ns_head *head)
 	}
 }
 
+static inline bool nvme_state_is_live(enum nvme_ana_state state)
+{
+	return state == NVME_ANA_OPTIMIZED || state == NVME_ANA_NONOPTIMIZED;
+}
+
 static bool nvme_available_path(struct nvme_ns_head *head)
 	__must_hold_shared(&head->srcu)
 {
+	bool failfast = false;
 	struct nvme_ns *ns;
 
 	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags))
@@ -519,10 +525,16 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 
 	list_for_each_entry_srcu(ns, &head->list, siblings,
 				 srcu_read_lock_held(&head->srcu)) {
-		if (test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ns->ctrl->flags))
+		if (test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ns->ctrl->flags)) {
+			failfast = true;
 			continue;
+		}
 		switch (nvme_ctrl_state(ns->ctrl)) {
 		case NVME_CTRL_LIVE:
+			if (!nvme_state_is_live(ns->ana_state) &&
+			    ns->ana_state != NVME_ANA_CHANGE)
+				continue;
+			return true;
 		case NVME_CTRL_RESETTING:
 		case NVME_CTRL_CONNECTING:
 			return true;
@@ -531,6 +543,9 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 		}
 	}
 
+	if (failfast)
+		return false;
+
 	/*
 	 * If "head->delayed_removal_secs" is configured (i.e., non-zero), do
 	 * not immediately fail I/O. Instead, requeue the I/O for the configured
@@ -887,11 +902,6 @@ static int nvme_parse_ana_log(struct nvme_ctrl *ctrl, void *data,
 	return 0;
 }
 
-static inline bool nvme_state_is_live(enum nvme_ana_state state)
-{
-	return state == NVME_ANA_OPTIMIZED || state == NVME_ANA_NONOPTIMIZED;
-}
-
 static void nvme_update_ns_ana_state(struct nvme_ana_group_desc *desc,
 		struct nvme_ns *ns)
 {
@@ -926,8 +936,10 @@ static void nvme_update_ns_ana_state(struct nvme_ana_group_desc *desc,
 		 * is not live but still create the sysfs link to this path from
 		 * head node if head node of the path has already come alive.
 		 */
-		if (test_bit(NVME_NSHEAD_DISK_LIVE, &ns->head->flags))
+		if (test_bit(NVME_NSHEAD_DISK_LIVE, &ns->head->flags)) {
 			nvme_mpath_add_sysfs_link(ns->head);
+			kblockd_schedule_work(&ns->head->requeue_work);
+		}
 	}
 }
 
-- 
2.54.0


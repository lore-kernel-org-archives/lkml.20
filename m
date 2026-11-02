Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634532;
	b=jxyYJMx9caqxNwVm9RCzPmhs/NdFaYb8o7QbVBhcNngPXOXTRFeoUWL9gqvcaSVvSs+I
	 9dxZwHvrGT1yPN4SEScQUPAuOGp0unsu7Y+HQVnvb8mdw1NsS7+Ca8dSW+6FeGBrm+dIr
	 o/dB+/tGpsjXZ/5dNhA3xmqzqVrzXVbz+xkTYto9CZsFNCeUTJdi6rAnztFk2mc/ozkfR
	 6ka38eAy+t5t25Y/E9VbHM3yAXlUFDPMgjwVKPtvVmSduE6Sa9DLtZQkjwjiEsQeGrOZr
	 aaKsMHzIX0iTs7SZOW6+u6N894zyojJEpJoIha9n2D79h+L2al6puvfBIh6xvIvK8MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wsovmGaHf6OijX5AfvsTlFk+cLMkd7U87o19Pl3YYsE=;
	b=kAGyOQdrObriECQaacL7xlNeSgkVW99fSWYgK/euycwZ4mVbfjZ/ubjIxCLQiCRjEceB
	 IQPjgLPLU/Wwxl1PpRcLiQ9gFaj+Rc7iB8t+S6nkiOkE9CvDAowYkwAeQexxH2gZlAHOg
	 o1J51w7/u0/w9wCvxYCYUdYlq9nkkm0QoGh4xf7nAXhrNZiUwsoxACA9q4YV7Vo3Rbflq
	 SOVBPsqgmDYs1xm5ziyGyzNHZxp5hCSVtkAmoDzzXAfHTkph6X6iT44kPLgp9aTiqZS5p
	 P4uVh14IqUR/7fUeBpoETw2vq+DV3kpfsaWoppc7MeO9dUviqyCzDIfoais76/bczpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=R9em9S1L;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3589C60771EA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3589C60771EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=R9em9S1L
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b127f1cc8so313925f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793634530; x=1794239330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsovmGaHf6OijX5AfvsTlFk+cLMkd7U87o19Pl3YYsE=;
        b=R9em9S1Lx1vExMyQA9P0H+QKW3uOx1aVTQ32hg5p4bxuq0esA6CgxBO4QPJWnAmW/z
         bkWGqKQvcmtZCiTBUuSPaIs8PtPHSvP2odEcdEH6Za8yXDtugfUcbcPyCDIBGFiHIemV
         uMBfVIDcIig8P4mNQlX6EqR5ZKaLObvveAkFgi4hGB4m2Ll/cvoK2I9aIyHRFArcgcj0
         ldbSvE6oo49K7AA+jBbYtKCqyAexjVOJOXRAeZJVCu0x93hkBj8RZE8nQDXnrDBFAVQQ
         tnElTuCMYo+bXlhkpNxVyHndqoXwEMGfcdhFUpZlZKCjLTDYm9xt8z1xTh+fhDvdxXNG
         svvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634530; x=1794239330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wsovmGaHf6OijX5AfvsTlFk+cLMkd7U87o19Pl3YYsE=;
        b=mJyqqIdBcDWIkQB5XPtBtrFHuMe+3vxauha3z65EUmpqBvkmpB/ylkIcjeQQ+W9zxO
         t2u3b6TDCYr2y7Gver1U1+YMiwhwQOwSSd8Q630PlNmsM0KvarzleBU6hsCysclp6Xq9
         kr3/tLYOj5E52erf0g5dtzAgj+aTfWzWZosiW/S5GaptkhR0ybungz6/a2Vrzi/gheCQ
         pkQOwoqy45hUedItdPZ29zmSS5TYNYq3vcDoXX2uWhWUv7mrPEorGenWYXGxSToTe7iC
         OA/hfSdWHLgog7tuBbolwwkZl8bOEpA7LipDXFPMDSh9vPYclH3HXn5voai2UFJyOhNs
         Gacw==
X-Forwarded-Encrypted: i=1; AKwUvBzzyglW4wz1RhswgInouj2CfONq5Jr6X1ye3UQG0dhrY/Nv6JpnjjVGQPZlF4fnv2z5GV1u0axVXIfh1II=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oYmeHHOOdCfFv4pAHlb6QN6vMfRLa1Vy+klZcaEKJ9qUfGvbp
	weF1t84+V8wzJHxJLjDbKgsTQaZrkaDYSc7ASQrLZeWSySL0W0fipIV+wjfiHcqLoB7GHQbpvqF
	BurDmZbs=
X-Gm-Gg: AYBFou1AJ6YlPKUpe2Nvi7UxHWXsqKw3qHYw6glI+0BgFoMGH/WmMygoLtw/CCj4CHM
	mwcG52qbPvU5PRhDQO6S9Xde6K+CryWPp+WtTVj3m+0lGJmFCDETU60/GnvbkY9d9ddnPuah6VI
	DhH4PHaNr6cLEZhlnVuLAEcKOLalSyfd/jWW2U9/m9LfdG9/Qryuz/qjKkINHbPss/dGwNNDq1y
	NLf/IHvLNi/qNtqH8DRNot1At8ICFccyBqC+oA1I7Tpau3JFkalX+vU7pOwuewBKWjUZ9j3HdF8
	iVnL10BNjqadgN4As6w8v7t7Nyqsswa3hhQ31IbE2P1K76u3dk7s6XB8eNrIwm6lETMukWDIUdm
	A1PYS5mjkak1YMrWn8+FMYWzFHRkq7+dtrGrG+WGhvZK7EiBAhsQbWchsmWAgO7Dr7Xf/Qatg9I
	MUa80X9KAgTeYAoI1Hys7I+H+nCZdvguuanfi9M97lbbPgkM1P26HjI0aCcpy/dRbllQzEohbGJ
	XyqmftAYQyM8yV+f8dQsi5ZFtPfOwdml8P4LMEGdkq12m3LBKtAZQ3lSpeF7uVP9wI4apK3BTsA
	xAdiQKnBz6mDQrkTwEU+SHhmhnbMsPUQmd+Rep78IQaS8ONKiAJUvR4OBdeYuJwEmC62rIVA6jB
	1yhrjabHJ
X-Received: by 2002:a5d:6612:0:b0:48b:58e:6cb7 with SMTP id ffacd0b85a97d-48e6e4fad98mr16810739f8f.6.1793634530320;
        Mon, 02 Nov 2026 07:48:50 -0800 (PST)
Received: from jwang-ThinkPad-T14-Gen-6.fritz.box ([2001:9e8:1447:4f00:8b7d:ec80:fa70:d638])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm22000850f8f.52.2026.11.02.07.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:48:49 -0800 (PST)
From: Jack Wang <jinpu.wang@ionos.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>,
	linux-raid@vger.kernel.org
Cc: Nilay Shroff <nilay@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Jack Wang <jinpu.wang@cloud.ionos.com>
Subject: [PATCH v3 1/1] md: freeze the queue in mddev_suspend()
Date: Mon,  2 Nov 2026 16:48:47 +0100
Message-ID: <20261102154847.198472-2-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102154847.198472-1-jinpu.wang@ionos.com>
References: <20261102154847.198472-1-jinpu.wang@ionos.com>
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

From: Jack Wang <jinpu.wang@cloud.ionos.com>

queue_attr_store() holds q->limits_lock and waits in
blk_mq_freeze_queue() for q_usage_counter to drain. A bio parked in the
is_suspended() loop of md_handle_request() still holds a reference, so
the freeze never completes. If the suspender waits for reconfig_mutex
held by md_start_sync(), which waits for q->limits_lock, the tasks
deadlock.

Freeze the queue in mddev_suspend() and unfreeze it on resume, so bios
submitted while suspended block in bio_queue_enter() without holding a
reference.

Skip the drain wait when parked bios can only progress after the suspend
completes: writers waiting on the suspend_lo/suspend_hi window and
raid456 IO waiting on an interrupted reshape. dm-raid has no gendisk and
is not frozen.

Fixes: c99f66e4084a ("block: fix queue freeze vs limits lock order in sysfs store methods")
Suggested-by: Yu Kuai <yukuai@fygo.io>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 drivers/md/md.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 03e35386a802..29737a624844 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -472,6 +472,42 @@ static void md_submit_bio(struct bio *bio)
 	md_handle_request(mddev, bio);
 }
 
+/*
+ * Freeze the queue so a concurrent blk_mq_freeze_queue() (e.g. a limits
+ * update) can't wait on a bio parked in md_handle_request() while suspended.
+ * Skip the drain wait when parked bios hold a reference and only progress
+ * after suspend: the suspend_lo/hi window, or an interrupted raid456 reshape.
+ * Resume may run in another task, hence the non_owner variants.
+ */
+static int mddev_freeze_queue(struct mddev *mddev, bool interruptible)
+{
+	struct request_queue *q;
+
+	if (mddev_is_dm(mddev))
+		return 0;
+
+	q = mddev->gendisk->queue;
+	blk_freeze_queue_start_non_owner(q);
+
+	if (READ_ONCE(mddev->suspend_lo) < READ_ONCE(mddev->suspend_hi) ||
+	    (mddev->pers && mddev->pers->prepare_suspend &&
+	     reshape_interrupted(mddev)))
+		return 0;
+
+	if (!interruptible) {
+		blk_mq_freeze_queue_wait(q);
+		return 0;
+	}
+	return wait_event_interruptible(q->mq_freeze_wq,
+			percpu_ref_is_zero(&q->q_usage_counter));
+}
+
+static void mddev_unfreeze_queue(struct mddev *mddev)
+{
+	if (!mddev_is_dm(mddev))
+		blk_mq_unfreeze_queue_non_owner(mddev->gendisk->queue);
+}
+
 /*
  * Make sure no new requests are submitted to the device, and any requests that
  * have been submitted are completely handled.
@@ -500,6 +536,13 @@ int mddev_suspend(struct mddev *mddev, bool interruptible)
 		return 0;
 	}
 
+	err = mddev_freeze_queue(mddev, interruptible);
+	if (err) {
+		mddev_unfreeze_queue(mddev);
+		mutex_unlock(&mddev->suspend_mutex);
+		return err;
+	}
+
 	percpu_ref_kill(&mddev->active_io);
 
 	/*
@@ -520,6 +563,7 @@ int mddev_suspend(struct mddev *mddev, bool interruptible)
 				percpu_ref_is_zero(&mddev->active_io));
 	if (err) {
 		percpu_ref_resurrect(&mddev->active_io);
+		mddev_unfreeze_queue(mddev);
 		mutex_unlock(&mddev->suspend_mutex);
 		return err;
 	}
@@ -555,6 +599,7 @@ static void __mddev_resume(struct mddev *mddev, bool recovery_needed)
 	md_wakeup_thread(mddev->thread);
 	md_wakeup_thread(mddev->sync_thread); /* possibly kick off a reshape */
 
+	mddev_unfreeze_queue(mddev);
 	mutex_unlock(&mddev->suspend_mutex);
 }
 
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316217;
	b=cWI9k5Hc8Pzn3kz7S1D84RF/F/4FtmZ1sdrWNwoL7GSy/jtgX8nmIbUgUUchPNLZZlWz
	 hE8FifFe8lxotsz7nU6PYx6YmX8gtBuP6N8BVs4A/VB2fPeaVZoJqX9ohVaMxCZ/as4+i
	 /DTRWg/sDeptHz8GRRoH/aA1TaJnNxvspx0rAqAcDtqbC0j6Bjqz38Emy0j8Xh4N0DYDa
	 XIvX7/0qivsakAf3EAtc9+tWUM5aer74C1NGfbJvmGC1aAi20IbRAOr+Hn0N7J1Qwt0Q+
	 XTqNtV1yHClSZiI6f+ipMr+xRJsUABteDUIT43AX6c2sjdTutnEPIrhQq00ZOFF7/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316217;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer;
	bh=AIbTsoYJnqU+UBgdfpuuXZyRGQURHVhq0edfk1ZSOcQ=;
	b=DFv6LlrjcsJikzHTb0cGUXk2Jdp+W7/H8UVrUByebgdOrV6zYW4SUsVk9RCyCLTY4OTW
	 /1XIwo5RjW/vDr1b2Xne6GEqdmvd2e1AAwD+03E1dB0shLa5DmRd/BBpKnt8WNaZcjoRM
	 wMf+AkTL9I+OG6cv3QPul684CCGficYdyDqbMpyYrvf51yCYhttHR0v6PKjX34Lyqrda/
	 J1HvF4+bdnUb14L7I2iA/oSt1WytXh4gyvuOiDKj6yAI3plXa9wAWKPfaPQdzalAINmKX
	 nTelTSSwqWQUhI6ngJyMMqg/71gA9zXbREUk7hFL/8iX9BOymLSHVfZO/iVGI8ftjsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KOm6oevF;
	arc=none smtp.remote-ip=95.215.58.29
Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0AC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0AC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KOm6oevF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=952T0Zyn92ruet41jp8SPLUgK+azry6ZsW9QMfdNX5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794316214; v=1; x=1794921014;
 b=KOm6oevFLCrXEjAFtPKOrhiJxEtM/dO39pXPfKjbnhuXVWhfseRNW1E2h/D3akXurVJgeYbx
 uDe/aZ9DyL7cPPAUJV8DHLzMdIkMisH9huX/7P9sJv6s6Ca0hgEQKuOk4ccvnwE6M2cHCi9oXjS
 6eJUdVQYhHl4InYEy3ZXGlyo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 700c77a0a9d00a5e;
	Tue, 10 Nov 2026 13:10:12 +0000
X-Mizu-Trace-ID: 700c77a0a9d00a5e
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Tue, 10 Nov 2026 08:10:06 -0500
Subject: [PATCH] nvme-multipath: don't wait for a grace period in
 nvme_mpath_set_live()
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
Message-Id: <20261110-bug-nvme-mpath-set-live-srcu-v1-1-1f58b405b0f8@linux.dev>
X-B4-Tracking: v=1; b=H4sIAK0X82oC/x3MzQpAQBAA4FfRnE0Z+X8VObAGUyztsCl5d5vjd
 /keUHbCCk30gGMvKrsNoDgCs/R2ZpQxGNIkLYgoweGa0fqNcTv6c0HlE1fxjOrMhWYYq7rIJ8r
 yEkJxOJ7k/vu2e98P3WmhJm4AAAA=
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

When a path goes live, nvme_mpath_set_live() waits for an SRCU grace
period of the namespace head before kicking the requeue work, so that
bios which found no usable path are on the requeue list by the time it
runs.

The ANA work calls nvme_mpath_set_live() for every namespace that
becomes optimized or non-optimized, one after another, so an ANA change
waits for one grace period per namespace.

Start the grace period with start_poll_synchronize_srcu() instead and
have nvme_requeue_work() wait for it only if it has not completed yet.
The grace periods of all namespaces then run in parallel, and requeue
work kicked for other reasons finds the cookie completed and does not
wait.

Flipping an ANA group from inaccessible to optimized ten times over
nvme-tcp loopback, nvme_read_ana_log() takes (median, min-max in
parentheses):

  namespaces  before (ms)    after (ms)   change
         256   51 (32-72)     7 (2.5-12)    -86%
        1024  157 (133-203)  41 (24-65)     -74%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/nvme/host/multipath.c | 14 +++++++++++++-
 drivers/nvme/host/nvme.h      |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index ae8059366b57d..4bc94f165c17d 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -712,6 +712,11 @@ static void nvme_requeue_work(struct work_struct *work)
 		container_of(work, struct nvme_ns_head, requeue_work);
 	struct bio *bio, *next;
 
+	/* Let bios that found no usable path reach the requeue list first. */
+	if (!poll_state_synchronize_srcu(&head->srcu,
+					 READ_ONCE(head->requeue_srcu_cookie)))
+		synchronize_srcu(&head->srcu);
+
 	spin_lock_irq(&head->requeue_lock);
 	next = bio_list_get(&head->requeue_list);
 	spin_unlock_irq(&head->requeue_lock);
@@ -767,6 +772,7 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	mutex_init(&head->lock);
 	spin_lock_init(&head->requeue_lock);
 	INIT_WORK(&head->requeue_work, nvme_requeue_work);
+	head->requeue_srcu_cookie = get_completed_synchronize_srcu();
 	INIT_WORK(&head->partition_scan_work, nvme_partition_scan_work);
 	INIT_DELAYED_WORK(&head->remove_work, nvme_remove_head_work);
 
@@ -851,7 +857,13 @@ static void nvme_mpath_set_live(struct nvme_ns *ns)
 	}
 	mutex_unlock(&head->lock);
 
-	synchronize_srcu(&head->srcu);
+	/*
+	 * Have nvme_requeue_work() wait for the grace period instead of
+	 * blocking here, so that namespaces going live together, e.g. on
+	 * an ANA change, do not wait for one grace period each.
+	 */
+	WRITE_ONCE(head->requeue_srcu_cookie,
+		   start_poll_synchronize_srcu(&head->srcu));
 	nvme_mpath_revalidate_zones(head);
 	kblockd_schedule_work(&head->requeue_work);
 }
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 8833a463f1c84..3fff9b394b1cd 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -587,6 +587,7 @@ struct nvme_ns_head {
 		__guarded_by(&requeue_lock);
 	spinlock_t		requeue_lock;
 	struct work_struct	requeue_work;
+	unsigned long		requeue_srcu_cookie;
 	struct work_struct	partition_scan_work;
 	struct mutex		lock;
 	unsigned long		flags;

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-bug-nvme-mpath-set-live-srcu-cbd8965f1457

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>


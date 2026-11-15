Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708959;
	b=CqtufONn3r0cLz82pY+x3JodhH1S+jhFyZQynGUYGohz/fxXaZIdrAj+LfGw2tITWUVR
	 /91+1RKAKIvgbyGzH51v0Fd3IF3MCNUb9YXI1WmWUKXxOHefU7lFDUS9+O+/GecCGmRKG
	 1ZpnZOe9pOn5CIYQxHV+uLqc3N2L91UP38ccY7AM4u/+VOUK/0DbWnLXCsQdoktgswgR1
	 NMACJbCfgjHmnZHYBIE2BuecPUFq5Y7XcweF6brJtktIgR2AQCHxfZj82rogUDZG9Ircw
	 bIbcnIZYrha8tYt0iQISh6qQXePA35Wbi2wLm2607W/tagH2Bpl8gVYrTvdiqpYrPzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708959;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=VJltXUPdrAUYGcNfM13I3Ga5fxpkMrB1CIsjU6vkSbs=;
	b=cCB7+gl9iPqI+q076PBwrCADNAppaKVkhnJ787Q+LVyZ16Mpp/EVmqzk6LxxOTy+HU6K
	 TwKg/yi7w0RYSuZCPb4xWBS2vlf7FL0mp6rq8F3yfUZ7ns/2hN/mU9I39KNWUckA6SXJW
	 lHdgZ9WVQcCPoxGBWRCWCA1FRjIWxujMnHdYOSMDp+Gn7sPMVZO4s78CXFH3ICLQpgoC6
	 bGMdTOIlFyCvgBwHYWO+8TnCCYnE4LBLGbFb/TQrFJzWoXBhzggnqL36W6zxm61TmzXOl
	 FBsHlhQGZmVKwz2fmmwzAOPcIM0HtleE33+rkzRnwmGFjpjNZ3AjB43ZSdJJB6rblOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KMqD1hFY;
	arc=none smtp.remote-ip=91.218.175.149
Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C5606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KMqD1hFY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/5+r/HD/g8i9i6lCq1OsJLMaJXSX2uHf7C2QNtnqx5M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794708956; v=1; x=1795313756;
 b=KMqD1hFY/4oIZMIgwtCSZO9x362b15c3ylAH9hNNruuW0YPAYVmXLqaorExgMpBGRY0b9U3W
 zBO46wTB0V2CU9yilSqraPjL/iE5Fe7pLHMlran5b3c2v0TdzRA1/RhMBT/1EFgFodcBZ3ksQak
 CI6pT7Ortt+tkSLyoG5CXBFQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 67af2667cba3c565;
	Sun, 15 Nov 2026 02:15:56 +0000
X-Mizu-Trace-ID: 67af2667cba3c565
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sat, 14 Nov 2026 21:15:39 -0500
Subject: [PATCH v3 2/2] nvme-multipath: don't wait for a grace period in
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
Message-Id: <20261114-bug-nvme-mpath-set-live-srcu-v3-2-d84651de6334@linux.dev>
References: <20261114-bug-nvme-mpath-set-live-srcu-v3-0-d84651de6334@linux.dev>
In-Reply-To: <20261114-bug-nvme-mpath-set-live-srcu-v3-0-d84651de6334@linux.dev>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>, Hannes Reinecke <hare@kernel.org>
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
Take the cookie under head->lock, so that concurrent callers store
their cookies in order and the requeue work never sees an older one.
The grace periods of all namespaces then run in parallel, and requeue
work kicked for other reasons finds the cookie completed and does not
wait.

Flipping an ANA group from inaccessible to optimized ten times on each
of two boots over nvme-tcp loopback, nvme_read_ana_log() takes (median,
min-max in parentheses):

  namespaces  before (ms)          after (ms)        change
         256  52.0 (35.4-74.7)     8.7 (2.5-19.6)      -83%
        1024  154.3 (123.9-193.8)  43.1 (18.2-58.3)    -72%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
---
 drivers/nvme/host/multipath.c | 15 ++++++++++++++-
 drivers/nvme/host/nvme.h      |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 35278b9c4de60..971bd14e46803 100644
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
 
@@ -849,9 +855,16 @@ static void nvme_mpath_set_live(struct nvme_ns *ns)
 			__nvme_find_path(head, node);
 		srcu_read_unlock(&head->srcu, srcu_idx);
 	}
+	/*
+	 * Have nvme_requeue_work() wait for the grace period instead of
+	 * blocking here, so that namespaces going live together, e.g. on
+	 * an ANA change, do not wait for one grace period each. Start it
+	 * under head->lock so that the newest cookie is stored last.
+	 */
+	WRITE_ONCE(head->requeue_srcu_cookie,
+		   start_poll_synchronize_srcu(&head->srcu));
 	mutex_unlock(&head->lock);
 
-	synchronize_srcu(&head->srcu);
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

-- 
2.43.0


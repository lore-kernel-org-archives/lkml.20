Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521683E9F9E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550452; cv=none; b=bkeExYvoe9Wq/BQZVMwFK3yBuKUev7KAyK2b+nheBsaXdK656ONBA9tWuAOZwC56FUox5QYy4Bm7wZbDKd2L4/+YpP3w41nJ7ojeA6EnWo6uWiE9Jquve2oOOA4V1GB0UsJ9UNOxRs3JtmJmN3Udiji0Kb+a5eJ8xTtmeVqU8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550452; c=relaxed/simple;
	bh=e9NPQNAAXYJj3KNp+Mrw0GH/m5KXohN0TuJ3luwYyl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6Dl4mHx5DmcpDhLKXg6/KSIrFKoql4f9CuP7dv7pOKaHVeonFt8XjFcEVI/o46JPrdUR5zSXCzHIW01jLtDGqDjjfnW2zW/56LrTz0dnfLFlQQGggWBgY4Xcs4u6tVwsCJQkFaluLjhJOltD3B0CY3zOHyoLJPu+YzCx+GN7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ExVc4Vj8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wtD71ngd; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ExVc4Vj8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wtD71ngd"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 74B921400080;
	Sun, 27 Sep 2026 19:07:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 27 Sep 2026 19:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790550450; x=
	1790636850; bh=HCKSZKFblj8iSAarGW+e5QMXqxcdtKbUP6H18iZNEWs=; b=E
	xVc4Vj8bpNc0YFZIC0poAFetLuUhe8fQdnOcDk2poU3AJHK26FbroWoIwo1NlJz1
	aWDQLu7Ghasudz2vvV38WFTSIKgAFrEAAnBquGL/V6ATI/ezlHKEb4bGaxBborTH
	xjH3dwy5rVYes56guSMs2aA4MufYL4w3aGBSGZ/ToQDVd7ErvKDpPEBdHyrHC0PE
	r+PBB2wncHr7yb7fpHv5b9s8k90wI0ODCgqjGLkOliZzLO5qUY4Ix9v+vosTb250
	dcZgJN5ALvto1HWPeWYvGbXOh2pbprEE0Jxu6hzk1w9iu9IK/lXO+2ICRVUVo1PJ
	f7wgm++Bin7rUwegmvQow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790550450; x=1790636850; bh=H
	CKSZKFblj8iSAarGW+e5QMXqxcdtKbUP6H18iZNEWs=; b=wtD71ngdqmnWWqQBE
	yTuWjFpqoeOyvx/VopunW9Ljq+oemE9YGhHf/7IZxBa3MXgGqFsKHhA+WRIxJpI4
	tDaFHPynzUNj3TmmhVR2NZhTE2rqSn1tEvMVNpgOc3bcOSFSW9jSCUfHyaB0+FZd
	oBDoUtUQi1cty7rF7V3ALLYxVmTsv1RduAcc3Z9zEf5eKCc+3VsEG+UAxtIUPsbF
	MsnGTNtxlHdLx00cHIGb6xLq1PDSsDNUktWt9891alU2K5OMFSFXmMRHhKMdEivw
	fmHbHx9KzQT/77UTkVWmTpLnaGHhMc+nh0vlGJAjO28S19qTGlstgUkbFXOuya4s
	4dcow==
X-ME-Sender: <xms:sqG5aglUkT9ptjogszvCsJHL77k4feHANO8wv1vUm5cu7Oouo_lLtw>
    <xme:sqG5atwmhxCqApwU2gL4E23IYzNR4gyFwLUGqmHSSd6QYwrIkNIlcfJlgj5BC3HaE
    FEwMsvUautMB0au7aFuCgaZtRht7P2dTe5XFfpAmXWurtyHBKRI6_7_>
X-ME-Received: <xmr:sqG5amOxC_uQHfjQUpNEuTZC4-H_3QZSUUUCAm1qAnJjH05boqKJVUkzt1Q-BO7c6j-0tOeJe16tf6Hhe4sM8j2P8K699-9rB0xl4mwpEKm1>
X-ME-Proxy-Cause: dmFkZTG0L7pGOMwThUUE2TF4c1w16xmRNamFalWL0BhmYUnywREWYkkYDKQFv4mf4VRjJL
    2PFE03XHALcvai+0tJySFL+Qo2BufO/3Wx6b0h77OkfE5v4U6HeusRClajG8Vr/chzh+P/
    sng3BoyYK82xK6BbmS1fwwqrHDR90iDK0D7zhYHiSvNbU3KoiS7wBjcp6O8PuTkO13+eVK
    KKRQfK5FMcTA+TQfmNhnaElKF6p7hooxtHuF9E6GsjMnGMKqQ0YZK8kzVR5WUcrhv2yOYz
    ybEMk9rrANwx7k9pEFTaq0mAxIp35ID8lT8QRBxX5WHzyWdS2rAQeMC2+2TRLe3deFsuIq
    siMOu+eXdHeLzgHxo2rGzBeBEUh6wK05sF4Xhk7NKxfvhemRcLQySlb3bFGAQn15dzpKc8
    STsHVUM5Qrm+Nxm88fgOPSVh3DioLHQdzNtIMQQuReBfkFQ3VRS37GSNgiWRDrHZoGEvYX
    Hbi6v1VGUbj1WUOvCSTc48di9N2WIv25hlNPVDnFOFRTi33UmL2VPJTfDanE7NVvUyjBRy
    gQwCifwGif1SkNJl0khoWOIPTbKHbGLnhYVtZ/QPpE5GbW54JblvCwuoEB9OAXVyJ0d4Li
    fSxscDkibtPiI/sV7bLvsv4gOIVwkGi4DwnMavhIrocQwdJvHVfjUdKfs2mQ
X-ME-Proxy: <xmx:sqG5apRkNWQpACNJAP2pI3LCs4kgTKx6uQFbh0KSTQbRU7UkExVdrw>
    <xmx:sqG5asZ9HY91IvcjRi24Jl9GvfBY57Swfv3LyfG4bbMKgvp26FPUaQ>
    <xmx:sqG5au1o6MYDt1Dn2BRtfrU_FuyjBl1RrLVReng7emiTV4-uV3NltQ>
    <xmx:sqG5akWjM_RXkJfik2G0VsHmT4XDOpyi8-DHEgcQJxOfDtDdgSef6g>
    <xmx:sqG5aq5FYT_pLw9CFo1_RDAQyOtK5YPkvJNTLnBYfAR32UmMrz_Eacv6>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 19:07:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firewire: cdev: use mutex for client locking
Date: Mon, 28 Sep 2026 08:07:24 +0900
Message-ID: <20260927230724.119305-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927230724.119305-1-o-takashi@sakamocchi.jp>
References: <20260927230724.119305-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All execution paths in the cdev layer now run in process context.

Use a mutex instead of a spinlock for client-level locking.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 54 ++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index d4c72cd20069..9c204bd7af74 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -54,7 +54,7 @@ struct client {
 	u32 version;
 	struct fw_device *device;
 
-	spinlock_t lock;
+	struct mutex mutex;
 	bool in_shutdown;
 	struct xarray resource_xa;
 	struct list_head event_list;
@@ -315,7 +315,7 @@ static int fw_device_op_open(struct inode *inode, struct file *file)
 	}
 
 	client->device = device;
-	spin_lock_init(&client->lock);
+	mutex_init(&client->mutex);
 	xa_init_flags(&client->resource_xa, XA_FLAGS_ALLOC1 | XA_FLAGS_LOCK_BH);
 	INIT_LIST_HEAD(&client->event_list);
 	init_waitqueue_head(&client->wait);
@@ -338,7 +338,7 @@ static void queue_event(struct client *client, struct event *event,
 	event->v[1].data = data1;
 	event->v[1].size = size1;
 
-	scoped_guard(spinlock_irqsave, &client->lock) {
+	scoped_guard(mutex, &client->mutex) {
 		if (client->in_shutdown) {
 			kfree(event);
 		} else {
@@ -355,25 +355,31 @@ static ssize_t dequeue_event(struct client *client, char __user *buffer, size_t
 
 	// After the following block, the event pointer above is guaranteed to have a correct value.
 	{
-		spin_lock_irq(&client->lock);
+		mutex_lock(&client->mutex);
 
-		int ret = wait_event_interruptible_lock_irq(client->wait,
+		// This could be replaced with wait_var_event_any_lock() if poll_wait() alternative
+		// would be introduced.
+		int ret = ___wait_event(client->wait,
 			!list_empty(&client->event_list) || fw_device_is_shutdown(client->device),
-			client->lock);
+			TASK_INTERRUPTIBLE, 0, 0,
+			mutex_unlock(&client->mutex);
+			schedule();
+			mutex_lock(&client->mutex)
+		);
 		if (ret < 0) {
-			spin_unlock_irq(&client->lock);
+			mutex_unlock(&client->mutex);
 			return ret;
 		}
 
 		if (fw_device_is_shutdown(client->device)) {
-			spin_unlock_irq(&client->lock);
+			mutex_unlock(&client->mutex);
 			return -ENODEV;
 		}
 
 		event = list_first_entry(&client->event_list, struct event, link);
 		list_del(&event->link);
 
-		spin_unlock_irq(&client->lock);
+		mutex_unlock(&client->mutex);
 	}
 
 	ssize_t ret = 0;
@@ -451,11 +457,11 @@ static void queue_bus_reset_event(struct client *client)
 	queue_event(client, &e->event,
 		    &e->reset, sizeof(e->reset), NULL, 0);
 
-	guard(spinlock_irq)(&client->lock);
-
-	xa_for_each(&client->resource_xa, index, resource) {
-		if (is_iso_resource_auto(resource))
-			schedule_iso_resource_auto(to_iso_resource_auto(resource), 0);
+	scoped_guard(mutex, &client->mutex) {
+		xa_for_each(&client->resource_xa, index, resource) {
+			if (is_iso_resource_auto(resource))
+				schedule_iso_resource_auto(to_iso_resource_auto(resource), 0);
+		}
 	}
 }
 
@@ -546,7 +552,7 @@ static int ioctl_get_info(struct client *client, union ioctl_arg *arg)
 static int add_client_resource(struct client *client, struct client_resource *resource,
 			       client_resource_release_fn_t release)
 {
-	scoped_guard(spinlock_irqsave, &client->lock) {
+	scoped_guard(mutex, &client->mutex) {
 		u32 index;
 		int ret;
 
@@ -572,7 +578,7 @@ static int release_client_resource(struct client *client, u32 handle,
 	unsigned long index = handle;
 	struct client_resource *resource;
 
-	scoped_guard(spinlock_irq, &client->lock) {
+	scoped_guard(mutex, &client->mutex) {
 		if (client->in_shutdown)
 			return -EINVAL;
 
@@ -605,7 +611,7 @@ static void complete_transaction(struct fw_card *card, int rcode, u32 request_ts
 	struct client *client = e->client;
 	unsigned long index = e->r.resource.handle;
 
-	scoped_guard(spinlock_irqsave, &client->lock) {
+	scoped_guard(mutex, &client->mutex) {
 		xa_erase(&client->resource_xa, index);
 		if (client->in_shutdown)
 			wake_up(&client->tx_flush_wait);
@@ -1387,7 +1393,7 @@ static void iso_resource_auto_work(struct work_struct *work)
 		if (!success) {
 			// Allocation or reallocation failure?  Pull this resource out of the
 			// xarray and prepare for deletion, unless the client is shutting down.
-			scoped_guard(spinlock_irq,  &client->lock) {
+			scoped_guard(mutex,  &client->mutex) {
 				if (!client->in_shutdown && xa_erase(&client->resource_xa, index)) {
 					// For the incrementation by add_client_resource().
 					client_put(client);
@@ -1907,11 +1913,11 @@ static bool has_outbound_transactions(struct client *client)
 	struct client_resource *resource;
 	unsigned long index;
 
-	guard(spinlock_irq)(&client->lock);
-
-	xa_for_each(&client->resource_xa, index, resource) {
-		if (is_outbound_transaction_resource(resource))
-			return true;
+	scoped_guard(mutex, &client->mutex) {
+		xa_for_each(&client->resource_xa, index, resource) {
+			if (is_outbound_transaction_resource(resource))
+				return true;
+		}
 	}
 
 	return false;
@@ -1938,7 +1944,7 @@ static int fw_device_op_release(struct inode *inode, struct file *file)
 		fw_iso_buffer_destroy(&client->buffer, client->device->card);
 
 	// Freeze client->resource_xa and client->event_list.
-	scoped_guard(spinlock_irq, &client->lock)
+	scoped_guard(mutex, &client->mutex)
 		client->in_shutdown = true;
 
 	wait_event(client->tx_flush_wait, !has_outbound_transactions(client));
-- 
2.53.0


Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B43F412C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400125; cv=none; b=IHpOFB7rPFnla8Q2VgXYCxdm5f+zk+Avu9zUGu9GsA5YDOHV3s4qcagQX90I+hl7pE2I+lhXfHphs4msS0FI4XF8Rpesqwxu3L7dP0sUaPqTNfP6+TPagtBnTFLrZj4zqV8npif+QmBwc/RP8ykMc9vLjzgsQ0FAOTqhmx9O6es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400125; c=relaxed/simple;
	bh=Jl88JzMVDGQ3u0FqP8hSdUpV7yCEtV0qSkrCY2PRJFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLmGqz1IFBBCoJawnCB7srQfkfH3yAeV+MAXIZJ1ZNWYkKB91j69FijD4GFURFHMZ0CrlbgEv3AqZspWf6AYYyHQiCdPLKZIULnWj2k3poyB1VikhNr6ELKkX1gwyqjCt90QjOeP2jJuIblKr3jPDX1dYJsIUPLkE+fONrBcnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgbmnkxC; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgbmnkxC"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7c6e6822b11so1271220137.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400123; x=1792004923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+Umt9q76NU7OtTl9ZNkHnaCnO3fRYRE8w6o3lytJ6Q=;
        b=FgbmnkxCYIfqtdr8AGa1V5PIDwSrGCiNAkGUnxkpxnRC3N+qA+wV3+7qrWMNRd5YZv
         Duer94ToPBfD1nHpeGwGqr33qkol5WxW8LwhrHx6OuTU0+rAXegwwZJNVullBivef+2P
         UHoKkbvYDDUZTKWc8c2d0J71nvA3p8FV2AHBAvHYCSfMdcIx4CLAPNLJBL3Puaw4JDnl
         472wpAye4mZGlxJG689zDPoz+H9A9tV/ajULlI8Zsc0kekbqX033onGOpvzonXNwzrSv
         9P919Ey9yKrM1kD3AIHsNHitC/FpzIa2TCYyL/r9KpQqM760iPMfHiYPoDh486F4jP97
         vGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400123; x=1792004923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+Umt9q76NU7OtTl9ZNkHnaCnO3fRYRE8w6o3lytJ6Q=;
        b=AtW25HNS6OMALK0ekljtKRmjcvUjJp6LfeD8lDFPEAjLae/nB2S22+vEpzn4bhRAK9
         3YvtYpL3EofMv2NqbsY9nrJaTxsijp63hhhRh4EMnJlxEH+G6ktViBT/1VXy4mSmFPCi
         qCk4jDkEr5zIkTZhGxQC/8gvBzykQ6sxljGCmsAqn5hqLWIgSzhTm55l6pyl/ibzWLdu
         6FwL4/vV5bD8MItGhZ+sccWLsQ6MYT4Q5Wir/kzr46B/NuneQW6A/ANsFhoD1mqtzQTs
         AUdsDuDZmttfz5LjX8lmCtTzU/wpWp8RBl0pFnR4xX6lhlRJ3zo1AGOb77Jug+UzSc/e
         ypYA==
X-Forwarded-Encrypted: i=1; AKwUvBwiDUWIM/KXeWbjfUyZGTKW7N3HxbvdlhN3xRPnfJk5F8KF8sgO+T7DufLlqc0o22SrX7uCn/MmBK9Hmbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGAp+veC3tI3FGdS01cFtNNxkVbDyYuTQ59rb82QpCA718osDr
	yPKUNDOLbq/nlXHRAPYUQuRWMdkpP731xW/+fC+QrbZF0u7iQCyiheWJ
X-Gm-Gg: AYBFou3wHowxO43BsiD65erzHypbG/yjXovrFHVZ+7C/hV1R4TQEt+0CdxwIC25UrBz
	Q69cBiecvvLsckqte7BX//ntDWhh1s19IqAm5RwUpqhZRb/v/CiP0x/k9HEVfeW6hVDAFamcprX
	cRtjPkyL4oa4jBdBWa8yPYWPSeLTa0ZhKXaGb1ajdOZNy7zdg2HHUF4MSvWVpuQIGb9y0GSxz84
	9z1TwmVyfntqwxNjU/SN3EwlBuNJ7jMirJhqdZ4OS42pRB5uz9mQkmy2xNho4fk6PU65i32PO21
	JOkt7Fkn4rzzn8Yd7Tf8/Z5spQMtBTfd/K3WKidaJR8RznTaC5UpjaZI8Rv/sKlMwqYAX/XEThH
	8vjXIrJ4DMBSg6rFqhTUESESwwT6inlaIgT4P/HGHK4DXWwQD+YVOilntMmyKe+n00+NMVVChqs
	Y8OW1jn6xXvvxxtn6xFY7AZIWAY+Jh/mFyVT6kOkkjA6J6+V/AaD3c42onfuedTESSuroRt3Kjv
	63zNcBmzM2UtFuE8l4=
X-Received: by 2002:a05:6102:6c7:b0:7b4:740b:9b6 with SMTP id ada2fe7eead31-7ca38e0ba48mr746592137.26.1791400123274;
        Wed, 07 Oct 2026 12:08:43 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([74.244.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ca218138c6sm2456787137.12.2026.10.07.12.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:08:42 -0700 (PDT)
From: Emerson Busson <emersonbusson@gmail.com>
To: mhklinux@outlook.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 07/14] hv: vmbus: distinguish host rescind from local channel unload
Date: Wed,  7 Oct 2026 16:07:45 -0300
Message-ID: <20261007190752.336426-8-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007190752.336426-1-emersonbusson@gmail.com>
References: <20261007190752.336426-1-emersonbusson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A channel can go away because the host revoked the offer, or because
the guest is tearing the channel down itself. Both paths arrive at
vmbus_onoffer_rescind() and set channel->rescind, so a later buffer
consumer cannot tell whether the host has already taken the pages
back or whether the guest still owns them and is about to free them.

Carry the origin through the message layer. vmbus_onmessage() takes a
host_generated flag: the DPC work item sets it for host messages and
vmbus_force_channel_rescinded() clears it for the local unload path.
A small table adapter keeps the dispatch signature unchanged, while
the rescind handler itself records the origin in
channel->rescind_from_host next to the existing rescind flag. Both
flags are cleared when a channel is set up.

The disconnected message path frees its work context instead of
returning without a kfree(); it now owns that allocation from the
moment container_of() runs.

Nothing reads rescind_from_host yet. The buffer-ownership rework
lands in the next patch and is what consumes the flag.

Signed-off-by: Emerson Busson <emersonbusson@gmail.com>
---
 drivers/hv/channel_mgmt.c | 31 +++++++++++++++++++++++++------
 drivers/hv/vmbus_drv.c    | 13 ++++++++-----
 include/linux/hyperv.h    |  4 +++-
 3 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index a044fd3b3c4e..93fc105cd179 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -170,14 +170,17 @@ static const struct {
  * The rescinded channel may be blocked waiting for a response from the host;
  * take care of that.
  */
-static void vmbus_rescind_cleanup(struct vmbus_channel *channel)
+static void vmbus_rescind_cleanup(struct vmbus_channel *channel,
+				  bool host_generated)
 {
 	struct vmbus_channel_msginfo *msginfo;
 	unsigned long flags;
 
 
 	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
-	channel->rescind = true;
+	if (host_generated)
+		WRITE_ONCE(channel->rescind_from_host, true);
+	WRITE_ONCE(channel->rescind, true);
 	list_for_each_entry(msginfo, &vmbus_connection.chn_msg_list,
 				msglistentry) {
 
@@ -955,6 +958,9 @@ EXPORT_SYMBOL_GPL(vmbus_initiate_unload);
 static void vmbus_setup_channel_state(struct vmbus_channel *channel,
 				      struct vmbus_channel_offer_channel *offer)
 {
+	WRITE_ONCE(channel->rescind, false);
+	WRITE_ONCE(channel->rescind_from_host, false);
+
 	/*
 	 * Setup state for signalling the host.
 	 */
@@ -1159,7 +1165,8 @@ static void check_ready_for_suspend_event(void)
  *
  * We queue a work item to process this offer synchronously
  */
-static void vmbus_onoffer_rescind(struct vmbus_channel_message_header *hdr)
+static void vmbus_onoffer_rescind(struct vmbus_channel_message_header *hdr,
+				  bool host_generated)
 {
 	struct vmbus_channel_rescind_offer *rescind;
 	struct vmbus_channel *channel;
@@ -1238,7 +1245,7 @@ static void vmbus_onoffer_rescind(struct vmbus_channel_message_header *hdr)
 	/*
 	 * Now wait for offer handling to complete.
 	 */
-	vmbus_rescind_cleanup(channel);
+	vmbus_rescind_cleanup(channel, host_generated);
 	while (READ_ONCE(channel->probe_done) == false) {
 		/*
 		 * We wait here until any channel offer is currently
@@ -1555,12 +1562,18 @@ static void vmbus_onversion_response(
 }
 
 /* Channel message dispatch table */
+static void
+vmbus_onoffer_rescind_from_table(struct vmbus_channel_message_header *hdr)
+{
+	vmbus_onoffer_rescind(hdr, true);
+}
+
 const struct vmbus_channel_message_table_entry
 channel_message_table[CHANNELMSG_COUNT] = {
 	{ CHANNELMSG_INVALID,			0, NULL, 0},
 	{ CHANNELMSG_OFFERCHANNEL,		0, vmbus_onoffer,
 		sizeof(struct vmbus_channel_offer_channel)},
-	{ CHANNELMSG_RESCIND_CHANNELOFFER,	0, vmbus_onoffer_rescind,
+	{ CHANNELMSG_RESCIND_CHANNELOFFER,	0, vmbus_onoffer_rescind_from_table,
 		sizeof(struct vmbus_channel_rescind_offer) },
 	{ CHANNELMSG_REQUESTOFFERS,		0, NULL, 0},
 	{ CHANNELMSG_ALLOFFERS_DELIVERED,	1, vmbus_onoffers_delivered, 0},
@@ -1596,7 +1609,8 @@ channel_message_table[CHANNELMSG_COUNT] = {
  *
  * This is invoked in the vmbus worker thread context.
  */
-void vmbus_onmessage(struct vmbus_channel_message_header *hdr)
+void vmbus_onmessage(struct vmbus_channel_message_header *hdr,
+		     bool host_generated)
 {
 	trace_vmbus_on_message(hdr);
 
@@ -1604,6 +1618,11 @@ void vmbus_onmessage(struct vmbus_channel_message_header *hdr)
 	 * vmbus_on_msg_dpc() makes sure the hdr->msgtype here can not go
 	 * out of bound and the message_handler pointer can not be NULL.
 	 */
+	if (hdr->msgtype == CHANNELMSG_RESCIND_CHANNELOFFER) {
+		vmbus_onoffer_rescind(hdr, host_generated);
+		return;
+	}
+
 	channel_message_table[hdr->msgtype].message_handler(hdr);
 }
 
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 5ebdbe24b5a1..723252f1b551 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1022,6 +1022,7 @@ static const struct bus_type  hv_bus = {
 
 struct onmessage_work_context {
 	struct work_struct work;
+	bool host_generated;
 	struct {
 		struct hv_message_header header;
 		u8 payload[];
@@ -1032,14 +1033,14 @@ static void vmbus_onmessage_work(struct work_struct *work)
 {
 	struct onmessage_work_context *ctx;
 
+	ctx = container_of(work, struct onmessage_work_context, work);
 	/* Do not process messages if we're in DISCONNECTED state */
-	if (vmbus_connection.conn_state == DISCONNECTED)
+	if (vmbus_connection.conn_state == DISCONNECTED) {
+		kfree(ctx);
 		return;
-
-	ctx = container_of(work, struct onmessage_work_context,
-			   work);
+	}
 	vmbus_onmessage((struct vmbus_channel_message_header *)
-			&ctx->msg.payload);
+			&ctx->msg.payload, ctx->host_generated);
 	kfree(ctx);
 }
 
@@ -1109,6 +1110,7 @@ static void __vmbus_on_msg_dpc(void *message_page_addr)
 			return;
 
 		INIT_WORK(&ctx->work, vmbus_onmessage_work);
+		ctx->host_generated = true;
 		ctx->msg.header = msg_copy.header;
 		memcpy(&ctx->msg.payload, msg_copy.u.payload, payload_size);
 
@@ -1222,6 +1224,7 @@ static void vmbus_force_channel_rescinded(struct vmbus_channel *channel)
 	rescind->child_relid = channel->offermsg.child_relid;
 
 	INIT_WORK(&ctx->work, vmbus_onmessage_work);
+	ctx->host_generated = false;
 
 	queue_work(vmbus_connection.work_queue, &ctx->work);
 }
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 2878aed14c45..096054fa07a3 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -809,6 +809,7 @@ struct vmbus_channel {
 	u8 monitor_bit;
 
 	bool rescind; /* got rescind msg */
+	bool rescind_from_host; /* host revocation, not local channel removal */
 	bool rescind_ref; /* got rescind msg, got channel reference */
 	struct completion rescind_event;
 
@@ -1117,7 +1118,8 @@ static inline void set_channel_pending_send_size(struct vmbus_channel *c,
 	c->outbound.ring_buffer->pending_send_sz = size;
 }
 
-void vmbus_onmessage(struct vmbus_channel_message_header *hdr);
+void vmbus_onmessage(struct vmbus_channel_message_header *hdr,
+		     bool host_generated);
 
 int vmbus_request_offers(void);
 
-- 
2.43.0


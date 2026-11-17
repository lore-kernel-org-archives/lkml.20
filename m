Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927353;
	b=cq3zFvHgFyF/XRe4SpNzOYv5ZKv9VyzI3Jn5dBkSwgYX6oGXtskK4QMahjL2mBZq7nPV
	 Y+MB3yDjhe83TRV6Mw/ER7DyQnAYAdb/YQQsElIc5S+VhFsfXHPEaSw2eEBOpmjxe1IEJ
	 f0Z3JV93lemC9T/tydKQhRIyZLTgP0tKtBpUFwJkzkS2N3tceliwwRbjaAfTHohGO2Kam
	 UCXWruhG8Wd1QHvrkxFe9r4SAE/zW7s55L1+m//esztGjcD2TcJZSKuuvvGKthDN0b3lL
	 BeDyzuEsfnLr8DAeMtgxNacZxEyfHz/rUoeL/RaVmH1VfDMxY+VYNoSTuA+bxTqZyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=f291SqQ6q+076z3UtQOZ+jJ9ozrVepELzwf6z3mqRLM=;
	b=KNYWV9AUP3I5KpAfk0aS+TQUhsdwr1W2lAKBuKYNeSGqGBdTtWIW3FrFag919AI8fm/t
	 vtlxRE+7OTiNkZSVWMqKzpNg7eyIFn5WDJ5HvpA5GiIy3VWosyjGbUozvos+BqZnd8Y7+
	 RGhYNBKTEkogcxCZdmkQtnC+yd3sLIlqzC7DlBoMtE1J+Mu1h5qzy2TyzN/dxyCFeaLW0
	 rHl4KY5GPGYyqFaxfgVZdsXSrt0Bses4MEgJed7Q82s10bFY6QRAX/KHE4YYQVGfjopvy
	 h02XRF0AyYSn6UQFH4j/UA7H+LGDGn0l7TBsJQ1DkcWFZspl2NXSXPHMeDGNEodwJsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LDYvtpgu;
	arc=none smtp.remote-ip=74.125.224.71
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA325606B6FC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA325606B6FC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LDYvtpgu
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dae919cb1so1294369d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927352; x=1795532152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f291SqQ6q+076z3UtQOZ+jJ9ozrVepELzwf6z3mqRLM=;
        b=LDYvtpguKcqzYPQYmujypqVVvl9CRiyruFsl5xDYi47JQOyAKOCQ0Z8QTE/TwniR0G
         l7gZt/xa4bbBtfhybGccUUJN6JNQf0g8pZNJ+0rQO28NgzfYNHjsnerPrmpsk7z0GHh4
         kvneGERwrRVImR1OBym/yaJN8BaDdmsBSYlXgTe+8qiL97/rNgSJxwxG0YsE8HeF4Emn
         NTsB1AOdUQL75UsR9z7+nh7JbHXojBRcvJX7Xl5xTUYGcmchLHLwZ9YX0aKjt+HB9rkO
         vU0KeMcT5FCDLUvi52BLm4TsUXODXdEuHt3u7H/1iOWkubYX52+0TjIyx5IkXaSevq0H
         zQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927352; x=1795532152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f291SqQ6q+076z3UtQOZ+jJ9ozrVepELzwf6z3mqRLM=;
        b=ie0GHHZCNLoi1tHm7uSFyPrX2ntC4eyBekqKUFU2RaWJC3l0xRzEwemCN5lRFHqZ77
         Z2iXJVIIDk0+4FDPwh/vYkhPGf+RW+3/UcW3FS9NHH2RIwfPv0pl4ZsVCxw3XIo9S7n6
         viFJg9fDQZAM/wyHXX0HvCgZCFSiEVtGWCoQjk1e6OQ2j8f27bvNXbYUo+7UeeP79zQW
         EbmRhMn8GqxYAXHWHtJJ8uiSQJgHOi/NaHJfGXiHLoLbnGs+6u1fK3uvoqO0aj9JGHTu
         VVwSIxKbfWaMgIQBhy9DqLx33SFlc6cL8KMMEJbqiR8UYgQJsMAjBvFnJu4KOoCYy2lw
         dF6A==
X-Forwarded-Encrypted: i=1; AL+hErED1/ujrqI1tUN6F/szEKOMguWiG2kHl54xLt63vPNUjg5bLcx+ByDk2jOBnhQGLQwvmpXdw7Nth//w3ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iLRpPSCOgznC78N0NzOtQ3uS6OuKZITAHAol0hAWeu2Az5m17
	jMSNRKxVWsn2DaVQQl6rtGP2vow1ENfB8GOpOZJsbMMrhnGljzhfLR4xyHpYt6JX9+OgOSisf1M
	/Ag==
X-Received: from yxqr13.prod.google.com ([2002:a53:a94d:0:b0:67b:ebbb:a796])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690e:47a0:20b0:67b:f56b:4a4f
 with SMTP id 956f58d0204a3-67dc772ee10mr1043899d50.26.1794927351439; Tue, 17
 Nov 2026 06:55:51 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:20 +0000
In-Reply-To: <20261117145522.1910636-1-stani@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117145522.1910636-1-stani@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117145522.1910636-15-stani@google.com>
Subject: [PATCH iwl-next 14/15] idpf: psp: add support for psp tx key insertion
From: Stan Iliev <stani@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Decotigny <decot@google.com>, Madhu Chittim <madhu.chittim@intel.com>, 
	Emil Tantilov <emil.s.tantilov@intel.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>, 
	Brian Vazquez <brianvv@google.com>, Li Li <boolli@google.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add support for inserting TX keys into the SADB:
- Introduce struct virtchnl2_insert_psp_key and
  struct virtchnl2_psp_insert_keys_request.
- Add the insert queue, a list of the TX keys to insert with their SPI
  and key.
- Implement idpf_send_insert_psp_keys(), called from the PSP work,
  which inserts up to IDPF_PSP_INSERT_KEYS_MAX (101) queued TX keys
  with one asynchronous request. A request that couldn't be sent puts
  its keys back in the queue, they are sent again after a delay.
- Implement its response callback idpf_psp_insert_keys_cb(): the CP
  inserts the keys in request order and stops at the first failure,
  the keys without a valid SA index in the reply are failed. The
  callback queues the work again for the next request, so the work
  never waits for a reply.
- The keys are wiped once the request completed, the request buffer is
  freed with kfree_sensitive() by idpf_send_mb_msg_kfree().

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_psp.c    |  13 ++
 .../net/ethernet/intel/idpf/idpf_psp_def.h    |  12 +-
 .../ethernet/intel/idpf/idpf_psp_virtchnl.c   | 190 ++++++++++++++++++
 .../ethernet/intel/idpf/idpf_psp_virtchnl.h   |   1 +
 .../intel/idpf/idpf_psp_virtchnl_def.h        |   4 +
 include/linux/net/intel/virtchnl2.h           |  35 ++++
 6 files changed, 254 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.c b/drivers/net/ethernet/intel/idpf/idpf_psp.c
index 373edbef9a7e..95926ac99777 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.c
@@ -66,6 +66,7 @@ static void idpf_psp_work(struct work_struct *work)
 	    test_bit(IDPF_REMOVE_IN_PROG, adapter->flags))
 		return;
 
+	idpf_send_insert_psp_keys(adapter);
 	if (idpf_send_delete_psp_keys(adapter))
 		idpf_queue_psp_work(adapter);
 }
@@ -208,6 +209,7 @@ void idpf_psp_init(struct idpf_adapter *adapter)
 		INIT_DELAYED_WORK(&psp->work, idpf_psp_work);
 		spin_lock_init(&psp->insert_lock);
 		timer_setup(&psp->insert_timer, idpf_psp_insert_timeout, 0);
+		INIT_LIST_HEAD(&psp->ins_list);
 		psp->initialized = true;
 	}
 
@@ -266,6 +268,8 @@ void idpf_psp_quiesce(struct idpf_adapter *adapter)
 	spin_lock_bh(&psp->insert_lock);
 	req = psp->insert_req;
 	psp->insert_req = NULL;
+	list_splice_init(&psp->ins_list, &keys);
+	WRITE_ONCE(psp->ins_queued, 0);
 	spin_unlock_bh(&psp->insert_lock);
 
 	if (req) {
@@ -276,6 +280,12 @@ void idpf_psp_quiesce(struct idpf_adapter *adapter)
 		kfree(req);
 	}
 
+	list_for_each_entry_safe(key, tmp, &keys, ins_node) {
+		list_del_init(&key->ins_node);
+		idpf_psp_tx_key_failed(adapter, key);
+		idpf_psp_tx_key_put(key);
+	}
+
 	spin_lock_bh(&psp->del_lock);
 	list_splice_init(&psp->del_list, &keys);
 	spin_unlock_bh(&psp->del_lock);
@@ -322,6 +332,7 @@ struct idpf_psp_tx_key *idpf_psp_tx_key_alloc(void)
 	key->idx = IDPF_PSP_IDX_IN_PROG;
 	key->hw_idx = IDPF_PSP_IDX_NONE;
 	INIT_LIST_HEAD(&key->del_node);
+	INIT_LIST_HEAD(&key->ins_node);
 
 	return key;
 }
@@ -335,6 +346,8 @@ static void idpf_psp_tx_key_free(struct kref *ref)
 	struct idpf_psp_tx_key *key = container_of(ref, struct idpf_psp_tx_key,
 						   ref);
 
+	/* In case the key was never copied into an insert request */
+	memzero_explicit(key->key, sizeof(key->key));
 	/* The TX path may still read the SA index of the key */
 	kfree_rcu(key, rcu);
 }
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
index 4c42755615cb..5af3347d9596 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
@@ -39,6 +39,9 @@
  * @idx: SA index the TX path uses, or IDPF_PSP_IDX_IN_PROG,
  *	 IDPF_PSP_IDX_ERROR or IDPF_PSP_IDX_DELETED. Read without @lock.
  * @hw_idx: SA index of the key in the SADB, IDPF_PSP_IDX_NONE if it has none
+ * @spi: SPI of the key
+ * @key: the key, wiped once copied into the insert request
+ * @ins_node: entry in the insert queue, see idpf_psp_queue_insert()
  * @del_node: entry in the delete queue, see idpf_psp_queue_delete()
  * @del_single: delete @hw_idx in a request of its own, after a request that
  *		failed
@@ -49,6 +52,9 @@ struct idpf_psp_tx_key {
 	spinlock_t lock;		/* protects the SA indexes and tx_queue */
 	u32 idx;
 	u32 hw_idx;
+	__be32 spi;
+	u8 key[VIRTCHNL2_PSP_KEY_SIZE_V0];
+	struct list_head ins_node;
 	struct list_head del_node;
 	bool del_single;
 	struct rcu_head rcu;
@@ -122,10 +128,12 @@ struct idpf_psp_rx_gen {
  * @del_list: TX keys whose SA index is queued for deletion
  * @wq: workqueue of @work
  * @work: sends the insertion and deletion requests
- * @insert_lock: protects @insert_req
+ * @insert_lock: protects @insert_req, @ins_list and @ins_queued
  * @insert_req: the VIRTCHNL2_OP_PSP_INSERT_KEYS request in flight, if any
  * @insert_timer: makes the mailbox task time out a lost insert request,
  *		  see idpf_psp_insert_timeout()
+ * @ins_list: TX keys queued for insertion
+ * @ins_queued: number of keys in @ins_list
  * @keys_allocated: RX keys allocated
  * @keys_inserted: TX keys inserted into the SADB
  * @insert_errors: TX keys whose insertion failed
@@ -162,6 +170,8 @@ struct idpf_adapter_psp {
 	spinlock_t insert_lock;		/* protects the insertions */
 	struct idpf_psp_insert_req *insert_req;
 	struct timer_list insert_timer;
+	struct list_head ins_list;
+	u32 ins_queued;
 	atomic_t keys_allocated;
 	atomic_t keys_inserted;
 	atomic_t insert_errors;
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
index e813dca8961d..480b56ce8164 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
@@ -559,6 +559,79 @@ bool idpf_send_delete_psp_keys(struct idpf_adapter *adapter)
 	return false;
 }
 
+/**
+ * idpf_psp_insert_keys_cb - VIRTCHNL2_OP_PSP_INSERT_KEYS response callback
+ * @ctx: struct idpf_psp_insert_req of the request
+ * @buff: reply, NULL if the request timed out
+ * @status: 0 on success, -EFAULT if the CP failed the request, -ETIMEDOUT if
+ *	    the request timed out
+ *
+ * libie calls the response callback once per request that was sent, except on
+ * shutdown, see idpf_psp_quiesce(). It is called from the mailbox task with the
+ * transaction locked, it must not sleep. The CP inserts the keys in request
+ * order and stops at the first failure: the keys without an SA index in the
+ * reply failed.
+ */
+static void idpf_psp_insert_keys_cb(void *ctx, struct kvec *buff, int status)
+{
+	const struct virtchnl2_psp_insert_keys_response *resp = NULL;
+	struct idpf_psp_insert_req *req = ctx;
+	struct idpf_adapter *adapter = req->adapter;
+	struct idpf_adapter_psp *psp = &adapter->psp;
+	u32 i, num_sa_indexes = 0;
+
+	if (!status) {
+		size_t reply_sz = buff && buff->iov_base ? buff->iov_len : 0;
+
+		if (reply_sz >= sizeof(*resp)) {
+			resp = buff->iov_base;
+			num_sa_indexes = min3(le32_to_cpu(resp->num_sa_indexes),
+					      (u32)((reply_sz - sizeof(*resp)) /
+						    sizeof(resp->sa_indexes[0])),
+					      req->num_keys);
+		} else {
+			net_warn_ratelimited("%s: short reply %zu\n", __func__,
+					     reply_sz);
+		}
+	} else {
+		net_warn_ratelimited("%s: request %s\n", __func__,
+				     status == -ETIMEDOUT ? "timed out" :
+							    "failed");
+	}
+
+	spin_lock_bh(&psp->insert_lock);
+	if (psp->insert_req == req)
+		psp->insert_req = NULL;
+	spin_unlock_bh(&psp->insert_lock);
+	timer_delete(&psp->insert_timer);
+
+	for (i = 0; i < req->num_keys; i++) {
+		struct idpf_psp_tx_key *key = req->keys[i];
+		u32 saidx = IDPF_PSP_IDX_NONE;
+
+		if (i < num_sa_indexes)
+			saidx = le32_to_cpu(resp->sa_indexes[i]);
+
+		if (idpf_psp_saidx_ok(adapter, saidx)) {
+			idpf_psp_tx_key_inserted(adapter, key, saidx);
+		} else {
+			if (i < num_sa_indexes)
+				net_warn_ratelimited("%s: invalid SA index %u\n",
+						     __func__, saidx);
+			idpf_psp_tx_key_failed(adapter, key);
+		}
+
+		/* The key was copied into the request */
+		memzero_explicit(key->key, sizeof(key->key));
+		idpf_psp_tx_key_put(key);
+	}
+
+	kfree(req);
+
+	/* Send the next request */
+	idpf_queue_psp_work(adapter);
+}
+
 /**
  * idpf_psp_insert_late - Delete the SA indexes of a late insertion reply
  * @adapter: Driver specific private structure
@@ -600,6 +673,123 @@ static void idpf_psp_insert_late(struct idpf_adapter *adapter,
 	}
 }
 
+/**
+ * idpf_psp_insert_requeue - Queue the TX keys of an unsent request again
+ * @adapter: Driver specific private structure
+ * @req: insert request that couldn't be sent
+ *
+ * The keys are sent again after a delay, see idpf_retry_psp_work().
+ */
+static void idpf_psp_insert_requeue(struct idpf_adapter *adapter,
+				    struct idpf_psp_insert_req *req)
+{
+	struct idpf_adapter_psp *psp = &adapter->psp;
+	u32 i;
+
+	spin_lock_bh(&psp->insert_lock);
+	if (psp->insert_req == req)
+		psp->insert_req = NULL;
+	/* In request order, at the head of the queue */
+	for (i = req->num_keys; i; i--)
+		list_add(&req->keys[i - 1]->ins_node, &psp->ins_list);
+	WRITE_ONCE(psp->ins_queued, psp->ins_queued + req->num_keys);
+	spin_unlock_bh(&psp->insert_lock);
+
+	kfree(req);
+	idpf_retry_psp_work(adapter);
+}
+
+/**
+ * idpf_send_insert_psp_keys - Insert queued TX keys into the SADB
+ * @adapter: Driver specific private structure
+ *
+ * Send one asynchronous VIRTCHNL2_OP_PSP_INSERT_KEYS request for the TX keys
+ * queued by idpf_psp_queue_insert(), at most as many as fit in one message.
+ * At most one request is in flight: the response callback queues the PSP work
+ * again, see idpf_psp_insert_keys_cb(). Called from the PSP work.
+ */
+void idpf_send_insert_psp_keys(struct idpf_adapter *adapter)
+{
+	struct libie_ctlq_xn_send_params xn_params = {
+		.chnl_opcode	= VIRTCHNL2_OP_PSP_INSERT_KEYS,
+		.timeout_ms	= IDPF_VC_XN_PSP_RESPONSE_TIMEOUT_MSEC,
+		.resp_cb	= idpf_psp_insert_keys_cb,
+	};
+	struct virtchnl2_psp_insert_keys_request *key_req;
+	struct idpf_adapter_psp *psp = &adapter->psp;
+	struct idpf_psp_insert_req *req;
+	u32 i, num_keys;
+	size_t buf_size;
+	int err;
+
+	BUILD_BUG_ON(struct_size_t(struct virtchnl2_psp_insert_keys_request,
+				   keys, IDPF_PSP_INSERT_KEYS_MAX) >
+		     LIBIE_CTLQ_MAX_BUF_LEN);
+
+	spin_lock_bh(&psp->insert_lock);
+	num_keys = psp->insert_req ? 0 :
+		   min_t(u32, psp->ins_queued, IDPF_PSP_INSERT_KEYS_MAX);
+	spin_unlock_bh(&psp->insert_lock);
+	if (!num_keys)
+		return;
+
+	req = kzalloc(struct_size(req, keys, num_keys), GFP_KERNEL);
+	if (!req) {
+		idpf_retry_psp_work(adapter);
+		return;
+	}
+
+	req->adapter = adapter;
+
+	/* Keys may have been deleted meanwhile */
+	spin_lock_bh(&psp->insert_lock);
+	req->num_keys = min(num_keys, psp->ins_queued);
+	for (i = 0; i < req->num_keys; i++) {
+		req->keys[i] = list_first_entry(&psp->ins_list,
+						struct idpf_psp_tx_key,
+						ins_node);
+		list_del_init(&req->keys[i]->ins_node);
+	}
+	WRITE_ONCE(psp->ins_queued, psp->ins_queued - req->num_keys);
+	if (req->num_keys)
+		psp->insert_req = req;
+	spin_unlock_bh(&psp->insert_lock);
+
+	if (!req->num_keys) {
+		kfree(req);
+		return;
+	}
+
+	buf_size = struct_size(key_req, keys, req->num_keys);
+	key_req = kzalloc(buf_size, GFP_KERNEL);
+	if (!key_req) {
+		idpf_psp_insert_requeue(adapter, req);
+		return;
+	}
+
+	key_req->vport_id = cpu_to_le32(READ_ONCE(psp->vport_id));
+	key_req->num_keys = cpu_to_le32(req->num_keys);
+	/* key_req->domain stays zeroed: VIRTCHNL2_PSP_DOMAIN_NONE */
+	for (i = 0; i < req->num_keys; i++) {
+		key_req->keys[i].spi = cpu_to_le32(be32_to_cpu(req->keys[i]->spi));
+		key_req->keys[i].key_type = VIRTCHNL2_PSP_KEY_TYPE_V0;
+		memcpy(key_req->keys[i].v0_key, req->keys[i]->key,
+		       VIRTCHNL2_PSP_KEY_SIZE_V0);
+	}
+
+	/* The request can complete as soon as it is sent */
+	xn_params.send_ctx = req;
+	idpf_psp_insert_timer_arm(adapter, xn_params.timeout_ms);
+	err = idpf_send_mb_msg_kfree(adapter, &xn_params, key_req, buf_size);
+	if (err) {
+		/* libie only calls the response callback of sent requests */
+		timer_delete(&psp->insert_timer);
+		net_warn_ratelimited("%s: request not sent: %d\n", __func__,
+				     err);
+		idpf_psp_insert_requeue(adapter, req);
+	}
+}
+
 /**
  * idpf_psp_recv_late_reply - Handle a late reply to a PSP request
  * @adapter: Driver specific private structure
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
index 8d8ce4478842..0013a9134cfc 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
@@ -18,5 +18,6 @@ int idpf_psp_rotation_request(struct idpf_adapter *adapter);
 int idpf_send_get_psp_global_stats(struct idpf_adapter *adapter,
 				   struct virtchnl2_psp_global_stats_response *stats);
 bool idpf_send_delete_psp_keys(struct idpf_adapter *adapter);
+void idpf_send_insert_psp_keys(struct idpf_adapter *adapter);
 
 #endif /* !_IDPF_PSP_VIRTCHNL_H_ */
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl_def.h b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl_def.h
index 69a61fa421e0..76b00946119b 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl_def.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl_def.h
@@ -12,6 +12,10 @@
 /* PSP key insertion and deletion requests must fit in one mailbox buffer,
  * which limits the number of TX keys and SA indexes per request.
  */
+#define IDPF_PSP_INSERT_KEYS_MAX					\
+	((LIBIE_CTLQ_MAX_BUF_LEN -					\
+	  sizeof(struct virtchnl2_psp_insert_keys_request)) /		\
+	 sizeof(struct virtchnl2_insert_psp_key))
 #define IDPF_PSP_DELETE_KEYS_MAX					\
 	((LIBIE_CTLQ_MAX_BUF_LEN -					\
 	  sizeof(struct virtchnl2_psp_delete_keys_request)) /		\
diff --git a/include/linux/net/intel/virtchnl2.h b/include/linux/net/intel/virtchnl2.h
index b8940e33fd04..225ddee93409 100644
--- a/include/linux/net/intel/virtchnl2.h
+++ b/include/linux/net/intel/virtchnl2.h
@@ -1992,6 +1992,41 @@ struct virtchnl2_psp_allocate_keys_response {
 };
 VIRTCHNL2_CHECK_STRUCT_LEN(16, virtchnl2_psp_allocate_keys_response);
 
+/**
+ * struct virtchnl2_insert_psp_key - PSP TX key entry to insert into SADB
+ * @spi: Security parameter index
+ * @key_type: See enum virtchnl2_psp_key_type
+ * @pad: Reserved/padding
+ * @v0_key: 128-bit key for V0
+ * @v1_key: 256-bit key for V1
+ */
+struct virtchnl2_insert_psp_key {
+	__le32 spi;
+	u8 key_type;
+	u8 pad[3];
+	union {
+		u8 v0_key[VIRTCHNL2_PSP_KEY_SIZE_V0];
+		u8 v1_key[VIRTCHNL2_PSP_KEY_SIZE_V1];
+	};
+};
+VIRTCHNL2_CHECK_STRUCT_LEN(40, virtchnl2_insert_psp_key);
+
+/**
+ * struct virtchnl2_psp_insert_keys_request - Insert PSP TX keys request
+ * @vport_id: Virtual port ID
+ * @num_keys: Number of keys to insert
+ * @domain: Key domain, must be zero-filled if VIRTCHNL2_CAP_PSP_DOMAIN was
+ *	    not granted
+ * @keys: Flexible array of keys to insert
+ */
+struct virtchnl2_psp_insert_keys_request {
+	__le32 vport_id;
+	__le32 num_keys;
+	struct virtchnl2_psp_key_domain domain;
+	struct virtchnl2_insert_psp_key keys[] __counted_by_le(num_keys);
+};
+VIRTCHNL2_CHECK_STRUCT_LEN(24, virtchnl2_psp_insert_keys_request);
+
 /**
  * struct virtchnl2_psp_insert_keys_response - Insert PSP TX keys response
  * @vport_id: Virtual port ID
-- 
2.56.0.679.gc527c65306-goog


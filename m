Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927351;
	b=nXsBfyaPKiNQzJfi8nFyFAfeKd89Vu1id15+x6yyqm/I4+Svp/mTl4tmdfkH1txegH5g
	 3o7vOv1hfIc3wvP4nzdeAWLSpkCJqkM+XFolk+Lzv87wFh8QnrvHAZDi6M+oYwHnaUnPx
	 CVbz95jvPcz+aCvVVXDX8/QzTrUgHogUHovKl7R56TSelvt4xNIxPkexBFH+FFBo7qMEv
	 kY3RU0EbR8wpaKouVrwyX6REA7raUtFzk/FHIT/7tnMMyZEYHNLXiB9ZuqxjDEzFpOA2W
	 wAchcSTQAmt8ePjYtt/kQUI8PMXCcN+3OfufAIrAuVwdi0Azh6PGSGMzl4z9uwNmqnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Shs4PdnXjd2xYxGi51mBNeSm79d9G1JjpdOef49Oggg=;
	b=2b4V0ShnAistfl4DDygjT7wiPWmd639rGd5GreRjGQfg/hW4J/ozVv+XM6sAg58Ybvuu
	 oGB2e3OiHjk/bfA9swudjWPDT8ahaQMSs4wr1Z4qeGzWRDANC7vnebYJabTDOXAnYltz5
	 WviqEHgOfa7JIauFMpTWhfqRAdOTveBlBt8J+oBxiaUt+c6IfQFCGg0bIdrshK0c0V7eY
	 lV7aYUBlWQKLHT/A9jtwxjSJwFSOlgVG0bC1xx0J5hauqskzKmIMs6u8UeioNwrAnaBR2
	 06qSsUWuX/FbWobIyL9MorIYGR8pV5SlzWbzDpvr3kpYYwCPhVBnLlSpaqgH223jM7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cj8zJBW5;
	arc=none smtp.remote-ip=209.85.160.200
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49ED606B6C1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D49ED606B6C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cj8zJBW5
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-542fc61841eso88972761cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927350; x=1795532150; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shs4PdnXjd2xYxGi51mBNeSm79d9G1JjpdOef49Oggg=;
        b=cj8zJBW5B3auxI3mqmJEFuzEHZyhOkbr4ILwHFpKBLLVv8R69fZwljR8q/xi7vJeI3
         vtFZYRrNSXuYNpAqA1w3ZPerJzrWM1qYI/BMVEug4kKGZML9xDyYOME9Xz82ttP0oZhP
         DwK22nklEKr+QNqIMtkvFWLQLUBO/E/iLDf3LmtoUwCCMt0oEN8CFQOWYKt0rdcRqKYl
         hhCzC2vD3KG9D3RAnfCEW4s9eqSQOTwDWjPXkz+8tUjwVfJaxcaJg7AUo4LPL3fXykqD
         a2q60Gtz6Qdbg/SDw59ScMtmpQIEBl/Et5oDMWl2sPUjZCNFXyjjcz1WHOViIUbkZH1U
         yeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927350; x=1795532150;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Shs4PdnXjd2xYxGi51mBNeSm79d9G1JjpdOef49Oggg=;
        b=iotLuitqih2X3cq9ngl09BcXiG7UjsfeWYaadYEsQChh7mSPQzdjXXhSivOcB7JfQ0
         i9/uzIyUZsh9My/6v80etZSUKmZeICs+Ol7KKLvWLLZpCQF4e+TOlxwfEt1c6IRhXm4t
         e1TUN3jt3HIkhDnEzI8AjqdujS8mHhzdCV682dhor8v4ZCx9TpVnvtizD7IB/N1WYuYO
         bhehLmSF2v50UX5D+SVcHSAtmvRh99S1oNAvdAt6Hal3uQor+EFhRtlLfS4110uXrZVG
         R0xDPSCB0JsPahxz+m/dlgKYcHdpxECLOmVQmxFez/HZC0wLI88fgPCUTLM7MmPib2fd
         OMGA==
X-Forwarded-Encrypted: i=1; AL+hErFVTLRud+/kSsr3ubZI8Mgm8Cricbl/YuZ08h2GLtHvmEu4irXSsRgnbAgmUg3YmIl+ChAOQIrEsh9dCyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PGSb6aF3HZdNSkorhRzoOijeORA6bMfCWkTmr7VkAjutxXFVr
	+1V4viqR3IZ/9Ky380A2EQjr3h/CdvBAYKbKnXAKeSQZH/7KS/T343k2GjL0/ni5IG8ZhCZ57M3
	MEg==
X-Received: from qvbk12-n1.prod.google.com ([2002:a05:6214:61cc:10b0:91f:33a5:e96a])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:622a:8407:20b0:55b:b083:2b8f
 with SMTP id d75a77b69052e-55bb09293dbmr146864971cf.28.1794927349607; Tue, 17
 Nov 2026 06:55:49 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:18 +0000
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
Message-ID: <20261117145522.1910636-13-stani@google.com>
Subject: [PATCH iwl-next 12/15] idpf: psp: add support for psp tx key deletion
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

Add support for deleting TX keys from the SADB:
- Introduce VIRTCHNL2_OP_PSP_DELETE_KEYS (562) and
  struct virtchnl2_psp_delete_keys_request/_response.
- Add the delete queue, filled by idpf_psp_queue_delete(): a list of
  the TX keys whose SA index (hw_idx) must be deleted, which holds a
  reference on them. No deletion is queued during a reset or remove,
  as the SADB is flushed then.
- Implement idpf_send_delete_psp_keys(), which deletes up to
  IDPF_PSP_DELETE_KEYS_MAX (1018) SA indexes per request:
  - the SA indexes of a request the CP failed, e.g. because of an
    invalid SA index, are retried once each on their own;
  - only the num_sa_indexes_deleted SA indexes of the reply are
    removed, the others are counted as lost;
  - a request that timed out is not sent again, as the CP may have
    processed it: its SA indexes are counted as lost. A late reply,
    passed by libie to idpf_recv_event_msg(), moves the deleted ones
    to removed, at most the SA indexes counted as lost since the last
    core init;
  - a request that couldn't be sent is queued again.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_psp.c    |  38 ++++
 drivers/net/ethernet/intel/idpf/idpf_psp.h    |   3 +
 .../net/ethernet/intel/idpf/idpf_psp_def.h    |  23 +++
 .../ethernet/intel/idpf/idpf_psp_virtchnl.c   | 175 +++++++++++++++++-
 .../ethernet/intel/idpf/idpf_psp_virtchnl.h   |   1 +
 .../intel/idpf/idpf_psp_virtchnl_def.h        |  17 ++
 include/linux/net/intel/virtchnl2.h           |  30 +++
 7 files changed, 286 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl_def.h

diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.c b/drivers/net/ethernet/intel/idpf/idpf_psp.c
index ef23b1699b09..d2a0ba79c7ab 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.c
@@ -106,6 +106,13 @@ void idpf_psp_init(struct idpf_adapter *adapter)
 		dev_warn(dev, "Failed to get PSP FIPS compliance status: %d\n",
 			 err);
 
+	/* Initialized the first time PSP is negotiated */
+	if (!psp->initialized) {
+		spin_lock_init(&psp->del_lock);
+		INIT_LIST_HEAD(&psp->del_list);
+		psp->initialized = true;
+	}
+
 	/* The master keys are tracked again for the new PSP device */
 	psp->generation = 0;
 	psp->rx_gen[0].gen = IDPF_PSP_GEN_UNKNOWN;
@@ -113,6 +120,9 @@ void idpf_psp_init(struct idpf_adapter *adapter)
 
 	/* The counters cover the time since the core init */
 	atomic_set(&psp->keys_allocated, 0);
+	atomic_set(&psp->keys_removed, 0);
+	atomic_set(&psp->keys_lost, 0);
+	atomic_set(&psp->del_retries, 0);
 
 	WRITE_ONCE(psp->enabled, true);
 }
@@ -144,6 +154,8 @@ struct idpf_psp_tx_key *idpf_psp_tx_key_alloc(void)
 	kref_init(&key->ref);
 	spin_lock_init(&key->lock);
 	key->idx = IDPF_PSP_IDX_IN_PROG;
+	key->hw_idx = IDPF_PSP_IDX_NONE;
+	INIT_LIST_HEAD(&key->del_node);
 
 	return key;
 }
@@ -179,6 +191,32 @@ void idpf_psp_tx_key_put(struct idpf_psp_tx_key *key)
 	kref_put(&key->ref, idpf_psp_tx_key_free);
 }
 
+/**
+ * idpf_psp_queue_delete - Queue the deletion of the SA index of a TX key
+ * @adapter: private data struct
+ * @key: the TX key, whose hw_idx is the SA index to delete
+ *
+ * The deletion requests are sent by the PSP work, which releases the
+ * reference taken on @key once the SA index was deleted, see
+ * idpf_send_delete_psp_keys(). No deletion is queued during a reset or
+ * remove: the SADB is flushed by the reset, and by the function reset on
+ * remove.
+ */
+void idpf_psp_queue_delete(struct idpf_adapter *adapter,
+			   struct idpf_psp_tx_key *key)
+{
+	struct idpf_adapter_psp *psp = &adapter->psp;
+
+	if (idpf_is_reset_in_prog(adapter) ||
+	    test_bit(IDPF_REMOVE_IN_PROG, adapter->flags))
+		return;
+
+	idpf_psp_tx_key_get(key);
+	spin_lock_bh(&psp->del_lock);
+	list_add_tail(&key->del_node, &psp->del_list);
+	spin_unlock_bh(&psp->del_lock);
+}
+
 /**
  * idpf_psp_set_config - Set the PSP device configuration
  * @psd: PSP device
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.h b/drivers/net/ethernet/intel/idpf/idpf_psp.h
index 44ac750e2c3b..b4f46e43cd83 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.h
@@ -47,6 +47,9 @@ static inline bool idpf_psp_idx_valid(u32 idx)
 	return idx <= IDPF_PSP_IDX_MAX;
 }
 
+void idpf_psp_queue_delete(struct idpf_adapter *adapter,
+			   struct idpf_psp_tx_key *key);
+
 #else /* !CONFIG_INET_PSP */
 
 static inline void idpf_psp_init(struct idpf_adapter *adapter) { }
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
index 9ba99e08853a..3157b40006c1 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
@@ -4,10 +4,13 @@
 #define _IDPF_PSP_DEF_H_
 
 #include <linux/kref.h>
+#include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/net/intel/virtchnl2.h>
 #include <net/psp.h>
 
+#include "idpf_psp_virtchnl_def.h"
+
 /* SA index widths supported by the driver, negotiated per adapter with
  * VIRTCHNL2_OP_CRYPTO_GET_CAPS, see idpf_psp_negotiate_caps().
  */
@@ -33,12 +36,19 @@
  * @lock: protects @idx and @hw_idx updates, and @tx_queue
  * @idx: SA index the TX path uses, or IDPF_PSP_IDX_IN_PROG,
  *	 IDPF_PSP_IDX_ERROR or IDPF_PSP_IDX_DELETED. Read without @lock.
+ * @hw_idx: SA index of the key in the SADB, IDPF_PSP_IDX_NONE if it has none
+ * @del_node: entry in the delete queue, see idpf_psp_queue_delete()
+ * @del_single: delete @hw_idx in a request of its own, after a request that
+ *		failed
  * @rcu: for freeing the key after the RCU readers of the TX path
  */
 struct idpf_psp_tx_key {
 	struct kref ref;
 	spinlock_t lock;		/* protects the SA indexes and tx_queue */
 	u32 idx;
+	u32 hw_idx;
+	struct list_head del_node;
+	bool del_single;
 	struct rcu_head rcu;
 };
 
@@ -89,7 +99,14 @@ struct idpf_psp_rx_gen {
  * @stats: last PSP device statistics read with
  *	   VIRTCHNL2_OP_GET_PSP_GLOBAL_STATS, protected by the PSP device
  *	   lock, see idpf_psp_get_stats()
+ * @initialized: the locks and lists below were initialized, the first time
+ *		 PSP was negotiated
+ * @del_lock: protects @del_list
+ * @del_list: TX keys whose SA index is queued for deletion
  * @keys_allocated: RX keys allocated
+ * @keys_removed: SA indexes deleted
+ * @keys_lost: SA indexes that couldn't be deleted
+ * @del_retries: SA indexes retried after a failed deletion request
  * @psp_dev: the PSP device, see idpf_psp_register()
  * @caps: capabilities of @psp_dev
  */
@@ -111,7 +128,13 @@ struct idpf_adapter_psp {
 		u64 tx_bytes;
 		u64 tx_error;
 	} stats;
+	bool initialized;
+	spinlock_t del_lock;		/* protects del_list */
+	struct list_head del_list;
 	atomic_t keys_allocated;
+	atomic_t keys_removed;
+	atomic_t keys_lost;
+	atomic_t del_retries;
 	struct psp_dev *psp_dev;
 	struct psp_dev_caps caps;
 };
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
index d36f46a46cfd..42a7d74db232 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
@@ -402,24 +402,197 @@ int idpf_send_get_psp_global_stats(struct idpf_adapter *adapter,
 	return err;
 }
 
+/**
+ * idpf_psp_delete_done - Release the TX keys of a deletion request
+ * @adapter: Driver specific private structure
+ * @batch: TX keys of the request
+ * @removed: number of SA indexes the CP deleted
+ * @lost: number of SA indexes that couldn't be deleted
+ */
+static void idpf_psp_delete_done(struct idpf_adapter *adapter,
+				 struct list_head *batch, u32 removed,
+				 u32 lost)
+{
+	struct idpf_psp_tx_key *key, *tmp;
+
+	atomic_add(removed, &adapter->psp.keys_removed);
+	if (lost) {
+		atomic_add(lost, &adapter->psp.keys_lost);
+		net_warn_ratelimited("%s: %u SA indexes couldn't be deleted\n",
+				     __func__, lost);
+	}
+
+	list_for_each_entry_safe(key, tmp, batch, del_node) {
+		list_del_init(&key->del_node);
+		idpf_psp_tx_key_put(key);
+	}
+}
+
+/**
+ * idpf_send_delete_psp_keys - Delete queued SA indexes from the SADB
+ * @adapter: Driver specific private structure
+ *
+ * Send one synchronous VIRTCHNL2_OP_PSP_DELETE_KEYS request for the SA indexes
+ * queued by idpf_psp_queue_delete():
+ * - the CP fails the request if any SA index is invalid: the SA indexes of a
+ *   failed request are retried once each, in a request of their own;
+ * - the CP stops the deletion at the first hardware or config queue error:
+ *   the SA indexes it didn't delete stay in use and are counted as lost;
+ * - a request that timed out is not sent again, as the CP may have processed
+ *   it and its SA indexes may be in use by new keys: they are counted as lost,
+ *   a late reply moves the deleted ones to removed, see
+ *   idpf_psp_recv_late_reply();
+ * - a request that couldn't be sent is retried the next time the PSP work runs.
+ *
+ * Return: true if SA indexes are still queued for deletion, false otherwise.
+ */
+bool idpf_send_delete_psp_keys(struct idpf_adapter *adapter)
+{
+	struct libie_ctlq_xn_send_params xn_params = {
+		.chnl_opcode	= VIRTCHNL2_OP_PSP_DELETE_KEYS,
+		.timeout_ms	= IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
+	};
+	const struct virtchnl2_psp_delete_keys_response *del_resp;
+	struct virtchnl2_psp_delete_keys_request *del_req;
+	struct idpf_adapter_psp *psp = &adapter->psp;
+	struct idpf_psp_tx_key *key, *tmp;
+	u32 i, removed, num_keys = 0;
+	bool single = false, more;
+	LIST_HEAD(batch);
+	size_t buf_size;
+	int err;
+
+	BUILD_BUG_ON(struct_size_t(struct virtchnl2_psp_delete_keys_request,
+				   sa_indexes, IDPF_PSP_DELETE_KEYS_MAX) >
+		     LIBIE_CTLQ_MAX_BUF_LEN);
+
+	spin_lock_bh(&psp->del_lock);
+	list_for_each_entry_safe(key, tmp, &psp->del_list, del_node) {
+		/* SA indexes of a failed request are deleted on their own */
+		if (num_keys == IDPF_PSP_DELETE_KEYS_MAX ||
+		    (num_keys && key->del_single))
+			break;
+
+		list_move_tail(&key->del_node, &batch);
+		num_keys++;
+		if (key->del_single) {
+			single = true;
+			break;
+		}
+	}
+	more = !list_empty(&psp->del_list);
+	spin_unlock_bh(&psp->del_lock);
+
+	if (!num_keys)
+		return false;
+
+	buf_size = struct_size(del_req, sa_indexes, num_keys);
+	del_req = kzalloc(buf_size, GFP_KERNEL);
+	if (!del_req) {
+		err = -ENOMEM;
+		goto requeue;
+	}
+
+	del_req->vport_id = cpu_to_le32(READ_ONCE(psp->vport_id));
+	del_req->num_sa_indexes = cpu_to_le32(num_keys);
+	/* del_req->domain stays zeroed: VIRTCHNL2_PSP_DOMAIN_NONE */
+	i = 0;
+	list_for_each_entry(key, &batch, del_node)
+		del_req->sa_indexes[i++] = cpu_to_le32(key->hw_idx);
+
+	err = idpf_send_mb_msg_kfree(adapter, &xn_params, del_req, buf_size);
+	switch (err) {
+	case 0:
+		/* The reply has the number of deleted SA indexes, a reply
+		 * without it counts all SA indexes as deleted
+		 */
+		del_resp = xn_params.recv_mem.iov_base;
+		removed = num_keys;
+		if (xn_params.recv_mem.iov_len >= sizeof(*del_resp))
+			removed = min(num_keys,
+				      le32_to_cpu(del_resp->num_sa_indexes_deleted));
+		else
+			net_warn_ratelimited("%s: short reply %zu\n", __func__,
+					     xn_params.recv_mem.iov_len);
+		libie_ctlq_release_rx_buf(&xn_params.recv_mem);
+
+		idpf_psp_delete_done(adapter, &batch, removed,
+				     num_keys - removed);
+		return more;
+	case -EBADMSG:
+		/* The CP failed the request, e.g. because of an invalid SA
+		 * index: retry each SA index on its own, once
+		 */
+		if (single)
+			break;
+
+		list_for_each_entry(key, &batch, del_node)
+			key->del_single = true;
+		atomic_add(num_keys, &psp->del_retries);
+		spin_lock_bh(&psp->del_lock);
+		list_splice(&batch, &psp->del_list);
+		spin_unlock_bh(&psp->del_lock);
+
+		return true;
+	case -ETIMEDOUT:
+		break;
+	default:
+		goto requeue;
+	}
+
+	/* The request timed out, or failed again on its own */
+	idpf_psp_delete_done(adapter, &batch, 0, num_keys);
+
+	return more;
+
+requeue:
+	/* The request wasn't sent, e.g. no mailbox transaction was free. A
+	 * reset flushes the queue.
+	 */
+	spin_lock_bh(&psp->del_lock);
+	list_splice(&batch, &psp->del_list);
+	spin_unlock_bh(&psp->del_lock);
+	net_warn_ratelimited("%s: request not sent: %d\n", __func__, err);
+
+	return false;
+}
+
 /**
  * idpf_psp_recv_late_reply - Handle a late reply to a PSP request
  * @adapter: Driver specific private structure
  * @ctlq_msg: reply, its receive buffer is released by the caller
  *
  * libie passes the replies to requests that timed out to idpf_recv_event_msg().
- * The RX key of an allocation reply is wiped.
+ * The RX key of an allocation reply is wiped. The SA indexes deleted by a
+ * deletion reply were counted as lost, see idpf_send_delete_psp_keys(): they
+ * are counted as removed.
  */
 void idpf_psp_recv_late_reply(struct idpf_adapter *adapter,
 			      const struct libie_ctlq_msg *ctlq_msg)
 {
 	const struct kvec *buff = &ctlq_msg->recv_mem;
+	const struct virtchnl2_psp_delete_keys_response *del_resp;
+	u32 deleted;
 
 	switch (ctlq_msg->chnl_opcode) {
 	case VIRTCHNL2_OP_PSP_ALLOCATE_KEYS:
 		if (buff->iov_base)
 			memzero_explicit(buff->iov_base, buff->iov_len);
 		break;
+	case VIRTCHNL2_OP_PSP_DELETE_KEYS:
+		del_resp = buff->iov_base;
+		if (!idpf_is_psp_ena(adapter) || ctlq_msg->chnl_retval ||
+		    !del_resp || buff->iov_len < sizeof(*del_resp))
+			break;
+
+		/* Only the SA indexes counted as lost since the last core
+		 * init, the counters were reset by a reset meanwhile
+		 */
+		deleted = min_t(u32, le32_to_cpu(del_resp->num_sa_indexes_deleted),
+				max(atomic_read(&adapter->psp.keys_lost), 0));
+		atomic_sub(deleted, &adapter->psp.keys_lost);
+		atomic_add(deleted, &adapter->psp.keys_removed);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
index b7261385adf6..8d8ce4478842 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
@@ -17,5 +17,6 @@ int idpf_send_allocate_psp_key(struct idpf_adapter *adapter,
 int idpf_psp_rotation_request(struct idpf_adapter *adapter);
 int idpf_send_get_psp_global_stats(struct idpf_adapter *adapter,
 				   struct virtchnl2_psp_global_stats_response *stats);
+bool idpf_send_delete_psp_keys(struct idpf_adapter *adapter);
 
 #endif /* !_IDPF_PSP_VIRTCHNL_H_ */
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl_def.h b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl_def.h
new file mode 100644
index 000000000000..c2be65e541be
--- /dev/null
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl_def.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _IDPF_PSP_VIRTCHNL_DEF_H_
+#define _IDPF_PSP_VIRTCHNL_DEF_H_
+
+#include <linux/net/intel/libie/controlq.h>
+#include <linux/net/intel/virtchnl2.h>
+
+/* PSP key insertion and deletion requests must fit in one mailbox buffer,
+ * which limits the number of TX keys and SA indexes per request.
+ */
+#define IDPF_PSP_DELETE_KEYS_MAX					\
+	((LIBIE_CTLQ_MAX_BUF_LEN -					\
+	  sizeof(struct virtchnl2_psp_delete_keys_request)) /		\
+	 sizeof(__le32))
+
+#endif /* !_IDPF_PSP_VIRTCHNL_DEF_H_ */
diff --git a/include/linux/net/intel/virtchnl2.h b/include/linux/net/intel/virtchnl2.h
index ca07c32b0f1a..903159235832 100644
--- a/include/linux/net/intel/virtchnl2.h
+++ b/include/linux/net/intel/virtchnl2.h
@@ -86,6 +86,7 @@ enum virtchnl2_op {
 	VIRTCHNL2_OP_DEL_FLOW_RULE			= 553,
 	/* Crypto/PSP opcodes */
 	VIRTCHNL2_OP_PSP_ALLOCATE_KEYS			= 560,
+	VIRTCHNL2_OP_PSP_DELETE_KEYS			= 562,
 	VIRTCHNL2_OP_PSP_ROTATE_KEYGEN_REQUEST		= 563,
 	VIRTCHNL2_OP_CRYPTO_GET_CAPS			= 564,
 	VIRTCHNL2_OP_PSP_GET_CAPS			= 565,
@@ -1990,6 +1991,35 @@ struct virtchnl2_psp_allocate_keys_response {
 };
 VIRTCHNL2_CHECK_STRUCT_LEN(16, virtchnl2_psp_allocate_keys_response);
 
+/**
+ * struct virtchnl2_psp_delete_keys_request - Delete PSP TX keys request
+ * @vport_id: Virtual port ID
+ * @num_sa_indexes: Number of SA indexes to delete
+ * @domain: Key domain, must be zero-filled if VIRTCHNL2_CAP_PSP_DOMAIN was
+ *	    not granted
+ * @sa_indexes: Flexible array of SA indexes to delete
+ */
+struct virtchnl2_psp_delete_keys_request {
+	__le32 vport_id;
+	__le32 num_sa_indexes;
+	struct virtchnl2_psp_key_domain domain;
+	__le32 sa_indexes[] __counted_by_le(num_sa_indexes);
+};
+VIRTCHNL2_CHECK_STRUCT_LEN(24, virtchnl2_psp_delete_keys_request);
+
+/**
+ * struct virtchnl2_psp_delete_keys_response - Delete PSP TX keys response
+ * @vport_id: Virtual port ID
+ * @num_sa_indexes_deleted: Number of SA indexes deleted. The request fails if
+ *			    any SA index is invalid, and the deletion stops at
+ *			    the first hardware/config queue error.
+ */
+struct virtchnl2_psp_delete_keys_response {
+	__le32 vport_id;
+	__le32 num_sa_indexes_deleted;
+};
+VIRTCHNL2_CHECK_STRUCT_LEN(8, virtchnl2_psp_delete_keys_response);
+
 /**
  * struct virtchnl2_psp_rotate_keygen_request - Request master key rotation
  * @vport_id: Virtual port ID
-- 
2.56.0.679.gc527c65306-goog


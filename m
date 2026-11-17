Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927353;
	b=ogOBsVosyz5Eppwxi6QrkRn2FS4Fx4BhiYm0O9jDOTsbEyb08CVPIr+rfyFx1PtMOtWX
	 wqfVkbSo3B6t8G10JG+w82ajPN9iAFppQ1+PopPmLVB67ik0VXGtHBZlUHtTCElMN6Qv7
	 OEQff+juLgjc/gO8ep+TZkhdr3Q4rFwbDkRuzzE3JHnOPt6ekJelm41l/jRIgZkmiHKxy
	 EUKHGaLwqIya7V7Z44/EPdeotVLxHUldBLrN1BGywusjfN7wbgmC7kEVSZ9NLAWSDLISP
	 WKcIu5sRziUyGD+Z3hTxobaiOu8yZ/NUEZrSBHp2qxL0HpV24uh5enaLIS+d1f9kQ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=j/02eyou4M60KpUrF8lLMNeinWTXVYjClptMJA9JWgg=;
	b=K/ElYxf1ldKH2HeQxXeDRADxKOSJjy4rI5vfFBWV/ROxnuDXEg38kawcnmuQq5WSwMgZ
	 SYeOc78EvEKUJPMiHBjuD8a5eMJAtermcEmeUvZBxlY5TCjZ+8eiSzmwMZpLRWqwCJ573
	 lX0KEcfyPG5FB/NrRRSKf+zcyiOugDyMJymXnQ0Lu5wyHsHjuKhvWLGwpgKMbnwwNLNOk
	 cmX4g9czVuOCIis6ux/N9hzcBl4j+qI7TPdy0vslDWwkOxT7vX/RF2cApsOoHSaMs0egz
	 HjbjrAVEgb+Ac/lY3cqOUAZ+EY0jLVA8TIHvkvJVKPjEpsZUtkeZezBtfZqSTsbeznA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A81waOJF;
	arc=none smtp.remote-ip=209.85.128.197
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960A606C702
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5960A606C702
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A81waOJF
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0bf2140b7so67062097b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927352; x=1795532152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/02eyou4M60KpUrF8lLMNeinWTXVYjClptMJA9JWgg=;
        b=A81waOJFnF8DhHvqdyiRdXI0Dw3tyTQYB4xPCpoInj+PjW00fid38fbCYe+hZGAHMY
         cIuSyBOaWwrxGIbrnafniE0Kbyd1KLtuiKPUpEbCqHlqL45NoLLZyI+dKW1X44mVBSJ7
         YSJ6PZE151Sx+HiCJqvj7+KNEGS8HjxoV/guLI8ENcVK+c2RnTrj1GswSBBb28ziDcvj
         X3+ecSHgN5r+HF04R4WFO4jtdx0+qRoUv3mkdvYP8WxLUKeU9VTJFHfa1krBCglr0kNn
         jQjFMxto+iM05icjKzMmktgUan8UXx/k6DZDaLP6JSR1qxWYbh/2cSiQsRlgengRQ+J/
         pCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927352; x=1795532152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/02eyou4M60KpUrF8lLMNeinWTXVYjClptMJA9JWgg=;
        b=G1EZEu5KyPKyywYJe4NMWS/LgxEvhAZj34SCeXAZQAYLBWXmVxLp7PqIg2zzLmZMRL
         gAIAbKbUmp0GQSZNyprG48KSPqgih5xHyu6rSNYZXOzwP0A3stnkj4QPh6tZ46Uv15b/
         BIszE+MZm+KsJN+iD6ju5pyNHfVpkroC8tzGc53844Y4dvOSBSF2TdBnMTxna38kJRnU
         VeB101hNmBltjgfzX5Th7vcTFaBrJxmDwZFsmGrKWFSSbMtaIuAAZh72TN2N+q4IsKwr
         6blX73/cj6JhRpqPUGM2RFnkO2cWBdkSMVfKFQPvrUw4tUk/UE9NjpbCKzPkUSy19Ixf
         q53g==
X-Forwarded-Encrypted: i=1; AL+hErHxxWtmSG4wJu/wfl6qT1ekb4WcX2Y9Aw0MJzpu8S8wMTQBG1QgGlzBuzUIcNofBNmNOSeUUWn+zCR/Qcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AiE0YNL1KY/1QIh96/lkASREy4ukT4625HhcUadRLNzHKilTu
	XpUQKghbH1kitT4fhWKTuh01hDm3itHGdrIb9z/Dlt6+dTN9WIxKZPnSiAP6zHgSGunM5VYqIKK
	UCg==
X-Received: from ywzz28.prod.google.com ([2002:a05:690c:a71c:b0:8ab:3345:c617])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:e64b:b0:8b0:d9ff:4f74
 with SMTP id 00721157ae682-8b4aa32e148mr55968407b3.42.1794927352263; Tue, 17
 Nov 2026 06:55:52 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:21 +0000
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
Message-ID: <20261117145522.1910636-16-stani@google.com>
Subject: [PATCH iwl-next 15/15] idpf: psp: add psp tx key registration
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

Add idpf_psp_queue_insert(), which queues a TX key for insertion:
- The key reserves a SADB entry, released if the insertion fails, or
  once its SA index was deleted. An SA index that couldn't be deleted
  keeps its SADB entry, as does the SA index of a late insertion reply
  until it is deleted.
- New keys are refused with -ENOSPC once the SADB or the insert queue
  (IDPF_PSP_INS_QUEUE_MAX keys) is full.
- The RX SPI allocation refuses the RX keys of new connections then,
  instead of failing their TX keys later.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_psp.c    | 62 +++++++++++++++++++
 drivers/net/ethernet/intel/idpf/idpf_psp.h    |  2 +
 .../net/ethernet/intel/idpf/idpf_psp_def.h    |  4 ++
 .../ethernet/intel/idpf/idpf_psp_virtchnl.c   |  4 ++
 4 files changed, 72 insertions(+)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.c b/drivers/net/ethernet/intel/idpf/idpf_psp.c
index 95926ac99777..1dfec4177c43 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.c
@@ -11,6 +11,9 @@
 /* Delay before the PSP work sends again a request that couldn't be sent */
 #define IDPF_PSP_RETRY_MSEC		100
 
+/* Maximum number of TX keys queued for insertion */
+#define IDPF_PSP_INS_QUEUE_MAX		1024
+
 /**
  * idpf_queue_psp_work - Queue the PSP work
  * @adapter: private data struct
@@ -237,6 +240,8 @@ void idpf_psp_init(struct idpf_adapter *adapter)
 	atomic_set(&psp->keys_inserted, 0);
 	atomic_set(&psp->insert_errors, 0);
 	atomic_set(&psp->insert_late, 0);
+	atomic_set(&psp->sadb_used, 0);
+	atomic_set(&psp->keys_refused, 0);
 
 	WRITE_ONCE(psp->enabled, true);
 }
@@ -436,6 +441,8 @@ void idpf_psp_tx_key_failed(struct idpf_adapter *adapter,
 			    struct idpf_psp_tx_key *key)
 {
 	atomic_inc(&adapter->psp.insert_errors);
+	/* The SADB entry reserved for the key wasn't used */
+	atomic_dec(&adapter->psp.sadb_used);
 
 	spin_lock_bh(&key->lock);
 	if (key->idx == IDPF_PSP_IDX_IN_PROG)
@@ -443,6 +450,54 @@ void idpf_psp_tx_key_failed(struct idpf_adapter *adapter,
 	spin_unlock_bh(&key->lock);
 }
 
+/**
+ * idpf_psp_sadb_full - Check if new PSP keys must be refused
+ * @adapter: private data struct
+ *
+ * Return: true if the SADB or the insertion queue is full, false otherwise.
+ */
+static bool idpf_psp_sadb_full(struct idpf_adapter *adapter)
+{
+	/* sadb_entries fits in 26 bits, see idpf_psp_negotiate_caps() */
+	return atomic_read(&adapter->psp.sadb_used) >=
+	       (int)adapter->psp.sadb_entries ||
+	       READ_ONCE(adapter->psp.ins_queued) >= IDPF_PSP_INS_QUEUE_MAX;
+}
+
+/**
+ * idpf_psp_queue_insert - Queue a TX key for insertion into the SADB
+ * @adapter: private data struct
+ * @key: the TX key, with its SPI and key set
+ *
+ * Reserve a SADB entry for the key and queue it for insertion. The PSP work
+ * inserts the queued keys, see idpf_send_insert_psp_keys(), and releases the
+ * reference taken on @key once the insertion completed.
+ *
+ * Return: 0 on success, -ENOSPC if the SADB or the insertion queue is full.
+ */
+int idpf_psp_queue_insert(struct idpf_adapter *adapter,
+			  struct idpf_psp_tx_key *key)
+{
+	struct idpf_adapter_psp *psp = &adapter->psp;
+
+	spin_lock_bh(&psp->insert_lock);
+	if (idpf_psp_sadb_full(adapter)) {
+		spin_unlock_bh(&psp->insert_lock);
+		atomic_inc(&psp->keys_refused);
+		return -ENOSPC;
+	}
+
+	atomic_inc(&psp->sadb_used);
+	idpf_psp_tx_key_get(key);
+	list_add_tail(&key->ins_node, &psp->ins_list);
+	WRITE_ONCE(psp->ins_queued, psp->ins_queued + 1);
+	spin_unlock_bh(&psp->insert_lock);
+
+	idpf_queue_psp_work(adapter);
+
+	return 0;
+}
+
 /**
  * idpf_psp_set_config - Set the PSP device configuration
  * @psd: PSP device
@@ -515,6 +570,13 @@ static int idpf_psp_rx_spi_alloc(struct psp_dev *psd, u32 version,
 		return -EOPNOTSUPP;
 	}
 
+	/* Refuse new connections whose TX key couldn't be inserted */
+	if (idpf_psp_sadb_full(adapter)) {
+		atomic_inc(&adapter->psp.keys_refused);
+		NL_SET_ERR_MSG_MOD(extack, "PSP SADB full");
+		return -ENOSPC;
+	}
+
 	err = idpf_send_allocate_psp_key(adapter, &rx_key);
 	if (err) {
 		NL_SET_ERR_MSG_MOD(extack, "Failed to allocate RX SPI and key");
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.h b/drivers/net/ethernet/intel/idpf/idpf_psp.h
index 0b2ae019b4a0..377cd4889f51 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.h
@@ -59,6 +59,8 @@ void idpf_psp_tx_key_inserted(struct idpf_adapter *adapter,
 			      struct idpf_psp_tx_key *key, u32 saidx);
 void idpf_psp_tx_key_failed(struct idpf_adapter *adapter,
 			    struct idpf_psp_tx_key *key);
+int idpf_psp_queue_insert(struct idpf_adapter *adapter,
+			  struct idpf_psp_tx_key *key);
 
 #else /* !CONFIG_INET_PSP */
 
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
index 5af3347d9596..449bcb3c9ee2 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
@@ -134,6 +134,7 @@ struct idpf_psp_rx_gen {
  *		  see idpf_psp_insert_timeout()
  * @ins_list: TX keys queued for insertion
  * @ins_queued: number of keys in @ins_list
+ * @sadb_used: SADB entries used, or reserved by keys queued for insertion
  * @keys_allocated: RX keys allocated
  * @keys_inserted: TX keys inserted into the SADB
  * @insert_errors: TX keys whose insertion failed
@@ -141,6 +142,7 @@ struct idpf_psp_rx_gen {
  * @keys_removed: SA indexes deleted
  * @keys_lost: SA indexes that couldn't be deleted
  * @del_retries: SA indexes retried after a failed deletion request
+ * @keys_refused: RX and TX keys refused, SADB or insertion queue full
  * @psp_dev: the PSP device, see idpf_psp_register()
  * @caps: capabilities of @psp_dev
  */
@@ -172,6 +174,7 @@ struct idpf_adapter_psp {
 	struct timer_list insert_timer;
 	struct list_head ins_list;
 	u32 ins_queued;
+	atomic_t sadb_used;
 	atomic_t keys_allocated;
 	atomic_t keys_inserted;
 	atomic_t insert_errors;
@@ -179,6 +182,7 @@ struct idpf_adapter_psp {
 	atomic_t keys_removed;
 	atomic_t keys_lost;
 	atomic_t del_retries;
+	atomic_t keys_refused;
 	struct psp_dev *psp_dev;
 	struct psp_dev_caps caps;
 };
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
index 480b56ce8164..0843f8e0ffea 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
@@ -416,6 +416,7 @@ static void idpf_psp_delete_done(struct idpf_adapter *adapter,
 	struct idpf_psp_tx_key *key, *tmp;
 
 	atomic_add(removed, &adapter->psp.keys_removed);
+	atomic_sub(removed, &adapter->psp.sadb_used);
 	if (lost) {
 		atomic_add(lost, &adapter->psp.keys_lost);
 		net_warn_ratelimited("%s: %u SA indexes couldn't be deleted\n",
@@ -661,6 +662,8 @@ static void idpf_psp_insert_late(struct idpf_adapter *adapter,
 			continue;
 
 		atomic_inc(&adapter->psp.insert_late);
+		/* The SA index is used until it is deleted */
+		atomic_inc(&adapter->psp.sadb_used);
 		key = idpf_psp_tx_key_alloc();
 		if (!key) {
 			atomic_inc(&adapter->psp.keys_lost);
@@ -826,6 +829,7 @@ void idpf_psp_recv_late_reply(struct idpf_adapter *adapter,
 				max(atomic_read(&adapter->psp.keys_lost), 0));
 		atomic_sub(deleted, &adapter->psp.keys_lost);
 		atomic_add(deleted, &adapter->psp.keys_removed);
+		atomic_sub(deleted, &adapter->psp.sadb_used);
 		break;
 	case VIRTCHNL2_OP_PSP_INSERT_KEYS:
 		if (idpf_is_psp_ena(adapter) && !ctlq_msg->chnl_retval)
-- 
2.56.0.679.gc527c65306-goog


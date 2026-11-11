Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426973;
	b=MZTNqwoRLrSHPz2EUoSTOsYGfTrcabVrGJ/QmYAKaEAhctLCLJR/bO/NqcvS8lo+gDNs
	 dCea6V74SCcFdCX9/owOreDlw4Uw6SmMmvRFR2P5MfgisfbIjSpuGCQviR2moCVQG+PqR
	 TOqgJPCiMb6nOkDnTGpW/ejFYJsLOwWXt8/gH6+UzqlEOy2kGbGCSQT6J1BwnnML0ODXD
	 4423T2oISgZ0UtY6XHutJ5/QI4sW9XOTcZdQtC5rOHxTZIb7XuB7dcyCrprXPULR/xOd4
	 rWeHc76ZddCQsXQ0wJ2jALOPkklFvqjVkZY87khiggm6uzmlpabhVugLeuDJXYlej2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KW38EDguzPKmx8VkeacRZuMXAWaeadLZ5kGyBS7By/A=;
	b=SKmWpuPsDr6RmEUcV7oXVyniA1dKm99T0q6IsNPHxs+WUFOZLs4mRp47Te3X7dcUFAJk
	 JOpJSAbKGByhSOJKuyTePA03bhK+MM3p+HNng0XRSnjxdO/M0N4qclqJxDpcMJsuMsMWv
	 RXGxSXwu87C8wTHpC+PWJh6LJl6RcxfQEiVRO0orFCvy5ZVG9UIVAOrM86KZDUIm+ntkb
	 ORq7k/nVQjdOb84IFloiT3v5Gi4wdIZhzdkpAuzWVOJWlvF8FIIi9CU6vGDArX7QEia7w
	 pZVdhhcDWAURU0X2cUrZwffrowG1o0mtG2120WzXFc8ofwzsX85jNnJTficcnxWQA0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIpbZRjj;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE995606A894
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE995606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIpbZRjj
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so549755166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426971; x=1795031771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KW38EDguzPKmx8VkeacRZuMXAWaeadLZ5kGyBS7By/A=;
        b=EIpbZRjj9fW0ykx0VoxHfhEmWWBdBdutHFh+r44V7BbCY9khO3Vg8HOCSjrNQG6cmF
         dLzfMZu7eY6Jd6tlMQTlrfhwMTuZXOmRpJL2EFnO7M4o0npml6Y5R6+E+iFQ/kP8+Jd0
         vmkndacwgXb/MqC8xwwCdNuOFqKUB9OZ5Vie1LkFhYL9mYTG5VqpXbpwqZOI28u0w519
         Hj+sJKNu3dzzRScqqt3N7A5Lo0+ZRojz+GPMrjCUfe0fQGz9cJIh2wqE9zwypEptuOuk
         VBYyj/Sr2RxaII91SKBHHRt89ySQSPpPRSB9C2veZ1KL11bkWBcvjrlwENWzZvHesws4
         nSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426971; x=1795031771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KW38EDguzPKmx8VkeacRZuMXAWaeadLZ5kGyBS7By/A=;
        b=kBuCJwi4MCdxZylhPN5mJAvZGImR97qvvfSxmbfhNAlUdaaNDtfN6VmvonONQ3Bh2o
         U1lI4ggl3qguh+TbFhlyZUHpv6HfC2ouUncqp7wNieht3BXQZ/ygc1jIFU29n9ob+BwW
         54DutsFjoyoi+08ON1jfAuateyQoQ/NGnuPf8tPhA/bOMejtFBXSwMMf1a5vyGSGXqtK
         XOHJnENLTFOrqhxz/bEAadpEm7UK+xm58X3r766PAxYgqOBLsjcYD4SicZcVgy+nBdkB
         2eSQsfj4worP84EJT7sFXH9+fMRdU9kVtngtg8LZtvTF6/BnWnzHwyBzeRKOYfx3yUFP
         IaiQ==
X-Forwarded-Encrypted: i=1; AL+hErFyabZoPYx6E7iUtsh2IAjAgFDeljLfzhVxXac4ShJu4XrlSE9jZz6yN6Vjdpbv8+lUe5YAqvUN70hneT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z98s6tHVzXQ7zwlHD4iKNaGiSoxqMXtTVUBH1wDVCbcT07Q/y9k
	bMn4wR3Fs3VPCCFid/nY9s84uDosZmaAPQktj+CBRbLk1Dgdo3RIyqMS
X-Gm-Gg: AYBFou1p2Yik4Ro5kCwv8D7D+rVyTclZwX5yvT4mFBNNU22OlA2JIgjNnRErjveeWS7
	dlBhZQXqof3IW2kgjupo62Dzz0iXEt4sF4Wqy59Ypxjwy7oM5Q2xLL6DFcjG/vVyFI+KpYtfpVx
	+j8GuB7ta6LgqFTMnfW1Ze3KeCKrFVC9y/oc5GFErH62NFv3RVWecArDSFfJ6lkG7DgoUaNGCjT
	ljOn6HWt3pJdK+/u9UHCJhBkAM65rCpqmhoYpqxtMP5TU/AWRsGej7jRM83cieXkKj08vDqj8fY
	t9baECeNbd3fqUQjLT4StFVAe2PRWi+mUeD76XV0CvqUrdHvLNjHFzb9ke5ezXfews7q7J5wCXz
	YZZ4vkyTaEsp0R1iNc4DQAaK0mvhew+cAFj4H4M5f1aBUqN0qVq9L4KTBAsOoOvznhxEobhJ9lU
	yKY4V8Uj3xncYRZX+98NQEPWCcg7f/vLu+Mr6YFcFMbBgkadR3rRSWb5YQhNw5ofRKLnoO5CFU8
	ckDoB4pAe31yCaHjfmL9aaOJ71J58m+GIC2chQE1cSFxeFFKPpAO/cB3Csyf8mDe//XIwf6847e
	PQd/m/KWoiEW6dywv8bWx7GRh3qcPFclmASZUMb7YRJkE/L9/MR4Pi9nPvFGp2I6spXUpaE3rZg
	g
X-Received: by 2002:a17:907:8dc9:b0:c29:f5d8:9c82 with SMTP id a640c23a62f3a-c5066cf9644mr299944166b.49.1794426971015;
        Wed, 11 Nov 2026 11:56:11 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a57085fsm264408166b.22.2026.11.11.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:56:10 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com,
	"Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
Subject: [PATCH wireless-next] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Wed, 11 Nov 2026 20:55:59 +0100
Message-ID: <20261111195559.160650-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111200714.7897345f@kait2en-mbp15-1>
References: <20261111200714.7897345f@kait2en-mbp15-1>
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

brcmf_proto_msgbuf_rx_trigger() reads the tx complete ring before the
control complete ring. When the firmware writes the tx status of a packet
shortly before the delete response of its flowring, the host can see the
response in one pass and the status only in the next one, after
brcmf_msgbuf_remove_flowring() has released the flowid. If a new flowring
got the flowid in the meantime, the status decrements its outstanding_tx,
which brcmf_msgbuf_schedule_txdata() and the trickle check in
brcmf_proto_msgbuf_rx_trigger() rely on. This happens whatever order the
firmware sends the two messages in.

Give each flowid a generation that goes up when the flowid is released,
and keep it in the tx pktid of every packet posted to the flowring. A tx
status of an older generation still releases its packet, but no longer
touches the counter.

Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---

Notes:
    Hi Andre,
    
    thanks for checking the trace. Here is the patch, on top of your
    [PATCH 4/4] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
    https://lore.kernel.org/all/20261107154810.89780-5-dev@deq.rocks/
    
    The generation goes up when the flowid is released, not when the delete
    is sent, so the debug message in your patch still counts the tx status
    that comes before the response. My tree for a BCM43684 access point
    bumps it when the delete is sent; this version is compile-tested only.
    Feel free to take it into the next version of your series.

 .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 8fd970571..9d8360d3e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -247,6 +247,7 @@ struct brcmf_msgbuf {
 	struct brcmf_commonring **commonrings;
 	struct brcmf_commonring **flowrings;
 	dma_addr_t *flowring_dma_handle;
+	u16 *flowring_gen;
 
 	u16 max_flowrings;
 	u16 max_submissionrings;
@@ -293,6 +294,7 @@ struct brcmf_msgbuf {
 struct brcmf_msgbuf_pktid {
 	atomic_t  allocated;
 	u16 data_offset;
+	u16 gen;	/* tx: flowring_gen of its flowid when posted */
 	struct sk_buff *skb;
 	dma_addr_t physaddr;
 };
@@ -559,6 +561,21 @@ static void brcmf_msgbuf_rxreorder(struct brcmf_if *ifp, struct sk_buff *skb)
 {
 }
 
+/*
+ * Called when a flowid is released. A tx status can still come for a packet
+ * of the old flowring after that: brcmf_proto_msgbuf_rx_trigger() reads the
+ * tx complete ring before the control complete ring, so it can see a delete
+ * response before a tx status the firmware wrote first. The flowid may have
+ * gone to a new flowring by then, and the status must not decrement the
+ * outstanding_tx of the new one.
+ */
+static void brcmf_msgbuf_flowring_next_gen(struct brcmf_msgbuf *msgbuf,
+					   u16 flowid)
+{
+	WRITE_ONCE(msgbuf->flowring_gen[flowid],
+		   msgbuf->flowring_gen[flowid] + 1);
+}
+
 static void
 brcmf_msgbuf_remove_flowring(struct brcmf_msgbuf *msgbuf, u16 flowid)
 {
@@ -566,6 +583,7 @@ brcmf_msgbuf_remove_flowring(struct brcmf_msgbuf *msgbuf, u16 flowid)
 	void *dma_buf;
 
 	brcmf_dbg(MSGBUF, "Removing flowring %d\n", flowid);
+	brcmf_msgbuf_flowring_next_gen(msgbuf, flowid);
 
 	dma_sz = BRCMF_H2D_TXFLOWRING_MAX_ITEM * BRCMF_H2D_TXFLOWRING_ITEMSIZE;
 	dma_buf = msgbuf->flowrings[flowid]->buf_addr;
@@ -768,6 +786,8 @@ static void brcmf_msgbuf_txflow(struct brcmf_msgbuf *msgbuf, u16 flowid)
 			bphy_err(drvr, "No PKTID available !!\n");
 			break;
 		}
+		msgbuf->tx_pktids->array[pktid].gen =
+			READ_ONCE(msgbuf->flowring_gen[flowid]);
 		ret_ptr = brcmf_commonring_reserve_for_write(commonring);
 		if (!ret_ptr) {
 			brcmf_msgbuf_get_pktid(msgbuf->drvr->bus_if->dev,
@@ -920,10 +940,13 @@ brcmf_msgbuf_process_txstatus(struct brcmf_msgbuf *msgbuf, void *buf)
 	struct sk_buff *skb;
 	u16 flow_ring_id;
 	u16 flowid;
+	u16 gen = 0;
 
 	tx_status = (struct msgbuf_tx_status *)buf;
 	idx = le32_to_cpu(tx_status->msg.request_id) - 1;
 	flow_ring_id = le16_to_cpu(tx_status->compl_hdr.flow_ring_id);
+	if (idx < msgbuf->tx_pktids->array_size)
+		gen = msgbuf->tx_pktids->array[idx].gen;
 	skb = brcmf_msgbuf_get_pktid(msgbuf->drvr->bus_if->dev,
 				     msgbuf->tx_pktids, idx);
 	if (!skb)
@@ -937,7 +960,9 @@ brcmf_msgbuf_process_txstatus(struct brcmf_msgbuf *msgbuf, void *buf)
 
 	set_bit(flowid, msgbuf->txstatus_done_map);
 	commonring = msgbuf->flowrings[flowid];
-	atomic_dec(&commonring->outstanding_tx);
+	/* not for a packet of a flowring that had the flowid before */
+	if (gen == READ_ONCE(msgbuf->flowring_gen[flowid]))
+		atomic_dec(&commonring->outstanding_tx);
 
 	brcmf_txfinalize(brcmf_get_ifp(msgbuf->drvr, tx_status->msg.ifidx),
 			 skb, true);
@@ -1325,6 +1350,7 @@ brcmf_msgbuf_process_flow_ring_delete_response(struct brcmf_msgbuf *msgbuf,
 
 	if (status) {
 		bphy_err(drvr, "Flowring deletion failed, code %d\n", status);
+		brcmf_msgbuf_flowring_next_gen(msgbuf, flowid);
 		brcmf_flowring_delete(msgbuf->flow, flowid);
 		return;
 	}
@@ -1681,6 +1707,10 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 			     msgbuf->max_flowrings);
 	if (!msgbuf->flowring_dma_handle)
 		goto fail;
+	msgbuf->flowring_gen = kzalloc_objs(*msgbuf->flowring_gen,
+					    msgbuf->max_flowrings);
+	if (!msgbuf->flowring_gen)
+		goto fail;
 
 	msgbuf->rx_dataoffset = if_msgbuf->rx_dataoffset;
 	msgbuf->max_rxbufpost = if_msgbuf->max_rxbufpost;
@@ -1732,6 +1762,7 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 		kfree(msgbuf->txstatus_done_map);
 		brcmf_msgbuf_release_pktids(msgbuf);
 		kfree(msgbuf->flowring_dma_handle);
+		kfree(msgbuf->flowring_gen);
 		if (msgbuf->ioctbuf)
 			dma_free_coherent(drvr->bus_if->dev,
 					  BRCMF_TX_IOCTL_MAX_MSG_SIZE,
@@ -1772,6 +1803,7 @@ void brcmf_proto_msgbuf_detach(struct brcmf_pub *drvr)
 				  msgbuf->ioctbuf, msgbuf->ioctbuf_handle);
 		brcmf_msgbuf_release_pktids(msgbuf);
 		kfree(msgbuf->flowring_dma_handle);
+		kfree(msgbuf->flowring_gen);
 		kfree(msgbuf);
 		drvr->proto->pd = NULL;
 	}
-- 
2.56.0


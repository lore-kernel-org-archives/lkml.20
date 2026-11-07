Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066505;
	b=0x2Es2ogtW+OFS7iNT9eo41Kmubrx42sdTgW/+oXlTd7939FBC49TbiEr6x6h4Q+7w7b
	 qzOgtLkAprwxZ/y4efkYvjfuGCb0994lQ+W7j8sIi+rxtV1qK6zJCV+xm409nFYzJV4cm
	 gSidO85RbKe2vKtQEbg9GT6i0mA+GawApN/CdP7neYDPoR8S/+CXVg6Fd9GvHFgQIc+K7
	 kh0ttrn9UAIyp4cbmcSc9nmP7EPavsIddPYUzrvliKEngkErl0LY4/nxFsG5h+692V7Dy
	 q8ngvWQ654M3pxyBUL0kPfpitc2VNPtXLhT33rC42mUzbJTQ+t21RwLgIXS5V5rfeew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066505;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yx7/+j7cYvfdKVAYN74kSmTnOjb0fnbvVNpzlqlvRHY=;
	b=tmrWqJhwB7cVjZPxWXETCTZRNuKsJyW1zrLhiUyvEm5IL6vzR5W6KUtjstJX4KiTWtfp
	 Ot6Of3O2eVg5ebcWUKUI5rX3oXwiu5Swn80nyiojdEY/2iVK9F8mEwTQKej8KkzET5OwZ
	 dX/iUfSqDxhkN6JC0VeCT+QoUDOMkjBzWHC23QTdDAR4Mtwmnebeqj11fUv8fBr0yvYrI
	 zBlm0kDEOXFyXqcS8x/vb3tOHM2/6VF1fLLn8/LSTqi1Q8eTIGf12OP9P3jBUz7geVAKA
	 tiHGJaKjljQiEWEQqMWSWookjVxS6XdomSM7dxoZ1MPVtqsnwNlQN31D8sv5GCft/aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=th3CJYcI;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CD5606D814;
	Sat,  7 Nov 2026 15:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CD5606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=th3CJYcI
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 10e1ed0d-1334-43db-b993-8a0a65cd2d62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066502;
	bh=lqxG51j8nuZCFr7wodzZYj42Ki/fIku3xbIJTm6YURI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=th3CJYcIW8GkoF6kWmF+sxXLAQUTLm5QaxK9Ae45XOb3jHvjHbjl3cf8PoL71rGYt
	 SIwlSBseuKyyVJVfp+JWugozY+lS4vu+PGsJmCTfWHU08NYL6BYQQROwhjUKYozMxr
	 TS9red59cTdW8A6ON56wcEf9PH5cTKmxQt9cKVvhzmJaIcaUTaac28jtsgsdfIT+zk
	 a2NBsVd7GCptU2t38khvEJS2hRe8jlZjtit1L8pjrqjEZtRZF807s+LBqy/qXmTZlI
	 +qxt6hcKvPFulGQwnL1PU1Kyl7jTXrzO3OQfHGC0FcTmdBzUQ68dk+Znkx+8Z+KEFV
	 GiCLVnfHWkzDg==
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Michael Reeves <michael.reeves077@gmail.com>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 4/4] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Sat,  7 Nov 2026 16:48:10 +0100
Message-ID: <20261107154810.89780-5-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154810.89780-1-dev@deq.rocks>
References: <20261107154810.89780-1-dev@deq.rocks>
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

The BCM4377 firmware returns the tx status of queued packets only when
it gets the flowring delete request. brcmf_msgbuf_delete_flowring()
waits up to 100 ms for them before it sends the request, so every
disconnect logs a timeout, and the cleared counter goes below zero when
the status arrives.

The race the wait was added for in commit 0fa24196e425 ("wifi: brcmfmac:
fix continuous 802.1x tx pending timeout error") is covered by
RING_CLOSING since commit 09be7546a602 ("wifi: brcmfmac: fix scheduling
while atomic issue when deleting flowring"), and late tx status still
releases the packet. Send the delete right away and reset the counter
when the ring is created.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 8e5c697e7f1..a9ccf647f9a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -73,7 +73,6 @@
 #define BRCMF_MSGBUF_TRICKLE_TXWORKER_THRS	32
 #define BRCMF_MSGBUF_UPDATE_RX_PTR_THRS		48
 
-#define BRCMF_MAX_TXSTATUS_WAIT_RETRIES		10
 
 struct msgbuf_common_hdr {
 	u8				msgtype;
@@ -645,6 +644,7 @@ brcmf_msgbuf_flowring_create_worker(struct brcmf_msgbuf *msgbuf,
 	brcmf_commonring_config(msgbuf->flowrings[flowid],
 				BRCMF_H2D_TXFLOWRING_MAX_ITEM,
 				BRCMF_H2D_TXFLOWRING_ITEMSIZE, dma_buf);
+	atomic_set(&msgbuf->flowrings[flowid]->outstanding_tx, 0);
 
 	commonring = msgbuf->commonrings[BRCMF_H2D_MSGRING_CONTROL_SUBMIT];
 	brcmf_commonring_lock(commonring);
@@ -1330,6 +1330,10 @@ brcmf_msgbuf_process_flow_ring_delete_response(struct brcmf_msgbuf *msgbuf,
 	}
 	brcmf_dbg(MSGBUF, "Flowring %d Delete response status %d\n", flowid,
 		  status);
+	if (atomic_read(&msgbuf->flowrings[flowid]->outstanding_tx))
+		brcmf_dbg(MSGBUF, "Flowring %d deleted with %d tx status outstanding\n",
+			  flowid,
+			  atomic_read(&msgbuf->flowrings[flowid]->outstanding_tx));
 
 	brcmf_msgbuf_remove_flowring(msgbuf, flowid);
 }
@@ -1471,23 +1475,16 @@ void brcmf_msgbuf_delete_flowring(struct brcmf_pub *drvr, u16 flowid)
 	void *ret_ptr;
 	u8 ifidx;
 	int err;
-	int retry = BRCMF_MAX_TXSTATUS_WAIT_RETRIES;
 
-	/* make sure it is not in txflow */
+	/*
+	 * Make sure txflow posts nothing more to the ring. The firmware returns
+	 * the tx status of the posted packets when it deletes the ring, before
+	 * it sends the delete response.
+	 */
 	brcmf_commonring_lock(commonring_del);
 	flow->rings[flowid]->status = RING_CLOSING;
 	brcmf_commonring_unlock(commonring_del);
 
-	/* wait for commonring txflow finished */
-	while (retry && atomic_read(&commonring_del->outstanding_tx)) {
-		usleep_range(5000, 10000);
-		retry--;
-	}
-	if (!retry) {
-		brcmf_err("timed out waiting for txstatus\n");
-		atomic_set(&commonring_del->outstanding_tx, 0);
-	}
-
 	/* no need to submit if firmware can not be reached */
 	if (drvr->bus_if->state != BRCMF_BUS_UP) {
 		brcmf_dbg(MSGBUF, "bus down, flowring will be removed\n");

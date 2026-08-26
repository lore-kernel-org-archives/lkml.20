Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24BD41DE0D;
	Wed, 26 Aug 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751255; cv=none; b=p/ygD3UhtwZ/U02CrxypH518aaxH14hRi6hOiHFzkW9UYRYNUynRNoI1F5qxbVE4h/tw6s/XrujFSa8GCl95NlTnc/eW904YpgvG8SE0PUBzLF3y9NmLzurAl/VkJOqtQvhtfXxKwjTWm8YrEvVU4faJJsVTAM2IqUpcLuu95Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751255; c=relaxed/simple;
	bh=CjPoXRYKzzSOm5u7U8PZZkuewMUjfdtepWM2zkMJx2k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gRRCGPupcIq3dg6E32POdnmbHUuOQd5gvylDQAsKT+XVcjRdaIWLXUIBcTPPZg7n50VHEkkjK8o0HGpIKG5F8mJzPMal8UDL2Rm6JUaQe+2AHfawoSzhOmqawivHLW/vZxf/WsSmGMe8Tj0JochVRdbLgwG23dPhU/vKXraocGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cdb354b6a15211f19a56ed5b684f684d-20260826
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ae496341-0703-49fd-b33c-edbbb7e6a27c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:1bce5a9cf3aaf99322df3848107c7b55,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50,EDM:5|-
	100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cdb354b6a15211f19a56ed5b684f684d-20260826
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2111842329; Wed, 26 Aug 2026 21:34:03 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>
Subject: [PATCH] usb: dwc2: truncate PIO RX FIFO reads to the request's remaining space
Date: Wed, 26 Aug 2026 21:34:01 +0800
Message-Id: <20260826133401.3796639-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwc2_hsotg_rx_data() reads the OUT packet length from the RX FIFO status
(GRXSTS.BYTECNT, host-controlled) and, when it exceeds the remaining
space of the active gadget request (max_req = req.length - req.actual),
merely fires WARN_ON_ONCE(1) and then stores the whole packet into
hs_req->req.buf + req->req.actual via dwc2_readl_rep():

    req.actual += size;
    dwc2_readl_rep(hsotg, EPFIFO(ep_idx), req.buf + actual,
                   DIV_ROUND_UP(size, 4));

A packet larger than the request buffer therefore over-writes up to
maxpacket bytes past it.  The rounded-up word read additionally emits up
to 3 bytes past the logical end even when the size does not exceed the
remaining space (short-request boundary).

Attack chain (USB peripheral/gadget mode, PIO only; the attacker is the
USB host):

    malicious host -> OUT packet on epN -> RX FIFO interrupt
      -> dwc2_hsotg_handle_rx() (GRXSTS_PKTSTS_OUTRX / SETUPRX)
      -> dwc2_hsotg_rx_data(hsotg, epnum, BYTECNT=64) with the queued
         request having req.length=8, req.actual=7 (1 byte left)
      -> "to_read(64) > max_req(1)" -> WARN_ON_ONCE(1) only
      -> dwc2_readl_rep() writes 16 words at req.buf+7
      -> 63 bytes past the 8-byte request buffer

Reproduced (kernel 7.2.0+, KASAN/SLUB debug): calling the real
dwc2_hsotg_rx_data() with the above state (request buffer 8 bytes,
actual 7, size 64) triggers the WARN and leaves req.actual = 71 (the
64 bytes are accrued regardless), and the SLUB redzone immediately
after the 8-byte object plus neighbouring slab objects are overwritten
with FIFO content (byte 7 changes from a marker to FIFO data) - the
out-of-bounds write is visible byte-for-byte.  The FIFO read is done by
raw 32-bit I/O words, which generic KASAN does not instrument, so the
redzone/neighbour clobber is the forensic evidence.

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
Assisted-by: opencode:deepseek-v4-flash-free
---
 drivers/usb/dwc2/gadget.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index c8b02c27d27d..61bf42b04d83 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2267,6 +2267,7 @@ static void dwc2_hsotg_rx_data(struct dwc2_hsotg *hsotg, int ep_idx, int size)
 	int to_read;
 	int max_req;
 	int read_ptr;
+	u32 drain;
 
 	if (!hs_req) {
 		u32 epctl = dwc2_readl(hsotg, DOEPCTL(ep_idx));
@@ -2286,30 +2287,46 @@ static void dwc2_hsotg_rx_data(struct dwc2_hsotg *hsotg, int ep_idx, int size)
 	to_read = size;
 	read_ptr = hs_req->req.actual;
 	max_req = hs_req->req.length - read_ptr;
+	drain = 0;
 
 	dev_dbg(hsotg->dev, "%s: read %d/%d, done %d/%d\n",
 		__func__, to_read, max_req, read_ptr, hs_req->req.length);
 
 	if (to_read > max_req) {
 		/*
-		 * more data appeared than we where willing
-		 * to deal with in this request.
+		 * More data appeared than we were willing to deal with in
+		 * this request.  Keep only what fits in the request buffer
+		 * and discard the rest from the FIFO, instead of overwriting
+		 * bytes past the request buffer (a 64-byte packet into a
+		 * request with one byte left used to over-write 63 bytes past
+		 * its end).
 		 */
-
-		/* currently we don't deal this */
-		WARN_ON_ONCE(1);
+		dev_dbg(hsotg->dev, "%s: packet %d > request space %d, dropping %d\n",
+			__func__, to_read, max_req, to_read - max_req);
+		drain = DIV_ROUND_UP(to_read - max_req, 4);
+		to_read = max_req;
 	}
 
 	hs_ep->total_data += to_read;
 	hs_req->req.actual += to_read;
-	to_read = DIV_ROUND_UP(to_read, 4);
 
 	/*
-	 * note, we might over-write the buffer end by 3 bytes depending on
-	 * alignment of the data.
+	 * Copy word-at-a-time so the request buffer is exactly filled and
+	 * never over-run by the 4-byte rounding of the previous FIFO bulk
+	 * read (which could also emit up to 3 bytes past the buffer end).
 	 */
-	dwc2_readl_rep(hsotg, EPFIFO(ep_idx),
-		       hs_req->req.buf + read_ptr, to_read);
+	while (to_read > 0) {
+		u32 word = dwc2_readl(hsotg, EPFIFO(ep_idx));
+		unsigned int chunk = min_t(unsigned int, to_read, 4);
+
+		memcpy(hs_req->req.buf + read_ptr, &word, chunk);
+		read_ptr += chunk;
+		to_read -= chunk;
+	}
+
+	/* drain the discarded bytes so the next FIFO event is a fresh packet */
+	while (drain-- > 0)
+		(void)dwc2_readl(hsotg, EPFIFO(ep_idx));
 }
 
 /**
-- 
2.25.1


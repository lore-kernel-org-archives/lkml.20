Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153DB3F1041;
	Fri, 28 Aug 2026 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906125; cv=none; b=jZK+fSXXRVhniKyoNSgjtxX3/nFYsgsOae4lGfO3PgqShfNH+QoHZ8MFOTaP8MDhQLe/pp4HUZQ6LeYtqu+PjgJvVOxnLzXtYmtGVSvtPkvLQmDxLGUVY3/eAwwQXVSaoc6DgliKmTeoHs9MpCkQnq1T88ThdA0K7a4iXYbLTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906125; c=relaxed/simple;
	bh=ZO+LkM0dkO22JWA0FjU9pp94bR2+COyhsRYmBwN+KzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g8UMxtDQeIyrbIUwVxh2No8wA8uLlGqeVVv1FEQFspBNODxSxJxqL5XjIRLgXvc4QlzCoL+QsfWD38E3VQdA+mnOApuy5Y/fJlW/NFMd+cAf+oHBsqQdzIBdn4D/WT9zyB6XhSOaXtCFMJ9MnsPala2rFZPort1rN24FST52bmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 618c94b8a2bb11f19a56ed5b684f684d-20260828
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d3c2faac-2398-4f14-9e11-70dbef2ada3c,IP:15,
	URL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:15
X-CID-INFO: VERSION:1.3.19,REQID:d3c2faac-2398-4f14-9e11-70dbef2ada3c,IP:15,UR
	L:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:15
X-CID-META: VersionHash:7db8b62,CLOUDID:36576e26400a3f964a10286cc98ed3b4,BulkI
	D:2608281635153C6BL0I1,BulkQuantity:0,SF:17|19|66|78|102|127|136|850|865|8
	98,TC:nil,Content:0|15|50,EDM:5|-100,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,
	QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
	,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 618c94b8a2bb11f19a56ed5b684f684d-20260828
X-User: wangyan01@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <wangyan01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 485604598; Fri, 28 Aug 2026 16:35:10 +0800
From: Wang Yan <wangyan01@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: haoxiang_li2024@163.com,
	kees@kernel.org,
	wangyan01@kylinos.cn,
	lihaofeng@kylinos.cn,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: fsl_qe_udc: bound RX frame copies to the request's remaining space
Date: Fri, 28 Aug 2026 16:34:45 +0800
Message-Id: <20260828083445.221036-1-wangyan01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qe_ep_rxframe_handle() and ep_req_rx() copy the received USB frame into
the active gadget request with

    cp = req->req.buf + req->req.actual;
    if (cp) {
        memcpy(cp, pframe->data, fsize);
        req->req.actual += fsize;
        if (fsize < ep->ep.maxpacket || req->req.actual >= req->req.length)
            /* complete */
    }

where fsize = frame_get_length(pframe) = hardware-reported frame length
minus USB_CRC_SIZE (2).  The length comes from the received OUT packet
on the wire (host-controlled for a device in peripheral mode), while the
request buffer is sized by the gadget driver.  Nothing guarantees
fsize <= req->req.length - req->req.actual, so a frame bigger than the
request's remaining space is memcpy()'d past the buffer, and
req->req.actual is bumped past req->req.length.

Attack chain (device in USB gadget/peripheral mode; attacker is the USB
host):

    malicious host -> OUT packet on a QE/CPM endpoint
      -> qe_udc_irq() -> rx_irq() -> qe_ep0_rx()/qe_ep_rx()
      -> ep_rx_tasklet() -> qe_ep_rxframe_handle() (or ep_req_rx())
      -> fsize = packet length - 2 (e.g. 64 for a 66-byte frame)
      -> request has req.length = 64, req.actual = 63 (1 byte left)
      -> memcpy(req.buf + 63, pframe->data, 64)
      -> 63 bytes past the request buffer

The same correction applies to the ep_req_receive() -> ep_req_rx()
path.  The upstream requests are queued by the gadget layer (ep_queue);
nothing in __qe_ep_queue() guarantees the buffer can absorb one max
packet, so the short-request state is reachable with ordinary gadgets.

Reproduced deterministically (user-space ASAN re-extraction of the
exact source path; the fsl_qe_udc driver cannot be built/loaded on
x86_64 because USB_FSL_QE requires FSL_SOC/QUICC_ENGINE/CPM and
!64BIT): with req.buf = 64 bytes, req.actual = 63 and fsize = 64,
both extracted paths (oepparsing the kernel lines for
qe_ep_rxframe_handle() :914 and ep_req_rx() :1521) fail under
AddressSanitizer with

    ERROR: AddressSanitizer: heap-buffer-overflow ... WRITE of size 64
    located 0 bytes after 64-byte region

while the same code with the remaining-capacity check added produces no
ASAN report at all.

Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
Assisted-by: opencode:deepseek-v4-flash-free
---
 drivers/usb/gadget/udc/fsl_qe_udc.c | 64 ++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 603c77ff129f..bed7edd293a5 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -911,16 +911,37 @@ static int qe_ep_rxframe_handle(struct qe_ep *ep)
 
 		cp = (u8 *)(req->req.buf) + req->req.actual;
 		if (cp) {
-			memcpy(cp, pframe->data, fsize);
-			req->req.actual += fsize;
-			if ((fsize < ep->ep.maxpacket) ||
-					(req->req.actual >= req->req.length)) {
+			if (req->req.actual >= req->req.length ||
+			    fsize > req->req.length - req->req.actual) {
+				/*
+				 * The host sent a frame larger than the
+				 * request can hold; drop it and complete with
+				 * -EOVERFLOW instead of copying past the
+				 * request buffer.
+				 */
+				dev_err(ep->udc->dev,
+					"%s: rx frame %u exceeds remaining %u\n",
+					ep->name, fsize,
+					req->req.length - req->req.actual);
+				qe_frame_clean(pframe);
 				if (ep->epnum == 0)
 					ep0_req_complete(ep->udc, req);
 				else
-					done(ep, req, 0);
+					done(ep, req, -EOVERFLOW);
 				if (list_empty(&ep->queue) && ep->epnum != 0)
 					qe_eprx_nack(ep);
+			} else {
+				memcpy(cp, pframe->data, fsize);
+				req->req.actual += fsize;
+				if ((fsize < ep->ep.maxpacket) ||
+						(req->req.actual >= req->req.length)) {
+					if (ep->epnum == 0)
+						ep0_req_complete(ep->udc, req);
+					else
+						done(ep, req, 0);
+					if (list_empty(&ep->queue) && ep->epnum != 0)
+						qe_eprx_nack(ep);
+				}
 			}
 		}
 	}
@@ -1518,15 +1539,36 @@ static int ep_req_rx(struct qe_ep *ep, struct qe_req *req)
 
 				cp = (u8 *)(req->req.buf) + req->req.actual;
 				if (cp) {
-					memcpy(cp, pframe->data, fsize);
-					req->req.actual += fsize;
-					if ((fsize < ep->ep.maxpacket)
-						|| (req->req.actual >=
-							req->req.length)) {
+					if (req->req.actual >= req->req.length ||
+					    fsize > req->req.length - req->req.actual) {
+						/*
+						 * The host sent a frame
+						 * larger than the request
+						 * can hold; drop it and
+						 * complete with -EOVERFLOW
+						 * instead of copying past
+						 * the request buffer.
+						 */
+						dev_err(udc->dev,
+							"%s: rx frame %u exceeds remaining %u\n",
+							ep->name, fsize,
+							req->req.length - req->req.actual);
+						qe_frame_clean(pframe);
 						finish_req = 1;
-						done(ep, req, 0);
+						done(ep, req, -EOVERFLOW);
 						if (list_empty(&ep->queue))
 							qe_eprx_nack(ep);
+					} else {
+						memcpy(cp, pframe->data, fsize);
+						req->req.actual += fsize;
+						if ((fsize < ep->ep.maxpacket)
+							|| (req->req.actual >=
+								req->req.length)) {
+							finish_req = 1;
+							done(ep, req, 0);
+							if (list_empty(&ep->queue))
+								qe_eprx_nack(ep);
+						}
 					}
 				}
 				qe_ep_toggledata01(ep);
-- 
2.25.1


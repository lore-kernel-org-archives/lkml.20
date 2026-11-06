Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952121;
	b=zrBNhUL45DeNUT/Wpq2DU/6a1mC6ww7H/pULFWYXYu0wRJ9Dis5Y70BT1QVuJrOpvKix
	 LEA7rttWrKIJ8I/gj9u1evKdu0B5+g4OjayeeFLhhYG8TxXBrrqMPz5GJiIkRgfP2DzZb
	 eGoehNP/kYCR2BYmMgpTWsXadKBwKGeWQ7pjO4jx1AsyrG9qilcz08bpTZRZ0hafvOAzN
	 zHL4o1dopMc84NywBLtLGd+iTGXXEMUSugXhEf1699ykHV2sLM3Rb+I/cdIrq11kZ2TfS
	 6bwKwvANyCX53QkmWOCVfKxTI8KctQnQ2bvC7FpGBWMCcoRSR6DBu7OQsRxsrxyezZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952121;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=czHTZkJ3TKYgESCxC79vT1Kt+Z4QQw2HxdI0thihZ/8=;
	b=ukVmQXk+mC3CkmGWdwK3a+uFv7bk9323lCO9xpglTlBPcPzmRp1ui2e8lIeFC61EVDgL
	 4jN4bVzVjnb2QnOAzQB9mcNQfAJpwb+pMkHZqKpljXAJjv97P/jQW82k5FZb5qiFJKtHr
	 fiEHWuHLq3y1BQAufahC4HnB17FFSsWvAzuvLOwfPUmd/l0/LXHFVrNesyoA0ykOU1RLv
	 3d3aimPBXjweAsVn7B9/8PNzz/X8njTyg1FtYuKbTaVRc0VFN3s/vasr4cwnsc9Bybq5+
	 FMLQnkJnEfsEq7wFjafVV5FAFqF0iKldeLrlpT80+0QkvrViz8miRMVMG9ttoC3TKAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b="X3m/64cs";
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415CA606A326;
	Fri,  6 Nov 2026 08:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 415CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=X3m/64cs
X-UUID: 538cba94d9b811f18dc8c9802ae25ab1-20261106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=czHTZkJ3TKYgESCxC79vT1Kt+Z4QQw2HxdI0thihZ/8=;
	b=X3m/64csSEQoss9lEcl0w3aRMXYmloJYOzZ6MV/zpobmSrH0RhDkbhq8h4gaVQSiQbpwnwgsrWQmfeSiRgyB/WkcvgGLY1Kh/6kYCbudzNDw9dqYeD/UCkJOamx5gVTlPxe/D5Ww2a1XYAylzFnl57YCyTtYOLq11e4ap0veDEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b8aa4436-e99a-4e2a-8b13-f887b940c3b0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:9e64dace-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 538cba94d9b811f18dc8c9802ae25ab1-20261106
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <fangwen.deng@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 904909559; Fri, 06 Nov 2026 16:01:52 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Nov 2026 16:01:51 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Nov 2026 16:01:50 +0800
From: Fangwen Deng <fangwen.deng@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jarried.lin@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<justin.yeh@mediatek.com>, Fangwen Deng <fangwen.deng@mediatek.com>
Subject: [PATCH] usb: mtu3: cancel EP0 requests to prevent use-after-free
Date: Fri, 6 Nov 2026 16:00:58 +0800
Message-ID: <20261106080140.342107-1-fangwen.deng@mediatek.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain

mtu3_ep0_dequeue() always returns -EINVAL and leaves the request on
mep->req_list without unlinking or completing it, so an EP0 request
can never be cancelled.

FunctionFS assigns its temporary read buffer to ep0req and waits in
__ffs_ep0_queue_wait(). When that wait is interrupted by a signal it
calls usb_ep_dequeue(), does not check the return value, and its
caller ffs_ep0_read() frees the buffer on every exit path. With
-EINVAL returned the request stays queued and MTU3 still owns it.
When the host then sends the OUT data stage, ep0_rx_state() writes
the received bytes through the stale req->buf, giving the host a
content-controlled write into freed kernel memory. That corrupts
whichever object reuses the slab and can panic the kernel.

Implement mtu3_ep0_dequeue() following mtu3_gadget_dequeue() but
without QMU flush/start since EP0 uses PIO: validate the request
under mtu->lock, unlink it once and give it back with -ECONNRESET,
so ownership of the buffer returns to FunctionFS before it is freed.

Cancelling the request that backed the data stage also leaves the
transfer unable to finish, so retire the aborted transaction with a
protocol stall. That returns ep0_state to SETUP and stops a later
ep0_queue() from reading this transaction's leftover FIFO data into
the next request's buffer. The stall is skipped when the controller
is already powered down or no data stage is in flight.

The same stub is why functionfs_unbind() cannot cancel a pending EP0
request, which deadlocks against the FunctionFS thread holding
ffs->mutex.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Signed-off-by: Fangwen Deng <fangwen.deng@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 55 ++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index e4fd1bb14a55..73a1af8b6c65 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -857,8 +857,59 @@ static int mtu3_ep0_queue(struct usb_ep *ep,
 
 static int mtu3_ep0_dequeue(struct usb_ep *ep, struct usb_request *req)
 {
-	/* we just won't support this */
-	return -EINVAL;
+	struct mtu3_ep *mep;
+	struct mtu3_request *mreq = NULL;
+	struct mtu3_request *r = NULL;
+	struct mtu3 *mtu;
+	unsigned long flags;
+	int ret = 0;
+
+	if (!ep || !req)
+		return -EINVAL;
+
+	mep = to_mtu3_ep(ep);
+	mtu = mep->mtu;
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	mreq = to_mtu3_request(req);
+
+	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);
+
+	list_for_each_entry(r, &mep->req_list, list) {
+		if (r == mreq)
+			break;
+	}
+	if (r != mreq) {
+		dev_info(mtu->dev, "req=%p not queued to %s\n", req, ep->name);
+		ret = -EINVAL;
+		goto done;
+	}
+
+	if (mreq->mep != mep) {
+		dev_info(mtu->dev, "mreq->mep != mep, not queued.\n");
+		ret = -EINVAL;
+		goto done;
+	}
+
+	trace_mtu3_gadget_dequeue(mreq);
+
+	/*
+	 * The cancelled request backed the current control transfer, so abort it
+	 * with an EP0 STALL and reset ep0_state to SETUP to avoid FIFO leftovers
+	 * leaking into the next request. Clear happens in the EP0 ISR (W1C
+	 * EP0_SENTSTALL), so EP0 won't stay halted. Do this before
+	 * mtu3_req_complete() drops mtu->lock to avoid stalling a new transfer.
+	 */
+	if (mtu->is_active && mtu->ep0_state != MU3D_EP0_STATE_SETUP)
+		ep0_stall_set(mtu->ep0, true, 0);
+
+	/* ep0 uses PIO, so no QMU to flush/restart as mtu3_gadget_dequeue() does */
+	mtu3_req_complete(mep, req, -ECONNRESET);
+
+done:
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	return ret;
 }
 
 static int mtu3_ep0_halt(struct usb_ep *ep, int value)
-- 
2.45.2


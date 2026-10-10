Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88322D785;
	Sat, 10 Oct 2026 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602751; cv=none; b=OnGvt4Wgpupimt+1hJxopWbasg86zohVUA4bAqK8gK4k8EH/oqo3B3iAmMEIenVNW1dG5trR709hN7K5mkQDIIowHGu7mkSJDAR4kC/Dr22EjNFyW3SprjJU2dcOmJk/z4Ic/2P/4lg3xq9ZmaenJriKRmbRj53LptwiCFOwDVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602751; c=relaxed/simple;
	bh=HrGGaPk5vp1UuC4fkskhVxdsl59AtLEfPgSM3rIAhdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jg9Q1uHAdzNlfRAZvOvbdPczZxKQZ6s0FLfBUOgJB/7Uvuex+U3Z49IO3VPk4Qku7aeMqLtEC6yGKg5LLtBvd3zZwXlDJll/7bB0BQ1OSOe8NS4Qv651jCDium+knbmqDYxYU3qwfioF2u3O0JBhJ49rAm5720oWqlDcpOkI+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 41903f50c45a11f19a56ed5b684f684d-20261010
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a8cda5dd-8f2f-4b56-a2f2-c4ac2c4fea6a,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:3838abe37e352a973a1cc4bb182de6c6,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 41903f50c45a11f19a56ed5b684f684d-20261010
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 160459551; Sat, 10 Oct 2026 11:25:35 +0800
From: Jie Deng <dengjie03@kylinos.cn>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: [PATCH] usb: xhci: Add XHCI_TT_SOFT_RETRY quirk for transaction errors on TT devices
Date: Sat, 10 Oct 2026 11:25:18 +0800
Message-Id: <20261010032518.2040608-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Low-speed devices behind a high-speed hub on some xHCI controllers stop
working after repeated lsusb -v: a transient USB transaction error on a
bulk/interrupt endpoint is followed by a hard reset recovery where every
command completes successfully (Reset EP with TSP=0 and Set TR Deq both
return COMP_SUCCESS), but the first new split transaction issued after
the restart fails again.  After two such cycles the hub reports a port
connection change and the device drops off.

The affected silicon does not honor the xHCI spec (4.6.8) requirement
that a Reset Endpoint command with TSP=0 "reset any USB2 split
transaction state associated with the endpoint": the stale split state
survives the reset, so the next split transaction carries the old
transaction's identity and can never match the hub TT state, cleared
or not.  The soft reset path (TSP=1), which per the spec maintains the
split transaction state and retries the last transaction on the next
doorbell, recovers these transient errors on the first retry.

Add a XHCI_TT_SOFT_RETRY quirk: when set, bulk/interrupt endpoints
behind a TT hub may use the existing soft retry machinery to retry a
USB Transaction Error (completion code 4) in place instead of going
through the hard reset path.  Platforms without the quirk keep the
exact previous behavior.  Isochronous and control endpoints never
enter this function, and the existing MAX_SOFT_RETRY bound still falls
back to the hard reset path for persistent errors.  The quirk is meant
to be set by platform code for controllers with this silicon bug; no
in-tree platform code sets it yet.

On the affected controller every error reports comp code 4 (USB
Transaction Error), tt_info 0x301 and err_count 1, i.e. each in-place
retry succeeds immediately and the fallback is never taken.

Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
---
 drivers/usb/host/xhci-ring.c | 14 +++++++++++++-
 drivers/usb/host/xhci.h      |  7 +++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..46ac1a52f6ed 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2540,9 +2540,21 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->urb->actual_length = sum_trb_lengths(td, ep_trb);
 		goto finish_td;
 	case COMP_USB_TRANSACTION_ERROR:
+		/*
+		 * Devices behind a TT hub normally skip the soft retry: retrying
+		 * a split transaction usually requires clearing the hub TT buffer
+		 * first, so the hard reset path handles the error.  Controllers
+		 * that cannot properly reset the split transaction state with a
+		 * hard reset (XHCI_TT_SOFT_RETRY) recover these transient errors
+		 * by retrying the same transaction in place instead.  The soft
+		 * reset preserves the transfer state and the retry completes,
+		 * while the hard reset path abandons the split, the first new
+		 * split fails again and the low-speed link eventually collapses.
+		 */
 		if (xhci->quirks & XHCI_NO_SOFT_RETRY ||
 		    (ep->err_count++ > MAX_SOFT_RETRY) ||
-		    le32_to_cpu(slot_ctx->tt_info) & TT_SLOT)
+		    (le32_to_cpu(slot_ctx->tt_info) & TT_SLOT &&
+		     !(xhci->quirks & XHCI_TT_SOFT_RETRY)))
 			break;
 
 		td->status = 0;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..df4702c5e8a4 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1647,6 +1647,13 @@ struct xhci_hcd {
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
+/*
+ * Controller cannot reset the USB2 split transaction state with a Reset
+ * Endpoint command (TSP=0) as required by xHCI spec 4.6.8.  Recover
+ * transaction errors on devices behind a TT hub by soft retry (TSP=1)
+ * instead of the hard reset path.
+ */
+#define XHCI_TT_SOFT_RETRY	BIT_ULL(51)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.25.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292880;
	b=0cWdMmLV75gpZaYE24cOhWm+o282KiGYPx+HmfJjDiUaem7zKW7V1f14vgOM+E8rJXqx
	 CTgDNaBa1DLaWffnzGBpuKaAWugUHYFuSKv7FbmfPb0cKtA1PgNjeC0LR5UwAHbQZDPjm
	 eYgg4wY+1J+DFH+h/FTz1jGgbUcnWK33c82EduLXsjUTRCPL8OnSLF+T1H4W5dALDjm46
	 sBTFdojG+xVY840bg133JrEjGPZEE99CeaNLFpjxbIaOOeYck0wJCT9n9kbBXm9mxv4NO
	 Uz/bz0u6XgF40LY3bURkDXN1k9Jv+LoRIN8rfp5WHIaiWcExWIwP/8Ml/qfwCm8pzqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292880;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Abexx2K7McdUbKrXi2ljZfA52ER9C+0Whk6f0ct7oqQ=;
	b=KEuDG562q23qYKgitK2IkD9dYErAPzDtvnM6vmrf5LI9F6abJ2Dt3PknvV+DtElzvJVw
	 A1izm3mCYPb+/wwI52lndynQnSuh87YYRmq28MvddKWqRBy4O1TWMBr4ZeRmCx7dY9yZD
	 S9GcECb4qh95NL82uZr+8pmmHupfY0YfjSWe00bwwrhWxFtlgHlepPYfXhtbH5xy0e3ZI
	 RUpKAqvhWqeGxTePlQ5998wP4+lKRegEnxyVk8nvQ6HMB42c+JIKfN2lpYDBCY2Opq23H
	 vu7IGUOf7v2EVYByqQo1ugseBH8w4ogwLLTKZPw0jyGkoRWM/A3BSC44n2xyh6KzIYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sa7AJuvE;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2667460A2626;
	Tue, 10 Nov 2026 06:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2667460A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sa7AJuvE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=sa7AJuvE62NS2gRR7Gg4tKD1OjplSWHHf6ffz/dqDQjLZm4M16ezIYXqIgHN6BehbDul6/W01vWN+
	 LGdr7o40/PMeyMK0B8Q6Y6ASihQRf7zoMHECG/h3K5d2YABRHnzETDfjXb0TnEfLV/Xk66YjXSrCPV
	 TTgFn7JLT+iVK4D8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af2bc8842d-97bd9;
	Tue, 10 Nov 2026 14:41:16 +0800 (CST)
X-RM-TRANSID:2ee36af2bc8842d-97bd9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa115;
	Tue, 10 Nov 2026 14:41:16 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa115
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/22] usb: host: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:54 +0000
Message-ID: <20261110064105.20335-12-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/host/ehci-brcm.c   | 2 +-
 drivers/usb/host/ehci-sched.c  | 2 +-
 drivers/usb/host/fhci-q.c      | 2 +-
 drivers/usb/host/fhci-tds.c    | 8 ++++----
 drivers/usb/host/octeon-hcd.c  | 2 +-
 drivers/usb/host/ohci-q.c      | 2 +-
 drivers/usb/host/ohci-sa1111.c | 2 +-
 drivers/usb/host/xhci-dbgcap.h | 2 +-
 drivers/usb/host/xhci-mem.c    | 4 ++--
 drivers/usb/host/xhci-mtk.c    | 2 +-
 drivers/usb/host/xhci-mtk.h    | 2 +-
 drivers/usb/host/xhci-port.h   | 4 ++--
 drivers/usb/host/xhci-rcar.c   | 2 +-
 drivers/usb/host/xhci.h        | 2 +-
 14 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index 5e3156f94cc6..d1f363c7d8d7 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -42,7 +42,7 @@ static inline void ehci_brcm_wait_for_sof(struct ehci_hcd *ehci, u32 delay)
  * ehci_brcm_hub_control
  * The EHCI controller has a bug where it can violate the SOF
  * interval between the first two SOF's transmitted after resume
- * if the resume occurs near the end of the microframe. This causees
+ * if the resume occurs near the end of the microframe. This causes
  * the controller to detect babble on the suspended port and
  * will eventually cause the controller to reset the port.
  * The fix is to Intercept the echi-hcd request to complete RESUME and
diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
index 57d07d1c2dfa..ff59524f8d2b 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -315,7 +315,7 @@ static int __maybe_unused same_tt(struct usb_device *dev1,
 static const unsigned char
 max_tt_usecs[] = { 125, 125, 125, 125, 125, 125, 30, 0 };
 
-/* carryover low/fullspeed bandwidth that crosses uframe boundries */
+/* carryover low/fullspeed bandwidth that crosses uframe boundaries */
 static inline void carryover_tt_bandwidth(unsigned short tt_usecs[8])
 {
 	int i;
diff --git a/drivers/usb/host/fhci-q.c b/drivers/usb/host/fhci-q.c
index 669c240523fe..b13ad02454e1 100644
--- a/drivers/usb/host/fhci-q.c
+++ b/drivers/usb/host/fhci-q.c
@@ -208,7 +208,7 @@ void fhci_urb_complete_free(struct fhci_hcd *fhci, struct urb *urb)
 }
 
 /*
- * caculate transfer length/stats and update the urb
+ * calculate transfer length/stats and update the urb
  * Precondition: irqsafe(only for urb-?status locking)
  */
 void fhci_done_td(struct urb *urb, struct td *td)
diff --git a/drivers/usb/host/fhci-tds.c b/drivers/usb/host/fhci-tds.c
index d7482dc0604e..0ed1c0fcaaeb 100644
--- a/drivers/usb/host/fhci-tds.c
+++ b/drivers/usb/host/fhci-tds.c
@@ -234,9 +234,9 @@ u32 fhci_create_ep(struct fhci_usb *usb, enum fhci_mem_alloc data_mem,
 /*
  * initialize the endpoint register according to the given parameters
  *
- * artuments:
- * usb		A pointer to the data strucutre of the USB
- * ep		A pointer to the endpoint structre
+ * arguments:
+ * usb		A pointer to the data structure of the USB
+ * ep		A pointer to the endpoint structure
  * data_mem	The data memory partition(BUS)
  */
 void fhci_init_ep_registers(struct fhci_usb *usb, struct endpoint *ep,
@@ -367,7 +367,7 @@ static void fhci_td_transaction_confirm(struct fhci_usb *usb)
  * Arguments:
  * usb          A pointer to the USB structure
  * pkt          A pointer to the user frame structure
- * trans_type   Transaction tyep - IN,OUT or SETUP
+ * trans_type   Transaction type - IN,OUT or SETUP
  * dest_addr    Device address - 0~127
  * dest_ep      Endpoint number of the device - 0~16
  * trans_mode   Pipe type - ISO,Interrupt,bulk or control
diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 4929c6a8e733..cf4175246978 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -2847,7 +2847,7 @@ static int cvmx_usb_poll_channel(struct octeon_hcd *usb, int channel)
 	if (WARN_ON_ONCE(bytes_this_transfer < 0)) {
 		/*
 		 * In some rare cases the DMA engine seems to get stuck and
-		 * keeps substracting same byte count over and over again. In
+		 * keeps subtracting same byte count over and over again. In
 		 * such case we just need to fail every transaction.
 		 */
 		cvmx_usb_complete(usb, pipe, transaction,
diff --git a/drivers/usb/host/ohci-q.c b/drivers/usb/host/ohci-q.c
index 3b445312beea..21916f762b49 100644
--- a/drivers/usb/host/ohci-q.c
+++ b/drivers/usb/host/ohci-q.c
@@ -137,7 +137,7 @@ static int balance (struct ohci_hcd *ohci, int interval, int load)
 /*-------------------------------------------------------------------------*/
 
 /* both iso and interrupt requests have periods; this routine puts them
- * into the schedule tree in the apppropriate place.  most iso devices use
+ * into the schedule tree in the appropriate place.  most iso devices use
  * 1msec periods, but that's not required.
  */
 static void periodic_link (struct ohci_hcd *ohci, struct ed *ed)
diff --git a/drivers/usb/host/ohci-sa1111.c b/drivers/usb/host/ohci-sa1111.c
index aca0338a2983..5df8108b777f 100644
--- a/drivers/usb/host/ohci-sa1111.c
+++ b/drivers/usb/host/ohci-sa1111.c
@@ -183,7 +183,7 @@ static int ohci_hcd_sa1111_probe(struct sa1111_dev *dev)
 
 	/*
 	 * We don't call dma_set_mask_and_coherent() here because the
-	 * DMA mask has already been appropraitely setup by the core
+	 * DMA mask has already been appropriately setup by the core
 	 * SA-1111 bus code (which includes bug workarounds.)
 	 */
 
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 5b18efb2c1ea..32c26b42c583 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -78,7 +78,7 @@ struct dbc_str_descs {
 
 /*
  * NULL terminated UTF-8 strings used to create UTF-16 strings
- * (with maxiumum USB_MAX_STRING_LEN 2 byte characters).
+ * (with maximum USB_MAX_STRING_LEN 2 byte characters).
  */
 struct dbc_str {
 	char	manufacturer[USB_MAX_STRING_LEN+1];
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index af8d4b74c4ba..124eb6dc5774 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1442,7 +1442,7 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 
 	/*
 	 * Get values to fill the endpoint context, mostly from ep descriptor.
-	 * The average TRB buffer lengt for bulk endpoints is unclear as we
+	 * The average TRB buffer length for bulk endpoints is unclear as we
 	 * have no clue on scatter gather list entry size. For Isoc and Int,
 	 * set it to max available. See xHCI 1.1 spec 4.14.1.1 for details.
 	 */
@@ -2105,7 +2105,7 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 			port_cap->psi[i] = readl(addr + 4 + i);
 
 			/* count unique ID values, two consecutive entries can
-			 * have the same ID if link is assymetric
+			 * have the same ID if link is asymmetric
 			 */
 			if (i && (XHCI_EXT_PORT_PSIV(port_cap->psi[i]) !=
 				  XHCI_EXT_PORT_PSIV(port_cap->psi[i - 1])))
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 60af5fe29bd4..6e7611f89596 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -173,7 +173,7 @@ static void xhci_mtk_set_frame_interval(struct xhci_hcd_mtk *mtk)
 
 /*
  * workaround: usb3.2 gen1 isoc rx hw issue
- * host send out unexpected ACK afer device fininsh a burst transfer with
+ * host send out unexpected ACK after device fininsh a burst transfer with
  * a short packet.
  */
 static void xhci_mtk_rxfifo_depth_set(struct xhci_hcd_mtk *mtk)
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 2274f5995171..0e29da1cea5e 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -79,7 +79,7 @@ struct mu3h_sch_bw_info {
  * @maxpkt: max packet size of endpoint
  * @ep: address of usb_host_endpoint struct
  * @speed: usb device speed
- * @allocated: the bandwidth is aready allocated from bus_bw
+ * @allocated: the bandwidth is already allocated from bus_bw
  * @offset: which uframe of the interval that transfer should be
  *		scheduled first time within the interval
  * @repeat: the time gap between two uframes that transfers are
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 889b5fb0fcd8..96b737070421 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -102,7 +102,7 @@
 
 
 /* Cold Attach Status - xHC can set this bit to report device attached during
- * Sx state. Warm port reset should be perfomed to clear this bit and move port
+ * Sx state. Warm port reset should be performed to clear this bit and move port
  * to connected state.
  */
 #define PORT_CAS	(1 << 24)
@@ -174,7 +174,7 @@
 
 /*
  * USB3 specification define a 360ms tPollingLFPSTiemout for USB3 ports
- * to complete link training. usually link trainig completes much faster
+ * to complete link training. usually link training completes much faster
  * so check status 10 times with 36ms sleep in places we need to wait for
  * polling to complete.
  */
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index d747c0905827..949846532c74 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -205,7 +205,7 @@ static int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
  *
  * And, since the firmware/internal CPU control the USBSTS.STS_HALT
  * and the process speed is down when the roothub port enters U3,
- * long delay for the handshake of STS_HALT is neeed in xhci_suspend()
+ * long delay for the handshake of STS_HALT is need in xhci_suspend()
  * by using the XHCI_SLOW_SUSPEND quirk.
  */
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ec4bfeb4887c..86a615c6fd2b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -461,7 +461,7 @@ struct xhci_ep_ctx {
 #define EP_STATE_ERROR		4
 #define GET_EP_CTX_STATE(ctx)	(le32_to_cpu((ctx)->ep_info) & EP_STATE_MASK)
 
-/* Mult - Max number of burtst within an interval, in EP companion desc. */
+/* Mult - Max number of burst within an interval, in EP companion desc. */
 #define EP_MULT(p)		(((p) & 0x3) << 8)
 #define CTX_TO_EP_MULT(p)	(((p) >> 8) & 0x3)
 /* bits 10:14 are Max Primary Streams */
-- 
2.53.0




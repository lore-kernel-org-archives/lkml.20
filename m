Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297513;
	b=lZt1I4AIrihBwnopNIusA8HrChCikDz/krcP0M9LSLhbgfpswG2DPxPadL62xhvTuerd
	 E2VqFyKLVKImXz+TWJ1/D3C94vQAzce+cp/dd4zs2knJdgNTD9vMRYRLR0iQ33aKUuc+C
	 8Od5GwLcbWCtTzHATxE1/iSgjgxRV0cb2wHGYksHJRVYEohKUGYSIx5xVpScAoFSVVmL8
	 FhRoaTMT25FkvHPPXalkaz5fZQnN5KgBhec20qckVuFUTDVlUnKwAAQjtncm09eoscmsQ
	 tVFGOmt+ZF+WAWNyflBAUaHNuwbwEQHbiFCBG6zHQ+uS1By52NUqZsAE9OM9Z8CTECw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297513;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kx4iwmvjSJb0+Jm+O4LtPjcYgpJHMX6nwoKreAx7I0k=;
	b=0g73mNhgkgvVRL1pdJ40x4l3U+zJ0uzlFD1iD/6OzW11EDBgRVEQ+L/nzUlthDQDUUyd
	 xOjaL8PafeaZceIFmQZKor1ct1MC04Q/XcfAfbKe7pCVWRSQsfXain0Vmnht/jckETJNI
	 l+Nn0LuQQB4OYNfeVt6W/c+eLF5FBdBIq7FoJ2N5IsxaDrgjCDe0V+o7tfA3rLoE1cHv3
	 kC8VEnOvtyjomiihy9fe85qngYh7tX2NtG+gM1cwEj980N52e7orT75CpcB7T5xoKkovD
	 snyQY5hXpc9ZGUR6IOsJdzhlowVmIN5Ss3YqvNuAZ6x3MhGkDl49AX+Hpw7f67nZhDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=pkNosTQk;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5AF60A260D;
	Tue, 10 Nov 2026 07:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5AF60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=pkNosTQk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=pkNosTQkS884NTURY9PpQlasC5K80EmNQbDlXp5nvy5cY0Fm591zHLohhZ2HxPBgC0n5wi1HJcrlj
	 sej1zv2ltksbZTl5QA2DEvzl431jDz9+kBOZ2IP7WY7awW2Ws3PzTJlsX8N1fl7RVS20GkjsLJTy7c
	 b3kDh8iaHSTP5CuY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af2cea7b37-ca0a8;
	Tue, 10 Nov 2026 15:58:31 +0800 (CST)
X-RM-TRANSID:2ee56af2cea7b37-ca0a8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdd1;
	Tue, 10 Nov 2026 15:58:31 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdd1
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/22] usb: dwc2: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:10 +0000
Message-ID: <20261110075825.24946-8-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/dwc2/core.c      | 4 ++--
 drivers/usb/dwc2/core.h      | 2 +-
 drivers/usb/dwc2/gadget.c    | 6 +++---
 drivers/usb/dwc2/hcd.c       | 8 ++++----
 drivers/usb/dwc2/hcd.h       | 2 +-
 drivers/usb/dwc2/hcd_ddma.c  | 2 +-
 drivers/usb/dwc2/hcd_queue.c | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 6a0135e06b00..7b98c3e1338a 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -113,7 +113,7 @@ int dwc2_exit_partial_power_down(struct dwc2_hsotg *hsotg, int rem_wakeup,
 	gr = &hsotg->gr_backup;
 
 	/*
-	 * Restore host or device regisers with the same mode core enterted
+	 * Restore host or device registers with the same mode core enterted
 	 * to partial power down by checking "GOTGCTL_CURMODE_HOST" backup
 	 * value of the "gotgctl" register.
 	 */
@@ -138,7 +138,7 @@ int dwc2_enter_partial_power_down(struct dwc2_hsotg *hsotg)
 }
 
 /**
- * dwc2_restore_essential_regs() - Restore essiential regs of core.
+ * dwc2_restore_essential_regs() - Restore essential regs of core.
  *
  * @hsotg: Programming view of the DWC_otg controller
  * @rmode: Restore mode, enabled in case of remote-wakeup.
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 015a5fb7842d..57f5b8180a32 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1006,7 +1006,7 @@ struct dwc2_hregs_backup {
  * @driver:             USB gadget driver
  * @dedicated_fifos:    Set if the hardware has dedicated IN-EP fifos.
  * @num_of_eps:         Number of available EPs (excluding EP0)
- * @debug_root:         Root directrory for debugfs.
+ * @debug_root:         Root directory for debugfs.
  * @ep0_reply:          Request used for ep0 reply.
  * @ep0_buff:           Buffer for EP0 reply data, if needed.
  * @ctrl_buff:          Buffer for EP0 control requests.
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05fff0..1eebe14ea68b 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2835,7 +2835,7 @@ static void dwc2_hsotg_complete_in(struct dwc2_hsotg *hsotg,
  * @dir_in: Endpoint direction 1-in 0-out.
  *
  * Reads for endpoint with given index and direction, by masking
- * epint_reg with coresponding mask.
+ * epint_reg with corresponding mask.
  */
 static u32 dwc2_gadget_read_ep_interrupts(struct dwc2_hsotg *hsotg,
 					  unsigned int idx, int dir_in)
@@ -4073,7 +4073,7 @@ static void dwc2_hsotg_ep_stop_xfr(struct dwc2_hsotg *hsotg,
 
 /**
  * dwc2_hsotg_ep_enable - enable the given endpoint
- * @ep: The USB endpint to configure
+ * @ep: The USB endpoint to configure
  * @desc: The USB endpoint descriptor to configure with.
  *
  * This is called from the USB gadget code's usb_ep_enable().
@@ -4657,7 +4657,7 @@ static int dwc2_hsotg_udc_start(struct usb_gadget *gadget,
  * dwc2_hsotg_udc_stop - stop the udc
  * @gadget: The usb gadget state
  *
- * Stop udc hw block and stay tunned for future transmissions
+ * Stop udc hw block and stay tuned for future transmissions
  */
 static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 {
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index d5275cd658d4..fd2c0a8a4d30 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -34,7 +34,7 @@
  */
 
 /**
- * dwc2_enable_common_interrupts() - Initializes the commmon interrupts,
+ * dwc2_enable_common_interrupts() - Initializes the common interrupts,
  * used in both device and host modes
  *
  * @hsotg: Programming view of the DWC_otg controller
@@ -749,7 +749,7 @@ static void dwc2_hc_init(struct dwc2_hsotg *hsotg, struct dwc2_host_chan *chan)
  *
  * In slave mode, checks for a free request queue entry, then sets the Channel
  * Enable and Channel Disable bits of the Host Channel Characteristics
- * register of the specified channel to intiate the halt. If there is no free
+ * register of the specified channel to initiate the halt. If there is no free
  * request queue entry, sets only the Channel Disable bit of the HCCHARn
  * register to flush requests for this channel. In the latter case, sets a
  * flag to indicate that the host channel needs to be halted when a request
@@ -5882,7 +5882,7 @@ int dwc2_host_exit_partial_power_down(struct dwc2_hsotg *hsotg,
 	udelay(5);
 
 	if (!rem_wakeup) {
-		/* Stop driveing resume signaling on the port. */
+		/* Stop driving resume signaling on the port. */
 		hprt0 = dwc2_read_hprt0(hsotg);
 		hprt0 &= ~HPRT0_RES;
 		dwc2_writel(hsotg, hprt0, HPRT0);
@@ -5982,7 +5982,7 @@ void dwc2_host_exit_clock_gating(struct dwc2_hsotg *hsotg, int rem_wakeup)
 		/* In case of port resume need to wait for 40 ms */
 		msleep(USB_RESUME_TIMEOUT);
 
-		/* Stop driveing resume signaling on the port. */
+		/* Stop driving resume signaling on the port. */
 		hprt0 = dwc2_read_hprt0(hsotg);
 		hprt0 &= ~HPRT0_RES;
 		dwc2_writel(hsotg, hprt0, HPRT0);
diff --git a/drivers/usb/dwc2/hcd.h b/drivers/usb/dwc2/hcd.h
index b7254d94fdc3..656acd2f03bd 100644
--- a/drivers/usb/dwc2/hcd.h
+++ b/drivers/usb/dwc2/hcd.h
@@ -10,7 +10,7 @@
 
 /*
  * This file contains the structures, constants, and interfaces for the
- * Host Contoller Driver (HCD)
+ * Host Controller Driver (HCD)
  *
  * The Host Controller Driver (HCD) is responsible for translating requests
  * from the USB Driver into the appropriate actions on the DWC_otg controller.
diff --git a/drivers/usb/dwc2/hcd_ddma.c b/drivers/usb/dwc2/hcd_ddma.c
index 703cda5a5895..bdeb2943c4a5 100644
--- a/drivers/usb/dwc2/hcd_ddma.c
+++ b/drivers/usb/dwc2/hcd_ddma.c
@@ -415,7 +415,7 @@ static u16 dwc2_calc_starting_frame(struct dwc2_hsotg *hsotg,
 	 * Current frame is 1, scheduled frame is 3. Since HC always fetches
 	 * the descriptor corresponding to curr_frame+1, the descriptor
 	 * corresponding to frame 2 will be fetched. If the number of
-	 * descriptors is max=64 (or greather) the list will be fully programmed
+	 * descriptors is max=64 (or greater) the list will be fully programmed
 	 * with Active descriptors and it is possible case (rare) that the
 	 * latest descriptor(considering rollback) corresponding to frame 2 will
 	 * be serviced first. HS case is more probable because, in fact, up to
diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 4f00ff1dc3e1..68e50b94e99f 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -1006,7 +1006,7 @@ static void dwc2_uframe_unschedule(struct dwc2_hsotg *hsotg, struct dwc2_qh *qh)
  * dwc2_pick_first_frame() - Choose 1st frame for qh that's already scheduled
  *
  * Takes a qh that has already been scheduled (which means we know we have the
- * bandwdith reserved for us) and set the next_active_frame and the
+ * bandwidth reserved for us) and set the next_active_frame and the
  * start_active_frame.
  *
  * This is expected to be called on qh's that weren't previously actively
-- 
2.53.0




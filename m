Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297512;
	b=4pgO5ZoNMV+FK/mLfTrNUx84mmy+y3Z87GbN+Z/J0nVMcfuFlURpE7l+FMSX5xM9ampN
	 dC/haqtpctN+GhWQVbsJsaoSvPNhOrtYJlwY3iWfzI1s2EY9+aAMmQlU+QQTgX+gSSNA1
	 JpgpbPTqr3ixWHEN//VDNpAgmE0vuQV+0EJT7xR0ZBsyDy/XQrGdje+nxc1FbpzKWPG59
	 bddl5kriTVHguQZf6Cke7FjUH0DvbrvqazsnyGJHo0rEOAkpp8g4Ejbtim5ALam//+ROA
	 9lCHGdlO2wcfrrTygxCTbDOBb909X0rumPZGJU9TBrg0AoQ+chxEDGUo1M1yYZhUfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297512;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2JFZFDYVdATotefp7Zy4yVOt+9nOnmZbJSkewmSL7Qo=;
	b=oXeIkI+UuqjQamahh2FXcb8WiJSoFTBkOLoOWcz/75Bd6LRZfOGKcGXq+tx8O2FhyllF
	 esEGHgUi1MHs9/8Sndez3QxqBb5/epsqZBU+pUdP2ip21bHajg2vPjiPyEe7FbTi7amzn
	 f7LcddOQtYaN1D99M7WilSz4t0tbqITSFJiNghp34J52HCH5U8TLWTalTtnTYfYCYw8Tk
	 72tBeXPRpkLKcV4dNWQKX3cK0zspctoVqLGN6JTOYDSQRUy5UBdH/S2amRgWdmFNJiah9
	 ABiyiTsDv8lOLQgWbONq0NZ8YkQdgGqB4rmKwNNzY9UUzmLSpjMJ68Br/iKRiPAKNAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OQRXt9ni;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965DC606A325;
	Tue, 10 Nov 2026 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965DC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OQRXt9ni
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=OQRXt9ni8yqlV4wqHLz6C6Yk8DJbX8L/ugguFCFrXrNocJNzUyaOO+0YWkCjp+cD0ky6DiBVwKcO4
	 9F/6Cha9zemiLEUnAC3U03DbTgJnGfiaiFPTc20CEeWC1py5w25W2KUxrTIH7kyKaHq7nD5aBPizrr
	 sqUEjwzQMnVXm/bs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af2cea5b0c-d1de9;
	Tue, 10 Nov 2026 15:58:29 +0800 (CST)
X-RM-TRANSID:2ee96af2cea5b0c-d1de9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdc8;
	Tue, 10 Nov 2026 15:58:29 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdc8
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/22] usb: cdns3: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:05 +0000
Message-ID: <20261110075825.24946-3-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/cdns3/cdns3-ep0.c    | 4 ++--
 drivers/usb/cdns3/cdns3-gadget.c | 6 +++---
 drivers/usb/cdns3/drd.c          | 2 +-
 drivers/usb/cdns3/drd.h          | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-ep0.c b/drivers/usb/cdns3/cdns3-ep0.c
index e29989d57bef..5d6d3616bfc6 100644
--- a/drivers/usb/cdns3/cdns3-ep0.c
+++ b/drivers/usb/cdns3/cdns3-ep0.c
@@ -643,7 +643,7 @@ void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, int dir)
  * @desc: pointer to usb endpoint descriptor
  *
  * Function shouldn't be called by gadget driver,
- * endpoint 0 is allways active
+ * endpoint 0 is always active
  */
 static int cdns3_gadget_ep0_enable(struct usb_ep *ep,
 				   const struct usb_endpoint_descriptor *desc)
@@ -656,7 +656,7 @@ static int cdns3_gadget_ep0_enable(struct usb_ep *ep,
  * @ep: pointer to endpoint zero object
  *
  * Function shouldn't be called by gadget driver,
- * endpoint 0 is allways active
+ * endpoint 0 is always active
  */
 static int cdns3_gadget_ep0_disable(struct usb_ep *ep)
 {
diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index f4dfd0131708..ba10ef9ea656 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -452,7 +452,7 @@ static void __cdns3_descmiss_copy_data(struct usb_request *request,
 			       descmiss_req->actual);
 			request->actual = length;
 		} else {
-			/* It should never occures */
+			/* It should never occurs */
 			request->status = -ENOMEM;
 		}
 	} else {
@@ -1062,7 +1062,7 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
 
 	if (!(priv_ep->flags & EP_STALLED)) {
 		trace_cdns3_ring(priv_ep);
-		/*clearing TRBERR and EP_STS_DESCMIS before seting DRDY*/
+		/*clearing TRBERR and EP_STS_DESCMIS before setting DRDY*/
 		writel(EP_STS_TRBERR | EP_STS_DESCMIS, &priv_dev->regs->ep_sts);
 
 		priv_ep->prime_flag = false;
@@ -1404,7 +1404,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 	if (!priv_ep->wa1_set && !(priv_ep->flags & EP_STALLED)) {
 		trace_cdns3_ring(priv_ep);
-		/*clearing TRBERR and EP_STS_DESCMIS before seting DRDY*/
+		/*clearing TRBERR and EP_STS_DESCMIS before setting DRDY*/
 		writel(EP_STS_TRBERR | EP_STS_DESCMIS, &priv_dev->regs->ep_sts);
 		writel(EP_CMD_DRDY, &priv_dev->regs->ep_cmd);
 		cdns3_rearm_drdy_if_needed(priv_ep);
diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
index 42f13757d904..7465a2a4fb2d 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -58,7 +58,7 @@ static int cdns_set_mode(struct cdns *cdns, enum usb_dr_mode mode)
 			/*
 			 * Enable work around feature built into the
 			 * controller to address issue with RX Sensitivity
-			 * est (EL_17) for USB2 PHY. The issue only occures
+			 * est (EL_17) for USB2 PHY. The issue only occurs
 			 * for 0x0002450D controller version.
 			 */
 			if (cdns->phyrst_a_enable) {
diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
index 1e2aee14d629..0b134c1e5a49 100644
--- a/drivers/usb/cdns3/drd.h
+++ b/drivers/usb/cdns3/drd.h
@@ -160,11 +160,11 @@ struct cdns_otg_irq_regs {
  * Value of the strap pins for:
  * CDNS3:
  * 000 - no default configuration
- * 010 - Controller initiall configured as Host
+ * 010 - Controller initially configured as Host
  * 100 - Controller initially configured as Device
  * CDNSP:
  * 000 - No default configuration.
- * 010 - Controller initiall configured as Host.
+ * 010 - Controller initially configured as Host.
  * 100 - Controller initially configured as Device.
  */
 #define OTGSTS_STRAP(p)			(((p) & GENMASK(14, 12)) >> 12)
-- 
2.53.0




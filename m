Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292878;
	b=3sBvbU0D5mp4/UsJtS2iLuC+0mpYt1CJYA5OhfYfUFtlX/Vso9y2SisoK1/KbRvDJrmq
	 nEHBAUDJAiJsf4KZHKvwl2b0+vXJs0dcvOHLtE12eqVX5zrGu+CTXvUvnRIPhIK71mm4N
	 p+rSLqDcI5hIu9xZX1oJnzq2Hgt3SLUtY328bDucN8lOoai0RsEGIoLAv3tMYPFd55k4K
	 911omcFAuuXjLSbICrBJ9lRoOfJGDVyMR0h76P5Ad9W1DokjApoN5uWHNeP5f2gn/5l+3
	 VEvHPbP+meSocPGaXRORzMBuoP+IQuSdYz1l4NG+IyvsFrmrbDPO/yoSj3E4mWZ2CEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292878;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rqM51vgoJsXzZfWxZqhYBRkQcaJSReB9WZRXCn5GEO8=;
	b=N+6D+nBDRC1MgiVtWhi5UGo+HXB0t0JA5shUaOAiZfCLC+qebrTav76uQ0vQ7+HkjFwX
	 KMRXff9KCpEJIntyWvTQWFxsrtuUOfsfMdBJUnsbtVkunK7hziaoemLX16SiAp5Y3od5d
	 /A53AdGUFV96NvQxUduvxnRYBAOIhZOeYrrRgU18iwVycFAlmrmwAsT5sohUq/9UVyw/4
	 EyJ+mxLIPN+H64bnhYpwt5Abe0ZGiBkExS4caANendMrNGpFn6qnKhI6C8Dz1K5pWlOuI
	 XNZ0QGc2SeEtB6ujWY81O2ZaHBKjrnpoNYtjvzt08ehidymP8tChuwlSqoP9FxpNPwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="PpNuM/Wq";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE60606A334;
	Tue, 10 Nov 2026 06:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE60606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=PpNuM/Wq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=PpNuM/Wq9Id9sZWeQdZrAtADEzfCFfic+TrCYlwQCaXpWjgMwMzP9Dznx8xnsTbKH/YpjfxVgKceY
	 9XNUDkFUAJc3M0rO+cUMCSxXvBXIldZw+fxtAmyTJ4q7Fti1he66KkcPUeZtm1hHp2kGVcV8xPLpeX
	 Ps+ukVsEl3gugJW4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af2bc87c78-07a4a;
	Tue, 10 Nov 2026 14:41:11 +0800 (CST)
X-RM-TRANSID:2ee26af2bc87c78-07a4a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa108;
	Tue, 10 Nov 2026 14:41:11 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa108
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/22] usb: core: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:49 +0000
Message-ID: <20261110064105.20335-7-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/core/driver.c | 2 +-
 drivers/usb/core/hub.c    | 8 ++++----
 drivers/usb/core/port.c   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..fbbdcaed9bad 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -806,7 +806,7 @@ EXPORT_SYMBOL_GPL(usb_match_one_id);
  * vendor-specific, and hence matching against a standard product
  * class wouldn't work anyway.  If you really want to use an
  * interface-based match for such a device, create a match record
- * that also specifies the vendor ID.  (Unforunately there isn't a
+ * that also specifies the vendor ID.  (Unfortunately there isn't a
  * standard macro for creating records like this.)
  *
  * Within those groups, remember that not all combinations are
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535a89..9478b23e506d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -215,7 +215,7 @@ int usb_device_supports_lpm(struct usb_device *udev)
 }
 
 /*
- * Set the Maximum Exit Latency (MEL) for the host to wakup up the path from
+ * Set the Maximum Exit Latency (MEL) for the host to wakeup up the path from
  * U1/U2, send a PING to the device and receive a PING_RESPONSE.
  * See USB 3.1 section C.1.5.2
  */
@@ -4284,7 +4284,7 @@ static int usb_set_lpm_timeout(struct usb_device *udev,
 }
 
 /*
- * Don't allow device intiated U1/U2 if device isn't in the configured state,
+ * Don't allow device initiated U1/U2 if device isn't in the configured state,
  * or the system exit latency + one bus interval is greater than the minimum
  * service interval of any active periodic endpoint. See USB 3.2 section 9.4.9
  */
@@ -6395,10 +6395,10 @@ int usb_reset_device(struct usb_device *udev)
 	 * Don't allocate memory with GFP_KERNEL in current
 	 * context to avoid possible deadlock if usb mass
 	 * storage interface or usbnet interface(iSCSI case)
-	 * is included in current configuration. The easist
+	 * is included in current configuration. The easiest
 	 * approach is to do it for every device reset,
 	 * because the device 'memalloc_noio' flag may have
-	 * not been set before reseting the usb device.
+	 * not been set before resetting the usb device.
 	 */
 	noio_flag = memalloc_noio_save();
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..33710e99e595 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -812,7 +812,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	find_and_link_peer(hub, port1);
 
 	/*
-	 * Enable runtime pm and hold a refernce that hub_configure()
+	 * Enable runtime pm and hold a reference that hub_configure()
 	 * will drop once the PM_QOS_NO_POWER_OFF flag state has been set
 	 * and the hub has been fully registered (hdev->maxchild set).
 	 */
-- 
2.53.0




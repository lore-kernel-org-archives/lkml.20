Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297514;
	b=UMYZlJUN2SigUVu1hf3ZUWeG5TJ1CZbkXdqoLSWH9eetoOrhnBzg/kMZcgI/CEbKTuY6
	 J8OYGDnSO9SMfvbcmQ4/GOXe42PXslTN+LxcnWoht6Ti3/+aceX8vI4dxXFbvu/BwOxMD
	 rAqs6TjThBdfL+apaVQquVVAEzKdAZc7ivCFbPSKW87UiOagZqiHFprWnW1mJRrWUXMLQ
	 /3zy5Xon5sxdpkzoW4BUs6waRd2ecRntaT0vep0hAdwnBmBn63rt1C4lzR77JiuNXe+rF
	 Lv9D08kT2NWePVluZNbaZxamho7cXAK1zlfFCbwWrnbZPdWmNnHDamKZTQ8TO35QDfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297514;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rqM51vgoJsXzZfWxZqhYBRkQcaJSReB9WZRXCn5GEO8=;
	b=16KhOqO6VJBCLf1n6gBIPkEREH++a7SaOzm6S5wHd0RRNSmgPbCyK7d29KLszLj7kaMO
	 oZRfnZTNaY4Ydo0jkbrNI8k7xGhpA2TYDlpvBzxcb6mr2lu01hlrAOhHJIFK71UZdVHnK
	 G925uqlxFKN/pibW9EOKoYcpMvvDR89XhxSfXe7e2z7CBV7IieaF0z1jT0SpT0asQ4gk9
	 PP80P1CufJXRIMP2Uq15TwvIbH7CCWvjBENttdfgcVo/sLiUt2fy34oAPSM9IbgPMIVqe
	 L/mq4lcbNIo/uORdCfe3aJH1DNyIAPdby9/hage9tgTWNKmgTLOCXumH8grXZPvxMzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=yKzsedsd;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13A560A2611;
	Tue, 10 Nov 2026 07:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13A560A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=yKzsedsd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=yKzsedsd4svwHKFZvIwzg9xSbG9JhLmqijwgAi83q69rR8eVjsfsD4AfiLQ3EQN8hZw700wC3tq5d
	 Y5ARZ2FVhxQxWTVAFfzc9sLHYOni2LNS0ilDHtElroJrcIgCI9t52mtqJGBp0XGoLbkxEMRROuO3at
	 0L5iFr3hhf2PzSEs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af2cea6606-6c41f;
	Tue, 10 Nov 2026 15:58:30 +0800 (CST)
X-RM-TRANSID:2ee46af2cea6606-6c41f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdd0;
	Tue, 10 Nov 2026 15:58:30 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdd0
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/22] usb: core: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:09 +0000
Message-ID: <20261110075825.24946-7-shishunbo@cmss.chinamobile.com>
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




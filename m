Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292881;
	b=FAsAuuL0UqkDmJpc+kgy6YMTOpN5Z2b4EVG2cm1LdSOTRZWnS7uap0B5vS4jeHycX7M/
	 Tjw68ZajWjTDXpHd4Zo6prbB5R9X/D4LBOIIOOtqfqtW3eYApuvK6nzbKQHh4U1ApsGNe
	 PndT2ZS3kXK6qIH5a5fNl0m3KluxRhJAhjfNPYp21sMh+ldR0KtqFMGgNLVOOUkcwkaV8
	 fKHrvON2bO1KSmS+xIq4ZPP37Gdz1Y76VZXHW5XIGlauiV2BtQppGbGWZ3+lff6SOFd5w
	 +4bTrkui0nV0+6hEnsNitWrfclXpN1l3H83U0+mEaKTNM55bAa24gDfGo2WlKwVz+6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292881;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u7rr+/PHKADMGhy+pVIq/iYXPGFKfnSkCU0woZ30IBU=;
	b=aLQi/xKtuWJs0taUbM4Q9wMIYqKjlqycc4A7gRjuEd2JKq9U4nHw39YfDOHvxhw6XAku
	 pLUMUs+xg+5jwSHvoC7qPz2emlCTwp/RlKNmgnuJzoU5tWVDrCUGqhGSMmbWRa8Nqx1sJ
	 nPv+Ot1GBAnNjPPyTmBSwOyKJNui5wVQOpAFdgzlxgNiMkdXAHWMdHBxUXyl3+10KnaTH
	 HRvffv2wlqAe4cDAhXeNLKFfuagRnjWCOJVu/Dt4TnJMJKkYpM4tQpWHUleD3Jwe0FkFd
	 OnFpLGuPxeUO5OMq7e+6Ow3aSkZ64ThG6VoQfVo8iywu2XoWy0CNGo6t1Iwvbz4KFWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48845606A330;
	Tue, 10 Nov 2026 06:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48845606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=e0vfwrdmvukE1ktNTsv3/sj8qz+WCScHeboJCHYGv5MDSRXUYaDILw2I6MYh7Ul5iaAz9DLsvU08r
	 0F1Ff8+LwHwd++mVPzRUMaZrLJEI4BHndg9N8YG7/tNixy6iqG2+qLEK2QoXFuhq8Y4JLNbzZMXSSt
	 PSKrfXKUpss5t4Ls=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2bc871f4-a75e7;
	Tue, 10 Nov 2026 14:41:13 +0800 (CST)
X-RM-TRANSID:2ee16af2bc871f4-a75e7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa10b;
	Tue, 10 Nov 2026 14:41:12 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa10b
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/22] usb: dwc3: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:51 +0000
Message-ID: <20261110064105.20335-9-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/dwc3/core.h | 4 ++--
 drivers/usb/dwc3/glue.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f3dabb37f806..ba38a3fb9436 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1014,7 +1014,7 @@ struct dwc3_glue_ops {
  * @err_recovery_work: workqueue used for controller error recovery
  * @ep0_trb: trb which is used for the ctrl_req
  * @bounce: address of bounce buffer
- * @setup_buf: used while precessing STD USB requests
+ * @setup_buf: used while processing STD USB requests
  * @ep0_trb_addr: dma address of @ep0_trb
  * @bounce_addr: dma address of @bounce
  * @ep0_usb_req: dummy req used while handling STD USB requests
@@ -1161,7 +1161,7 @@ struct dwc3_glue_ops {
  *			check during HS transmit.
  * @resume_hs_terminations: Set if we enable quirk for fixing improper crc
  *			generation after resume from suspend.
- * @ulpi_ext_vbus_drv: Set to confiure the upli chip to drives CPEN pin
+ * @ulpi_ext_vbus_drv: Set to configure the upli chip to drives CPEN pin
  *			VBUS with an external supply.
  * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
  *			instances in park mode.
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..a1284c481390 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -30,7 +30,7 @@ struct dwc3_properties {
  * @res: resource for the DWC3 core mmio region
  * @ignore_clocks_and_resets: clocks and resets defined for the device should
  *		be ignored by the DWC3 core, as they are managed by the glue
- * @skip_core_init_mode: Skip the finial initialization of the target mode, as
+ * @skip_core_init_mode: Skip the final initialization of the target mode, as
  *		it must be managed by the glue
  * @properties: dwc3 software manage properties
  */
-- 
2.53.0




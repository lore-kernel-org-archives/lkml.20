Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297514;
	b=nXoufYaql35MbxKHby/SYvDC1O45CCPFf29Jwa7Zh36n7dsSRmUjaPBSY56PHlxoo6ck
	 /tTI6RABtQs1JrjG6Oh5TbvJ4H6ngcLHOmYV/ZFH6h1uV4pcZyz7dEoR4XIFduAV0DEt1
	 h7JPwxLiQbWN3sXDliMXkoO4o8wZDgK4ksVCLFf0ZhWaFvYVT2W56anmCcaqAZlkKM0Lr
	 /dX9rZiGajigBNzIn4aKkgTDF6qD4lFn7pCFnQh3qEAn4vbxA4yNM0+Fi+31XmONkpU2C
	 R9gA8LFZdr7EjSUAmACiUwInRt0u2F8eerf9AlpzGgrWa/YZBPDW7Oub+FuBA4VN9lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297514;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u7rr+/PHKADMGhy+pVIq/iYXPGFKfnSkCU0woZ30IBU=;
	b=3oQ14VEX7LbN9QZoN/5NCqkRkJA5Lnu/n+W0nWEc8B9GS2vfxBZtbQIS7A+9kJRYNZOk
	 RqwuqeFwR+cpVmghAE2nZudj5vp64XdpU58bQrU3YlA/vg5/9sCSP4y76j7yhnshvYV2G
	 Ik0YHt91QQ93vi0Z+Q9laeZbQJkb31P3mPFUtfkc5BGxatrbomldbw8zWhvTOsRIEb8W2
	 FrR/eZVHPQp8y+rt9qzhVDic5GXaB2rVtDoyPOCttssrIjccjaBg7J4bh2uGKQf34+U/P
	 g1gWwQpS+K9HeZoV+R93TYvWCpWIdPPQbRZWxJiRu2r72soasY+uzuzeICgl6gHbOvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=M4ZE5VDU;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D8B60A2616;
	Tue, 10 Nov 2026 07:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D8B60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=M4ZE5VDU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=M4ZE5VDUAiYxbz+WGhMgkoBIgc4buMsezbFPlAHHTeCNh/DGZ+B3aewpSYp9QM+f2LfUATAggxK5t
	 mBlwUFFu40Bv4mubIfpQwh1eNrvVqpSQ0SIAGBo1/87myQ8WsAU/5KR25klj1o9/Eem0+kbGckEgjL
	 Hg/gNeMDK/mgxy+E=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af2cea765b-991fb;
	Tue, 10 Nov 2026 15:58:32 +0800 (CST)
X-RM-TRANSID:2ee66af2cea765b-991fb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdd5;
	Tue, 10 Nov 2026 15:58:32 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdd5
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/22] usb: dwc3: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:11 +0000
Message-ID: <20261110075825.24946-9-shishunbo@cmss.chinamobile.com>
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




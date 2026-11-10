Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292881;
	b=gRXDTFnKW3MuefZE3H2l+2vV8G99wiMNPAWXUzeaE9gKjTZfkcY8jQomJDevX7hklmSl
	 wgI4QJlnrmCPAir6kXdn04nCoL+WN7yeUfbWr06WiDiwtJz1+znFCtZ4iE++pSowcnyyB
	 MO26Cz+GP/dak2UqFgtmDurMFdU3P0t7TeWsy6CdtPrL6741XuUhHFHixHd4lF/+Dfo96
	 C4kFy61YVnYETLGqj5Hm0+l6rGZnd7qn9xrXxD+z+56nJFD+YGFkGvp+XsZ2jsLwiPSpt
	 QxfQNYAP80Fl75Y6BrgR6WAgpUMorG7fHQTFQ+NoF7jTRPYp8cxxOOPikrfubZqNnXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292881;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z3WH8xwa+5TIcBfq3Z+rUeQUdnUW1V/hnLtYoXdiXkQ=;
	b=c2B7JbjQw0TFRjpbUt8jHEBNDGBwJD3fwySWbaWm1wFAmHoxWmMigsPLFFjMaCxneG5w
	 D42Raa+tSjVbUwVAswXUf+Tc0iS/p59ZWQvLEUzoBXS55cueLdHsDoTA5PV5elHpjwfEw
	 0puJ4f3PU6PGuj8z33ENtDBVVi9LbQi0CFJeovfSJctcHcBTpQe8N62ZDAMJTjd2SD+A/
	 Fn3YirT1cSNMfxWrC1F+VT8AC4+AcmZiAf4V4igUQwH/LnOdbBrNh1f+Rml7by14qOzMl
	 /pGlevRtBRb6IlHYgFm8UNcbxfHY9IKuYEEwFQX2eiknoRYB6NWhrB0ru7PssoCMi+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C74606A321;
	Tue, 10 Nov 2026 06:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=MyvZnUCnH5wRIpmqpNwIhqlVZtSCuhMdN7QBr4jIJBxqPSes0cUBMuk9A7bewDDJre8uwWX5ztS34
	 8MHh+84bndSwZ1BY/2gdXWHdfbVAbVGPSfdlplnahV3Xf4+lZBTg5Bb7TcTMw4wx/3OoJt6UOMJ6ph
	 DivmbReW5hYkdeYo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af2bc867ff-6b8f6;
	Tue, 10 Nov 2026 14:41:10 +0800 (CST)
X-RM-TRANSID:2ee86af2bc867ff-6b8f6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa103;
	Tue, 10 Nov 2026 14:41:10 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa103
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/22] usb: chipidea: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:46 +0000
Message-ID: <20261110064105.20335-4-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/chipidea/core.c | 2 +-
 drivers/usb/chipidea/udc.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 3461dd763a6e..e41ced53ac0c 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -642,7 +642,7 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
 		} else {
 			/*
 			 * If the controller is not OTG capable, but support
-			 * role switch, the defalt role is gadget, and the
+			 * role switch, the default role is gadget, and the
 			 * user can switch it through debugfs.
 			 */
 			role = CI_ROLE_GADGET;
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index c29b2d0dcc7c..827428aedba0 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -208,7 +208,7 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
 	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
 		return -EAGAIN;
 
-	/* status shoult be tested according with manual but it doesn't work */
+	/* status should be tested according with manual but it doesn't work */
 	return 0;
 }
 
@@ -271,7 +271,7 @@ static int hw_test_and_clear_complete(struct ci_hdrc *ci, int n)
  *                                without interruption)
  * @ci: the controller
  *
- * This function returns active interrutps
+ * This function returns active interrupts
  */
 static u32 hw_test_and_clear_intr_active(struct ci_hdrc *ci)
 {
@@ -1242,7 +1242,7 @@ isr_setup_status_complete(struct usb_ep *ep, struct usb_request *req)
 }
 
 /**
- * isr_setup_status_phase: queues the status phase of a setup transation
+ * isr_setup_status_phase: queues the status phase of a setup transaction
  * @ci: ci struct
  *
  * This function returns an error code
-- 
2.53.0




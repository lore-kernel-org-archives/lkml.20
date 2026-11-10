Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297512;
	b=0pJFuRNX6DThlKRWoo2cilz6vZIFXFE6bBYbD/wAwUyjCwqZamghzfzYxu717mau1XIy
	 YeVPjkihSFIyTtI87tOwkxp5YF77KZvmaKs+FWrpaYaQ/zSZKtwHp5GUo8XDFX7ajxZ07
	 6DZv9VZgeJnIAQU5joRThCp3PZxRp2iSxznrtq1KZSfxH8zww3MuwIt7St/mIIYQd3jkT
	 SgrqKM8b629F+IrwJKg8c4JiEwRwwABLujb3bxRtnOYoXQsw0ZK1VJulxWgegDqZGP3kw
	 6UpSc5eyJYLTNPf+PgvRHwp2zPKSuR9H65FnS0lS74vmfMjRcl0Xn/GvBxt9VlfauKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297512;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z3WH8xwa+5TIcBfq3Z+rUeQUdnUW1V/hnLtYoXdiXkQ=;
	b=qa08BDTWYWA2uvkXjcHBhnj/ekeQxjx6qLmf05rAIEHasGWQOiQSC07xxkWSGV56OFIj
	 ngDFMjdcleKNZRhSnPwTruKPe8HTENzIc1SSe4F+4WgukTUmdZaZGqOfV4Qjlm5H3i3ER
	 uIBXxx0VlzMUkLZXdT7vdPo84RF+UnOzvkWr6M9VOERtBt1FJ1hXv8opHlYvxVTjO5j/J
	 jKoXsDOKhujope2igj0/JPWFNp3UO1l/IrumKRuhSUSYR8dyhsnUYSbnXjpBmenWBlh9G
	 NhuFHSUbd3lU+s4ChA17Ky+Q2AfagdrvvxejbZUil/Gxiz2V8Onzt3PUZeDN/+Slm4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=A5nhCnc2;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E746F606A31C;
	Tue, 10 Nov 2026 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E746F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=A5nhCnc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=A5nhCnc2lyCmoJS4l/28yG9rwgfRZ5AQ1jEayw/g84QNELxC4/d5Nb3/JPtiJOPBmVg8xhDowiai3
	 Ls8AuwBI/er6aSCkrUqIhFf9+01XhsQvVfMD6Fvk1sl8U6KMgy2nfVxGYZyasO7kEdsi1QY4T4NMaO
	 j5gD9Fwm9KGyKv+E=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af2cea5b34-ca0a5;
	Tue, 10 Nov 2026 15:58:30 +0800 (CST)
X-RM-TRANSID:2ee56af2cea5b34-ca0a5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdca;
	Tue, 10 Nov 2026 15:58:29 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdca
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/22] usb: chipidea: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:06 +0000
Message-ID: <20261110075825.24946-4-shishunbo@cmss.chinamobile.com>
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




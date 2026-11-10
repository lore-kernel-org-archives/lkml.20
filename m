Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297521;
	b=GywrZonxUaD15Rb9l7wkJJO2l1ZsDYo1Ey1OPqDgHntMVHwvqU8NpNbgXNJwobnXyh8y
	 S82ntE+5OzQkIJ5mqEqRkvR6WWJKcuRwEdw6GQlv+GbmaLR5qZMIY3eJC4IEcKdip91VW
	 UJmLpTn7uUL5PsDD1YnpMv8/jlJs5+DdSh4QUgWfqedPTWSZbUKz3Yt5+DV9johmOFs1B
	 YiWrU/logG2bFZl8vG5WidUQ5wePbrYnF2S283Edd9CYnHi2C78mAd8fmxm3CGbU0LLkh
	 wvOdKzml4vmqYdBeL8Hr43MWlGX5OaKjQv1zHizFvWNqvQfdFR+jdjyFByqgMrjRoUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297521;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Ge1OucLk2TlU9sYYHzdGDU5vbeydCqNWODl9dKf+ek=;
	b=FakW8Q91yTrn/MNWSJoQ+B91pyN+8U18O2RPwGSGMKyo2RA7rIYTdxC2HDolfn1+YrIU
	 Xw9rq2JiaYkqPk8YF1xEdpeDHMvmAzMswsdQ8eLuOi2HIBoVOSkUHxCFG1BW4l5hejDrZ
	 THsCsn46v1c2DVa/bVFad3nyFK+ftQSxBnoA+hirWIgPsG8ssRzrpzx/ys4vZhdivo83g
	 95NuCnmyGcA5FJ+E8ZGwgz+K3S0CYEPFcPg/B1QHt/+YnIJ0LV57QXK2r1ydTzoDRqHj1
	 kO0adFnZpKgpY2LVbfDe6GarwrLLoUHvKkZcKhTb8cfCzPV3/c9dItvyceyivya5Isg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zf4pVw93;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9F26077D70;
	Tue, 10 Nov 2026 07:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9F26077D70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zf4pVw93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=zf4pVw93pko2JzK7YzgqYhbcnCVk0tcIO6fCRGqoBgWHak0lgqbj7hhwc7lAWPx+Mztv119TsszNT
	 yyscdAbCFlO3EDt58Sz/KQYQV1mn0F5kYwCt5X3a9ETCug5ngDqUDs5sPDo+XcHyT18wOMzg3MRcvy
	 eGTb6Ya6XJRTf86I=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af2ceae256-98a04;
	Tue, 10 Nov 2026 15:58:39 +0800 (CST)
X-RM-TRANSID:2ee36af2ceae256-98a04
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdf2;
	Tue, 10 Nov 2026 15:58:39 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdf2
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/22] usb: usbip: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:25 +0000
Message-ID: <20261110075825.24946-23-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/usbip/stub.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/stub.h b/drivers/usb/usbip/stub.h
index d11270560c24..1fea0190de7f 100644
--- a/drivers/usb/usbip/stub.h
+++ b/drivers/usb/usbip/stub.h
@@ -29,7 +29,7 @@ struct stub_device {
 	 * It is allocated as stub_priv_cache and assigned to urb->context.
 	 *
 	 * stub_priv is always linked to any one of 3 lists;
-	 *	priv_init: linked to this until the comletion of a urb.
+	 *	priv_init: linked to this until the completion of a urb.
 	 *	priv_tx  : linked to this after the completion of a urb.
 	 *	priv_free: linked to this after the sending of the result.
 	 *
-- 
2.53.0




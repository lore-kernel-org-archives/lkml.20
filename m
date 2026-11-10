Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297512;
	b=mr09A4/eo6qyEFBK2XY2UWx52uKFrJ+brnaMGFGX3y53sNh6WMBE94pYkeQHqP2YGmSR
	 Dp92h8PdxlKA+foJALHEVS9b3Ag0w2TYY1YVzRtNwO/nSFcyhbIIC3ERCAyeMLvz6A7qo
	 c1Dy69Cl04c/CGbqEuhD+HhRiRLbY4yl6uM5xUiJtkRAJUzrW8fbjIpoC1DK0s/90WCz7
	 cNAihDBc+9PHrys0tGwGyQaMkqf/WHcy3wypvBvJBb29wNlKNdZ1XizLZFKIUlaW6dLaC
	 iYnog4469NmHS/Wv0Ai5cedVDG7NDyZfHTWr9xDHf1KRJEQFZPW399E2e+9klgukJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297512;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HOkvqzxplxXImsaFTzQrg8bwW8TX0Wm55fgAD5kSTZA=;
	b=KJinJVkz/WmOvieEYHqJ3QFUbulJjrt7zpMzd9zkhjpzuD7PVijFMQyIwYRTyeqmGVex
	 WoykXpCXGNL/vX9lmQBH2xcCJhsRNFp7JkaAsWU9U7+sLLq5BDZaDh3Bfh4Elh4DadIKR
	 D04E9lb6r628FoWg2kEJgFyiOe+IeSgNI9kuAjejQPiadsgGtO8cCbvDEtuA9y9048QOk
	 pruNEHFQuhj9SVnauicxFdtn8lQ73tA6PnxpF19Q9rMkLwI/ge6rwDyAbNsP5TEOsfFUE
	 fH9Rhu+rSpIYwOwF0RZPANZ/gm8G/poYoR8VfZZocNs2sc6criesTRUwO/amlIrQUeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dfe8X5mD;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5261E606A335;
	Tue, 10 Nov 2026 07:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5261E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dfe8X5mD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dfe8X5mDUsmwG44Evc7YqJdSSsVjIX6ZzI3R45Grl1pXU6gUOLtIoUjM3gPadnnKhic/tZFdToh09
	 poM6Rt2T1klb870pxcP7jTbAWbPOjNDDFTfFkOFNkmRv8FmX5/7E0m8lClRVTdzdXaqTow7173DqGm
	 QiZoKaiHyPFIp3qQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af2cea5658-991f8;
	Tue, 10 Nov 2026 15:58:30 +0800 (CST)
X-RM-TRANSID:2ee66af2cea5658-991f8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdcd;
	Tue, 10 Nov 2026 15:58:30 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdcd
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/22] usb: class: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:07 +0000
Message-ID: <20261110075825.24946-5-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/class/cdc-wdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 7556c0dac908..1745d9f51a1c 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -1189,7 +1189,7 @@ static int wdm_probe(struct usb_interface *intf, const struct usb_device_id *id)
  *
  * The subdriver will manage the given interrupt endpoint exclusively
  * and will issue control requests referring to the given intf. It
- * will otherwise avoid interferring, and in particular not do
+ * will otherwise avoid interfering, and in particular not do
  * usb_set_intfdata/usb_get_intfdata on intf.
  *
  * The return value is a pointer to the subdriver's struct usb_driver.
-- 
2.53.0




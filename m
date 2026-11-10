Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292881;
	b=SpmOtJoC3LQZ5rkmD7xuvokbkcenzkJs+ICjVhsg3OAp3QqH+7aaAQrUSIfSUJfv2ycb
	 bOxoBsn/FfMwOv+QDxuTNi95BWpWzqw+ywZnX17nk9g7xFNKi2U5BPvjbOdzWULx9/UC6
	 FCvM5/B+Nb7oXdDZDCtj9RhYNCAwtcYZrRVH5NNidFbG80/fEHYhwhkWTH3rj1iIhRGn1
	 pumWPSZ7lkuCtq6RfC/G+C4Cv17jGNh3Dqvp3arIjdZTPRvZMmHZnuUbqRq48G+Bf1DqR
	 F/R53uF6g1gqjmTZrS7puBJV1sAQyhMItbs250aoDfGNT5K+vCk8tpcLJrD9Pw8I/9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292881;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HOkvqzxplxXImsaFTzQrg8bwW8TX0Wm55fgAD5kSTZA=;
	b=mzIosG/FyUgerqG/UyqUcUPGKIxm+9p0EpOJSjmOjXYDKUtRJG7y3t553z49uf8uWhWM
	 kdJqZBjQ2JMwAcTY/ZqgEtY4nc5n4E1ZkknNgbScV//wOSm8Ci/0uobvNEJ7kw9EVRVM2
	 FZA0peqJWAcy6WINOXKId9Qo9uVY7g/7DRiFUaXPFUvBzh7NYXKTU3p07llGM0Ra4z9Rp
	 kRLMzsv0bheqvDuWQ7R1g4W+sXCbf8vWlMJVLLd83vQfa4k0frKzJC94Csm8OEQ6UOuKd
	 Wzk9cKJ3nlpHFETufqhS+xQFbX31yExM9zKeei1bDXk2Qvg/qINtuk/1oMiW8LpQh5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A011606A32A;
	Tue, 10 Nov 2026 06:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A011606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=E/zYJeoCasDRtkpqQyiRw/X0mwQzOxfwYieIgP2B7v2Z1vVk0qrO0PeHwWnJ9GCzN2ppHgE0ir9wA
	 0C1edFfS0OyY96SlkQmORgResxujjFjsTdB04iFAG+3Htj8DQOHRpGaGecay4OdLTLXn8Yc3nfFs9V
	 hObqafPCsOwTQz3c=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2bc871f2-a75e5;
	Tue, 10 Nov 2026 14:41:11 +0800 (CST)
X-RM-TRANSID:2ee16af2bc871f2-a75e5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa105;
	Tue, 10 Nov 2026 14:41:11 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa105
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/22] usb: class: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:47 +0000
Message-ID: <20261110064105.20335-5-shishunbo@cmss.chinamobile.com>
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




Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292885;
	b=m5w/8nlWf+WbrgGhWhogyJrQU8KspCvQ2245Aern8rE2C4KSwxvONb59900nAMklx16p
	 oephMt8xTNWlriDVh3v4EjK+4+0tLk8WsY2WUzZ8xLHCetDDHzW2vdYcuT7sCUQfn6Nag
	 AiGTvkqFhFdLBVKU01Bwz6e4YgDf2CHXCfc+xEHBzlFY4B+/nQVwSLI+mlPh9J0Wql7DX
	 y/xUsIg/bybYbI3nhE4D4ybFz0DjMAvdoQs2R39yM0Mko4zUnZcZ0gdmWO/fCbzlP3I0/
	 daNucnn3m+iE/j8b87qOOfiQMhtmVYWbguFSgAg9JGef37I21DHWvjixRL9QyOB6iLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292885;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MIkKETPDKopSj2qx633NwzZl1BsL9LyD65cxss5a3yQ=;
	b=LRH94WAjAS+lM27tN8Ip4k55d8QcBaszCHHk1ylVcyrl32GNJeCCxjvrfRyZPivMHtRk
	 X7DQwHOqHNXhu8dHDLeKjjMQjpnawlQ8o0X9VBPl2/P7G+HPw498U8ex+hWtBX5BMMkeR
	 nniN6T7XfqYr5SD5pGvGr+ttgKzF2kooCWp79lfhuPEhJIs69nI7arQxQVI0rKUrdUvsQ
	 psimOOnWBHppTxbAF82o+P+p9q9a2nv31mx4eN2to3puG+Br/IeJIF68mteDGuKngAEvF
	 H+W3SJAY8mvHKOwzcrrnir8LRwnxjNdCWq7FM9XnkyR8l1OqL82+K2aCt5Vu3WyQKAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=TCG7OdME;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BF660A263F;
	Tue, 10 Nov 2026 06:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99BF660A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=TCG7OdME
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=TCG7OdMEDQ0TMkJNGl0QXxJ2jIpuHZoxx5S0c+fodDaPYLm5IY7PxKd5FLDlG0ZRJXZNUenR7OXtf
	 wnrpY4V9iyJ3qTL6GeeukrNQ1ME8duKBTAqbIFki15gXYWRvgd1mZOAOCwWbOQS20hw7hbcEP+rYr3
	 g36eqOcMrATj1Jzw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af2bc8d809-6b900;
	Tue, 10 Nov 2026 14:41:18 +0800 (CST)
X-RM-TRANSID:2ee86af2bc8d809-6b900
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa125;
	Tue, 10 Nov 2026 14:41:18 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa125
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/22] usb: roles: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:41:01 +0000
Message-ID: <20261110064105.20335-19-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/roles/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index edec139b68b5..8ea703e63ffb 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -414,7 +414,7 @@ usb_role_switch_register(struct device *parent,
 EXPORT_SYMBOL_GPL(usb_role_switch_register);
 
 /**
- * usb_role_switch_unregister - Unregsiter USB Role Switch
+ * usb_role_switch_unregister - Unregister USB Role Switch
  * @sw: USB Role Switch
  *
  * Unregister switch that was registered with usb_role_switch_register().
-- 
2.53.0




Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292877;
	b=crb45kGR3b7m7xsHFaNgB36vVvkKoYC2NQ8KhI36j8vCIdBnjP9DhgWs3SBingXADGp9
	 7rtoGLr2kkAYOJS7D9uXQLI0YeMamsIvMlyFinR5GdXq1XqaD706DLcBs3470wEakz9jh
	 FEbxwQvNAwmsEjhbEWCMfHhWzP/v1VuWgfFTxlZDuz8pQa4IBtJfwhEUyHif9tu9IBgq0
	 4TVMNzFag9LiaghoKWto9ZzjNPeoYabreWNBtbHHHYhj/hKxUPWabQm3Sw40Od6wKcPj6
	 nFR5siTsw2qfnmk6KvTO3GscuHSGGfFU3tghsD/3FBaNIHcQZvwPu9Tsuo6nS8Juw1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292877;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fg34h+VZqICMTcHL/S6rQT7kCoY22/jhi5QW/4nFZYE=;
	b=GZWr6A6VDREGfiylA/XvG4T+jsjVpKRg54UvrUCeXacQ7TEFAdadEtas+dT0T4gl/3u3
	 RveK9ksZ4G1WJY9cK5HNbbPTqQdf/ZyPCGCGnPTF/9lJC0BzMCt/xl5WUG4xi/dG6u0EX
	 B4Ugr9seJ+stzgTLcpFIHvJItmRMkoxJ3Wb4/yYP+groF8qc6aFHiDQdyCu3vTTTWF/a4
	 QLOkbQbZ6tewQ68DVXvBZNfNENKWZ/NDzcTUl847QLkaNy1L0LGIDXw4P3yMriQmgPk44
	 JSXaBlYeXuEl2T216cU9ipRSoCL8UaJ7b4avAMqiJCVZtWpqqIqrPMyQKw9BpShdNDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA720606A32E;
	Tue, 10 Nov 2026 06:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA720606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=oHOIfnm+1w2dACSLuO19DJkPfpGKHukQdSAGkJm25Xri6kZUcxlRXKoGCmF13DnW8egY/yMp4ZW/w
	 DUFuYM9W8J7Ak9PcLrnLFW/zd59RPsk0HP3xRQAnBTdG/1ZtxXFGNCB7YKtovJPXpiDJjwj/VNPDDY
	 MYXZ8B+iaJRUhYzE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af2bc87d4f-c92bb;
	Tue, 10 Nov 2026 14:41:11 +0800 (CST)
X-RM-TRANSID:2ee56af2bc87d4f-c92bb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa106;
	Tue, 10 Nov 2026 14:41:11 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa106
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/22] usb: common: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:48 +0000
Message-ID: <20261110064105.20335-6-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/common/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index fc0845f681be..450d13c6ca5f 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -285,7 +285,7 @@ EXPORT_SYMBOL_GPL(usb_decode_interval);
  *
  * In dts a usb controller associates with phy devices.  The function gets
  * the string from property 'dr_mode' of the controller associated with the
- * given phy device node, and returns the correspondig enum usb_dr_mode.
+ * given phy device node, and returns the corresponding enum usb_dr_mode.
  */
 enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0)
 {
-- 
2.53.0




Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467846;
	b=t88+dZOefPjaGvIZv59lofiLZAJtp2kP7EP6d0FJf8Eu7tQ7JempAZoN3l2LZqBX/hUr
	 qX8bxx2DhcExZ3msQbzkMdR31zdItaJ3mykLv8lOyfmVKCFCPltQNMQQaNWjyfJErTXYS
	 ov1ZtpyyGyKsGQ1JpiwCXXuy/zRUgQVCUoB6SnvEqriOmwHXKp4r045zfhCYRscx5qZGr
	 YnI3ufRI2QPCfKpjxi2U9zE2FNjF8G8oKubcG57LBpgDUsaVsvLUi8OW2XpA10lXUfI7p
	 rg2Gbne/IIkJL9sM4UbYyOToh58x15tqldtBWHjDZSdbzeoJSjpkbHkRcDNosEKwhhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467846;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ETG2r6xcANES8ls4NekjnSw6kcURnMiwQbnXx3FK7m4=;
	b=Tx1KqhcTr8eecyblZ7LWVzCUfIZm01I3WPy4DSAT77p1H5Psv8bvmiy4pt/6foS5q0eQ
	 9ky9h9xxOSb9Zorw1IGuzEoJJ11wKqAxCt1v3GznSa81WdqNUG+/pfiNH+tkyY4SfY1l6
	 KHhVeMm6FiNkebT+nhOFEk5fw3LQspczfcAh6bg4iTxAA8NBU3Rd7yKldaTha+98HxZFz
	 J1PDI3RMPvuszX3DFxwKEGqEb0S1jpccnILkqF+Q3aoMXBgDmOVJw8R7pw2MEhNm/wLg8
	 7rjzc5xoo6cbyY0+t0qvoyYcQdvVubvphMklf4MNw8byUqss9j2SLJV3REQK08F+MWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nSJxNIf3;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB4660A3832;
	Thu, 12 Nov 2026 07:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB4660A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nSJxNIf3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=nSJxNIf3ybX4NBp7AM4epEJ6VVn3R3wvLfSAB8z2ZFp7Jbc1mV2cCY95RlIyldZ85jd+LnhG6Ot/C
	 3JZ6NXi6mcGCFt+NJpKN5C0AYPaBlmkr68Twlu28hf4UEJn9uxMrwMNGH4Z4YiQB1Y56Gn7gLvnTNG
	 B/IMnTQV0Jd8g5M4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af568043f7-dfe68;
	Thu, 12 Nov 2026 15:17:24 +0800 (CST)
X-RM-TRANSID:2ee76af568043f7-dfe68
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af568032f9-f685c;
	Thu, 12 Nov 2026 15:17:24 +0800 (CST)
X-RM-TRANSID:2eea6af568032f9-f685c
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] usb: usb3503: Propagate resume errors and unwind the clock
Date: Thu, 12 Nov 2026 15:17:23 +0800
Message-ID: <20261112071723.154558-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

usb3503_resume() ignores failures when enabling the reference clock
and restoring the hub mode. It can report a successful resume while
the hub remains unusable. A failed mode switch also leaves the clock
reference enabled.

Stop if clock preparation fails. Return the mode-switch result and
disable the clock when restoring the mode fails.

Fixes: ecdc071d02a0 ("usb: usb3503: add PM functions")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/usb/misc/usb3503.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 9f356b4bd84e..bcc6174b80d1 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -353,10 +353,17 @@ static int __maybe_unused usb3503_suspend(struct usb3503 *hub)
 
 static int __maybe_unused usb3503_resume(struct usb3503 *hub)
 {
-	clk_prepare_enable(hub->clk);
-	usb3503_switch_mode(hub, hub->mode);
+	int ret;
 
-	return 0;
+	ret = clk_prepare_enable(hub->clk);
+	if (ret)
+		return ret;
+
+	ret = usb3503_switch_mode(hub, hub->mode);
+	if (ret)
+		clk_disable_unprepare(hub->clk);
+
+	return ret;
 }
 
 static int __maybe_unused usb3503_i2c_suspend(struct device *dev)
-- 
2.51.0




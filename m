Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280910;
	b=yT7fBmW/zFxZNhng8zaQfY1YR4dsBHwC7jbLLRv9CFyLWOQA98e2HNGgvFwlWJCqeT7s
	 FuXsL2m/5pl3Z8ge+8H2+ud1dx3nJRDer9TdLYRMhw+Zp/Gn0bqWTkZbhe+t1nCjUkHsx
	 BepJ3KgnCondCwjce2sv1EDDyG2CNOzPlg/KR71ahnw6IMwMQWb/xBkC4x1OhGJRAjyYP
	 MXZzBN0faq8oUot9w3vCWgcTTfZP1UUIMjDJiLYe16f1Sb2inU55IG3QJLHSfQbMeaLbi
	 2MbO3+YXUvu/57bnUGeHxI6gZLqCMSgdN7sSE19f01kPZGs8GQF+RnOlQiO81LKc/tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280910;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ewotBPttJsEwIQ9ge/HE7qXTU/gs1slzir9JWzWgWek=;
	b=1bp6f/2sjxS6A/15RYC8wKWBzfWakHcWVodmFwZdRBrxnxvqpIVt4B7vHY63NRbTJjYy
	 Psf8WKYmx6uBbHW+XqDbMY1m/jLUC2IuXVd1iNJ4TRxqurqRVrrgmn2xmK+bUsC1qsSDM
	 TF9Jr8UDLJoXF+J7lWQW3qiuAY2mqekjlvgCYD9rvRYFPsfRKuAKk+V/ljG+xfp+ONYyk
	 Ta/VnnN/JBakRhV8cStMsA4f1b5bUmWIYrl6w/IgK9nm/hq+kNbiOdtp53dur/kcYj9ER
	 bjIwCfEPYk+RG+ePrj7XlojHJwzXlLLlIvdyufuR2PAs3KECr0+r4nGrzIhTNdxj7NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cqTQv+2A;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C8460A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C8460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cqTQv+2A
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57E2F1A139E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:35:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E34360360;
	Thu, 29 Oct 2026 13:35:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E3911032900F;
	Thu, 29 Oct 2026 14:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793280907; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ewotBPttJsEwIQ9ge/HE7qXTU/gs1slzir9JWzWgWek=;
	b=cqTQv+2AoWDhau9sjYIeMi4BVwVTQbGRdYFCfHvWAvVkMDEZfXSEd6GPX8O5OyCavYLUA7
	NbWgG37l477gzs24FkJZP8SlSPUKLrbTd6xCZ1nLSML2UZ2K+rfKXaArjYjCDR+cSV7Nwo
	zvbXvKdIJah8ejvTBz2ZYrDhz+Q7GaaPIJJw7Xv4qoJBhABBiC8YnyNUuhfvl9Mz1eP1oj
	8vMB8/GrixUUTgRZ66kzXimNARdVrwLG+QfJ4+ieT7Nk3jzCKcPfvazJfc7LH3IxqLG5Ju
	3g7RHoiW9o0/wkn8fAZv6JWVvyRzhte2VnTHUo6P981iKmB13oskDwSQoiZeZQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] rtc: rs5c372: use sysfs_emit() instead of sprintf()
Date: Thu, 29 Oct 2026 14:23:35 +0100
Message-ID: <20261029132339.925021-12-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029132339.925021-1-alexandre.belloni@bootlin.com>
References: <20261029132339.925021-1-alexandre.belloni@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use sysfs_emit() instead of sprintf() in sysfs show callbacks
(rs5c372_sysfs_show_trim and rs5c372_sysfs_show_osc) to conform to the
recommended sysfs attribute formatting guidelines in
Documentation/filesystems/sysfs.rst.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rs5c372.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 9ab6f2c28f7b..a4bd042908b8 100644
--- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -699,7 +699,7 @@ static ssize_t rs5c372_sysfs_show_trim(struct device *dev,
 	if (err)
 		return err;
 
-	return sprintf(buf, "%d\n", trim);
+	return sysfs_emit(buf, "%d\n", trim);
 }
 static DEVICE_ATTR(trim, S_IRUGO, rs5c372_sysfs_show_trim, NULL);
 
@@ -712,7 +712,7 @@ static ssize_t rs5c372_sysfs_show_osc(struct device *dev,
 	if (err)
 		return err;
 
-	return sprintf(buf, "%d.%03d KHz\n", osc / 1000, osc % 1000);
+	return sysfs_emit(buf, "%d.%03d KHz\n", osc / 1000, osc % 1000);
 }
 static DEVICE_ATTR(osc, S_IRUGO, rs5c372_sysfs_show_osc, NULL);
 
-- 
2.56.0


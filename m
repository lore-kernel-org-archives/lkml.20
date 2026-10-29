Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280909;
	b=vaqOAHFb326YiVlJVg5UHcivbKY79bBZDe9n6Fkmjvr+6DQ6g5DvAhRRS4rQHclxAIhK
	 vLvFUoOfoMC/QqXhyBmTFvASW/yINA/kFmsnmYFqYuC1rajZOImtpZbW1TA4sdRxnsIJj
	 EPWvTzvn9QrTvAsNhh3bHkAbxK48+TQdKg+S1wNcbwoW+pVNvID7whmo5W0bZkPDNpCDq
	 JfShgELR8cq5jnUv5aommljhlo64BgLBAOpVT6rUj2OHPNZ5BttGy1jsFYXzfqFp5ErFR
	 zYnr59+zN2JEZeZ/Mfrn2WjWG/NucEW2Ln+0ny7HuX5gjAGF+I7sHrXhoobPkSfMhNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280909;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=BfyENGR7lkZ0yvb4xndUvOYLF5GB3gvkTIBj7aLyG80=;
	b=oct3vjBJfdmjNOLUTh8cKvYOCnysxJwYUHi6ujI46YVZz/8CEHY64zc2wXCac3EFdsgB
	 W+zCmLh0jRBBdKhOU39VxuyuSJ2Spll053he1JBk5xMtQwT4+BUFkFTHShypsp3dg3rf3
	 E4SRFuyRoKUP25gZ9ijOGyignFfPjEKRL0rzX/1woK8UV1nkSvmRxIo9tHXDfWdSYNYV5
	 mqFDcO25jZtXKv/6q5EgyypGqTZVNnP6iXiMRUoCaOf/8dQxDmi/V9AGa6+jrpBzRa6FS
	 PWBEP2AT2M2I6jo1Td5Fd5+w4Sls6C2Fr+15NTwlPGx4QiqTInnPg6nivJYhrDV8w9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="cXG7jqN/";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68B606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A68B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cXG7jqN/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3D1E41A139C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:35:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C1ED60360;
	Thu, 29 Oct 2026 13:35:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF2B61032900F;
	Thu, 29 Oct 2026 14:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793280906; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BfyENGR7lkZ0yvb4xndUvOYLF5GB3gvkTIBj7aLyG80=;
	b=cXG7jqN/P2X+KX+f4T2iF1qiUKwtPfHXdNJg1ocYPnUmUSwcvo/fYqIkAIPvB7f7/F5tBc
	b0fJWGYim/JZ0+DvrBZkTKplyO6UC0kRtzbvxQFG1jbuSgSA6X6/Am1waRRIAbg2whwRQ5
	cjzY1F/tq52/DPXhKV8lDKXVLnAi4G1gGjgHB53GOKW2m1ZO0RCaC3FJQ0qOHCqnpoe28r
	Qihb9y0ciO8FZmAJSNjFnYWKbDtCizwyoZOchTipES5HRgikv3FitPLlyJM8hRYLRd97w2
	hBp2cGiIyw5egtN0DKXF0NdAp+Ok1SfTG78st7a+fYpTNeiF265y7aVzPjGx7w==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] rtc: ds1307: use sysfs_emit() instead of sprintf()
Date: Thu, 29 Oct 2026 14:23:34 +0100
Message-ID: <20261029132339.925021-11-alexandre.belloni@bootlin.com>
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

Use sysfs_emit() instead of sprintf() in the sysfs show callback
(ds3231_hwmon_show_temp) to conform to the recommended sysfs attribute
formatting guidelines in Documentation/filesystems/sysfs.rst.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 8627f84232ce..206a79d28568 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1380,7 +1380,7 @@ static ssize_t ds3231_hwmon_show_temp(struct device *dev,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d\n", temp);
+	return sysfs_emit(buf, "%d\n", temp);
 }
 static SENSOR_DEVICE_ATTR(temp1_input, 0444, ds3231_hwmon_show_temp,
 			  NULL, 0);
-- 
2.56.0


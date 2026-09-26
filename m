Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E306A3803D2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439918; cv=none; b=QWdIK0WBANEZUEMVM3lWwPy4J1U6+EOCDKfqDaUC2BJ1zazZrumS7gC3VbaaFsD9fUq/8ypRweIAQNupr+uaatq2SpTMd49lvzykKS4oxAV42mxS5gCcPuJ4DrFdZi+Gd6niwnXySAFdSYThmbEq1oWjr5sjvCbARCRwxb1EAd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439918; c=relaxed/simple;
	bh=qyVsTrI0lYDk/H9djXYnt6XVAaCOyj13Bdyjnjxd95g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ek7uqR9d2PF8X8+skvcqy7cxO1EEY7aWilDWnaabH+FIAL5Qveh/NHogMwz6uE+avjhdaJFc1jqwoekqE88cDiQYzQdHa78DAKVNUwcnx9qeRlA0JKwu9If+bfdzPj6yiiYDQ5y+4mgAD1QFDOhX53HTIAgJMMIuOHAdmrTH2U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3IeyBkD; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3IeyBkD"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91434eba587so16695806d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439911; x=1791044711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sr/EPY03GpOHmQzo/zUfA0mc4dSwT2ZOrZjnEj21b/o=;
        b=b3IeyBkDeAqGYDDbPeKhDmyepPE9R6BThat0ztsOFTjDvcCiHP0AILE1zO17TavJIb
         6gC9ZhURHXlUwvstDkC8jVDHdgRNB5IUW/KS7WO40yBIy9yvxeyLX697ULGlQL+xtP3/
         ngZp6HYVt5Tt0WB21hLEqNEYfEW5QmTCdhfVweJjBNrBFRXWkFRmHhdtjGeKuSZUN5MW
         fWnwCtELcMg8X4lcTrQku6tPebesNSsswok7xe3+SM+EsFwc+INgfY3r8QroZoJeEDFU
         DtgoJg8+tYg0VE4zk3vfVFGAytdHuVP9VaLwrgC4Wm4SQt4h45OWbplzIG5wziyY55Wa
         vEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439911; x=1791044711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sr/EPY03GpOHmQzo/zUfA0mc4dSwT2ZOrZjnEj21b/o=;
        b=UgZOboXrJ+/Q1+pd8mgWEp2FbuJ503Ymaa5bYLX1tK5bEHS0fjalynHnZQR7bOsAQB
         JvZb+7Wu1W0asPVDD1kIUSnH3x5gthkwelQqmuWjG0dgnBjq25+aXbIt7zMhtEjW63uX
         xLAsBDLx3N11UmzryhhuiB4eZHFS2UDHLQWGu0ULSXoLGmsBV7ZIzPJIc0pkv9xfew/L
         N3OyYJmkYwTvYtydn5GcKBoG4ez/NAA7UM26eZ1El4pPqJjjIouBH9ySB3Ed6tV+fs4o
         RxDbOFWT71cBKXwjEIbQ7mpYXV5X49ixegNLlSOAKi68zIYQJ8kfhqlh3PnW0qXvZrm5
         GTFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp0sOue7tcqMf0uMNmxaxUyKRfYBwelkcmCxjCBjTCGM01COa1lRJSRP2Ex34zx9dGjRhT7CxGwK7w1s0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpAGLGa0TsS+V59HNzaVKSaql54f3bwKJ+fEQruQq5GOF1OVAY
	G7MiGqVHS0zMp5GEepgDZsuWdArksa3HKKx/L/Rhfv+MLS0W6uouJUW+bohczI8v
X-Gm-Gg: AYBFou1hd7BhSdXM0VoPigggw6qorVaMIVDFjYwhGdaj92pym1l4ZPKwAd/XoGkF83q
	b1cbBic6EHDk+xlMTaYaPnAg4RYLSfkSt2JrR5PIM39vDz9Zrz2kSztyOlagsbD7T/YGu53SzZG
	yQIDTW/XRYm0LFV0EhXijrazX0U+DgLC2LeYHcb7I6cqQEnwukooyDTFOyySM8qGpB2yLohpi6c
	ajqessYI+U2Xskih/SeYPO47lrT2D2FdoJcjaU78IrvQ2TF9Q/VfTTW6K9KcLvaQovJtEsoFrd4
	mwFfi/Qa0B5vsmJPJN8sEN6MS2HtMUo0ZXfpXfVzIJh4WJCkpKwP5RHT8XOuHIBXi5qUyR0ryY4
	1nhx25M7MVnhq8SZSupZaphPV0lePQVbsghPwVEc9otlmYKkIbZ/PKZ0OsLYsg+peABbKjePgOP
	hexkfRRscp2Z/6dgYAlds11dK9Qy2il8rKTKVahTtQX6kFUGTDb0u70dwy131lcn4DNV9hsgFbH
	m2/+S40nzrI//1oAeRDwQ9GUF+gRN03E2cxdXAub7rC+9d+
X-Received: by 2002:ad4:5dec:0:b0:912:6380:fe12 with SMTP id 6a1803df08f44-914321eca0emr97986826d6.8.1790439911488;
        Sat, 26 Sep 2026 09:25:11 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dabed8sm43015606d6.12.2026.09.26.09.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:11 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: technisat-usb2: remove unused EEPROM dump debug helper
Date: Sat, 26 Sep 2026 12:25:07 -0400
Message-ID: <20260926162507.25238-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

technisat_usb2_eeprom_dump() is compiled out with #if 0 and has no
callers. Remove the dead code.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/media/usb/dvb-usb/technisat-usb2.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
index 1e43aab2bc27..16bf3c99ddfc 100644
--- a/drivers/media/usb/dvb-usb/technisat-usb2.c
+++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
@@ -384,27 +384,6 @@ static int technisat_usb2_power_ctrl(struct dvb_usb_device *d, int level)
 }
 
 /* mac address reading - from the eeprom */
-#if 0
-static void technisat_usb2_eeprom_dump(struct dvb_usb_device *d)
-{
-	u8 reg;
-	u8 b[16];
-	int i, j;
-
-	/* full EEPROM dump */
-	for (j = 0; j < 256 * 4; j += 16) {
-		reg = j;
-		if (technisat_usb2_i2c_access(d->udev, 0x50 + j / 256, &reg, 1, b, 16) != 0)
-			break;
-
-		deb_eeprom("EEPROM: %01x%02x: ", j / 256, reg);
-		for (i = 0; i < 16; i++)
-			deb_eeprom("%02x ", b[i]);
-		deb_eeprom("\n");
-	}
-}
-#endif
-
 static u8 technisat_usb2_calc_lrc(const u8 *b, u16 length)
 {
 	u8 lrc = 0;
-- 
2.53.0


Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAE92F8E9E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840502; cv=none; b=WO/kRxE2/+KdRsUe415Ov6yo8PVBOJPcDl9O0UmWhOYq3MR7FD6J5RIHpFQ3RF3oc0/dd+qhLWhm5WDSz8erMIAJVJJFB6iqJeQwMt4gv+g5vIdTlPdWfTeShxd6Pd3BG+0ys6yeK+SVqRVInaxSNFVDkBhWdPvItVzBWt0IwHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840502; c=relaxed/simple;
	bh=nuNxXV9IiXZmNVfBWYtPD7tRbYcEpSpQ5MUnS2wUNDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adAF8GAzmBJQ+ZASOca7AB490T/yah00bi4kpyaqw6WEDaHZvT0hjNiEDS/SnpMQutMKuz03X5sckx0eOWKe5PsMQinGXnk0gp7hJ8ydSNftFL4R8WYTkfiq3P8fmKHgA0E0Fr2XZDsFEdi1BDGCgnoWyO3wbv1dbxBS/cNexK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwRR6IWu; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwRR6IWu"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-939c25604d4so5512085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788840500; x=1789445300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxUbMbA1DbE2G64rQIDQk+y7x2nUAdqEFheE61ifZbo=;
        b=WwRR6IWu7yLmHDFoRCU0zQByOtv36iHLPKIfpRyG5mYhuOpF/JS7Ck2MfdW5w7fEcF
         LIS+TnOvbUfe1g1/EefZUlQc3m2ocKDVhxkeqmmmDlxeq+23nbq/XyDM/sWNnqgPZLlx
         x5PAa+AELvlBvccPjpwE2B1kLUdvkZg7pTm3gfib2Tk5YNQGvvwsSHe+GT0HmzJpcR+w
         Z7EXDxuJbSBrApfn3UEVvbzhbDbbjURMIQohOc9MSMxyuJgAVeGW6IQirFcUp9HTtJzD
         V4/zP8rggnzqvfHxWvPn5verfSHjC5n6Lkzf7yBXhfe2+cmEduHSQb+Y2j7la0fMu67j
         /f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788840500; x=1789445300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxUbMbA1DbE2G64rQIDQk+y7x2nUAdqEFheE61ifZbo=;
        b=by3k14CsQUAcq48p+eo+EhVWHQ10UIrJ8oF939Vv1kXzj1vt6IelKfxyORYT1cBnlX
         rAtiz6zUHtHGiPx4tswhidMJUqjda7HAQFQnnfrfG++Up1F+x6ktXf19cB0q4i25MX34
         /As54teNPUSH+vGyajJ5qFY4AYFssWjdP72lC96LMMX6ByaeN1cPp4enKgP2JkPwNRDi
         ig81FoDamDyIgRP8Za/XCmvUTluQTvZXsIxEs4Vj4WFss1qml0FD+QideNa+M57uZoHg
         KmWyx6VSsF5pPM5EK0iloYB0a2wUJ7qZrurcf8SnJpM4dXoIQ5bx0aTiwCwbkuMvH7hG
         acyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMcWHRQE5wmOVlktpu6dfM6MTPQwMX8JlZQ5BAHlnOnIfckwvlCZ/WlJw9IgzXUyikmYx+E2oUkiwOVEA=@vger.kernel.org
X-Gm-Message-State: AFuF++n+ELscje4qlRf8X3KYLz/NfhdA1MLFK1KgapvF3waWqLQAHUBA
	PxSen5yZTjKyAn6yXUWoCtEZ7GGz3qNReAC0XQwXHEev8kTgC9Xv8EPB
X-Gm-Gg: AYBFou2GWz9mDS26L39Qrncgypc9eyfdWfjZGUoKBS1Ny3h6/MStkOHmUr69vdJHLIz
	39OT6LDerYbp50Gx51K8llI78CBEswVEKTCFqMlu+hl2+CXdK9qXFPGbMHdoopP3OyqIYaf5Oq6
	hlkUigLwmxisuMSoww+Dn/uDRuvFNQDTnvOOES6CF2/vNwzF0S1aSCwbm1YxCcdK6oDbRcyK0fv
	+eYVE+ZlImm0douDkNdhodWYm4wQfoNwevRyb8Nn+IAH2Cmcv0cYfx/BuT4KL8C0h5ffXNEtONH
	y8L2O4gXk0DeV5cb0xQ6qIz4kZdN3jZtscH0afTiXDQMNCacAGxrgHeXq/CbI9WTS63FvTerwwB
	VGhIvRvRUeTFwz5Z07q+4vqclZj6xzE6aO8gW4B+wZiuJd21QXW3afKC/zsFB+FT1pliEOGwJyc
	7MCwuSybwKmsGcH5V8lwC1qXF2ez/PayYyChpWyEvF4F0uiCeXjFxYhh7TT1nnaTbzH/opWIe2Y
	EeGHNFLLggKql3Ai6I3Z6SWXoADlN1myp8pGnhG1pqWkZqeNJZTBolsd/6Rn5rbSw7N3uMCYCBD
	zgJ3kYHicj1Bhz6kuAU2/dvtW8iDg4NObEr06AScR+Iukcvov/AiVE/UHfRGV2rySEzoLAw7BSA
	WrkV8DhmdmVBKNxXVpXzr2m1/CzRNjlU=
X-Received: by 2002:ae9:ee06:0:b0:936:e938:b07a with SMTP id af79cd13be357-9398032898bmr2266288085a.8.1788840499956;
        Mon, 07 Sep 2026 21:08:19 -0700 (PDT)
Received: from MacBook-Pro.wireless-1x.unc.edu ([152.23.158.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb566a8sm1055026785a.25.2026.09.07.21.08.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 21:08:19 -0700 (PDT)
From: Juan Perdomo <jcperdomo100@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com
Subject: [PATCH] media: cx231xx: preserve I2C transfer length
Date: Tue,  8 Sep 2026 00:07:34 -0400
Message-ID: <20260908040734.1175-1-jcperdomo100@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core stores message lengths in u16, but cx231xx truncates them to
u8 when populating cx231xx_i2c_xfer_data. A 0x700-byte read therefore
becomes a zero-length request. USB treats zero-length control transfers as
OUT regardless of bRequestType, so the IN control pipe trips the
usb_submit_urb() direction warning.

Use u16 for buf_size, matching both i2c_msg.len and
VENDOR_REQUEST_IN.wLength. Oversized transfers then reach the existing
URB_MAX_CTRL_SIZE check and return -EINVAL.

Fixes: e0d3bafd0258 ("V4L/DVB (10954): Add cx231xx USB driver")
Reported-by: syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ddccc0c0dbc0a38ffccb
Tested-by: syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com
Signed-off-by: Juan Perdomo <jcperdomo100@gmail.com>
---
Testing:
- Syzbot reproduced the original USB direction warning on unpatched
  df290809 (Linux 7.3-rc2).
  https://syzkaller.appspot.com/x/report.txt?x=1107e749580000
- Built the complete cx231xx linked object on ARM64 with GCC 11.4.0,
  CONFIG_VIDEO_CX231XX=m and W=1.
- Syzbot tested the patch on df290809 (Linux 7.3-rc2) with Clang 22.1.8;
  the supplied reproducer did not trigger an issue.
  https://syzkaller.appspot.com/x/log.txt?x=1123f105580000

No physical-device testing was performed.

 drivers/media/usb/cx231xx/cx231xx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 19f5036a7..f85d054fb 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -463,7 +463,7 @@ struct cx231xx_i2c_xfer_data {
 	u8 direction;		/* 1 - IN, 0 - OUT */
 	u8 saddr_len;		/* sub address len */
 	u16 saddr_dat;		/* sub addr data */
-	u8 buf_size;		/* buffer size */
+	u16 buf_size;		/* buffer size */
 	u8 *p_buffer;		/* pointer to the buffer */
 };
 

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.50.1 (Apple Git-155)

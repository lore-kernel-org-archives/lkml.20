Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF7D56C657
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966434; cv=none; b=kv2XcjsKNL7jTXsbQCcL2dyDjAGxZvINqdCBuTmGv2BFqM26veceyIteF1dnU457oDiDuwu3SDPvof6L4YpJfHrfB04d9Frb8WatB+nMgjokbdrTgxgaglVlrhM5Lweatju7FgYY82UyuUQMMfwHItZEFK+Gydq0wU693cbPqN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966434; c=relaxed/simple;
	bh=Z2au/zKMsNaHmguNeaqh+iFtHuoMEhLideBKGSi0+Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uBbaSWLDeGnShXOKPWvOsw8tfFoS6u+elH2gmwuVBVHjlZSKGO+yTR8j3CyGPkOxLoIaAd7s+ma5gkExFBCq60R7WSYNh2zUuAQ2kSX9n9+x8tC+RcVvpAtBREFbwcCfMr5V8An9qy3NQrP46KbBCriB0M+iyrJwChq4B6Gsut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peBvJebl; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peBvJebl"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-86d43cdee51so75098627b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966432; x=1789571232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0bL+hQaKHbTQh2MApIdEHF5AP7KIOzy8y9uYEIbPJE4=;
        b=peBvJebl0rb3bjqoBZ1FH1L0iwy4UIG2/vcPDfbQ5Ni2GtO0WWDLwqHlt7Vbor8dMm
         4Ba/JylNbxjHSMzHjxFXQYHv5LPTn1rH8FOr2qO1FsoEQtYHOTvhtK9WNfdmIjJRFNw3
         aioKXndWrJCkani+4L5XZ3c54XrhZkyTKUgeTcr1zdtAd+ntAeproiluRm7eTHIBJQYq
         UCAJE+B7L/kUgOrDHyJub4IAGpd2LSyUfy9vSg+wekfOkb0gWMsDyfyrR1sZVYZ/bFvj
         HsTgPdSz/WQmwMw1xFinuZc7ydhRBgu+OYCGsno7e75mjsHkWfsPMJAR7SZ7yPB33pxo
         Ba0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966432; x=1789571232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bL+hQaKHbTQh2MApIdEHF5AP7KIOzy8y9uYEIbPJE4=;
        b=WvYcmBl5nFe+MYB9RtDKnt/kG9R/qLLrpv3NtW5Ht5CyvbeYWCvqoURBl8NZPKghR7
         x4xTtsOb6iN2c5u4nXaWtt6D4ngR17whFLMDb1K7Q+vEoSnDziqy3nPx+UvXaidYQuFV
         eJuZIXU5Aamb9U2x/r/NIlVWvgk/T3ZF58gw2v5bkpR366uKaEJHebpM7ksXOKOGEKJ3
         JjZq6vpjVJ3odq64HhA1gEcD3Wt4RfhHLWkA/Ky/j/4zPoo1ONHBD5sDfZhIUTXltmub
         +4lCY4zm+aGz98SVB21gZb3UnPA0oBwPK7tc9n1mVUXqqpl6hiVJoWxOVt5iqiU9lOOe
         VsbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoTq5hMOT9h/ETBeZ2dX6ZO7wHWrYtcMXLcrbp1+8veUA9FaC0zqTziUWYSfDbO65wNgaNIka3abminrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mUq2dPthf+I1zGM1rDnrBKLGPooQobAiddZPpolfJEsdTir8Uy
	q+YnrzIC6HvUvHFKLR6ulboyIxrOJ2UOTJb6d7M5y2h5FgH3qQbjImw4
X-Gm-Gg: AYBFou20Q97IHj+MFiAoiabr8sOWlzF6j0EeKsmsZZ3U7WwUmys0vs8XrKa8x5yLbXa
	Vj6MyTeUjOBI0ykLhX+KsTGO38jCOv53zLyPP2q855vSGjwQEpYHh4pzbDlQF1aWMYqPAlnEsgU
	d2WxGVTsk5U9DIX8yIrtMxdNuVjgl/DkLCP7d2AN6GKI6GutJOa3WTUMmEphLxMOwPIzgh3dbny
	vBy0pXvkvldyhz8OtmrSV06toS9gITqD5ZjH3HYDTqszj7PL1/luDqvKvBDDbuJcoZUwpStRdKx
	8p0dIkjEO1qmLjHSnqrePHJK/iqyqMPejTcaizxl0S1thCdJk1NVrewUUIgd6YUaPKmwAatexIR
	eMW9v1yOz2ZFIrp9uxIjenR7clOaloJOshEFWKpZqIlwXjoBo/R/BcEd8fzMvvbl5jTYRzuq/cA
	zFkr3aS8gIaXtModMPip8oLj7BFKCbvoFxdm0Q208I/bUzi/vyvOsLxzUraguq+Ccj3WxtJaXN
X-Received: by 2002:a05:690c:c00f:b0:833:f9bd:b289 with SMTP id 00721157ae682-8712c90aaf9mr108547867b3.31.1788966431841;
        Wed, 09 Sep 2026 08:07:11 -0700 (PDT)
Received: from adriano.lan ([2803:9810:3d22:1608:e46d:9e65:1b2a:35eb])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054207c16sm141409421cf.28.2026.09.09.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:07:11 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3] media: as102: initialize mutexes before registering frontend
Date: Wed,  9 Sep 2026 12:06:44 -0300
Message-ID: <20260909150644.232424-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus adapter mutex and the stream mutex are initialized after the
frontend has been registered, but the frontend's stream control
callback as102_stream_ctrl() takes the bus adapter mutex, which can be
used before it is initialized:

	INFO: trying to register non-static key.
	...
	as102_stream_ctrl+0x27/0xc0 drivers/media/usb/as102/as102_drv.c:259
	dvb_frontend_open+0x7eb/0x1410 drivers/media/dvb-core/dvb_frontend.c:2825

Initialize the mutexes before registering the adapter and frontend.

Fixes: 41b44e041811 ("[media] staging: as102: Initial import from Abilis")
Reported-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=2a3de29133b40e8f69f3
Tested-by: syzbot+2a3de29133b40e8f69f3@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
Changes since v1:
		- Succesfully passed available repo. Added Tested-by tag.
Changes since v2:
		- Reorder commit tags to fix warning.

 drivers/media/usb/as102/as102_drv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a0a7..a6dd675689f5 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -287,6 +287,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	struct device *dev = &as102_dev->bus_adap.usb_dev->dev;
 	int ret;
 
+	/* init bus mutex for token locking */
+	mutex_init(&as102_dev->bus_adap.lock);
+
+	/* init start / stop stream mutex */
+	mutex_init(&as102_dev->sem);
+
 	ret = dvb_register_adapter(&as102_dev->dvb_adap,
 			   as102_dev->name, THIS_MODULE,
 			   dev, adapter_nr);
@@ -341,12 +347,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		goto efereg;
 	}
 
-	/* init bus mutex for token locking */
-	mutex_init(&as102_dev->bus_adap.lock);
-
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.
-- 
2.51.0


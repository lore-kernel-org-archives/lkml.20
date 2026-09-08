Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555825293E5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859181; cv=none; b=PQAJwlYUH8Hv1TXtCTHIcViF0VOUMNmu43HitkBZyPvOt9Yt3qTunf6X2hh0avRSVKLJvN+KddktzH8pjfqTDi4J66uZJKGGdFAadJOlRw1Cs4eiu1+M8whMPFQ0ghdGJCT3P1f5b/SQSVVc+XyURAkmgsRvH6ecSfsjaVxFASE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859181; c=relaxed/simple;
	bh=heTE+AXphS60cWUC6FOFG7hyAUshpcINZu9nRa/71mE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aApnSYw0XoAN9s2/dj/PqwEosRscTjYV6R1pnn42fQJutW889zRFBApzlzzJlbDaR3JmNIzU/GVk9lT4Ulr7ugpt6cn6GcdWJSbhXES1kh4eABHlkrgW5F/HXup6TKtWlNCj/mEcieXcE12dq5enukgsB8GJCA52E+2Rfc/v7sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkbRzfz4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkbRzfz4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843f205a5bso2646480f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859178; x=1789463978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L31na+RhIpfJ96Fuxsfu8L8TgoTwtkWhyGWhs8Vz64g=;
        b=KkbRzfz4BlTpqdfDKAeRBNMkt8SV9ka88hD5AIHs1GxcuB1GSHjEegixEKHU0VFdFp
         Cc7RIXFZGPRmsMkTcEfuP4Id4dtPrmFqVdl+cg1xjS3fYQOj02+9UTv1gvIR7eYZ6QCb
         TEZvsvs6jHi57+hnr4Ua4rJJu8EazLQY5OXQCH79MKk/27WSF3yM2RAMXxQ0mxPmCWBs
         SkgrekoKqBxYOkO+lLRVp57Xkwsj9wQYQ0+vjWJpnjGp0ivjxsWWBC5K62xmJBz12qal
         RN23i8PXvMq6SFIvoJ0eibm+9/6I1JRzFu5JSZprylYWHrsP6ToTc3ixbvWiWamMHXWg
         liFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859178; x=1789463978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L31na+RhIpfJ96Fuxsfu8L8TgoTwtkWhyGWhs8Vz64g=;
        b=BztVdDt2cKJRDJZXOB14GOq68yYs3JaTXeevIYe6gHFdoB2ssQnMg6EmuQQtUEpIvl
         W6FN2un6e3nSiJ0PZWocqWi61nXRHc5gZrotyVVyUv5iJayt7lf30sxVsmPJ9/lTGEbS
         /9j7HfJC4Ry5bNkLxp5yMjWEdA4Uuhqu4PUjaNR7vWUZ9J2mSF12p4LKF7pb1dNRv66n
         ulusvhAf0/p47i94G/mUhfum5hHO72AIwXzSRtZMEshc+9u09VHUHYztOVi3guJLYXrk
         7KtEmkqAuiKmvU0PXcIpDSEOHTO/LcI15XUsHxmv0ypiHxEOEHCx51wCWsc3pQ+kgJDa
         VSEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHjRFvb7MZzrTfdai46Mh5M/IlXGDJgX89tyqyMO86MgawmXbYFVBtgKgHZGNLomy7RIDgQPW0l7jfqQU=@vger.kernel.org
X-Gm-Message-State: AFuF++nqh1MmBR6v0olu4TQFm78OyfufnFGOQion3/hrT8SO3CPJ31jV
	bcJnZMPUTW7FmPJtZQmj80BD7z+S3G5FWuzju8xBfApYXEgCGeM9Q76ZOv+eAuzD3K8=
X-Gm-Gg: AYBFou2d6lbMM5uXvYK+X4SkBYKl3tLa8k6DyGjDUFh1V/89HEzKxtjAbOXGtoZ9VNx
	EGbsMrcA8Y/cNUeIwAFsWHK9t5ZP0HuY1Ge7S0wRl/gOF3hozN2+ecC4Zjo01cDPcyeHUTgxgzj
	JZKD+rjKZw0FPIPtwhV0ZFOBSYh/r+4muIOrwobjkCv2Hq0PXk4Ez7CgzsJH8Eg8x5AIjUwUj70
	0uMQFmjLej1N6RID2Fq1C2p4wOfXQA2bOQbcW+CscQAtAtWRgVGwTQeAGure7l7hk1DJ/b9kRFF
	5fgHt5pNilhLGVpn/kO3pGkQWnfe9J+PlSm5hXRIt0rxqltNBvh4wjNSkWLbVJJYoEtcndN2dzF
	eocXskEZiBgU7xT6RpQXWeGtu1hzMFuhggu5hvqZyOaLCXqBy4btN8/JGq8ZMQyMT87usGph2w7
	PCx6VK1IM4fq229fH4bFA8dq5pHiQI5vOICpIj1dCDLnT0khCNdjA9E/MpagKI4BwSGC8a7CTqb
	sd5UUGQXVEDNtGKgGjJbXu6wo+wAysd
X-Received: by 2002:a05:6000:1ac8:b0:485:8926:531d with SMTP id ffacd0b85a97d-48589265336mr26148216f8f.4.1788859178335;
        Tue, 08 Sep 2026 02:19:38 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm35321836f8f.35.2026.09.08.02.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:19:37 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: add reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard
Date: Tue,  8 Sep 2026 11:19:26 +0200
Message-ID: <20260908091926.5773-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ITE controller behind the keyboard of the Lenovo Yoga Slim 7x Gen 11
(048d:83db) carries out a reset but never raises the interrupt that
acknowledges it. i2c_hid_finish_hwreset() therefore waits out its full
one second timeout and logs "device did not ack reset within 1000 ms" on
every probe and every resume, before the keyboard comes up regardless.

Set I2C_HID_QUIRK_NO_IRQ_AFTER_RESET for it, as is already done for
several other ITE parts, so the reset is followed by a fixed 100 ms sleep
instead.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/hid/hid-ids.h              | 1 +
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b3aca5aa9176..2e9d0fc41ed0 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -765,6 +765,7 @@
 #define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA900	0x8396
 #define I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD	0x8987
+#define I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD	0x83db
 #define USB_DEVICE_ID_ITE8595		0x8595
 #define USB_DEVICE_ID_ITE_MEDION_E1239T	0xce50
 
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 0ff07fdab442..ad8d9f329404 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -126,6 +126,8 @@ static const struct i2c_hid_quirks {
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ I2C_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_VOYO_WINPAD_A15,
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
+	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD,
+		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_3118,
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ USB_VENDOR_ID_ALPS_JP, HID_ANY_ID,
-- 
2.55.0

base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a

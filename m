Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA10364940
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021870; cv=none; b=RO1+eBsOYsirVKMO+WEFAkVdPbRma4qJzOtT1WAAU3BiajZQ199xuYOVJe7AwHzlD3T2f5sLaQK94sLo97ZF10wiuFsb6TjC6XunH6OhjauRMaz9EExCY+xdQO6/FiobkaECeD8iBZWk98TXG7p93/6dS7L9Yi1IMOF4WiFUA3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021870; c=relaxed/simple;
	bh=hSbGWgxms9tUx7FH0Igo364YaVZlpeP02syqsSCE4xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SctNF8FzL6ZK8blBhzCtryF54YgpjkWC3Ga+kHgNAyhxEe8gSfIejzPUHQ9tiwYpIxBxpm3Qb4X2GlE8kovusajEGkLAZLZdOyIkUKZIQm+bJB4ODevSa0PlL0yaojUzeTmP9aSd6OnHt8a2dE/abBm5ov1TJAPrxiYkHzIJgbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idiQZHPK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idiQZHPK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so12682285e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021867; x=1789626667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OGjAjtaTT5B8pzy8Vb69ZAyXXEb6PoUWeD9vf/kWrQ=;
        b=idiQZHPKxIaJyYNusAMaifoIwaJdaHyt1/MoaFQhRIBDdCp6ZN9c2u1PBe4cl4+nvw
         jIGMf8XpuNpL/A/eFNHGjL0LsRFdb0LI40ZE79LoJdOiVb6WbODv1vv1LkUI2/sR+psO
         vwBfFuUYQyMxt2VJS1BQoDWFFXOtOdoofsEPqjHJWMP275fqMwW+4I4gBfwqT3rN7SBK
         nVDo0klc7u2htaFgQGO+LyvR7WHCXrDXuNX2V9b5sFMFYvI2SJElVS/J731UANC3hCaG
         Pl1hkUIk/0ktlei8OeaC8tQTSIqCh8ucKpde/qp7O/dd2FXpAcYLcI06DSMQrR7fLhiA
         PGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021867; x=1789626667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3OGjAjtaTT5B8pzy8Vb69ZAyXXEb6PoUWeD9vf/kWrQ=;
        b=I1AMYiJpFPkS2muLQsxLsbVThDBYvsN7YSGDAxBq1BXYnX3D98TKQEcCivxN/vLI/I
         meM+LaYxIBLCHBrbrrMygBLBce08DROsXoMW0ciacTTLJD5Y34nQ3S5GztY6ISUtQu96
         VNJlGjXKc63bdocJwCw6PYwXoOnfYwu3jyx/D6Yui6g9yoStI7GdJEPpcCPX4wGZ+53e
         GdmQf8E/iWaM8afwfzQLluVc+FkixDVyBKb4PHrIzevPK5vXAr2uRInAlM7ek5vYc2OB
         eAOH186ztAn6X+enf3PEmxtKuF9VK2/XErCDxSIE5vAeDfAKF0UaRbIz9EAIQRe8oaT4
         tGcA==
X-Forwarded-Encrypted: i=1; AKwUvBwdwt7/zaY6pyObCY3Rn/mfFNx4gIJvWewe27kX+5d9tBHoadkETVrNgygqIaqG8FWlWcOzV1Fyu2JQ658=@vger.kernel.org
X-Gm-Message-State: AFuF++l9iZxWCB8agjJxKdMiQMoVXJCHeYbx7VP4V31kptfxgtRNoG3R
	p+ypb44vGTadEB58E/+9ZUQdbiVrqkDH4bbSjN3q7X+yzjZgZ0XNGoPP
X-Gm-Gg: AYBFou29dX/FYTXnj8S8cuT6YUlx2yXYVsx998fY+9sybVgmnQYNtL2nQPexXppypaM
	3ZPT23Mbm8a5FxMVy+1cJOi9wvHDAJK2fKJKi/H9GQmS9X/iwGOQZEhIYjwGWBtBY9PcaEWn/cN
	D4t0hz6ZZ0Y9qmSUI/doNvQC96gFX+2xqj6vr5YrskOjBZSk6+Fr7T8HUhOMB8MmLYA4MuM0oQL
	eSpwSjQRQO9gpdZcMXhSU2k7AwzjW74LCsBWiW/b8WRsIV0VecgUYywsRnut7N4LIhysOA1NIqW
	wSMbOlIyjqycUJqIIsjdq3SFnkkQUWwssuLS0eyM8fqoylxYpqtNT/z89A/V1+Hm0ER2XuaEB8f
	D5VxBfol7PLK2Ynq7BcQsYwr9dXCsHLYTF2YObeCoGCPhaUI/d4YAhNIETV92XOo2+4QXdV8KtD
	vB+4T6YxT+wBw5phudnDaHZKseJ+sTGZX94r5Xg1SqWsz4VuQvpaiA4QjaA5ELm/WFfHBpc7hlI
	2rXz4Y24dle6J2rwvzQD5xeBHCe6E05aOXcYtEaMNc=
X-Received: by 2002:a05:600c:c4b8:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49d26dcbc5emr29168255e9.15.1789021866489;
        Wed, 09 Sep 2026 23:31:06 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bfdb4asm47441825e9.11.2026.09.09.23.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:31:05 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] HID: i2c-hid: add reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard
Date: Thu, 10 Sep 2026 08:30:50 +0200
Message-ID: <20260910063051.4556-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063051.4556-1-okerixx@gmail.com>
References: <20260910063051.4556-1-okerixx@gmail.com>
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
index 8b4f4b02aec0..79eb464ba2f7 100644
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


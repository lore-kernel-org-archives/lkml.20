Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA0C38B148
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933711; cv=none; b=uQuIqQSH4YRYvwd4n41KJT7Ok93NGtUgRN9YnKFxJBVkvDWZPOdg3+Opho0asFDneudH5X4K+MwUVC1HgmlZWJYRJhGfKDfc5udX7R41/AcMFJFkEZ7MKSR3RdspV5TFuSCoRPel+5+9U5wC/f9kIEIDneZTVbpx+t2yAO8WsvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933711; c=relaxed/simple;
	bh=P2vAhkjwfZLpGHwPw59L73KMSOIBIbwxnRr5PopVIrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GflOaSU3rdjm3nnuFT24UwoMq5HRNRTPr6TWUJUOthfIi765ZLkIF/C3T7dYjmUZ+x4Nn0lRcMeAfSxhTTki0NfjokJbGxfYpP65VQ3ioa0/K9cmMdJxMTyD639/nz8olE6MZQ0ZZFKSyzz4emy62WtAoOqb75K6SsLfdSMZFmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r21O2EBG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r21O2EBG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-480001972b8so619036f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933708; x=1788538508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=r21O2EBGZjHGNgjqx4UYfUg3GnrXV9mUa01fpFTRdXhOCRKyV/Y7BOtnKDkoRGwGGl
         zBJNVHg9lFA8gjAoFKXiWikdPMV7Va4ePZRzwZIRJfwxH9pLbuw4mSzx6zakZhHiIEkU
         pAs/MJw4eS/HbnmaXXYEbat/U950U37VK8tNGfEOKwQkA5r65r6T0riA4YOgvH4KUWM6
         mDQyUnhZPTwSJb+T+5WW8hwOCTTve7rcuEvMp2xm6g5My+FLCkKufHV+RUI8gnUAvm64
         +F4IPoQxJ7y23GQBOkI11DxWJ5hp7f3pR4YosqEQFcCXlts3ApGaU+ko8qHXGmRPFOOh
         APDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933708; x=1788538508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=JpUsjFlhvheV1jS2IOhn97APAkTQQdUiMUPzRA2FBFOXfHqDxlDBEkEJS7zEGj0Tfa
         pnMUm0yTYsNwxPU+q37BV7/TwBOKIdWpd5AWUK3bXvF6vsOk4djgmGe980uj4Sot6WKx
         L3ECXpXUFbh5a2rp0cJTXvQYTukelZJfoPJ07j+tApWf0vb5AxnDO4/GBZM+RisKLbqf
         NsDoTWvX2iJBDxsmzR3HZFerIjR3FGWyoVvy2AlelOpMeYa+UQeYjvZKyjjnO3BXkVdW
         m4mBoHMDYkzZ24PeqI1p8mXVSycPbaF6mEte0T3T+9pqN8WzBgqb8su6dUolR94OcdT2
         Us8A==
X-Forwarded-Encrypted: i=1; AHgh+RrvGIP7y7BBAtTTlUG7vK30c+Un4/ISM++ccFtU9d/O9F3lAi9LqwK7nkv7epFXiZoavM4qqbdWuNqYr0A=@vger.kernel.org
X-Gm-Message-State: AFuF++lJWcscE9VY/K6KpWRNaCtGUkbqUzTfVf0uDj/BZiSLcz47hx3v
	CKviKZqX77KD7HstgC15rr3gO5Z+NhBP1dsDyUnXV3dsKJnBm6jkFYQF
X-Gm-Gg: AR+sD11eF2WtTMDifbk/SnUc3x8FaJTVftM8miwBWHclG6mh/R1+Ib7u7gH1kamwt4/
	LHDNhcAIZYvpM8RPNnInjGJsVbaOft45iIMuSZqZzOYXqrI+obhD+ySGA7mcPOD2cZZnXC1hdfK
	UT713MjN3wU3vDSwuadpKp7sDhMZiOwtV9m+wp0WU1YkA5f78KLJ3O2C/ISESGPDM1UDMwnv2y8
	tUBZyKqyt6FtDID6zZtH++ciYiM29Fj8XZImT+Wafvoh2QmcgK6WrY73Yp8OKRe28MdYtefUWic
	PXevrbAddMPt6iG/nnKneY6LbxT9ZWfe7aI13UMdFnj66kuyIRlKxUYLUTwVR4mMl67rkdPr3I4
	sQuTe32drLr4Y87QTcDs0L2VaEbuKvoGz3Z2MItVkp6TPotxZxLbqrI57k4GEa23FmabPQOCTR8
	hXOvMcGE8wp+HkklnSjFgCsxos4b/8gLGm0N5C2HK8gOnluPrf7nkKxAbivrf1+jEx8g6knDUHe
	0kfHV31tjYVCuWLxqhgPW6vxmIxoS1oBbbmkGvk7w==
X-Received: by 2002:a05:6000:41d1:b0:47f:b51d:f0ec with SMTP id ffacd0b85a97d-482f79cd0d2mr14102631f8f.15.1787933708396;
        Fri, 28 Aug 2026 09:15:08 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 03/15] media: ov2740: Use C99 initializers for ACPI IDs
Date: Fri, 28 Aug 2026 18:14:45 +0200
Message-ID: <938b7c91985b4bf4b20dc9722453c44a4917a31f.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0


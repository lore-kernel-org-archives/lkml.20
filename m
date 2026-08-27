Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33C14CA292
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854691; cv=none; b=akM3RE49sJDreQ7L/b1A/ixZfxIjRhReKk8O4BDOlVfGFBqvANLdXEkP+Hrae7mmblyORJxjPGn+S4apoHHFmRvZgi0oBcfCPwmHe+zVSBd6+OH7C5ETxYp5g30s12PvmjLSWwxPGEeKdPMV3OKA5wNvNg9FVowSZd770/tEs8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854691; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhb/2OQ4/q4n+PGyWSDDbh8RVgVqCQjW2OHdQQggUeJFQzLEoqXvj3h9bgx41rQ91oqTdzPyJ4T2CPgWYuVkHuIRHbJB3xiu0sNFK4uwp12EySGnSYaWq6tSx02FU0TCrXoofv4MxJ5bC8CwyOAMH2UzIU6KydfIytatAaKaT2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9fD0Qvi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9fD0Qvi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so188525e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854688; x=1788459488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=e9fD0QviteEKAZf51GIXV7KxTXkjgTTk+9Ko9lkXhUvY8iZsB1DvbHt/J7biDkr7ke
         DRML9PW0H9onwCPxTpJFozT/sF3BRrW43NF+chIGn4HvvQFIEYTXLm+Cm0CqtuR4U908
         Z2ZuvyWwj7F8qW7xfb4rkqHhWlewm7+1HkFbQ1zFTGDKZBK3WumiDwba26l84hcUcZi+
         KeAMQAZ38/joIu8maFOu2EHqny2Jv7ZB/acWnRALwnxCm2iVJGjduy77LmEgXB+ShtBG
         jcFkVK5/JMw7cJIN/6Y7tIbRAZksipXFwLBObQsrXcsL1ooxirL1gpt7BOQbNfKUuFUt
         CUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854688; x=1788459488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=SzuTkPxg0nv6F9w7XA4esVXxceMJ6sIlzwwlY+9K9gVQnilvqBNuDiAk85PGwBEjyK
         vtfZMvc4FO0t749ITKpuWyGFM6C3jHIlYZN+Hxp/Yzmj4R/GqN9CXwHGX3Sw1lA7jR9P
         FDdPmfUxWNoizRx4WwMSH93yerurhzpq34TNU7kyikIJq+Ad1hAaH0aD7uCVxsezjh8f
         O75c5pl4taDIj3WdcSRXBNCzRoNEz0LqscLec65pvqcbOSS2/TL8wHyJ+MZChHEwro3r
         mm5xkUshllNuN2/ntMJrIDK838jMZHF185SX2AQkjpEObWIGLTpQCcjX/IVon0TVZM7r
         jfbA==
X-Forwarded-Encrypted: i=1; AHgh+RrEZgpoNE4A+F1NGwchvxW51LFQgmYl2uMecmRCeIPL3wGv5IhncwjAtsRJyuDuaYXrPqDJkDBbgKTkDtk=@vger.kernel.org
X-Gm-Message-State: AFuF++ngUsdCdXMoBhvnNm9SPpKVQ6StcKNdReo5EPJzJoj6gaqc/37f
	klwykmKzRIqXCeTLygQKIaecIr8oO/Te8Lyus0c9DJte8j8btwWnTBuC
X-Gm-Gg: AR+sD136ZGWlMC/+FClwmEDIo0B81SB665KQ/4nzoLXRmmIHW5baESnm32oB9/Tt2Rp
	0YOSGnWuXuyE8mPjK4iQiLbzmKium39yjYHlIE71aJUWnanC11yf8071I3gYcmbITwszwSg7nHN
	it22DnQz01aj+79uxzympf/fInM/8imMx77fgbUulA1N/mB5eELGH1weGWm537i6cBt2mjk87fS
	bgDdV7YiBHblIkgX38YDAl4H1rhKAzakkCD7ASh6W3hlKtcjcnzZOk94SMlQ1y7GGU23RclPxiP
	2kvtQGL64wQSbD++ygDUh8tfFYxgYbsxZqYqjndWRMHCoyIm4xuyrys+6d44BCq5h2PsVRrWo9F
	qVV9NJU0BIfFX30zluuHgk5BlywKThqaZ5KmRb8PNgvRC3toSmMxX4J2gV+5tbT9pjpoEl9BIBo
	XAYrgp3Rfh9z5pi2Vbh9KBYx96/BppxZxgw61sFd4SjAkqu8hSlVCER8BPDtaTFnjiSEWG9TR92
	6korJ5VxiP/iHfsALUuNMzFOMOja61wjXRcUgQTyNo+
X-Received: by 2002:a05:600c:c4aa:b0:499:d513:e507 with SMTP id 5b1f17b1804b1-49b91c17d72mr10375995e9.2.1787854687907;
        Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 04/11] media: ov2740: Add OVTI2740 ACPI ID
Date: Thu, 27 Aug 2026 20:17:49 +0200
Message-ID: <20260827181756.2430054-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0


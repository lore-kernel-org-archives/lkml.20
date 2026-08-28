Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83F737F002
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933714; cv=none; b=c3oN/WVX7KOFaBARXQJ7SEDFgw8boC1GOGR2yzROLFViwjwgPQJVDZvLzviRM7U4Y5XY1XNdj2EC9mapVqB0IJLLrZVjmqoXnZOWRQXwuxUsaegeQWLVWA/dabCE59cMEpPyz9CJnRvbiFNZvR99lK8CBetq9BafIEewvtlMnJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933714; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMCzn5fAnLlufk35OL0iew5FjRMB+gSXAKBa/BUNb6GjFiHkzQzCnJbyfE3zAaumb1SntPgme3Yidmxq4FF6mlwfWfcCN3zifsFN3/uA3axSrZqQpszVPp854nlVgiRZLOzgFUc1Vsh+/wYczsn7DBexnpjAqpvj2YrNKMRt8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ap5BUqPz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ap5BUqPz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso10289125e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933711; x=1788538511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=Ap5BUqPz5lPNAQb916MwW5jA/j979IHnJu5nQ24b77gmDBrQPXNo2CXoz8A2b7z0aM
         /PJW40/wK6Gzt7hcRFJA+D65KZh3LDM0a3gA/VNKgwRvK/+IOOVgxql6e4Ftd5eorTZL
         Qf6+y/dDMNJBHy9PwfVxD8xK3WwjNWaiCxWTJgzTyRHAbSmIwmKn54J8RqgVC2ux0sD+
         B01ZX4kZJa9YuSUwUr94i6UeovbmGt13FqyZDaFLixH8Qq9L7oGb/BvKsBduknbxYsjf
         0mmNK3eIbkGWAQEsYh47e6nupSQHKB6kruq+fJUdFBTBv0bt+URrPZJKVbjEP04ac1yv
         HDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933711; x=1788538511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=sX67E8l2+LHBOSXYZAcKabL3ul8Y16lvarUW9XRpuE9x2Yin/Bt7Ei+1cdSpQv6ufJ
         L5JwndKsx4eofhjtak/v8MNvO6H6yyaz6lA/IezTYnYh7OxKbdek8+62sv98B6YPd0un
         O9KQCoUKUFMcyZe8oz0CL8PC1Sp/eU6H5R4nn4bzr0sEhMgqfqaSqagHYnBalZxOxzoO
         NJ45GjOsPmlWC5yOcwSiBBvEWL6DTc8KwfEZacBQBzsFPZUD1+VjwWOWYuSvLTSkvx2o
         gKEX2f8MLa7hptdcxqdKEXlLon+YBtHb3tVmG1F1693FzGGn7+NdvK0LU75eGyLP8azE
         5WeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYqPKa9gEuI6pQbTpP9JD3ryxD249ti7oqGAI8Ye2kSqVwAli62ZYhLtEfpC3nIHpWKWh7u9IRMrvssww=@vger.kernel.org
X-Gm-Message-State: AFuF++kCMaHgqhv+jTH3/5dkBiwd/JqLfhOr5YpS7Ey6vHdFDRGPojqf
	HSzdLR1Whr9Jse+w+mlNeocowSES14H9nlpzHakqy3EOp3bsYa9OzY8G
X-Gm-Gg: AR+sD12PwKa6BpCh3AQcgU+4Nb1Yw0esQ5I8N5PnfE0GdXizUeRA40hkvv0zRYnh3CP
	7Yc/SoilKYTDaCpm0sNvNd2pF2Ro7i5gjeFVvTMsxwZKgFIbYPttP9RTYau6ZoFy5uR7MD4EgWU
	Yrq2JCjSOpcKJ+Fc4N5nWWfO9WKxZvQbEjBJ9af+nQuizVumkPARpPZRMqxacPfN/ZYYbrdUQ+5
	+LHppOAFROkAXCwJExen/msPMUcjd/FNt5C4bJB5XXFL6didazKajSaL3PJUyVzPD6NBGi/3SYc
	OojIIaYxBwvugJbkO3AvmXM8pp6fa1ehaw00ey9ZoKHCHjarkSsF0MCaO7gGKWYj6lUHbYUnT0Z
	6Dr+ZciPGf56rR9mI55rrk14RgqmGBYJN0DiublKIz3WjmsgFn0F7VfVjePKF7toKreRC90ZofH
	xLM2IK19e4I/5ckYpQ1ApZXK3iXlPX04SJL4iyyN2ws7Bp7NN8gfywqJ8MslIwrN2gd+1Q4su69
	sJraQXUP76NpQ8LgQ5Et1to8X3o8siWB9+oG/N6Sw==
X-Received: by 2002:a05:600c:1c0d:b0:499:a5fc:207e with SMTP id 5b1f17b1804b1-49b91c338dcmr143772225e9.8.1787933710585;
        Fri, 28 Aug 2026 09:15:10 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:10 -0700 (PDT)
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
Subject: [PATCH v4 04/15] media: ov2740: Add OVTI2740 ACPI ID
Date: Fri, 28 Aug 2026 18:14:46 +0200
Message-ID: <a04beb60575ccee57bf0a6079473df7bf735e145.1787933456.git.mauriziocasciano7@gmail.com>
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


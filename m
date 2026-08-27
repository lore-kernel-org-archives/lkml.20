Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82913DD87F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872672; cv=none; b=c46UzqwkDXxKajp9uZTVJ+EAftqC5NDYPggLHZu6GcCcVbKWFMQzLfhwdLgsovpMxclgsNM83151nv4gTaNB9IqHK53+EGZRoHStnmySqJ0ZPf3Fzv3nl+VMNzI8qPZeN3ke6k0MYDmh60wdSX8dGvpcNaXy8N6SejCV+e3ziLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872672; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8IAwVfIY5onLKVuCU0vmifmYNUKbyK74DNqFjCQ8Y6THQBtXkUfr77LnmJw+M9rvMjY7sY/77Y8u9loBuGIAgMx+OUIp/XmkFRHf01p00LiY1XYRg0cUTZtfDBrIFsUmEbKr0wuayOsxzGeh7hQMsofKcjGH8t7ykRW2vZ3+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLmqJx6K; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLmqJx6K"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso1761565e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872666; x=1788477466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=SLmqJx6KENDlA3HWX3/B2Jlzs+1C8LXoaQmcIiKMrZTQ+n2IU6xPCl3MvsON92Qvm1
         vS4dK9egs0GO1x412hC6XXZVh1YySpGpEzCUdDLQrOabfP3H8wkFPrLTeTGuhsCzNZRP
         x/HDZgkxIH/OGisiTdH5G7I2D7OjhdDZpL3s4eWDo83bJ/pIn9T4A3tl9oORgzxOVi2U
         rYI95HTDb7V02X8Qn79EcA47pqNKNKxXamqc3jQTwNf3qA0GvtwxLlQg02UYzQ5veON+
         TpzbPeDmeyQWtivwkD72NzPd2E7CtVeLYOfRRgPhWFcAEOAawX0R3+gJjB0Nzb4YuxNt
         OQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872666; x=1788477466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=a69vwJ6naRGE0b4wTWBwJo6OURB+Ay1nAxDqIlQhiL82PqgN5Bfqax3WZEkZiBvPLZ
         RG+3AnM37Zcai+c0DLIlP3yCdJ5fK/sAesMrXfIm8afmQeJ1JHrDEHE7aafA2ntwXOHi
         Dit3BUlLLxY4AZvGjz6XP6K7TTs9Dz+UZduWwalBBMZQWmuZqXBtg9k0txgpOOPzUNCB
         E4qx1MsaO0/3YjNBd5OItWTNab09+jLg+iY52QvXmkCULlfZDWaOCFUN3artS7NdGvwp
         128kxiP+U5uqmSKLAWrg9LFsdpCvuZTdMUqEeGiPGCHIrbiUB3g8y6GiUT7b14SbA+SB
         QhZw==
X-Forwarded-Encrypted: i=1; AHgh+RpqdKRkghc57jSZSN4yjMYqV+5sXste8OATX6Lww2ApVgt2QZZRVb6IzB2WgHZXW3Xb2FVvlFvLtim/Hek=@vger.kernel.org
X-Gm-Message-State: AFuF++l3iigyMqGdQSMH8JVUoUmIbBIjxPQHmmmg69jK2r2rbREkbzAp
	c9IncbbW2Hp7WfdPRepNoWwFNmKKYiXsEF4BBJBYMGN1DAWOkFaz0C/1
X-Gm-Gg: AR+sD12RM1adG2yB2EQ9LIhtyiaFIGZebpAU3JkWHyZtOe9/5PBzUfp16ARJBsJ19XG
	4r5a2b4PVbNMsVdrJMz+IxehFYgnpYcWE25AH9p1qhVAPxsVv9R50iToPZw5toFmPnhL24STNCx
	2+lxPPtZSQ4pP2A8YEQiaNCMy8woUwSLBcBIKuYyJgZdxAV6QEOi5wD4+LFOxbtD4HSX7sbIsyT
	MhmoAmaC/yDvAVtVczUtoXrnLoV1YT+SBK7EEn74qOYHJ5zLmu+OVD3D8uGM9MD1O3H8V9iRm4F
	bAiPYcBb2IwIc6QSiuBI8A9V/EavHdlih/ffsOwMQzdMTpgQoGqyuGq+gBuZffaoJJVrnTMHasi
	29yJw77iyS8SyXGw7EtyQHlFbgKICaXaWfxBT/sykYkWzFrjhDK18TYn6JltNKwccubWXAGrW7U
	uCXuROapvGi7XZg7AcKOPBVevOsqExIt370HpOt3VY/WeW2mt47fwispEKqZsTrHUYUxqHfXL9L
	fkMxvdG8og/pSOKdOuz0I2o9AULbz77qUIQxhNW/dGYxs9E0tX5l28=
X-Received: by 2002:a05:600c:3546:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49b91c19d68mr30266455e9.3.1787872665851;
        Thu, 27 Aug 2026 16:17:45 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:45 -0700 (PDT)
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
Subject: [PATCH v3 04/12] media: ov2740: Add OVTI2740 ACPI ID
Date: Fri, 28 Aug 2026 01:17:22 +0200
Message-ID: <49e05167a81e22557b7cb08c94131e774e524379.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
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


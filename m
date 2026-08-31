Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5B336F911
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199274; cv=none; b=TVwZucwtA/tLOO+k4aiUy/f2aT2XYHtsGK45LPVJEmdQ5xDDzAx22PDa/H3+HlXEA5NXm0Laj3G8WOmmHGHI+MgtGaDACTPIC6KPYoUbUIEDdIreHcE0M5arH+zKwCLg15zJMLIj6EdbpRwwIYQQQtRl1tEc0JamMIenXLN0bj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199274; c=relaxed/simple;
	bh=dMHhEeZzc+g0IX6lqLqY4IrziqVxJJRg2znt5XQ0Rfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGKYX0Gg/H17zgvzbE1cs7n2vd85fzzdSaY6clC+V+KQVwzDj9Q47+5WVexqcmRGtzWxE90uW5gE8iiM17CIxMtpf4cVqNSsmlxnoCf8RjSNIMWUgMz8SI17erN+60xE/hQmdTL12lG8/vmNeA0H5ft1JEfQ87oCM1LIDF7GnLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hz1bYt9q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hz1bYt9q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482dd6ee390so7630f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199271; x=1788804071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XzF2GiQLWqxybVzvZE6EZJoLEDzHgosCVIqT/75toU=;
        b=Hz1bYt9qegPJNuqeM3uF3vn4xBuE+VJNIQ6vhJoJwi4PMPuXG2JDwX5xXzK3Y0V+A9
         67hTWWCLTfCcWE8IZN4gj8lMpXxXTgEz9wprw7tjkeld3l3nl5XsDYk5JypUsDC742J3
         Q8lzg7dV4i+ayAuywwaRLHNGt59nHwimNcTdIWsjG+a5ebcBireSyvLsmhV+I50M6J2/
         S367YpFv2V+tktMII5Oy335hcFZSKSPF5s7QV3AReW3W/ql/Rti+CraV+tBT3pARXq9t
         5wwNglH2h4i7n9EA5sP3mhEPgwCKoK+c5VIbBmExPpD2ZV4mxWRWi2CvTT2jzrXahf8O
         iSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199271; x=1788804071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XzF2GiQLWqxybVzvZE6EZJoLEDzHgosCVIqT/75toU=;
        b=YNU6p6YhY1C/opKQR2p/VD3+/1Cae8UjIFK1ZeARn49YL6CoovnOKfQsl7X1z9QVFa
         S5sV29gpWOfqc4dfZPLEIvco6tyDmv2qRh9EILZJReOuKV8hcy2cLdZyxRvFmaF17x2P
         4rbQ7ZgZS2DVIRfR6b87cc216frzwZOu22SOgl5vdVLqBUKRj//hA1ZdZmVfWzvQyKbI
         M3VFgWGwn7nn55a+w+N9ZCMb7SkKbm+u4lxC1NyQv0/F+DG3vjzlawe5gBmhD3m17dIU
         mWdWxzOJv+OMnT+nnE3OBY4FS/wkBS2fOsEjQTGb+7AHS/0ZC110Vi6JKIh6Htw75ILT
         5KSA==
X-Forwarded-Encrypted: i=1; AHgh+Rqd+1pd78wTFswbklE2kiO0SSdgAo2jhjPtZNU5On3PMz3vJZEPQ8Jg2CJdJApTFIHj5h/8kf/fFWdLd/k=@vger.kernel.org
X-Gm-Message-State: AFuF++kBVBQiv6wmuk0ijn+kFHE7JcGqv1BKYjdHsKtM9gkPWH5SPkRX
	zB+S6RuCYYn+r8wvVLHkMnoqD7gvKKbWAE292Ib+20B7zaG7xAYgEoOm
X-Gm-Gg: AR+sD13OUkvMvqL1a8Dhzdw0BvxJonJNv46TtV6840m7I5q2AHGWZ+JOcW+ZOba05hT
	2DFO6F9M1BgBateXgIMOTCGCFfCDorTGfvOy0xJPUDUhDKzeZTjxG1Hhv0N4bukn6ZgJu9WrTAw
	84SYLWI2pW0ak9mrZVs2SKIhlfGA+HmYeR+scLG0jzmIqXyiYgtvc+Iku91sLF+75EoZUUC/tQN
	oy+p6BLVC1xUu3552FebO/OeH3DijupWI4zUX5YlRRjobEJ4t3NTKFGMjV++erKhBO0lZGbMa4t
	c8WFDFo4Ifv6/6Uk+sR3qakTPfkcen4B/vrr6vJWRNs1E7gJLUWcipQDfOWHboDyPgIl94SuA/j
	hfhHavQ7G9EGguHz6bylpZ+EHwVaqIxBjOGP/xcoq2ykxxVS6Dp8Casby3d6t1hLuoafcNlkRDQ
	tv6ynMxWievLqaFCu2mpeQ0Lkni91fArUtfIkxY9wX7y+IS08xLSnBThq3YwrGzZT+rykdYjcu2
	kz8XY2FY2gcSa2oIj0AqnUdmQinlEA7BGdxZd+em5u6eEShJrrDMw==
X-Received: by 2002:a05:600c:46ca:b0:49c:db20:da13 with SMTP id 5b1f17b1804b1-49cdb20dd1bmr85500855e9.5.1788199271314;
        Mon, 31 Aug 2026 11:01:11 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:10 -0700 (PDT)
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
Subject: [PATCH v5 03/16] media: ov2740: Use C99 initializers for ACPI IDs
Date: Mon, 31 Aug 2026 20:00:48 +0200
Message-ID: <20260831180101.3109854-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
Assisted-by: LLM sparse
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
With Best Regards,
Maurizio Casciano


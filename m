Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821B84A0145
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289490; cv=none; b=WCxPccM41wzC/GVM+YVoNFudhbDDIkgXa/igFVSPprWViqgt+h7FDqD3+fdKbHU9OHz2Z+98NQzbexuqdPErSle2E4KLrXyXHGt1ZQNL+nQSMxldDeGRWzCFCRj8U/UOj+O/hGq4AyiijTu5Fa+pPgfAYfYjmpcnAcHOl9vvSyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289490; c=relaxed/simple;
	bh=a4oCgSJxVT+Yvyj6OvJRra4F7RQTRxH4QG/o8/Ybv3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gn4qLp0Svc0pB3h6fe11St4/paDzAnm9nwrmKLHudz8jPpR5CsV0+RCuvYuALs/p9ouRB5Th/2HaUAJ6/pWGdN7Zp7A812+ph8+3XG+DQPPTZXSqZJKOiHID55EyZUUmRQs6/od/unXyA+L+V7CR67zF2j2wENewV3KniZs7yK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8p6HHou; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8p6HHou"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so1860205e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289487; x=1788894287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=g8p6HHouPjaphtlHw/gjwdNyM7g5uTt79pk3k3hanvH615n5QvMLdYpzJ5qRIvFZ/2
         l6CMwV3T2lo5mRWRfn5YW7EbwDZTx4mDwm/qEVgva3RGobrPa40nhFgQTSpvi1dIdMl7
         JraPKRWNdp26wMraNdUwjz4wRkYx0+P/LwNK+o8f+rN6lVzgUUspyz5e2K4tSia+ugYz
         a4QuYmx32fIRh0JOD5LGR2c5fTMnLEoj5STJkm2Mmz6QgM9f9CVVckrnMal9fLnr4zkb
         PWr3pKlbsJfXVflEB+AlphVZUVsanxu7ao+2D/0wR+Znx0/2UGpvklWC7+SkUeGsYGXT
         8KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289487; x=1788894287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=Sf/bzYXhX7wZgXjDeYQdGeWzmsVfTGHcE8+d2hZqUM77Woi8tuxHfm0Giajs34Xhu1
         Xs3T6RE7ymLl6o8ey7rMwmK3agLssHbSws9T8rVW3E+03CS8PVwNFgsm/t/OuSbSeNUW
         O7Smgbc+sdVUSF3/sNItetB5Cw3IwBCgZYG9b5BKZn3IqK2EtqMFPjfykUz7hizSMKKx
         CEfsgSkz8znC+WHpgvXQ+rIcDlPxI0uwzjZ0sWPoDircuM8uO1nVBi68+drVhsf1+Tdt
         u/aQIfOxBZYFgZpDFfVZMtp2V6nPFKhDGdZE0oxFFrdff01v5rtcIY7MsjKTxN4oBFTD
         juuw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9ADpgbJHL852OQp122fKyzfP/BR3KB6oIcbMPIKp83gV2m4iGNpPddk031Zmm5SH3DAmLSfMRf82Lm98=@vger.kernel.org
X-Gm-Message-State: AFuF++lMJdvOdVLD2wn8sdX8/agmxIwynmHGlWQd485cPxPTyDxg/B4Y
	3VsqbLKaHZxszjpJlsE7nhXJYA6+MshuZ1ywKPHNvm1lKRUGCyQS207M
X-Gm-Gg: AR+sD13QOeBt4arlQaDSbMYETjVE68sF4xNhTf8QxIbo4xbV8ufdvWuiakkdj4bRfrL
	Il+0jRV1ZXyF8XIv3kBrhZGGuGjYVK1rLXXUhvGS3CyfVvheHG+XtD/ZquTNLigBK2gJIsadOJa
	y0zddwamzGy0DdLMAO2fSUAmvEKrTOXGK0JN1LIUKbFYwYgj/WEkF5k0ZYo9dcPiIjFPEQMtTbM
	J+oqWpwlEqysNMAOA2DdnnFwStjk3+Cc+FbxYjVA9OetDkzaSrZqTP1z5m67DwPASuYL2IOpcH/
	ADg5k0217qXF0leE7zOrzasf2X2Sks8vykZ3CkPZjsTe12xTcSgLRLqkSlnHlbx22/bB8IKhzcV
	vzFAwmykXqnmptpEF8xzg+z1LeOXOZa4hNIIUn5vs3r329yT/en6iFRR24OkzPpchRLLsSZ4qrZ
	gvIha4dwNLxRo2u/FEoc2y20VNtACWGSBgqAV9FJEIkvXpVtRDurfoJwhMpMbE46wcCXr/8WX+D
	Kuhd9IldBORCezkY8r6T69lXS2y+GvaaLPO6Se+pA==
X-Received: by 2002:a05:600c:870e:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cdc43f461mr233470195e9.12.1788289486489;
        Tue, 01 Sep 2026 12:04:46 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:45 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/16] media: ov2740: Use C99 initializers for ACPI IDs
Date: Tue,  1 Sep 2026 21:04:25 +0200
Message-ID: <3071a34e3cfde59e408390b6056dd551d5639162.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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
2.53.0


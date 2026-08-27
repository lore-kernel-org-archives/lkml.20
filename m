Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C344CA28B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854693; cv=none; b=HOdEwsQaapNDVXqF1fPSbRCALCR21SCjzdl87e50KCEI3FHedN+aV6lDmA8iK6fj4e6ynXjQ00ZF4FWpF1SsVt6nJraB3QSCjPNCvbAp8TNMvZ8ngBhTu2sM41oYpQGfkvHGnirjXmXf83jdqvNugfF7bvWKErNuyZfYzIBS3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854693; c=relaxed/simple;
	bh=0W86G1FVyLrH8eCxu7apKBLqbZHmbhKhBk09k3X289s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUGaR7GWr44L4xXHJOTdgxNm710mjceQ6S+e0DTboxvDIohL/yuB2YB8MULVSQwQwg1Csit0vGpyeahaHdoQZt0wc5YEnzoJyB4B2YH2/5QPNZyz3c3AvENcCjVlGgksOKfPKuQiuPLiB0YI0SOI61g6JXJqAoUlEhhOX7RS37o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl3292NS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl3292NS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so372725e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854690; x=1788459490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oYYPYPZQOW7+2xUgNgawJfoO4cMemnykLQ9bttw7OU=;
        b=Hl3292NSydJvei6gRxA//C+M55i8MERq0DeG7HIgnS6bO7A1uo803H2AbF/BPSLZhl
         8U9foCd4g5q96rwJcgljPsvvHNVpOzr0lpGtdgT9ah4EmHxZ6N12fbhSHXrX3wVSVC0O
         /1ZaQ2+ohXEnP2Ckow2M5q6sTlUwDjsUO03+5rTEfO4LFcN00uvX2fAimdJXhw64MUwG
         n59I67reacElewBQ8JoeS0Dpm43cgG16lbj4xHtws9hEqka1dyNzhB5Lh8WAyf+iwl5l
         sN3HY4qGp+fwdBoyDq3wuwcXxkXE8rbbM0VFv2uRZEBa4WChcMcfPlhqNSRCqenC5seC
         HRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854690; x=1788459490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oYYPYPZQOW7+2xUgNgawJfoO4cMemnykLQ9bttw7OU=;
        b=D6ckXsQIjWWeAymH9vXa61hM3X4opna7LTCygCCzywwTmCP5iHX/L0D5/UYP2zy3g1
         GNnFs6ev7c0s1pB9flPUC+SJoqVVHzN+ZA7NRwZ5qF4lZ2BJS6jOLKKKNd9BBRSrqq6V
         n5C0ACF8eR6AaBtTnjKPEFQahXWczR6L7zogK1OuPipW3KCtzb5NrpLcTLchQkTX8GqC
         q0fv1WCFX7XxH6xgyy/E/21M+Pj+qRx77INLrjXZVwBNi/WuVCMTycHw2lUHGhLMnSUi
         7d3OgFDNkBVBKkaRw+Q2uvc0QxN0MlSDNtQlCrArrUgdwR1chkyjCoWGpHgw7SOyGyYa
         0pSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8d1vY7Q81rTx5tJ+D9dveNjioy7fv+M0/6JMNCt/QAWTLVPoUA6SPHDhiua8LB7PKWSbfQb+qsoDjB40=@vger.kernel.org
X-Gm-Message-State: AFuF++lN9amCRXAuP5oZrFFbONo7qlbPDLY+dKfj9HatMv2L4Ou4rjoX
	zUD3YKRLS68z/DtLplvRcJdCi+4BIyoCFFCxwp6nCaxrPKAuP4DBJjkb
X-Gm-Gg: AR+sD11kz+hscWx5VTNWXdrgeKF56gP74LOSXKWxVpBtEMRHSJyerNrVJ7P0mv/a1oS
	9AJKh4LURb5BeY40p8yhLp12Fi5g+qiCWZei76QlNanaOx4zRRyHXHz0LhJdO1XiyNgy5AJwFwJ
	7tXP4Qi+zKfGFjaNKCbIqdlt6jXcUTiNh74CHBuU9AOLSwBd37pU2/m3xwbT+HMmuWMSYy89iBL
	kCQeGpeBSkZBqXHJsWb/Q/OiPyiv4+ezkgJqiMvbMEOP4nbHluItzWZxsoZIHjASPNLn+ctk7kD
	T2ASyJ0vOjP6UVRBX0BOh6ungfA6pBI0+/RqdZ4z2L68HlbyZtH2RAG5ac3MOt1LFhNPwrpIK2P
	SwCjl8maOD87+vjKkoiE4OGASPOBf5ijxnfXUZfukzdQTcF06TKZgUx3dfp/qpGfsirKNWrd5zA
	iXzwxp/d9raqa5n334HI26uRMs98BGalBjcw9N6o01OjO+DirYJT8gP0BRMmZF/vY+RnOZ+OUbb
	oWOnzFkMbFF3uxPK3Gq9PWU/OCU+e7foJeUr1HPkNuEKMCKzb4RKrM=
X-Received: by 2002:a05:600c:3549:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-49b91c57464mr10724595e9.10.1787854689919;
        Thu, 27 Aug 2026 11:18:09 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:09 -0700 (PDT)
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
Subject: [PATCH v2 05/11] media: ov8858: Add INT3477 ACPI ID
Date: Thu, 27 Aug 2026 20:17:50 +0200
Message-ID: <20260827181756.2430054-6-mauriziocasciano7@gmail.com>
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

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index b8c2f0d25505..b0ffc366a4e4 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/device-id/acpi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -2077,6 +2078,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2087,6 +2094,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ov8858_acpi_match,
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0


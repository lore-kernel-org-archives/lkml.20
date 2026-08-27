Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F003D9DB4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872634; cv=none; b=tGCqXajykJBLH5b7AhoNYhPY9pS3u6Z7MbLAwP1LVITm2s5nB+vc6KtI00G+xm+TFmQ9she4ka4Dh7AxJKj7Ur1Gi3zreBdbLLum7I4PeIpQoR6LAW5/TYUQUrn3rut27yHklfqjAQvTDX/eSzHjeJwcx2HS4u9ELclXxpGgEs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872634; c=relaxed/simple;
	bh=2S4T0eC7Kmna1hk61v36MroRNq9sEQ0STyE1FoXfjY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fm49dfArVY8gUTtR0af9GENP2X/pMW1swFY4kDdTu5ehg/oBiKWIapf9/xbZBoVfOXX26Mf6dtlPd2vRisEpDi7tBscOwXPbybAHED+NIVWnbbKjb4RYplePPop4p4uxTFDgVSjY5fzQHbRi8io+5a40pIgKZzsTQwaJc+hbtFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il0IucYy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il0IucYy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482dd6ee390so299015f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872630; x=1788477430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PlPZyn9Gp7asBZlBMMq0X5F7+8cWFv/GI7YGe1ICCI=;
        b=il0IucYyp2Wq1zCqQYKiSqYMgpy5v1dvgbsfiTvZCAcxJUxAO6z52p2wIv2xdCxSv+
         o0obOquyAbApXYMrLC+rv1KhdubiVV3gDDoryzv7B+Qpt+EbH2xj3LdaHtOgGGVIVwMT
         Hz2CNrxeKNRsaXdAJeA1k1zWZLLWaOhiGaTr/fvoyedjtHEKLjKTz5pio0usbA2zHXtu
         3JIrXW7eZLFkHIpm5AX3t+1+hkMcvTldTDK/iyLhvC2A2qptXQYCPKqnmXxyid7ikKdZ
         a1DfvH/5JPq+ddtEVMbxoPvXFVy7bSaTkrPf1NopZsgyI5t7YiFuqvfXpf0ZYOOdgnkP
         Sv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872630; x=1788477430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PlPZyn9Gp7asBZlBMMq0X5F7+8cWFv/GI7YGe1ICCI=;
        b=me1NSrutQFerIAMOGmXCN5N2Yq3D9mXmQb72MouLYfjhAfDx/KpsDRh8/VLWWGGV4C
         ik1sWuyhOo5dTcfR/Aih+/WQo778joGtpq/10AxFKq0So4nHpjUsvlNjUC/eurZvxx95
         87djQn7ZrR4L7Ew9VymAi/Oph1L4VJXa8j3Ch/XvDQuQjASvCT3pDMFOES+HwRKXVl1b
         ah2PWXygpJJdY/IMrvvJLjzNS6Qs5M8oRSqGAuzG21JKQMyLTVh6Itsbe8lue9vF2q+8
         WMuY46ZwErPGJjZdF4ktBuRLQ2pRYFDs+IJ2ixduj2rXRp+DW5mIdICJVegVYlhCjb/W
         Pe6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpytJBpVPEAHzaQOm/HlHEwtFGfqw4zQXaWQKP+wFDJdCq0vFDzUTnHnFobmoptk+lhjQ9VtYZX3imTgIs=@vger.kernel.org
X-Gm-Message-State: AFuF++lOjqFdZYro3F4q6isp3XJZ600dC44zk5ue8Jfwqrfvff9Q5qml
	9IIjTBbk76dozapJnopxoI17BQ6nxGJMqGSWEhicZ95vguQzw+fdPqLY
X-Gm-Gg: AR+sD12PlW/lXiLAYSGC+y71LSPtJzK/028d/cGHzyTfD8epA1HXqQr1FaP0NjkZxZp
	hHSZa7zkGNeB/savUG/M7AFX2Fv6ry1XilMQk0QZWjTUOjotn4YoPT+mWWbD/+Ljz2OBekC6AHC
	4W6DJVh5vqqUV4lXSS1sAHXf5PMyGP34AAzoH0JsnNx2akwPqbAD9kjn7HlCFLtuQ0hjEYTxjqg
	KwkTMKa0Byumoc/GEO41Uvaavc7aos+WDFIWkXStgIs3eha+B+rtBOawSJkNcIIJKfpC+kO7vAJ
	z0WdpmtWkcIWwIhP/eYlooDSQbBOvzZbG6/Y6ZTga4PudOjAaAlV5iCopXEgk9/g7bR6RjcVWFb
	k2aBaJFrol40EQ5bA7ZY59vfAmAy21IwgR+I6RIj3RF8m75wWt2yyTJD0lDYr2DZySXDGVKjDYF
	4a533TTUvygg6YDKHzNlZkGkKG6uY/WjbaQT4smAv0zqC5aYc2N6yH3VB+uOiwhyfkJgX5M/mh2
	78+JOhB7eul6BemS6atTbnO++t/euBk2WjFq/60OoEd
X-Received: by 2002:a05:6000:4609:b0:482:e451:6810 with SMTP id ffacd0b85a97d-482f7976116mr3794492f8f.1.1787872630215;
        Thu, 27 Aug 2026 16:17:10 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f5e2fsm10900940f8f.33.2026.08.27.16.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 2/3] platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
Date: Fri, 28 Aug 2026 01:16:59 +0200
Message-ID: <1730abf78a36de8e0f0dcf754dd2111da8926223.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L firmware describes the TS3A227E headset
detector as a secondary resource of the RT5677 codec rather than as an
independent I2C device. No client is therefore created for it.

Instantiate the device on I2C1 at address 0x3b, describe its GPIO
interrupt, and provide the mic-bias setting used by the Yoga Book
design. This lets the ASoC machine driver use jack and button detection.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../platform/x86/x86-android-tablets/lenovo.c | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index a8c849ee03db..88693b9a1b01 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -149,6 +149,16 @@ static const struct software_node * const lenovo_yb1_x91_drv2604_nodes[] = {
 	&lenovo_yb1_x91_drv2604_1_node,
 };
 
+static const struct property_entry lenovo_yb1_ts3a227e_props[] = {
+	/* Value taken from the Lenovo Android kernel code drop. */
+	PROPERTY_ENTRY_U32("ti,micbias", 7),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_ts3a227e_node = {
+	.properties = lenovo_yb1_ts3a227e_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -304,7 +314,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.init = lenovo_yb1_x90_init,
 };
 
-/* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fuel-gauge client */
+/* Lenovo Yoga Book X91F/L Windows tablet needs extra platform descriptions. */
 static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -315,6 +325,23 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 			.swnode = &fg_bq25890_supply_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* The jack-detection IC is described as a secondary RT5677 resource. */
+		.board_info = {
+			.type = "ts3a227e",
+			.addr = 0x3b,
+			.dev_name = "ts3a227e",
+			.swnode = &lenovo_yb1_ts3a227e_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:00",
+			.index = 77,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "ts3a227e_irq",
+		},
 	},
 };
 
-- 
2.53.0


Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815951C348
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860990; cv=none; b=ZHN6LN9ktdDm8//EDhWFB66U23MDoBJNbnClAkk0t50o7q4eVbdEuLFcO3MPZzR0ks2hvSL3GaMHkHxpCIDXeViqwCIemNyJR3D5u7WpwTPbk43JPt5mBNU43OwCErnPbbzXmWD81iMNqucDo/5QEjGPPwzCLmaoizquxke5yuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860990; c=relaxed/simple;
	bh=XQdkUvgOydo+9e7O8MX2+dcnxlTods4ZcA5zB20fLYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2GkME28QjOg/EKF0TxDtWboSY8kKWCM614GaGB7NOmGw7E/MvvisENK7HVuH5QrR3TG+Di0qr3PoCbEg6XSu+qzwT1N+4x0H8XLPudZCXduBdrr8KAfunGBG83Yayfl3zO4TDOidVzruGq0QsktUH+/7TyifhmT3vXHp9IWm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DutMdQAI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DutMdQAI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6efd73032so44370175ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860987; x=1789465787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PBUJEeFBiWjNqjSYPXJZjecT0G0qpYB0cRk1PSNGo4=;
        b=DutMdQAIG+ipXfZbqZtXHvTTA+lkCIFdp3txm76S9by7FFFn3vPs+v1KeJOgP2wrdw
         z+K4bqvlgJYX/7rTiHqsLxBHWh49KGMqQgjEd1D3oyMGTw403Ro/ZiFvOh3/Tu30MoOJ
         vNfEWC/lCAVgCwli8sC95J9DyLa/rOjrnrtVh6upSOaHpcQlEivRjaC3Yn3HmLY29D4N
         1EWzndrfGs7iD+72MWurvol1ybvwdw7w2sCUDDia+goNMQLIIjdmH+vGI67sZzsE8NdP
         xITxfPCvbhjMfx0Gm2YA8Ym7MOIcIDNhORKHMFDkKsi4rtGG00khrsxTIVivr9gJOSvr
         zl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860987; x=1789465787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PBUJEeFBiWjNqjSYPXJZjecT0G0qpYB0cRk1PSNGo4=;
        b=bZx85ldgJbETMyPlJAewgxTatya/wbvUQNuwjHh/dujE/crfk32qsl2tc8rZf09LKa
         vwz7RerOvVJdREk8D91ekOqXwRtGrrIWfECVqBBcxB72Wr9eN8ESYSZdux0D5eZ1YHIU
         AA+uz4FzOyYvug4nnPOqtD4+bJ1/Rf1qXOxWGNmmpkLZQErwiiLPD65tE4jzkJnZMaUd
         61yBSOR/u/8JVn9QIbjC1w6d1p7kIP9QFjoNfu2wW8HKUL36e6pvY/Xuwdls3UIUJESi
         2GvBwG9zcL6Z3iWZnCQse1Wlg+noy54/sbRbSNWYnHj+DU3TGFsYEsV0qnAWauQCkLHB
         tGDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8nxgXiOgKYPVAioSBnlQ0Q+AZ2GZSU6QdDezj7W6glWOH4O7LV6iP5U60gKcDFxDSD4GOYGbYqPUnwGg=@vger.kernel.org
X-Gm-Message-State: AFuF++n0rz7utuJNausd0hjuX7L/2L4vZc3HBSs73D2RKjmRONsJl5zN
	uFprPPsqsi8KotXzG53EVTD2Mrl5tpE9Mp42ipPBNqECPo0XwOpay5pw
X-Gm-Gg: AYBFou2mdTZxw5Mw4fdQXlWHZVUmwYmPxeK0znVIqswXzinp0Xt9YbKHYSMXFkmTVPz
	RF40dnsRyVE0REXJxmprBDJARo5Z7wnau1jMpsjjTc1akBuYjpRBjaTewkEKYDGGOB60lnjW5TM
	WDcqkBxknwrJhlX+TP8re+ry4YYninTwwtHOEXovtpE82U0lzW83y/O5MS6Mo8bLqnK721xxe72
	vSxnScswRn93PAKtx01p4DJ99+/65S59s5U+AZK0ybASs/UCAggL8UxJ1l5DJo5bTyHUWmGBEwO
	RJ1eksIJwMyKom+QlZfqdDGryHF/6td+/WVj5zOcvJDGE6vnm/OBNFEdtYRvzV/UhTSRiQ+d/mI
	Aq56ByY+PV5PeEoBYQikjwbkXxPjZyCKLLgRUgILHE/02l7Y1OEVxNpyXhkVDAtfpW1hoWJPKpo
	rYtw1WItuODvmWch5ysu53SXgTfWgMRqex+FQ/of2C0Lrw0NKZwsbdxEPtzX7TwRf1trYF3/f0/
	LFUvk2lHHNfOLta3IVCDfBs9EYi5JuNCiJX6bC0WAezPXiTqvde1A==
X-Received: by 2002:a17:90b:2244:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-39b0865353bmr36029494a91.18.1788860987304;
        Tue, 08 Sep 2026 02:49:47 -0700 (PDT)
Received: from sergio-82n7.fritz.box (static-23-234-74-239.cust.tzulo.com. [23.234.74.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm23583208eec.8.2026.09.08.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:49:46 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v2] hwmon: (yogafan) Add support for new Lenovo models
Date: Tue,  8 Sep 2026 11:49:31 +0200
Message-ID: <20260908094931.2227049-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI quirk entries and map correct ACPI paths and configurations for
additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
and Yoga 740-15IML, leveraging DMI product family matching.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v2: Split changes and addressed reviewer comments.
---
 drivers/hwmon/yogafan.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 413ddc721..aa3284560 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -53,6 +53,11 @@ struct yoga_fan_data {
 };
 
 /* Specific configurations mapped via DMI */
+static const struct yogafan_config yoga_740_15iml_cfg = {
+	.multiplier = 100,
+	.fan_count = 1,
+	.paths = { "\\_SB.PCI0.LPCB.EC0.FANS", NULL }
+};
 
 static const struct yogafan_config yoga_8bit_fans_cfg = {
 	.multiplier = 100,
@@ -200,6 +205,30 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
 };
 
 static const struct dmi_system_id yogafan_quirks[] = {
+	{
+		.ident = "Lenovo Yoga 740-15IML",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 740-15IML"),
+		},
+		.driver_data = (void *)&yoga_740_15iml_cfg,
+	},
+	{
+		.ident = "Lenovo IdeaPad 3 15ALC6 Ub",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6 Ub"),
+		},
+		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+	},
+	{
+		.ident = "Yoga 14cACN 2021",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
+		},
+		.driver_data = (void *)&yoga_8bit_fans_cfg,
+	},
 	{
 		.ident = "Lenovo LOQ 15IAX9",
 		.matches = {
-- 
2.55.0


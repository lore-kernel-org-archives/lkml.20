Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F533A71B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860860; cv=none; b=RflO6Aff19e3o8pTPaC+ZrcyJRQFT1J6v8tRoi4WtzfdmlABsgB4+ZDoPZ/nlrCQWuTVrFAraMMhSNYkevVPjK5bb1kAteAFyyKFCf4kKoYT9kyCSwhG6beDQT1a73qfsjN5UhqkRHddMOcQlU2LxqQJVLaqKwe+Jrktz//a+J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860860; c=relaxed/simple;
	bh=XQdkUvgOydo+9e7O8MX2+dcnxlTods4ZcA5zB20fLYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lU1bnpWobEAayQCX5ON9O+Lfc/U0PFUOJVnuP3b8U/53pIDLpXbDbt1ToWbHe2pJINzk3AXwQqBAa1ul4/G3RJc2B0LKWAcTL618QxgYLZ0eRz2i1jyGzwPPfdOeEZ/5bnxC/18pLjl2ZclYuST/LUgHAdJAuOJhH9ak3u4qfo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIsiadmg; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIsiadmg"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so4571067a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860858; x=1789465658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PBUJEeFBiWjNqjSYPXJZjecT0G0qpYB0cRk1PSNGo4=;
        b=CIsiadmgFrgxUyvvBhWQKMCVEacHfyhgoBzj1SowlxWgxymCQ5eRgYF9IL90rgrg7O
         tiBvqs5k/j6//mT5mI1WkB91b5xqz6LQSkn09F8Yu5EVC+ikYGfmIIJEqnyHWkHpnJyD
         J6oZ85YajgOSlBAo/7XLga4qxcuGnidmd3nx/pFSixBYOqf+bDdP0/YOo9A1klNFbGv8
         CVBWyvK4+gprX53WpJ8nGO8pHnFOHJE9hqkoWSem8pz2wc39p+YSNMDA4zSuibfdbYlB
         x33uYn50WgDH5z08cRQoz6MBuoNjuU1wanwy4BuD9T+ZXHCMcJbyrjfG3AeRrcbWGvO7
         j7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860858; x=1789465658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PBUJEeFBiWjNqjSYPXJZjecT0G0qpYB0cRk1PSNGo4=;
        b=ACfIooMmyIkGLol1GFS2QnDPIutec+nVbcsx/eEwBgJgqme7Nb28jOVN5i2RSbU3Q+
         GiBFEy3hS76SfZ7cojDprtHlNry10P1lfUsAxIKhcen29gGGoYYtHiN0BmJ/94oOlWx8
         ahYul00i8dP+aLMyW7Wy+xhIY2WTJEs1BY5cn3ZN9fQU3c3v9OjVX6N6QQoLYzmdghDL
         eTzhvKRs7hCZ7c79viA5sA5VZ6yLD5te9eREIVjAceAcKllfhHBnf4kiRorwslCQxMo7
         EAqFcO/xoD6aLPl0ShJxGqK+KbhDJn8dYPNGhCaWMOQFPTq9/2wcRqm8sUL6YI3vJr/j
         eNzg==
X-Forwarded-Encrypted: i=1; AKwUvBwY+6w+3hnMjogyu7H17WH5GXyBZX56VH4KT7qeBYcS3uyqfFAp+s5caMaODqLN0d5ndqdLEYDuzc1jJFg=@vger.kernel.org
X-Gm-Message-State: AFuF++nD4V3f6yebdS0wWnMBs79Ajw+4sCWmsAIeMo5XmdSqT6kGPyVp
	TAuF8O0g9rhCsjfA5Gewjras7qt5xDj85uvSVN8rWAarqjeTWGczRnXrKXhbysgrj9LtuA==
X-Gm-Gg: AYBFou2q0ULBpcI6kYSF4zfGfs8zmiI1FIKgqqAo1c/WcD912YZQ3xbPCjIXWf7ddcs
	9NNnnszBBS5qO7Pjrhp6ag6kMbeiv6Xl76WQ+2RWUhJRCQ/bfz5YO/mRWSrPR8WgI5B/ufKzrby
	0C2h6niGpDnseenomcFZGxLDlIWkox+MYOYx1tRcHWexA91DPPs/TzVPTrrzaTDPRVaWiPTdiCL
	3TJX4Ymyg0cupVrdnYl05k/iAmR0j9U0m6lQAgTu1IdYzXEFwYt8z006Wxltr5qzLiOskwqbvkr
	9+tCo5OOdyV81kxJJkdOHo3kQAIIvrfuZLnrUcWtfXp1Uet4vNuWbGluTB5qnKevcH6p3oZvGJJ
	o7DMnXKXOqiuV1lEfNgI3gVrEfoZh/q6KYi6K669sIZAFfmhzi9+4teEyWrpJPJKg2GZKEWm2MN
	v31g91O5zGbBJfWUQLXsgc16V6HrCJi2wQTpwpGkUl4of9Gbx9D826Aehyt9DAgz2+HgrOBgB50
	F2HfxlhZGzJYjGp/EFP3gQ/T7130gpjik28fSxqGcgvOftzUhIJ
X-Received: by 2002:a17:90b:2f87:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39b260fe42amr41175710a91.5.1788860857731;
        Tue, 08 Sep 2026 02:47:37 -0700 (PDT)
Received: from sergio-82n7.fritz.box (static-23-234-74-239.cust.tzulo.com. [23.234.74.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm29407770c88.6.2026.09.08.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:47:37 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v2] hwmon: (yogafan) Add support for new Lenovo models
Date: Tue,  8 Sep 2026 11:47:16 +0200
Message-ID: <20260908094717.2224803-1-sergiomelas@gmail.com>
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


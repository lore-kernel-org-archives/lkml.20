Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDB1A9F91
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780580; cv=none; b=ODZEFGJzfX6aw1zlWuI2ZonDx8dYMnGsiynZsDgn3pVwiqkmtFeQEso8rXsRa686A84rJeyKGfFEFqGOn9+B0XgCQBPrzZ3x0nudaukZo8VJtdgweciJoCE8TMSmyyPtQ8AH5QkckoaVgX5O9N4Pp7LSyH8ZAlC85VIZk4TBTH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780580; c=relaxed/simple;
	bh=C4PRFDmqEh3TqO4dKw+79TM/CP+snLkGQ76xBLR9GIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A2h+7ouvFfnfGg3ofc/szvG4CY42H0v2yNymROMR46w5f2WPHSoFqgWxrEK28sSajBMn9h8uoYZCM7zqbQBZAV9N6QA6bJAa/2T7lW4VP6/OUMOfYGhj72v3ZRmp+oe7ZucsOvaNVgIX/XvHaCBw5mqgb/B/woYBM0mdSxF2OZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN4DQl3d; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN4DQl3d"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e397f74so4338769f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780575; x=1789385375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHtfPvOSjpMfTPh/tjGP0O63UtTlZ2qK93oWuKlgXsc=;
        b=dN4DQl3dMQMseTOTxeXdBKYR+9EpEqbaJ8w1OIID4U4K6tgB1SpjTmnpRV89hCqWI4
         1Y1j7B9SFcf6LiRVh/wOaqRtOEql1P/rbPgVySjfiKkAe8NVShjO1rWBw1w4LPAwRMiN
         PFvUAw41B9X2fDN7o3x4icszuclX3mcG3rZW/usfMMaIXKBn3UlffUZLJDmy7glwbgks
         9XQepwZuGEHljeX1/AilO79Z3bS8Siut5XfpKAxCUoy39WbC6QYoq7CFYtbLBA4tbvuH
         AzxG08SoAaThG2hr25kHCfjWwm3jWAV21m5/aBOqKin+wvn9MhPabar8DeSwUixnGqOW
         yoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780575; x=1789385375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHtfPvOSjpMfTPh/tjGP0O63UtTlZ2qK93oWuKlgXsc=;
        b=D46vR/3NEMxCtRdJjP1K4YUVWw+jR+D6GCjP30DU0YvC3Ph3AEPBgjMNc418h4U8h1
         5IUwMOvK73WB4AzUEb4dAtOiw7+f7mG8RQ5bSh387A2JrndiPNM7F810o1+E4iuXWq4I
         41zdurp2MHn+6AI3q/SC49V0HAVYHCXsR0fc4tF9C5rnUvmCTATzmnYOSprCLbkJjbnk
         fMMW46eRxqkW9c+jR9n8/bLYfy/WWW8x+AussHCqZ1tyXTFFwN9Tak2/P+lpcOZ6JjaY
         gCr78MhlF45Kg2QvinhLVllU3/D7JaM3Uqlh0ZAacB40X7hqy3mMhDsJ638zt6zV/sC7
         QZ8w==
X-Forwarded-Encrypted: i=1; AKwUvBx9ndJiqeLXp5vUKF9gzx2UCuoy3nQxk1LkQFKV+ZYUt55RCoP2rfANHw0j4aczsXPHpR/JDICno0rwrUs=@vger.kernel.org
X-Gm-Message-State: AFuF++m3pVueLIJ9JjAPqBywdX0+qDXxBOXT3el9YfakOalJVK0hrrM+
	ShCz2FQL5OnywScBl97e/gSOKqGMO6lsUW2Q74n3nLsSTipWVEbOLYrd
X-Gm-Gg: AYBFou17ykPs4R/uTaNv7RBfQccmlHChNn4S2tSIPZwk/rITL7cpxmvj/U3Dk0t8NH8
	cyF6hc3ogiLtWWcVI2HS1CQVVuF+Asg+AMxxQaAaKtQNwrruyKOhzOQRQi3+ObDTTwhZl+yTfvz
	kwHAE21zWunLoitkDRBZoT/qzRd9Kh7RC6gkKrvJ/fPny3FOV5oCeO1U8D/H9XgNE/d+j0ScWy7
	x0cHRGInqBYn4O9d2oZt3UcsKTfOyn+TmvpLg8eO8TqJmyTonw/spc+v6oPAmuZ6igqhDfhwBqA
	/xO//ITcf4lm3mPraLvBHfgYCKxWnQuDe7B3B2rQJbU7n9aq0jJZMOsuyeRJW/TPKfxP8ifei/c
	tkMaZii+e6AfIm852DMOQFt23EdQeTamucAWU5C7IZRL0SGZ0aAxAD2QUmd1TIBZJF+b13JxI4m
	qDarhCx15N3m/al2oLa93OhgjB89Mn9Mt5bSvR2a6Bi+PN5bH+cBjJub32gluyjg+n8qmU9KjQM
	6uarKRNv+67Zb+0Qs19c0jao9JkLuTpSZ725U8oo/ZHOG/e
X-Received: by 2002:a05:6000:118d:b0:481:5a46:dbef with SMTP id ffacd0b85a97d-4857e4cf938mr24672504f8f.5.1788780574514;
        Mon, 07 Sep 2026 04:29:34 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm28537422f8f.21.2026.09.07.04.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:29:33 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
Date: Mon,  7 Sep 2026 13:29:29 +0200
Message-ID: <20260907112929.1531690-1-sergiomelas@gmail.com>
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


Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF4285061
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519990; cv=none; b=CYdqDs64gAuX4ymAXcX5ruis3G6jIRVY2rPMLxvwJBDDlgyTZKBZnk0LDAxL6cEwyq8wuTRXu+qm4cO9NYCjQNVVMeZ0qyTVABl3itA6BY/Tii+xo+jH2tnm+BmleG8B9omMkamuw8J7AEoHTb1E0DCCQtQp+FMXjnSKkgrMTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519990; c=relaxed/simple;
	bh=zlFsQT3h1ltuPNqq0iEcO2fIxzGUxsHB1hWzWBCpM5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VfqTCBOIT6NIzFUrVQAp7odfKW1zVTGDkw2pf/BhEw9/Nzk4wejlK/j2uwvJAaDa+NSpXoqxu+uOFS9p3jwURUhvGG+xuZTcyP5Fd6PYyWNjyjYp0rfQwC4N0QI6gF053p+i6/bNyUi1HfVsCoLWQy8hhxeUvsN3VjcYWVBS8RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr1Z3zTn; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr1Z3zTn"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e58034d05so698801a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519988; x=1789124788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeD81+YoExo7WV5sA8eQjKsV8woAk/oGQD7yWcfEMis=;
        b=Pr1Z3zTnyKcadlF/Mps+i1y4AZKECrVN+jUZgF/AHVWzqagwEGtw8T1pqXPJj2oC/v
         ALzgSmQ3STpzBp3CT0PLryyzMVISRmBdLhYE4bHqjSd3KcEsmIQD2F/RT8okM8rXko68
         ZPGaz6JYxlq4vauVHKDgi/tg94N7FBDs1estQjl0lB80r9MvhzxEDOuaLJKX5BS45f26
         c5XkCNbNnD0NAtd6Qhcc6oWZqUj+nARUV3YffunRoPmkPNWnDSvTQDw11d3VIQTrK6Z2
         /vVXWJ+7a98Tnzi+snZQrwFvONHg876fGrLnJ+MLXGbe3d3dImFn+YdZrSGrPz0wRg/q
         Lqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519988; x=1789124788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeD81+YoExo7WV5sA8eQjKsV8woAk/oGQD7yWcfEMis=;
        b=FJCPSvYo+odh/a6OzpZ7JuvPYQF611IcrEcBzaez5jIKRlhDowomkdlVSYniTEa5zx
         aRDCvLlUubJEXrSY6HxkSQ1gGQuEs4x82O8usDmNYt2DAaqOZfSVzE0BIDDmB/INjZ74
         69I9lCBtJQhNznV+WV3ehKP/rFn8wnH14zQLwZNMjRNkMpKXQHqsvFJ95RbKsPQXZztM
         x9xPqDTtdmSpOlav9/klF3mnllN0ukKjgkFWdfPSXynN6bz5uqhEPh4ifDLO1KUe7PzI
         9DEmw2km6B+BBLGdDZ5ulZVavb3cMI6PrI+Gtxq9051h1kK8ci6uAzpOGJF5yK+lVq9y
         eoJw==
X-Gm-Message-State: AFuF++nIYr6W7P7dJ/Nfou/68IbHa5M2HaG5GxtizYNOwuU8cAyX9w6D
	CEPiZQz0NZV37sPuun75D+/cBuBkYVUU2kLGSc6Y+rtjj67scbBK9qqi
X-Gm-Gg: AYBFou3AFKxB48F2mr3Ag8PS8jyDleXAHhaG8+ogq9FTosGuW4Ocr3YFqv4L44SWDBe
	KVdMz2R+wEGqD2SiUooHpYkrpjyxAGAu44Y87N1CVy5TW+x88Geco2zmV57AJPV5yygN5v4qmBO
	Q8ifvf4HFBCpsImXRTtv536uzBa8Q7Qo2lPlaoOrRFX7FMdIbhFOIbP2+Yr9EWX9VP8uvVvY5Kz
	U/baek2hkvKfyxgBOThx7mcSoKWIIVpc3YXEv/RTJlnERyZLt3+i+qmgD0w40alc2zPcCuiKFXM
	zcOuVRc+P2Wt29yohttH0QMWbdvsa1rkGX5AVqreLN5egbSog9PP2/v9T3wQjoNVdBgH3w4Aeeu
	63fxI7iSpUK1c6nijeiGgkJWg6Lc2rwXgjT4E1WqtOMQNcJbqdp+iTn4a4MzJEq0EQbH9j8dbVY
	FaOAfvsfe4Bm5ZtdE8z2xn3rjPHgdTOdl8+gX6POjDhQC29HQuSJhS3ZAm7l+2JyEzdM9bk8p9T
	BWWDxF1OFu9L/md9u8bKmtIFg==
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr8136899a91.0.1788519987928;
        Fri, 04 Sep 2026 04:06:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm6141919eec.19.2026.09.04.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:06:27 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] extcon: fix typos in comments
Date: Fri,  4 Sep 2026 16:36:20 +0530
Message-ID: <20260904110622.16766-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/extcon/devres.c              | 6 +++---
 drivers/extcon/extcon-intel-cht-wc.c | 4 ++--
 drivers/extcon/extcon-max77693.c     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/extcon/devres.c b/drivers/extcon/devres.c
index f9d52e8ec5cf..01da069ad4c9 100644
--- a/drivers/extcon/devres.c
+++ b/drivers/extcon/devres.c
@@ -113,7 +113,7 @@ EXPORT_SYMBOL_GPL(devm_extcon_dev_free);
  * If extcon device is registered with this function and the device needs to be
  * unregistered separately, devm_extcon_dev_unregister() should be used.
  *
- * Returns 0 if success or negaive error number if failure.
+ * Returns 0 if success or negative error number if failure.
  */
 int devm_extcon_dev_register(struct device *dev, struct extcon_dev *edev)
 {
@@ -167,7 +167,7 @@ EXPORT_SYMBOL_GPL(devm_extcon_dev_unregister);
  * "old_state", not the current state. The current state can be retrieved
  * by looking at the third pameter (edev pointer)'s state value.
  *
- * Returns 0 if success or negaive error number if failure.
+ * Returns 0 if success or negative error number if failure.
  */
 int devm_extcon_register_notifier(struct device *dev, struct extcon_dev *edev,
 				unsigned int id, struct notifier_block *nb)
@@ -223,7 +223,7 @@ EXPORT_SYMBOL(devm_extcon_unregister_notifier);
  * device resource management and simplify the control of unregistering
  * the notifier of extcon device. To get more information, refer that function.
  *
- * Returns 0 if success or negaive error number if failure.
+ * Returns 0 if success or negative error number if failure.
  */
 int devm_extcon_register_notifier_all(struct device *dev, struct extcon_dev *edev,
 				struct notifier_block *nb)
diff --git a/drivers/extcon/extcon-intel-cht-wc.c b/drivers/extcon/extcon-intel-cht-wc.c
index 99a9dfc62e2b..0f2168150a98 100644
--- a/drivers/extcon/extcon-intel-cht-wc.c
+++ b/drivers/extcon/extcon-intel-cht-wc.c
@@ -145,7 +145,7 @@ static int cht_wc_extcon_get_charger(struct cht_wc_extcon_data *ext,
 	int ret, usbsrc, status;
 	unsigned long timeout;
 
-	/* Charger detection can take upto 600ms, wait 800ms max. */
+	/* Charger detection can take up to 600ms, wait 800ms max. */
 	timeout = jiffies + msecs_to_jiffies(800);
 	do {
 		ret = regmap_read(ext->regmap, CHT_WC_USBSRC, &usbsrc);
@@ -192,7 +192,7 @@ static int cht_wc_extcon_get_charger(struct cht_wc_extcon_data *ext,
 		return EXTCON_CHG_USB_CDP;
 	case CHT_WC_USBSRC_TYPE_DCP:
 	case CHT_WC_USBSRC_TYPE_DCP_EXTPHY:
-	case CHT_WC_USBSRC_TYPE_MHL: /* MHL2+ delivers upto 2A, treat as DCP */
+	case CHT_WC_USBSRC_TYPE_MHL: /* MHL2+ delivers up to 2A, treat as DCP */
 		ext->usb_type = POWER_SUPPLY_USB_TYPE_DCP;
 		return EXTCON_CHG_USB_DCP;
 	case CHT_WC_USBSRC_TYPE_ACA:
diff --git a/drivers/extcon/extcon-max77693.c b/drivers/extcon/extcon-max77693.c
index 2c567e0b7b7f..2839f0c946c9 100644
--- a/drivers/extcon/extcon-max77693.c
+++ b/drivers/extcon/extcon-max77693.c
@@ -689,7 +689,7 @@ static int max77693_muic_adc_handler(struct max77693_muic_info *info)
 		 *
 		 * The MAX77693 MUIC device can detect total 34 cable type
 		 * except of charger cable and MUIC device didn't define
-		 * specfic role of cable in the range of from 0x01 to 0x12
+		 * specific role of cable in the range of from 0x01 to 0x12
 		 * of ADC value. So, can use/define cable with no role according
 		 * to schema of hardware board.
 		 */
@@ -708,7 +708,7 @@ static int max77693_muic_adc_handler(struct max77693_muic_info *info)
 		 *
 		 * The MAX77693 MUIC device can detect total 34 cable type
 		 * except of charger cable and MUIC device didn't define
-		 * specfic role of cable in the range of from 0x01 to 0x12
+		 * specific role of cable in the range of from 0x01 to 0x12
 		 * of ADC value. So, can use/define cable with no role according
 		 * to schema of hardware board.
 		 */
-- 
2.48.1


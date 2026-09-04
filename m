Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B936474247
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519739; cv=none; b=MsLMpn2hD2iGIMHvPZJ85VJJz4Lo1CTpUii0MTFoPPM6dJtZbNFuQg1+Rx+NZmWLKj1B1E8a9klXEEFqrr9951l/Cf69mm/8q+d/vrRdF9lU8RrsHAVeyObJ8y8j/BfpgWcbVTbyzbxDWJvqCjkaVQllG5VOBKxzdDx1zsm2WQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519739; c=relaxed/simple;
	bh=nzZ3tYYwOg5bLMFto68XTfRRo45wUxudJgi+skiFmPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1j3E0ru/4Hbo3yFOufaLpqWwk1nuE6Ji7YsaR/z6C7xJ05OoHG54hZyeh6banu8ryMFh5AcnP7rDnC6tIJvP+rhO61ZywcdTNoW37DRh8hhrB8Kgzy70fSwxEQPImIi7AP9NT4Jgeul23mZUH0zkk+xEKNh/jGTX8i9M+Xdg10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaeXBeas; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaeXBeas"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66d258d1effso170942d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519736; x=1789124536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I49JVXaD+oewM4OXh1s1+a0mjJ0I8MzDz2IeDKJ9/Gc=;
        b=aaeXBeasdw18u7FdiEI0pGQlwNjQqjwh4HFCKs7UY8RDq7ndYfHp9Omkl7Ga/7jM3w
         8jk2oOMCJRHO+AU4KqbB+hSDUrjfIvQFWR0WcLra75FLTI1lOyupP0/xv91Dn3e9IwQS
         MvWgKQPfKc+HtquMjLJZH/8qMUGIzrZubtbYXUN1DDcDY1OOW+d1WYl0E/SzkFs+T5kL
         LBCrO029bmzD8Vuiu5whJ+qGAeXQmU3V1AjJs8reSDhVQtCULWP4J1iijDUXFh5UyROh
         TnKgHPr5taJ/TLXY/EdgT+lzb3cG2xDrZk2YZfip/wwObWe9RTnLr8/EqDnR4ngRzTmt
         fydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519736; x=1789124536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I49JVXaD+oewM4OXh1s1+a0mjJ0I8MzDz2IeDKJ9/Gc=;
        b=FqvexE4wSTZMoPkwNboliUyJ+eTptGK9uqqdUnheFfS1V45uflb1vJo0CsaRz5wXGA
         j0nDA960J+l1eM64N6czmCF4rt+Ol5gIwMKAo2jdC5X/SuQI8A4Jiv1TDydSzV+bIYV7
         H1XNuAkwgDXR1ld55Q+h7qn/hOc7851G7ESNihCZ8v6fHbPJn0eu0LgUhk5gLJ31z0OD
         W7SIGvNYePbo1ZEsFxgPgeV5wuO3MjGkZ9DHkFzoyINjyy2GkswJyiMznTA2v19c3Cp/
         +8JxRqRFCfZS0Uaglk966Yu9xz6ec/lt0vD/CeLg29utA2nQUntj4bCtYxZMPhkesuFd
         jlSg==
X-Gm-Message-State: AFuF++mqoqRURBE/XVnNojKRAJ+H7eQz+k3zhFc7q5StO/7r6tC7F4Sk
	hTf5x9DgMOXF3ABl9uaJa4Py5ql4/NzkQLGs5gFWhXk/5PCtMcCXivIuS3BhQygyiCU=
X-Gm-Gg: AYBFou2GzebrZmXrv5aYH4XlzOLTG4f/HLPwYShfiJJPRq+u92m567F8l4Q6GRavva8
	vz/5zlU6W+JPDo/3iViavu4f8wzxb/cU45aEKhMiCFbkRA21LrILxNxUhkcKFx1Fx6od0IARnW9
	Yto0BNdtTgJ/o6dE1zM729ISU7r1RLRf2TqqMNIN/Fi9QTMntJotaa7D9D2VPNUl+orcdf/u+Hc
	rX+hO1pXRMDlHH4XHCUsEgVPtQ46hqrPmVVAuEhSHBFsyHi/JhDt+xLgck1yo9YlMRuJOpoVVEU
	aIKu5WLyquUKqjY3jsDnQzVpx52imZJ4mcNb1iCHPiNWk8g2ft9AKzv9myzz21vgLegdd55PRPu
	KGGbcUUQdo1CtX5bwt1vflZK1hAIZ3l9miE0Op1D4iyk3qA7zftr1IAzxiYnI4LGCmYce1WPTvY
	Ii7kPZLLawyczGzvfijERYP829tkzI17eMQG2eGRDnObjZ7dglaJoT4jUqhPBYdIBVqeImrhI3b
	ds/H6thD54tJ/j7C742ShEOaQ==
X-Received: by 2002:a53:ac8e:0:b0:66c:ea12:95d9 with SMTP id 956f58d0204a3-66fb5975b49mr1880750d50.22.1788519732871;
        Fri, 04 Sep 2026 04:02:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf44ffsm5454090eec.28.2026.09.04.04.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:02:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] regulator: fix typos in comments
Date: Fri,  4 Sep 2026 16:32:00 +0530
Message-ID: <20260904110203.10113-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110203.10113-1-hemanth.selam@gmail.com>
References: <20260904110203.10113-1-hemanth.selam@gmail.com>
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
 drivers/regulator/ab8500-ext.c        | 2 +-
 drivers/regulator/core.c              | 2 +-
 drivers/regulator/pv88080-regulator.c | 4 ++--
 include/linux/regulator/driver.h      | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/ab8500-ext.c b/drivers/regulator/ab8500-ext.c
index b9955aa4e0d1..c0657362a102 100644
--- a/drivers/regulator/ab8500-ext.c
+++ b/drivers/regulator/ab8500-ext.c
@@ -88,7 +88,7 @@ static struct regulator_init_data ab8500_ext_regulators[] = {
  * @update_reg: register to control on/off
  * @update_mask: mask to enable/disable and set mode of regulator
  * @update_val: bits holding the regulator current mode
- * @update_val_hp: bits to set EN pin active (LPn pin deactive)
+ * @update_val_hp: bits to set EN pin active (LPn pin deactivate)
  *                 normally this means high power mode
  * @update_val_lp: bits to set EN pin active and LPn pin active
  *                 normally this means low power mode
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..1e950260f441 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3029,7 +3029,7 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 	 */
 	trace_regulator_enable_delay(rdev_get_name(rdev));
 
-	/* If poll_enabled_time is set, poll upto the delay calculated
+	/* If poll_enabled_time is set, poll up to the delay calculated
 	 * above, delaying poll_enabled_time uS to check if the regulator
 	 * actually got enabled.
 	 * If the regulator isn't enabled after our delay helper has expired,
diff --git a/drivers/regulator/pv88080-regulator.c b/drivers/regulator/pv88080-regulator.c
index b96afbf11ff3..1f2c405fd2bd 100644
--- a/drivers/regulator/pv88080-regulator.c
+++ b/drivers/regulator/pv88080-regulator.c
@@ -432,7 +432,7 @@ static int pv88080_i2c_probe(struct i2c_client *i2c)
 	config.dev = chip->dev;
 	config.regmap = chip->regmap;
 
-	/* Registeration for BUCK1, 2, 3 */
+	/* Registration for BUCK1, 2, 3 */
 	for (i = 0; i < PV88080_MAX_REGULATORS-1; i++) {
 		if (init_data)
 			config.init_data = &init_data[i];
@@ -498,7 +498,7 @@ static int pv88080_i2c_probe(struct i2c_client *i2c)
 	pv88080_regulator_info[PV88080_ID_HVBUCK].desc.vsel_mask
 		= regmap_config->hvbuck_vsel_mask;
 
-	/* Registeration for HVBUCK */
+	/* Registration for HVBUCK */
 	if (init_data)
 		config.init_data = &init_data[PV88080_ID_HVBUCK];
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index cc6ce709ec86..55cc519103ed 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -362,7 +362,7 @@ enum regulator_type {
  * @off_on_delay: guard time (in uS), before re-enabling a regulator
  *
  * @poll_enabled_time: The polling interval (in uS) to use while checking that
- *                     the regulator was actually enabled. Max upto enable_time.
+ *                     the regulator was actually enabled. Max up to enable_time.
  *
  * @of_map_mode: Maps a hardware mode defined in a DeviceTree to a standard mode
  */
-- 
2.48.1


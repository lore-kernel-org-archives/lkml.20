Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101616;
	b=xohASyiyvFxPcYdD+wyq0NuKoOL/16haELsRv98uFaE29cTfP1RH8PDeLpSGnbtWlVPn
	 aGluX+9iskTTDUD3i5H/Wz1bX7S3x/KpY7CxTOKi6fBxqayAUyoDiS4Phe7j4lnFiSPcG
	 CgnXyNgF2wIBJiG0cm5DdPh+q6PEZ4DJ2abHTvswgjexvnfscU6ouyXVilF/SKjAieULX
	 Pjh77B6dxrDMp5WXAKMsO7RfEcUkEMaUkIEXtRt5xEKwC3k6VrZSBAjvy6qeOFduEFH8l
	 l4Pu18aW1R3bPG+qmnGE49xy7IYk66i2b9Gt5tuW3vOGGEeb9gQTKgmNvmGvwEVxRHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
	b=gTbBdq83M1xkzquFFFvjt5zZ0sYCnu1L90vXbGgUKSOM64TRU4eRlEnDDYT3poxR8LTt
	 jwcXKrfIlV2rkYcVrHeLce+702FCzwLi2P96hdmVNag8oSAsmKmra0rLDz460kgzvrPGg
	 2kYsRbpVG7YVkEoBMMZVbV7SDcHRNzG4oJoXRhE3h9NH2PiPC/7fYz7q6z1him9AxUNba
	 EbsG86aZvjnMIWFS8EifNuXFtVGwkweQeklV37A4oz5++tc2bFKw2rDDKuPodSEsLpb9s
	 UIfLY84+af7D908lMASIyeAewvODI2eV2kNcQyEn6agXecA23sYp5uyLbl+3wdgXimA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iTiOXuc2;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2803F606A9C9
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2803F606A9C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iTiOXuc2
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso628693366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101614; x=1793706414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
        b=iTiOXuc2DIBefNMU0bxEfoJ6vuVhIeurBON/z2O3LIeiHc/CO58gw6iP68+ewY+yZW
         qYVyvZWHzV8vG10hb52qMTZHrNPEE1KFMtUL785qTPoLqKmntXsLmGAX2T03vGiS8WCP
         xVP+rgiBb/n5AlzOGLR1df7Z7cD8DaikbEZLWzWUtgKJYnzqTl3155Tn1p3iCYXmktUr
         ExpCdaWXzf2mDgvzy2PEQDsHHNZNDX1ANYfmAnS9C02OdhWEtpZHvU//l6bYlOF+uCj5
         Ax/8tCPVHL8561hYhpnDJXieFpzt/mYsQxVlmxCdfUmujQjgi0Q91fw8UMKR2G+wA/59
         fciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101614; x=1793706414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
        b=hyUA5EiLSTrgWPwVs02DtHT3S/StJqNHrJqICRbKU2N34pMLeNy7fqBce3hbhGP33c
         HtzrKULKHXneCn7s7bbIOKU2lnW1/CdsLLp4DTeCti/XKR30p0EqMiroWlILWyX1iKDY
         zwf99ttdNqO4EuxE4xx8u5Bg3DjMC2NaHhB/84jz62N+em1NoDtGrqYGm4ufOjoN15Ua
         2lNUHv4pI6qR/X49A1fVCklTA3UjFcEIOZB0hoyCWur8Q3TNAiFmDW+5/XGWomYEzLF4
         AL0vukHylVKbff1Lrkj9StCZcYEXnf3VcavIAQKilBNtuO0uhTv6F2KISBzgUSo0dgcM
         ifCg==
X-Gm-Message-State: AFq9FYKcknV0G2xN2DZ8zrgdrCU/hPviXd5Mgf7EB1L7TFbTnH19b4e9
	2ZkDecdAwpq4MAlRA8vpZJ5ZICwSo6zsdKwZhG4eAGn9HXIUHjQhGHGS
X-Gm-Gg: AYBFou1qavl4h+grMWPS7QwKz/geUBRCz6Cspl7/gCR8br/pDESXQU6pCYF30/7ZvPY
	8EUo2oFW+s7mguca8vN3QGo6GDklAismGxfWXD8hDRRC5NOFD+or3ZXSUKTcFyBvhTDf+WYElyS
	v2O78Bqz456RpggC2lv0m/QNaq3QvDY6zanwh5XPGNGCiGmslmDgOrvl679HSaoElPuccAOs1cU
	q9bzXSt2yXXzXQt38UWGijJUL/LqtFiFs+Ek6/xsPY9LJQ5xf92wcDsmU/icS5VA4vJRmL9wtID
	PuGv8Ro3TFGKa9hEe9rZGss5uqsLwv1s7RYKW/KtRYeCIPv2xThCjYg2MWk03K2S9uQAuFxgMMl
	pF86zXdOEpXRPaUT4HZqQemun8PyWC4qk/BFp5uTIPYqfYuldoiAARijxSD0dZbW9HpTOIKf9HW
	JVZTBHy9MLKLeUGI93krNO+diQwfrU/xNMGt+MXomrzAdxD+Lk0CtB3kvVHc7/Vgje0GL3a9gSu
	4EphGqgn/kmnGrsPweqY1dDrpqu1BriCugoDJne7oJorG/t38jKv6NbMkc3TklE6oOEuvhFaU1l
X-Received: by 2002:a17:907:9624:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c46bdacd582mr1075309766b.5.1793101614258;
        Tue, 27 Oct 2026 04:46:54 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4 4/4] mfd: max8907: Convert to use device managed poweroff handler
Date: Tue, 27 Oct 2026 13:46:34 +0200
Message-ID: <20261027114634.79706-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_power_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2a38e00a10c3b..e282dd82ece69 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,11 +174,17 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to power off the device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
@@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
 	if (!max8907)
@@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0


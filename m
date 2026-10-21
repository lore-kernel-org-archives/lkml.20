Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578539;
	b=Ss2vKMxDaldW0Lmhok8FzgIKWgM26y8dprWJUOL3RyWfSKmPoYp50PkdOm9SpDYxbR7e
	 lOV6wIhZkDgpTSXR+x89OfzgwXVZt2wNFLGJl+C/u2DTxVGk6SLwEvpuipIkBbk4SbLmL
	 p7H04z7pdYU73+2l3FKh5TT2QAs7qCkvkDf7wkSgExAKzGwsAAGYoHhOwqG83c7Swiad0
	 N7JSwaQaAkP+PIiq62S+H27hP+wrAZy4JTgcsE8T+1q1tJOnjyYCso71TcDIE5Tf8q8Ml
	 LOm65JcI/+h5Odixa0RnGbJHIVcZ4PYS6mYx6i8YMZ+ii13JLZXjfEDpTQTJ8nSlbdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578539;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=Dkf48jB4gCtlFc/BoafYwVHY7csJs+Epq6MjEAyZCls=;
	b=h1auDQjPCX2PXCHx3/nuRvEdXvp2j9azW5iAwKRlSLDGqnICUsVB1p5jvOI1KpE9fIT1
	 6pZ/JnYg53fzkrognyVijSFO6y+LLLP60UTE6w4VLPFj5gkvmbDJZXbkO1UUSElzj4Ctb
	 GUilw/oCBejzTr3Ffxhk5n/zn9BdKYRZheV6B6p28urSCQoqFQbgvM2LG6LMCzMjnSDyO
	 05q4MxD3gsyPF5WwpFkJ9DB79T+Di/UR9OUktIpnqr7+2apMxoE/9nSnSgaOZ/BObc+wt
	 KlVQn8aKdjQEi5G1cXe37Gi8CXt/c0dCO0KIFuOB4qWmo441p0vJvSxKd1+ykXGJ51A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2uiwO+Bt;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2738C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2738C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2uiwO+Bt
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ADC01C5CD75;
	Wed, 21 Oct 2026 10:29:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9904606E3;
	Wed, 21 Oct 2026 10:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2185103288F4;
	Wed, 21 Oct 2026 12:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792578527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dkf48jB4gCtlFc/BoafYwVHY7csJs+Epq6MjEAyZCls=;
	b=2uiwO+BtqJLV4fSkAV3IaNO1mQJYmFiIw/UhGSicaDdoDQsLTj6wTkvmUZF+lFHWtZeP7u
	AkAlMMWVgBzn+gHVibqkjIIcqYleynM0xefOP2iuGq+4zXB3G/1xk0+fOhZ7ZMkKQXyGi/
	V+aeXYWRjVH99fnt6NQcdaFcyYv356ocF+6gslQTgvAjv+L6qGHyZVdVm5zxqxwXvRP0h+
	X5prg4zMaMKv7HR2ZnZsUKYhAoNpNai9hfVD/ZeoyTqdCe0CO2jZW9W2/xMhwH3F6GMuP+
	1rWyBifeozzHp1/vY3KDwQSgOge/wJQCY6E6Nw2jEba/dST1C3CeukqOFbrEkQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 21 Oct 2026 12:27:44 +0200
Subject: [PATCH 3/5] regulator: core: Add mechanism to force disable a
 regulator at boot
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-paul-lm51772-v1-3-25f0ffbffa8d@bootlin.com>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
In-Reply-To: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792578518; l=6769;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=N/jhEKYj6ma9nFEN6xTyw+SfGZjRroybm0iZd6QPfe8=;
 b=hQfx0rfhX3wmKmGqLFJ2CmyaGyXCmun8jwrRJZXyCpwtQgy4tRT9vm14QKz5mIYSfJcPje3co
 u9kRrFkuqbmADJ4i9+TB3IsJKfBpUEw2TIolblI/KPabjFe5p1aNAZN
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Regulation activity may be enabled by default when the device powers up.
A consumer may query the regulator's state during probe and may disable
it if it is already enabled, potentially resulting in an unbalanced
disable operation:

ret = regulator_is_enabled();
if (ret < 0)
  return ret;

if (ret)
  ret = regulator_disable();
        ^^^^^^^^^^^^^^^^^^^^

Add the 'regulator-boot-force-off' property, which disable the regulator
when setting machine constraints.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/regulator/core.c          | 154 ++++++++++++++++++++------------------
 drivers/regulator/of_regulator.c  |   1 +
 include/linux/regulator/machine.h |   3 +-
 3 files changed, 84 insertions(+), 74 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 14422cfe80e2..b45048ec084a 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1450,6 +1450,81 @@ static int handle_notify_limits(struct regulator_dev *rdev,
 
 	return ret;
 }
+
+/**
+ * regulator_ena_gpio_ctrl - balance enable_count of each GPIO and actual GPIO pin control
+ * @rdev: regulator_dev structure
+ * @enable: enable GPIO at initial use?
+ *
+ * GPIO is enabled in case of initial use. (enable_count is 0)
+ * GPIO is disabled when it is not shared any more. (enable_count <= 1)
+ *
+ * Return: 0 on success or a negative error number on failure.
+ */
+static int regulator_ena_gpio_ctrl(struct regulator_dev *rdev, bool enable)
+{
+	struct regulator_enable_gpio *pin = rdev->ena_pin;
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	if (enable) {
+		/* Enable GPIO at initial use */
+		if (pin->enable_count == 0) {
+			ret = gpiod_set_value_cansleep(pin->gpiod, 1);
+			if (ret)
+				return ret;
+		}
+
+		pin->enable_count++;
+	} else {
+		if (pin->enable_count > 1) {
+			pin->enable_count--;
+			return 0;
+		}
+
+		/* Disable GPIO if not used */
+		if (pin->enable_count <= 1) {
+			ret = gpiod_set_value_cansleep(pin->gpiod, 0);
+			if (ret)
+				return ret;
+
+			pin->enable_count = 0;
+		}
+	}
+
+	return 0;
+}
+
+static int _regulator_do_disable(struct regulator_dev *rdev)
+{
+	int ret;
+
+	trace_regulator_disable(rdev_get_name(rdev));
+
+	if (rdev->ena_pin) {
+		if (rdev->ena_gpio_state) {
+			ret = regulator_ena_gpio_ctrl(rdev, false);
+			if (ret < 0)
+				return ret;
+			rdev->ena_gpio_state = 0;
+		}
+
+	} else if (rdev->desc->ops->disable) {
+		ret = rdev->desc->ops->disable(rdev);
+		if (ret != 0)
+			return ret;
+	}
+
+	if (rdev->desc->off_on_delay)
+		rdev->last_off = ktime_get_boottime();
+
+	trace_regulator_disable_complete(rdev_get_name(rdev));
+
+	return 0;
+}
+
 /**
  * set_machine_constraints - sets regulator constraints
  * @rdev: regulator source
@@ -1701,6 +1776,12 @@ static int set_machine_constraints(struct regulator_dev *rdev,
 		rdev->last_off = ktime_get();
 	}
 
+	if (rdev->constraints->boot_force_off) {
+		ret = _regulator_do_disable(rdev);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (!rdev->constraints->pw_budget_mW)
 		rdev->constraints->pw_budget_mW = INT_MAX;
 
@@ -2910,51 +2991,6 @@ static void regulator_ena_gpio_free(struct regulator_dev *rdev)
 	rdev->ena_pin = NULL;
 }
 
-/**
- * regulator_ena_gpio_ctrl - balance enable_count of each GPIO and actual GPIO pin control
- * @rdev: regulator_dev structure
- * @enable: enable GPIO at initial use?
- *
- * GPIO is enabled in case of initial use. (enable_count is 0)
- * GPIO is disabled when it is not shared any more. (enable_count <= 1)
- *
- * Return: 0 on success or a negative error number on failure.
- */
-static int regulator_ena_gpio_ctrl(struct regulator_dev *rdev, bool enable)
-{
-	struct regulator_enable_gpio *pin = rdev->ena_pin;
-	int ret;
-
-	if (!pin)
-		return -EINVAL;
-
-	if (enable) {
-		/* Enable GPIO at initial use */
-		if (pin->enable_count == 0) {
-			ret = gpiod_set_value_cansleep(pin->gpiod, 1);
-			if (ret)
-				return ret;
-		}
-
-		pin->enable_count++;
-	} else {
-		if (pin->enable_count > 1) {
-			pin->enable_count--;
-			return 0;
-		}
-
-		/* Disable GPIO if not used */
-		if (pin->enable_count <= 1) {
-			ret = gpiod_set_value_cansleep(pin->gpiod, 0);
-			if (ret)
-				return ret;
-
-			pin->enable_count = 0;
-		}
-	}
-
-	return 0;
-}
 
 /**
  * _regulator_check_status_enabled - check if regulator status can be
@@ -3226,34 +3262,6 @@ int regulator_enable(struct regulator *regulator)
 }
 EXPORT_SYMBOL_GPL(regulator_enable);
 
-static int _regulator_do_disable(struct regulator_dev *rdev)
-{
-	int ret;
-
-	trace_regulator_disable(rdev_get_name(rdev));
-
-	if (rdev->ena_pin) {
-		if (rdev->ena_gpio_state) {
-			ret = regulator_ena_gpio_ctrl(rdev, false);
-			if (ret < 0)
-				return ret;
-			rdev->ena_gpio_state = 0;
-		}
-
-	} else if (rdev->desc->ops->disable) {
-		ret = rdev->desc->ops->disable(rdev);
-		if (ret != 0)
-			return ret;
-	}
-
-	if (rdev->desc->off_on_delay)
-		rdev->last_off = ktime_get_boottime();
-
-	trace_regulator_disable_complete(rdev_get_name(rdev));
-
-	return 0;
-}
-
 /* locks held by regulator_disable() */
 static int _regulator_disable(struct regulator *regulator)
 {
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 09e26febfc83..337629be58ca 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -132,6 +132,7 @@ static int of_get_regulation_constraints(struct device *dev,
 	constraints->always_on = of_property_read_bool(np, "regulator-always-on");
 	if (!constraints->always_on) /* status change should be possible. */
 		constraints->valid_ops_mask |= REGULATOR_CHANGE_STATUS;
+	constraints->boot_force_off = of_property_read_bool(np, "regulator-boot-force-off");
 
 	constraints->pull_down = of_property_read_bool(np, "regulator-pull-down");
 	constraints->system_critical = of_property_read_bool(np,
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 1fc440c5c4c7..35ab9de96e5c 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -227,7 +227,8 @@ struct regulation_constraints {
 	unsigned int active_discharge;
 
 	/* constraint flags */
-	unsigned always_on:1;	/* regulator never off when system is on */
+	unsigned always_on:1;		/* regulator never off when system is on */
+	unsigned boot_force_off:1;	/* force regulator off at boot */
 	unsigned boot_on:1;	/* bootloader/firmware enabled regulator */
 	unsigned apply_uV:1;	/* apply uV constraint if min == max */
 	unsigned ramp_disable:1; /* disable ramp delay */

-- 
2.56.0


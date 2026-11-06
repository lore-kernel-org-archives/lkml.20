Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932192;
	b=Ip9T3ig0hUkoeN/zkVd+3a7Hey1fToAXJKLIYo6KhD+tImc/KRvbyJ/JphHkqPKQX30p
	 zGq1G+OUxQAnIZtJxg8S9u7ISeljXsBEjfCa60+QZqlgJfzQGRxd7pM7sxCZN+WugLXQT
	 hkDnkaF2aVCYa/j6x2ivd6LVSlWm1sYnFR8qkuiysMEuZV5ovR5P8EfqctASIpKWtHk+e
	 MIePuAtznf+vredh0eU1BnpxmIQScYXaswbQxrv+GgdZuTglRMe0WSwga3xnvtQP0p6NA
	 2/TEt/9/pmSt+duPrWQmaEO4XzMzrjbkyu2v0J87QuPcVmZZG/o/eyykLIMVPVpeIjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3Cjh5kJivjhoi379WZ/ExYbSeX/mtBBoq1mcspo2n18=;
	b=MJQ4dovBnfw0q/LfN5tTxpBI9hwo5n3UyROgZK/rCLQY3wBIHmnWY+7bVyL7ONQA9B0w
	 6tPS1QrkIzlD5Xt2YKrAGRr6RN7P5qKIUBJDn4fIZtjJI/oMYB8FpassxnZHOhrmc+1vF
	 37av+8GD2u1CqfwQ/6dR7RNLz1I0OEbQigQmaCMF6JlbOMrbhS5fcnPE67XLpnUfZSDmr
	 MCDjLFX0rXopm/r0V9TMwogRp77mQ27WwiMgwlXpgzL1HsEmDfyU1DRfB83TIM7ByEeqO
	 0nFxxEf9CWAdU9BT/pX2sj/VtoZOR2JolbMF9JBiE3Y+4e912hKKZF+wEYt1ATQrF1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzbizuXf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F40606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F40606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzbizuXf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso289191eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932191; x=1794536991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Cjh5kJivjhoi379WZ/ExYbSeX/mtBBoq1mcspo2n18=;
        b=NzbizuXfcJoMdmX61SzbEmjempPKeqTUt8lyFQWv9ZOAsCaCnrqcEdExB7eQfHp0PQ
         dJTv4wNqw2/j8NthX+dHp4WGB7RjKcYPa9Zlq3IECbyYXKsIYfuW4p1565VlLIi0M9qR
         nZJBQniSQfPoYY/3P8KzzoRG0sHDhpmb4BtdxFOwWsq46bLor1qX9aMIC93YhQ5z2QVj
         5O99A3i0fkqJ3JhCtvDHdyv0Ogb2mC9yYQLu9TWDa1lv0IcU5nAkGIprQ9ngbOb/sy1y
         LmYYWtY2SRFLMXicJFyco1o4mHmDQM7y4N/zyifhEPDLMxa8u4JP2tYPrzUijMLdqdHp
         CNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932191; x=1794536991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Cjh5kJivjhoi379WZ/ExYbSeX/mtBBoq1mcspo2n18=;
        b=wd1J0bONzUH3HFpjlv+00TSMoEpRN4YpK+itzmwBzj1QvGuGYwjdr3/RasyZxuetHD
         y1kCMvLcEVxITHx+9ACv09zl3nmL1k2ODhvJnTAKB3zKBYi4zboTe3lZZg53vqw6Wp8v
         VZwM8UYKgkA7Y5qbmetC3y8GB4nAKCSxxTdZZm6sFPPNQEjwAVWiCdj7GSkTksk+8RH7
         xcl5X3TYtYC6lno28t+jPApsasRb3ZFifvZfbVxd3tPuYpc4pbxzEj6hA2p4NYZ/77vz
         tyiQsszMQ3xIjzsG2PjhqcmbdIrvCISt5mafADWtkqhKcmkkwTFPQcRRnlvuUTLoTAS2
         eUGA==
X-Forwarded-Encrypted: i=1; AKwUvBxwabh1Q0Emb+khyWm3dgt8/iRCw3SMdKTXh9jX3v4Kxe4acoLVA/v3l7jfRyabU5I/uECoBAoi+bq/9t0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EJpiGAswuXC/uc8tvadZJ0wlBdLG1DUAkS933DCvlFsnYZIQN
	Pz85fzTuXHjIX9NJb77nfiWRI70qn9l8S3ZCB0lG70YrtB5XUwFyAYjD
X-Gm-Gg: AYBFou3TJKueqneC0L6H48tyV86N+3BH05352n3JVfFMY5gO3jOp8lk/fFnxIZwEqwJ
	JXZMkxL0CowVEf3x6JSkH3/IwRksxykzCfBzwY2Ryc/ycSqefg3V83Y4mYgJlAkCl5G3xFpe3Ef
	uhdnEBXyf5A2oQBP3VA/pMLZVqtweDHnbC4kzP3RXx99JJfXnY05H5u38OvUzBr3CTc0xS+vu1N
	Dr0ZlOU7YMpz8D0LhXTRJx0Gkd5aNe8S34HTJorsEeTNmd6hUrHfDdiRTspTB1cMAaOaA/m95K4
	o6MeslrLtTp6jmXSeRnAZ/4YF+zwSSVox3gJ8HUBbhcUoxhXTb/I+I8AuXpomr4bXF/BWXjkpaH
	6VWhO+JnkTj0VyxL2usl7vmEM5t2vsPM4yZSM5tPB5/N5Oq35MDlW0oUpg+OvNi4mDlCJfZAbhr
	PcU6M8sbOzLDO88gogRVCLNBFJyluKD1jnrFNSU9CfPZ/OYyMnNbRd7XGutf2GqwTqHalciioKv
	IfyUz3cDZSudizB8x/Sl6NKv4cG4IeiFsF2OiJQzAe+eEwKKiAkZh++ZfUqmUOdUgH8mycu3P9Q
	+fhFrk7WcwsOC9PoJ/P43UMLZu0Z3adiYZ0EvI179ztngQ==
X-Received: by 2002:a05:7301:d813:b0:36f:6b99:f94d with SMTP id 5a478bee46e88-36f75b1f80cmr1323131eec.20.1793932190841;
        Thu, 05 Nov 2026 18:29:50 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1700358eec.6.2026.11.05.18.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:29:50 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 2/2] pinctrl: aspeed: Hand over global GPIOP passthrough to local mux controls
Date: Fri,  6 Nov 2026 07:59:07 +0530
Message-ID: <20261106022907.10735-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
 <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
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

On B650D4U, GPIO-only host power control fails when SCU51C[9]
enables GPIOP passthrough, even after the normal GPIO request path
clears the individual SCU4BC selections.

Transfer globally selected GPIOP0-P5 THRU roles to SCU4BC[29:24]
before registering the controller, then clear the active shared
sources. Leave PWM selection and the strap-source selector unchanged.
Clear SCU510[28] through SCU514 and verify the shared enables cleared.

If handover fails, retain an instance-local error and reject affected
GPIO and mux requests before changing their mux state. Check every
pin in a mux group before calling the shared helper. Retain prepared
local selections after partial failure rather than blindly restoring
a shared enable.

Probe-time normalization policy, concurrent SCU writers and
post-handover registration failure remain open design questions.
Electrical continuity, mixed-pair forwarding, protected-write paths,
PWM coexistence and SCU510[28] hardware handling remain unvalidated.

The implementation passed remote power-on, remote graceful power-off
and physical-button power-on tests on B650D4U with an OpenBMC Linux
6.18.24-based kernel. The rebased version was ARM compile-tested on
v7.4-rc1 using aspeed_g5_defconfig with AST2600 pinctrl enabled.
With the managed-registration prerequisite, the v7.4-rc1 version
also completed one unbind/rebind cycle under generic KASAN on
B650D4U hardware and in AST2600 QEMU. Host power operations have
not been retested with the v7.4-rc1 kernel.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
 1 file changed, 141 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 85d6640ff..be22a9184 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,7 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/types.h>
@@ -36,6 +39,8 @@
 #define SCU4D8		0x4D8 /* Multi-function Pin Control #23 */
 #define SCU500		0x500 /* Hardware Strap 1 */
 #define SCU510		0x510 /* Hardware Strap 2 */
+#define SCU514		0x514 /* Hardware Strap 2 Clear */
+#define SCU51C		0x51c /* Hardware Strap 3 */
 #define SCU610		0x610 /* Disable GPIO Internal Pull-Down #0 */
 #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
 #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
@@ -2743,12 +2748,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pinctrl_data = {
 	.nconfmaps = ARRAY_SIZE(aspeed_g6_pin_config_map),
 };
 
+struct aspeed_g6_probe_data {
+	struct aspeed_pinctrl_data pdata;
+	int thru_error;
+};
+
+static bool aspeed_g6_is_thru_pin(unsigned int pin)
+{
+	return pin >= AB22 && pin <= AB23;
+}
+
+static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
+					 struct pinctrl_gpio_range *range,
+					 unsigned int offset)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+
+	if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
+		return g6->thru_error;
+
+	return aspeed_gpio_request_enable(pctldev, range, offset);
+}
+
+static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned int function, unsigned int group)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+	const struct aspeed_pin_group *pgroup = &pdata->pinmux.groups[group];
+	unsigned int i;
+
+	/* Check the entire group before the shared helper changes any pin. */
+	if (g6->thru_error) {
+		for (i = 0; i < pgroup->npins; i++) {
+			if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
+				return g6->thru_error;
+		}
+	}
+
+	return aspeed_pinmux_set_mux(pctldev, function, group);
+}
+
 static const struct pinmux_ops aspeed_g6_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
-	.set_mux = aspeed_pinmux_set_mux,
-	.gpio_request_enable = aspeed_gpio_request_enable,
+	.set_mux = aspeed_g6_set_mux,
+	.gpio_request_enable = aspeed_g6_gpio_request_enable,
 	.strict = true,
 };
 
@@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.confops = &aspeed_g6_conf_ops,
 };
 
+/*
+ * Experimental: transfer the global GPIOP0-P5 THRU selection to the
+ * individual mux controls before registering any pinctrl consumers.
+ * PWM selection is higher priority and is deliberately left unchanged.
+ *
+ * Do not undo the local selections on error: a shared enable may already
+ * have cleared. Keeping the equivalent local selections preserves routing
+ * while rejecting affected requests, rather than granting an unsafe GPIO.
+ * Signal continuity during this transfer still needs hardware validation.
+ */
+static int aspeed_g6_thru_handover(struct regmap *scu)
+{
+	const u32 local_mask = GENMASK(29, 24);
+	unsigned int strap2, strap3, local;
+	int ret;
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+
+	if (!(strap2 & BIT(28)) &&
+	    ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
+		return 0;
+
+	/* Preserve every globally selected role, including under PWM. */
+	ret = regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU4BC, &local);
+	if (ret)
+		return ret;
+	if ((local & local_mask) != local_mask)
+		return -EPERM;
+
+	/* Leave the inactive GPIOZ6 source alone in dedicated-strap mode. */
+	if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
+		ret = regmap_update_bits(scu, SCU51C, BIT(9), 0);
+		if (ret)
+			return ret;
+	}
+
+	if (strap2 & BIT(28)) {
+		/* SCU510 is write-one-set; do not use an ordinary RW clear. */
+		ret = regmap_write(scu, SCU514, BIT(28));
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+	if ((strap2 & BIT(28)) ||
+	    (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
+		return -EPERM;
+
+	return 0;
+}
+
 static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
 {
-	int i;
+	struct aspeed_g6_probe_data *g6;
+	struct regmap *scu;
+	int i, ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+	scu = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(scu))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scu),
+				     "No SCU regmap for THRU handover\n");
+
+	g6 = devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
+	if (!g6)
+		return -ENOMEM;
+	memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
+
+	ret = aspeed_g6_thru_handover(scu);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	if (ret) {
+		g6->thru_error = ret;
+		dev_warn(&pdev->dev,
+			 "THRU handover failed (%d); GPIOP0-P5 mux requests blocked\n",
+			 ret);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_g6_pins); i++)
 		aspeed_g6_pins[i].number = i;
 
 	return aspeed_pinctrl_probe(pdev, &aspeed_g6_pinctrl_desc,
-			&aspeed_g6_pinctrl_data);
+			&g6->pdata);
 }
 
 static const struct of_device_id aspeed_g6_pinctrl_of_match[] = {
-- 
2.47.3


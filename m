Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567963;
	b=pf+QgQ1EjSlQAY3yPUmFHIx2tAglTREly8tUdGj2aIaMnLFgHbMMxKUHb9+AAsL66I1h
	 f+0HMg9LTXZPZJeZsrTH2YZWZHSC9ToVoDRdYjUhmkIzqm+OdTAgsd8JTW1hIxXLN0cUV
	 H7JIOxlOksr8M+tB+qqgxacWT7iOf5tUz8bLg8Wrir7mp8KiWWt703PBuvBSSvkMiAhKh
	 JokhlzISozyoKDHhFeMZlz+BCpf3sVsfuJYERX6Ff/yKgwl70IWks2PhBs06yyqSKANf7
	 KwDlnpENP6zCu/OragNqBU2DM197qhu1vqHmfmGEtz73Zymbh8aLokpMUUp3mFEWlEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
	b=sChWMfcgZwOoB52dSNMsQNPv5JnQlT8ls0PxBUPrifnxOMP0zsrNePl1EZ0pB4JLN3UQ
	 PKnO/hE/zkUol8pUpYIORcQIbtVSPpOHi2B7PTcv1HbP0kRNehJTakbEJOsvxytokE1+8
	 LQame3pbjLmVRW0j3srjHc6ZMU5AeEYcU+hxN0MhyTntESUpXbgHae4lK7mcJFNgOXn2N
	 p810A6IgM0yc1MCOiuZUupA/I9j6NszjqHMdu1d0aVst7S79fmGjzdEnBaqsBSTWdvA8k
	 gjsk6BYRMe+6BW0XPZqx/HPxSL8X/lJ9CiLWN7Ya+zpyUITstNuE4emHykRLkoLaEFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q0stmUr8;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD060A3822
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FD060A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q0stmUr8
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e10a70540so324082f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567961; x=1795172761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
        b=Q0stmUr8PTKJuq5N6R/dpqs3w1uJTNwjXaiy5/BcEIu+sR+HfsvNTbuyRo/2EHzqta
         2ec4y9eonNqLWjNScrUF3ERWWbomljVl2fttnevRBHqFgS4Ex5NwdRr5EkGb8QpJUBAe
         T9nZNf1N940LB6Pu2oApIkx1ICugTaYYuwPdlPd7yKYa/f8mbC9FuwwmimHQu6T5D/sa
         TvTaTJ5FifJIzFcWb3OsA9B+Q+Pz7iZYXvMCmJOmSx7KepQmmH0OVb06OBfgmIK8hw2O
         7ZZOS6k6OaJBQ16bzZ0DCNlylFgQ/gyzEkDxulSZAGSfKI/2IN/KMXhM0zUkejQdr0yB
         eAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567961; x=1795172761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
        b=ktginuXUy90G5SVvFn9/XfV+hKbbfm0NGGcithoQyjdLe9KMgcoUIYkxGFU0khR9dJ
         3a8TkCvpTnHGigrkngGNQlEngUDaGshDe9PMswn22EBrdzKgqwP5cyr5YLIk2WA7NM71
         sFHH2IZ6Ld4yoMTsQ5OFKD9m21a8qbh13vC0h4mJKu6UKbFViAf3Xe9mjcu1o9AsCcQT
         tq6y5QIolP3zqQi1AAdKgreB2Wgy7Pf4FdVikJqLRzAdvt4+14HJlM3gSXtmFNA9gH2p
         geIT4kG/YHZ0E8rAg36k0xaKctxvuxflCrBnFLHvTHDYy2iZWrNv/ij7VoTBAtvjzb4T
         xGNQ==
X-Forwarded-Encrypted: i=1; AL+hErGHhPVs66/Fg/Ro0JPPDQ5lUQir35wBwG2COn+vIgAxXI1c6G3OrSA/EutA49ppm6mTkv503gGOlwwnVh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JOR0EjTGty0n8mzDpyG61e9v3FpsYzY7lBKmDZaL8hNO84zKf
	Ios1iedbsVCq4Y7xe7CAAfTqQbnzOl+T9ww5Xv1szwB367zDiwoK/o6Bhw/tANRh1g8=
X-Gm-Gg: AYBFou1y/d+fCh0vBhF2KBj02gFg5gFS3dxsxWkuxMUYU/kxwD9er7ZcIc05Q0yTOIQ
	fBYQ61G3J1fibyiVQsF+vixsMRXEX/V3gx+EyQuSFUKmzk+ONO1I+MloK76crpJfCZqdhaLRGfK
	vhGP9/7mSu/SUhTmdKXzl58A3jgVWDihozAo+OkuNgQ+IPaIvU+SBRtPrsFyJBS1vEgWa6C8RWF
	OyZmqm8zG2Y1b6iA+rKdvB1tTV6mC6WjgT6Vo2y1ixiI0YxrAD4FHC63EwpjlUBCSQjWSduz+Z7
	g/6hcy0E6CoqPZ1ywlyljRyZj0nikP75y86yaqkyUGrURQprV9/OTbkmR4qOutpjrWwviRonrCg
	523opXo9Mbw4dHzGEh27RKd/4vlwAH55z8jSA4mCE2IYCUX82y8bX746AYeV8TBChN6r2dO01AB
	V9fV2OaxD+9NP6KbowIulnmzCfeuN+6ZC+WABKL6WMsjQ423PL/78W/5ZMcRUWnOvcAaHpRMBY9
	Dx/Fp4TioseN6jsaQ2zW/RUlPQqsBKiUMhQG3FcC3x3jS4LSZjvvUnd+XJ12yIqGunJ3Ja/s8Hw
	+65/mOYqxLRnGx5hjzqJOZhBPWAnSaJ3bN21OlkwO+hKE1JfvZ8=
X-Received: by 2002:a05:6000:2909:b0:48e:66d0:664c with SMTP id ffacd0b85a97d-49c7316486bmr5048910f8f.15.1794567960637;
        Fri, 13 Nov 2026 03:06:00 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm4813292f8f.3.2026.11.13.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:00 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:27 +0100
Subject: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in
 microamperes
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

SCMI gives the drive strength in microamperes, but
PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
Convert it on set and on get. It is the only unit that differs: the
debounce is in microseconds and the pull resistances in ohms on both
sides, and every other value is a flag or implementation defined.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 43d5f3d54a8a..af33ddd4056b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -14,6 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -155,6 +156,14 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
+{
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		return value / MILLI;
+
+	return value;
+}
+
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type)
 {
@@ -167,13 +176,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 }
 
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
-					     enum scmi_pinctrl_conf_type *type)
+					     enum scmi_pinctrl_conf_type *type,
+					     u32 *arg)
 {
 	if (param == PIN_CONFIG_LEVEL) {
 		*type = SCMI_PIN_OUTPUT_VALUE;
 		return 0;
 	}
 
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*arg *= MILLI;
+
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
@@ -203,6 +216,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -267,12 +281,13 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 		param = pinconf_to_config_param(configs[i]);
 		if (param == PIN_CONFIG_PERSIST_STATE)
 			continue;
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt],
+							&p_config_value[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
 		cnt++;
 	}
 
@@ -310,13 +325,13 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i],
+							&p_config_value[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
 	}
 
 	ret = pinctrl_ops->settings_conf(pmx->ph, group, GROUP_TYPE,
@@ -359,6 +374,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.1


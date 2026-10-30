Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375919;
	b=gEXouet9DPKELV0kix10RN2DOMOeGE7SPZtFUbf9dJGS65WRgDHA9/yEoUXrVygrV1ze
	 HobiP4hP+C6nWlZ6/JUicgpvpETvJMfF+N0WLMdibeqmIibr3P2Q29dDVs8hGrR9ZyX9X
	 JNipyP9ov2SD6rYafSfVUaFVSj27mP+/wVCW3qau3+4/4gnGaZX9Ij7BxVnnl/eOV8jxn
	 hUvZrtezi9dp2gkrPheqdtF95T4LjcT6CLKNGkiCmr7jp5nghq3ES/N6StDRFKiqW83Vj
	 H7lgYPh0EJahh6bNZMTRUOzzPCipujFckqukXbM7wP+ZheFvrS04cbasoPEb7N8Odvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
	b=NU20A/IE/fBBrtw3ozYI/SdmJbYluTkZ4DxCOvaVVSV3JHBvAY3536iiQ+EmEWLQJfSO
	 GnrQ+7VDLOHJZLmIKwbT0bc6hQBVO1VJOEBbQKprysgp2KxDuEnlVGptp8VBj5hmmpqfo
	 HQtjE8TANgeRRxZ5EkpaKstYxziAWOUoIx8DGd4ttd14thwzSXdRt0jbvJFAqmdNKprqu
	 XwQYKO0BZupM5GofKU5YadK6iM7tD/5RikA3kaTccc8sVRwlX4RT3NThOCx2Hgik63Vdp
	 4VNrG3KI6k5S6WHbWBCBgMwKbTWG1vf2I/2668S9k1CJgF3dajT10la65PYnT2Tgn/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fbab5HK8;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72328606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72328606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fbab5HK8
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso8606185e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375917; x=1793980717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
        b=fbab5HK8y8wX1h6u51NvAWZytPsVMx/9Bp/G3NduLpiZtq22JP0dpsORhTBkWRBU1y
         fludwphpfzYzAo+EdGTm0Y8SixpuXyuGTQzCdyiO434bvBE0JeDgNoMUFlByuP8vyhh9
         g71q2T8jaQzpVnk7qpTPBa1lAkreue8/5kS19SSr9UlooAOF9fBK2V6SvGJHU+ekVv/b
         /DyWXQM8qoqcmizlD/wshtPqVOJGXkX9+qucfJJKB3Vjt7YIXwzw5HXk+IFvuTB5iPM0
         9CaDxpIyCXKeGFjLhX7pkOOVTvbT4Tnm35XNdQOsmiKJBn3vCgmiAQfTRn4PgRgMyra4
         PbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375917; x=1793980717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
        b=q69MLwKznSdsRoOkjFIn8TkyQnIMd3FgR/w5qX4wggmu5mDF4vth0wS9YMYV6tvS82
         zyq8v4ew9k8V3es6h2FSvSnoZr8xTSHH8OfwxkWPTKnysoBkkgSjinEb1+Cr/8r/5mvM
         hrKIWBOHil2m2AuYuL5Uc/uLBcNe0KtXpBxHmhzEXg7/p3NfZn9UDtFRZ0Ab0ewHcTiG
         57xUC7jKvZR1l0V7xDjvX0Y6wlmH4jRyrv146ALzUX9XdGG8BMY/1nEhVIHhnzgNxo9t
         a1nmj4vUuxlT4swFwECxPxjCQQQlx6v+lgq9S1xXJso/ssDmbvgiMmJC1kJsxeWbpVn5
         q5dA==
X-Forwarded-Encrypted: i=1; AKwUvBxa0oACLfd12anutyvcWdN1Ikn0MNg5ON6wPtw6oaoRjcQyhiRmnNtwAvMIYRTv2vES+z1koW77Qk90dkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMHSUnm7+ZFcfe94rwxSt9B1Sa7Ay32o4HWTttFFUyZ3QY9YgL
	fY7s5McFXLasnc64s2HGb9euSXDz9x4PdnA37zC7+MsRR3jWFyT+CxZ6DnvVv/iyc/k=
X-Gm-Gg: AYBFou1edO9ydsRW+rRDuEme6DtvwioKn2ZL913NfSgZG+DArxdYrx1I1T9IQWcIOFZ
	64HZZuZU/Vn2uUZ1g2+Fa6IC6puJH4/K9rQI3LcFA2QGSqzvu52CjsQ7K5+ShMzFKiAJcVvYtj+
	1aHD3rU5Klv1bULy7A9jCuNm+O4Hf/kYgw1rggdObc3t0ODpuJjrxgN/W6MKShLW7MZxRJXyS8G
	YrovPGYCNet6FB6KjLH5odpEF+4o1QL2EylVdbyFypJYhAIna3oqS/00xVtIOx0xz0BuGK/7vju
	bbBZ/qeDAGbSyqvqx6vIXIzA1jAdch62zjZTyJiPAnLyGGy6eff1CcgCLDkj5+F3YPvbcz+o0qH
	FV4I3pJS4n5mYcFRThrU9ehAVRcfAqwVA50BldxASj2eWsoFiQV/hDLjdfja9AoTbk/FmYphhU5
	BhpMjrXUmYdc6vro2hzDYj7zJKmAM12r9mGpe2nCZnwKwvZvhz48cpSHMYQjCCEJfe2uiXpdUqP
	gFaDRzeHtM2KsRyn/AGfGJMtFxnxPLIoTQf9YVDVIUDLVn+1QuzFhMsShAl8OHHqI1qFOO3bLBL
	nePnOIZcbSO44HKQ5QOM0GrEU5zQE+2UKHl9ugXdYNOaOTj0/os=
X-Received: by 2002:a05:600c:811a:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4ac1889d884mr57318135e9.31.1793375916707;
        Fri, 30 Oct 2026 08:58:36 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm57000225e9.4.2026.10.30.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:36 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:32 +0100
Subject: [PATCH 01/11] pinctrl: scmi: send the drive strength in
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
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
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index c93d61dfa282..6bc94c68e89a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -14,6 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -155,6 +156,15 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
+					    u32 value)
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
@@ -167,13 +177,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
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
 
@@ -203,6 +217,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -267,12 +282,13 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
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
 
@@ -310,13 +326,13 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
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
@@ -359,6 +375,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.0


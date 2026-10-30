Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375921;
	b=xRnS/EGiIZgpzqZY2MDgUw3mhJ1b/akbYz54JvovtAbu3KWWpuQxF8kxarAB7swz5bfk
	 fAMl17PlPKENPnM5izeQZg2aTQKiMu9+P8xeug7C1/w9oFI5mMOyad2bB48NKFMNeJu27
	 a8jdJrCQSelrku7gzLoCfeVmClKte2oxUgk8+zjh5N16IMhGVcR2U1gAKCWMA9nKpHEDt
	 cw4zoF3PMRBRlZPzOu3lI6cqZQZrlYS+KskFnLKPxTBx8rCfiHxmCoS0nbh+TLdegE8RG
	 0tAy6gMij6C6beFt6RIYcj+C74fyqI4fdsCGMZ8tJ0Tyy8nAdsH/bD2wTvDAC7gP54w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
	b=ZhJBkl2821mHTNQjNKaqFo+8UytdTRdxoC6H482R8yPWhHNGjHMMnd71tbVVLIJwZXtk
	 D8GjqEZ+qsMh07BN0ajSkgsNymmOPc1VN3M3EYqz2l2oc1F34iFw0I1nbton8od0EB74u
	 OXqsJv8RcgRaNjMsm5nx5ODQIea2Vogeu2A2TyJlNO8AEIcuhTx57zNoCrGswahJhqOm2
	 tx9U9EgRXyHNipR08tky1TeCHFhGFLGO64Z9/bKLdHYmkM4nRSOEJ17kd6kQM5hFPNZKS
	 9msPi5+CtJYnVkn/u0NdF2P/QLypjhherOe9/9nMOoa54tjuNJ47nntgiPUbDF81dUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TkPrSPOh;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E5860A2608
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E5860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TkPrSPOh
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so445858f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375919; x=1793980719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
        b=TkPrSPOhxPJ8/bxACPBSXVJ+BuLIvkXtRzxSHQG72tIqYLAMBWGX8ZMWGWVtCqWmQp
         N01CLFwpGFpFYlXH+bMZEjarAtD2WBgpICxPW5pAfFoH4T8b2Sb3eF/8pemtj5sj6zt6
         nr1EbGe2N0xwV0VUrkjnsCBvvueXWqPUfwXqu8ORlknhzB2JS7lYcvcIXZHYYK9Ep8PK
         DyVA/yLPcSmjLT8kcEgeMumP85YaVCItGKWb0/VFLR6mkvCo3a314ziPXHaH4y8Yy0n+
         1JmvVJk7cXax2dL9tV19lWq+AxYwxOTP80JdQt6CtRaFdPGPsavY/gHTo5foawxftbBU
         Sfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375919; x=1793980719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
        b=dDlWrBPMCiH1zKYr+cyU93rD7L7s2w7b11ioTdAGhCcE9ohEoboZLGrvePsl+QERRd
         rWgqh1xYJbalaVz0yMCAOeJVAOgMkrIRk+opvfMAXprUL1/tdfMCJPBEfB4WgKeD53uZ
         DXVhHOoS1HXy2T7SsA6WRlidNxqT27TsqcjpoCnm0kOLC1Q4CcWtMMLkKAZLMGUbDtLJ
         uptKWPEiuBtYxcvIyDWC9MtkrDicZnP7wIFs3xUZMxQezWtgWXutztIDxxWDaAeexcQm
         uR/ckvK8qo038Hg3cMM7aojyzE8I5xYEcEQCPVIMeDzPz+oJefDwmpsUDMt18RqefDMk
         JF4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNIeTjKQvHl4Hx9ggKUAlbPPnt0h+73/tTt8usjNqSuHeP8/JV3VI674Jn/NQCg291uDDrOl5vSO6ICJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6upus761qZLv5FT6W3WsW8GKKFnVe+8MI2DCcTG79gsZF8YvJ
	LISmYWGlCzHKEBnR1WZBieDTtVE16A6xBITub1HIlHW3+B6wFUpTgcthwLjE8ETqgGY=
X-Gm-Gg: AYBFou1H3EnVxlDz1rCiHyzVyK7LWffjbd+dsw9dBM2TK15mOLLrTK8w1h2NonRtCan
	b864mok+Vep/krX96LhY92g+W+iWa2uRQAtsDZv/EHtiX3ZOTtgYBQ8YvM2uxKW9mLxAvwduZIq
	mDpHdn/vgOB5tu8a+jG7P3b2+fsjyNirrrEqmvSfaAYL8IcrDAd/bLoiBPyxf1+89CLtjrVTSGV
	NbkkB7MlvRD2YsebhJFA6DsoJHLXgR1krNQAWKdEMPvw5MxRr9ByzUuVSJ4K2B2PUyIm2T6vKZM
	aYUJD9cALVEr2ah7vY6WIoJ5KfHuQqAvcCtOjaASyezNy4uv/R/wZV6JIy1/BdK9ZxQG51D3LpU
	0qN6R5INkj8zZlXmysBWilalxhmAot40E0CipHjXLvRDytFCzFPyk3J4OVh7Kg/vlK64Q8UWvST
	A+L2XxvO90Vz8gWnFPq9jTCY6vnZ1Kkh8M+tLVZkqHfxwo4W6Nmc+UhOS3R6B79AgAXfEb78LdW
	JfaNW0SUOcAvBIxMqQlI0+E9ktzpFKK7ZrgpQ+5XD2KWqSvWmVP+GktJVmrXwnTqI8fscqF66dS
	itGHiMnPiUBcfiw6Q+q0EGMGVwenwvhsNaEuPNR20SiUcXGLyqg=
X-Received: by 2002:a05:6000:250a:b0:48a:f073:336b with SMTP id ffacd0b85a97d-48e6e2fcd88mr6043986f8f.23.1793375919216;
        Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3862691f8f.29.2026.10.30.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:35 +0100
Subject: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
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

A get of a setting that is on or off, the flags and the pulls, returned
0 as a value, so every one of them showed as set on every pin. Return
-EINVAL when the platform answers 0, which is how pinconf reports a
setting that is not active.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f74ef0952ba9..355ad26cb215 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,13 +153,41 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
-					    u32 value)
+static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param param,
+					       u32 value)
 {
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		return value / MILLI;
+	if (value)
+		return false;
 
-	return value;
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
+					    u32 *value)
+{
+	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*value /= MILLI;
+
+	return 0;
 }
 
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
@@ -232,7 +260,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -390,7 +421,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.0


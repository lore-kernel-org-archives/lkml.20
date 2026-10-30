Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375920;
	b=dVyVtvFt9rpLS7KFPg824Ot+TIKuI3rpR9weQw/nuxtdBtbgzq2QjSeXuVGuFvDR6/wV
	 IjvFWhdzAzA5QjtuxsGZ0MxmQEqiH3yVAUOgu7mSqO6hww/xCz8CmohnYyeP93jbnEger
	 i5jGABbqSv5Kr039Ldhqs3U7B//OIDhALBmvuvR4FH4Nu9pa1NU9PZXzUwSThHKeUWto3
	 /J0tpbhhWSB0uOQr4XJx7MGbTi4lx+N+bcbMq3juvma/lMJ+3/sXgLRh9C1bWiVJxNgtv
	 YfbE1rZe2105IjnqC4m3z8bfWFc5JNVuLeLH+d6LFtKLC//VB2+lohdPwMSIFzU7T4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
	b=ohniE+CLizPiVRHzKmLvlkYYMGVmaasfp0wTxGPb9az3A1b6wxN0ZlXH9WOGf98HMfQf
	 dxzGBxQ110KsYbstyDRsDUS6xJyrgM1UPsJ3EONw5MHBFt010l995hfpWZvcduQQkCfss
	 Oh0ifWkpC4K0y6M/mjc0+gGAep6caoK1lRFU7gqzeMczHMfEOZemOG37o/QLVRz4pZmku
	 JUKQ5jWpCt3BtoP+q+AsoIrU9e0B8vNZTpKV1X9d2fxAaYXXNrxvbJu9inlPIQ21mP4so
	 dq7AbrtT0/iZeSfdHUwCNlaIWnK4Ex5agtB/kXUNlivMrpkEfBGI2HRr+Y//ujRiuVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QcX7czRU;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D79606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D79606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QcX7czRU
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8852915e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375918; x=1793980718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
        b=QcX7czRU7i5SmOrIAuO82prn6x/lb2cIaIcvGWBYQmSqy07CTmQsdM0bqqZLopTxWT
         ERLJIt1gU9Gary3puHOeypsrLaZAg1D/yFoBPGHc0WKV9aMFTq8nhxFcgX2y2Vd08ILK
         vTSnUnh+ORhxTQ9jJKOP7JzpfZCYXdsn8Hyd4Hr5mCAfyIrhXx/ZmEw3WPJOZ4eAv4cT
         /seqlTf9QpAVI53Hxlo7OepHfycULrHKt09H5BUFu5ymcI6esSPpyKveUFp26jHJJNyK
         8v2Tmwy0Tl2l2vDSwC5UZHJdQsl6UpbPtorWUl5H0rUhy+FjptNgrw0wlqg8MSXwnUT1
         ud5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375918; x=1793980718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
        b=cyK9d11wILVWCxbp2bdf6EOFzhY3vJFyCrP47xfTnSmhz1VrBM/RkEcny4OmBhtxtT
         mg+Ns2r894sKRRJFS36xaBMzQmxFKVCJleLWnVKcN+k6h+CLnAmzZQCk02Ug8WZLZ+Wm
         OFp9VH7AjGteAdgcNP73eDWYAZG/sYNCoNrkGby5JrXG7MxILFWUrwFxX7l3T7xQl1Gj
         QOaVsux2TOZPxv9jtJmPjOsO0yrmtEMddYCyigr761lrwzEF+sWAmq6ZnqH9K+DKAnjN
         DHAsMuSoMJ2PpRQbTYsTS6CnTI1k1fZvZR2tLD0CJnI/wPcMEi//YGWiOpd/0GRRnNwt
         nZhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpt0mqc7exOOeZSMYL+G4aILHoXfnDme9u+3Qi140p8I0eIY0nE/hoctP6d1g1OhBpspEZcxzs0erLlfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjdUQcNg5O/s1OimkcvgZ0jwx/znlgFqIuYcYKiCY0OzqpCist
	20FAIVQLvZurc7Eotwgf9pdAftdebhADOyQC5XtyiooYIyZIN5yeFLq1lBbWnkUEBIw=
X-Gm-Gg: AYBFou3vE39JUdjcXpvYlKHhXN9FZ9qKAiolacdm6QVFRYYe7Mz3tlwNm943GZcktzG
	jEQ/jEy1kTx3ywqN6zy7/NFoId1HnTpVXRtcaJob+IB8fjDRjsOR8ZJRQXT/DEA5+hr4H7dO9fV
	46bcs7BX5wLW0PrxZ6IBPmxQkuNFLJJRnUfJ3iVOkVBZc0C8wMDVjKgQqglD66GZ2Y8TQi06Eud
	AOQWycbvj/ajDOps/zt7+SpR9FCLtqNsScR9M8n6+17Mgk9awmsUZrr6bSkseTWGJFSiAsOJUIU
	lWW49ansRPTgOpy5hu+MEHfzbpwpnScwzmgilohJQI9theUWuJXJvm5LgsCKp/xMFaPBxgd+Rvp
	MiBvCIh437NHFnfjEW0czeMJ+7GNhGSnC0X43DWlJyy0bv36srO+/xA5B+7wH34qgCmdJI4lfQI
	KNii8sBo8y3SY1mZQxqLpPwtgGPjFS6v1MlB0MxhFgp/Nh3+2/b4jsbz2Eif0PinZCOeiF/iDfv
	j92mSe1V3qRjIbwY+fosdKuTaz891cDKTWkXU6QVeXsvT1Uiv0w6DOn8OIsL22ZmM7pZIgLCCgZ
	eufd8jqgDXJLPtIVXXea/42mD6SJTjTtixT6QlXYtaW+YmRMm5s=
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4ac1932aa2amr62355485e9.34.1793375918383;
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72578sm27102895e9.2.2026.10.30.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:34 +0100
Subject: [PATCH 03/11] pinctrl: scmi: send the settings without argument as
 enabled
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
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

bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
drive-open-source and drive-push-pull take no argument in Linux, so
they were sent with the value 0, which the protocol reads as disabled.
Send 1.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5de47e060e8c..f74ef0952ba9 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -173,6 +173,21 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
+static bool pinctrl_scmi_pinconf_arg_ignored(enum pin_config_param param)
+{
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type,
 					     u32 *arg)
@@ -182,6 +197,9 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		return 0;
 	}
 
+	if (pinctrl_scmi_pinconf_arg_ignored(param))
+		*arg = 1;
+
 	if (param == PIN_CONFIG_DRIVE_STRENGTH)
 		*arg *= MILLI;
 

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567965;
	b=xQLhhNEkSecf8eKz6gNnd3XeC/pduh8DvnhuzCOWalPgFePhCcr1KJ6v8iwXAShQKIjL
	 MWz9okEW/YdHlc5f4D1nBk1RCuvQOmrD15MKP4Lq2U6KG7wmQQKbvxxUv4+HtS2/lWVVY
	 H8zcL61aIjSwlkZN4TvSkMrMRDZA1sqz95EfxrXevQfoNepvUwDqXhXgnotWKUbKOzqOC
	 K0+93zs/rqnHq6uNTilFsqDz9W1UlhucLhrMTjqHrPcUj/IJaz1iEHC5wZ5HlSqUnxgVr
	 p0X548oHd1mFRGcDJ+mZMF9UXjNyTIvCx7pImXyS1qvheGQo2efkQwXg6UmT/aGmnlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
	b=En3V5kUopogaBw2XjJ1thV52MQW9KoXP+gjTymZOzP+SwtHMG9edOin18FlrLUZdKvrZ
	 ZsAj2aWroTbEfyZPJR8nLixLsj5kiZBX+CDx5NWhNSbQoqopO8RdFhrULIYlRwVjuS/OE
	 KX0KliVChVqrY/fv3Qicy6lQxY0z/uyxl4P2W78ynVRC5AqGiTlWp4F8XMNYoVPJhUiQC
	 v/ojgax3ySgfgRFsauFed4GvbLhfoUwZPR1mE1Cj76WhX2oLR3BDL4ZM6+uvgFEOccH9J
	 1EG+3zlvCoCoDDjBCy6Mm8dZEs/cX7y2ioiv0FxljGTkFk2QjvkIrJ4ekg1tc7uk+oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="T5p/H/ae";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098F260A5BC0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 098F260A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T5p/H/ae
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so6286835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567963; x=1795172763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
        b=T5p/H/aeUArPYFpqIPh0dCK/gfzgmw43sZx2L7r0jE/0pP2Txd9BxTYLUxvD4L/AcN
         XBNbzGLbVcEu25gpUEs8JdaztfVFr5FTURNEuJ/qNJuurRLGeGyxF5SetcskixcUEOid
         BTp55qKmYGwYPs+aU7C5/CMnvN53DIybnIJrsgW3itd98ivxFTRQqOEYR1jBhENMtGcN
         LqRM17mcTBLeNvZVC7/YYtXjAAJ71bJvS8f3EYlk1KHJMGKm5fi+BKNCMu15E7LsIAQT
         QyIYaO/BIu+UR84tXyDTJS3yJSB3T7Yh9B+UGzqZ5TmNi69p4MN7CBgxdVZxwlHeDF/K
         PCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567963; x=1795172763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
        b=HgkPrT8k1zPnA/oOx/1Oew1SlqkrYKCXmlHQSstFLIqyui3xJN/+qRAHBENxwEoQ+n
         8ADBSEa+rqPDG6Qi54uwwskjdC7U16VY9Xjcr9Mmv7dYyNPMwad2Kx+nFwoWop2AR94x
         sOB9IhC20LVmKN2lZZ9ader67eytplwCQ9FUwaOKriY6mMeaSlAL/MuTjOrPCv54F+V8
         iL7N1Dck2xG6xPIMnUjesZs9FvzGogV+HOjFe0KgRI7VHk0GHhyQTraSzEe3lLGtEXag
         upX1Wa8VHXO1tdf7PS+FdHVNUpIds6S7joY8ukke6H4BFU/wb8yXTArurFc0NQO9Y5Iy
         ahOw==
X-Forwarded-Encrypted: i=1; AL+hErFdt65oTyGnb57fquQVwnrMpJThlCnM029FISK0Ibm/9SQrcQlg+ZpGYKsm3/JkJQKxqUsZVplegegeHoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B1L653obqdP4Xa/h92OOEx8B2S5kNLG3itdKLlBLARXd8u19H
	quc7HUx/SKRM0uiHWogkGC6Bw7AM3PEb5yhXdj6JeBom0DGfH1TLUN/p5XnVqZ0HBZ0=
X-Gm-Gg: AYBFou1ok/YUgZkR+5vGxnvEvD7pR8LbMrGLmcOj/H2DfSztnqAXloQ3izxs7R1ZmfB
	VHXZ4kdNvSobvMVPW89raq5YDGgEv8ZjAskGYKo5l2hHjjDwnsFamTC9law+Jlift3eHnmKWYW+
	mHqiZT2dJIBLQ7BBbnUokKspWefi/rts/T0iN3uMbn0LIe2SYxkgP9xSDIdbo2o3Pbx4rWeHPrN
	BJJi08ETJ5FGtCKyMWjeRNwzkMsY+pGzeD7X+vDuaIhAGDM1eXYbeEsQpCavukuQHwJcY0Tb5Py
	kNj6uTDVdZYGet2E/QVmi3wUmIZUd3owQMCJTRZewS/Q2sLYOO+iG6Mt7RZ+xKBdm2ecobFLu8q
	5c4gd60lpPIUvBKtfCss4/jJ0TMYURSmTSNdoJSgdGPGXdHvjboP4t97Kxkxa63MoEmeWuQFEAt
	mNqBYnVXIdFi24An2Z/fDvyo4B+BauTlUOA1y1N+gi8dlV6ahJHIyc3aDqe2wnnv51pW/cHoovw
	phBQT6CUOwtxnDQvlVsUlRo+DQLYYiOLHNs5aSynj+tsGpCrLpGKYvcWaL7CmmPJgqVHYlOesMi
	0t2p5kQR9QyK9M+29Y6DV8DFCZQmuYuBZKpGGfYmJg/ys84G8vA=
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr30894835e9.35.1794567963242;
        Fri, 13 Nov 2026 03:06:03 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm7329785e9.12.2026.11.13.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:02 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:29 +0100
Subject: [PATCH v2 03/11] pinctrl: scmi: send the settings without argument
 as enabled
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-3-faccb4685d88@baylibre.com>
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

bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
drive-open-source and drive-push-pull take no argument in Linux, so
they were sent with the value 0, which the protocol reads as disabled.
Send 1.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index cbe4f3b6368f..221dd8d30009 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -172,6 +172,21 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
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
@@ -181,6 +196,9 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		return 0;
 	}
 
+	if (pinctrl_scmi_pinconf_arg_ignored(param))
+		*arg = 1;
+
 	if (param == PIN_CONFIG_DRIVE_STRENGTH)
 		*arg *= MILLI;
 

-- 
2.56.1


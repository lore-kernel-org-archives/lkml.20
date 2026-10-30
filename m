Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375926;
	b=tPnjjmJlWibS3OCG3/g3TcMBK11ARDEg+NKncnLmQHcDyyk8lzQH/Pkpd6bEIEFNYouz
	 mFRc43uU0jpBNplRb4Sja+BRbJ2kXocaI2SNUdTqhPhRWEUGvbMD9wwJQ94p0VemuAPny
	 3oVRgwJyqNX9dMqnj2RnfUBV+SnwU9lwwUy/pfnPqTaKRnAuxrxsgevgsbmrraUdn10fS
	 2M0yhQ5dOD6tdT53AZP9O4gYj+O3SAp79tYKCabSZLFHgraNyDpK8QNGKteCWhUKZDFCQ
	 47FWK1QKhMAz0z6r2ZGPwMeCdXuLjdqGoMY+fMnlkPsziKb0J5VWDLSoUFuFCBmspig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
	b=b+zXmbG1AHC0PvR8NDaquSKst//knsF/u7WRFCVXBc9LN4G+wiiO+03ARkvnGFDDOMvw
	 2ihaNo0z/fSRu4irZ6qA6/1Rfe1SsylvnTr1KDNhC8r6TQi0mQcra4/mQNdeYf4Ts4Dsl
	 couEwa5gpGN2Z5R/5OIFMaA1xNYBhw9do06dLyDPzzcOMINQcdM9jvunuECk0N4ULnt+8
	 k6SiJ3L4WA0+cdBsAnVfv0iA/ngfELgdbS1Iv4ggSraJ2aozVtmej+uXUzsZ1uFNX7Ozl
	 dl3Ysl5ET7OeqMzsfsgxKNE/k/8vfUGLfzV1e724tedIBvLeWFVXbshNQU05TdldBiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RvKXdaZt;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E2606A336
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 878E2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RvKXdaZt
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so4753355e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375925; x=1793980725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
        b=RvKXdaZtJhcETgl8YlbAnDofeGmtAsB+7fotRSXMvp+ewDqiLebBIUsEVR+pn8VKE0
         6YJQjRpujfC2eeGVDS/RrI0ACEzIzK9QVkuiYQGaXwvVc4itSm5zafOlg6UsBYMp0XVa
         LUI1x6/dNrB6xAJ7j2uqxs+4cBDI9mfhD/6qc+S/rfvC0F/vyCEtgyCh45U3zjDQW9wJ
         BcN8xrEIcFZyrBXxwVqX1sgZa0tFpwnfEumbXDHrCnSv390gF6Qdf8razGfWLmSLZgn0
         lVZLcXDL6DzxNDaUBQb1DAf0xbXk1BRuoJ79+R+NW3PUxM0RufNmhgKHqY0beTQ/yPIy
         1yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375925; x=1793980725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7BatgHj5ITP9IvPD8k1iBj2N7wXMOFQgCoh9MUEa7E=;
        b=Ethyt1hDYqfpD3Eg0Q4xHOEPM3gHULUxHYj4674tMfCS9WrnLt2D765yRqLF3dro8/
         dCxpZLnrdvbJWs6paU4/a5cuMbcihOspveu++DB+hhzMU091F55H/czg4uSIo8ns0zHV
         56zq49fW2t5HYcyXQtUADb7Fsp5/VzwGPI48ZTYznQ2Vf1N85Rrn46Z1JyVIiGAYVRK8
         2wI0AIiATjF5Eb21bb5arE7PUV1cFLUO8F3bU4FGDD4R5duaBKifvNgR1pyO5E+1c0Gl
         WDgALBKvKFPOjGiSXaMTCjyk0oh9sJgaHfZRHQ3I9dV9G4BarSp7WQkcVTXK9HEyEU4i
         PuBA==
X-Forwarded-Encrypted: i=1; AKwUvBz8BfT5fF8mXws2lLJG6KiCBgMAvfcqrtbDFcGYQlwCsGFJievNzAH5cJ2ds8lgOw02ydWDvDiyIeajaW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6tE++1zy4P2oYGK0YI93DOaf4ZTLyXAczeC7RzbiutJ55IMCx
	TyS8e4fDKbN2KfY85t7zrAPSB3BzWM/lipqjUUj/OdN+Hj3go24/y60jQW6YPutLQ7k=
X-Gm-Gg: AYBFou3+TDvm1iTE8tXPvO2pn/ZcQ6yx39Gsg6jnP72+OD1BWiK9/XEZFceYskQq+IO
	311n3xIiajEkYdf9NG+0KgFlMAV/FV0bk3CFnWbyizU0iDdPsX7ljpl3sr8Cuz5MHLmmRJUhHH2
	0qcHxpJ/oGzNwNXutxZs8+g+tct5Kpt8cR0pFxU9LckXeKYaPUA6YSBpk8kU2MMw//tu5cpMz4H
	I+91O4hyT8tj5XZrmTkCjcuHR/mtXpZhnBLPKGlZkD2R/Gzoz3q2Vn4wlo/bw4Dn561qOouExmb
	rsFp1HqobFiFkez4dgqQ0DEd9JkrcC+l+Ob+od4pE8/+f2sAkbioUokAcBPWtY4/i44VwHw9VDt
	KZJ7v4/h4mv9xEO43N6BZU85jAP7K94MTyRWa4Sdlw84agwl0K3EqsAqZqgoMO6jAPYovrrIgPK
	rL/PMppswqWKsIEiAlY+fPCdNzdVWwWBzqeZUYquo1ySXcPv4NT8yFyjvN68WabFriWYbQuZH64
	DYix8Ak+ZuYyJFeTEcEDZGSQnmDLEhBqUeA+NBEVj14VLzmbGKQ4tLtdOmI9f6pShv4CmP67vLH
	gB50sWi+BFwa5GiyhUEmChr1t6i+TUqIPE5Z8SB8j6giFFLqUclb
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4acaae665a6mr33076135e9.13.1793375924966;
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm146942255e9.4.2026.10.30.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:42 +0100
Subject: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
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

On a GPIO request, select the GPIO function of the pin, on the pin for a
pin-only function or on its single-pin group. Without a GPIO function the
mux is left as it is.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 64 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6f44e8c0fee6..ba649304638e 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -74,6 +74,69 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 	return pinctrl_ops->pin_free(pmx->ph, offset);
 }
 
+static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
+{
+	const unsigned int *elems, *pins;
+	unsigned int nr_elems, nr_pins, i;
+	bool pin_only, gpio;
+	int nr_functions, func, ret;
+
+	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+	for (func = 0; func < nr_functions; func++) {
+		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
+						      &gpio);
+		if (ret)
+			return ret;
+
+		if (!gpio)
+			continue;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
+						       &elems);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < nr_elems; i++) {
+			if (pin_only) {
+				if (elems[i] != pin)
+					continue;
+
+				return pinctrl_ops->pin_mux_set(pmx->ph, func,
+								pin);
+			}
+
+			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
+							  &pins, &nr_pins);
+			if (ret)
+				return ret;
+
+			if (nr_pins == 1 && pins[0] == pin)
+				return pinctrl_ops->mux_set(pmx->ph, func,
+							    elems[i]);
+		}
+	}
+
+	return 0;
+}
+
+static int pinctrl_scmi_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
+{
+	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	ret = pinctrl_ops->pin_request(pmx->ph, offset);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_scmi_gpio_mux_set(pmx, offset);
+	if (ret)
+		pinctrl_ops->pin_free(pmx->ph, offset);
+
+	return ret;
+}
+
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
@@ -82,6 +145,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375926;
	b=NTQAvDdGYZOh/oY2QUNJESMqjyMuyoMgNTaYioTHQHnMjP5XJs3x1HE2ICuvkL/Qzc6Q
	 bfkI7nncInVVtGOW1VPJqTRpOS5SV0suSLZ+pWUeMypHNEs8ObREjOPpZ+RiGHNXzASDV
	 QjgZ+ga30cwYoxSSEg2A2qMgycXbdIwK9SxytlOv3pmobsYxJgFFd1Z3Q/dioCD1vb6/8
	 sFsEgv98JZrQlr2sPmENxX62nTQYBXE8d+YIMa4+agT4fLtnaIbS+JldUC9YfJYi048ZL
	 9EgNGeQ5WOnjBEHf0R2UDXwuYOXkeDlYzviTREUxul2JsIyCZiTEL+9S2SHwH1VuCWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=;
	b=DStHltxzXYiM8ILwoDGpCZaaPEc3qT3kGAr0eArCKRmFFJszl7pnWwjfNXLdX6nTdIp1
	 GvmydPwqsyFX0wVJvzpD/hGKesWdYlhsCJPdOjp0OfzknGESrZUUQfl9FId4zaU7a/nJp
	 F/vz5win84hBJrVQm7PReMRBUpLVOSjiHzUcKUGypItyWrLxxFcr4St8Vr5zZt4+c+7HY
	 7CUlsbVfV0bOrHvHL5vAu2KcNur478yYRlKXttW0v7W3sNm40vBx7ETL+m5jCTZ4+Ex2x
	 Gc40wbRk/ZhOT/q7wisFRuOQR8wteJfpQ8aZm8Y2sA2dtfWSJX05kKKHUoGiFKagGGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nhujKAJU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A442E606A338
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A442E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nhujKAJU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so5568755e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375924; x=1793980724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=;
        b=nhujKAJUd9ZyaEMb/3IDj9ohGZfv1qgvEgVKDLOcRuSI8EgeyUCcg8F8ZijcIQ84H6
         9A2KBwJiDG8GcQdgxP9vfkR6j5B72t+p5ka6WDSzboVq7J2RUBbn26EyF0NoR7f5Xc93
         N+BzNKQXHgKag/oqDq9C5TjUV9K9ReGtrHFvR+wKAjo7QjkIZVs6vMeE9PEzAHw4CMzh
         fHdK6x5ozGKwxJiRGfjdpBjMu8ZRrZf2Jv7lUA2YIjvnjG/Z/j8fIugQ5yLGBE/U/Mcz
         5h/10QjaSwWwPuK5jbvQfRr8AnPpfe2Dp1/lbQy9oWbr3B3ErqLVI9C6gnczlTt8WxIO
         1ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375924; x=1793980724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=;
        b=lmDdx6bI/fI+AYuG2zv9KIvwScNigC0qFvfwe0LE8H8Yjqzo/H+QqAZb27JH2IOPs1
         bHQKios2YToIcRa4JxsTbLzcplKLnuoOtVGwVnLp0zfRZWMd9gZ6ma6YwWnT52dWX3+7
         140LaLCGRB1zYr98QvgJhXvhcMrkFU/UlzPy0B4cFYjWbzYEHXvaTFA0J7Coz7ryvJ48
         K5qyZeJHlDzwG2wGuTfKdnJNPwLNFpdgOPrwhka8w+w80Yj2/3i8lAxwJSvCEY3H4vtf
         cEC83lLOCQgT6VkSSr3aFO8RkUqmO5Rov3Tz14mixgn/cGzrVKU7u9fSV/Tqa8hvkuMD
         VSUA==
X-Forwarded-Encrypted: i=1; AKwUvBxL7R/JRBA4FhkdeIF9MQ0emzAHxIeJ5ZV0yAKsn0ODMCXMIeVRoU8vpZkuZ95Z68yxP4uYnoc8wB7/Nxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXwxTvAyGgzfpuzmzS1gOWz+Od9qaMaHSt2203nnfB7qCssRqf
	G3E2HCLKLYzCTgHE+CXcQCJ8qR4dSZi1BA9kD3PaWBM/ODnRvfcdPyUUfcUTzoU8PFk=
X-Gm-Gg: AYBFou2BoBfn1YJ8ny9aOpvF8Ydxd1XE7jbpbQpctny05FCbJW1BI4aRCXhB5YNy2VM
	48hJI19lxSFRevHHcJpTuV439IYN+9pOT8kIqqGTeg5yNJpOa7PQOQlvtkriV7yiXkXEVJU5wgx
	UcUfZo+AE9M6iaLaeidrB5B40tuNUmup/vJbVgdtdRS5RY3jxRVLGZqYp3APVWe112Fy3x/vTc3
	se1WeXQykXwQt1tHto/4ZkfYMHxj+37A5glAuqwKeiWBphD2jrf+dRv9WYkIiJBZfBJBOcQZvb0
	dCJyqL1PutvV6RhSZk1pH9NpbLgaZVpCq/r80i85I5lruI5eXYkVI4JiWFCNG3dBJeaiwTV/vYh
	9ssTKatjkp39c/U/QhdaRzLF3uq75xTsMPEuxb7pIZZZt8y9a8EYCvkKn/jsUcsR6twWhDasJfS
	eHCuEWuEpgir5mRqiITHoC2ibix+ePqwW05QD8tqyAugVb/SrsfqOgXu4fDPc8KVOCTefK2xbY1
	OUypdKUhA1dGc0vg3luTPwJtGGhmx/7VcrD1TvTT8xp1ZoSO4qqU974iQRNPcO4mMcd3N6rhYxo
	KrblQ5x4kQWKNTxq+beaPQzYGX9Iw/rICnjpbSOCV5+85B2tOEA=
X-Received: by 2002:a05:600c:1909:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4ac18b7dff9mr59814015e9.21.1793375924225;
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm165850995e9.5.2026.10.30.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:41 +0100
Subject: [PATCH 10/11] firmware: arm_scmi: add an operation to set the
 function of a single pin
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-10-52d92843ad97@baylibre.com>
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

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 7 +++++++
 include/linux/scmi_protocol.h       | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index ba602242754c..27b9a38ede74 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -802,6 +802,12 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph,
+				    u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -867,6 +873,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..736d34968f42 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -789,6 +789,7 @@ enum scmi_pinctrl_conf_type {
  * @function_flags_get: tells whether the specified function is pin-only and
  *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
+ * @pin_mux_set: set muxing function for a single pin
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
  * @settings_get_all: returns all configuration parameters for pin or group
@@ -812,6 +813,8 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
+			   u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.0


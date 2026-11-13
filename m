Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567974;
	b=MmZFp+9wEln7JV6YfspD3yRE5rLrWT6/RqtxgXzqBOyI47poUCb1Y8fuSt1/7fQj8+Yr
	 2hY88MLiggGff4i7lPridYUTimVR2gk73/nyQUl1O7fc//UWmeii6F43224WnfrlA0wft
	 8Dh5/B1/ySHos03ianxlereWPboHfapEFreWKyKsezdT6sm4lnYj3gyez0RjkW/eHxekR
	 r8kBoVYRLMHVsfRqMxZJfNQQiiBHiP331BVtHcM9xx/c1PvaJEix3uCkbtpzFMJOHcvS9
	 BG5Q9b+RJbFbeRLhqgBEwW1TUcI9yJ2DYI/4SqmAENv8PzxjfX9M1r8KuwUsBkSLw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=;
	b=sp0kKOY5RIDYKxzrvGR9BJR2FacP/fN2KUHDJOOs61ENBGO19z0v5NJz1kup9xATgIZz
	 or5IEqI2EAkeQwcWrodABSAiTEVYWFED1MT42jfpLxXftgnHNCbw5RJ4GzDPZ6FjUZjZY
	 /JI6e1hsvZJpA82Nu3WQbEuM7G9cVESd4FPzJGvn3CnsDf+9BMKRNgXJeEGhKQ3Rw2UiO
	 abdq1WC69mGqScHWXFILxGdBj36I4h3QBjXJk7SPZu3ti1F03oatU9ZEfpaAF9NBpg3YP
	 fSkTfMrcfS+WVSKZkvVj8KYasG4D9IY9HdfZAGGFCJ0f2sLKyVPI07hcmh4TRjI9I0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HMFFfnCN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6CC606DFFB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE6CC606DFFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HMFFfnCN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so14819285e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567972; x=1795172772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=;
        b=HMFFfnCNG/iqlwECnoDWuz4cJGQBYA21EsuyENuOfZwmBVDLgbpPavV74cJ6gaqwwl
         0QCs8p9M4uy7DZesH6axJv9kxD3x5S+tIhNScCTHnJi4aUbA/lhJcFXhethGt690L/A2
         mYyNjJy7hldtzb6xYT8dVQC4AeQ/3tYEBdMR8OxETGptwZcXFdDqKA00XPCJjfUiM1r5
         bfg0c4mQghIMNmpn4AcIKRKG3CBXOG5cGwVmwCyY5ZSa8w90S4m1CLtrlMydkxQpEleY
         gy7v9OK5A0LYAlxt0AR3UsrstD3HQKpisXJhl2Gg9EpHAcyaybLcYimkcFMamgVV6hEd
         h9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567972; x=1795172772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=;
        b=L95/MYV/ex6liR4v2D3QbCVpDB01fA1V2wG4x64lbOcI36PR1HPSJ738rR2UwNmFUJ
         Jtnpc9vwYiKARtdO52fgID5YSrOp5uTePmCYjU4nvPOSjje7HC5df7k1b+4RlewpKRNQ
         nEYMvUwFX37LVjrGBvzirHCdCM5jQcaTGXIePcEQhnX5wmA+X+NN3WYZnM1wpF5iwrCa
         CNmN496c1ll6wTdhYhSsnm0erThjUJ696Frq/5g0Vm55hEiQC6Ee9lGdRC9R0iW0Ditx
         gXTEv7SP6CgkxFLNtpfC5tZEqYoIIIA10IECIyK4RfOS0fV8gm+A8TpYgMGa90NUzyJR
         AarA==
X-Forwarded-Encrypted: i=1; AL+hErFhH33Mgrtn8GWrMyszqkbJdryjQhuLqNNt0WrSfgQQym37t5/UvidL8Wajn8E3KqS3KpllCR6VOBVD10E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kFqVM7NxgJ7YzdyM2bDZdWdq2kUlHAUdoEHmdfNETdD7H655E
	MGZZAsoyGQpCrw9gi653U2cbE7hKTlKKLUxfndIKAA+vrEMeCIE+FxcOm52AVOd5iZU=
X-Gm-Gg: AYBFou1CPz5IlGODvjTR6gqFX9eNCu2APNQdpt+Jiis927aNg8+Y/HO29Ab8sJcaF70
	O+SVcWeZ4Yq18qL9WmMksdj0f73MoSmur6gFFIBSL9FTCV5VxQIf6/wlTKWGnXcp+sbhLL9+Kdz
	heEjz6r8DCm2vjfLAq6I9EUy2dkV+3ZSo3S8GreceOYfW2KKsBHZweuazqT60zRYvvEEbqN90Lx
	KKZKFklCd9YGs2qK/CN8qfyahG10xTWFX96yRpROS+weT9J+V+21P1E3rKv1B3uE/5JdMTE4Zlv
	JSuTEVJH6GgDz2Aw1NZejgmpHy9oM+0irogatLpSgAh8ynpvv9fEawJJPTSc+xp/H5XqyZmk2oE
	SDBGuwEOWP9wRnygZGiq0TgsCi5eEZK1G8bdjSbK96o23zKtuD1bpuWsABb5UTfyl64o/micE5x
	zMwmxhl0n2P4ZehZuXJBK5OpC5xStT2a4P07XZovtnXAJ73Hm3qfrlbXBONcURtAC/dfcXRGCUm
	UGzBPYViJz2QXPtsxD0CbSFH4MDEK1ROgwZ1o2CXePedTEA2HN5X8D2Efgf+2VDQn8JFpXyzUwR
	0oA4P2v+wp1w88rpxTwIpT5SrY7se0HlIFZ3xxe+WJFEjXk+FgE=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr46618725e9.2.1794567972226;
        Fri, 13 Nov 2026 03:06:12 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm144097485e9.15.2026.11.13.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:11 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:36 +0100
Subject: [PATCH v2 10/11] firmware: arm_scmi: add an operation to set the
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-10-faccb4685d88@baylibre.com>
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

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 6 ++++++
 include/linux/scmi_protocol.h       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index 1bc4bca4c48f..4e3968fbc5ec 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
@@ -790,6 +790,11 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph, u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -854,6 +859,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..5cea4ee14a3e 100644
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
@@ -812,6 +813,7 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector, u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.1


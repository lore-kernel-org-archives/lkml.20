Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404993;
	b=1zTGjjRySI6RK3k2IneQFMB+DySIgMjzOHJ/WK2BFuRcojhQuIALcluozYk1fjdbvhxc
	 IC8+Frzxs2fFgA1rF8KEX4ZS2X7w/rcG8sH1zEVitJnUUJRaFlmW/9pd68UpSwgeUXUS1
	 HBGbu0eQ5S/+JxuEMELG4awZe5oAOJJB8+4kn0WraTy7+oZFMlrUxS5MVDKGMkrZ29TVE
	 7Jt54pZjzw/sRRydrdejsYCpeLl823dU6fZ3w11smfSx6sO6ztc3YI4Ioy03nK0tpxFvz
	 Cx3YMc2MvkL4ho3eWIUjlDNmGktEYDB8UMX2Idg+clGHRDDAeQC2NKWJhJb1Q+ljblA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
	b=ZaofVVC6xyCcHkR7yzZRk80wxOGZ21QjUejpJXUOlCV5wmnMLe0zPdLFrYX27OwwQ5RN
	 FL7Aoe+0Lj4ds845rD44l7PYJnNep3Eo28qI57j0AK2zvZLDb1MLy9RjdB9WJcHNVFhFN
	 tOWQ5EAGelmT17hKLFIEgaHHSCKowZ3vPbTWbWcT33HcZ1C2StKUeWiFaI/RD28Wsg3CD
	 eW7DALmHBbgMPTbZcRSo7cmjpUlfmL0YJ5jr8sJoianJgGlY+u2rli+rQsX8jucYxgDD6
	 /u/+E3A7hXQb/S+YgYx2sNHOn2A27sAgaRbkX7NdMSKPF52sFJJKO0qK8otbvi1tz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYQ0BwmB;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7C606A8BE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C7C606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYQ0BwmB
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b31261e8a9so24154277b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404992; x=1795009792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
        b=pYQ0BwmBN7j5F0+YO5ZOHBIKoZJO+i66S+uz824Tgp+USMufWqCV02G/jtzbLe2ne5
         qcHNff7cYToyTlPepLeF+k57sUBhSp+woJEYkV6Cg3LgWw/tpJG+fsHa0yVZL80RmxTF
         YXqw5VLwrM2Z58VqYYbevsk7ywDlppA/a167OLd9ZB7k1Hh1dPEjLbp9JvA1W6/lBXNL
         2xh3RK5sEsVFEoJwgwWEGk0l0YcxO6YJnPMPmK6JJwwmWp1p1VjBv5FJ6QfvPk34izPy
         J5R2Il2nshrBUDE/4euIhIlJXXP7YyZvUMHoRWByHsFPNPB+YsTuppwlHrlWEodUuJNS
         Ahsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404992; x=1795009792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
        b=st8+/VvpFGZVq0vux311BSn6ygQ9aTh3svzw980X704TOTGd26NxojhkTBiJdf/AhW
         VjNLhDqDEIZtjcc8tvj7fg+lpqEVC1DD2Sqf7VnuBib1ZpXtR3OLn3YeZDrFMo6Li2z+
         f+rlDaz6KXA1WcgQY+iLnJsw4xOirCBB7uHr/kS5nbwu6rMJHS9NfDr7ixBANxIAKA9v
         FbnfmM/Z3bLuTkc87DJMkUNl8yOgYPu+t1p+QdgdTS5HVtDy/rK4f9ijLC+wufKuu5qO
         2mC6yn7yQRJCLYtAcDYpHIOi/t8SvMIQjmR1VUDEZTGzd7N7Sb8xfke/24iirv5dsi9M
         qPQw==
X-Forwarded-Encrypted: i=1; AL+hErGJaVGuHFG+XihauXiIHsxyswYNPS8gYPNfX4aXwy5pRVd7ZiATjDIXYp68Nzujsg1pmIGhmo1zp8zUazg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P/Ywtp6w6P+zQ/FFnVGBXgkOfn8X3hhccgPwsdI+xvdn3B+6D
	wMra5p69njzs2ViN4K3w6uN4Gn7BIlsKCKzdzpsQFRa7hJYUK6uPC2GP
X-Gm-Gg: AYBFou2bdu+G9Xs0ktX8hMvsyaQljoZhyi6vNJ3B2PqLwe5e2VmZDlStsDU5e2XZUOD
	ZK/x8oCm+6QCqo0rHiB8SBFmkeHnOWi5dfGyamkj/z1mKrY6JYeiEJGnP8J2I3dJsHFLI8zkbbl
	AkT8J8B/+TgturSxA7lS0bZMmAD+RaUbkWZ9JuzCwEa/mHhYwflof4mTQpnW0plrGj5hifjy9ex
	7/HmtRAlk/VdPrywP/57BA2fQVt1Ommt9KqVvJN1ZM4lE+OeacmQ4sqOCBL7dqLw2XUY9o4BwFO
	1X+VyjYd3KxzvbRTSqFqsGGq91yFYHQI+BS0U7RecY30sQVWzNZ+wNBdyo9y30U95E+BoyDP2Yc
	kaMgsWoL0x1O+0r63wfVHsvge8Kfez2XZHP8QctOVJj9HL/sJrS2vRZQTcVkgIkC6cSZOi7EawL
	qgrp/yrLGaRXKq6LecUdsCiSGoyVTEwkTPIvWusllAhXaCg7JLICCXDiKhiKe2jeUwmx8et8oDH
	OQmgHujhjl6ZBjnOEuYgTqBupdzIfvJFOepClhv/IsZXISEFWP8Gi1ntvqNNcM11yaJAIe1Bw5+
	g5hutonWZgbtoWFJ/9e9DV+k3dhcVx+ykJKOWgF7VGpwFCtMsMTcoTP1CetCDZQfmobpeGXPKEh
	gd2A9Dig+4IztouHrsHWM+3pi1SMFGFCe4Y1YCt1lwgnwvTHBde4hLnQ+B/NEuJzxyNrWuKlbij
	I=
X-Received: by 2002:a05:690c:6989:b0:8b3:4deb:7cdf with SMTP id 00721157ae682-8b3a7fe512fmr20947607b3.22.1794404992067;
        Wed, 11 Nov 2026 05:49:52 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:51 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED
Date: Wed, 11 Nov 2026 10:49:17 -0300
Message-ID: <20261111134919.90264-4-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
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

Describe the green user LED on the Radxa Cubie A7Z. It is driven high
by PM2 and uses the heartbeat trigger by default.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../boot/dts/allwinner/sun60i-a733-cubie-a7z.dts     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
index ab3d3d70f9ff..5dee2084906c 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -4,6 +4,7 @@
 #include "sun60i-a733.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Radxa Cubie A7Z";
@@ -18,6 +19,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	reg_ps: regulator-system-power {
 		compatible = "regulator-fixed";
 		regulator-name = "ps";
-- 
2.43.0


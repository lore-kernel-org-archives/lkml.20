Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733768;
	b=ns5DWZ2iOyGaC9gKeZcDwBeFMSi+B1X2ytVKQxuTMa09PoAGAWEP+2pn5CgoeRs290f0
	 0Yh3/4nEGxDTazueybVj1fsAZdoHp+rmXW5i9UeQMLb8Ijls8GXYxONj5qcwNzISeupxG
	 S+fe0QnUI6LvqH/gT5Q6h9kzbg0eJdhhLxieRXAHXlzbrJv45qOcAIO9R+vbvhYItCMvw
	 XQBLFQxNeH/mnranWXAomWS0wb7N4HjdL3NACnbIy3jOrn9ayp9D2LscBUhI3MhylLtH/
	 qCFSojZrPllv1ZpktjXgkBJbCyy0seA+CvoHDLJ0PIbviX/o961y/IPZiJRKOpOUtEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
	b=evDZ42TtmDalFcXL4oRMRnoe0rDvJNg9hga8e22xuQFhplfQzFAl/M4B1oVWTvkzRJqT
	 ZoYusuj9Nrv8X1BFwbFpKUTxS/OxHcdiKFMFdWc2I8MFQsjN6Yf6rAYRcsC9dSFsvZJuh
	 TOTdVc2PBuwWWP63cftKXkNlVq+aHQglowmTmRyKcnnmovpWECnIetMm+dL0d6fjcdJ4E
	 p3699weEP9x6yayIGdtIPDI62XwN1zDHr9oJZTVPj4kFvgO/481EyPmgcQhpl6Tua42yJ
	 8YqEXHJz9EcfTZpsPRXWrU1QBHZ4IdSSx8QyckOwtL2YWF1exFGl1RJzCAQdropCN2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AIZG0qFW;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D544606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D544606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AIZG0qFW
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso509477eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733766; x=1793338566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=AIZG0qFWjHkwIT0wrIs1eXiT5qA6l99euh43yGRBqOXU7/NTInvWaTKsiy2xRCs5LI
         C8Jd4zg3juytoiQrIv++0jgsl0aBNLbZOTEQvQAUi/eqzdw12q6Y37Qa5F+J0nSL1Z5e
         QXxMSpX8Kw9Q+ivTqOSNbr5dj4WQpuvM0qT866pEk+x5EmFID9d0siylZskjpI8am7ML
         FPf4MGAo15GnmvDGxzWLJL4NClFKycrYhapLpFM3h/bQmP8J+EdtCiW9VRolA2RTZSHI
         711AAEwf7vBxdxtAcS+38gZwaIOjy/oz9pYiDDXc5GbarvvdkK+3Bl5328ykIbKN0lW0
         14bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733766; x=1793338566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=hf0+jUmwRYd8rRrjLhVEJpesWJpO3pE8eaMFPbtG5xC66XSZw2gdhzzfWHo0jAxcOd
         atcq8lchIii+3KUkg2wH6EErW1otGF3lGrz3VJ5djn32GsL2Hx0qvZBvERyBvRqHh33l
         gy4wKmG7ZU2KXxXoJTY87h+tueNm9VGCTPWLX6GBQGQO+IOO3BkSYj7szoSQm04HKC9+
         lIEpnsAuQKHdSwC4B7dvhhcgpHB2gEZsS6HdJD+rhTtsKHkFDWGcn7MZkJJWCLtfEvfI
         bMA3qYMFQuj5NZVJlSucd+PDZB4CfAcgsJDKFqgl564ASCyK1FlxvNtCGxIII4ozoOgP
         BG0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwuJqaLAd6VaFjpnE7Ek+UsSXRZg+l75KJNaIm40f0os812yUvKuG0KMK1n3jvNSSMJR98UydcaLVdLo5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm2Seehwyjyd+i8OteTZfV033ajGuU/umc+r1etjjS69vU+2zO
	8uVKToXrddCbFnWpTWZn9Uxwt8Ovyoy6M85E6D5jxQOCCZJzo/hpFXdl
X-Gm-Gg: AYBFou39f5N5lFutl0h2O0E2I+sm5TQLNUdEUuQaAAL8SAZ+vRFMT5OSKJIBUTkkt4h
	v31N8ijJtKr/Zur1kifFX0PLaBS476INd8cOTUF2X8B0zT0oiv5qLdlC1wmJIocyOEDAOU+ATnF
	z52xYMJU8p151RmGdp5eHzXdBz4l1pLpkEHcQQdJ6s+9YQVPxScIjNdOBaYUNwJMfpokMII1n4M
	HZN5sFRpg1ucOAYJceQzSCzIqVF63+Hv1oNIHRedBMq5TKduUhhBEGJxlus/WSO0BzrC/ZNac65
	aIy8OjuIAAnEKWlUAHGYEoZKcsn9SLJyzjTTjCFf5cJYJMXShA6fTqDBYbyvnTeUB0Pgq7LHcX0
	mEdTAfTf4FWPCwL+R3gMPScuVL7aD9t9vBnI9xJdsZ805pQiN4IO24SwsRcs6BnlaFf5l2EJd93
	orxLZq7ScmAXC80nGHk4RyhNYymnEgz30FvntvRmF3Qarzhfc1cSDkRGRw0NBIXwuiXnEVm7hiA
	dwLYcP1KUFl34hnNGaOyP01zuY3KH1wfGQ/On4hr6PiwuuhrAJYyQ==
X-Received: by 2002:a05:7022:b043:10b0:16e:6e3:9a9f with SMTP id a92af1059eb24-195a065903bmr2116014c88.34.1792733766053;
        Thu, 22 Oct 2026 22:36:06 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:36:05 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 2/3] arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
Date: Fri, 23 Oct 2026 13:35:47 +0800
Message-ID: <20261023053548.1595033-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023053548.1595033-1-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
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

The Motorcomm YT8521SC RGMII PHY on the Ariaboard Photonicat has two
front-panel LEDs wired to it. Describe them in the device tree so that
userspace can control and monitor them through the LED class.

Both LEDs use the "keep" default state, so the PHY's built-in LED
behaviour is preserved until userspace overrides the trigger.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..12ae9159bea87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -350,6 +351,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
-- 
2.47.3


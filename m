Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2733D0914
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880349; cv=none; b=CdNdBW5SnZ/cPseCBOF3Rp4ht2eFxibGd1SK59cX83QqxrCcobT2dcrWMJCNSg0ZzCr1qKaQ6o3zMN8q4TTtaokJfA057/dtA0bs9DV2gpZOp3UxIyE2O4ytzH6leZBfgqBG1pLuFHj5ZeODFRDZynjiiOWgLfMyNK8NhayZLbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880349; c=relaxed/simple;
	bh=exZLW1orbjDOjAe+qhZ0AJwTOY6a9pj0Hwu8KuUxZmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hA1ffLUwFQP89QZ4R4xFwHgx08qd5Wef1v+6qy+Uu4Jhet6jvsH7iilrH6F2vc99fdxXSyj6rYs8Zc8ztbraaDGvJXPoxrIV3ZgwKmY5x40rB3pyHmQIGmmJ0SjfjyB2iRGCuXJmIQoigQMtlnd9vBGiqpPUSW7MelJDryN+xnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpK83dQ6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpK83dQ6"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso16268665ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880347; x=1790485147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxSmsJzbIneEXZndIf7W1mbqPxGSYMwHTFZOXNa27kw=;
        b=OpK83dQ6LmKheFZv5yFeWMsFMDZ7NpoEhWMXKG6MhvNkLljFOEz5wdi416D/6861hd
         tzmm809ZXb0j86La8UPLhCIItHdMOnYwFLSmXBW33MUi1tebnhNDh+JyRqHpt2lrcOwm
         +Ire0iI1M+OHIy79COr+mACiVDqnrpH3/25NAcAZpJDRS3gkdX/Zz6d8ypk5bp7ULFEh
         npAJdMcwP8DtzLWruavFQZfZJonGzAYOvEFQbo8GdXbe43HTlUIui7i8Yr+U3mNy1olT
         1e6CX7fCO/wM0YSJD6KbrdfgZqP0rsy2Ht2e3+U5pivnZonaVbJ8bREr4iZj4Wu6wNyZ
         tc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880347; x=1790485147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxSmsJzbIneEXZndIf7W1mbqPxGSYMwHTFZOXNa27kw=;
        b=tpf68qun42VvwWh1zkajGkfVbN5Lg+cGwIKTXHmSVG6M6IJeDRefR572ASnPClybO+
         Cy9JXVwHpTEyWsoRah0LopED20PtXQStY7TS2f4JeZnynRxR/UEZwNV1oe6TljPoMXSM
         LPt+Egq42BHZnP/Zrapm5Wg3Mwz8FonuUdMgzdfWwZSfbKllhiRrF0MLHy9r8/U2elQW
         63V3/tJQI6VsgPf23mhz1Vmfb+NSP/VRS/4N2Hxw/o6P9HpD9zPnTETycx4d6/iSjLIp
         Ivg1gmBa8IqfBoWrdv9e1Bk9NTOtu0IlbvoWlLoZiARUt6gD4Aj3cjha/KGENz1rOGrU
         M+GQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5u4FmxD6c7svif0hGxRbt92dZ57a0mlkV3C8xP28rhxCgxNO7uVTIXP94pQPhCrJMpqDC1CkW4XH9wjU=@vger.kernel.org
X-Gm-Message-State: AFuF++nMg91F1sSoOAuGTYXqcNBP6tDubn3P1mII6w6EC/KnDppKPn8y
	6n+CGQhBhbu5wNO5/ReU62dMplFWAYQxu/mdEY5PB/Ar8HOZkcdo9P1I
X-Gm-Gg: AYBFou0qyjCBML6zTC5DNoMSfkg+7h2OGVbzAoARHpAfZLZhTVQl895IoRwyXIBh1eN
	tHPYVa145mpjiTLEhC2vp+gQyhgGl0R9+c5tUvawhtfgh4etoS9CTU2Hj74kvAHSTfiGpDMxDEe
	2+nKquQ0gfN2GAsxobQwi4cK3WsH5dmci2fi5gJeNZ+QZeBJEmvKB4uGATTDbaSH/C83c+8fdgo
	y0UunIciqKXuf6ob3bOuHe0HCSd9uI5i9WVfSeA/lIQSD003G9zg9Rr+5NlXJqzjvF1yeh+OELZ
	TQpx6q8j4z5aXOSmu/xE97gg983TDV9u3Xt6GuyLhAnDmmGJjKV9KqXsCZyzDzrYnPjmlku6YOX
	zelOw/vtCxjI7/JjUl6QvKLJsObsbLk2cfUHXJCG/I4l7E/s+qRKX/b8XcO6nTkUVJQEaB3lgmj
	lnBHjXOkLDGi2LPBMMcRr4Fr2f+BT7JKA57SenK9ZqBpBoDfgU+BWjDOM+0Kox6gQOyjN+3efit
	YfYJKz9G7Zberj0IAd9ASqNJ6S1MwqNciFX89zzY6ZzMDLrKkWEAiM0azTMaTJptbdWNdoT7GKO
	arj3QzrdS5pKH9OtU0MCITEfs4hYKfCG7RrpncfrkSVyBDQ=
X-Received: by 2002:a17:903:3e2c:b0:2dd:c053:ec72 with SMTP id d9443c01a7336-2ddc054095cmr43098755ad.37.1789880347267;
        Sat, 19 Sep 2026 21:59:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:05 +1000
Subject: [PATCH 26/28] arm64: dts: apple: t600x-j375: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-26-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=exZLW1orbjDOjAe+qhZ0AJwTOY6a9pj0Hwu8KuUxZmI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05U5024/rGw+4x47c0Wpg89398uRqpM0UgS0mNaHP
 9p+/rBQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpTBBn+CurZBnuuFVRcb2G+qCRkWnS0haEb70yxdzeuti+XFjSuY/grvDPw3QH
 pAqdzXnd5RB8xKt4rsBd1iJAN7/PsFHsXqM8DAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts |  5 +++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  5 +++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 58 +++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..bfaafad6f60b 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..2f37784357a8 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..60aa9a870bd9 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,34 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		dai-link@0 {
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"

-- 
2.55.0


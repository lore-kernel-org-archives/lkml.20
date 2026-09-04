Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A57F379C44
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527379; cv=none; b=O3zab7yy6y5taW6/aZnfQMK7fJdNnBRaEl/oMVKgEuZU842b6Ql1ejS0r93sZywqqXPjRzezun3mfeaprO+ADe6miZHtRHKNiM8RHxRzRUoUmGlHksclzt7ZBnsUAyTOARqGVEZxvy/NdbcZO4HZ8z1gyQU8GJQwkKZquQyxjwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527379; c=relaxed/simple;
	bh=nZaahBCK6Uh8ja4ZUTeoTBxF+bQS6MmWEyFJ+20Wl+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QravLjZwXHmv/tRb3xKgiAI5Ci0DpO9Z/lEQoz4NjTBpCg4PxuDmjv4PcJ6LF97sOdIUIIID6cTYwopiJpKRuFWH4lQ0PgKaOkRNtZNtmfAqgxc1ZI5+aREBDyOxD4cPbJpA1PC+TZQktByROVDUr1cviFzAkgyUiQS/VBI/rqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9YpSm2/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9YpSm2/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49987367394so461115e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527375; x=1789132175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/t7wxFBsuNgANZ3txwtSGvXS0Fyj90ixWLfFCZVhFw=;
        b=B9YpSm2/yqcKk7uaT+ocug2PvgR14o3GROHMX1cOyC9KEJE6UytY3NHeCkhifI2znq
         4e52yb3DhATzoJCLscjUOvNivfbvFsEEpad04nlAPeTC5/fsL7Cp5PsRDJra8vYs7KWL
         ha8r2LUzGMNceoFDjWg+3fKvnwuZm1cdXMIveoNJgmX1j2FwLPb26ORbSpOLUsoVjfH3
         sk5WB33SKAn3NAqeiPozFIgnz7VB+UgPeAPqdoFHEr9f3n3wEPdPC32IZ3A1SHvSVah7
         XQ1sbkS3TFEA1uTL2ox/vZeWC24t2+AqgDQTQjyxhlgyZCvTFTbTaLjJKRbWmpB+Fh31
         a09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527375; x=1789132175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/t7wxFBsuNgANZ3txwtSGvXS0Fyj90ixWLfFCZVhFw=;
        b=rYxhaeyTt1vtyjxkw6bp6stVzop2/0E5mvIJfrvv7A4eDCvnz2HOjMZ914AI6mwQfa
         zTsCROBZh84oW7WkGdS8C2FaprBCG/KTTGoDCr/o/M8ad6LiRyodNarm+y+1JqST7DqM
         2P0n20JTz1DmXoj8FuRegt1f5FKxZpFo7I4iNg/MF6pS9NW18lZK1OTI6NhEsVYuBAIM
         zPDmVKyrY4qYfKQbRUKFV9YSBQ2py5U/YPoonBGr5yejeE2clZ7d6eCjK8DJV9xMqS21
         dFK17OdY0u9WxyZ1ISAWklTmoVYjHN5eyeP2QU5wgkrsWck/M4J0kU4L3vTubtA+Tx5i
         AGrg==
X-Forwarded-Encrypted: i=1; AKwUvByb8bwOaI/w7Noxj1krv33yAQ2jdPK7ZeRqDNG0V2if6mY41OBgFXiHwwedjhGKnMYjv+MPvStIyrGXId8=@vger.kernel.org
X-Gm-Message-State: AFuF++kiwUEY737NlrgyDDnkbNmrgRHIJi6YjubLlIoQ6UXgM/QJpfmM
	TnEFx8W1Dwa2jtbYrr1lKIYZfKtu9/jL/n3QNOgFcCZdluwFIOkScfxAthQVzw==
X-Gm-Gg: AYBFou1H8Zc+ShlEhhFiQse0KgF1SEpKpFgZw3Ice+xKAdLuc0p0akd04sO7WTq2G/2
	8ubtl+j9hv0IVSfwP/i+exTqMvCyT9RE/qyBTLkTzzoXy+pQ2/EKDaVqcEzoe3YXjJX/FSuVBJh
	yumiY4o64+fOhkJwghKfxgDlNpAzkno5LBwCECTeyqTbqv26Yelb1X3ZI6ugaDD7GqHeJIcgr7j
	QvVvxuIsBeCFGaOgFR4/1SBgvaFEZ0Hr6/dnxGXcEmTWXZC2YQwq5mzsFneamXlDQH62ZAwWHMR
	PTZW+J8Ik5OP+zle86lSfEr0WaDlQn6P4WQwCgyagniMFw2n3nOBOIgHnWQtrpr7FVEgYnodF5w
	/LTld3wFQFvM2LfcKqwSqsjXHdwbVCB71qJBhO55xrDQZSCNEK4UP/DDPwCiNicHDKpRgQ/optn
	pB4RGey58eh5q7EkEexYnmubuH96qw2xN2arqi3JRnY4Y9UhnWHnmVHqPIwlCd24IVDmll31mBl
	b8xtzNqJIPFag8jPgf7ULx3m3g6TOLuKwzmZou+9iv7zaDkvb5k9lhsyKt9epFsZdMo
X-Received: by 2002:a05:600c:1c24:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49cf7f4d9b7mr51876155e9.0.1788527375338;
        Fri, 04 Sep 2026 06:09:35 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:35 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 7/7] arm64: dts: rockchip: rk3588: add passive cooling to the NPU thermal zone
Date: Fri,  4 Sep 2026 15:08:58 +0200
Message-ID: <20260904130858.27803-8-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPU zone has had only a critical trip at 115 degrees, which is a
shutdown and not a cooling policy. Now that the NPU can be throttled by
capping its clock, give the zone a passive trip and a cooling map, in the
same shape and at the same temperatures as the GPU zone right above it:
85 degrees with 2 degrees of hysteresis, and a 100 ms passive polling
delay.

The #cooling-cells property goes on rknn_core_0, the core that carries the
shared clock and the OPP table. The other two cores have no clock of their
own and cannot be throttled independently of it.

The cooling map is inert until the driver registers a cooling device:
thermal_of_should_bind() only resolves a map entry once a matching cdev
appears, so this patch on its own changes nothing but the trip point.

The thermal path itself has not been exercised on the board this was
written on. Reaching 85 degrees on an NPU workload with the fan curve here
has not been possible, so what is verified is that the zone parses and
binds, not that throttling engages at temperature.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM checkpatch dtbs_check
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..c3d22b08f415b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1162,6 +1162,7 @@ rknn_core_0: npu@fdab0000 {
 		clock-names = "aclk", "hclk", "npu", "pclk";
 		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
 		assigned-clock-rates = <200000000>;
+		#cooling-cells = <2>;
 		resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
 		reset-names = "srst_a", "srst_h";
 		power-domains = <&power RK3588_PD_NPUTOP>;
@@ -3212,17 +3213,31 @@ map0 {
 		};
 
 		npu_thermal: npu-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsadc 6>;
 
 			trips {
+				npu_alert: npu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				npu_crit: npu-crit {
 					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&npu_alert>;
+					cooling-device =
+						<&rknn_core_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 
-- 
2.43.0


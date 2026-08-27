Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46D837F32C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853571; cv=none; b=MtF8omySwk3vBQGhRmL0yleTbNMN2ovZJSYI/G3ldbpXvEzLEfZqRI99sIsvKMWz93mZCxp2aRpPjknr2X2E1njC/CjRtUashcjXz6WCkRpZn4SBubff9gLYRN6ZB10lYucsJvrGawBT8iae8Oc1pJUE7tiz2wna4XfFsdJboXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853571; c=relaxed/simple;
	bh=RT9cVmIbfwOZKUIPB+Gz0YsQqIXuZo0OuYUTvQn1+1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nHJuR7uEYs3RHh5WFpRng/etTbHNCCLcnhJA+b99S8kj2+EfHQkgjxtGU6yBA5ATfQu02zpKGqKEmxaDIETX7/x/o0SaHf8O/O4mACCY1cW8plUjfV1nSI/t4Bl+9PfTefE0e4Lryao5XWoAuZC7Z7SQ/WI0CqII0v9j7x/GiBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgNUYOQ3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgNUYOQ3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e4998d28so76415f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853567; x=1788458367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FQA+MbWA84U8xUhabSSJVM6HHDc0tjYMMoyc9Az9yO0=;
        b=XgNUYOQ3+5mOSVbULYqMcOBedz1+pYgkQ+YH4Wm0lkVhVD2YD7XIzShbEbKsZE9Xal
         vvMJw/kdkkwhS0tg6TNHGTgfBFUkbo1AhgSM8Dlf2BxPtcUzbrl7BhjXBrLKwnOLbEBJ
         V4OuR147WZ36Cwbys0MQYf7ztimk292wqA0wxeqjA4tOozqMcSgngjDB9AIQSKBEKd36
         6W8+rHtGbvq5rB2qgRXoeXoCuwrjzUGnRSSLpDWD7Eut8oajevsf5rLwkjx5Eodev0rJ
         /BZYxd4ffQLJhQWsjBUL2JmzQG/F+Qt+bJutfceh3+MS0MZXFVZxg7RcPtRSzgU+w7WT
         08pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853567; x=1788458367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQA+MbWA84U8xUhabSSJVM6HHDc0tjYMMoyc9Az9yO0=;
        b=E1d4zPYqc57coxkssZsmdZSm91jL8L22AtvpAYlXOHJu/+zerqk9RxQqKRg1p2d3wt
         nzOmH+EkM/XWODNQNgipVD0xorqu1aAdvGiyRxBERbsmxMPTqCTIHVJw4dl86avgfSSI
         4a5Sxiq4/rOeiqIEXDVErReU8TugZ7K8PnyZYXJl1vjn/vVe7XS5IRvQMFytJefApn8W
         eZzmd56g3W7oAbGzAxzZLeNFfKLZ9tYFpVEMA6LGnoqJi2VpqKgvcv1uaSNN2VNEiOLd
         Y/xgqfWlE1QHyHAmEn1HSG7D7dG75gENPkYw8PclkWPKWRck1NZDILnXEE+QJX0Lgt9p
         ECUA==
X-Forwarded-Encrypted: i=1; AHgh+RqggD7IjQUWxX6a1qZQh/bYiyXJV8pPNJ/tFeq+5MSvna+MH860KDoYqsGxzlWSddje8arZ6kSboDTI/Jc=@vger.kernel.org
X-Gm-Message-State: AFuF++mH5XKjIJTRFkrLk4QDseiqKA6jpOwFMWf2veyT8RhkYp1fS8Wn
	npMNRRCHR8B0pqzRdIIYqvAJNGj4fTRQ8ROIi1PJGY4log381BbO5PRB
X-Gm-Gg: AR+sD12nnOiu4GRMCBGdi/0SmcnRrLvEpkxooJuQ+QlUWQX9ljPhIw7occUWt3b+0Wg
	ANeFgnm8Rkikr0uktWsMoaIDMQ41tdQCyNs11PLwGmGm2DBAi6Aq7nNEWTzPTnAsUJh9sRexdsN
	XsPKS2WKLitku9UV5YeIV2Ty/Xf0ndYo+A7Vn51t5pp0MqIeF3y1I+Mq9CklgRZJ4Ewow5Ix0gH
	u39DU+mh1hYA/LvbmY96aCj5V6Or6lPlqP/Ev6d+Ylzdl03GTfrC5DDblcDKU1YvnccH91wN9og
	BSXC31FrZwVl99X0CnmeRr6scgcD62G1etFcHREhfez83UIASZblFS1y0y5VNJtWC+xz2Y+rbdC
	a0/pSev+hLtqpIC1D8ZGnOHp4a6GwYKoRuw1MwvtWSzERvsC2SOc05es3sMtPlnDby1r0FxYk26
	1YnplJaB4coAl07XBUvyKAAHxEMRih/w09wD3F2ZictVd2RzFEYeUl+qz7cSUxHv5nSdCCAc2qc
	pxEc8I69+vsqVnDhXlGF6kh9+XGOOoGVpU+uPnJxUEWXa98+D1hMS+eW6vX8kr0
X-Received: by 2002:a05:6000:4810:b0:482:e451:681f with SMTP id ffacd0b85a97d-482f79c9430mr708273f8f.10.1787853566950;
        Thu, 27 Aug 2026 10:59:26 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9945sm10272342f8f.9.2026.08.27.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:26 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	rongqianfeng@vivo.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	gvalkov@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/3] dt-bindings: net: wireless: add flag marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 20:58:48 +0300
Message-ID: <20260827175850.89395-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add a device-tree flag, which allows affected devices, where the radio
conflicts with the platform to ignore the incorrect regulatory hint in
the ROM of the radio, so the platform regulatory domain can be used.
This does not allow the user to change the regulatory configuration of
any radio. It only allows phy0 to start and operate according to its
certified configuration.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v9:
1. no change
2. drop Cc: stable
3. drop Cc: stable

v8:
1. no change
2. drop invalid tag Tested-on, replace it with description of the fix
3. no change

v7:
1. drop Cc: stable, the first patch only documents a binding
2. restore colon after Tested-on as requested by openwrt-ai
3. mention the added wifi@1 node

v6:
Rename flag:
marvell,ignore-regulatory-hint -> marvell,invalid-reg-hint-in-rom

Clarify commit description:
The patch series allows affected devices, where the radio conflicts with
the platform to ignore the incorrect regulatory hint in the ROM of the
radio, so the platform regulatory domain can be used.

This does not allow the user to change the regulatory configuration of
any radio. It only allows phy0 to start and operate according to its
certified configuration.

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

Rearrange patches so that the flag is implemented in the driver, before
being added to the board for WRT3200ACM.

Link:
https://lore.kernel.org/linux-wireless/20260728103536.25012-1-gvalkov@gmail.com/T/#u

v5:
1. description: remove tag Tested-on
2. add #address-cells = <1>, #size-cells = <0> to fix a warning:
arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts:183.3-13:
Warning (reg_format): /soc/internal-regs/sdhci@d8000/wifi@1:reg:
property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)

3. description: add info about testing

v4:
1. Add binding documentation for flag marvell,ignore-regulatory-hint
2. Add dt for sd8897 and move the flag there, I used sample from docs
3. Use device_property_read_bool in the driver

v3:
I implemented and tested a better approach with no board specific code:
1. check for a device-tree flag in mwifiex_register_cfg80211in()
  !of_property_read_bool(of_root, "marvell,ignore-regulatory-hint")
2. add this flag to the root device tree of each affected board
Currently this affects only armada-385-linksys-rango.dts,
because Linux has no dts for venom. OpenWrt will take care of that.
This approach is more flexible and scalable, because the flag can
also be used in other drivers, e.g. mwlwifi (not part of Linux).

v2:
Replace the compatible device names, which are currently only available on
OpenWrt with board names which are available on both Linux and OpenWrt.

 .../devicetree/bindings/net/wireless/marvell,sd8787.yaml    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
index 930b700b73d0..9f905ef5c2c0 100644
--- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
@@ -59,6 +59,12 @@ properties:
     description: Calibration data for sub-band 3 in the 5GHz band.
     maxItems: 502
 
+  marvell,invalid-reg-hint-in-rom:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The regulatory hint in ROM conflicts with platform configuration.
+      It should be ignored, so the platform regulatory domain can be used.
+
   marvell,wakeup-pin:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.55.0


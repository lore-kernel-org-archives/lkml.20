Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912238;
	b=iBv0rguFTx8rkXuP3iEtr08LSgC2UhAzM6ZCarxMS2/GsBNLzDsISfDj8BquTT5h7uJo
	 8V2kYjDX12NIl6/JJi7r0dAQ1CpUE9erScQluEUxXqcYc06qWdbfQ67nh3ptpwITWzGB8
	 6Ej+I8ORJB1Q5PRkBv4AVv6qAlCkxJGFrkeTcEyUBb+kVNGRoXkXVSRQbIl8/tOlJUubv
	 16yLz1fHhClH7wcH8ckBU7LnnB/Nt052zekpW7JbKL7oao/aHgWQ/HT4jrt5PNPNfBABT
	 X6mIuj5Gpct0S1OIY74erABW67K6Pq03pQt9+a61leSc/D5Mlr6aYc7Z/f3nVkBSDYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8L7gbXkN1dILpBc2x0pUa9G4ccOQmCQZ8EESDwGPDFw=;
	b=2VSFqsvQ0lZbEm42EBQlTpdAsGNonlvZXwFonoPKmn9dX7xnl/5g7bOAqhgz7xq5MW9h
	 gSze8kxZnwmX68PhUhh4pu7wTVicYRXfjGwo82PfPQF3vkdOkAXVH9VQmfIYIBS843nuK
	 vPLSl1PyBxzTF6CASHdi0/l4P5DV8DQIdx4lZUsbNJa9HvEMbx8+mkXBSN5cxGpG1lAlv
	 gUIAP6i9rHE1Hn3JQIaukZSBJag459QT1f21qwDnIz9yu/ojQismZH8xQiOZ99D5oVJff
	 YnCcR/FB4N6Y18wsg79TjVlGAsDdSXLvHzznTfL2RYaof61vBru0xUiH5A7fX0WTuPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg8hLpSZ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36EC606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E36EC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg8hLpSZ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so44313925e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912236; x=1795517036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8L7gbXkN1dILpBc2x0pUa9G4ccOQmCQZ8EESDwGPDFw=;
        b=Sg8hLpSZ0HmK+D2CsupmDYPK/3Sp28mNDyfjO9apUx79yFn7ynP1zi6k7lQiXHeDpp
         6hY1ujjm67K5SSq3HkJJtAx5iw0Uf5h4RvXCdnI8RavSlZEDV5fJab7j33xoB03KR7tD
         cqsU/H/p89TZTQQBv6TaUbk/THTj8r8rdtJZn0m8Ghb/ElZjAnKdly7vp0OEwzB/IrPE
         63tB3HOMqYVJTIEh9gxslmCD4+qIniLdwfekpK7vVHPnytTuZiWcK6IvIkZyh07V8Kf9
         3VcdMj8CAFWq4f824NHf5tmcnTrFbN29QphfwlZolfi/c9Vy7KGqFnRKRDRPpvzKPZG3
         NsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912236; x=1795517036;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L7gbXkN1dILpBc2x0pUa9G4ccOQmCQZ8EESDwGPDFw=;
        b=vXAoB7SWlRAlzfUMzsj6WzDWhOxEaGKcRT7NPAQ44WNdlUTWX4zlHxTj+fX57/dkKZ
         Aflz4s9PfuVMb209dJiCW+j4l5ekmCtvHjHedTXmnEZxuxbZ0iYxIscdjLHlpwhu8Gh/
         mglndZfmmIyY0L4XP2zIYif/hgk5xQoLc1noRsiM6vyLZ66frIjZVHbuHrHgFj37gitx
         PfxxUa08DFN/PHhNjWotsRl1rbaG42HvtKQXhYLPhLpcFdAetM0z/QlaB07csvO6sr2w
         SGnQ/weHYObQxg2Xd21LBY1Ex+0UEnsxfXta9+oTnLUCsmxrD+yeKk2hnp0I8kJs/erD
         0qaA==
X-Forwarded-Encrypted: i=1; AL+hErEWQYKPh6EDNpdasYhSendnhwUz8BhWrgTXMXOT8F86q7c25V/SLdtxMxgxjry4RJzECXPaNZy+ESapgDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IYjxh/TDov1ge8EXYDyipHmYXWQvS1Yc4UF2mXp/zILu3MYOM
	zdOEcoCE/iJb/UbT3EmZpLRLo432QIPbI++BdqiMbA7lw30D8u32K/uR
X-Gm-Gg: AYBFou2xVC3zlLngKebTbLv9NJViwVb4tDnXJtEiP8QRW1Ilv8UBH7LVGavJM0wa8on
	a95xOJCZvOq1lybxLMj8Dq3t9VCEWQ4C3APKbuHmTtBGi3eVjCj7UpLCaXilA8p13tLUaSepuVo
	cB00zvKtTX3NzgbIpPaI87FC6SvgeqJw8x7FTJO6NVD62aAe2Gvp6bJfIZEBVQw/2sBPDz9M8p1
	25vxrITt2EDLvaEIsIgLx426u6nkJVr475MdTghkfuDa+AHaoWJ3MbqY7xB5Alx2g8xDiyDuCLF
	S73qWjOQKah08WQmPvi0+fxS/nV1XsgREQmg2S7Tpv5mwE7O5nznZG9ww1TcjlFK5V20NRhBHjR
	f2XljfdYmqY6fvBPGgEUOjuK5oQoqIq13/5sBVZgcqohK5gwvxFYYkRUd6gku4+TXBMV8tCxsCo
	Jq9+SP86Y/oKQVUEGUdH6rn91aiaP27ono3CDAL50dmIgsf5L6F7jYGsYA0BJuks5ViymiOj2Sd
	GQqURb4Be83evMysj2fK8EAY9M07D2lppFoU04KPHxIcaNKPZTSvqRY5md0Ic8cpwp0MR5d+adJ
	rwL+rrZbebA=
X-Received: by 2002:a05:600c:630f:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4bb55aa5795mr277386855e9.33.1794912236093;
        Tue, 17 Nov 2026 02:43:56 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm104578445e9.3.2026.11.17.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:43:55 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: novatek,nt36525: fix v1 review issues
Date: Tue, 17 Nov 2026 13:43:52 +0300
Message-ID: <20261117104353.1180634-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116070212.314228-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Addresses the issues Sashiko AI flagged on v1
(https://sashiko.dev/#/patchset/20261116070212.314228-1-tadilhusrev@gmail.com?part=1):

- reset-gpios is the physical RESX pin, which is active-low (asserted
  low, released high); describe it as such (GPIO_ACTIVE_LOW in the
  example) instead of GPIO_ACTIVE_HIGH. The matching driver fix is in
  "drm/panel: add Novatek NT36525 panel driver".
- Add vpos-supply and vneg-supply: the driver requests three separate
  regulators ("vdd", "vpos", "vneg"), but the binding only declared
  "vdd-supply".
- Add backlight: true so dtbs_check accepts the backlight property the
  driver already parses via drm_panel_of_backlight(), instead of
  switching additionalProperties to unevaluatedProperties (which would
  also pull in every other panel-common.yaml property, not just this
  one).

Also fold the compatible string into a single, driver-matching value
(novatek,nt36525-xcover5) instead of samsung,xcover5-nt36525, which
never matched the driver's of_match_table at all.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../display/panel/novatek,nt36525.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
new file mode 100644
index 000000000..9158125c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36525.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36525 MIPI-DSI panel
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  A MIPI-DSI video-mode panel driven by a Novatek NT36525 controller,
+  720x1480. The first compatible string names the specific panel as fitted
+  in a device; the second is the NT36525 controller it is based on. The
+  panel reset (RESX) is active low.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - novatek,nt36525-xcover5
+      - const: novatek,nt36525
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: panel logic power supply (vdd_ldo28, 1.8V)
+
+  vpos-supply:
+    description: LCD positive bias supply
+
+  vneg-supply:
+    description: LCD negative bias supply
+
+  backlight: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vpos-supply
+  - vneg-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "novatek,nt36525-xcover5", "novatek,nt36525";
+            reg = <0>;
+            reset-gpios = <&gpa0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_vdd>;
+            vpos-supply = <&panel_vpos>;
+            vneg-supply = <&panel_vneg>;
+            backlight = <&panel_backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0


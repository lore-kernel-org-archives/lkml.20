Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072649C4BB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354495; cv=none; b=DmEgp9+K6ZuIm4OAXSvzOSp0M06vDMM2GXicAi8YdbCSCAUE7LY9eB1K+5iR+g+RHXP195Q2z3VZT9GNVY0Chma7xjx8Z6pUwbyi75qAgnFXuBWjozmT6P835/cILjTc9BrJlC6COf3AZWQh2xQMlGBMqe5vzuimNZWdlhm99GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354495; c=relaxed/simple;
	bh=/RzWURUSlbLsxwiuIazTsYvvak9uXPkuT7+9wqJHcUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6sfuAjUxTpBDo1K1xZsWMRoymN/3dtXbuTTOL7v0Fn4P5MVpI5KkgxuTzLCWBZrUnmMLunu4AHJugLt4VGQs4SMYOY0tMrNYTrtt4VZp696X2sxEApKA2Bk9nqeykaf/aK7Gojcgxjr+3nH7MjahmrBG+aHS3MCSHTG4KbC+8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=qz0Y2yRW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="qz0Y2yRW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1080983f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354492; x=1788959292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VstGMH+clvE6OSCjH9oL0GGKXD+unvqTKSVxvTB8uDc=;
        b=qz0Y2yRWWS0fmakieDFb7ZVjrB1ScGQXul44n8A2VqoQ/Xjup+3nO7pw5wkce070Dl
         sf0B0husbDFGsCpDWq3iuxVf60wnQX0wIaRf3zcmZ67QG+OCcc49SP6ylGZ5zLOlX0tb
         yFjUcHr8WMDN63EwOhQuCJ3qsFkfvs5Keymrb+FrK7FFgEVE1Sc9NlxKCBdgXb7M/iT/
         GVwHMCcLPwJ+DB0DZyqNj3IqJj4t26aKdpnpN8M3IE6Iyaoq4ptzV+P617N8Am1rd3Bu
         UOtjzQUrdHZHXYUQAQwHxzsmS+rvt9/tRMRrof8ydPzsyHecCBvnrwLXAG7W+FrxydUg
         5D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354492; x=1788959292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VstGMH+clvE6OSCjH9oL0GGKXD+unvqTKSVxvTB8uDc=;
        b=nAWjf5LuInG2O+QVvuXwr/CWMvJGEbMkrF2J7bez6lG6SYyCCadDAL4i6JAadBH6XI
         zKEfc+g0ADHIJbWrlnbmiX+47fVzXsgObh2KwAKErjnuWL4flUHeMe3qzCtbZ+QrBPxJ
         j/aYIi+o/WMSzrPWjS29V2IjmCZLTl097aQ+8lZMdwcGA9DnlstLeZ/pq4YLLvPhiPOO
         oO6AIXvjAWDY3S8OhsTiuE7Rblfr60hK3bo5YHJAb7h1aUbojtSmC+VVFg0I7gBdubsS
         y/74ray72lfJslMFBC5oIK3g2wo6cCV/BrQtYbpQkSAACImfvrK+Nu3uI68S8CBuwdDh
         Khgw==
X-Forwarded-Encrypted: i=1; AKwUvBxuUpTUMe2bCjPxwe5ZuR20KTWBTRoSAbsmgc2kj5q6gBSk38AbXORi8jL4cRcr4qtldtJVXGwwMtBFw8M=@vger.kernel.org
X-Gm-Message-State: AFuF++na2dCCYXDEfFU0BDudzjAjDS3HWfSIE8FZXwdMkkujFZ9rZULV
	Qz1qouojWv0EL9Pdz56VpU+67ju43auRn0Xo9ROCkHN2YVFmW9jVS10T2YqzogFb1S8=
X-Gm-Gg: AYBFou3JSGHgzBxZyG0P3ygLLXPsk5+BXGYNbUKt+2t4C7YIlRK4/knXXz8Zvxol8Cm
	jjkdggwByn8paqjvFTqB2Nn4wN6xJa96/9Zxy348AwVmKdWLWmyAH5mRzDm2okKm9otmWsJzmOm
	JI021hiw8wUtJPzVl6ryEe6lYFHXbYqvqk7mZDgfKdf8izbAaK1t/ggRa9YudrsgMCMd7xbMt9D
	6aWfk+TCk9jDolIgMqim1y2V+4csxfWuO+kpFgTB87NgO/NaTGGNmbxtSvbX5zMepRXFrh7TJZ7
	3CWKVfrHWSlztMK6q48AXfOvU63dQr10CIL2F/7Aoo1H8pVt0/RKMyfn3D85SPeIAQQF5Zk4YR2
	j4Y8bXYdFK0KsYjSrUhfhjwtMZdeLG7Nb2Eo/S8HYOG+QcLG8uYVAJYFA53BNTBGJ0FG1VZ3l1n
	iO1AoqpHuYeyiV0IR65ap80/gLCq4lLDoapBnMasD/QQ1D5hg6zgn0GApex3A8Rgb+o2q0ed3Hr
	hwnQ61A91BBnvAO1ikRUrxoi28w12L7X1rn6D2wZw==
X-Received: by 2002:a05:6000:290f:b0:484:3310:9ab0 with SMTP id ffacd0b85a97d-484914d8435mr8297857f8f.25.1788354492009;
        Wed, 02 Sep 2026 06:08:12 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:10 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 02 Sep 2026 17:07:53 +0400
Subject: [PATCH v2 2/4] dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID
 layout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-2-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4722; i=alchark@flipper.net;
 h=from:subject:message-id; bh=/RzWURUSlbLsxwiuIazTsYvvak9uXPkuT7+9wqJHcUM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN98wCL61IsMQ7/0dv97TsGZmfZJz1W42WaKZtU0M
 Rt5c6Z1TGRhEONisBRTZJn7bYntVCO+Wbs8PL7CzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNXpLYwMy83XL+BRTM0vC1bx833+6pLjDmXt45cSjoV1f2O+cuhrKiPDj1/BvPa
 JFlwa/7vjN7y+NLmKzZgx8uDyNzLpKcrtjNPYAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs ship with a unique CPU ID programmed into their internal OTP
memory, and Rockchip bootloaders derive Ethernet MAC addresses from it so
that boards with no dedicated storage for one still get a stable address.

Describe that derivation as an NVMEM layout, so that the resulting
addresses become available through the standard nvmem "mac-address" cell
whether or not the firmware got a chance to patch them into the device
tree. Keep the compatible SoC specific, as the location of the CPU ID
within the OTP memory differs between SoCs.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../bindings/nvmem/layouts/nvmem-layout.yaml       |  1 +
 .../nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml   | 73 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 3 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
index 382507060651..ab94dbb41aac 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
@@ -21,6 +21,7 @@ oneOf:
   - $ref: fixed-layout.yaml
   - $ref: kontron,sl28-vpd.yaml
   - $ref: onie,tlv-layout.yaml
+  - $ref: rockchip,rk3576-otp-cpuid.yaml
   - $ref: u-boot,env.yaml
 
 properties:
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml b/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
new file mode 100644
index 000000000000..85153d480950
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM layout of the CPU ID in Rockchip OTP memory
+
+maintainers:
+  - Alexey Charkov <alchark@flipper.net>
+
+description: |
+  Rockchip SoCs are shipped with a unique CPU ID programmed into their
+  internal OTP memory. Rockchip bootloaders derive Ethernet MAC addresses
+  from it, so that boards which have no dedicated storage for a MAC address
+  still get a stable one. The addresses are computed by hashing the lowercase
+  hexadecimal representation of the CPU ID with SHA-256 and taking the first
+  six octets of the digest, with the multicast bit cleared and the locally
+  administered bit set.
+
+  The location of the CPU ID within the OTP memory differs between SoCs,
+  hence the SoC specific compatible.
+
+select: false
+
+properties:
+  compatible:
+    const: rockchip,rk3576-otp-cpuid
+
+  mac-address:
+    type: object
+    description:
+      MAC address derived from the CPU ID. The first argument of the phandle
+      selects one of the two addresses that can be derived (can be 0 or 1).
+
+    properties:
+      "#nvmem-cell-cells":
+        const: 1
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
+    #include <dt-bindings/reset/rockchip,rk3576-cru.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        otp@2a580000 {
+            compatible = "rockchip,rk3576-otp";
+            reg = <0x0 0x2a580000 0x0 0x400>;
+            clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+                     <&cru CLK_OTP_PHY_G>;
+            clock-names = "otp", "apb_pclk", "phy";
+            resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
+            reset-names = "otp", "apb";
+
+            nvmem-layout {
+                compatible = "rockchip,rk3576-otp-cpuid";
+
+                otp_mac_address: mac-address {
+                    #nvmem-cell-cells = <1>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eb4e5a61056e..f3d07ce7b3c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23722,6 +23722,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP OTP CPUID NVMEM LAYOUT DRIVER
+M:	Alexey Charkov <alchark@flipper.net>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.54.0


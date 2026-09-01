Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6D8436BEA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276811; cv=none; b=RqAqzIoO+JWmBqn8aPh6QujM4PPKgcSKAUpyN0UknN8TvbA5L08IwitNddLBeGu4btSbkWzu2/uylU2QkBhfsS/D3Rk5ch1qzTqnhN+bQIY9/dkou9klbsIuWqMm3eQ65KjdKYMKJLv+AAU6GFOvrw/kHRUys50m9LvsbIRbuZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276811; c=relaxed/simple;
	bh=gbqk612bcsgInYoFXSfKuUjKXJIWg/fCJSQ1WjRdZrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2OLnBtzCpo8Va2HegHjsQdUpubtu8+uBtC5Bw7lyB+tMW70hoYkM7k4JlhFV0udNsY1tTDh/lM/2g4mAx+Wq3PdUTGsq7Jf7oZiJvAxC7ldAFp8wQZwvrRnVP0awi+uIEZYpHbpyz3ahnn65vPblu5Ci7QZL/5AmCkA6Jf5tjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=7JLCP6K+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="7JLCP6K+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso69923885e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276808; x=1788881608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y99lfkM4lfRyGnQf4vtEAa4xKTLI+p2p582CZw7DOpg=;
        b=7JLCP6K+poeQj6VjerCNtkurAZ7gRlc6z2Gpk5F1YTmrmm8UyjlshY8284npZ1nvm/
         tm00sfgUMnQ4j69vd00RBoSpqxmLv9DMrSFIjCBxig5MLp0JX9zQLS7XX7By9/2BZp52
         DEszL552pOgraOvZIfimflYdcMJ9UZeB0MfddRAqSheq/1LIRpqJopnryWv36D/vhZjd
         O/EN6Jm+ccrYkqledArNbF/9TUW4MzK6KFRV21Ccmf13RbGktOlPUqpdv3wpDjGjl9NP
         NVQe8Jp4Dedj0gECrm+VSCwgh6iKcMCvTWuTxJ6pJSnRrQ5tLAeaKGEmawxijWyun8BM
         9C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276808; x=1788881608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y99lfkM4lfRyGnQf4vtEAa4xKTLI+p2p582CZw7DOpg=;
        b=OYb0oe13Hy65a2S5NCAfNRZpuWQjhgbKGqGqGjgz1mXWiFtw7vyWxFLlIuMLC6H5+J
         P2ThgJII0ohMptNEelkLJFW3ZkMvxwxLFNaV1yEmmKZIC9ll0sRIOZQnLBgfj48puAor
         zjvNX+zlNrdVuJolJTJHZofBlhBMg8zwRaAYnMPwEaX6iyBeW2C6EXX6Mp82BtOeEL/t
         dc2tp2LGV1jCP7SJz8bDgZ5+/QrEFCGT8xxF/C7YJDjn0NMAenZ9mG8Bv/deO6fcBesp
         Veu4zm3jE8FVLZRUhwLpaZfgHHxSOEgUm6dWEoC8yuxnInf6b3ypJq9DhE+Vbp4BkXtC
         WWOw==
X-Forwarded-Encrypted: i=1; AHgh+RqO0wgRlfRb/CFf/XgQb95SGPpyd/KVdiKV68rT1MxqtPkCtwmFmwYDhkOHSftFeOwv5TcSPRTIaoT5k5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++k+gfFDuyTeb9xwhu6P4B8XKXQb6bXgXcnh18UWMrIGRvsLynDK
	T4LH5GyPIAXb5o/R0/rgR9QYOPBpi0CI/Kb/MaUDsOry5LqD0XGJ8ce0i7xXhTqez9k=
X-Gm-Gg: AR+sD13zqgUuEQk+u5GvfaEoX/G9KeCbv0o3LX5/6BkUYV28DMkzvRymHgbm+jUfHB4
	6kjoeJs515RpK3+V4g93w74cYlc/tnzJpNz0qovOu5e51BCOp31+6Vav8rLnv+gthZZvIhlXrem
	bpUaJv+M/pqaeHXCssDWUI/RqAsOX093ZTg93xxYuJS6YFRK8Qpv3Cx1cgm9snqBcOlD1jVloDE
	UNsgwSsxsTj5XdYARpW37xuNT+EAGGzAROxb198yJXyAue58T5mJ29GTjAUcOAa5T4v7um88CzO
	7pfVISPCcbsKLa6Cmqv3LNafhzNNuHp1XNH8Y7PjLqwvE22aCSijSDGkgzwDZtfzhtUjGtGy9Qa
	5vlbq5CwdymGThZ2DuuBh5999Guh7GtRi9hXJQKIpDxUHbJcWIZhOAyIbyRz5T1ongxQYIk/q5E
	DaWVsTv9CzGy80a7mmuUK/N7/2+cVlJbrAMm2wvwhNY5TE5OZ3EKrj+epDoAg9H94VEi/PHqlAv
	q2GhVV0MT8CNG6dxzU55/JZnbHdyB9xqBGo5ozn
X-Received: by 2002:a05:600c:4514:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-49b91c1f2a2mr561066925e9.6.1788276808041;
        Tue, 01 Sep 2026 08:33:28 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:27 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 01 Sep 2026 19:33:12 +0400
Subject: [PATCH 2/4] dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID
 layout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-2-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
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
 h=from:subject:message-id; bh=gbqk612bcsgInYoFXSfKuUjKXJIWg/fCJSQ1WjRdZrs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2D3v1K22fvkdJVbDxKZnF9mnVq/kkvolMicZTaX7
 QIyz85f2TGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBU33nJ8D989rzHab8Fn9z54BMt9Uc94njWGqs9CbaFRes+XlHyaUtk+F+2+1e
 mt2/TpsJLnq5vdR7P/BB8z3CehuKO3MK4D/+aKhkA
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
index b91655b34f0e..b35b3677bf0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23713,6 +23713,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
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


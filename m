Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A451120B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466208; cv=none; b=UrSc8hqaw7jCXbwuHexKnI8VNvckoPC7RB1lky+kHxLUke3WXrggNMvJzPKS3oLwUA3O2wxcLSMnkrvFfHJCqqlYprjZfEFQENkanE9h+3qzZC8FwskqfbLVSEm+uRJd6++I2sgHm6KFS5Kao/7IcvFksAK4XxlSPjXUdV/NrWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466208; c=relaxed/simple;
	bh=aY/rMmEKLqBf233eHDiUJ3zou1QJ7V8sN56XAz6YXB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WF38glwXTB0mNwo2zjrVlE4CRcsCuU+xZ1MOoIqU/Fd0OFMXeB6e0puh13BP483SlBBjiyjylhn/dihp1T0rKK/2GB2wGJtjFMaBVw93dJx+kO8xSCX9JSKfAq0mJ6fA5GiS3zCfy3YnXe3jn8i4lwG7qGYNQPE61CPLBpkfdjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3KHNSxa; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3KHNSxa"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b21f09ea42so230894b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466194; x=1789070994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rV5vJv57NRYvAfyYD49PPV4JWlfjLZkBj9GOzwHcEV8=;
        b=r3KHNSxavUcqBTpFFFCW1zUTZvQ+1WlkUa0aZSx0GuqyWMPHyIP+HbANPbh/mL3yD6
         5j/rkG3aHrPjHiWkpI/9Yp+9mvdfhL4cRFq4b25TWDUjuhYSVgnR7T8LVGPCZ9BWc/wb
         Hu7Lu9NWJLSE6dsN4vjmazQ3T+sUv7CqOkCpHLihzG9qYXXZS5ER+f2EpgWdME5YTSu1
         XzW9d0u91qFZk+mgQUQi5D6KyxrVJE+2f9C6475ohVPvslhMiPaYcz8hOroW0Aw4dxRL
         rVdnjcIYEsPkImD2PMPnJ9q6sJrGN/QjdNxrXJAB3PINpnaYIBHxsKCqTY9zRkvGEw4S
         86aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466194; x=1789070994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rV5vJv57NRYvAfyYD49PPV4JWlfjLZkBj9GOzwHcEV8=;
        b=OjfQOe0TTk4fnWzI/7b6vqySZmsNixe7rk7Mrwif8vzkltyCFwMbFK0gV56BDX29g0
         GmcMus14+uztuWYSpK+MYOF11j3cjxuDSeHKsw09ZnWxvQZ74jslVSr5CgcGersWJXE2
         1E4SR0cZhNPGMyMEPBsgTAyBPcqOg8Y1pMi6Wa6LT6GNSmpgsEhqWPuDHl6NJO72/d4q
         s7Q23L09V7haL+lJ6oSKyijd1rt5I5HDGGD2CKhYXhX85p8RrDIOlJgw6rQZrhkLF7yB
         NEklbnjG1PFNY6QxnvQ2prpJ7llBPnQjrcv1PCDxx73oiX8OEPoZWyXnw9JuNtED/Tso
         160A==
X-Forwarded-Encrypted: i=1; AKwUvBx48WLGnP7KYTQdbRpr/jSqeAGEuGHReWVJaOlbmFy7ibq4FOkVwuaKPNd6joTjRq1W4kl9VC8Ia7bF64o=@vger.kernel.org
X-Gm-Message-State: AFuF++mn8XOwx25tDK5mxkf+FXva//rDQOG6PMxspG7LmxXHq/lp+mk9
	tr4fQCpoxLquWluql0bm5joZQccnmacuO/slaWbjZbyTKqilS6fe8jQD
X-Gm-Gg: AYBFou107ty92bo5smichmWuWLe2VC72YJg/frH9Q8gbL9bfPz3eIo474IilSHg1oAa
	NQjLqH2GtQlWjkVrMmr+gB9VGXFHXTkEZFOc3+Xj6b6MJaKnp8wKG2QKitslhgC03s9FoYrxJlt
	wytFX/343uxZzsDmTJ2YzLo2a/gS1lkY2bwyzSeIYKksJRIZLjHfz6XVJMi2gs+1/bmMeq/1PBF
	iOx4kGY8+3BoNJWIj0puTkkR2bvpjuzRJkVfW63Ow1P7Et+qs3Q28jmBa862dIB8kaGotDGyEk1
	VJ254R74t14X2ZcalW0VncZv9wA389/my+4xl7ph0b0cj789l5BF9SGhdJqtwV2ygn79CMK5Sf3
	L8Cixvngn8r0cOnA6lzuloaFaOPyn4BXb9xVUUm6YmYQqIOV160uAenAiv+5a30VZABthe+y0+Y
	Sr+o4r6drtxKCxwrQMdz4bbsT8rkhs39SzWOhAH2lu0bzNrM7zLgnO9+nAqWCeSGiqv0+ZHq9VA
	foMlZ48JxYjik/A43oEWUkCXFCWQqtRPe/lfHae/urt/I07IoeygYw5/Std0SzJgMkvt6Cdiafl
	InrA9s/JCyi64sKWU8zVo5ZCm8cg+zu9WDzy/lTgsfNOi7A19TTt9zLbWGsiCOcAnPnyAJKO+yE
	cRIlCntEI03OHf52t5t9MJf/y06tcuQ==
X-Received: by 2002:a05:6808:c165:b0:4ab:2c58:4514 with SMTP id 5614622812f47-4b95c5ba1f8mr1065523b6e.0.1788466193773;
        Thu, 03 Sep 2026 13:09:53 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm252885b6e.7.2026.09.03.13.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:09:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Sep 2026 14:09:40 -0600
Subject: [PATCH v9 1/4] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-submit-ac200-mfd-v9-1-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
In-Reply-To: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock. The Ethernet PHY
is represented by a PHY package on its MDIO bus, with a phandle back to
this device for access to the package control registers, so it does not
require an MFD child node. Function-specific supplies belong to their
consumer bindings rather than the shared parent.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 50 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..ca7a910b2c73
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..419340093c9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29504,6 +29504,13 @@ F:	drivers/net/wwan/
 F:	include/linux/wwan.h
 F:	include/uapi/linux/wwan.h
 
+X-POWERS AC200 DRIVERS
+M:	Jernej Skrabec <jernej.skrabec@gmail.com>
+M:	James Hilliard <james.hilliard1@gmail.com>
+L:	linux-sunxi@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+
 X-POWERS AXP288 PMIC DRIVERS
 M:	Hans de Goede <hansg@kernel.org>
 S:	Maintained

-- 
2.53.0


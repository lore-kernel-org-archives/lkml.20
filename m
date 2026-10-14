Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C26E485923
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962590; cv=none; b=J6XsurwsZbuNfGZgYtMBXbFwBdkSblYqAy7WK24rfRHHY5Nf1xvDdhYaIyR7gqFiDHUCKVMJ0Yu0pY7B85/2+gMurNqlJacck2j01J09s18mm5BK6v2qSFxqmiIbZ5To0+0F9foQT7Ix6LqLN9yTDGhCmD7BQ7G+qIftSXyBG30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962590; c=relaxed/simple;
	bh=fSNDOr0MMjJ6MUKZPg9+bicighZuXgJ9O1lxVLqM3xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCppxbzTUwJayvQzXMYG5XSNjLdSNVlJxej++hgTBvQd/XoDoR56twR6plt1/E4B+iASe092QKftl4pinXe+l8XezVs70HCI3xriablkxbca5Co3Kop0R8XWfEkCHr1ajLebIbUvDsduzQ/o3wm/X4rdkyAz6wYd2Bpe8oZaMho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8VDxiTS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8VDxiTS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c411d6615so2673526f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962582; x=1792567382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJ88z5GPX8b+VXAqaP3/v3qo/EtaXQO2geHV+4a1+Gc=;
        b=R8VDxiTSHSboHzB0OIrpg98X8QmYJhiyRdepCcMJnxfGBnW9i6B6Awr0/ll7OTC899
         Unqx5HxMVn+Bmnd0MFffLi6AlMGiJ6nqrVJ3uRMLKJFJXo/uA55TAp49hBKEcj0mHJLg
         yjTeP6JYubFGwm/bvzU3sS+umsydAb5yaTWjDc0hRbDCGasZPKeR958V8+q4MNbvICIT
         o6LeVT2M0BF8GITLZ+hD7zuaXeEyeUWymnT4z6K4XtG2e5jiOjJagh2jExHYjxopLzaI
         5/wRNVnrII2GZQSYPs4ZHPGD912GbAZUHkVAiRgjp6YDcLiGManEUIPlRjIdrNh+uo+G
         wIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962582; x=1792567382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJ88z5GPX8b+VXAqaP3/v3qo/EtaXQO2geHV+4a1+Gc=;
        b=X4LknIG8NYQc49odpV+Bt+z8ROeKldiH6df8zsJD6EeKwjOX4eJYjOQe5JG71ZNrlC
         bD/WJtropD2+p+PzhR4VO6QYw8szlEU28B5Hh+Talc3ZJFzaoJIQCcwMhs2ynml0W4xW
         Ftuu5XeQZq5fSbOOTPAaceOpjyZMXOP+sXOQFbPVnn3bmrosx9Z3jgxc5WhhVXThr+MO
         nvP/cluWMytZGEVm3re5prx0F78MQz4r9/Z8RQP4wAlQ2cvEELAFCqgX3yb9D5WoudEL
         mi9F3xp4iMiMxKwy9ysl8HX/Tr4Cm/UDZpJrBhOQ3E2G3gOGGq6LKDlQkXQItA8vvEBZ
         j9Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwQzdwSsuo7Akyn5Bi4dE9jg1AZBovUkFfBHKUgZOdEaQNSJQUs8C1YF91LRFlUnzv9Utc2koqPOncP570=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1te0B7Zbj80XzNvMLWIPZKern5WC5JvB/IqofOPJ0UnUX8UpP
	7qJq38421orXAKZ6GJwjNevPVYfi8nBCQhB/WFw9ULtDTpcWJypriuwi
X-Gm-Gg: AYBFou1cRrpkSwbs2nSRK/8pIZr1dXoBc5Fv2b43t9znS8GMLjYu/EeLQBOKihj4KHA
	KOJh4bYVb8xBZFehU2ZgKZGvJompll2zSFcHHDLjfNg195Q1OxujoOGxAxRzWNIKBqcAvTuSdsS
	hIAYdDEFmmjnLwhUrQt1zxoap9ZcVIt6ec7bSWv8T8yRFjHLDdE4999sGn2w7gJrY1DytlTqofI
	ILYrstXnIRYuM2Pd8yzW4wJVZ8uoI+RZSC9RUZbbMSl++UVsgv8aO1E6FxrnX3RAb0P6kCuxYLC
	MecMPk/tii71fWpaCiPfvKDuaqKJearFEV2lhx/UmC50+W0+ZeuGiTAFiJ2KFdIjoY6zYIeOx6V
	ELKvNWH0WiZGXDO+FShOz8Ea1auKLNO/dGPD6gpnTmtXliAVu61FdWE+PBa8EZKY9af9ViFX8i/
	Zj2GmzxMGHyOTuGQLC9EhZSYQTfFx53M3527kKCrcpStIdsM0Pp6aqkOcfO2NJ0XnuiBqWWN2Ph
	S3qdfXLqf7dqs2ZpaUKWP6D+beaxI+WAEH682IQ2rnYtQGfXI+Pr7WGJo0320OiNaQotoMSyJT8
	BA63+4moppTOhEqW1JUs04L6+jn1xXQ1FEugstRdyxzxorKxsnR+BVKuTdGWVQ==
X-Received: by 2002:a05:6000:2dc5:b0:48a:fb26:23a4 with SMTP id ffacd0b85a97d-48dd6517828mr15172799f8f.31.1791962582334;
        Wed, 14 Oct 2026 00:23:02 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:01 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/24] dt-bindings: phy: Add ZTE ZX279128S PCIe PHY binding
Date: Wed, 14 Oct 2026 08:20:50 +0100
Message-ID: <20261014072109.1759502-11-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Device Tree binding for the PCIe SerDes PHY found inside the
topcrm block of the ZTE ZX279128S SoC.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/phy/zte,zx279128s-pcie-phy.yaml  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
new file mode 100644
index 0000000000..7bfa363294
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/zte,zx279128s-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S PCIe PHY
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  PCIe PHY block inside the ZTE ZX279128S Top CRM.
+
+properties:
+  compatible:
+    const: zte,zx279128s-pcie-phy
+
+  reg:
+    description: Port index (0 or 1)
+    items:
+      - enum: [0, 1]
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@0 {
+        compatible = "zte,zx279128s-pcie-phy";
+        reg = <0>;
+        #phy-cells = <0>;
+    };
-- 
2.55.0


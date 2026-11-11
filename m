Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426029;
	b=hLiZcEzeY6xAbvhchW0TSA0bJ/b8M6aVGFUnkvFjHICwrg+tN3mk1gM+oNq95QD8Wn+S
	 Nem5h6YqQpxeRToO34kAcc6G8enhX+mVbfLmgjD1mnLJXs7QAFWOEDZidM8/xYb+v55Lr
	 M01Np2238M9lL1SfYtHI53mVhm7rx02JKK7Pvufz+Oc0JwmyDAY4Cw3Lay/Cwaud4xHzo
	 GQPQaSPUC/8TmRSRESWtN1KmHScq0kgfEikUuJMLwRyfUqRl5/ybqs7frhGOcpqs9DD75
	 y+x/0qCBtu52iiJ0yjM4jtYE1RLmvXRdSG1kmie7wYZcXPap7l3e+LH9r5IyETHLnuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426029;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=xGCf+Bz5lFU1XFCRiHnhKx3lB4GnvS9tp4aw7yUggkE=;
	b=0Ix20sS+4Z6uxKF/jtbqYqKHU1fcK6mmk1TFmKNNgpiTbeeZiA+A8KwE7qxssrDK1pjf
	 d6FI1HuJzSFAIpT33Sn5/k3cJQM1UNCJmCpmd7/UE2zm5Gwl1QhlFulBi1wJwVE/3okTB
	 jzbxpez9RJxoNBiOMyllnCpA85y+tzu/WqJWkfI72m3qqPie5MgZ4xbgtsOYQ4JcgmaOt
	 hIxzbNcqdH2S/ipJp9Erjogw+/AWTv1Xv6U0k/TBihntFtpivEG3cgsssRCH5kw35LvGB
	 /WmwxcfTXem64QkifVCoUnCS8xjYjTyrgo3uxI3myKljbOX7VfdSCfcP6I2gZ3ahGmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYtaJBDm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E6460A263D;
	Wed, 11 Nov 2026 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYtaJBDm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924EA1F00A11;
	Wed, 11 Nov 2026 19:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426028;
	bh=xGCf+Bz5lFU1XFCRiHnhKx3lB4GnvS9tp4aw7yUggkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iYtaJBDmoEOy36rVT3sOYX2k89eAgCPaJocVb4IlGFA6zSLCvaeeki4jSX8thqUsa
	 YSDvWwDzjHaJDriCDflrUVVBXTXfYurAsZox/5wEhCmLjehbtfKeiTt3KuB64pSJ3+
	 CS1FdPgI9Z/oeKekXHYI1ZZW/pAI1eihQvD6CJdobdWJZ8teCWjvb6kNHYMFg65OhL
	 UUFifH4c0aTDd5qeiG36/rFh7i7IX8R0Ghn4J2ta0ejapIdr/Ft8rf6F4mIRKHMjoP
	 tkGflCBlnwV3qAkBkDmOB97pp9QDpcnyM4uaiWFAhqG0tpmvQCOKyW3McHUvJVvNPR
	 EFtUK3LSSjxkw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:12 -0600
Subject: [PATCH 02/12] dt-bindings: mfd: Add HiSilicon reboot mode syscon
 schema
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-2-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Add a dedicated schema for the HiSilicon reboot-mode syscon nodes and
their reboot-mode child device which are missing a specific compatible.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/hisilicon,hi6220-reboot-mode.yaml | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6220-reboot-mode.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6220-reboot-mode.yaml
new file mode 100644
index 000000000000..8114d87d5f95
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6220-reboot-mode.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/hisilicon,hi6220-reboot-mode.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon reboot mode system controller
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hi3660-reboot-mode
+          - hisilicon,hi6220-reboot-mode
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  reboot-mode:
+    $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: syscon-common.yaml#
+
+unevaluatedProperties: false

-- 
2.53.0


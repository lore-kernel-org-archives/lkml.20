Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830132;
	b=fkeBIiFuwGbzV73+J3yKmYkGngVpOR22CYFIGaTC15vYDU15RUv7ClhS/cwvpk+79Nky
	 Oh87Hnjaue1lOyHTVQS0tjNMQntfOAxqsuYVh2KHiqNlFmX8v+aBvGukywLTwYT5Tb4jw
	 FzZwNHrCNYnPJYN+nHxG/Qp4VlA7/fp7IqjxHpNMP7QpZU6X33ZZk8vukC2Y1Wklb4feU
	 NZ0LpYI67Riwq1+nEhj3qHmyLYENUiwQLLpdA5E86rNht4ISCerOQP5B20Zg22nVHWfht
	 soygWgbWSbGNCjiCe9SKtL2xLXA4CCzSfJEUhFyRR++HpK6cfsYKqKf8eJrP94031IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830132;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+u/LMR+68R3fgeGC3uXOoW103LA72nPToZD+CrKv7lY=;
	b=gEFrcDNklbNdGc9J+Wz3MMLlKmQTIi023fjxznxTxh4IdIkZxkA+rc7nSDieOlEPhiPm
	 Jv54SB4s8oJctBUZuyG1vfR1bp9M5OBI5d2lS/J9y8PoyZGVQfp1606HyIQHTZYKRMquz
	 yawP27WdIh9kwEgzdCGsP3+fz0OE22icAYXFGLh7N+k4j1rK6xLT7dMoJM302tIAhMuHD
	 Mf4L3R6ZGWikS+hnZWsrLErgJURy/kReL7X5p829SjqL19zpeWogCC41H+VhyqqBL0Qkw
	 bfd9La+TF+NhYgLXLCSZwSJpr7y0jex2Vv67V2OXryycKmcGmaoRIe7ysa12X8xGfPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZ0R2flg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D6A606A334;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZ0R2flg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830132;
	b=QAz9IgbW7DnTQDeLAqoA+K/e8GKp8voyqdBJwGyvFhJ10mrxwh7OHJYcxmhqv3En+yiI
	 BeHNCFbUTmAA7J1MqTFqg/XUCa3qpthr7mWh/zuvPEUQrL29nFkhyyzdzPlWpW7USihBu
	 8QaYAON16uTu6fnGYg9dtRxwMQKeppegyKGAxLxDGibT6iXe4AacMBwNb7+Nxyl+BAXSG
	 bTfQNFTzOnY2zxEfE4bh5ILwbuN5/xVMUpbIDSRhXj09YhnVcxQItiG3pb6bNpKlrxSl2
	 kBYcAWGw2o7z4n1JrAokLqruAaLe0D2/ZyGWZ9ae7Nn/xGUwJKCvA7OGPgrpvtuti7Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830132;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+u/LMR+68R3fgeGC3uXOoW103LA72nPToZD+CrKv7lY=;
	b=0WEAv9tiO/ogBUfQx18bR7F2cYsZlY0IcNHm1+Mw+Zbkh3MFfyQWxU05bAWmBXbVeWTk
	 yAbKrpKclMm2FqcS7wNbsoGxR/NZCRW96+3dOdz7ALeaDPdszFVoBcBBN/1mlkLzc3cKf
	 JH0IA0Pggp66lMxWUF+xrAF+uwUIOiH0Icu7ClX0UwKeIhB+ASaYm5b2FtQoTw15lBFgh
	 1xWT0K1MKW5X8ImJMPDy75mRLwwLaxNim+bBJGcPAgdQ6VssCQxasR5PIVoy+Ms3lXBol
	 6EYYzGS17vJoZdYBjRJPLfBST+PL+LfB33iSNlr4x7gdESAs7FT0g9MGz3hUFT11obw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 592D71F000C6;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830132;
	bh=+u/LMR+68R3fgeGC3uXOoW103LA72nPToZD+CrKv7lY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WZ0R2flgdT1OGLWNTBCBWXVwM436xCfFBdKKY6DapTRSqtpM4KE+xvwpnRoP/XS/B
	 5sRw+638FVdOlcuGM4PD0OcvamMX09/v1KnMF4RT+/IXeGVxu8EBnojn2q0coYj+Y7
	 6lAS1I3gCjJFH7zkp/0HcIp0ytevw1fkCEpcp2XmkpvvKcAnokkkqQi/6HlhS3L+VS
	 r1/UCoOEc2xAWrsS/dxqCRJf6GXEzswVB3m9dSqEE+GoOZmA6XUAEiGdzXpJv1AukM
	 uqyonhrxX+9Zx+vpza3ntibYT2bGbZmoErQxj2ZU9RH16q9A/moyVgqW8q7IkfC4TB
	 L1mpFfo1bTYgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DEF7C4A452;
	Mon, 16 Nov 2026 11:55:30 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:09 +0100
Subject: [PATCH v3 2/8] dt-bindings: riscv: Add MIPS Boston board
 compatible
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
Message-Id: <20261116-p8700-dts-v3-2-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
In-Reply-To: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=1692;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=5xVOseiOua96OFvJrDMkH+ySfMmO2vu4mBB4SPO9IZo=;
 b=CFEMhFviJqzLiCWV/idM/1CfSBhuzsjSnorw0V62mkGAPjmQbpm486MJVAKXrKB7Wv7rMNzA7
 Oov0uPhn1bdC8rr0d20Fzijr3aNlmdAlcC6SW4CawWXCWnGhQt73R9r
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS Boston board compatible with a P8700 bitfile.

Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/mips.yaml | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/mips.yaml b/Documentation/devicetree/bindings/riscv/mips.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bb251a7b1bcc762876fb94f0b636415774024183
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/mips.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/mips.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS SoC-based boards
+
+maintainers:
+  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
+  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+
+description:
+  MIPS SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: |
+          Boston FPGA development board with a MIPS P8700 bitfile
+
+          The Boston board carries a Xilinx XC7V2000T FPGA and fixed
+          peripherals: a Xilinx AXI PCIe root port, an Intel EG20T PCH,
+          a UART and an ASCII LCD.
+        items:
+          - const: mips,p8700-boston-rtl-5057225-202410011144
+          - const: mips,p8700-boston
+
+additionalProperties: true
+
+...

-- 
2.43.0



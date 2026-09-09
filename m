Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5148333730;
	Wed,  9 Sep 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972279; cv=none; b=HeP7QOIXFnehP8yCrWU6UFeom433XK3dyQorCJB5fqL3wWw16K64Up58AlsHw4oWDEeI+++bMGcITQ/feMRlBpkRdSpb5HQYJFpgje+WNxIkGt4ryRpedrtatxyNoH5Fkkf/1YMv4xkZ+D8486fSAFf+fG27zm0deM+m07dtQhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972279; c=relaxed/simple;
	bh=ueNIvlQRqzk+4pNqlfnVj8HOwDlYO7GeJlHMlsKyUpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9+y7CbbB325pNTZyfbNobW5r/zrq/+G3SzuBEsaijoFbQBfTMohjr2rsmzRM4dg80REI2XPeGlbWBiEOevux7Yp6Qthx1BX7A4uZJOnD/S/8mOLpbyQ8TuTQmg3K8mtc+DeP3sUtVxiDGMLq3Dns752f21rmMF/wUQs5nvOr9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=NjETiQxM; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="NjETiQxM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDB23101EA3;
	Wed, 09 Sep 2026 18:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788972271; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=QWmB/VSyokIGvVRWumP/+sjSxE2iWjDgbQnn5Lul6MM=;
	b=NjETiQxMoOZs2OeK+uW8gfDtpodsZUamP7h7bh0Lbz/LanOuhJBEv1IAXyG3zgygYANLAK
	6XQnxK+d/liTztzLcofhU061xKBAs+UsS5+rtEUDF+396nAR+M4I5MpH2Z7iDXqLAvmLtS
	TqhcVvXlkENaTNbnrBkUjCwEE42WYJrDRYACFt3fPUIWdJe14bj7KshScTh8Exw/gC4kdQ
	GhBXDwrgQ/MZJ/uuE8kk/xoiaw516UU4worK1pj9h/n20uHjiRGrKUnzCuu9Aes9vyHBqx
	aFg+H3pRDnNWBmTzbHWGH3HYpNnXNtdvS3gEuwn/ZqSWPdcHw3q5wRdtqHn/Sg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP VHIP6 EvalBoard
Date: Wed,  9 Sep 2026 18:43:23 +0200
Message-ID: <20260909164423.97288-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
The board is populated with four ethernet ports, QSPI NOR,
eMMC, UART and USB host interfaces.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2b35..49ef4e0c68501 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -44,6 +44,11 @@ properties:
           - const: xlnx,zynq-zed
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: ifm,zynqmp-vhip6-evalboard
+          - const: ifm,zynqmp-vhip6
+          - const: xlnx,zynqmp
+
       - items:
           - enum:
               - xlnx,zynqmp-zc1751
-- 
2.53.0


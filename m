Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB6039CCF2;
	Wed,  9 Sep 2026 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978412; cv=none; b=hCUm6h+B0U9bxNqM5fEt6WQqIuPVr7ThbW6lrsf3y4IRSB4VqoXCw3NNDR8285cqpBF3JN2TU+H7PMh+bL9+YIpXE0uB9ocjePcQ5KcqBkDnKGkQUQeQ2TGDqefvvLaCJYiCiPlWj7eODmuHjB8b4gimNlBkib4NTYoQfSvFsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978412; c=relaxed/simple;
	bh=K8rrqh3/6E8jrKBiRWiBPgDBJlRVk5CIwHrppPtaUZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dLvnOmq8M4NPvn+jiH4/1uto1sMVerGfbK57tsjG/yLDMdUsRyagpu0fPiZkr+u/rVo59iRjc5e5QGpw8nLIWcqHPcV405yiN+ePkQZP9dK1bwp0rhsb3wschQruskVqqeik8KALV5LZqONgfCgVWR650gKgLaqfaK80hoCl+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hjlKBDq6; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hjlKBDq6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37E28102998;
	Wed, 09 Sep 2026 20:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788978404; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6Va4MpYmnsWUKI1RsgHH0AX/wGRzl8dw6JPvOAFcqGc=;
	b=hjlKBDq6eW3la8lPRrCl+CS3pl3w5YviUNQDs1L3T53SqWMkUAvAYx3vjNFMGbiC53iFVU
	LeTCzWQydXrR1zeeAmALYaEsi9ZM6BNyfHEL6vXK3f9nIhS9LhqwOtpG7yMFX1V/CBQE2a
	uwo05S+16R//9hNPzNJ/Jnjnudr6RlO25G/U6zAmT7H9fYTbAsFIMxA2EFjTrtvZQLD3Pt
	TGYx40cVpQwbxmL1emJ1isxgKN4iQjucD2JpndJjOV9PlVMg+c0Uh7Og2u9rHGU1WPTWHG
	gTkQzEtcVGZM6a/AgiCBW4coXougUuc6otV+iBjXdByn4G9QDKpT0CWV14XLmA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP VHIP6 EvalBoard
Date: Wed,  9 Sep 2026 20:26:04 +0200
Message-ID: <20260909182641.165383-1-marex@nabladev.com>
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
V2: No change
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


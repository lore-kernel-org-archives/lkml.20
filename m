Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234673F54C5;
	Fri, 25 Sep 2026 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326328; cv=none; b=kJGQO74pPJO0nuIahyN1B2h9BEz8w8mQE+akbANiTF3lPBdrhM/nImzWHcWsFNbxCyiT87XsOu4GQ/vOj9pCHbm9U1ag251CEANRHzHzDFXHdOvJWw7g/6MV7BzFX1veoYlzqGTafgZjQR/UwXOzw4DNKk1lfKL20Lrm4jz8m4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326328; c=relaxed/simple;
	bh=mpOjposL1T3dyr5UH7B7ZFdWCYljyeFowhjta0L9BQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2vvZFpwyM1sulIIRy+JUKs9rlr4c9tz97W6oYI1FYZjx4TbjhJAiGR+EeGnA6jonutfjL+gVoewRXdRi2FZRHgXRzNAv3huoxmWvs3b6XanqAqvSW1N+SZaA8LYN71t9uTzXpNWqrGpAMp4t7f/OnNZVb7A6yc/aBY10fk3c7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=foy6aqow; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="foy6aqow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790326319;
	bh=mpOjposL1T3dyr5UH7B7ZFdWCYljyeFowhjta0L9BQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=foy6aqowyg0kIUYUoGWLRHioASstBH7w9pTGDmG8YCZamjc5Sdu7WbgAOGtlhVcGQ
	 EJaIMD+CE637KhgfQ5yT6iT+fQHsuyXJ5YoCxr25ioPwub52+AEeZQ3Jhvf+dcOSL3
	 XrNlc+1Dxh9Bs2Z4IHbiV5z2e8n2M3Od8md3bBQlpwvORzlrRADwR8GIkm1i5spzQZ
	 cb8T3pAa9JbGV1SYZNzb92mprT6YWNHjyNFpC5mblIvuRO89vUysl0ib6c6xeL1fIE
	 0F7E/Nfck8JTYBMfnWrzyj6GCdkp0rNPFyW5jjuYVQLDH/g75MUlk8TzZdUU6VN8C4
	 Qe1R7uQPWhHqg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DBEF17E0B0F;
	Fri, 25 Sep 2026 10:51:58 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Fri, 25 Sep 2026 10:51:51 +0200
Message-ID: <20260925085152.41852-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nxp,imx8mq-vpu has been tagged has deprecated since a while.
After driver clean up it is time to remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
changes in v4:
- add r-b tag

 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 19528262810a..69619d2c86fa 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -14,12 +14,10 @@ description:
 
 properties:
   compatible:
-    oneOf:
-      - const: nxp,imx8mq-vpu
-        deprecated: true
-      - const: nxp,imx8mq-vpu-g1
-      - const: nxp,imx8mq-vpu-g2
-      - const: nxp,imx8mm-vpu-g1
+    enum:
+      - nxp,imx8mq-vpu-g1
+      - nxp,imx8mq-vpu-g2
+      - nxp,imx8mm-vpu-g1
 
   reg:
     maxItems: 1
-- 
2.53.0


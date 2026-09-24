Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4E475335;
	Thu, 24 Sep 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248119; cv=none; b=N7k3Q6b6md2OYr6hDORJp0IFAtTL4REg6uuudZm8Asy6IeC5l6HzxZ7wMtYxwJy7rtC/O+zcemfJ6mDRDHD+8+DrDqEdgZBqMs82Csci2dWIWGNIywgRYl+tMmpRL/0+yuoH5d6q1B8YX/r6gxrmNU62ERb82UOJPWFuH3unCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248119; c=relaxed/simple;
	bh=f1NI3qMziuOlznqvIL1ulfZOaRPAxcYcTLJ2j9fbPcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hk4XA2aXNuKD7JjJLHFLvdZJu7r1cZxGWWPpFHUdbFziIlXK1eivF9ZLfBWxk5jEJxCjwv7W3V6B8ktiGwkEZwR9LVqdunzJSa++qNajUBkAsF8u9gm4LHvwoH9I3+qBTvyNxSyIfxx4gioEhJiTvdvhj44sQcgy18PPuCRTfpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OcS3be1Y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OcS3be1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790248112;
	bh=f1NI3qMziuOlznqvIL1ulfZOaRPAxcYcTLJ2j9fbPcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OcS3be1YIbiACfPsv66ogjTIWZxcX5iz0zBSGf60mdJxMRauXTVG706T5diEoSd/M
	 3nnnFTNMoPi0lkjpjplX98h1tiL+2WsbTzxx5Ukdyy5fKHEbm9iBaCASc82Px2JQVy
	 4fdnIpCFIARKLBDplE03n8y+BWnn9J+PQPPeyxToPsyRWV0mOoaEe9NR1NR9MaXUD/
	 qHAKQU2G+h56IjQ2BRLjOPkYCwI3OtG5w5+07pHUHyndZlKxCPOJRBNuHlKD7I+Fct
	 7AuztpxOdmrIGKQX13CEfW7fcnKEhCtFm8oYGTHpmI31wsGBi7fyKII1GGhQPYEFtr
	 qRRtiaBp59FFg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B88A17E0A68;
	Thu, 24 Sep 2026 13:08:32 +0200 (CEST)
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
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Thu, 24 Sep 2026 13:08:24 +0200
Message-ID: <20260924110825.166238-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924110825.166238-1-benjamin.gaignard@collabora.com>
References: <20260924110825.166238-1-benjamin.gaignard@collabora.com>
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
---
changes in v2:
- have a separate patch for documentation
- fix dt-bindings

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


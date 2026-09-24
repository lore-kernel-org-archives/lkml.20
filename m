Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170447ECEC;
	Thu, 24 Sep 2026 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255106; cv=none; b=J52Zjq8CiW+6deVCgsgml8/nmqcQKr4T/l27AdKi3hO5AJTXdxQFN5UlVpjHmSdVhg1DmlyS3fcWgahSBYSZiI/Tmsbohz5OypusKtrr+Uhq0bJMhJk8X98/4VMQNYpluRWaB2Viv9giWCjspvcU++Uyp/09edrUVrWBkMk2mM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255106; c=relaxed/simple;
	bh=3poIeVbRfxg5Z3ob25q9qs/14cK1PAKJLUIFhin/dtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6WECntFDf9VwdGhqseumskSy8v7OWWPr/nQJLTkE5Wqu3xOmB8KziKxT4Qqc5Vojma3h0KGJ7YzC0s22Kb/KPshnxByrUGKZog3O+5i5LEZF/3hl6NjitruK6YeSRrwKvG72PkJ6synjx/e0pUm6L/HOqEliGtgn8bvi8v6AS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KSPClPQw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KSPClPQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790255101;
	bh=3poIeVbRfxg5Z3ob25q9qs/14cK1PAKJLUIFhin/dtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KSPClPQwZvLmFbWOVo4wA1yZNGkeCmYzIZFyYh0Uk1ANqwNegBHk/R1edqWszFbGI
	 mUZUjvqEke3wyOKn4L8+jr/KK276lJVwj8LWcHlnxLfSfkvdhgZ3TAnumdwJvo8Gf9
	 KYg9F+ye9sp9XyDvCa4wYt+pb7tlcyg31AEvfrDQQJNZP4Dn4FsbHodtWRA9fpeoNm
	 uTP1Yp9bpU13OoXllyStZaJcDbShIF+B4UJOUooSLB8c/oIfngh+8d6mk98Y2iWY0H
	 MykyoiN2Yrgoyk0/MmWvPG2K/BjNWh22BSsyA8sVezBVemrkXY0oc4HvVUA7n5PK+E
	 7CwH+WIw4VREw==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA00C17E0A66;
	Thu, 24 Sep 2026 15:05:00 +0200 (CEST)
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
Subject: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Thu, 24 Sep 2026 15:04:52 +0200
Message-ID: <20260924130453.196299-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
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


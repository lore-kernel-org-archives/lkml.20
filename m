Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D8246D2DD;
	Mon, 28 Sep 2026 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582918; cv=none; b=YyTl/fdFWCvjPPHdYvfm/XANXpbsqLg8S542PISn15akeWHh/eJye+XVKXM3jPUD03pm8yq7EwCvZLfqxy7s7uIHrWj9DsizpLIydc6R/a5T+kQcht5nym+HXLjJMW0jU6ZbyrMdRRwo0CxTpx7ktqDOwOhzoq0DyfqJ2vkcJVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582918; c=relaxed/simple;
	bh=L3JAfB9rDunDZGmTzNF37GovFkFyKSeuFBXo+WBYgYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+aqDG8ITyY6bMSHyBPpV/ZRc+fkmtJb3uVwQg51LodS3nEYXK5d4T0c//2VN0FS/Gt+7uUTcmKjS82ptJw4WiAuorI+xpLDVa8Ph00qjB7vj2LsUvV6dqoTet0dB/SHhgJQvDtxBMvr1s5NRZ1rgeKImztDy//o8RRyRHLE/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eCLVTpal; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eCLVTpal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790582909;
	bh=L3JAfB9rDunDZGmTzNF37GovFkFyKSeuFBXo+WBYgYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCLVTpalmsZm6V97YVjwFW0qFcnkPFNAuLRheXOu/pjoqVROmUrgHF0c8GX9P2xaS
	 FElLrJBXMcPaN8/GyIvfZdK3xfqqmmW3OR+eMccjYn3vJJU62SRt6R5mxjYuPYz1Qi
	 t+FuBnMdikUVjZ+juU+TPRt9ZKYElVP/pYlNHrEXemC0JOdcFY6G1QymhwIHeydTvq
	 d1MXQaKgZB/mnCfngmOw8ZYcmMNvdPW0WWsSCk1xL3cstSyyguiAtQmQiiQrdYcPE8
	 31t38XrorwJCl4FyCWXven5G5zNj+vGbgM4v6k77blBSnO0INiYtt8/bDsS8A9bCwu
	 QwzuSIoQ8M3Bg==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B70F417E018B;
	Mon, 28 Sep 2026 10:08:28 +0200 (CEST)
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
	kernel@collabora.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/3] media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
Date: Mon, 28 Sep 2026 10:08:21 +0200
Message-ID: <20260928080822.19553-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nxp,imx8mq-vpu has been tagged has deprecated since a while and
driver emitted a warning when this bindings was used.
Vendor DT use the following node before they moved to mainline driver:
vpu: vpu@38300000 {
	compatible = "nxp,imx8mq-hantro";
	...
};
but that binding has never be documented.
After driver clean up it is time to remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable
---
changes in v5:
- add more details in commit message
- add Conor Dooley accked-by tag

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


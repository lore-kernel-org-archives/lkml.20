Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203B13AE1A8;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791411; cv=none; b=eAKqhaWhKw9J678w6Qfzd4B9HHneOVqtXnJRIXGAiRX1iXPZT+0g7WXnpsMSrFqsRDpmygW9AWU8MbIzUM+V6ygJzTTZm6Ubt+8VNHVkvYy4QAWGQr64H3A4j8PPj9XPiKNQWjawCA5pYvX1oviIVg/6FNYjP04TaaS62PFfz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791411; c=relaxed/simple;
	bh=ziuOeOxSNcqiPfzFdD4nGs0eE7gGvrp2Nr8Qsw9rbZY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lqlc6Irz7dbDEhvS2DUnu0k7YyoBCUKKgcNt9d+KmXq0jXBJYqJt9f5ZMhUHe0EgJBwkizykqDrm5UCKNNq/AYqYGt6O9iINulupAdb8nA94zq40eaLp96RlQ7nVQCrEVoV8cCcRR3MfSfWItBvctyFHiblosTBt53dgB4bzAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uu9+6u5b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uu9+6u5b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 987EEC2BCC7;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788791410;
	bh=ziuOeOxSNcqiPfzFdD4nGs0eE7gGvrp2Nr8Qsw9rbZY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uu9+6u5bTLM5mUpynWqzImFDDkhziT+M3C6eLIu/h9usjHrpbGLMrrG0NPmq4RfAD
	 /vZe0zsei109HZLtWu/7HC73vBzrmqonP9lKl1zTvpopNVQtbqLHX2tyVXdFphjUAj
	 lDMm2S1wkPyvAX9k09G7QzemRxczqX/3FRiUR8FGTNWNNKQbDrTCApftfaLUlWLC64
	 gkBziRjY/bw212fG3/OCClFM1ltKfTmyo6GFh7CH0DGXID/qtkVPl3pEzh+594fJqI
	 RLmUpw65P+borgp/g9FOvNiXoNLyGBl4aOvtIVZuzLZPxjQqTEWM3a1jsltXw8DYw1
	 WNAnpQ/yJzGEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BEEC79FA0;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3 CPU
 Module (LX2160A)
Date: Mon, 07 Sep 2026 16:27:36 +0200
Message-Id: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjJnmoC/x3MMQ6DMAxA0asgz1hyE9SWXgUxJMS0HgjIBoSEu
 DtRxzf8f4KxCht8qhOUdzGZc8GjrmD4hfxllFQMjtyTWnrhOCtui63KYcIcj91jWg1j5CFRQ/4
 dHJR4UR7l+I+7/rpuFKHuYmgAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788791274; l=1400;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=ziuOeOxSNcqiPfzFdD4nGs0eE7gGvrp2Nr8Qsw9rbZY=;
 b=FqDKCKguM57Z6Ctx3L4bATK3YBeUPX8/dyvlG+82bXhG1o+utV545PQQZUSwUwV4jqpBWixiN
 vn35b0/2Z8+A4b4CmS9yOlqLloRLGGLI39toULxKRizXqC5cvB8UxXJ
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

The Nodebox v3 is a Free Mobile CPU module built around the NXP LX2160A
(16x Cortex-A72, DPAA2).

The same fsl-lx2160a-nbxv3.dtsi shall be used verbatim by the
U-Boot port, sent in parallel to the U-Boot list, so the two trees
cannot drift.

XXX Dependency:

the DTS uses gpio hogs on the QorIQ GPIO controllers, which
needs the commit
  78c0baf85cd0 ("dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes")
already in gpio/for-next and that will likely arrive in v7.4-rc1.
Until it lands, dtbs_check reports the five hog nodes, the rest of the
tree validates clean against the current schemas.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Vincent Jardin (3):
      dt-bindings: vendor-prefixes: add Free Mobile
      dt-bindings: arm: fsl: add freemobile,nbxv3 board
      arm64: dts: freescale: add Nodebox v3 CPU Module

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  30 ++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 342 +++++++++++++++++++++
 5 files changed, 382 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



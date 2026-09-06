Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9AF3BFAE8;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703106; cv=none; b=DEfQccSGxvBnoOE/Ll0UmNLzCf895eBGYHHApgLjQHl6nDjtMQp1XXNmo4XTtmVgacjRGteLJ3Gq+VhjgdPIqpUmwzvrQ/mYM03JxAO2zZxWqi9DOqdNNz19x9Ae3zY7JmFwQZYS7SPUEDSsVm3xL2RR2xxk8Djg7ty14lOzUec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703106; c=relaxed/simple;
	bh=cYpMKA3aoI3t83XGIqY+x6nd87kg/8bFsvsaaI15egw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoDVRjpJ/YdDJXd4QZyI2O2fKJc9IQXp7KykkRHY7J8VQFCyGjN0QgQ0kQtgUL3C1GvOYqPklV+vfbGqcbiLqYwOG8tnWfAJhB4E7u5gCgBjEtto6TdFxEiqyItJo3xCJGXPtPjFudQN63L47bOnXbDm8pjc05NDLU8oRgCIFf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMmUdZs/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMmUdZs/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F78EC2BCFA;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788703106;
	bh=cYpMKA3aoI3t83XGIqY+x6nd87kg/8bFsvsaaI15egw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GMmUdZs/mrR9CrfdMLzztAPPxeWn0XaBrlMLxx1RY7Ryg+/OE+6FAnQO95hA25hBV
	 uMYjzBmV9yn8+wtzxIZ7gutTCXx2jo3d21nvCcDujJ7aMRv75mawq1Aw5e6Qo+du6B
	 EPPlZp5bc6N41wmiDDz36Om/xPEYAL7FT+HiOXzi4nIYUkbusW4NJLE2nuuMjposzk
	 I1svvQP8mKv4bztQh1Lwaaz0WabXNBA3RW9g2y1BNA4HoGmYcFQmOtALArEPxuFNhu
	 YRGOtak+S8Zl2lL1goR9wws/FRUrLsQTvUxMF+usFAPByYNHbAXdqXTg2hDoAHbv4q
	 Qw/9CmKQjvmfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E4FC79FA0;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 06 Sep 2026 15:58:22 +0200
Subject: [PATCH 2/2] arm64: dts: imx93-11x11-frdm: add missing vcc-supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-imx93_frdm_rtc-v1-2-3fadbda0bea1@hotmail.com>
References: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
In-Reply-To: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788703104; l=734;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=/6HDos0ffXRqjJ/U+G+dvR4yRCMOxOYwMu+cAp0G3Jg=;
 b=hSwACxKfBKhB7HmhyoI+UsL9K5XAQkT+JQjZ6DWZIBvlqaOaK4j9Ebp7Nkwc/+PRSdzwxl+aI
 gkmEuP1tIaeC9CtWjfCOPchEfVSmRs4jpFeT4rh1D/bRu5XyxuXKgW4
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Add the power supply to the pcal6408 gpio expander, it doesn't have the
dependency loop like the pcal6524.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 8034992a73c7..23d2b9930420 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -45,6 +45,7 @@ pcal6408: gpio@20 {
 		#gpio-cells = <2>;
 		gpio-controller;
 		reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&buck5>;
 	};
 };
 

-- 
2.55.0



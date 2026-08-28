Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFC246C4AD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925193; cv=none; b=DOfR1YX1nHhmZsQP0QBk2tI9XU+hSQZM5v0qy0/RZF9ypkglHzw2l6/blfvyECJlOvTzPMA9bLobiHxvE5x05fKpwJNhS64U7EDJBpDeki5bPrqjB91Z3YqFaiRvfIFerzBtbIjA9T87LYONAPPn0s85ncP/jtfXNiviQOz9nBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925193; c=relaxed/simple;
	bh=6SUv4EjBs+WWbQ1x1L2Y6dDRKZcRFL/Dgpuq0wiZp38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4qyujI8A4jSPDlBtZyWaADGP9ktUqPUd5+ARSn4eKWbROnFA7BL1E5MuaocCd9tCQmRa2lZVVQNRlKVgM2SlbGTrFpwN/A1mlFiNWA/ej38RtAm44DpYw5iCoTYqD3YEKUNQBzC6wcTVLDhRiUbGOrV12bWB3eeG1J+VzdyfBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=T+kVndoV; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="T+kVndoV"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=T+kVndoVMQvcJlSh5aszb8qsYh26yPT3Xng40DevpBiud/kjPoWou8NGvjMfDLbmi8nBgQHPg0Uw5P2QpVg2rrlgz8TkhxmLioK3tFPkGXAD0gJKdaDkiR8RRakJqJgKIaFcDuQdFMMRkfYJy1nFocEn4G2dI5JInINEOdO8RAyseVEFNna+kSE+g1Q/gM1TUc/gaCO4lw8G7i1xtulEwNVYITo6jmed0cbQxGMbpDN7qXz9QNKBKPt7h5p9Wgt8ORe42IiZVhAfUUPpoATfK5uOwY2Gg+627VwoaCrv9OIdpLASNdKsIS4YiVm/4jnJMuLThUHGuI9af4hr6tLwpA==; s=purelymail2; d=purelymail.com; v=1; bh=6SUv4EjBs+WWbQ1x1L2Y6dDRKZcRFL/Dgpuq0wiZp38=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1236780859;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 28 Aug 2026 13:52:53 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 28 Aug 2026 15:52:47 +0200
Subject: [PATCH 2/2] arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl
 header path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-mt6878-header-fix-v1-2-b70dc9b2479c@mentallysanemainliners.org>
References: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
In-Reply-To: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925168; l=918;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=6SUv4EjBs+WWbQ1x1L2Y6dDRKZcRFL/Dgpuq0wiZp38=;
 b=zpfKdYG1bipRyx1PxUC+i4rAPitnzbfjRcbPcjAFRJDO+72mQbAubk4h+4ODo8eUFgwzdkCSq
 3DpXWYJnsY0CNYSmIY6a8RWtyMUnq5F+qxW2apVRcHooJMsCiBotDwE
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

The header resides in the dt-bindings directory and not in the
dts/mediatek directory. Fix it as to avoid a build failure.

Fixes: c0f1fd9eeb317 ("arm64: dts: mediatek: Add MT6893 pinmux macro header file")
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
index 982bc95c471c..7cda5c73fb68 100644
--- a/arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
+++ b/arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
@@ -7,7 +7,7 @@
 #ifndef __MT6893_PINFUNC_H
 #define __MT6893_PINFUNC_H
 
-#include "mt65xx.h"
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
 #define PINMUX_GPIO0__FUNC_SPI6_CLK (MTK_PIN_NO(0) | 1)

-- 
2.55.0


Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D256157C9F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925191; cv=none; b=bPJRxB8NyyPauXmBnBfavB7alEX1H4z5sYKnuSALAu0nBovdQRD3QjiztxObStHj99xwd7QpM6oN86htudpVlQm3aciaX++9C/x9xHmCRgKwROcJfKlTMZ834xKszKJtGf/WcZXVZzPqTHobzbibr02xzIQBwNEG5tGGvU+xEHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925191; c=relaxed/simple;
	bh=rG2gddjK0mFNccoof/5IKOWP4NxA9PADvpZgCOLr15s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JnOyoAiq5cdvj+ger6gyvnqsNinUcj2yGcqOCjA6Week71nZr9rtOckMSiIty6AlEzQPxO+knHVS2dpE3s5BGY0VhqXPnlbYZqMoeXRg+cD+xU0VjOUhwguYpq1yuUKLPU6JlWQWl36/U4TiklTqBfxVGq831eBqKCZ2FIekyx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Bb4aJ5Qb; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Bb4aJ5Qb"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Bb4aJ5Qb4kOZxD736D9iGv6yVSPhK8VULmRQi2enelB9ktsUetMLX7REqTQwNXdvDUq3/PRvvQtspXCdaIVKT+ak9wAWruyKfEiC32rZQ8FY9mg/EsQdq+9S/kfi101Nuyb0Ho5AzigWLxc8s/2AjHUaQAUKSMvDf979PS+w/ScNwQPMlOm8CdjjQKTXqS+0Ji4t36vHMx5i9eL0MLXjIF+H5WUmVx1LDWvE9k/7jXag1jxbMoTKlC+9QntVfMrGpMHNLc4KbRcCKUgp027TpVyl0AFk0+njKQjNldS53nQjriPPNSs69I+8mu1BjnoQ6dviEL7Svvgf42ApVnePhA==; s=purelymail2; d=purelymail.com; v=1; bh=rG2gddjK0mFNccoof/5IKOWP4NxA9PADvpZgCOLr15s=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1236780859;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 28 Aug 2026 13:52:51 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 28 Aug 2026 15:52:46 +0200
Subject: [PATCH 1/2] arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl
 header path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-mt6878-header-fix-v1-1-b70dc9b2479c@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925168; l=921;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=rG2gddjK0mFNccoof/5IKOWP4NxA9PADvpZgCOLr15s=;
 b=KE6gBW5Hj5eipAueNeLJy8jYk3lPzYk8ps0ZikWrqjP4QTqgVHJN9wEf9tTYwFAdZJ20fl6Ho
 1Sl/4/HcOLFCaKPX/3FOJWwrXuLEmBZK11DUpdNdl28aEiRnkmrlauY
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

The header resides in the dt-bindings directory and not in the
dts/mediatek directory. Fix it as to avoid a build failure.

Fixes: 07a9bd3079e30 ("arm64: dts: mediatek: Add MT6878 pinmux macro header file")
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h b/arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
index 4e8e475a7454..5aeceb904b18 100644
--- a/arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
+++ b/arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
@@ -9,7 +9,7 @@
 #ifndef __MT6878_PINFUNC_H
 #define __MT6878_PINFUNC_H
 
-#include "mt65xx.h"
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
 #define PINMUX_GPIO0__FUNC_TP_GPIO0_AO (MTK_PIN_NO(0) | 1)

-- 
2.55.0


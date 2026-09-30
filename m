Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A62E7369
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760637; cv=none; b=RXCaEUZgiAUlOVCdZOyqDF4eGJBe3g2RSQezOEkm6A2pQpeYSQ6vDy1ntW9El4Cmq4wWeHj93asueF1xJ/5Ac56PfNr3FxEdz+n+ELQ9DndogWo8XHjdjAsErkT/3AOTztzXsvEf+HZtSkddswGc9rD3hSK6KQy2ZzklgipVrcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760637; c=relaxed/simple;
	bh=g1Q/SRrVTtz6AMBI1bvGBzBewZqe2gXa75U3T+sIgKM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E7p9IEDk3P0Cz4jz0pfWx53neXSC2j2WXFXmtGSpfiXKIWt+y9/issQs/UNs9pSGlL78TT/tC35muSXTOn4Z9bKxY6L4+uu0A2AjEm0aMobJYqWjzQsZSaBUPvSvlTgWY1O6yd29PeKXqT03wAfNnjuCnkflL+tbGPrTfpXBasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmhTyLWz; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmhTyLWz"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ab0d9260baso5491514a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760634; x=1791365434; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LPe34vRyIa6dML1EQo1KfXSPOK1WXOU9iwUTkrF5Ta0=;
        b=OmhTyLWzh5YiHhOxlDB6dSTIxw7l4othBi0ZPo7qZZCvbuL6fRK1oxqBGYzhUeTZP0
         XI/HL72c8AeqAW/I+INZbRZeTP/EOGZeWe/PAksoPgEu4XTj6PYkB9/ZOf51jJxKAnyR
         VTu6e/Rwe/KBT3UZHAAfADwC8bJgUWKgDtohflh+o0WcNFpDzuViupaya0QE73hiHZuR
         yP+cjCqZBJmYThfFQrqA6k1CXf+b+NFWLnDoFltBXc6PkLp48EKnDad6T80vukwIeC3t
         cF+Fw5xURxaEsAaiiRXuWZLIrP+uGUU7WSxIFVPrt7IElXu4OXrFS691M5zzTYs48Qe1
         vK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760634; x=1791365434;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LPe34vRyIa6dML1EQo1KfXSPOK1WXOU9iwUTkrF5Ta0=;
        b=miViicx8yiJXkkVOK1Gnlm0s8UJromGxwgziTT48f5JYWaMzsuKmLnZdiSqAoZsa1E
         WBc7m4OCSlSfydlLRKifthag9eniloADdJBHyj6x1iHGwom98nojFjhjgh5l48ZZzfSI
         I7fF6BpOfQ79tWdNlZEIRTM811YzidZJwCjKIDYXt65C+PA9m6BLNK/LihO3ddIXTQg4
         dRuMJjZZZ47QFP0zferOjwu/Kv4IhWsq3wqo6fOPydG23YJLA01FIQhNxSHYmIiv8H/v
         4uUXz+Kgms9YFkVLMVJwKEngc4O7zyXA5P333oNQk01c8ZyP/kp/Muk2kzuLm0270LPv
         3v1w==
X-Forwarded-Encrypted: i=1; AKwUvBxwGiAY30jXMZ3brjhkJ+bXsVjHngOUXIAHAOZnrXDPbKoqXOWA/rXdacQVq/O1wL6zFhXctJhFuktOOf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAz/OyTy8QpHGy9HXNJX1j5+9xS9zA05H/CAVGLnVyz08Ggl3a
	YOWBp7Dxms8Dl62ghVClyMQbibAuV9CZa5pwhTwC7+xNwTukif5HyI5ANq7s2w==
X-Gm-Gg: AYBFou1GMtHmcs5kRU2HkDsFumbEpdYDC4wkVa6RFL1nv6gxRuPvPT3t3aY1yqldpX+
	EbHKhKPhN0f/6exs7MYeiBXGx0/EMSkoUjAwP57iePG4yDSqiw2Q2wQXcgubT/t7T0SerVOthH6
	BJavu40Ysv21VKKC17H0tl0RASnjztnyySYmzOaledHmd1P0wZQ++O2/SY4O43oeHli7rrR41uy
	zTTg0wmZ0fWPfVKr4fKcvUirr5rO3qiUDbAgwqr6uiGygQfl/43zE9Trrayv62iadBXce57uEcW
	05YSmp4IhoyP3LsrBAZeD4jqeShtL0N+QfpMivMnT9JEBNyKQ242gb0UTQIbAjrIBtOA/tXhCw0
	GsKQEPq7Ig+2oVEnu5S1px6c9yaJ35+sFKEUG7cPBGSGXeJ3bqP7quTwzsBkgxYSkaeD21bQRx1
	WAafQz1sv6j5494d6at2fkvETQLTTgeqG8E4OtaH8s6uJI2PmRCZ4HuwhmDQ3Dx3wRfolAtXi3h
	oLBqZt0PHRo
X-Received: by 2002:a05:6402:52d3:b0:6ac:c851:a0d7 with SMTP id 4fb4d7f45d1cf-6ae1990e181mr453683a12.23.1790760634236;
        Wed, 30 Sep 2026 02:30:34 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:33 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 0/4] arm64: dts: rockchip: add Forlinx OK3568-C
Date: Wed, 30 Sep 2026 14:29:03 +0500
Message-Id: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDWvGoC/yXMXQtAMBTG8a+ic221l7bMV5EL5uBQaENq+e6Gy
 1/9nydCQE8YoMwieDwp0LokiDwDNzbLgIy6ZJBcGm4VZ+ustCmYY45bbaVuBUoDKd889nR9V1X
 9OxzthG5/93DfDyu5dl9sAAAA
X-Change-ID: 20260930-ok3568-c-c095925b1e26
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=1327;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=g1Q/SRrVTtz6AMBI1bvGBzBewZqe2gXa75U3T+sIgKM=;
 b=0nGmsba4SEGFbfPrANmHlsF/U0MMw4A4GIhmRhgAN5sBwJg/zkO2KE0q8f+UPO2nAyb/oCkNk
 R5Rjiq0j7B1CG3MTMVTYUy3TWgiQpmMnhm6Sngvey6AjwmXmZZFcwcJ
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

This series add support for Forlinx OK3568-C board based on FET3568-C SoM
(rk3568). Patches 1-3 add .dtsi for FET3568-C and .dts for OK3568-C.
Patch 4 adds .dtso for FIT-PCIE-SATA adapter that allows to connect
SATA drives to the board.

Note: tested on v1.1 board. On v1.2 RTL8211F phys use dedicated
crystal oscillator instead of 25 MHz reference clock from SoC. Patch
should be compatible with both revisions, as in [1] solution.

[1] https://lore.kernel.org/all/20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org/

---
Dmitry Yashin (4):
      dt-bindings: arm: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx OK3568-C
      arm64: dts: rockchip: add FIT-PCIE-SATA overlay

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 331 ++++++++++++
 .../rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso    |  16 +
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts   | 574 +++++++++++++++++++++
 5 files changed, 934 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-ok3568-c-c095925b1e26

Best regards,
--  
Dmitry Yashin <dmt.yashin@gmail.com>


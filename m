Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E094DBD95;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543626; cv=none; b=NwQisXZhXV49yOTF6xRAeevPA29EOAjvvrNzTNNhCz1Dp8ylQ9KkBkMTOw7FcZSF0/gaz2EOSleoGXayH0eLlVRjh3osQwxB2Be+yZYATP/Tf9BLDnTFJZz09gPLZ/VW7fGtZZFdnLfMQ3vcf6jL/FLQUSXgVPzPg4uhRLb8P24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543626; c=relaxed/simple;
	bh=+tZNSX5k1H+sKgRoo1wVaQVdEfZrw4ENU3AszdLQqmI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dW1R9UV5QBdO8Xq/C79ZKtyjJTjQfmxv2oQx61Xns2H9RTSUlQ+ywEHPrWfx1zdmnGdmYrztH86Twnb8q/CEPPsQoAU27yRrQPhmGvv7fB+GlQFKYBsvEZE2+4pevxVOFbe4Sk8yZM/IEIbvqzsFDlTI/TfLYPKWdHq6WJ/frE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwJZ+f9o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwJZ+f9o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78D81C2BCF4;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543625;
	bh=+tZNSX5k1H+sKgRoo1wVaQVdEfZrw4ENU3AszdLQqmI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SwJZ+f9omvsnBQqVSmEssUKkdPl7dItTYyIj0VFbzHx7r9NWtpEkaAMAVcWsFn+/+
	 +Azzwf93NoGRHmn0GdGYG2HoaG2edVew+1lmp9jdmzQz6C/SZH2vqPiHwf9+oi3sXH
	 uHBg93V8fNOASMTnmOPSSR7LKh7fnCT5ujnX3Rtg8+utCzanl1pPaiuVooPyEt/pOG
	 4f0991FJvlzqaXzUZZS7SNXpytC/9NpSZpm3qDQhfMWRlE3UUVch+Ucbb0WIMTtc5G
	 Ka6lQHXrkrtVhP/NOHNUTu+IFBW0rfb//5A3ykP5ZRk8ZEJZbcw7GKdv8cjZrfTnpf
	 TjgU5xiF0k7xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B40CA601D;
	Fri,  9 Oct 2026 11:00:25 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH 0/4] arm64: add Ambarella CV75 SoC support
Date: Fri, 09 Oct 2026 19:00:21 +0800
Message-Id: <20261009-cv75-soc-v1-0-808330e93ff1@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXJyGoC/yXMQQ5AMBCF4avIrDWpilZcRSyoKWPRSgeRiLsrl
 l/yv3cBYyRkaLILIh7EFHxCkWdg595PKGhMBiWVLqQ0wh6mEhysQK1qV1bGSa0h5WtER+d31Xa
 /eR8WtNu7h/t+AP0El3tsAAAA
X-Change-ID: 20261007-cv75-soc-e628f357f066
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543624; l=2687;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=+tZNSX5k1H+sKgRoo1wVaQVdEfZrw4ENU3AszdLQqmI=;
 b=9A1njMKYc47+mS3RQO11zurFUDOCK/SFzr14TS4vhG6bLT+9X6m1jepTq0ByB83cTsLT272Ex
 USgQZlGOvtMBv0vFKJc0cm7JWEmpH7Dx+2hfnOEfMKa0GI6NH1bzSQb
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

Split from the combined CV75 bring-up series. This series adds the
ambarella vendor prefix, the board binding, the secure scratchpad
syscon, ARCH_AMBARELLA, the CV75 EVK devicetree and MAINTAINERS.

The EVK devicetree includes dt-bindings/clock/ambarella,cv75-rct.h
from the clock series, so it does not build until that header is
applied. The devicetree also describes the CV75 pinctrl (already
applied in the pinctrl tree), GPIO, UART and RCT clock. Those
drivers are separate series.

The MAINTAINERS entry lists all Ambarella files including the RCT
clock files. If the clock series lands first, those files are
briefly unmaintained until this series follows.

The combined tree, including the other series, was booted on the
CV75 EVK before this split.

Link: https://patch.msgid.link/20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com

To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: soc@lists.linux.dev
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org

Assisted-by: LLM
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Long Zhao (4):
      dt-bindings: arm: add Ambarella CV75 platforms
      dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad
      arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
      MAINTAINERS: add ARM/AMBARELLA SoC support

 .../devicetree/bindings/arm/ambarella.yaml         |  24 +++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  14 ++
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/ambarella/Makefile             |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 ++++
 arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 10 files changed, 259 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261007-cv75-soc-e628f357f066

Best regards,
--  
Long Zhao <longzhao@ambarella.com>



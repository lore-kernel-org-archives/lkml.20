Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E588739B949
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420280; cv=none; b=nld5ig66/QlbajbrvAGU1Gox30yg3aEGdZDHiicG7GbONQVtIrm6MuSuIiDYwnOM1OeK+2WKhJEal7lesW0WZSYySX2zpqzU6zcRkPvVT3ElTng57oP0fcrZDIQMXE9Cy827KddYqDapAa9Bida1cHOI4KxxfNtyThLOZnci2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420280; c=relaxed/simple;
	bh=JIaK5XEXHaXieMz8MlNRMpAAdFvcxw8THqRKq35H4ds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MqR+dxD/RwSkYldetFAwpDLPwaOYYqd0DCD5l/czULEG6nzm9LlGtK7v+L95CLsSpBoDSCVPffXvGOfwcSMGSYmCPpOQoIYfPSA0tBtR8SCR7mLrzo56a+pSfZdEr/H6FBcmkcQIh371tfoArAhDhZWGlyJlHsi//yPRhFcpMgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhb7r6Gc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhb7r6Gc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478521F000FF;
	Mon, 14 Sep 2026 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420278;
	bh=ExVMSDkfwv2Dl4S0p0xC/wm9u68lXhF8XFTYVcl+j8I=;
	h=From:Subject:Date:To:Cc;
	b=bhb7r6Gc2XxfOzHmld3CEZ0kXmYvdRxE9JOQ5zIwIgueSJz9KKJfRfDOlsH5Jx6Fs
	 7MCpUupCts/hNNHcSOnRXCkCJez5kg9BNAjcTamrY18XZC09mZAa/JYjU0S1uT+h9q
	 hWTKvGAzo3pzN9P5TiEyo725GtKpdBknadRl3FUc1rq/qOsFJl0iehzvMxL+tVZQV7
	 c/qOay4/WB9vzHudlqZKL7AJ7uJxMi6gtDoWoeVk/8W+UkpG3if+nqdVS2riopUWSr
	 3AH5YQUWR9aWyiabVpAJfZZlOTOrPEotvJmDHMBLhtitcYLfRQB+3vC1cf8wsxeJhR
	 +76xOS/BkMMdg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 00/10] regulator: Add AB8500 and AB8505 buck regulator
 support
Date: Mon, 14 Sep 2026 23:11:13 +0200
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XN0QqCMBTG8VeRXbfYzpzOrnqP6MLlmY5EY1Mzx
 HdvSlAR5OX/4/A7E/HoLHpyiCbicLDetk2IeBeRS5U3JVJbhCbAIGEKGO1HyRgtOk990951Xtf
 UYdnXedc6qoUsACToQqYkEDeHxo4rfzqHrqwPZ4/128CX9QUL/h8eOGXUIKSZMUYiV8crugbrf
 etKssgDvLWMbWmwakppxhVk2vxo4kPj8YYmgpaaDHKRyAQUfmnzPD8BzIzNTWUBAAA=
X-Change-ID: 20260820-ux500-dts-snowball-regulator-b35d2252bd57
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

While working on the Ux500 power domains it became apparent that the
device trees were using the DB8500 power-domain regulator for supplies
which actually come from buck converters in the AB8500 PMIC.

First: fix a bunch of bugs. All of these patches have Fixes: tags.
I do not consider any of them urgent or regressions, they can just
be queued in front of the new functionality.

Move some regulators over to using linear ranges before adding new
stuff since linear ranges are nice.

Add regulator driver support for the six SMPS1, SMPS2, SMPS3, ARM,
APE and MOD buck converters on AB8500. On AB8505, the corresponding
rails are named VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM.

The driver follows the active hardware selector, including the
additional AB8505 selector banks, and uses the variant-specific VARM
voltage encoding. It provides enable and low-power mode control for the
three peripheral bucks while leaving the SoC-controlled rails
voltage-only.

Compare the OTP-initialized peripheral buck enable state with the DT
boot-on and always-on constraints before applying them. Report any
mismatch at info level and leave the DT constraints in control. Firmware
may have changed the OTP-initialized registers before Linux probes.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v4:
- Replace forced preservation of OTP-enabled bucks with an informational
  check against DT boot-on and always-on constraints. Report mismatches
  with dev_info() without overriding the DT configuration.
- Link to v3: https://lore.kernel.org/r/20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org

Changes in v3:
- Dropped patches applied to the MFD and Ux500 SoC tree.
- Resend just the regulator patches to make things easier for the
  regulator maintainer.
- Link to v2: https://lore.kernel.org/r/20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org

Changes in v2:
- Pick up Conor's ACK.
- Fix some terminology and clarify the DT bindings a bit.
- Link to v1: https://lore.kernel.org/r/20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org

---
Linus Walleij (10):
      regulator: ab8500: Fix AB8505 VANA voltage selectors
      regulator: ab8500: Add AB8505 VAUX3 3.05 V setting
      regulator: ab8500: Handle AB8505 VINTCORE selector 7
      regulator: ab8500: Treat cut 1.0 VAUX3 as fixed
      regulator: ab8500: Test dedicated enable bits only
      regulator: ab8500: Propagate mode enable read errors
      regulator: ab8500: Use linear ranges for LDO voltages
      regulator: ab8500: Add buck converter support
      regulator: ab8500: Report buck OTP and DT state mismatches
      regulator: ab8500: Use scoped guard for shared mode mutex

 drivers/regulator/ab8500.c | 720 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 661 insertions(+), 59 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260820-ux500-dts-snowball-regulator-b35d2252bd57

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


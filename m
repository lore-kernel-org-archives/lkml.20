Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F993AA19B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371964; cv=none; b=SytCxAl0ne7VI4bGJjA+6tEaY0Iystff/I15EO6Ljr+Q5LixE3jOQOkCqp3Vuz3913m7d7qVukP0HqdhG2BymK0VNgRTAqLwX4HHlyR8gbbS5bN2E53lokAM8fgDRqi59FdD4ttrmBWh9sOk5HhSuLBnYdqGsTAJ+zQxFb6q7B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371964; c=relaxed/simple;
	bh=FS0e06uq2+c8pV9O2zUhKyP8PwT0SAscYcdj1/oM0II=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aI61Jwf8URuWfQLzyZBMNBcIHnN5icuHXbO0ESd9KZFL6je1Wr2kdZg+U546CHPEdDl2po5c7jRlqsyjaxtp6Rw+5JSkKAtlZ+zTwqQDQ1HPDHo6mUIK2Jw+DNYMt8xkQaiRi7muo4Eoot/jd4EeDO2yPXH6Z1OrEArDpZMstD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifT3Qo6x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifT3Qo6x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE381F000FF;
	Mon, 14 Sep 2026 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371963;
	bh=qbvLVLDss0XaL7DLfDeLaqNu1SavKedMsKyL+dneO9k=;
	h=From:Subject:Date:To:Cc;
	b=ifT3Qo6xsO/FQX5VJl1vwRvrRn1Y9aazJ/HWKk3WEnvgVH0Enbh/AXhJh7VW22mN/
	 MLh/4EclfxJ8JQMUYgPvbYglz7XsvLYlxfqCkvKWSAR6WqrBlDYIdV76/TSbZY2g4d
	 Mn1gqujoJ8mMnKgjXtedye04f8K8/MGPBMWd8zXHObgM6fnEHemZ2z7i2RoVyiDKcF
	 24Aon6VV/B3itIyBZqOKCeDWr55j72qbtIKXaUYcoqrV5w7vhATfLXFYrF/16vnDr2
	 qY8XfmwdwbxHYDRXbZ6xInTBG6wmS5W3350iW1hgUj9rbkDuuI08LZpOM0Cobl6etC
	 G13LfptLoVXcg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 00/10] Add AB8500 and AB8505 buck regulator support
Date: Mon, 14 Sep 2026 09:45:59 +0200
Message-Id: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNQQ7CIBCF4as0rMXANFjqynsYF0WGlkiogRZrm
 t5d2pgYN7r8XybfzCRisBjJsZhJwGSj7X2OcleQa9f4FqnVuQkwODAJjI6TYIzqIdLo+4dqnKM
 B29E1Qx+oKoUGEKC0qEgm7gGNnTb+fMnd2ZjPntu3xNf1DZf8N5w4ZdQgVLUxRiCXpxsGj27fh
 5ascoKPVrN/GmyalIpxCbUyX9qyLC8BxPURFwEAAA==
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

Since peripheral buck enable state is programmed by OTP and can power
discrete components outside the device tree, preserve any rail which
the OTP leaves enabled when regulator constraints are completed.

To: Stephan Gerhold <stephan@gerhold.net>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>

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
      regulator: ab8500: Preserve OTP-enabled buck regulators
      regulator: ab8500: Use scoped guard for shared mode mutex

 drivers/regulator/ab8500.c | 748 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 687 insertions(+), 61 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260820-ux500-dts-snowball-regulator-b35d2252bd57

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


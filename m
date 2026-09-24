Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317E03BCD14;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242755; cv=none; b=ca4drZdT3D2C39pqOhd2DaYvI4Fi65jtmIj3NHYUnyKiq15mOJbEHDViYnfouG76D6PyXLZAUw8kPCX/m7e24uJYvZtIbgLDM8Te9a8QePM8IsxC1zWKe3N2dz2rHtuX8X/l2yn1sO+C6lgEnzdz+RFnyVdPYDUHKGOBU/yiKVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242755; c=relaxed/simple;
	bh=BItCEenS77Babwk7FdI0aiZat5GdjxabdmfKPHmohbg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nh037uPgI2DlqY6gA7rWN0ct5ibqlwIJqpN6nHITY9eaSKHzR1Yl/VdPG6Ub7I5cJ+vO2gBc61B2Xc+5PU9Vjgcc+e50c0mleXEqIjzE2oibTc0LIJ+n24mEAXgAN5EmxvMV77njoijdJfNtp97v4TRc7tSX0wIr6ay7B9MRVd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUUy54yi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUUy54yi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE73CC2BCB3;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790242754;
	bh=BItCEenS77Babwk7FdI0aiZat5GdjxabdmfKPHmohbg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gUUy54yiht6ovJrErNoshPUnWLJuCPHrChQp8tD0Jtuxm+TF94sST2UkjztHgHlT/
	 yatGpH+5gHuesiQhUbuFETr9bKiCJzuLOLON+3ljLp4WNMDZK5XPdl+qS5wSw1xqQY
	 FSHlkulEORw8+zs/qBLNgE1+kCS27jbTEcg3BJYuwZgvhK7ZemedhbW4tu+OQSaiYh
	 EEQnj8Uh8zdnGIX/y3soLmO+FI6aCqiW/dW7sCz2rvhxPZ+DCkCJk9Iy9fDy5zXX5D
	 7Pnf8xLsXM7KEImT2OLkkYsBaU1uM9m882IEs7JDlqN1ss+O430lhe/uh6QtlI7LJs
	 po1A2mnxc483A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F931C98314;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v3 0/3] soc: mediatek: pwrap: mt6572 support + log level
 fixes
Date: Thu, 24 Sep 2026 12:38:29 +0300
Message-Id: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNTQ7CIBgFr9KwFgO09MeV9zAuKHxYjC0NVNQ0v
 btQY1LjcpI382bkwRnw6JDNyEEw3tghQr7LkOzEcAFsVGTECCtJRRkuecXw+HBixIVsKC9zqRX
 LURRGB9o819jp/GF/b68gp1RIi874ybrX+hZo2n3DxTYcKCZY1cBF3khdgT6Ozk526IW57aXtU
 aoHtvX5j8+i34KgqiZU1rT985dleQN/f1yA+wAAAA==
X-Change-ID: 20260712-6572-pwrap-4c91563cfd23
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242752; l=1470;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=BItCEenS77Babwk7FdI0aiZat5GdjxabdmfKPHmohbg=;
 b=85oFbEvDe4vV3r2mPSajBfrNLyAj50bzIGY1b8+RbttbVD/f6eiu+iE1y0q+6FnzcFCPNS4m+
 oD9+GRbzwhyA3/LofjXlns7Jkb/khAkoVRPQpUAH8TZNenSkCn4j7Yc
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This patch series adds support for the mt6572 pwrap.

All known mt6572 devices use mt6323 PMIC, which is already supported
by the upstream drivers. mt6572 also shares SoC-specific init with
mt2701.

Patch 1 adds dt-bindings compatible.
Patch 2 fixes improper log levels in the driver, improving UX when
debugging.
Patch 3 adds mt6572 support.

Tested on various mt6572 devices without any failures.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v3:
- Pick up Krzysztof's tag
- No other changes, resend
- Link to v2: https://patch.msgid.link/20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com

Changes in v2:
- Fix typo in patch 2 commit message ('Errors paths' -> 'Error paths')
- Drop unused registers in pwrap driver and use existing mt2701 array
- Also clarify mt6320 register usage
- Link to v1: https://patch.msgid.link/20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: soc: mediatek: pwrap: add mt6572
      soc: mediatek: pwrap: use correct log level
      soc: mediatek: pwrap: add mt6572 support

 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 71 +++++++++++++---------
 2 files changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260712-6572-pwrap-4c91563cfd23

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



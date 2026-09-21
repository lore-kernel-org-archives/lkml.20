Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E524A2632;
	Mon, 21 Sep 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001371; cv=none; b=n7tG6W1GTJxOTbU7A5a/LSGEgT4s4znLm9wvaSkIaatEEZTkmwCHn/RZoM7Bd8PVRZSge3rauq3LfBId7L+gG65CeQ8BO+cVChQ+ydRIizj+GJmDVKc3D7VQUmwmJnBQkJ5qQQtWlVqcyeMR6iJwXwjNdIVL3shBeVpKR4jB2H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001371; c=relaxed/simple;
	bh=RvNYpNJD6NyJrCYRsRpzmKmx/fUslzMvGYBsiOGsetM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e6TZ/4G75bvrkzhGR2JCt+P4dsVLxJxs71KyVC9TyecSlkSZxkQPYqUZ9vLMI5Sgq90DbSiERK5HYip8i1NlNcjeSuXL2UXvgsERFAp1azwE1P1NlSrjSqqzsXXTqbSw6AbSSWOqTzfjdzb7XnvC+6cxHrydGHo1dsJP46eiB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1iPfMKC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1iPfMKC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4E7DC2BCB3;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790001370;
	bh=RvNYpNJD6NyJrCYRsRpzmKmx/fUslzMvGYBsiOGsetM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=j1iPfMKCWlWIGcXvepMXwgjmgCXm/s557eIVYdYxyk/qal/7I+oJjjd9oopqguIyp
	 DeDcpGRQNA5BL8b2uShBrs4XOd3e85wnSw75zFYN5aV1MPgWQW7ActKnAY6t26OmCF
	 foV2BRmZDdqRt8h0zWYnfFTmz/ogIpn63rH2aohld8+3avs48WKtCtVS0bfASBZsNV
	 pBocxXRRwL7qaqhBRaYmnjLCSh3+58dcZfDsFziBUBf2BVP7f/uUmVjYPtmW/eh3eg
	 5fQR4BMBbwmU9VPb2MzMPY68mTfyQZdaRPyZGyT7zjcZN2sWJYdWrDsUVOAzEd0K7u
	 ivRTlU7kMRuKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D76C982ED;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v4 0/3] nvmem: mtk-efuse: mt6572 support
Date: Mon, 21 Sep 2026 17:35:46 +0300
Message-Id: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auYrq3pf60r72FcQBm1RihpsdEQ7
 m7BGCG6/JJ53ulRhOAgot2qRwGSi843eYj1CtlL0ZwBuypvxAhTRFOCldQMN6mGGkNptlYXmnN
 JUQZtgJN7TLHD8b3jvbyC7cbCeHFxsfPhOX1LdLz7hOU8nCgm2FjKSzCmIlrv2+A739SFu22sr
 9FYT2zmmVh4lj3IbUVVwYxi9K/nX2+IWXievSVWCKqkEvzXD8PwArUp+b07AQAA
X-Change-ID: 20260710-6572-nvmem-eb98c7a73351
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790001369; l=2204;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=RvNYpNJD6NyJrCYRsRpzmKmx/fUslzMvGYBsiOGsetM=;
 b=DuQJTi1dwL/mEHrRKENqtYQHisOv1XvYQM0JbZPjNZUMMbW20rFYplNUypxDL1Y/C7pCqVlYn
 ZvYHMNQykITCd+jpjAz1IVo8EGMu5O6MAuc5LPXYC3pmFXVwj4e42ih
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
its efuse controller doesn't work properly with 8-bit reads, leading to
invalid data with current mtk-efuse driver implementation.

This behavior can be observed with devmem (0x10009174 and 0x10009178 are
thermal calibration cells):
~ # devmem 0x10009174 32
0x00CDD4CD
~ # devmem 0x10009178 32
0x0F76865D
~ # devmem 0x10009174 8
0xCD
~ # devmem 0x10009175 8
0x00
~ # devmem 0x10009176 8
0x00
~ # devmem 0x10009177 8
0x00
~ # devmem 0x10009178 8
0x5D
~ # devmem 0x10009179 8
0x00
~ # devmem 0x1000917a 8
0x00
~ # devmem 0x1000917b 8
0x00

Patch 1 adds dt-bindings compatible for the mt6572,
Patch 2 adds platform data option to use aligned 32-bit reads instead
of plain readb().
Patch 3 adds platform data for mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v4:
- Pick up Angelo's tags
- Rebase onto nvmem/for-next (2eda8d2a45ca ("Merge branches 'nvmem-fixes' and 'nvmem-for-v7.4' into nvnem-for-next"))
- Link to v3: https://patch.msgid.link/20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com

Changes in v3:
- Pick up Rob's r-b tag for dt-bindings
- Patch 2 and 3 unchanged, for some reason cover letter and patch 1 were
missing on the web mirror...
- Link to v2: https://patch.msgid.link/20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com

Changes in v2:
- dt-bindings: make mediatek,mt6572-efuse standalone compatible
- Driver: add 'mtk_reg_read_aligned' helper instead of modifying 'mtk_reg_read'
- Link to v1: https://patch.msgid.link/20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: nvmem: mediatek: efuse: add mt6572
      nvmem: mtk-efuse: add support for 32-bit aligned reads
      nvmem: mtk-efuse: add mt6572 support

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 ++-
 drivers/nvmem/mtk-efuse.c                          | 41 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 2 deletions(-)
---
base-commit: 2eda8d2a45caa955a5cb1d897bf6024d22041995
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F5531B17;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950983; cv=none; b=kyBCLBQMFjqSCR3N8L4C3il9YE3jdLtBMN2k01FM2b/0J4bfxYnqi7Qj8x89LArfE/uEEWSCy1WyJekWiSUxEbAHjM8L896YyCQ+xmnFBS1DV/obgCaFbmvS++yXhHTmPtR8c9JRn2adyPzqKLjpMciqD8djdk2TXFaEmW82JcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950983; c=relaxed/simple;
	bh=bAFFu2lBNOlTbT2Cs9DCFFwV99YLoyXfDsHSUYG7+/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YCPPIEwiE/XZ6NQCAAZv63uLtn6ADPsPOZpCHkkWdyQBnivocDWgIsvdWAnQc+j4SVi8/tL76x89JWGdSFPMokmQepe9UbaMjdN0hcxsF0JhMjvfdMvjUoAP1qj/sVbkOHD07ZKJ4KcCoFimmWd3XhMuZMs0lDj5ImTwLmeu/Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2zcqXxU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2zcqXxU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06E08C2BCF4;
	Wed,  9 Sep 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788950983;
	bh=bAFFu2lBNOlTbT2Cs9DCFFwV99YLoyXfDsHSUYG7+/8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=E2zcqXxUNKESsNFmwxsfiDggNrxfvkK40MY2efvvIQ2HDsDPX7jnv4Dg8CwPwcmJ/
	 ymftslRVmNk7+m81vie0mUcos2F74oMm4IM4aaSBzzNhU4XCLYoqUxprkQiPvuLVsx
	 vKBKk5aYPaI0AITMH1fKXK7wZFjy9AttD6BU3Zc0Lz/MilBNqlnyxzjU+NyHXwkOuO
	 +0NihDKuGQZfTG7KujWtc7BVGimihVpenjxH0Jdel0BqWK0C2patQH1dRpHLb09rDH
	 Ya+MaZIzUQ1VvvTDtTEj20Vv0eIxyY7N+bQbII4+WcLpyKHuwzw+QcDSdztig4WUyC
	 +gqvSMR0SZU5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D793AC79FB9;
	Wed,  9 Sep 2026 10:49:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v3 0/3] nvmem: mtk-efuse: mt6572 support
Date: Wed, 09 Sep 2026 13:48:49 +0300
Message-Id: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ7CIBQFr2JYi4GPQHHlPYyLln4txpYGKtE0v
 bulxqTG5SRv5o0kYnAYyWEzkoDJRee7GcR2Q2xTdlekrp6ZAAPFNGdUSQ20Sy22FCtTWF1qISQ
 ns9AHvLjnEjudPxwf1Q3tkAt50bg4+PBa3hLPu29YrsOJU0aN5aJCY2qm9bEPfvBdW7r7zvqW5
 HqClQ/7Hx9mH2VRc1WCUcD//Gma3t4UNWT7AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788950981; l=1949;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=bAFFu2lBNOlTbT2Cs9DCFFwV99YLoyXfDsHSUYG7+/8=;
 b=LT1uhMHdEWOLytvMICqV04VZncZUHk8ekM5vbA+pQw7giELrWWp3JLnNl4rrZRBgByoR/H81n
 50/V0jdMJwrBzDw3kckJJre9a6rgCMLmdK/KL2XvOAcQS/awwQ2lG+l
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
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



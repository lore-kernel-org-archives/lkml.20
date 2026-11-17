Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794915411;
	b=h+bk1zwJSKq6cAkMBb3MJ0btX72Y9kFRZSPwiGt+t2MemyyBQ3d+YYP8e8ImF4gsYTIg
	 y2zhwf6V2j8YuabTeqixy2nh9nroZ3OSydGawutTfy5QA1TZgm4ZKnS9JEkWtEHBJUcF+
	 5fHhveu+0AgCfDdFR7Fbm3PYBy6JNBkFV86stPqE/u0+17Xx4jkN47Ejsv1k6H8lu3Xfq
	 CyhJpGfN4HAILgLezbYWE+Osum8QY3REg4Im4MsqhvqZEfuvv28C5q1zpESCHYCZUbBqy
	 /c2zyBqw36rs/SNbCs083IGHlB60dgu/VcAWGLaABQA4hI687ivyd7aRSCF7ONx3hGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915411;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=5LooAn416IJA7QR/rrjrqu318oFhA+cIoEmRVlFFDOo=;
	b=IQ/hGqwqlPKk7/rtyVaWMatzfazjetCdTyc6k/wlTNzTcxzGJeJ87XDCqlclMzAVBBZ2
	 3opyeM8L29eiZN4FsoLquHs1bG6i5IzpmClZKRquyZSQjtiU/I35jUOqX59T38NxwUK8n
	 GRWOlUGx2dqBUx3X90cd0YbJNPJ4ZQ8y5+A9ciqgs6YFEE+vte4Sy1DAIz2lTtA8t4R8s
	 gPM7czY4TamPkYZAGjgb64MOjyWr5yKmC3mqkrZjwJTRhshWgWAg5tZKonyuzKpRSZlmE
	 2FuKHSj1G8TbvTRHKVgCX+kHHXA815wJccJ46GTJeAJVVnoPwoimrzF0BF4W+PmH8UA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FR70vJwR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87BF606A31C;
	Tue, 17 Nov 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FR70vJwR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794915411;
	b=BQnXXQJx3ulFjXwqiFqAHQqh1+VVudm7XgbIorpsFE1rL+7HEBSbcH/YCLp0wsrD+dOx
	 1BZ6zWg3BxJBY1+kKJHarbqxbLHEJXLyCaBUVgnb2D90vbvNdKUEXrD6VXmO2kL35eb/p
	 jaJR+AFP4/Y446pMroEP5C7uIXNO7qWEEQCkN7sUS2Fhfe/zliSCxdlX3+03q7ghXNXqn
	 St+YsHKT/folqA0rdyB8XVrV4oXO0dOr2GJj/XhyY6l6YZpjyQl5I6y0hCeo84lI4jE1V
	 hKJT9PeKoAB39wnRIfRe5h2E/d8itgfeuxI+W4QsE5tYR5iQNtLYjLEb86ysGPEBJ8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794915411;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=5LooAn416IJA7QR/rrjrqu318oFhA+cIoEmRVlFFDOo=;
	b=cU6kKYDUzdyzeOg4LCA+n+9WVMivKx1+umBGrU08haY8oJQIA+aShZqS+xws+fUj3zhW
	 /10XMxkRHubxtTuPylRmQi0AYmgov0MnXAKlloIQjoAnNFbcBZ7Ff08yW614MW5PvKNfs
	 iYABwgUzyWDLGsqd9C2YUxFqrLZqVeUajuJMjOdS8aWusZZ3LfUL+XB3LJ4uvEEvhm5D1
	 6/xPTArYgpx0c7ixHjmM2wejpFWVL1wqNoHQlgmcudRjwOHDV1zEBYDb06y6vWg1VdJZL
	 oeq8jmbTfzhdx37UBNIwk10BvT9rSBGaaT5EGMmVaqI8BYDkrgpKL+Ib7l2puKTvihw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFB821F000C4;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915411;
	bh=5LooAn416IJA7QR/rrjrqu318oFhA+cIoEmRVlFFDOo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FR70vJwR+lY68CXoGIMFF8HIGqHMcBJf2JWFehFKr1cu9qwKNhIY4cbWwNkmln5HR
	 +n2DrWPLCqR8EFMrHA9cxWCVui65vzYFq4dIbruAtc5uuwiBz1ZPzIBoc1+5mFOn5a
	 RnPnGN6XhkZ54RmnBJpJMtHc9W01Z2vMUVscKBdH6dF+A6AkgY3obBe6IZG4zHsEuA
	 LtA2bycv5tOO36OVvX8OhhxxP7HkjkCn5VBepnzSzGHFN3Fi0XGV5PPCeKAENIrvLT
	 64MKpGigOEy6bI/9azBxvzxZ6GPRCVGmWExUb5gWV3uGV9rNiacbMFncRjeBugX/NE
	 EMEmn4Ghs2M/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 125A84A815;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH RESEND v5 0/4] nvmem: mtk-efuse: mt6572 support
Date: Tue, 17 Nov 2026 13:33:20 +0200
Message-Id: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794915409; l=2620;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=gs2zmezi5rOisWin7H+Yosgepr3LoLbfT6+2fG/mv4o=;
 b=UI59ugyc0iIVk9IgR0p6PJceQewcLPmqabfEydxPX50gFCSQb8KWT2N982UA0t+o4BO67RJGC
 VfXR8y5BKD7BoM0kCQzkgwxtqKWLmzbnwLd+1/JY3F5S3jp1gOi7Vap
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
Patch 3 adds cpu speedbin fixup.
Patch 4 adds platform data for mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v5:
- Add new patch for CPU speedbin post-processing
- Set uses_post_processing to true in the mt6572 platform data
- Drop r-b tag on the patch 4 due to uses_post_processing changes
- Link to v4: https://patch.msgid.link/20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com

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
Roman Vivchar (4):
      dt-bindings: nvmem: mediatek: efuse: add mt6572
      nvmem: mtk-efuse: add support for 32-bit aligned reads
      nvmem: mtk-efuse: add CPU speedbin post-processing
      nvmem: mtk-efuse: add mt6572 support

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 +-
 drivers/nvmem/mtk-efuse.c                          | 60 +++++++++++++++++++++-
 2 files changed, 63 insertions(+), 2 deletions(-)
---
base-commit: 2eda8d2a45caa955a5cb1d897bf6024d22041995
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--
Roman Vivchar <rva333@protonmail.com>
-- 
rva3 <rva333@protonmail.com>



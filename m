Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C213E8660;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763286; cv=none; b=schoOR0LzSbSu8onO1GkOGvbIdggaz4P5psO6WKT6t70oLh+fcyZRln/rmaVJfOr7wOijVZD2j2tjX+YMFd+TFe/UGoQkVRlsTlEKfc0mv5JpZS6KC/OFQsaD3xfv3rAHQce0FS8F0oxElnVw3y+UW+Mu0cTRzfKEdGWbd59FwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763286; c=relaxed/simple;
	bh=YcXMWOwQsCLes1AVO1FME2ariUbRxFXlWwKj5WgwNiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRmUGq40gbW4cr4U7U4It2mVnDEDh5+fzA6cnWROLcgxU4tmvWgQ9YNG1ne2pWgBCfI6sxLNLcKgmNJ2Wvb/G5H/jyBG5c8zUWURUN2pa2jrmjaMi9xGeG7riRQ3XiPH4+V8dk2LcB+U71UAP0FS3iIji4DFdlGscDQMaUofyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJKwk+Ur; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJKwk+Ur"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64CE7C4AF19;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790763286;
	bh=YcXMWOwQsCLes1AVO1FME2ariUbRxFXlWwKj5WgwNiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YJKwk+UrlkCk1+lruLc44Vdn9YqqelIS0jnt5qLUfZ/xh3VKojAfAzffnohp9AyMV
	 Asuc6wH/Gp7XV+oNx9zSWjoEccRpL02DLwcuRB6DsKxDys/+4vGp5oS9r6j9/btAdQ
	 QsAoFinUO0FnKgCT0YqPzCk2Z7NjTu6pRt/8cCoQeNLo5d17R5kKHxjJoz/aE5f0cQ
	 rQnF+bQxXtMtQQtnypj+16b8tLrUySUIWOcoGbCLAPIlixt6dNu62y47vJSKLKZRiZ
	 i9308js/F/W1/Sse4AvhjOf5mreN6fj6ZkQFYBw9yy6NZttGSbA0D3OakTl68wquds
	 moLTBCqIpzmRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B42CA5FBE;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 30 Sep 2026 13:14:29 +0300
Subject: [PATCH v5 3/4] nvmem: mtk-efuse: add CPU speedbin post-processing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-6572-nvmem-v5-3-384d2a3a1770@protonmail.com>
References: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
In-Reply-To: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790763284; l=1737;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=obcdDbJPC+bJJB8ejmXjnP6/QmD/06/XozyzFUcNY2c=;
 b=5GShSUHPJqiXvrqHRiSZTcESxZC/UG33Tn9SrBVmHk6NKDWSNpSL7fN2RH+escj9ogsV9oqRy
 D6v3trKnWGYDiKD6tLp28Pl4bnfDCjc+XuZwZ15pENMehY6uHxmfM/l
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

MediaTek SoCs are often released under the same marketing name, but with
different suffix for the speedbin. For example, mt6572m has 1 GHz limit,
mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.

Since the speedbin is stored as a number in the efuse, add support for
converting it to the bitmask for opp-supported-hw usage in the DT.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/nvmem/mtk-efuse.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 980c29d01337..d2e5c69c580e 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -70,6 +70,18 @@ static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
 	return 0;
 }
 
+static int mtk_efuse_cpu_speedbin_pp(void *context, const char *id, int index,
+				     unsigned int offset, void *data, size_t bytes)
+{
+	u8 *val = data;
+
+	if (val[0] >= 8)
+		return -EINVAL;
+
+	val[0] = BIT(val[0]);
+	return 0;
+}
+
 static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
 					 struct nvmem_cell_info *cell)
 {
@@ -83,6 +95,13 @@ static void mtk_efuse_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	if (cell->nbits <= 3 &&
 	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
 		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
+
+	/*
+	 * On mobile SoCs, the CPU speedbin is a number. Convert it to
+	 * a bitmask for supported-hw usage.
+	 */
+	if (strncmp(cell->name, "cpu-speedbin", min(sz, strlen("cpu-speedbin"))) == 0)
+		cell->read_post_process = mtk_efuse_cpu_speedbin_pp;
 }
 
 static int mtk_efuse_probe(struct platform_device *pdev)

-- 
2.55.0



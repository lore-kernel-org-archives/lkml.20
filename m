Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922198;
	b=QvKJ2oMNzKYGVBlyFVysnPWtIPSG3A0vhLKqgnkJKMXq9rWeCScUlrLnwGC1PJQTERa/
	 1b4/Q415P4rxQA+nWo9AocAbSrLI+/W387BUiXLbMcGrar4nbPuDhvbVNzcZFQ5J3GDVl
	 5/8NlE/jP9ADrgGp3VGnuj5DW1EO8UvUOXVkxuRiE9ccmoF3kDqVxBBJKq6rs2PYB/JCd
	 gIvRHA8wqM/2cyJCBeG8z6sgJ/4m54dFDayNcjKc9eFMpSreGiSulcRBWzzR2P7mzzSEJ
	 aW6bY1rWpH2Zm+DOSfGpdqWuQ2ugm/q9VHJkn+AIFieArL4lLExLFUOyPQjEXYxEEzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922198;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JUKwPGMQYo18edBpP3+qVXT0aSpgE6kCrGKKM20Fta4=;
	b=zFB2dAfXG/q3R+hSbhmRlCMXJCzRSI9e3U50FXLsCGLS5Xyrrc4U7g7QRGd2rJ3rz06i
	 5EcjOlRJTFlAo2XGiTerSRd6NgUyupdN31mDZphaf4fuwdA/9bNWzhrjPB0wr4KPBXPtO
	 /do9K62IzeXmOi67LjJcTjBUvd+eh1ZXh04CfEopPTDWNuqoR/+23xejR98z3feIJDNLV
	 5LDpRHJgkDq0NsUup9j7HXVz6o1gv9He9XDgMMAt0nX2NqLbbLa1HlppQ9JxQsrAwh7an
	 D3/nNLyXSG/tI1ISUY/YJMtBJvCrO+YHva74Fdt3VmeZlbBf5pa4CM4PONENsvopOaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hM9J4d5y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD22A606A33A;
	Tue, 17 Nov 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hM9J4d5y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794922198;
	b=DWvVu8Vj2D/GHUGrMH6gVMo0e6A6zFjtu8xxDiTkQzGt46ZNEtyoNDFrXbaOldD9E4Pp
	 +y5aDRX/vPDJpwrT74uMzi8if8zXGHf5Y8+LsZ93RNfG1c4yEhMtbzTf2boUm5h092+zf
	 WangVtgAaf0uHF8aw20FkQljMwwSs9MuNjnY7VklQtkXpcEBPHZghW9Mp7xY1qHFgiZLr
	 kpW3xVGEirn+U758f+/yldHD5Nl+qQK0rW+dY0G/YaCCRKQ2zg3J6nBB3yjL5Jc+rkk/E
	 8quq23LVkJCce9YOSOAk+lFpUfGbhLWUVHhEZeUcPeNjVFr2IZ57osjbmBfnXnj/ppA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794922198;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JUKwPGMQYo18edBpP3+qVXT0aSpgE6kCrGKKM20Fta4=;
	b=Af5+QN/+eo4LNRok2jVlKdA7SCZpHpuM/xyxLcRPMFVb7Y2DoHuWaO6+tCgF42XL501Q
	 bK1lJbAsGvhRrcPkqjXOgLE7PGVHl7o4DqImIG7DbsT2gggQkYq96o74wNBanojrrET2l
	 eQiUSSldZ3KniV7MxSSL60+WdSdE/SjdrLFkbie9XgpbRj/bO+cYbohv344Z3hwkztf5M
	 dA7zZths3V1xf7K9s47xoRbZ4JfcSOqMOJTFXRpmY3uhJR6qXk26nBa+4rMDKdswHiyue
	 fJM08z4fqDMjjKGPEOz4IO+9Wpj7r/rCW4AAKl8D/2WPOC1ZXJpUMeTGFWxIsZG69vg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6E681F000C4;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922198;
	bh=JUKwPGMQYo18edBpP3+qVXT0aSpgE6kCrGKKM20Fta4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hM9J4d5y5QcJiLz09ACIHJdee2045D/1I88WIBnURQLy0VB7Czi+a2c1BV4M9X03u
	 UDKRNiclVaO6h6ydnEMOAYyMsvk/5mIVmKN8L/J2t6/w+EDOS3nnHp22B5i/bZlX4X
	 pVVsxDTvvliZK+pikITPdR1boK4tkDb2HZrw4sK8ny2RgNjaMjEKNZbRD+PTvHdbG4
	 0tX80pyO0zf68Okdz69FeYEqVwObh5qXxnuQi3p/SVnjPNSh8c82mWCVVIcROSSYqj
	 6PS2FbqZ8upit2EAu4OFBrAwn5bb26V0FIKp/YxDGDhxZzzudP+kxkgGF6wHl1LZa7
	 weGjshbXU8igg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2343E4A99B;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Tue, 17 Nov 2026 13:28:08 +0000
Subject: [PATCH 1/2] dt-bindings: soc: mediatek: pwrap: Add MT8163
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
Message-Id: <20261117-mt8163-pwrap-support-v1-1-b00fa10035a5@protonmail.ch>
References: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
In-Reply-To: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794922196; l=910;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=GV/5pX+NzfGhR+iyJ7t6HyhLHCTD5LtZGFKHPoKfPAs=;
 b=vrAvGCB+XLv7UU8TZgokSN8oR/McBruaGO/aTnggVHhcFbKi3spHbdqO6nBuZq1ibA3RXMjb/
 r+51jspJwILAHWnlW+yW0UoOEGCyRKPrEmCM03E65L9iGyywp+0sx0z
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Reply-To: bengris32@protonmail.ch
Content-Transfer-Encoding: 7bit

From: Ben Grisdale <bengris32@protonmail.ch>

Add a compatible for the PMIC wrapper found on the MediaTek MT8163 SoC.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 79b755858bad..de739a8ab75c 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt6873-pwrap
               - mediatek,mt7622-pwrap
               - mediatek,mt8135-pwrap
+              - mediatek,mt8163-pwrap
               - mediatek,mt8173-pwrap
               - mediatek,mt8183-pwrap
               - mediatek,mt8186-pwrap

-- 
2.56.0



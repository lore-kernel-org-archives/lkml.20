Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794915412;
	b=zIeKpghgSFQaT+b9eoAxCZDpDW2yzwXmx7ko6mEAUFnLAtxTmoSAUJSmxN7KT9bYEeKr
	 otAxOT2NdqsJBebAGJQylIJPgTDEkgil0K29D7z8K2iTd2c4e++17naFFqEvU8VbYv+PJ
	 xr87ZFjkAxhmD7iuKiuCAgZk5olNFQS00PffllSYm06z80LWWRzHvjjvekwqZqMbrmodv
	 a/G7pLniLrSzYTwnsQKly98czSBLXfVwGgRFHAXTliAwRuscBCS0ZsSHDsxAEAHz/sQsk
	 l1WL7bwM/2UWYnRUxNTd0U6yE8NcL6fNdXxzc2/Zy5W8PPXClsyPKE9NOS1dRSv7VLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915412;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=;
	b=PMuz0c9Aon4xIBI7/ZyRPxmirgVitkIZt1zx+OuUKDGIvdy9Nqsz3UZv/oouen8JsgUa
	 Hymq7Zj7LPGeBy+sIbHSLK0FILBJ3fI1EM1ciLDnFn+ysLRalMtlyY39hNygqtrEIG2wL
	 RnC87Mx9MH6sc7rJKq+M5gtdG4jgTOMykgpNeKIVz992nmHpxHPGqAujVtcEV4KbGhlMF
	 LbUbIIbTlDe0bntH62Vjs/YWtrYbnfFsgYALXoRrrHWIfbONbTmkuro7qKu2mMdWqFMpQ
	 HuoA7r9O0w2tBM6n2RsXQLl0IhMJpAxQrgDNhMwU1E7sovyyAjKT8+rHJeOg8ms6sHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ST6Kh6Zt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1C0606A335;
	Tue, 17 Nov 2026 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ST6Kh6Zt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794915412;
	b=NKs3umHa/lJ+WgqVK4sP7btii38/J5OfKfPwkM2oaaE4GK76HKq5gKQTpSqL4xpEABY/
	 p1pfTqui66KjhmUYnQIEiZizQCxs5My18Rsa2a5yg13WkitFzoeqAmvmAgCOqH3HWIyJB
	 kH54IraUIsylWkyA2pS/EVH3rmfPOB1J36FeLPksZ2XXLFWf6StaqW9JP3bYcFhBsUPeC
	 ZwM80jb+TxQt3hkRP7AyrW/M53srOfY2ZKGDxMc2q8wQt5P41dHTulX3Zgd7SG67UXNEZ
	 HLA4OcP06OSVnqGyp4AWKl098XU5AWoAuNrkHm4gx6L54oc0h+4wd7ScHQB2tkL776Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794915412;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=;
	b=Zv2up8eKbvZaH5dp6ossOLDtvCpnxufZf/jMFCH+2BYpN9g78k1QTSC65+IqfziIhj5s
	 ObwWbKtfAYBPRjJAtF7yVxTn4B7awoJQ/YCb83oq0OjO9T9VmQ7/b76IzfUFi43sqyOsP
	 YHeEpnvR8M+xdMUECiJ4DT8i5IUefoo7yxoTKoQA8/AWRqapv3SMvL1wIwRx6NQHLZGpQ
	 2tMLghkHHIquowh2bR2PY87dHn/+o9dCizqLlRe1aLYH0JX1IxU6um1NKwzppI1EUqEvE
	 n9XacCZaS97Gi1r7soTAclqwD/FdC/K+DrfPvgIwYq4i6e3dNwV/3kzSpiSVPXpJP+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFBB31F000C5;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915412;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ST6Kh6Zt9SW6/cmOjlt/rkTykuj4gibUg0ZCvt5tVxRjVsDJoS2fCXTYTc2bLWqPw
	 PXN/ylt7xjbPCbGiJiBD5kr88+1hp9kQo6AVENf1xRmEgRRCFO7MdBUU6Sr8jmRmFr
	 Ny1GcsYzGH3NbL3R/hPMLySdcqKgT7neDODW4OVFvKjC6uSjRWuQ1rFBa9qBE1MyUw
	 9AoqPtVF/wNvu2v98thDKKN42Xl+km+LhspeI6sI5qOFvqtRCQoDjXu7Eyy5NR+efE
	 FVIuvJ/P0mIXpeJt53jwjwZvKWpNHfqNBmIYQSv8V0HPAR/Bj3GDLEg4VemKcTmx84
	 y2Kvj3YhEpFSA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2DFB74A80A;
	Tue, 17 Nov 2026 11:36:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 17 Nov 2026 13:33:21 +0200
Subject: [PATCH RESEND v5 1/4] dt-bindings: nvmem: mediatek: efuse: add
 mt6572
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
Message-Id: <20261117-6572-nvmem-v5-1-9b561a8a83e1@protonmail.com>
References: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
In-Reply-To: <20261117-6572-nvmem-v5-0-9b561a8a83e1@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794915409; l=1140;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=XWZ7anlopbltit1BOL7l7aOzWGMbH7JgBsZxHbvvyuo=;
 b=mJjW8BTSdeH62i2dZrNsVSsxMZPDZ1oZye4pHp2XC+f9MdSiTyT2NVVvZ+douWkB8xnZitIU1
 wwuI/IxuBYdCUBuMPcUDxutkHjDbeR3B56yYD52BbD4HdCL3Y7wbxkW
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC efuse controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f9323b3ecfc8..e10947164941 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,13 +24,16 @@ properties:
 
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt6572-efuse
+          - mediatek,mt8186-efuse
+
       - items:
           - enum:
               - mediatek,mt8188-efuse
               - mediatek,mt8189-efuse
               - mediatek,mt8196-efuse
           - const: mediatek,mt8186-efuse
-      - const: mediatek,mt8186-efuse
 
       - items:
           - enum:

-- 
2.56.1



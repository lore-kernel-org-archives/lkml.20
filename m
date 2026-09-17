Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DDF345CA1;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630387; cv=none; b=T9rYv8GPQsJLN7vgikUdV4Mnjaeo4d57i1dxmKH6M5c9Btf0z0NEQK+TgAIcrcb/6/dpRN4OUqRn5oYSzUUvX1MQy6EGQvg1Z/Z91cLUb/EsrcReAr8pANOTQ0CGfF2O6sCNLbwF+ELUdq1Ge9J8LiK6g6N61HzET/taqhDhrAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630387; c=relaxed/simple;
	bh=gxiqBAElq9Xre5OAg7uTOQmxUlQteJwsBnd3ZBdbFzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RgZgugh2YJmoyeNF0akeMWQpRvSOI3+2F8bQLvgSv2loFdqsNCXpHH7dv3sfadkjhc6yiyU2R2GHLovPkgF/iVDNcgjQjwAQ0sKwob9CXr5TN1EaC8YuYYxpAtgoBftfcEcxxrF94AePSKNvFQ/dKsPwLlH7UZrSLEajn+M+mzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hze9NxO6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hze9NxO6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BB7AC2BCB9;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789630386;
	bh=gxiqBAElq9Xre5OAg7uTOQmxUlQteJwsBnd3ZBdbFzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Hze9NxO6AqLpkNqahw3TdRpM+U4u9HEqCSCboe/Fwlc6aiq2TPj7YIIETtJCL2VmP
	 uKfK2Na8oD3CC2nvdcm+iJqkQ8lTpE+2bklBdKxvO2ZSgeXLkmOxmP5VdZqT/PgVWb
	 Toi+xmDzzfP70xiLkI6PJGOxQ7Vs0KiXQ8Mdn01cDc4gja8+JbNagFy3/3qIxHi32l
	 uojBm9rNiHlByjvFM9QBmORRh0pTHDyWOboby3gPnOWiqdLMFRcQjDfW6sSC3WMQpq
	 DHROUZ/lGcw7eEMBLwv0rGDDQl8tS4rBPK4RXy7BeClndb3WNdv3m8OQMv8tgIqRkh
	 5Ki1qQS6Cuczw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7749BC982C1;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 17 Sep 2026 10:32:06 +0300
Subject: [PATCH 1/3] dt-bindings: usb: mtu3: add mt6595
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-6595-mtu3-v1-1-a2ba7c230d68@protonmail.com>
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
In-Reply-To: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789630384; l=785;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=obVpW7WHQG6DMltdTdYTZQf36G3lb4xafRlhZgLa8RM=;
 b=eUwn67bk9XeiQJFx/p1Vss7TE4r0pmPT7jJNEVOa8SoYeZa6vqsStS/7HnYK9QY6+mcEIMjP4
 BRQeAGy4QZ7DZdhzXBUjV2CSoZ6XS0rrU+rbC9QfMTGyE51AfUZ0Xqq
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..4538df164a16 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2712-mtu3
+          - mediatek,mt6595-mtu3
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8186-mtu3

-- 
2.55.0



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D937CD4E;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=FIj4wpxJG+1AxTHOiyS0FYc12zc9lRAi1FccKAy97sjo0WuScX97gGMXppA7IELUMmJsabEdRVrj1UiFm1K9/ATfPcoBHc/hFQVfD8fEzCSQgPgwj0B5L/Ff0EhdUwC25jJo1wqHYkzSF1rdDQq2IQw63KbWBK5MDmceFlBaxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=YwJV5O8cmdvTIyiLmbixpQIu1ZGWraSA7qGPByfusX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcGvTQnumQBrOH/NyKXQeiXo/HNixEYk53MCWXKOKtBMc7wskpSZJHCG0jeX14SWf2GXpwIGrRmLdHi+gXJHZx50BkhHtRpz0yhLnBA3Kz7K5sSHsLIBdTxCJ89Phrz+r144DQat4ulVvBUcxJRKgC+ZEEULjFVjOrKN5TGzOfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYbgtb8i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYbgtb8i"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BF48C2BCF5;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=YwJV5O8cmdvTIyiLmbixpQIu1ZGWraSA7qGPByfusX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PYbgtb8iVqXg7KCBzbkc+g07jZr8WU2KxvFOfMYdGswChtHMlB6+7Hs9B5LLd1uoT
	 He0wZcJhYUjY/RZF7mF6xXyhqAf9FtKPDYmFq1ZVtWzZgNfvbqwDNdpjwu7Fl8SMlI
	 nz94ksqUsLw/lBKjhcukrAgwpQiHefS/T/jK8FUiKNBK85GD9WSjWBhcISvu6f8ew3
	 bVU25/CmeBZgkUMIMsi6y/i28eiDsVZ4V9X1Q0RYEI76XkXH+8JwjZrZ16Bsemc9hE
	 DR+gxZ8XV85kXMl2/LJ3rw8eL/6iR722qWJ3ChwRBnDsLfnIgUmXflOL/1f61JDNtD
	 RrtL1hgwlRfyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1567C982CC;
	Sun, 20 Sep 2026 10:25:06 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:03 +0800
Subject: [PATCH v2 01/12] dt-bindings: soc: amlogic: Reordering compatible
 of clk-measure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-1-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=1310;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=E0ttr7BdgbtQoJSGx2q0pEoA5GFoRJFe8UYzVUUxKY4=;
 b=P2i287sc1mgc4lPTdd06RMlJr9FfbF4fhs8o4EjiAUr3kwToKdHP4NN3mEdjraRBDKiYqe92J
 zbwSMbpBTT5Cw/jjHXY3BIz5oWYurNquUHm/74pS7Jnuroe6pZD4KbZ
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Sort the compatible properties defined by clk-measure in alphabetical
order.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index b1200e6940ac..ad37eca48103 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -16,15 +16,15 @@ maintainers:
 properties:
   compatible:
     enum:
-      - amlogic,meson-gx-clk-measure
-      - amlogic,meson8-clk-measure
-      - amlogic,meson8b-clk-measure
+      - amlogic,a1-clk-measure
+      - amlogic,c3-clk-measure
       - amlogic,meson-axg-clk-measure
       - amlogic,meson-g12a-clk-measure
+      - amlogic,meson-gx-clk-measure
       - amlogic,meson-sm1-clk-measure
-      - amlogic,c3-clk-measure
+      - amlogic,meson8-clk-measure
+      - amlogic,meson8b-clk-measure
       - amlogic,s4-clk-measure
-      - amlogic,a1-clk-measure
       - amlogic,t7-clk-measure
 
   reg:

-- 
2.42.0



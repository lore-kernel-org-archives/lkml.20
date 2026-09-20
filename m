Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62768386C39;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=Np9xKi3TEi38okM0gqIUDjmhICjNZxh7YLcBAQNHef9wC0yUbZI5gHAuVIRS5xK6iqBWph99USS0CSMYaaadI5jxje+3HR8JCxbUisrRsBqJKe9+uJHUuSKIUPzEfGuYZsbH6rMMZgRyAmCgjpXME5eVDer29Mh9qtDKAWT9/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=kEIyTYVWhIo4bZSTQ3AbETvRlpmXVWyXqEQrca8eNK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOpPS7BuhtwToGBAspl6hd4u5hBocdURFgefPqNM3smoztx/3oukpIOncCUZZYaPbe+U7zReS9IX+hoLgTIL0f/kicAizpQMaQJpCU9dD4vcGHj/y/gk2LM7qlJb6wB1qyvtGH7OodFMYiWRg67CX1ZDX45GwDb6LULXxCJOq+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmamSxpI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmamSxpI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CA1CC2BCFB;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=kEIyTYVWhIo4bZSTQ3AbETvRlpmXVWyXqEQrca8eNK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LmamSxpIi0ZOBeIlL+jFx6gBDIicnzEdkYF6+WmI+V4jInuF3/C48ntJAyJyeLLrT
	 r4Te4PcbuyPaAnDM5VgH3LG+505KmDD4KfzTsWibn3mPAlGHGqkZs2QcyZTD+/PRj9
	 QhPMoQ42Bkglsb+gsAGzITeI2riQPB6ITgR2v8VbfZ+GLRPuQ9sEBmhh0QiU8o+Qsm
	 8lCU3OxrH3W7eBAUhrTszuH820Rpk9D80cYd2Z40qF9GaOJj8Ywel2Cv4k/wQzzQZe
	 +v4xpKLeQA2VkQowWazsJgbUZek1GA7eQPLhetPwmpPhb8Vu4pA4V9s9bN9qeLcjuN
	 CCCxsbq0XKEBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10DFC982D0;
	Sun, 20 Sep 2026 10:25:06 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:04 +0800
Subject: [PATCH v2 02/12] dt-bindings: soc: amlogic: Add clk-measure
 compatible to support more SoCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-2-224382a429e8@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=1482;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=iFtxCfNyNxPARsbwj859QUiks8NB1PYnjftvkWk6O4w=;
 b=n+6DE+7fBlM1JfnSWqS5Se1LkQPL36RhfgtOAcoBHnGLrTW7Iubv5I5sLFdtZKHw4/BYAuJkL
 h5L30EO/EkFDy2zhjuXgKE0FEd1sPAnCwt8S/HXIhNrILGG0/EPhoZC
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add clk-measure compatible for amlogic A5, A4, S7, S7D, S6 and A9 SoCs.

Although the clk-measure IP itself has little hardware difference across
SoCs, the clock inputs connected to the clk-measure block vary between
SoCs. Therefore, it is difficult to fall back to the configuration used
by previous SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
index ad37eca48103..16893f427532 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     enum:
       - amlogic,a1-clk-measure
+      - amlogic,a4-clk-measure
+      - amlogic,a5-clk-measure
+      - amlogic,a9-clk-measure
       - amlogic,c3-clk-measure
       - amlogic,meson-axg-clk-measure
       - amlogic,meson-g12a-clk-measure
@@ -25,6 +28,9 @@ properties:
       - amlogic,meson8-clk-measure
       - amlogic,meson8b-clk-measure
       - amlogic,s4-clk-measure
+      - amlogic,s6-clk-measure
+      - amlogic,s7-clk-measure
+      - amlogic,s7d-clk-measure
       - amlogic,t7-clk-measure
 
   reg:

-- 
2.42.0



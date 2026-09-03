Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3651C84CB;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412973; cv=none; b=HNdkZJeMig49hMqTD/bf/0d2j7neJhCVz+akN7ILncuLYS0ahniOFaLGD0hVLYje6djGvHxhNvat7MZpQgIAFf29Q02w95IbypPyfkVcYf3TTQaBS89svZNv1/UFqyDXxBLfySwoY42ZfGO5cLg9W9+b1jiQA1tIlQrBkfWROV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412973; c=relaxed/simple;
	bh=DK6eCsjwuQHkUAYad97gdQ+0HLjq5RiXz29EsyvdagQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYrU+qG30JU+ErU7Qh7T4QthkGLjPozH8ertF8CZJ0WUKU/pqN4lL8MssycothJ+tFaiLG4L6hKT/LpWUjIzB4Ppat0y7o0NW4SmJaupaqjyFrvUhObpiatyQZ+rruJpFi0Vzja0W7HAWwFOfFdU1ZT6UG/eFZm3Tvbk9xqHA8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBWMbk+S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBWMbk+S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7079EC2BCF7;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788412973;
	bh=DK6eCsjwuQHkUAYad97gdQ+0HLjq5RiXz29EsyvdagQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NBWMbk+SfPkF5fIKKsyeasILC+5YO7+v0MlJ1QFa9PYJ8mN0f7P7iSjWCby+vlIgJ
	 A5+7/ZHZz1UCKZTF26YtQ4yRtU60H7tRbHIljr0LW/Khf3phGqW6QmCcVrlWXc1pkt
	 goPtvTO7oSIRZ4dqpLLhAHb8pzz0kSXunvJiOeeZ43WtcmDHy5hBga53MHmSO+w9T6
	 J1yv8jM2yQl5iBnMyNQdcvexMUzErzT1herrEADr38tP9Gchs+m01soTusRBOogO1U
	 xNRapl0hfKAiqe6wmTN+Z0+v37lzqPFg4wkXj9n4JAiLCb9GQJJ21YbChxs9Up2FB7
	 ec1dHMOC4ydSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DA5C61DD3;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 03 Sep 2026 05:22:44 +0000
Subject: [PATCH v3 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-a9-ir-v3-1-cd471c667c15@amlogic.com>
References: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
In-Reply-To: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412970; l=1145;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=rmPAoSNSZx5LMEoeF/b4E+Q1f6fRs3+ubaclp6Z1pc8=;
 b=UVChLc0NVkl3QVl/QCyOm37lsUQSiO6wBtFhfc+JAn4rEOrdSc3vAXDMIByeP9a0unHRPiU5I
 ooMhivOj3QvB/Vej7ConQAJmNzWh8J4wgwUvJ3LPt3js9GQqfs9tlxJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025E279907;
	Sat, 29 Aug 2026 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032142; cv=none; b=Hg1qyH0l2j41sFxEzfRV+6mazYW2jQjQ9OWK85CYjyR8/Z7yyA/++GQntUsDVu/qB7ALGy+NX8vTwZA8WrOSabinDHEMvTEXbJzy7c7VOrHS8Vw3Q1vatmYdELlLwy7sZxORmSNB3oXpMXWBqDYo72/7av2ye6rPArtjs1tgtBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032142; c=relaxed/simple;
	bh=Et29W0ugWdExs3+LJNmC3cJWsLTnTUSlg3as7PH9H+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jd8/SegjbkSex6A6J33vks75jyfY8ITMhgDr+mOXGnfIRDsmIzCoAJYyAdnPUtxqYwByurmIlj7oCx3O6BeMwtqp8P22ZP5hBfx/aALV5JbjXGXi3WDEo9kCmX53tBiXcvxly2+vQaHQAMvon+UP31XlmghadUnmKRXhl8fyyT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n50TT+Xo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n50TT+Xo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1844C2BCF5;
	Sat, 29 Aug 2026 19:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788032142;
	bh=Et29W0ugWdExs3+LJNmC3cJWsLTnTUSlg3as7PH9H+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n50TT+Xo1LXF64Wjjo4u7mYngpk5ygFHMcXEJhGY499Fag7M9/3ax6JjdiVJermVL
	 EoKKQHW5mNWNBKEnZr7HwweJ7qPdZ0t+53EzmgLUQav/zuk/mNLCrZjhL8Brkp2MeS
	 PXChbg4Yq52d15hyeLqIqAdoE711MLlohpWT4M/mJC/Bjme82nNSHipkK+/rqVb6uK
	 pc2k8UdxjDopxMhskisygwPQZWiptL2KqJQqVlg8ld92+D7tGu2hhjWyfv3LEa/9xc
	 u5BeaehbZrYTZjnwGqyJgkk+34YXT/AfZC+s76cc+vGN6t2gbWje2zpdHWMNWJE/Lr
	 D7yOPZTnd7x1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EC8C61DD6;
	Sat, 29 Aug 2026 19:35:41 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 29 Aug 2026 14:35:31 -0500
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Retroid Pocket
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-rp-qcs8550-v3-1-198d5b2fc475@gmail.com>
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
In-Reply-To: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788032140; l=915;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=pgxhUlLLIL0s7PQ+Oz8ayGXR7ERpF2skLnamCW8kj9g=;
 b=9XFKjP5LdFHt7Q1IGmg3MajHrFfH1eZMAJ/rg5CDV5UpzgCktvZLO9jCajZB1TR9HI3lQI3FJ
 0/fa1JDDBmrC+5oKGPHGmms1YO6Uh8AJJ3BuqKCplxhX8l2R711pefE
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add an entry for Retroid Pocket (https://www.goretroid.com/)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 8e6307897d051..2c2502feff612 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1421,6 +1421,8 @@ patternProperties:
     description: Renesas Electronics Corporation
   "^rervision,.*":
     description: Shenzhen Rervision Technology Co., Ltd.
+  "^retroidpocket,.*":
+    description: Retroid Pocket
   "^retronix,.*":
     description: Retronix Technology Inc.
   "^revotics,.*":

-- 
2.54.0



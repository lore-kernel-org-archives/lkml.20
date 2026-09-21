Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11A1244667;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950403; cv=none; b=VDiNnyHHwdmBDGYi+sesCZAamvemNh0i/pMPXCftuFKHV9zURygmnncf12viL/CrC0O7jgtccrlrmcJGidiNlTjV6cDk/WoBMX/NBatzrw85kbld7OP7nb7y6T9swkym6fG07rUS5CYjEWcksDJB7vu9dC8W/HghsQfPgFfVwtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950403; c=relaxed/simple;
	bh=AbdL3O6G/yNWEj72i8vXqvCJ2p6+AboINKG2AHfj4ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eU4TFa5u/JkvB6teAUsc8DzjHaKSMuuzlKlgtOQLUG0v+9WGT0UiBayFuEGaUPxF1PGcBbXu47l+0fkwOLMNEkHtzFRrhp66xGCiWYBf637Oqg5OPaNBE+tM+W6JG5DzMHpGdXqdLYyIZ+qFq+ir963i3M8OGDujgDH+9exDkJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIv5Zb17; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIv5Zb17"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 770A6C2BCF5;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789950402;
	bh=AbdL3O6G/yNWEj72i8vXqvCJ2p6+AboINKG2AHfj4ro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PIv5Zb17YJBrCk4t8niVa3gseMI3M/zlzBw5WIRdLEbjclIh4v1toO9YYCYI6bPd4
	 dyJR07tQkFoeTY0BCw46ZGn8Z1sNIxLERvsYkmuio9J6kgXOWVmbjPVP2PxmaDmaDJ
	 6wZq6XmGeZo0DhDqkCrGhxHaUrKvGKdTIqt5kYvlDDrTvFzWexAg0h/9MV31lAp6Jq
	 H3EjnvtSUwT0M4oojiqK2322PqccnHp267m3rBlwMXCnCOgj5NgXNtX5j1414/Fzjo
	 YWrURS2EqsEhEuAFTd6suf1TiLZRXqtijRX7dFW98MTHUG1M3D5vg/rlrr5EUhpilt
	 KWctWPe2wAxiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63646C982DA;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Mon, 21 Sep 2026 02:26:41 +0200
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Sophos
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-send-dt-v2-1-fb6b81002ad7@studio.unibo.it>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
In-Reply-To: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789950401; l=922;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=+G/P8vdSy/WAoSbx8vK45ADrYNnfP7i4AKHiwIu/gD8=;
 b=rGjJwB+7xpm/+G3PMkWkV50tW3ylod6WFvQFXLjtQUPIreX+BojjBPp4YK+hFDlB8yhYK/0H1
 jGrvtJp38dGDez/yYxisIlotNl06XiJD8zJ4Yqi1b54gZONhlZN+qtT
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Reply-To: nicolo.giuliani6@studio.unibo.it

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

Add the "sophos" vendor prefix for Sophos Ltd., a vendor of network
security appliances.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693..3dd9d9b8ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1595,6 +1595,8 @@ patternProperties:
     description: Sony Corporation
   "^sophgo,.*":
     description: Sophgo Technology Inc.
+  "^sophos,.*":
+    description: Sophos Ltd.
   "^sourceparts,.*":
     description: Source Parts Inc.
   "^spacemit,.*":

-- 
2.48.1



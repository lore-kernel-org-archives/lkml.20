Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4C030E0CC;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419696; cv=none; b=auEdsPfRYQDIZgByHQNkToyjfj35/Seqj4qadZNmNfSVBWuL40X9cEgzHHt2xpGQsRBEqdQVf/8fDH0mF3gOl28TBj0MW3XcUVMvle717ENe2thinL25vhlOYCDhbWWRhmkH2bmO8e4NjLLh5Q68XbXzsAdsmaZ8ZK/gSZXYtpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419696; c=relaxed/simple;
	bh=n5QACkd1zv3PhqXE3MIany6DDgK40aeV4SQY8yeovjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tli3k7HgI0Dp6x317ahCwKHmuQE5c/6IwjtuRfjApjcQ1f0m4tUEIO7xHV6aR6B//+yApKxuLbZ1XoTnigqrGsyk1i2QiVqdWxJGnfp12ImoNSaH0a7e2i4EiARxYHl4QLvnGSwl+JjvMv1bixPlLEhm6gNF8AAJI3cclcyByao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPjLsWMy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPjLsWMy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F67AC2BCFB;
	Mon, 14 Sep 2026 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789419696;
	bh=n5QACkd1zv3PhqXE3MIany6DDgK40aeV4SQY8yeovjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fPjLsWMyhs+Q2lIb8/u8B399dKax3CndF3hfkAhaqZvAuc/rhz67qCgnvsxe5u9b1
	 B0UiChn5QQBSJaITW4OvbXK7GxJlTNjNNBFYQH+L7NhusEfzeL4wWzOAcJSAxADGKe
	 eBN/Jllnr5xfHQOljPanjt0gmIiVNX4hAJ38eS5agKVHVB9tLoTCRC5CaYoJ6ndY7k
	 oQoInpGdMVaBGsB/xjYs/bhlNyvXP0PD2HKqsVN8DEi+kxMn7iS9DIYKCp2fRdD5EP
	 j0cyo7z9//q+alg4sh4wVpga1lvICqIt7kqjsRpE5SxeUXA4XQC4xDN0Dco+Y5xjT2
	 5L8zbUKggERkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC786C88E7B;
	Mon, 14 Sep 2026 21:01:35 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 14 Sep 2026 23:01:34 +0200
Subject: [PATCH v7 1/3] dt-bindings: vendor-prefixes: add Free Mobile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-for-upstream-nbxv3-dts-v7-1-373a142b08d5@free.fr>
References: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
In-Reply-To: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789419694; l=923;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=YJnL8SVSS5jtnm6LBYWZbK3h+dEb8nY2DV6ueCzz3OA=;
 b=KPvHnjXaWyA3V9IjJEfPXvAX2+giWbckoUOP7ejSIEhUwOvWv527dWlOufpBbFpxywfP1ce1T
 ba+UrtLfIwWAt5HzLSXMabxoMAtJcQ5vaiWBqk1CbH0XDhrmWpwK4Fo
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Free Mobile is a French mobile network operator. Add its vendor
prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e467da45cd7a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -626,6 +626,8 @@ patternProperties:
     description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
+  "^freemobile,.*":
+    description: Free Mobile
   "^frida,.*":
     description: Shenzhen Frida LCD Co., Ltd.
   "^friendlyarm,.*":

-- 
2.43.0



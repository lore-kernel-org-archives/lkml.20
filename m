Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201F937F8C1;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791411; cv=none; b=bAIeRryC3m/n+t0kvHOk8c4aI7HQ4TarQxrvrcZWlNxFOJh4gTJ23KamYQcASz6DGIBfdIyQQ/r+m4Aqah/3jGYaR7Lr292G8gt234mNd73DqsfbEfsbU2KTzISYmfa/+FUG7TC5KiZRT5SGZkH0o7GoGV22Dfup27RVLroQRKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791411; c=relaxed/simple;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H28MYGeBIJb2rYO8s1b7AlWh9Nimtz7s/zx1cGyedzjjU9MlIkKqGl/QbzkZNYefRuPeH6wpB7OI0itKtNomyEeXToaZMu0PSzr3REXYPLFOGw5e0gJ31ZIX5jQ+4OUZhnBMVa4MIWo2PFDrXbjGFfQKfNbXtohk9XFBle3vbp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSm7Me1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSm7Me1N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6399C2BCFC;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788791410;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WSm7Me1NtHhl48KfD9LH5BUCyTjofrzaYR58uzycHn/N3aEJzQQWD2RFohtUmt3Df
	 sropaOrZ1jmvAHF1ch9UIxxb7+LwhuWccbkUFVAuq6lMhhBKFEXLRS77QQ4PAYjhDa
	 4jYnrHFp+tLsZ8fAMSTPjyP+dfjjQi9/qBjhmrrGh9D8J57Y2A3dwLHMSs+E8s1LjH
	 6BxeLEII3nPCD3af7YN19BppQxjdqBHmF7lrRKcR94T+0Coh8/06JuaUJJ+KY4EeTI
	 KOeLUyZfRkdYfqG1aY0h7M3ObNPJBPjmVjxGV5JQQqCMngJ1w2z2g98wSc2qUG1LO8
	 UF/PBFimcYzhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86840C79FA1;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 07 Sep 2026 16:27:37 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Free Mobile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-upstream-nbxv3-dts-v1-1-f43fd0028b78@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788791274; l=855;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=GS6HXtqxwlBUlcOkCxh64ErhDBGMmoQtgCG1FanLSW4=;
 b=2trqk2rAQPoi9HCXqt7YKa0pEJoBuZuXkzppU3drU7yXkhE/UvqnsbWLFdLLam3g/XMdYNNmV
 wUVFCNCQyoiALIToU7bzM8JaEmgCo0+KgMurg5rxWRXR1TPh+JYSeyU
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Free Mobile is a French mobile network operator. Add its vendor
prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..e467da45cd7ac 100644
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


